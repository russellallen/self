 'Sun-$Revision: 30.7 $'
 '
Copyright 1992-2012 AUTHORS.
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
         'ModuleInfo: Module: ci InitialContents: FollowSlot'
        
         ci = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'ci' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'ci' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules ci.

CopyDowns:
globals modules init. copy 
SlotsToOmit: directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'ci' -> () From: ( | {
         'ModuleInfo: Module: ci InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'ci' -> () From: ( | {
         'ModuleInfo: Module: ci InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'ci' -> () From: ( | {
         'ModuleInfo: Module: ci InitialContents: FollowSlot'
        
         myComment <- 'Read in the complete Self world and execute test.'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'ci' -> () From: ( | {
         'ModuleInfo: Module: ci InitialContents: FollowSlot'
        
         postFileIn = ( | graphicsLoadedFlag <- false.
            | 
             resend.postFileIn.
            
            bootstrap read: 'allGraphics' From: 'graphics'.
            graphicsLoadedFlag: true.
            bootstrap read: 'allUI2' From: 'ui2'.
            bootstrap read: 'allOutliner' From: 'ui2/outliner'.

            host osName = 'macOSX'
                ifFalse: [  graphicsLoadedFlag ifFalse: [
                               bootstrap read: 'allGraphics' From: 'graphics'.
                               graphicsLoadedFlag: true].
                           bootstrap read: 'allUI' From: 'ui1'].

            _Verify.
            "throw away code strings for the little dinky doIts"
            memory quickCleanup.
            transporter moduleDictionary refill.
            snapshotAction addSchedulerInitialMessage:  
                message copy receiver: self
                             Selector: 'work'.
            "start the scheduler"
            scheduler start.
            _Quit
            ).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'ci' -> () From: ( | {
         'ModuleInfo: Module: ci InitialContents: FollowSlot\x7fVisibility: public'
         
         work = ( 
             "Test."
              tests runVMSuite.              
              scheduler stop.
             ).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'ci' -> () From: ( | {
         'ModuleInfo: Module: ci InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- 'Sun-$Revision: 30.7 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'ci' -> () From: ( | {
         'ModuleInfo: Module: ci InitialContents: FollowSlot\x7fVisibility: private'
        
         subpartNames <- '
             init
	     allCore
	     crypto
	     primitiveMaker
	     allTests
	     '.
        } | ) 



 '-- Sub parts'

 bootstrap read: 'allCore' From: 'core'
 bootstrap read: 'crypto' From: 'misc'
 bootstrap read: 'primitiveMaker' From: 'glue'
 bootstrap read: 'allTests' From: 'tests'

 '-- Side effects'

 globals modules ci postFileIn


