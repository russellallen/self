 'Sun-$Revision: 30.8 $'
 '
Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
See the LICENSE file for license information.
'
[| var = 'SELF_WORKING_DIR'. dir |
  dir:  var _getenvenvironmentAtIfFail: [|:e. :n| nil].
  dir:  dir _ByteVectorConcatenate: '/objects'        Prototype: byteVector IfFail: [|:e. :n| '.'].
  dir:  dir _ByteVectorConcatenate: '/core/init.self' Prototype: byteVector.
  dir _RunScript
] value

_MemoryExpandHeap: 6291456

 '-- Module body'

 bootstrap stub -> 'globals' -> 'modules' -> () _AddSlots: ( | {
         'ModuleInfo: Module: smallUI2 InitialContents: FollowSlot'
        
         smallUI2 = bootstrap stub -> 'globals' -> 'modules' -> 'smallUI2' -> () _Define: (
             bootstrap remove: 'comment' From:
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'savedTimestamp' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) _AddSlots: bootstrap stub -> 'globals' -> 'modules' -> 'smallUI2' -> () _AddSlots: ( |
             {} = 'ModuleInfo: Creator: globals modules smallUI2.

CopyDowns:
globals modules init. copy 
SlotsToOmit: comment directory fileInTimeString myComment postFileIn revision savedTimestamp subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap stub -> 'globals' -> 'modules' -> 'smallUI2' -> () _AddSlots: ( | {
         'ModuleInfo: Module: smallUI2 InitialContents: FollowSlot\x7fVisibility: private'
        
         myComment <- '
            Read in the smallUI2 Self world (core + graphical user interface'.
        } | ) 

 bootstrap stub -> 'globals' -> 'modules' -> 'smallUI2' -> () _AddSlots: ( | {
         'ModuleInfo: Module: smallUI2 InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- ''.
        } | ) 

 bootstrap stub -> 'globals' -> 'modules' -> 'smallUI2' -> () _AddSlots: ( | {
         'ModuleInfo: Module: smallUI2 InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap stub -> 'globals' -> 'modules' -> 'smallUI2' -> () _AddSlots: ( | {
         'ModuleInfo: Module: smallUI2 InitialContents: FollowSlot'
        
         postFileIn = ( |
            | 
             resend.postFileIn.

            "throw away code strings for the little dinky doIts"
            memory quickCleanup.
            transporter moduleDictionary refill.
            "start the scheduler"
            scheduler start).
        } | ) 

 bootstrap stub -> 'globals' -> 'modules' -> 'smallUI2' -> () _AddSlots: ( | {
         'ModuleInfo: Module: smallUI2 InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- 'Sun-$Revision: 30.8 $'.
        } | ) 

 bootstrap stub -> 'globals' -> 'modules' -> 'smallUI2' -> () _AddSlots: ( | {
         'Category: state\x7fModuleInfo: Module: smallUI2 InitialContents: FollowSlot\x7fVisibility: private'
        
         savedTimestamp <- 18656.
        } | ) 

 bootstrap stub -> 'globals' -> 'modules' -> 'smallUI2' -> () _AddSlots: ( | {
         'ModuleInfo: Module: smallUI2 InitialContents: FollowSlot\x7fVisibility: public'
        
         subpartNames <- '
             init
	     allCore
	     xlib
	     spline
             allUI2
             allOutliner
	     '.
        } | ) 



 '-- Sub parts'

 bootstrap read: 'allCore' From: 'core'
 bootstrap read: 'xlib' From: 'ui1'
 bootstrap read: 'spline' From: 'ui1'
 bootstrap read: 'allUI2' From: 'ui2'
 bootstrap read: 'allOutliner' From: 'ui2/outliner'



 '-- Side effects'

 globals modules smallUI2 postFileIn
