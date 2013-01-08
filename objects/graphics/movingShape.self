 'Sun-$Revision: 30.7 $'
 '
Copyright 1992-2012 AUTHORS.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: movingShape InitialContents: FollowSlot'
        
         movingShape = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'movingShape' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'comment' From:
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'movingShape' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules movingShape.

CopyDowns:
globals modules init. copy 
SlotsToOmit: comment directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'movingShape' -> () From: ( | {
         'ModuleInfo: Module: movingShape InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'graphics'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'movingShape' -> () From: ( | {
         'ModuleInfo: Module: movingShape InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'movingShape' -> () From: ( | {
         'ModuleInfo: Module: movingShape InitialContents: FollowSlot'
        
         myComment <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'movingShape' -> () From: ( | {
         'ModuleInfo: Module: movingShape InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- 'Sun-$Revision: 30.7 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'movingShape' -> () From: ( | {
         'ModuleInfo: Module: movingShape InitialContents: FollowSlot\x7fVisibility: private'
        
         subpartNames <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: graphics\x7fModuleInfo: Module: movingShape InitialContents: FollowSlot\x7fVisibility: public'
        
         movingShape = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'movingShape' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals movingShape.
\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'movingShape' -> () From: ( | {
         'ModuleInfo: Module: movingShape InitialContents: FollowSlot'
        
         background <- bootstrap stub -> 'globals' -> 'bitmap' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'movingShape' -> () From: ( | {
         'ModuleInfo: Module: movingShape InitialContents: FollowSlot\x7fVisibility: publicReadPrivateWrite'
        
         image <- bootstrap stub -> 'globals' -> 'nullImage' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'movingShape' -> () From: ( | {
         'ModuleInfo: Module: movingShape InitialContents: FollowSlot'
        
         location <- bootstrap stub -> 'globals' -> 'point' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'movingShape' -> () From: ( | {
         'ModuleInfo: Module: movingShape InitialContents: FollowSlot\x7fVisibility: private'
        
         mask <- bootstrap stub -> 'globals' -> 'bitmap' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: graphics\x7fModuleInfo: Module: movingShape InitialContents: FollowSlot\x7fVisibility: public'
        
         movingShape = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'movingShape' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits movingShape.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'movingShape' -> () From: ( | {
         'ModuleInfo: Module: movingShape InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'movingShape' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'movingShape' -> () From: ( | {
         'ModuleInfo: Module: movingShape InitialContents: FollowSlot\x7fVisibility: private'
        
         saveUnder <- bootstrap stub -> 'globals' -> 'bitmap' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'movingShape' -> () From: ( | {
         'ModuleInfo: Module: movingShape InitialContents: FollowSlot\x7fVisibility: public'
        
         contains: pt = ( |
            | (mask pixelValueAt: pt) = visiblePixelValue).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'movingShape' -> () From: ( | {
         'ModuleInfo: Module: movingShape InitialContents: FollowSlot\x7fVisibility: public'
        
         copyFor: win Size: size = ( |
            | 
            (resend.copyFor: win Size: size) mask: mask copyFor: win Size: size).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'movingShape' -> () From: ( | {
         'ModuleInfo: Module: movingShape InitialContents: FollowSlot\x7fVisibility: public'
        
         display = ( |
            | 
            background copy: location ##! size To: saveUnder.
            copy: size rect Mask: mask To: background At: location).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'movingShape' -> () From: ( | {
         'ModuleInfo: Module: movingShape InitialContents: FollowSlot\x7fVisibility: public'
        
         displayNoSaveUnder = ( |
            | 
            copy: size rect Mask: mask To: background At: location).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'movingShape' -> () From: ( | {
         'ModuleInfo: Module: movingShape InitialContents: FollowSlot\x7fVisibility: public'
        
         displayNoSaveUnder: rect = ( |
            | 
            copy: rect Mask: mask To: background At: rect topLeft + location).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'movingShape' -> () From: ( | {
         'ModuleInfo: Module: movingShape InitialContents: FollowSlot\x7fVisibility: public'
        
         displayOn: bm = ( |
            | 
            copy: size rect Mask: mask To: bm At: location).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'movingShape' -> () From: ( | {
         'ModuleInfo: Module: movingShape InitialContents: FollowSlot\x7fVisibility: public'
        
         eraseRect: rect At: oldLoc On: bm = ( |
            | 
            saveUnder copy: rect To: bm At: rect topLeft + oldLoc).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'movingShape' -> () From: ( | {
         'ModuleInfo: Module: movingShape InitialContents: FollowSlot\x7fVisibility: private'
        
         invisiblePixelValue = ( |
            | (1 << depth) - 1).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'movingShape' -> () From: ( | {
         'ModuleInfo: Module: movingShape InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'movingBitmap' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'movingShape' -> () From: ( | {
         'ModuleInfo: Module: movingShape InitialContents: FollowSlot\x7fVisibility: public'
        
         release = ( |
            | resend.release. mask release).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'movingShape' -> () From: ( | {
         'ModuleInfo: Module: movingShape InitialContents: FollowSlot\x7fVisibility: private'
        
         visiblePixelValue = 0.
        } | ) 



 '-- Side effects'

 globals modules movingShape postFileIn
