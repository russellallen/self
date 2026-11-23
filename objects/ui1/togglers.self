 'Sun-$Revision: 30.7 $'
 '
Copyright 1992-2026 AUTHORS.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: togglers InitialContents: FollowSlot'
        
         togglers = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'togglers' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'comment' From:
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'togglers' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules togglers.

CopyDowns:
globals modules init. copy 
SlotsToOmit: comment directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'togglers' -> () From: ( | {
         'ModuleInfo: Module: togglers InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'ui1'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'togglers' -> () From: ( | {
         'ModuleInfo: Module: togglers InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'togglers' -> () From: ( | {
         'ModuleInfo: Module: togglers InitialContents: FollowSlot'
        
         myComment <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'togglers' -> () From: ( | {
         'ModuleInfo: Module: togglers InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- 'Sun-$Revision: 30.7 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'togglers' -> () From: ( | {
         'ModuleInfo: Module: togglers InitialContents: FollowSlot\x7fVisibility: public'
        
         subpartNames <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'ui1' -> () From: ( | {
         'Category: userInterface\x7fModuleInfo: Module: togglers InitialContents: FollowSlot'
        
         togglers = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'ui1' -> 'togglers' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals ui1 togglers.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'ui1' -> 'togglers' -> () From: ( | {
         'ModuleInfo: Module: togglers InitialContents: FollowSlot'
        
         all = ( |
            | 
            animation.
            slowMotion.
            motionBlur.
            arrowMotionBlur.
            slowInOut.
            anticipation.
            followThrough.
            arcs.
            textScale.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'ui1' -> 'togglers' -> () From: ( | {
         'ModuleInfo: Module: togglers InitialContents: FollowSlot'
        
         animation = ( | {
                 'ModuleInfo: Module: togglers InitialContents: FollowSlot'
                
                 t.
                } 
            | 
            t: ui1 toggleBody createOn: ui1 ui currentWorld
                        OnString: 'animation ON'
                        OffString: 'animation OFF'
                        OnMessage: (message copy receiver: ui1 ui currentWorld myUI
                                                 Selector: 'animationOn')
                        OffMessage: (message copy receiver: ui1 ui currentWorld myUI
                                                  Selector: 'animationOff')
                        InitiallyOn: true.
             t location: loc: 1.
             t swoopDown.
             t).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'ui1' -> 'togglers' -> () From: ( | {
         'ModuleInfo: Module: togglers InitialContents: FollowSlot'
        
         anticipation = ( | {
                 'ModuleInfo: Module: togglers InitialContents: FollowSlot'
                
                 t.
                } 
            | 
            t: ui1 toggleBody createOn: ui1 ui currentWorld
                        OnString: 'anticipation'
                        OffString: 'no anticipation'
                        OnMessage: (message copy receiver: ui1 ui currentWorld myUI
                                                 Selector: 'anticipation')
                        OffMessage: (message copy receiver: ui1 ui currentWorld myUI
                                                  Selector: 'noAnticipation')
                        InitiallyOn: true.
             t location: loc: 5.
             t swoopDown.
             t).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'ui1' -> 'togglers' -> () From: ( | {
         'ModuleInfo: Module: togglers InitialContents: FollowSlot'
        
         arcs = ( | {
                 'ModuleInfo: Module: togglers InitialContents: FollowSlot'
                
                 t.
                } 
            | 
            t: ui1 toggleBody createOn: ui1 ui currentWorld
                        OnString: 'arcs'
                        OffString: 'straight lines'
                        OnMessage: (message copy receiver: ui1 ui currentWorld myUI
                                                 Selector: 'arcs')
                        OffMessage: (message copy receiver: ui1 ui currentWorld myUI
                                                  Selector: 'straightLines')
                        InitiallyOn: true.
             t location: loc: 7.
             t swoopDown.
             t).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'ui1' -> 'togglers' -> () From: ( | {
         'ModuleInfo: Module: togglers InitialContents: FollowSlot'
        
         followThrough = ( | {
                 'ModuleInfo: Module: togglers InitialContents: FollowSlot'
                
                 t.
                } 
            | 
            t: ui1 toggleBody createOn: ui1 ui currentWorld
                        OnString: 'follow through'
                        OffString: 'no follow through'
                        OnMessage: (message copy receiver: ui1 ui currentWorld myUI
                                                 Selector: 'followThrough')
                        OffMessage: (message copy receiver: ui1 ui currentWorld myUI
                                                  Selector: 'noFollowThrough')
                        InitiallyOn: true.
             t location: loc: 6.
             t swoopDown.
             t).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'ui1' -> 'togglers' -> () From: ( | {
         'ModuleInfo: Module: togglers InitialContents: FollowSlot'
        
         loc: n = ( |
             sz.
             total = 9.
             xoffset = 30.
             yoffset = 50.
            | 
            sz: ui1 ui currentWorld myUI window size.
            xoffset @ (sz y - (yoffset * (total succ - n)))).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'ui1' -> 'togglers' -> () From: ( | {
         'Comment: Same switch as menus: stretch text with the expanding slab, or fade it in after. -- grok 08/26/26\x7fModuleInfo: Module: togglers InitialContents: FollowSlot'
        
         textScale = ( | {
                 'ModuleInfo: Module: togglers InitialContents: FollowSlot'
                
                 t.
                } 
            | 
            t: ui1 toggleBody createOn: ui1 ui currentWorld
                        OnString: 'text scales'
                        OffString: 'text fades in'
                        OnMessage: (message copy receiver: ui1 ui currentWorld myUI
                                                 Selector: 'textScalesWithSlab')
                        OffMessage: (message copy receiver: ui1 ui currentWorld myUI
                                                  Selector: 'fadeTextIn')
                        InitiallyOn: true.
             t location: loc: 8.
             t swoopDown.
             t).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'ui1' -> 'togglers' -> () From: ( | {
         'Comment: Alias of textScale. -- grok 08/26/26\x7fModuleInfo: Module: togglers InitialContents: FollowSlot'
        
         menuTextScale = ( |
            | textScale).
        } | )  

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'ui1' -> 'togglers' -> () From: ( | {
         'Comment: Box/body blur only. Arrows have arrowMotionBlur. -- grok 08/26/26\x7fModuleInfo: Module: togglers InitialContents: FollowSlot'
        
         motionBlur = ( | {
                 'ModuleInfo: Module: togglers InitialContents: FollowSlot'
                
                 t.
                } 
            | 
            t: ui1 toggleBody createOn: ui1 ui currentWorld
                        OnString: 'box motion blur'
                        OffString: 'no box motion blur'
                        OnMessage: (message copy receiver: ui1 ui currentWorld myUI
                                                 Selector: 'motionBlur')
                        OffMessage: (message copy receiver: ui1 ui currentWorld myUI
                                                  Selector: 'noMotionBlur')
                        InitiallyOn: true.
             t location: loc: 3.
             t swoopDown.
             t).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'ui1' -> 'togglers' -> () From: ( | {
         'Comment: Independent of box motionBlur. -- grok 08/26/26\x7fModuleInfo: Module: togglers InitialContents: FollowSlot'
        
         arrowMotionBlur = ( | {
                 'ModuleInfo: Module: togglers InitialContents: FollowSlot'
                
                 t.
                } 
            | 
            t: ui1 toggleBody createOn: ui1 ui currentWorld
                        OnString: 'arrow motion blur'
                        OffString: 'no arrow motion blur'
                        OnMessage: (message copy receiver: ui1 ui currentWorld myUI
                                                 Selector: 'arrowMotionBlur')
                        OffMessage: (message copy receiver: ui1 ui currentWorld myUI
                                                  Selector: 'noArrowMotionBlur')
                        InitiallyOn: false.
             t location: loc: 9.
             t swoopDown.
             t).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'ui1' -> 'togglers' -> () From: ( | {
         'ModuleInfo: Module: togglers InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'oddball' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'ui1' -> 'togglers' -> () From: ( | {
         'ModuleInfo: Module: togglers InitialContents: FollowSlot'
        
         slowInOut = ( | {
                 'ModuleInfo: Module: togglers InitialContents: FollowSlot'
                
                 t.
                } 
            | 
            t: ui1 toggleBody createOn: ui1 ui currentWorld
                        OnString: 'slow in & slow out'
                        OffString: 'linearly spaced'
                        OnMessage: (message copy receiver: ui1 ui currentWorld myUI
                                                 Selector: 'slowInOut')
                        OffMessage: (message copy receiver: ui1 ui currentWorld myUI
                                                  Selector: 'linearlySpaced')
                        InitiallyOn: true.
             t location: loc: 4.
             t swoopDown.
             t).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'ui1' -> 'togglers' -> () From: ( | {
         'ModuleInfo: Module: togglers InitialContents: FollowSlot'
        
         slowMotion = ( | {
                 'ModuleInfo: Module: togglers InitialContents: FollowSlot'
                
                 t.
                } 
            | 
            t: ui1 toggleBody createOn: ui1 ui currentWorld
                        OnString: 'slow motion'
                        OffString: 'full speed'
                        OnMessage: (message copy receiver: ui1 ui currentWorld myUI
                                                 Selector: 'slowMotion')
                        OffMessage: (message copy receiver: ui1 ui currentWorld myUI
                                                  Selector: 'fullSpeed')
                        InitiallyOn: false.
             t location: loc: 2.
             t swoopDown.
             t).
        } | ) 



 '-- Side effects'

 globals modules togglers postFileIn
