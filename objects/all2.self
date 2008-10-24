 'Sun-$Revision: 30.7 $'
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
         'ModuleInfo: Module: all2 InitialContents: FollowSlot'
        
         all2 = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'all2' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'all2' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules all2.

CopyDowns:
globals modules init. copy 
SlotsToOmit: directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'all2' -> () From: ( | {
         'ModuleInfo: Module: all2 InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'all2' -> () From: ( | {
         'ModuleInfo: Module: all2 InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'all2' -> () From: ( | {
         'ModuleInfo: Module: all2 InitialContents: FollowSlot'
        
         myComment <- 'Read in the complete Self world.'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'all2' -> () From: ( | {
         'ModuleInfo: Module: all2 InitialContents: FollowSlot'
        
         postFileIn = ( |
            | 
             resend.postFileIn.

            _Verify.
            "throw away code strings for the little dinky doIts"
            memory quickCleanup.
            transporter moduleDictionary refill.
            "start the scheduler"
            scheduler start.
            _Verify).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'all2' -> () From: ( | {
         'ModuleInfo: Module: all2 InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- 'Sun-$Revision: 30.7 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'all2' -> () From: ( | {
         'ModuleInfo: Module: all2 InitialContents: FollowSlot\x7fVisibility: private'
        
         subpartNames <- '
             init
	     allCore
	     allGraphics
	     allUI
	     crypto
	     primitiveMaker
	     allTests
	     allUI2
	     allOutliner
	     '.
        } | ) 



 '-- Sub parts'

 bootstrap read: 'allCore' From: 'core'
 bootstrap read: 'allGraphics' From: 'graphics'
 bootstrap read: 'allUI' From: 'ui1'
 bootstrap read: 'crypto' From: 'misc'
 bootstrap read: 'primitiveMaker' From: 'glue'
 bootstrap read: 'allTests' From: 'tests'
 bootstrap read: 'allUI2' From: 'ui2'
 bootstrap read: 'allOutliner' From: 'ui2/outliner'



 '-- Side effects'

 globals modules all2 postFileIn
