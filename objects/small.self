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

_MemoryExpandHeap: 2097152

 '-- Module body'



 '-- Set privacy, parenthood, assignability, and annotation of <<globals modules small>>'


globals modules _AddSlots: ( | 
    {  'ModuleInfo: Module: small InitialContents: FollowSlot'
        
         small = bootstrap stub -> 'globals' -> 'modules' -> 'small' -> ().
    }
    | )

globals modules small _AddSlots: (
     bootstrap remove: 'comment' From:
     bootstrap remove: 'directory' From:
     bootstrap remove: 'fileInTimeString' From:
     bootstrap remove: 'postFileIn' From:
     bootstrap remove: 'revision' From:
     bootstrap remove: 'savedTimestamp' From:
     bootstrap remove: 'subpartNames' From:
     globals modules init copy ) _AddSlots: ( |
     {} = 'ModuleInfo: Creator: globals modules small.

CopyDowns:
globals modules init. copy 
SlotsToOmit: comment directory fileInTimeString myComment postFileIn revision savedTimestamp subpartNames.

\x7fIsComplete: '.
    
    {  'ModuleInfo: Module: small InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
    }
    {  'ModuleInfo: Module: small InitialContents: FollowSlot\x7fVisibility: private'
        
         myComment <- '
	     '.
    }
    {  'ModuleInfo: Module: small InitialContents: FollowSlot'
        
         postFileIn = ( |
            
            | resend.postFileIn.

            "throw away code strings for the little dinky doIts"
            memory quickCleanup.
            transporter moduleDictionary refill.
            scheduler start).
    }
    {  'Category: state\x7fModuleInfo: Module: small InitialContents: FollowSlot\x7fVisibility: private'
        
         savedTimestamp <- 29336.
    }
    | )


 '-- Sub parts'

 bootstrap read: 'allCore' From: 'core'



 '-- Side effects'

 globals modules small postFileIn
