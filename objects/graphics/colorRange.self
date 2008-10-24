 '$Revision: 30.9 $'
 '
Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: graphics\x7fModuleInfo: Module: colorRange InitialContents: FollowSlot\x7fVisibility: public'
        
         hsbRange = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'hsbRange' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals hsbRange.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'hsbRange' -> () From: ( | {
         'ModuleInfo: Module: colorRange InitialContents: FollowSlot\x7fVisibility: public'
        
         center = ((hsbColor copy hue: 180)  saturation: 128)  brightness: 128.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'hsbRange' -> () From: ( | {
         'ModuleInfo: Module: colorRange InitialContents: FollowSlot\x7fVisibility: public'
        
         max = ((hsbColor copy hue: 359)  saturation: 255)  brightness: 255.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'hsbRange' -> () From: ( | {
         'ModuleInfo: Module: colorRange InitialContents: FollowSlot\x7fVisibility: public'
        
         min = ((hsbColor copy hue: 0)  saturation: 0)  brightness: 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'hsbRange' -> () From: ( | {
         'ModuleInfo: Module: colorRange InitialContents: FollowSlot\x7fVisibility: public'
        
         range = ((hsbColor copy hue: 359)  saturation: 255)  brightness: 255.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: colorRange InitialContents: FollowSlot'
        
         colorRange = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'colorRange' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'colorRange' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules colorRange.

CopyDowns:
globals modules init. copy 
SlotsToOmit: directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'colorRange' -> () From: ( | {
         'ModuleInfo: Module: colorRange InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'graphics'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'colorRange' -> () From: ( | {
         'ModuleInfo: Module: colorRange InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'colorRange' -> () From: ( | {
         'ModuleInfo: Module: colorRange InitialContents: FollowSlot'
        
         myComment <- 'separated from color module so that the initializers will work'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'colorRange' -> () From: ( | {
         'ModuleInfo: Module: colorRange InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- '$Revision: 30.9 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'colorRange' -> () From: ( | {
         'ModuleInfo: Module: colorRange InitialContents: FollowSlot\x7fVisibility: private'
        
         subpartNames <- ''.
        } | ) 



 '-- Side effects'

 globals modules colorRange postFileIn
