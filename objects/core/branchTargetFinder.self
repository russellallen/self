 '$Revision: 30.4 $'
 '
Copyright 1992-2012 AUTHORS.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: system\x7fCategory: virtual machine interface\x7fCategory: bytecode interpreters\x7fModuleInfo: Module: branchTargetFinder InitialContents: FollowSlot\x7fVisibility: public'
        
         branchTargetFinder = bootstrap define: bootstrap stub -> 'globals' -> 'branchTargetFinder' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals abstractBytecodeInterpreter copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'branchTargetFinder' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals branchTargetFinder.

CopyDowns:
globals abstractBytecodeInterpreter. copy 
SlotsToOmit: parent.

'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'branchTargetFinder' -> () From: ( | {
         'ModuleInfo: Module: branchTargetFinder InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'branchTargetFinder' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals branchTargetFinder parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'branchTargetFinder' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: branchTargetFinder InitialContents: FollowSlot'
        
         copy = ( |
            | resend.copy targets: targets copy).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'branchTargetFinder' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: branchTargetFinder InitialContents: FollowSlot'
        
         indexedBranch: bc = ( |
            | 
            targets addAll: bc destinations.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'branchTargetFinder' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: branchTargetFinder InitialContents: FollowSlot\x7fVisibility: private'
        
         interpretMethod = ( |
            | 
            resend.interpretMethod.
            targets: targets asVector sort.
            targets).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'branchTargetFinder' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: branchTargetFinder InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'branchTargetFinder' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: branchTargetFinder InitialContents: FollowSlot'
        
         scalarBranch: bc = ( |
            | 
            targets add: bc destination).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'branchTargetFinder' -> () From: ( | {
         'ModuleInfo: Module: branchTargetFinder InitialContents: InitializeToExpression: (set copyRemoveAll)'
        
         targets <- set copyRemoveAll.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: branchTargetFinder InitialContents: FollowSlot'
        
         branchTargetFinder = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'branchTargetFinder' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'branchTargetFinder' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules branchTargetFinder.

CopyDowns:
globals modules init. copy 
SlotsToOmit: directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'branchTargetFinder' -> () From: ( | {
         'ModuleInfo: Module: branchTargetFinder InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'core'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'branchTargetFinder' -> () From: ( | {
         'ModuleInfo: Module: branchTargetFinder InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'branchTargetFinder' -> () From: ( | {
         'ModuleInfo: Module: branchTargetFinder InitialContents: FollowSlot'
        
         myComment <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'branchTargetFinder' -> () From: ( | {
         'ModuleInfo: Module: branchTargetFinder InitialContents: FollowSlot'
        
         postFileIn = ( |
            | resend.postFileIn).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'branchTargetFinder' -> () From: ( | {
         'ModuleInfo: Module: branchTargetFinder InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- '$Revision: 30.4 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'branchTargetFinder' -> () From: ( | {
         'ModuleInfo: Module: branchTargetFinder InitialContents: FollowSlot\x7fVisibility: private'
        
         subpartNames <- ''.
        } | ) 



 '-- Side effects'

 globals modules branchTargetFinder postFileIn
