 '$Revision: 30.6 $'
 '
Copyright 1992-2012 AUTHORS.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: system\x7fCategory: Virtual Machine interface\x7fCategory: bytecode interpreters\x7fModuleInfo: Module: selectorFinder InitialContents: FollowSlot\x7fVisibility: public'
        
         selectorFinder = bootstrap define: bootstrap stub -> 'globals' -> 'selectorFinder' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals abstractBytecodeInterpreter copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'selectorFinder' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals selectorFinder.

CopyDowns:
globals abstractBytecodeInterpreter. copy 
SlotsToOmit: parent.

'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selectorFinder' -> () From: ( | {
         'ModuleInfo: Module: selectorFinder InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'selectorFinder' -> 'parent' -> () From: ( |
             {} = 'Comment: return a vector indexed by bci,
of selector sent or \'\'\x7fModuleInfo: Creator: globals selectorFinder parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selectorFinder' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: selectorFinder InitialContents: FollowSlot'
        
         initialize = ( |
            | 
            resend.initialize.
            selectors: selectors copySize: codes size FillingWith: '').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selectorFinder' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: selectorFinder InitialContents: FollowSlot'
        
         interpretBytecode = ( |
            | 
            resend.interpretBytecode.
            selectors).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selectorFinder' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: selectorFinder InitialContents: FollowSlot\x7fVisibility: private'
        
         isInterestedInSendBytecode: bc = ( |
            | 
            "Override in children if necessary."
            true).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selectorFinder' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: selectorFinder InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selectorFinder' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: selectorFinder InitialContents: FollowSlot\x7fVisibility: private'
        
         rememberSendBytecode: bc = ( |
            | 
            selectors at: bc pc Put: bc selector.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selectorFinder' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: selectorFinder InitialContents: FollowSlot'
        
         send: bc = ( |
            | 
            (isInterestedInSendBytecode: bc) ifTrue: [rememberSendBytecode: bc].
            resend.send: bc).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selectorFinder' -> () From: ( | {
         'ModuleInfo: Module: selectorFinder InitialContents: InitializeToExpression: (vector)'
        
         selectors <- ((bootstrap stub -> 'globals') \/-> 'vector') -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: system\x7fCategory: Virtual Machine interface\x7fCategory: bytecode interpreters\x7fModuleInfo: Module: selectorFinder InitialContents: FollowSlot\x7fVisibility: public'
        
         implicitSelfSendFinder = bootstrap define: bootstrap stub -> 'globals' -> 'implicitSelfSendFinder' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals selectorFinder copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'implicitSelfSendFinder' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals implicitSelfSendFinder.

CopyDowns:
globals selectorFinder. copy 
SlotsToOmit: parent.

'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'implicitSelfSendFinder' -> () From: ( | {
         'ModuleInfo: Module: selectorFinder InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'implicitSelfSendFinder' -> 'parent' -> () From: ( |
             {} = 'Comment: Like selectorFinder, but only for implicit-self
sends.\x7fModuleInfo: Creator: globals implicitSelfSendFinder parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'implicitSelfSendFinder' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: selectorFinder InitialContents: FollowSlot\x7fVisibility: private'
        
         isInterestedInSendBytecode: bc = ( |
            | 
            bc isSelfImplicit).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'implicitSelfSendFinder' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: selectorFinder InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'globals' -> 'selectorFinder' -> 'parent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: selectorFinder InitialContents: FollowSlot'
        
         selectorFinder = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'selectorFinder' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'selectorFinder' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules selectorFinder.

CopyDowns:
globals modules init. copy 
SlotsToOmit: directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'selectorFinder' -> () From: ( | {
         'ModuleInfo: Module: selectorFinder InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'core'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'selectorFinder' -> () From: ( | {
         'ModuleInfo: Module: selectorFinder InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'selectorFinder' -> () From: ( | {
         'ModuleInfo: Module: selectorFinder InitialContents: FollowSlot'
        
         myComment <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'selectorFinder' -> () From: ( | {
         'ModuleInfo: Module: selectorFinder InitialContents: FollowSlot'
        
         postFileIn = ( |
            | resend.postFileIn).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'selectorFinder' -> () From: ( | {
         'ModuleInfo: Module: selectorFinder InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- '$Revision: 30.6 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'selectorFinder' -> () From: ( | {
         'ModuleInfo: Module: selectorFinder InitialContents: FollowSlot\x7fVisibility: private'
        
         subpartNames <- ''.
        } | ) 



 '-- Side effects'

 globals modules selectorFinder postFileIn
