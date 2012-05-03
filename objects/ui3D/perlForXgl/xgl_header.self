 'Sun-$Revision: 20.1 $'
 '
Copyright 1992-2012 AUTHORS.
See the LICENSE file for license information.
         '


 '-- Module body'

 bootstrap stub -> 'globals' -> 'modules' -> () _AddSlots: ( | {
         'ModuleInfo: Module: xgl InitialContents: FollowSlot'
        
         xgl = bootstrap stub -> 'globals' -> 'modules' -> 'xgl' -> () _Define: (
             bootstrap remove: 'comment' From:
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) _AddSlots: bootstrap stub -> 'globals' -> 'modules' -> 'xgl' -> () _AddSlots: ( |
             {} = 'Comment: the prototype module object, I am created by init.self.\x7fModuleInfo: Creator: globals modules xgl.

CopyDowns:
globals modules init. copy 
SlotsToOmit: comment directory fileInTimeString postFileIn revision subpartNames.

'.
            | ) .
        } | ) 

 bootstrap stub -> 'globals' -> 'modules' -> 'xgl' -> () _AddSlots: ( | {
         'ModuleInfo: Module: xgl InitialContents: FollowSlot\x7fVisibility: public'
        
         comment <- 'xgl is cool!'.
        } | ) 

 bootstrap stub -> 'globals' -> 'modules' -> 'xgl' -> () _AddSlots: ( | {
         'ModuleInfo: Module: xgl InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'glue'.
        } | ) 

 bootstrap stub -> 'globals' -> 'modules' -> 'xgl' -> () _AddSlots: ( | {
         'ModuleInfo: Module: xgl InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap stub -> 'globals' -> 'modules' -> 'xgl' -> () _AddSlots: ( | {
         'ModuleInfo: Module: xgl InitialContents: FollowSlot'

         postFileIn = ( |
             {} = 'ModuleInfo: Creator: globals modules xgl postFileIn.
'.

            | 
            "TODO: make this handle multiple levels of objects and 
             make it set the creator path also"
            "xgl raw _Mirror do: [ | :s | 
               s contents do: [ | :s | 
                 s module isEmpty ifTrue: [ s module: 'xgl' ]
               ] 
            ].
            traits xgl raw _Mirror do: [ | :s | 
               s contents do: [ | :s | 
                 s module isEmpty ifTrue: [ s module: 'xgl' ] 
               ] 
            ]."
            self).
        } | ) 

 bootstrap stub -> 'globals' -> 'modules' -> 'xgl' -> () _AddSlots: ( | {
         'ModuleInfo: Module: xgl InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- 'Sun-$Revision: 20.1 $'.
        } | ) 

 bootstrap stub -> 'globals' -> 'modules' -> 'xgl' -> () _AddSlots: ( | {
         'ModuleInfo: Module: xgl InitialContents: FollowSlot\x7fVisibility: public'
        
         subpartNames <- 'xgl_wrappers'.
        } | ) 

 bootstrap stub -> 'globals' -> 'windowing' -> () _AddSlots: ( | {
         'ModuleInfo: Module: xgl InitialContents: FollowSlot\x7fVisibility: public'
        
         xgl = bootstrap stub -> 'globals' -> 'windowing' -> 'xgl' -> () _AddSlots: ( |
             {} = 'ModuleInfo: Creator: globals windowing xgl.
'.
            | ) .
        } | ) 

 bootstrap stub -> 'globals' -> 'windowing' -> 'xgl' -> () _AddSlots: ( | {
         'ModuleInfo: Module: xgl InitialContents: FollowSlot'
        
         raw* = bootstrap stub -> 'globals' -> 'windowing' -> 'xgl' -> 'raw' -> () _AddSlots: ( |
             {} = 'ModuleInfo: Creator: globals windowing xgl raw.
'.
            | ) .
        } | ) 



 '-- Sub parts'
 
 bootstrap read: 'xgl_wrappers' From: 'glue'
 
 
 
 '-- Side effects'

 globals modules xgl postFileIn
