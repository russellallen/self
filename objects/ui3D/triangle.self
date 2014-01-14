 '$Revision: 20.2 $'
 '
Copyright 1992-2012 AUTHORS.
See the LICENSE file for license information.
         '


 '-- Module body'

 bootstrap stub -> 'globals' -> 'modules' -> () _AddSlots: ( | {
         'ModuleInfo: Module: triangle InitialContents: FollowSlot'
        
         triangle = bootstrap stub -> 'globals' -> 'modules' -> 'triangle' -> () _Define: (
             bootstrap remove: 'comment' From:
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) _AddSlots: bootstrap stub -> 'globals' -> 'modules' -> 'triangle' -> () _AddSlots: ( |
             {} = 'Comment: the prototype module object, I am created by init.self.\x7fModuleInfo: Creator: globals modules triangle.

CopyDowns:
globals modules init. copy 
SlotsToOmit: comment directory fileInTimeString postFileIn revision subpartNames.

'.
            | ) .
        } | ) 

 bootstrap stub -> 'globals' -> 'modules' -> 'triangle' -> () _AddSlots: ( | {
         'ModuleInfo: Module: triangle InitialContents: FollowSlot\x7fVisibility: public'
        
         comment <- ''.
        } | ) 

 bootstrap stub -> 'globals' -> 'modules' -> 'triangle' -> () _AddSlots: ( | {
         'ModuleInfo: Module: triangle InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'ui3D'.
        } | ) 

 bootstrap stub -> 'globals' -> 'modules' -> 'triangle' -> () _AddSlots: ( | {
         'ModuleInfo: Module: triangle InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap stub -> 'globals' -> 'modules' -> 'triangle' -> () _AddSlots: ( | {
         'ModuleInfo: Module: triangle InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- '$Revision: 20.2 $'.
        } | ) 

 bootstrap stub -> 'globals' -> 'modules' -> 'triangle' -> () _AddSlots: ( | {
         'ModuleInfo: Module: triangle InitialContents: FollowSlot\x7fVisibility: public'
        
         subpartNames <- ''.
        } | ) 

 bootstrap stub -> 'globals' -> 'windowing' -> 'xgl' -> () _AddSlots: ( | {
         'ModuleInfo: Module: triangle InitialContents: FollowSlot'
        
         triangle = bootstrap stub -> 'globals' -> 'windowing' -> 'xgl' -> 'triangle' -> () _AddSlots: ( |
             {} = 'ModuleInfo: Creator: globals windowing xgl triangle.
'.
            | ) .
        } | ) 

 bootstrap stub -> 'globals' -> 'windowing' -> 'xgl' -> 'triangle' -> () _AddSlots: ( | {
         'ModuleInfo: Module: triangle InitialContents: InitializeToExpression: (paint named: \'black\')\x7fVisibility: public'
        
         color <- paint named: 'black'.
        } | ) 

 bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> () _AddSlots: ( | {
         'ModuleInfo: Module: triangle InitialContents: FollowSlot'
        
         triangle = bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'triangle' -> () _AddSlots: ( |
             {} = 'ModuleInfo: Creator: traits windowing xgl triangle.
'.
            | ) .
        } | ) 

 bootstrap stub -> 'globals' -> 'windowing' -> 'xgl' -> 'triangle' -> () _AddSlots: ( | {
         'ModuleInfo: Module: triangle InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'triangle' -> ().
        } | ) 

 bootstrap stub -> 'globals' -> 'windowing' -> 'xgl' -> 'triangle' -> () _AddSlots: ( | {
         'ModuleInfo: Module: triangle InitialContents: InitializeToExpression: (0@0@0)\x7fVisibility: public'
        
         pointA <- 0@0@0.
        } | ) 

 bootstrap stub -> 'globals' -> 'windowing' -> 'xgl' -> 'triangle' -> () _AddSlots: ( | {
         'ModuleInfo: Module: triangle InitialContents: InitializeToExpression: (1@1@0)\x7fVisibility: public'
        
         pointB <- 1@1@0.
        } | ) 

 bootstrap stub -> 'globals' -> 'windowing' -> 'xgl' -> 'triangle' -> () _AddSlots: ( | {
         'ModuleInfo: Module: triangle InitialContents: InitializeToExpression: (0@1@0)\x7fVisibility: public'
        
         pointC <- 0@1@0.
        } | ) 

 bootstrap stub -> 'globals' -> 'windowing' -> 'xgl' -> 'triangle' -> () _AddSlots: ( | {
         'ModuleInfo: Module: triangle InitialContents: InitializeToExpression: (0.5@0.5@0)'
        
         rawCenter <- 0.5@0.5@0.
        } | ) 

 bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'triangle' -> () _AddSlots: ( | {
         'Category: coercions\x7fModuleInfo: Module: triangle InitialContents: FollowSlot'
        
         asFacetListProxy = ( | 
             result.
            | 
            result: (((xgl facetList new) facet_type: xgl facetType facetColor)
                                          num_facets: 1) 
                                 facets_color_facets: xgl colorFacet new: 1.
            result facets_color_facets at: 0 Put: 
                    (xgl colorFacet new) color_rgb: (xgl colorRgb new) set_B: color rawBlue 
                                                                           G: color rawGreen
                                                                           R: color rawRed.
            result).
        } | ) 

 bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'triangle' -> () _AddSlots: ( | {
         'Category: coercions\x7fModuleInfo: Module: triangle InitialContents: FollowSlot'
        
         asPointListProxy = ( | 
             result.
            | 
            result: (((xgl ptList new) pt_type: xgl ptType ptF3d) 
                                       num_pts: 3) 
                                       pts_f3d: xgl ptF3d new: 3.
            result pts_f3d at: 0 Put: pointA asPointListProxy.
            result pts_f3d at: 1 Put: pointB asPointListProxy.
            result pts_f3d at: 2 Put: pointC asPointListProxy.
            result).
        } | ) 

 bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'triangle' -> () _AddSlots: ( | {
         'Category: copying\x7fModuleInfo: Module: triangle InitialContents: FollowSlot'
        
         copyA: ptA B: ptB C: ptC = ( | 
            | 
            ((copy pointA: ptA) pointB: ptB) pointC: ptC).
        } | ) 

 bootstrap stub -> 'traits' -> 'windowing' -> 'xgl' -> 'triangle' -> () _AddSlots: ( | {
         'ModuleInfo: Module: triangle InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'system' -> 'roots' -> 'clonable' -> ().
        } | ) 



 '-- Side effects'

 globals modules triangle postFileIn
