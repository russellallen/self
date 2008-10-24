 'Sun-$Revision: 20.2 $'
 '
Copyright 1994 Sun Microsystems, Inc. and Stanford University.
See the LICENSE file for license information.
         '


 '-- Module body'

 bootstrap stub -> 'globals' -> 'modules' -> () _AddSlots: ( | {
         'ModuleInfo: Module: allUI3D InitialContents: FollowSlot'
        
         allUI3D = bootstrap stub -> 'globals' -> 'modules' -> 'allUI3D' -> () _Define: (
             bootstrap remove: 'comment' From:
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) _AddSlots: bootstrap stub -> 'globals' -> 'modules' -> 'allUI3D' -> () _AddSlots: ( |
             {} = 'Comment: the prototype module object, I am created by init.self.\x7fModuleInfo: Creator: globals modules allUI3D.

CopyDowns:
globals modules init. copy 
SlotsToOmit: comment directory fileInTimeString postFileIn revision subpartNames.

'.
            | ) .
        } | ) 

 bootstrap stub -> 'globals' -> 'modules' -> 'allUI3D' -> () _AddSlots: ( | {
         'ModuleInfo: Module: allUI3D InitialContents: FollowSlot\x7fVisibility: public'
        
         comment <- ' \'\''.
        } | ) 

 bootstrap stub -> 'globals' -> 'modules' -> 'allUI3D' -> () _AddSlots: ( | {
         'ModuleInfo: Module: allUI3D InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'ui3D'.
        } | ) 

 bootstrap stub -> 'globals' -> 'modules' -> 'allUI3D' -> () _AddSlots: ( | {
         'ModuleInfo: Module: allUI3D InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap stub -> 'globals' -> 'modules' -> 'allUI3D' -> () _AddSlots: ( | {
         'ModuleInfo: Module: allUI3D InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- 'Sun-$Revision: 20.2 $'.
        } | ) 

 bootstrap stub -> 'globals' -> 'modules' -> 'allUI3D' -> () _AddSlots: ( | {
         'ModuleInfo: Module: allUI3D InitialContents: FollowSlot\x7fVisibility: public'
        
         subpartNames <- '
                xgl
                examples
                simpleWindow
                point3d
                triangle
                doubleBuffering
                window3d
                transform
	'.
        } | ) 

 bootstrap stub -> 'globals' -> () _AddSlots: ( | {
         'ModuleInfo: Module: allUI3D InitialContents: FollowSlot\x7fVisibility: public'
        
         ui3D* = bootstrap stub -> 'globals' -> 'ui3D' -> () _AddSlots: ( |
             {} = 'ModuleInfo: Creator: globals ui3D.
'.
            | ) .
        } | ) 

 bootstrap stub -> 'traits' -> () _AddSlots: ( | {
         'ModuleInfo: Module: allUI3D InitialContents: FollowSlot\x7fVisibility: public'
        
         ui3D* = bootstrap stub -> 'traits' -> 'ui3D' -> () _AddSlots: ( |
             {} = 'ModuleInfo: Creator: traits ui3D.
'.
            | ) .
        } | ) 



 '-- Sub parts'

 bootstrap read: 'xgl' From: 'glue'
 bootstrap read: 'examples' From: 'ui3D'
 bootstrap read: 'simpleWindow' From: 'ui3D'
 bootstrap read: 'point3d' From: 'ui3D'
 bootstrap read: 'triangle' From: 'ui3D'
 bootstrap read: 'doubleBuffering' From: 'ui3D'
 bootstrap read: 'window3d' From: 'ui3D'
 bootstrap read: 'transform' From: 'ui3D'


 '-- Side effects'

 globals modules allUI3D postFileIn
