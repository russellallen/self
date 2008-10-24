 'Sun-$Revision: 30.7 $'
 '
Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
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

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: userInterface\x7fModuleInfo: Module: togglers InitialContents: FollowSlot'
        
         togglers = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'togglers' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals togglers.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'togglers' -> () From: ( | {
         'ModuleInfo: Module: togglers InitialContents: FollowSlot'
        
         all = ( |
            | 
            animation.
            slowMotion.
            motionBlur.
            slowInOut.
            anticipation.
            followThrough.
            arcs.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'togglers' -> () From: ( | {
         'ModuleInfo: Module: togglers InitialContents: FollowSlot'
        
         animation = ( | {
                 'ModuleInfo: Module: togglers InitialContents: FollowSlot'
                
                 t.
                } 
            | 
            t: toggleBody createOn: ui world
                        OnString: 'animation ON'
                        OffString: 'animation OFF'
                        OnMessage: (message copy receiver: ui
                                                 Selector: 'animationOn')
                        OffMessage: (message copy receiver: ui
                                                  Selector: 'animationOff')
                        InitiallyOn: true.
             t location: loc: 1.
             t swoopDown.
             t).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'togglers' -> () From: ( | {
         'ModuleInfo: Module: togglers InitialContents: FollowSlot'
        
         anticipation = ( | {
                 'ModuleInfo: Module: togglers InitialContents: FollowSlot'
                
                 t.
                } 
            | 
            t: toggleBody createOn: ui world
                        OnString: 'anticipation'
                        OffString: 'no anticipation'
                        OnMessage: (message copy receiver: ui
                                                 Selector: 'anticipation')
                        OffMessage: (message copy receiver: ui
                                                  Selector: 'noAnticipation')
                        InitiallyOn: true.
             t location: loc: 5.
             t swoopDown.
             t).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'togglers' -> () From: ( | {
         'ModuleInfo: Module: togglers InitialContents: FollowSlot'
        
         arcs = ( | {
                 'ModuleInfo: Module: togglers InitialContents: FollowSlot'
                
                 t.
                } 
            | 
            t: toggleBody createOn: ui world
                        OnString: 'arcs'
                        OffString: 'straight lines'
                        OnMessage: (message copy receiver: ui
                                                 Selector: 'arcs')
                        OffMessage: (message copy receiver: ui
                                                  Selector: 'straightLines')
                        InitiallyOn: true.
             t location: loc: 7.
             t swoopDown.
             t).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'togglers' -> () From: ( | {
         'ModuleInfo: Module: togglers InitialContents: FollowSlot'
        
         followThrough = ( | {
                 'ModuleInfo: Module: togglers InitialContents: FollowSlot'
                
                 t.
                } 
            | 
            t: toggleBody createOn: ui world
                        OnString: 'follow through'
                        OffString: 'no follow through'
                        OnMessage: (message copy receiver: ui
                                                 Selector: 'followThrough')
                        OffMessage: (message copy receiver: ui
                                                  Selector: 'noFollowThrough')
                        InitiallyOn: true.
             t location: loc: 6.
             t swoopDown.
             t).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'togglers' -> () From: ( | {
         'ModuleInfo: Module: togglers InitialContents: FollowSlot'
        
         loc: n = ( | {
                 'ModuleInfo: Module: togglers InitialContents: FollowSlot'
                
                 sz.
                }  {
                 'ModuleInfo: Module: togglers InitialContents: FollowSlot'
                
                 total = 7.
                }  {
                 'ModuleInfo: Module: togglers InitialContents: FollowSlot'
                
                 xoffset = 30.
                }  {
                 'ModuleInfo: Module: togglers InitialContents: FollowSlot'
                
                 yoffset = 50.
                } 
            | 
            sz: ui window size.
            xoffset @ (sz y - (yoffset * (total succ - n)))).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'togglers' -> () From: ( | {
         'ModuleInfo: Module: togglers InitialContents: FollowSlot'
        
         motionBlur = ( | {
                 'ModuleInfo: Module: togglers InitialContents: FollowSlot'
                
                 t.
                } 
            | 
            t: toggleBody createOn: ui world
                        OnString: 'motion blur'
                        OffString: 'no motion blur'
                        OnMessage: (message copy receiver: ui
                                                 Selector: 'motionBlur')
                        OffMessage: (message copy receiver: ui
                                                  Selector: 'noMotionBlur')
                        InitiallyOn: true.
             t location: loc: 3.
             t swoopDown.
             t).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'togglers' -> () From: ( | {
         'ModuleInfo: Module: togglers InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'oddball' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'togglers' -> () From: ( | {
         'ModuleInfo: Module: togglers InitialContents: FollowSlot'
        
         slowInOut = ( | {
                 'ModuleInfo: Module: togglers InitialContents: FollowSlot'
                
                 t.
                } 
            | 
            t: toggleBody createOn: ui world
                        OnString: 'slow in & slow out'
                        OffString: 'linearly spaced'
                        OnMessage: (message copy receiver: ui
                                                 Selector: 'slowInOut')
                        OffMessage: (message copy receiver: ui
                                                  Selector: 'linearlySpaced')
                        InitiallyOn: true.
             t location: loc: 4.
             t swoopDown.
             t).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'togglers' -> () From: ( | {
         'ModuleInfo: Module: togglers InitialContents: FollowSlot'
        
         slowMotion = ( | {
                 'ModuleInfo: Module: togglers InitialContents: FollowSlot'
                
                 t.
                } 
            | 
            t: toggleBody createOn: ui world
                        OnString: 'slow motion'
                        OffString: 'full speed'
                        OnMessage: (message copy receiver: ui
                                                 Selector: 'slowMotion')
                        OffMessage: (message copy receiver: ui
                                                  Selector: 'fullSpeed')
                        InitiallyOn: false.
             t location: loc: 2.
             t swoopDown.
             t).
        } | ) 



 '-- Side effects'

 globals modules togglers postFileIn
