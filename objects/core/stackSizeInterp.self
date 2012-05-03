 '$Revision: 1.3 $'
 '
Copyright 1992-2012 AUTHORS.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: stackSizeInterp InitialContents: FollowSlot'
        
         stackSizeInterp = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'stackSizeInterp' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'stackSizeInterp' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules stackSizeInterp.

CopyDowns:
globals modules init. copy 
SlotsToOmit: directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'stackSizeInterp' -> () From: ( | {
         'ModuleInfo: Module: stackSizeInterp InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'core'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'stackSizeInterp' -> () From: ( | {
         'ModuleInfo: Module: stackSizeInterp InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'stackSizeInterp' -> () From: ( | {
         'ModuleInfo: Module: stackSizeInterp InitialContents: FollowSlot'
        
         myComment <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'stackSizeInterp' -> () From: ( | {
         'ModuleInfo: Module: stackSizeInterp InitialContents: FollowSlot'
        
         postFileIn = ( |
            | resend.postFileIn).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'stackSizeInterp' -> () From: ( | {
         'ModuleInfo: Module: stackSizeInterp InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- '$Revision: 1.3 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'stackSizeInterp' -> () From: ( | {
         'ModuleInfo: Module: stackSizeInterp InitialContents: FollowSlot\x7fVisibility: private'
        
         subpartNames <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: system\x7fCategory: Virtual Machine interface\x7fCategory: bytecode interpreters\x7fModuleInfo: Module: stackSizeInterp InitialContents: FollowSlot\x7fVisibility: public'
        
         stackSizeInterpreter = bootstrap define: bootstrap stub -> 'globals' -> 'stackSizeInterpreter' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals abstractBytecodeInterpreter copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'stackSizeInterpreter' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals stackSizeInterpreter.

CopyDowns:
globals abstractBytecodeInterpreter. copy 
SlotsToOmit: parent.

'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'stackSizeInterpreter' -> () From: ( | {
         'ModuleInfo: Module: stackSizeInterp InitialContents: InitializeToExpression: (0)'
        
         maxStackDepth <- 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'stackSizeInterpreter' -> () From: ( | {
         'ModuleInfo: Module: stackSizeInterp InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'stackSizeInterpreter' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals stackSizeInterpreter parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'stackSizeInterpreter' -> 'parent' -> () From: ( | {
         'Category: interpreting particular codes, return bc by default\x7fModuleInfo: Module: stackSizeInterp InitialContents: FollowSlot'
        
         accessLocal: bc = ( |
            | 
            bc isRead ifTrue: [push].
            bc).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'stackSizeInterpreter' -> 'parent' -> () From: ( | {
         'Category: interpreting particular codes, return bc by default\x7fModuleInfo: Module: stackSizeInterp InitialContents: FollowSlot'
        
         indexedBranch: bc = ( |
            | 
            popStack. bc).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'stackSizeInterpreter' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: stackSizeInterp InitialContents: FollowSlot\x7fVisibility: private'
        
         interpretBytecode = ( |
            | 
            resend.interpretBytecode.
            maxStackDepth).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'stackSizeInterpreter' -> 'parent' -> () From: ( | {
         'Category: interpreting particular codes, return bc by default\x7fModuleInfo: Module: stackSizeInterp InitialContents: FollowSlot'
        
         nonlocalReturn: bc = ( |
            | 
            popStack. bc).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'stackSizeInterpreter' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: stackSizeInterp InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'stackSizeInterpreter' -> 'parent' -> () From: ( | {
         'Category: interpreting particular codes, return bc by default\x7fModuleInfo: Module: stackSizeInterp InitialContents: FollowSlot'
        
         pop: bc = ( |
            | popStack. bc).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'stackSizeInterpreter' -> 'parent' -> () From: ( | {
         'Category: stack manipulation\x7fModuleInfo: Module: stackSizeInterp InitialContents: FollowSlot\x7fVisibility: private'
        
         popStack = ( |
            | 
            popStack: 1).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'stackSizeInterpreter' -> 'parent' -> () From: ( | {
         'Category: stack manipulation\x7fModuleInfo: Module: stackSizeInterp InitialContents: FollowSlot\x7fVisibility: private'
        
         popStack: n = ( |
            | stackDepth: stackDepth - n).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'stackSizeInterpreter' -> 'parent' -> () From: ( | {
         'Category: stack manipulation\x7fModuleInfo: Module: stackSizeInterp InitialContents: FollowSlot\x7fVisibility: private'
        
         push = ( |
            | push: 1).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'stackSizeInterpreter' -> 'parent' -> () From: ( | {
         'Category: stack manipulation\x7fModuleInfo: Module: stackSizeInterp InitialContents: FollowSlot\x7fVisibility: private'
        
         push: n = ( |
            | stackDepth: stackDepth + n.
            maxStackDepth: stackDepth max: maxStackDepth).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'stackSizeInterpreter' -> 'parent' -> () From: ( | {
         'Category: interpreting particular codes, return bc by default\x7fModuleInfo: Module: stackSizeInterp InitialContents: FollowSlot'
        
         pushLiteral: bc = ( |
            | 
            push. bc).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'stackSizeInterpreter' -> 'parent' -> () From: ( | {
         'Category: interpreting particular codes, return bc by default\x7fModuleInfo: Module: stackSizeInterp InitialContents: FollowSlot'
        
         pushSelf: bc = ( |
            | 
            push. bc).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'stackSizeInterpreter' -> 'parent' -> () From: ( | {
         'Category: interpreting particular codes, return bc by default\x7fModuleInfo: Module: stackSizeInterp InitialContents: FollowSlot'
        
         scalarBranch: bc = ( |
            | 
            bc isConditional ifTrue: [popStack].
            bc).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'stackSizeInterpreter' -> 'parent' -> () From: ( | {
         'Category: interpreting particular codes, return bc by default\x7fModuleInfo: Module: stackSizeInterp InitialContents: FollowSlot'
        
         send: bc = ( |
            | 
            popStack: bc isSelfExplicit asInteger + bc argumentCount.
            push.
            bc).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'stackSizeInterpreter' -> () From: ( | {
         'ModuleInfo: Module: stackSizeInterp InitialContents: InitializeToExpression: (0)'
        
         stackDepth <- 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'method' -> () From: ( | {
         'Category: stack size\x7fModuleInfo: Module: stackSizeInterp InitialContents: FollowSlot\x7fVisibility: public'
        
         maxStackSize = ( |
            | 
            stackSizeInterpreter copyInterpretMethod: self).
        } | ) 



 '-- Side effects'

 globals modules stackSizeInterp postFileIn
