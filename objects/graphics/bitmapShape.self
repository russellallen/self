 'Sun-$Revision: 30.7 $'
 '
Copyright 1992-2012 AUTHORS.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: graphical interface\x7fCategory: graphics\x7fModuleInfo: Module: bitmapShape InitialContents: FollowSlot\x7fVisibility: public'
        
         bitmapShape = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'bitmapShape' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals bitmapShape.
\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'bitmapShape' -> () From: ( | {
         'ModuleInfo: Module: bitmapShape InitialContents: FollowSlot'
        
         image <- bootstrap stub -> 'globals' -> 'nullImage' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'bitmapShape' -> () From: ( | {
         'ModuleInfo: Module: bitmapShape InitialContents: FollowSlot'
        
         mask <- bootstrap stub -> 'globals' -> 'bitmap' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: graphical interface\x7fCategory: graphics\x7fModuleInfo: Module: bitmapShape InitialContents: FollowSlot\x7fVisibility: public'
        
         bitmapShape = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'bitmapShape' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits bitmapShape.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'bitmapShape' -> () From: ( | {
         'ModuleInfo: Module: bitmapShape InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'bitmapShape' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: bitmapShape InitialContents: FollowSlot'
        
         bitmapShape = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'bitmapShape' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'comment' From:
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'bitmapShape' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules bitmapShape.

CopyDowns:
globals modules init. copy 
SlotsToOmit: comment directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'bitmapShape' -> () From: ( | {
         'ModuleInfo: Module: bitmapShape InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'graphics'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'bitmapShape' -> () From: ( | {
         'ModuleInfo: Module: bitmapShape InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'bitmapShape' -> () From: ( | {
         'ModuleInfo: Module: bitmapShape InitialContents: FollowSlot'
        
         myComment <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'bitmapShape' -> () From: ( | {
         'ModuleInfo: Module: bitmapShape InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- 'Sun-$Revision: 30.7 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'bitmapShape' -> () From: ( | {
         'ModuleInfo: Module: bitmapShape InitialContents: FollowSlot\x7fVisibility: private'
        
         subpartNames <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'bitmapShape' -> () From: ( | {
         'ModuleInfo: Module: bitmapShape InitialContents: FollowSlot\x7fVisibility: public'
        
         copyFor: win Size: size = ( |
            | 
            (resend.copyFor: win Size: size) mask: mask copyFor: win Size: size).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'bitmapShape' -> () From: ( | {
         'ModuleInfo: Module: bitmapShape InitialContents: FollowSlot\x7fVisibility: public'
        
         displayOn: bm At: pt = ( |
            | copy: size rect Mask: mask To: bm At: pt).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'bitmapShape' -> () From: ( | {
         'ModuleInfo: Module: bitmapShape InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'bitmap' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'bitmapShape' -> () From: ( | {
         'ModuleInfo: Module: bitmapShape InitialContents: FollowSlot\x7fVisibility: public'
        
         release = ( |
            | resend.release.  mask release).
        } | ) 



 '-- Side effects'

 globals modules bitmapShape postFileIn
