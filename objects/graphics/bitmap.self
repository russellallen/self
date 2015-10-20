 'Sun-$Revision: 30.10 $'
 '
Copyright 1992-2012 AUTHORS.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: graphical interface\x7fCategory: graphics\x7fModuleInfo: Module: bitmap InitialContents: FollowSlot\x7fVisibility: public'
        
         bitmap = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'bitmap' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals bitmap.
\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: graphical interface\x7fCategory: graphics\x7fModuleInfo: Module: bitmap InitialContents: FollowSlot\x7fVisibility: public'
        
         nullImage = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'nullImage' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals nullImage.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'bitmap' -> () From: ( | {
         'ModuleInfo: Module: bitmap InitialContents: FollowSlot\x7fVisibility: private'
        
         image <- bootstrap stub -> 'globals' -> 'nullImage' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: graphical interface\x7fCategory: graphics\x7fModuleInfo: Module: bitmap InitialContents: FollowSlot\x7fVisibility: public'
        
         bitmap = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'bitmap' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits bitmap.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'bitmap' -> () From: ( | {
         'ModuleInfo: Module: bitmap InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'bitmap' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'bitmap' -> () From: ( | {
         'ModuleInfo: Module: bitmap InitialContents: FollowSlot\x7fVisibility: public'
        
         statePrintString = ( |
            | size printString).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: bitmap InitialContents: FollowSlot'
        
         bitmap = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'bitmap' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'comment' From:
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'bitmap' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules bitmap.

CopyDowns:
globals modules init. copy 
SlotsToOmit: comment directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'bitmap' -> () From: ( | {
         'ModuleInfo: Module: bitmap InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'graphics'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'bitmap' -> () From: ( | {
         'ModuleInfo: Module: bitmap InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'bitmap' -> () From: ( | {
         'ModuleInfo: Module: bitmap InitialContents: FollowSlot'
        
         myComment <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'bitmap' -> () From: ( | {
         'ModuleInfo: Module: bitmap InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- 'Sun-$Revision: 30.10 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'bitmap' -> () From: ( | {
         'ModuleInfo: Module: bitmap InitialContents: FollowSlot\x7fVisibility: private'
        
         subpartNames <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'nullImage' -> () From: ( | {
         'ModuleInfo: Module: bitmap InitialContents: FollowSlot'
        
         delete = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'nullImage' -> () From: ( | {
         'ModuleInfo: Module: bitmap InitialContents: FollowSlot'
        
         size = (0)@(0).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: graphical interface\x7fCategory: graphics\x7fModuleInfo: Module: bitmap InitialContents: FollowSlot\x7fVisibility: public'
        
         windowBitmap = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'windowBitmap' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals windowBitmap.
\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: graphical interface\x7fCategory: graphics\x7fModuleInfo: Module: bitmap InitialContents: FollowSlot\x7fVisibility: public'
        
         windowBitmap = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'windowBitmap' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits windowBitmap.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'windowBitmap' -> () From: ( | {
         'ModuleInfo: Module: bitmap InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'windowBitmap' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'windowBitmap' -> () From: ( | {
         'ModuleInfo: Module: bitmap InitialContents: FollowSlot\x7fVisibility: public'
        
         window.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'x11Globals' -> () From: ( | {
         'Category: graphics (ui1)\x7fModuleInfo: Module: bitmap InitialContents: FollowSlot\x7fVisibility: public'
        
         platformPixmap = ( |
            | 
            xlib pixmap).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'bitmap' -> () From: ( | {
         'Category: querying\x7fModuleInfo: Module: bitmap InitialContents: FollowSlot\x7fVisibility: public'
        
         center = ( |
            | size maxPoint /~ 2).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'bitmap' -> () From: ( | {
         'Category: copyingAreas\x7fModuleInfo: Module: bitmap InitialContents: FollowSlot\x7fVisibility: public'
        
         clear: rect = ( |
            | 
            image gc function: image gc gxClear.
            image fillRectangle: size rect GC: image gc.
            image gc function: image gc gxCopy.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'bitmap' -> () From: ( | {
         'Category: querying\x7fModuleInfo: Module: bitmap InitialContents: FollowSlot\x7fVisibility: public'
        
         contains: pt = ( |
            | size rect includes: pt).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'bitmap' -> () From: ( | {
         'Category: copyingAreas\x7fModuleInfo: Module: bitmap InitialContents: FollowSlot\x7fVisibility: public'
        
         copy: rect Mask: mask To: dest At: destPt = ( |
            | 
            image gc function: image gc gxAnd.
            mask copy: rect To: dest At: destPt.
            image gc function: image gc gxOr.
            copy: rect To: dest At: destPt.
            image gc function: image gc gxCopy.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'bitmap' -> () From: ( | {
         'Category: copyingAreas\x7fModuleInfo: Module: bitmap InitialContents: FollowSlot\x7fVisibility: public'
        
         copy: rect To: dest = ( |
            | copy: rect To: dest At: 0@0).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'bitmap' -> () From: ( | {
         'Category: copyingAreas\x7fModuleInfo: Module: bitmap InitialContents: FollowSlot\x7fVisibility: public'
        
         copy: rect To: dest At: destPt = ( |
            | 
            image copyArea: rect To: dest image At: destPt GC: image gc).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'bitmap' -> () From: ( | {
         'Category: copyingAreas\x7fModuleInfo: Module: bitmap InitialContents: FollowSlot\x7fVisibility: public'
        
         copy: rect ToLocation: pt = ( |
            | copy: rect To: self At: pt).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'bitmap' -> () From: ( | {
         'Category: creating\x7fModuleInfo: Module: bitmap InitialContents: FollowSlot\x7fVisibility: public'
        
         copyFor: win Size: size = ( |
            | 
            copyFor: win Size: size Depth: win bitmap depth).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'bitmap' -> () From: ( | {
         'Category: creating\x7fModuleInfo: Module: bitmap InitialContents: FollowSlot\x7fVisibility: public'
        
         copyFor: win Size: size Depth: depth = ( |
            | 
            copy initializeFor: win Size: size Depth: depth).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'bitmap' -> () From: ( | {
         'Category: copyingAreas\x7fModuleInfo: Module: bitmap InitialContents: FollowSlot\x7fVisibility: public'
        
         copyTo: dest = ( |
            | copy: size rect To: dest).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'bitmap' -> () From: ( | {
         'Category: copyingAreas\x7fModuleInfo: Module: bitmap InitialContents: FollowSlot\x7fVisibility: public'
        
         copyTo: dest At: pt = ( |
            | copy: size rect To: dest At: pt).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'bitmap' -> () From: ( | {
         'Category: querying\x7fModuleInfo: Module: bitmap InitialContents: FollowSlot\x7fVisibility: public'
        
         depth = ( |
            | image depth).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'bitmap' -> () From: ( | {
         'ModuleInfo: Module: bitmap InitialContents: FollowSlot\x7fVisibility: private'
        
         drawing* = bootstrap stub -> 'traits' -> 'drawing' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'bitmap' -> () From: ( | {
         'Category: querying\x7fModuleInfo: Module: bitmap InitialContents: FollowSlot\x7fVisibility: public'
        
         height = ( |
            | size y).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'bitmap' -> () From: ( | {
         'Category: creating\x7fModuleInfo: Module: bitmap InitialContents: FollowSlot\x7fVisibility: private'
        
         initializeFor: win Size: size Depth: depth = ( |
            | 
            initializeForPixmap: win bitmap image Size: size Depth: depth).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'bitmap' -> () From: ( | {
         'Category: creating\x7fModuleInfo: Module: bitmap InitialContents: FollowSlot\x7fVisibility: private'
        
         initializeForPixmap: pix Size: size Depth: depth = ( |
            | 
            image: ui1GraphicsGlobals
                   platformPixmap createForSameScreenAs: pix
                                                   Size: size
                                                  Depth: depth).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'bitmap' -> () From: ( | {
         'Category: querying\x7fModuleInfo: Module: bitmap InitialContents: FollowSlot\x7fVisibility: public'
        
         numberOfColors = ( |
            | 2 power: depth).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'bitmap' -> () From: ( | {
         'ModuleInfo: Module: bitmap InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'clonable' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'bitmap' -> () From: ( | {
         'Category: querying\x7fModuleInfo: Module: bitmap InitialContents: FollowSlot\x7fVisibility: public'
        
         pixelValueAt: pt = ( |
            | image pixelValueAt: pt).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'bitmap' -> () From: ( | {
         'Category: bitplanes\x7fModuleInfo: Module: bitmap InitialContents: FollowSlot\x7fVisibility: public'
        
         planeMask: mask = ( |
            | image gc plane_mask: mask).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'bitmap' -> () From: ( | {
         'Category: destroying\x7fModuleInfo: Module: bitmap InitialContents: FollowSlot\x7fVisibility: public'
        
         release = ( |
            | image delete. image: nullImage).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'bitmap' -> () From: ( | {
         'Category: creating\x7fComment: resizes the bitmap in place, but loses all pixel information\x7fModuleInfo: Module: bitmap InitialContents: FollowSlot\x7fVisibility: public'
        
         resize: size = ( |
             oldImage.
            | 
            oldImage: image.
            image: ui1GraphicsGlobals
                   platformPixmap createForSameScreenAs: oldImage
                                                   Size: size
                                                  Depth: oldImage depth.
            oldImage delete.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'bitmap' -> () From: ( | {
         'Category: clipping\x7fModuleInfo: Module: bitmap InitialContents: FollowSlot\x7fVisibility: public'
        
         setClipMask: pixmap = ( |
            | image gc setClipMask: pixmap).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'bitmap' -> () From: ( | {
         'Category: clipping\x7fModuleInfo: Module: bitmap InitialContents: FollowSlot\x7fVisibility: public'
        
         setClipOrigin: pt = ( |
            | image gc setClipOrigin: pt).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'bitmap' -> () From: ( | {
         'Category: clipping\x7fModuleInfo: Module: bitmap InitialContents: FollowSlot\x7fVisibility: public'
        
         setClipRectangle: rect = ( |
            | image gc setClipRectangle: rect).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'bitmap' -> () From: ( | {
         'Category: clipping\x7fModuleInfo: Module: bitmap InitialContents: FollowSlot\x7fVisibility: public'
        
         setNoClipMask = ( |
            | image gc setNoClipMask).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'bitmap' -> () From: ( | {
         'Category: querying\x7fModuleInfo: Module: bitmap InitialContents: FollowSlot\x7fVisibility: public'
        
         size = ( |
            | image size).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'bitmap' -> () From: ( | {
         'Category: bitplanes\x7fModuleInfo: Module: bitmap InitialContents: FollowSlot\x7fVisibility: public'
        
         useAllBitplanes = ( |
            | planeMask: numberOfColors predecessor).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'bitmap' -> () From: ( | {
         'Category: querying\x7fModuleInfo: Module: bitmap InitialContents: FollowSlot\x7fVisibility: public'
        
         width = ( |
            | size x).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'windowBitmap' -> () From: ( | {
         'ModuleInfo: Module: bitmap InitialContents: FollowSlot\x7fVisibility: public'
        
         copyFor: win = ( |
            | copy window: win).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'windowBitmap' -> () From: ( | {
         'ModuleInfo: Module: bitmap InitialContents: FollowSlot\x7fVisibility: public'
        
         image = ( |
            | 
            window platformWindow).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'windowBitmap' -> () From: ( | {
         'ModuleInfo: Module: bitmap InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'bitmap' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'windowBitmap' -> () From: ( | {
         'ModuleInfo: Module: bitmap InitialContents: FollowSlot\x7fVisibility: public'
        
         size = ( |
            | window size).
        } | ) 



 '-- Side effects'

 globals modules bitmap postFileIn
