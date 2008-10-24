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

_MemoryExpandHeap: 8388608


 '-- Module body'



 '-- Set privacy, parenthood, assignability, and annotation of <<globals modules all>>'


globals modules _AddSlots: ( | 
    {  'ModuleInfo: Module: all InitialContents: FollowSlot'
        
         all = bootstrap stub -> 'globals' -> 'modules' -> 'all' -> ().
    }
    | )

globals modules all _AddSlots: (
     bootstrap remove: 'comment' From:
     bootstrap remove: 'directory' From:
     bootstrap remove: 'fileInTimeString' From:
     bootstrap remove: 'postFileIn' From:
     bootstrap remove: 'revision' From:
     bootstrap remove: 'savedTimestamp' From:
     bootstrap remove: 'subpartNames' From:
     globals modules init copy ) _AddSlots: ( |
     {} = 'ModuleInfo: Creator: globals modules all.

CopyDowns:
globals modules init. copy 
SlotsToOmit: comment directory fileInTimeString myComment postFileIn revision savedTimestamp subpartNames.

\x7fIsComplete: '.
    
    {  'ModuleInfo: Module: all InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
    }
    {  'ModuleInfo: Module: all InitialContents: FollowSlot\x7fVisibility: public'
        
         subpartNames <- '
             allCore
	     allGraphics
	     allUI
	     crypto
	     primitiveMaker
	     allTests
	     '.
    }
    {  'ModuleInfo: Module: all InitialContents: FollowSlot'
        
         postFileIn = ( |
            
            | resend.postFileIn.

            "throw away code strings for the little dinky doIts"
            memory quickCleanup.
            transporter moduleDictionary refill.
            "start the scheduler"
            scheduler start).
    }
    {  'Category: state\x7fModuleInfo: Module: all InitialContents: FollowSlot\x7fVisibility: private'
        
         savedTimestamp <- 29410.
    }
    | )


 '-- Sub parts'

 bootstrap read: 'allCore' From: 'core'
 bootstrap read: 'allGraphics' From: 'graphics'
 bootstrap read: 'allUI' From: 'ui1'
 bootstrap read: 'crypto' From: 'misc'
 bootstrap read: 'primitiveMaker' From: 'glue'
 bootstrap read: 'allTests' From: 'tests'



 '-- Side effects'

 globals modules all postFileIn
