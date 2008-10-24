 'Sun-$Revision: 30.7 $'
 '
Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap stub -> 'globals' -> () _AddSlots: ( | {
         'Category: System\x7fCategory: Morphs\x7fCategory: Widgets\x7fModuleInfo: Module: marqueeMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         marqueeMorph = bootstrap stub -> 'globals' -> 'marqueeMorph' -> () _Define: (
             bootstrap remove: 'borderWidth' From:
             bootstrap remove: 'frameStyle' From:
             bootstrap remove: 'parent' From:
             globals frameMorph copyRemoveAllMorphs ) _AddSlots: bootstrap stub -> 'globals' -> 'marqueeMorph' -> () _AddSlots: ( |
             {} = 'ModuleInfo: Creator: globals marqueeMorph.

CopyDowns:
globals frameMorph. copyRemoveAllMorphs 
SlotsToOmit: borderWidth frameStyle parent.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap stub -> 'globals' -> 'marqueeMorph' -> () _AddSlots: ( | {
         'ModuleInfo: Module: marqueeMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         borderWidth <- 1.
        } | ) 

 bootstrap stub -> 'globals' -> 'marqueeMorph' -> () _AddSlots: ( | {
         'ModuleInfo: Module: marqueeMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         dashSize <- 4.
        } | ) 

 bootstrap stub -> 'globals' -> 'marqueeMorph' -> () _AddSlots: ( | {
         'ModuleInfo: Module: marqueeMorph InitialContents: FollowSlot\x7fVisibility: private'
        
         dashState <- 0.
        } | ) 

 bootstrap stub -> 'globals' -> 'marqueeMorph' -> () _AddSlots: ( | {
         'ModuleInfo: Module: marqueeMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         interval <- 50.
        } | ) 

 bootstrap stub -> 'globals' -> 'marqueeMorph' -> () _AddSlots: ( | {
         'ModuleInfo: Module: marqueeMorph InitialContents: FollowSlot\x7fVisibility: private'
        
         lastTime.
        } | ) 

 bootstrap stub -> 'globals' -> 'marqueeMorph' -> () _AddSlots: ( | {
         'ModuleInfo: Module: marqueeMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         nStates <- 4.
        } | ) 

 bootstrap stub -> 'traits' -> () _AddSlots: ( | {
         'Category: System\x7fCategory: Morphs\x7fCategory: Widgets\x7fModuleInfo: Module: marqueeMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         marqueeMorph = bootstrap stub -> 'traits' -> 'marqueeMorph' -> () _AddSlots: ( |
             {} = 'ModuleInfo: Creator: traits marqueeMorph.
'.
            | ) .
        } | ) 

 bootstrap stub -> 'globals' -> 'marqueeMorph' -> () _AddSlots: ( | {
         'ModuleInfo: Module: marqueeMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap stub -> 'traits' -> 'marqueeMorph' -> ().
        } | ) 

 bootstrap stub -> 'globals' -> 'modules' -> () _AddSlots: ( | {
         'ModuleInfo: Module: marqueeMorph InitialContents: FollowSlot'
        
         marqueeMorph = bootstrap stub -> 'globals' -> 'modules' -> 'marqueeMorph' -> () _Define: (
             bootstrap remove: 'comment' From:
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) _AddSlots: bootstrap stub -> 'globals' -> 'modules' -> 'marqueeMorph' -> () _AddSlots: ( |
             {} = 'ModuleInfo: Creator: globals modules marqueeMorph.

CopyDowns:
globals modules init. copy 
SlotsToOmit: comment directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap stub -> 'globals' -> 'modules' -> 'marqueeMorph' -> () _AddSlots: ( | {
         'ModuleInfo: Module: marqueeMorph InitialContents: FollowSlot\x7fVisibility: private'
        
         myComment <- ' \'\'
            \"Marquee morphs: changeable dashSize, interval, nStates, borderWidth.\"'.
        } | ) 

 bootstrap stub -> 'globals' -> 'modules' -> 'marqueeMorph' -> () _AddSlots: ( | {
         'ModuleInfo: Module: marqueeMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'ui2'.
        } | ) 

 bootstrap stub -> 'globals' -> 'modules' -> 'marqueeMorph' -> () _AddSlots: ( | {
         'ModuleInfo: Module: marqueeMorph InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap stub -> 'globals' -> 'modules' -> 'marqueeMorph' -> () _AddSlots: ( | {
         'ModuleInfo: Module: marqueeMorph InitialContents: FollowSlot'
        
         postFileIn = ( |
            | 
            resend.postFileIn.
            marqueeMorph resizeRect: (0@0) # (50@50)).
        } | ) 

 bootstrap stub -> 'globals' -> 'modules' -> 'marqueeMorph' -> () _AddSlots: ( | {
         'ModuleInfo: Module: marqueeMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- 'Sun-$Revision: 30.7 $'.
        } | ) 

 bootstrap stub -> 'globals' -> 'modules' -> 'marqueeMorph' -> () _AddSlots: ( | {
         'ModuleInfo: Module: marqueeMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         subpartNames <- ''.
        } | ) 

 bootstrap stub -> 'traits' -> 'marqueeMorph' -> () _AddSlots: ( | {
         'Category: drawing\x7fModuleInfo: Module: marqueeMorph InitialContents: FollowSlot\x7fVisibility: private'
        
         baseDrawDashedLineStyleOn: c Offset: os = ( |
             box.
            | 
            box: baseBounds.
            box: box topLeft ## (box size - (1@1)).
            c dashedLine: box topLeft     To: box topRight
              Width: borderWidth DashSize: dashSize Offset: os
              Color: color.
            c dashedLine: box topRight    To: box bottomRight
              Width: borderWidth DashSize: dashSize Offset: os
              Color: color.
            c dashedLine: box bottomRight To: box bottomLeft
              Width: borderWidth DashSize: dashSize Offset: os
              Color: color.
            c dashedLine: box bottomLeft  To: box topLeft
              Width: borderWidth DashSize: dashSize Offset: os
              Color: color.
            self).
        } | ) 

 bootstrap stub -> 'traits' -> 'marqueeMorph' -> () _AddSlots: ( | {
         'Category: drawing\x7fModuleInfo: Module: marqueeMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         baseDrawOn: c = ( |
            | 
            baseDrawDashedLineStyleOn: c
            Offset: ((dashSize * 2) - ((dashState * dashSize * 2) / nStates))).
        } | ) 

 bootstrap stub -> 'traits' -> 'marqueeMorph' -> () _AddSlots: ( | {
         'Category: basics\x7fModuleInfo: Module: marqueeMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         isRectangular = bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap stub -> 'traits' -> 'marqueeMorph' -> () _AddSlots: ( | {
         'Category: basics\x7fModuleInfo: Module: marqueeMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         morphTypeName = 'marqueeMorph'.
        } | ) 

 bootstrap stub -> 'traits' -> 'marqueeMorph' -> () _AddSlots: ( | {
         'ModuleInfo: Module: marqueeMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap stub -> 'traits' -> 'frameMorph' -> ().
        } | ) 

 bootstrap stub -> 'traits' -> 'marqueeMorph' -> () _AddSlots: ( | {
         'Category: stepping\x7fModuleInfo: Module: marqueeMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         step = ( |
            | 
            ((nil = lastTime) || [(times real - lastTime) >= interval]) ifTrue: [
                dashState: dashState succ % nStates.
                changed.
                lastTime: times real.
            ].
            self).
        } | ) 



 '-- Side effects'

 globals modules marqueeMorph postFileIn
