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



 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: release4_0 InitialContents: FollowSlot'
        
         release4_0 = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'release4_0' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'comment' From:
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'savedTimestamp' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'release4_0' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules release4_0.

CopyDowns:
globals modules init. copy 
SlotsToOmit: comment directory fileInTimeString myComment postFileIn revision savedTimestamp subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'release4_0' -> () From: ( | {
         'ModuleInfo: Module: release4_0 InitialContents: FollowSlot\x7fVisibility: private'
        
         myComment <- '
            Read in the release4_0 Self world (core + graphical user interface'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'release4_0' -> () From: ( | {
         'ModuleInfo: Module: release4_0 InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'release4_0' -> () From: ( | {
         'ModuleInfo: Module: release4_0 InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'release4_0' -> () From: ( | {
         'ModuleInfo: Module: release4_0 InitialContents: FollowSlot'
        
         postFileIn = ( |
            | 
             resend.postFileIn.

            "throw away code strings for the little dinky doIts"
            memory quickCleanup.
            transporter moduleDictionary refill.
            "start the scheduler"
            scheduler start).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'release4_0' -> () From: ( | {
         'ModuleInfo: Module: release4_0 InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- 'Sun-$Revision: 30.8 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'release4_0' -> () From: ( | {
         'Category: state\x7fModuleInfo: Module: release4_0 InitialContents: FollowSlot\x7fVisibility: private'
        
         savedTimestamp <- 24578.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'release4_0' -> () From: ( | {
         'ModuleInfo: Module: release4_0 InitialContents: FollowSlot\x7fVisibility: public'
        
         subpartNames <- 'init
allCore
xlib
spline
allUI2
allOutliner
webBrowser
smalltalk
programmingExamples
'.
        } | ) 



 '-- Sub parts'

 bootstrap read: 'allCore' From: 'core'
 bootstrap read: 'xlib' From: 'ui1'
 bootstrap read: 'spline' From: 'ui1'
 bootstrap read: 'allUI2' From: 'ui2'
 bootstrap read: 'allOutliner' From: 'ui2/outliner'
 bootstrap read: 'webBrowser' From: 'applications/webBrowser'
 bootstrap read: 'smalltalk' From: 'applications/smalltalk'
 bootstrap read: 'programmingExamples' From: 'misc'



 '-- Side effects'

 globals modules release4_0 postFileIn
