 '$Revision: 30.7 $'
 '
Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: system\x7fCategory: Virtual Machine interface\x7fCategory: bytecode interpreters\x7fModuleInfo: Module: methodDisassembler InitialContents: FollowSlot\x7fVisibility: public'
        
         methodDisassembler = bootstrap define: bootstrap stub -> 'globals' -> 'methodDisassembler' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals abstractBytecodeInterpreter copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'methodDisassembler' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals methodDisassembler.

CopyDowns:
globals abstractBytecodeInterpreter. copy 
SlotsToOmit: parent.

'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'methodDisassembler' -> () From: ( | {
         'ModuleInfo: Module: methodDisassembler InitialContents: InitializeToExpression: (\'\')'
        
         disassembly <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'methodDisassembler' -> () From: ( | {
         'ModuleInfo: Module: methodDisassembler InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'methodDisassembler' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals methodDisassembler parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'methodDisassembler' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: methodDisassembler InitialContents: FollowSlot'
        
         initialize = ( |
            | 
            resend.initialize.
            setPCLen).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'methodDisassembler' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: methodDisassembler InitialContents: FollowSlot'
        
         interpret: b = ( |
             r.
            | 
            r: resend.interpret: b.
            b ignoreForDisassembly ifFalse: [
              disassembly: disassembly 
                 &  (b pc printStringPadWith: ' ' ToSize: pcLen )
                 &  ':  ' 
                 & (b opcodeForDisassembly)
                 & (b operandIfPresent: [|:o. m| 
                        m: reflect: o.
                        ' ', (m isComplete ifTrue: [o printString] False: [m name])
                      ]
                      IfAbsent: '').
              pc < codes size  ifTrue: [disassembly: disassembly & '\n'].
            ].
            r).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'methodDisassembler' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: methodDisassembler InitialContents: FollowSlot\x7fVisibility: private'
        
         interpretMethod = ( |
            | 
            resend.interpretMethod.
            disassembly: disassembly flatString.
            disassembly).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'methodDisassembler' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: methodDisassembler InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'methodDisassembler' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: methodDisassembler InitialContents: FollowSlot'
        
         setPCLen = ( |
            | 
            pcLen: codes size printString size).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'methodDisassembler' -> () From: ( | {
         'ModuleInfo: Module: methodDisassembler InitialContents: InitializeToExpression: (0)'
        
         pcLen <- 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: methodDisassembler InitialContents: FollowSlot'
        
         methodDisassembler = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'methodDisassembler' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'methodDisassembler' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules methodDisassembler.

CopyDowns:
globals modules init. copy 
SlotsToOmit: directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'methodDisassembler' -> () From: ( | {
         'ModuleInfo: Module: methodDisassembler InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'core'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'methodDisassembler' -> () From: ( | {
         'ModuleInfo: Module: methodDisassembler InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'methodDisassembler' -> () From: ( | {
         'ModuleInfo: Module: methodDisassembler InitialContents: FollowSlot'
        
         myComment <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'methodDisassembler' -> () From: ( | {
         'ModuleInfo: Module: methodDisassembler InitialContents: FollowSlot'
        
         postFileIn = ( |
            | resend.postFileIn).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'methodDisassembler' -> () From: ( | {
         'ModuleInfo: Module: methodDisassembler InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- '$Revision: 30.7 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'methodDisassembler' -> () From: ( | {
         'ModuleInfo: Module: methodDisassembler InitialContents: FollowSlot\x7fVisibility: private'
        
         subpartNames <- ''.
        } | ) 



 '-- Side effects'

 globals modules methodDisassembler postFileIn
