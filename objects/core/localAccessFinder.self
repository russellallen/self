 '$Revision: 1.2 $'
 '
Copyright 1992-2012 AUTHORS.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: system\x7fCategory: Virtual Machine interface\x7fCategory: bytecode interpreters\x7fModuleInfo: Module: localAccessFinder InitialContents: FollowSlot\x7fVisibility: public'
        
         localAccessFinder = bootstrap define: bootstrap stub -> 'globals' -> 'localAccessFinder' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals abstractBytecodeInterpreter copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'localAccessFinder' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals localAccessFinder.

CopyDowns:
globals abstractBytecodeInterpreter. copy 
SlotsToOmit: parent.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'localAccessFinder' -> () From: ( | {
         'ModuleInfo: Module: localAccessFinder InitialContents: InitializeToExpression: (set copyRemoveAll)\x7fVisibility: public'
        
         namesOfLocalsAccessed <- set copyRemoveAll.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'localAccessFinder' -> () From: ( | {
         'ModuleInfo: Module: localAccessFinder InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'localAccessFinder' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals localAccessFinder parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'localAccessFinder' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: localAccessFinder InitialContents: FollowSlot'
        
         accessLocal: bc = ( |
            | 
            namesOfLocalsAccessed add: bc selector.
            bc).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'localAccessFinder' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: localAccessFinder InitialContents: FollowSlot'
        
         initialize = ( |
            | 
            resend.initialize.
            namesOfLocalsAccessed: namesOfLocalsAccessed copyRemoveAll.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'localAccessFinder' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: localAccessFinder InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: localAccessFinder InitialContents: FollowSlot'
        
         localAccessFinder = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'localAccessFinder' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'localAccessFinder' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules localAccessFinder.

CopyDowns:
globals modules init. copy 
SlotsToOmit: directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'localAccessFinder' -> () From: ( | {
         'ModuleInfo: Module: localAccessFinder InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'core'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'localAccessFinder' -> () From: ( | {
         'ModuleInfo: Module: localAccessFinder InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'localAccessFinder' -> () From: ( | {
         'ModuleInfo: Module: localAccessFinder InitialContents: FollowSlot'
        
         myComment <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'localAccessFinder' -> () From: ( | {
         'ModuleInfo: Module: localAccessFinder InitialContents: FollowSlot'
        
         postFileIn = ( |
            | resend.postFileIn).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'localAccessFinder' -> () From: ( | {
         'ModuleInfo: Module: localAccessFinder InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- '$Revision: 1.2 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'localAccessFinder' -> () From: ( | {
         'ModuleInfo: Module: localAccessFinder InitialContents: FollowSlot\x7fVisibility: private'
        
         subpartNames <- ''.
        } | ) 



 '-- Side effects'

 globals modules localAccessFinder postFileIn
