 '$Revision: 20.1 $'
 '
Copyright 1992-2012 AUTHORS.
See the LICENSE file for license information.
         '


 '-- Module body'

 bootstrap stub -> 'globals' -> 'modules' -> () _AddSlots: ( | {
         'ModuleInfo: Module: point3d InitialContents: FollowSlot'
        
         point3d = bootstrap stub -> 'globals' -> 'modules' -> 'point3d' -> () _Define: (
             bootstrap remove: 'comment' From:
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) _AddSlots: bootstrap stub -> 'globals' -> 'modules' -> 'point3d' -> () _AddSlots: ( |
             {} = 'Comment: the prototype module object, I am created by init.self.\x7fModuleInfo: Creator: globals modules point3d.

CopyDowns:
globals modules init. copy 
SlotsToOmit: comment directory fileInTimeString postFileIn revision subpartNames.

'.
            | ) .
        } | ) 

 bootstrap stub -> 'globals' -> 'modules' -> 'point3d' -> () _AddSlots: ( | {
         'ModuleInfo: Module: point3d InitialContents: FollowSlot\x7fVisibility: public'
        
         comment <- ''.
        } | ) 

 bootstrap stub -> 'globals' -> 'modules' -> 'point3d' -> () _AddSlots: ( | {
         'ModuleInfo: Module: point3d InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'ui3D'.
        } | ) 

 bootstrap stub -> 'globals' -> 'modules' -> 'point3d' -> () _AddSlots: ( | {
         'ModuleInfo: Module: point3d InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap stub -> 'globals' -> 'modules' -> 'point3d' -> () _AddSlots: ( | {
         'ModuleInfo: Module: point3d InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- '$Revision: 20.1 $'.
        } | ) 

 bootstrap stub -> 'globals' -> 'modules' -> 'point3d' -> () _AddSlots: ( | {
         'ModuleInfo: Module: point3d InitialContents: FollowSlot\x7fVisibility: public'
        
         subpartNames <- ''.
        } | ) 

 bootstrap stub -> 'globals' -> 'windowing' -> 'xgl' -> () _AddSlots: ( | {
         'ModuleInfo: Module: point3d InitialContents: FollowSlot'
        
         point3d = bootstrap stub -> 'globals' -> 'windowing' -> 'xgl' -> 'point3d' -> () _AddSlots: ( |
             {} = 'ModuleInfo: Creator: globals windowing xgl point3d.
'.
            | ) .
        } | ) 

 bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> () _AddSlots: ( | {
         'ModuleInfo: Module: point3d InitialContents: FollowSlot'
        
         point3d = bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'point3d' -> () _AddSlots: ( |
             {} = 'ModuleInfo: Creator: traits windowing xgl point3d.
'.
            | ) .
        } | ) 

 bootstrap stub -> 'globals' -> 'windowing' -> 'xgl' -> 'point3d' -> () _AddSlots: ( | {
         'ModuleInfo: Module: point3d InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'point3d' -> ().
        } | ) 

 bootstrap stub -> 'globals' -> 'windowing' -> 'xgl' -> 'point3d' -> () _AddSlots: ( | {
         'ModuleInfo: Module: point3d InitialContents: FollowSlot'
        
         thisObjectPrints = bootstrap stub -> 'globals' -> 'system' -> 'true' -> ().
        } | ) 

 bootstrap stub -> 'globals' -> 'windowing' -> 'xgl' -> 'point3d' -> () _AddSlots: ( | {
         'ModuleInfo: Module: point3d InitialContents: InitializeToExpression: (0)\x7fVisibility: public'
        
         x <- 0.
        } | ) 

 bootstrap stub -> 'globals' -> 'windowing' -> 'xgl' -> 'point3d' -> () _AddSlots: ( | {
         'ModuleInfo: Module: point3d InitialContents: InitializeToExpression: (0)\x7fVisibility: public'
        
         y <- 0.
        } | ) 

 bootstrap stub -> 'globals' -> 'windowing' -> 'xgl' -> 'point3d' -> () _AddSlots: ( | {
         'ModuleInfo: Module: point3d InitialContents: InitializeToExpression: (0)\x7fVisibility: public'
        
         z <- 0.
        } | ) 

 bootstrap stub -> 'traits' -> 'graphics' -> 'point' -> () _AddSlots: ( | {
         'ModuleInfo: Module: point3d InitialContents: FollowSlot\x7fVisibility: public'
        
         @ z = ( | 
            | xgl point3d copyX: x Y: y Z: z).
        } | ) 

 bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'point3d' -> () _AddSlots: ( | {
         'Category: arithmetic\x7fModuleInfo: Module: point3d InitialContents: FollowSlot'
        
         + p = ( |
             {} = 'ModuleInfo: Creator: traits windowing xgl point3d +.
'.
            
            | 
            copyX: x + p x Y: y + p y Z: z + p z).
        } | ) 

 bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'point3d' -> () _AddSlots: ( | {
         'Category: arithmetic\x7fModuleInfo: Module: point3d InitialContents: FollowSlot'
        
         - p = ( |
             {} = 'ModuleInfo: Creator: traits windowing xgl point3d -.
'.
            
            | 
            copyX: x - p x Y: y - p y Z: z - p z).
        } | ) 

 bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'point3d' -> () _AddSlots: ( | {
         'Category: coercions\x7fModuleInfo: Module: point3d InitialContents: FollowSlot'
        
         asPointListProxy = ( |
             {} = 'ModuleInfo: Creator: traits windowing xgl point3d asPointListProxy.
'.
            
            | 
            (xgl ptF3d new) set_X: x Y: y Z: z).
        } | ) 

 bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'point3d' -> () _AddSlots: ( | {
         'Category: coercions\x7fModuleInfo: Module: point3d InitialContents: FollowSlot'
        
         asPointProxy = ( | 
            | 
            ((xgl pt new) pt_type: xgl ptType ptF3d)
                          pt_f3d:  (xgl ptF3d new) set_X: x Y: y Z: z).
        } | ) 

 bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'point3d' -> () _AddSlots: ( | {
         'Category: copying\x7fModuleInfo: Module: point3d InitialContents: FollowSlot'
        
         copyX: x Y: y Z: z = ( |
             {} = 'ModuleInfo: Creator: traits windowing xgl point3d copyX:Y:Z:.
'.
            
            | 
            ((copy x: x) y: y) z: z).
        } | ) 

 bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'point3d' -> () _AddSlots: ( | {
         'ModuleInfo: Module: point3d InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'system' -> 'roots' -> 'clonable' -> ().
        } | ) 

 bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'point3d' -> () _AddSlots: ( | {
         'Category: printing\x7fModuleInfo: Module: point3d InitialContents: FollowSlot'
        
         printString = ( |
             {} = 'ModuleInfo: Creator: traits windowing xgl point3d printString.
'.
            
            | 
            x printString, separator, y printString, separator, z printString).
        } | ) 

 bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'point3d' -> () _AddSlots: ( | {
         'Category: printing\x7fModuleInfo: Module: point3d InitialContents: FollowSlot'
        
         separator = '@'.
        } | ) 



 '-- Side effects'

 globals modules point3d postFileIn
