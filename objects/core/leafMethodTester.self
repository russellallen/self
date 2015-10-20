 '$Revision: 30.4 $'
 '
Copyright 1992-2012 AUTHORS.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: system\x7fCategory: virtual machine interface\x7fCategory: bytecode interpreters\x7fModuleInfo: Module: leafMethodTester InitialContents: FollowSlot\x7fVisibility: public'
        
         leafMethodTester = bootstrap define: bootstrap stub -> 'globals' -> 'leafMethodTester' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals abstractBytecodeInterpreter copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'leafMethodTester' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals leafMethodTester.

CopyDowns:
globals abstractBytecodeInterpreter. copy 
SlotsToOmit: parent.

'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'leafMethodTester' -> () From: ( | {
         'ModuleInfo: Module: leafMethodTester InitialContents: InitializeToExpression: (false)'
        
         foundSend <- bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'leafMethodTester' -> () From: ( | {
         'ModuleInfo: Module: leafMethodTester InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'leafMethodTester' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals leafMethodTester parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'leafMethodTester' -> 'parent' -> () From: ( | {
         'Category: interpreting general\x7fModuleInfo: Module: leafMethodTester InitialContents: FollowSlot\x7fVisibility: public'
        
         interpretMethod = ( |
            | 
            resend.interpretMethod.
            foundSend not).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'leafMethodTester' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: leafMethodTester InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'leafMethodTester' -> 'parent' -> () From: ( | {
         'Category: interpreting particular codes, return bc by default\x7fModuleInfo: Module: leafMethodTester InitialContents: FollowSlot'
        
         send: bc = ( |
            | 
            foundSend: true.
            pc: codes size.
            ^resend.send: bc).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: leafMethodTester InitialContents: FollowSlot'
        
         leafMethodTester = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'leafMethodTester' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'leafMethodTester' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules leafMethodTester.

CopyDowns:
globals modules init. copy 
SlotsToOmit: directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'leafMethodTester' -> () From: ( | {
         'ModuleInfo: Module: leafMethodTester InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'core'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'leafMethodTester' -> () From: ( | {
         'ModuleInfo: Module: leafMethodTester InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'leafMethodTester' -> () From: ( | {
         'ModuleInfo: Module: leafMethodTester InitialContents: FollowSlot'
        
         myComment <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'leafMethodTester' -> () From: ( | {
         'ModuleInfo: Module: leafMethodTester InitialContents: FollowSlot'
        
         postFileIn = ( |
            | resend.postFileIn).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'leafMethodTester' -> () From: ( | {
         'ModuleInfo: Module: leafMethodTester InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- '$Revision: 30.4 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'leafMethodTester' -> () From: ( | {
         'ModuleInfo: Module: leafMethodTester InitialContents: FollowSlot\x7fVisibility: private'
        
         subpartNames <- ''.
        } | ) 



 '-- Side effects'

 globals modules leafMethodTester postFileIn
