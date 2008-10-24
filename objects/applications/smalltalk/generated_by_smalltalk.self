 '$Revision: 30.6 $'
 '
Copyright 1992-2006 Sun Microsystems, Inc.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: generated_by_smalltalk InitialContents: FollowSlot'
        
         generated_by_smalltalk = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'generated_by_smalltalk' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'comment' From:
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'generated_by_smalltalk' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules generated_by_smalltalk.

CopyDowns:
globals modules init. copy 
SlotsToOmit: comment directory fileInTimeString postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'generated_by_smalltalk' -> () From: ( | {
         'ModuleInfo: Module: generated_by_smalltalk InitialContents: FollowSlot\x7fVisibility: public'
        
         comment <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'generated_by_smalltalk' -> () From: ( | {
         'ModuleInfo: Module: generated_by_smalltalk InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'applications/smalltalk'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'generated_by_smalltalk' -> () From: ( | {
         'ModuleInfo: Module: generated_by_smalltalk InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'generated_by_smalltalk' -> () From: ( | {
         'ModuleInfo: Module: generated_by_smalltalk InitialContents: FollowSlot'
        
         postFileIn = ( |
            | 
            transporter moduleDictionary resetFillingSemaphore.
            snapshotAction addSchedulerInitialMessage:  
              message copy receiver: transporter moduleDictionary
                           Selector: 'resetFillingSemaphore'.
            resend.postFileIn).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'generated_by_smalltalk' -> () From: ( | {
         'ModuleInfo: Module: generated_by_smalltalk InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- '$Revision: 30.6 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'generated_by_smalltalk' -> () From: ( | {
         'ModuleInfo: Module: generated_by_smalltalk InitialContents: FollowSlot\x7fVisibility: public'
        
         subpartNames <- ''.
        } | ) 



 '-- Side effects'

 globals modules generated_by_smalltalk postFileIn
