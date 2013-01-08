 '$Revision: 20.1 $'
 '
Copyright 1992-2012 AUTHORS.
See the LICENSE file for license information.
         '


 '-- Module body'

 bootstrap stub -> 'globals' -> 'modules' -> () _AddSlots: ( | {
         'ModuleInfo: Module: transform InitialContents: FollowSlot'
        
         transform = bootstrap stub -> 'globals' -> 'modules' -> 'transform' -> () _Define: (
             bootstrap remove: 'comment' From:
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) _AddSlots: bootstrap stub -> 'globals' -> 'modules' -> 'transform' -> () _AddSlots: ( |
             {} = 'Comment: the prototype module object, I am created by init.self.\x7fModuleInfo: Creator: globals modules transform.

CopyDowns:
globals modules init. copy 
SlotsToOmit: comment directory fileInTimeString postFileIn revision subpartNames.

'.
            | ) .
        } | ) 

 bootstrap stub -> 'globals' -> 'modules' -> 'transform' -> () _AddSlots: ( | {
         'ModuleInfo: Module: transform InitialContents: FollowSlot\x7fVisibility: public'
        
         comment <- ''.
        } | ) 

 bootstrap stub -> 'globals' -> 'modules' -> 'transform' -> () _AddSlots: ( | {
         'ModuleInfo: Module: transform InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'ui3D'.
        } | ) 

 bootstrap stub -> 'globals' -> 'modules' -> 'transform' -> () _AddSlots: ( | {
         'ModuleInfo: Module: transform InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap stub -> 'globals' -> 'modules' -> 'transform' -> () _AddSlots: ( | {
         'ModuleInfo: Module: transform InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- '$Revision: 20.1 $'.
        } | ) 

 bootstrap stub -> 'globals' -> 'modules' -> 'transform' -> () _AddSlots: ( | {
         'ModuleInfo: Module: transform InitialContents: FollowSlot\x7fVisibility: public'
        
         subpartNames <- ''.
        } | ) 

 bootstrap stub -> 'globals' -> 'windowing' -> 'xgl' -> () _AddSlots: ( | {
         'ModuleInfo: Module: transform InitialContents: FollowSlot'
        
         transform = bootstrap stub -> 'globals' -> 'windowing' -> 'xgl' -> 'transform' -> () _AddSlots: ( |
             {} = 'ModuleInfo: Creator: globals windowing xgl transform.
'.
            | ) .
        } | ) 

 bootstrap stub -> 'globals' -> 'windowing' -> 'xgl' -> 'transform' -> () _AddSlots: ( | {
         'ModuleInfo: Module: transform InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'globals' -> 'windowing' -> 'xgl' -> 'transform' -> 'parent' -> () _AddSlots: ( |
             {} = 'ModuleInfo: Creator: globals windowing xgl transform parent.
'.
            | ) .
        } | ) 

 bootstrap stub -> 'globals' -> 'windowing' -> 'xgl' -> 'transform' -> 'parent' -> () _AddSlots: ( | {
         'ModuleInfo: Module: transform InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'system' -> 'roots' -> 'clonable' -> ().
        } | ) 

 bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> () _AddSlots: ( | {
         'ModuleInfo: Module: transform InitialContents: FollowSlot'
        
         transform = bootstrap stub -> 'globals' -> 'windowing' -> 'xgl' -> 'transform' -> 'parent' -> ().
        } | ) 



 '-- Side effects'

 globals modules transform postFileIn
