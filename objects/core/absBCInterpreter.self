 '$Revision: 30.14 $'
 '
Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: system\x7fCategory: Virtual Machine interface\x7fCategory: bytecode interpreters\x7fModuleInfo: Module: absBCInterpreter InitialContents: FollowSlot\x7fVisibility: public'
        
         abstractBytecodeInterpreter = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals abstractBytecodeInterpreter.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> () From: ( | {
         'Category: abstractBytecodeInterpreter\x7fCategory: interbytecode state\x7fCategory: info for next send\x7fComment: of upcoming send\x7fModuleInfo: Module: absBCInterpreter InitialContents: InitializeToExpression: (0)'
        
         argumentCount <- 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> () From: ( | {
         'Category: abstractBytecodeInterpreter\x7fCategory: method state\x7fModuleInfo: Module: absBCInterpreter InitialContents: InitializeToExpression: (byteVector)'
        
         codes <- bootstrap stub -> 'globals' -> 'byteVector' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> () From: ( | {
         'Category: abstractBytecodeInterpreter\x7fCategory: interbytecode state\x7fCategory: info for next send\x7fComment: delegatee for next send, or \'\'\x7fModuleInfo: Module: absBCInterpreter InitialContents: InitializeToExpression: (\'\')'
        
         delegatee <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> () From: ( | {
         'Category: abstractBytecodeInterpreter\x7fCategory: interbytecode state\x7fComment: set by index code for extended indices\x7fModuleInfo: Module: absBCInterpreter InitialContents: InitializeToExpression: (0)'
        
         index <- 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> () From: ( | {
         'Category: abstractBytecodeInterpreter\x7fModuleInfo: Module: absBCInterpreter InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         instructionSet.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> () From: ( | {
         'Category: abstractBytecodeInterpreter\x7fCategory: interbytecode state\x7fCategory: info for next send\x7fComment: flag for upcoming send\x7fModuleInfo: Module: absBCInterpreter InitialContents: InitializeToExpression: (false)'
        
         isUndirectedResend <- bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> () From: ( | {
         'Category: abstractBytecodeInterpreter\x7fCategory: interbytecode state\x7fComment: set by literal code, used for setting delegatee]\x7fModuleInfo: Module: absBCInterpreter InitialContents: InitializeToExpression: (\'\')'
        
         lastLiteral <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> () From: ( | {
         'Category: abstractBytecodeInterpreter\x7fCategory: interbytecode state\x7fComment: set by lexical level code, used by local accessors\x7fModuleInfo: Module: absBCInterpreter InitialContents: InitializeToExpression: (0)'
        
         lexicalLevel <- 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> () From: ( | {
         'Category: abstractBytecodeInterpreter\x7fCategory: method state\x7fModuleInfo: Module: absBCInterpreter InitialContents: InitializeToExpression: (vector)'
        
         literals <- ((bootstrap stub -> 'globals') \/-> 'vector') -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> () From: ( | {
         'Category: abstractBytecodeInterpreter\x7fCategory: method state\x7fModuleInfo: Module: absBCInterpreter InitialContents: InitializeToExpression: (nil)'
        
         method.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> () From: ( | {
         'ModuleInfo: Module: absBCInterpreter InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals abstractBytecodeInterpreter parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> () From: ( | {
         'Category: interpreting particular codes, return bc by default\x7fModuleInfo: Module: absBCInterpreter InitialContents: FollowSlot'
        
         accessLocal: bc = ( |
            | 
            bc).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> () From: ( | {
         'Category: checking\x7fModuleInfo: Module: absBCInterpreter InitialContents: FollowSlot'
        
         areAssertionsEnabled = bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> () From: ( | {
         'Category: checking\x7fModuleInfo: Module: absBCInterpreter InitialContents: FollowSlot'
        
         assert: blk = ( |
            | 
            areAssertionsEnabled ifTrue: [blk assert].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> () From: ( | {
         'Category: interpreting general\x7fModuleInfo: Module: absBCInterpreter InitialContents: FollowSlot\x7fVisibility: private'
        
         bytecodeAt: i = ( |
             bc.
             proto.
            | 
            bc: codes byteAt: i IfAbsent: [^ nil].
            proto: (instructionSet opcodeNameOf: bc) sendTo: bytecodes. "could optimize"
            proto copyForInterpreter: self PC: i Code: bc).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> () From: ( | {
         'Category: helpers\x7fModuleInfo: Module: absBCInterpreter InitialContents: FollowSlot'
        
         bytecodes = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> 'bytecodes' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals abstractBytecodeInterpreter parent bytecodes.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> () From: ( | {
         'Category: checking\x7fModuleInfo: Module: absBCInterpreter InitialContents: FollowSlot'
        
         checkBranchTarget: t = ( |
            | 
            assert: [
                  (isInteger: t)
              && [(0 <= t)
              && [ t <= codes size]] "!= codes size means return".
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> () From: ( | {
         'Category: checking\x7fModuleInfo: Module: absBCInterpreter InitialContents: FollowSlot'
        
         checkNoArgumentCount = ( |
            | 
            isArgumentCountSet
              ifTrue: [^ error: 'argument count should not be set twice in a row'].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> () From: ( | {
         'Category: checking\x7fModuleInfo: Module: absBCInterpreter InitialContents: FollowSlot'
        
         checkNoIndex = ( |
            | 
            isIndexSet
              ifTrue: [^ error: 'this code does not use or preserve index'].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> () From: ( | {
         'Category: checking\x7fModuleInfo: Module: absBCInterpreter InitialContents: FollowSlot'
        
         checkNoLexicalLevel = ( |
            | 
            isLexicalLevelSet
              ifTrue: [^error: 'this code does not use or preserve lexical_level'].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> () From: ( | {
         'Category: checking\x7fModuleInfo: Module: absBCInterpreter InitialContents: FollowSlot'
        
         checkNoOperand = ( |
            | 
            checkNoIndex.
            checkNoLexicalLevel).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> () From: ( | {
         'Category: checking\x7fModuleInfo: Module: absBCInterpreter InitialContents: FollowSlot'
        
         checkNoSendModifiers = ( |
            | 
            isUndirectedResend || [isDelegateeSet]
              ifTrue: [ ^ error: 'send modifiers should be set right before the send'].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> () From: ( | {
         'Category: checking\x7fModuleInfo: Module: absBCInterpreter InitialContents: FollowSlot'
        
         checkNoTwoSendModifiers = ( |
            | 
            isUndirectedResend && [isDelegateeSet]
             ifTrue: [ ^ error: 'send cannot be both undirected and directed'].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> () From: ( | {
         'Category: interbytecode state\x7fCategory: consuming\x7fModuleInfo: Module: absBCInterpreter InitialContents: FollowSlot'
        
         consumeArgumentCount = ( |
             r.
            | 
            r: argumentCount.
            argumentCount: 0.
            r).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> () From: ( | {
         'Category: interbytecode state\x7fCategory: consuming\x7fModuleInfo: Module: absBCInterpreter InitialContents: FollowSlot'
        
         consumeDelegatee = ( |
             r.
            | 
            r: delegatee.
            delegatee: ''.
            r).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> () From: ( | {
         'Category: interbytecode state\x7fCategory: consuming\x7fModuleInfo: Module: absBCInterpreter InitialContents: FollowSlot'
        
         consumeIndex = ( |
             r.
            | 
            r: index.
            index: 0.
            r).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> () From: ( | {
         'Category: interbytecode state\x7fCategory: consuming\x7fModuleInfo: Module: absBCInterpreter InitialContents: FollowSlot'
        
         consumeIsUndirectedResend = ( |
             r.
            | 
            r: isUndirectedResend.
            isUndirectedResend: false.
            r).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> () From: ( | {
         'Category: interbytecode state\x7fCategory: consuming\x7fModuleInfo: Module: absBCInterpreter InitialContents: FollowSlot'
        
         consumeLexicalLevel = ( |
             r.
            | 
            r: lexicalLevel.
            lexicalLevel: 0.
            r).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> () From: ( | {
         'Category: copying\x7fModuleInfo: Module: absBCInterpreter InitialContents: FollowSlot\x7fVisibility: public'
        
         copyForCodes: c Literals: l = ( |
            | 
            copy initializeForCodes: c Literals: l).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> () From: ( | {
         'Category: copying\x7fModuleInfo: Module: absBCInterpreter InitialContents: FollowSlot\x7fVisibility: public'
        
         copyForMethod: mir = ( |
            | 
            copy initializeForMethod: mir).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> () From: ( | {
         'Category: copying\x7fModuleInfo: Module: absBCInterpreter InitialContents: FollowSlot\x7fVisibility: public'
        
         copyInterpretMethod: m = ( |
            | 
            (copyForMethod: m) interpretMethod).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> () From: ( | {
         'Category: copying\x7fModuleInfo: Module: absBCInterpreter InitialContents: FollowSlot\x7fVisibility: public'
        
         copyInterpretMethod: m To: lastPC = ( |
            | 
            (copyForMethod: m) interpretTo: lastPC).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> () From: ( | {
         'Category: copying\x7fModuleInfo: Module: absBCInterpreter InitialContents: FollowSlot\x7fVisibility: public'
        
         copyInterpretMethod: m UpTo: lastPC = ( |
            | 
            (copyForMethod: m) interpretUpTo: lastPC).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> () From: ( | {
         'Category: interpreting particular codes, return bc by default\x7fModuleInfo: Module: absBCInterpreter InitialContents: FollowSlot'
        
         indexedBranch: bc = ( |
            | 
            bc).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> () From: ( | {
         'Category: copying\x7fModuleInfo: Module: absBCInterpreter InitialContents: FollowSlot'
        
         initialize = ( |
            | 
            instructionSet: bytecodeFormat instructionSetForCodes: codes.
            pc: instructionSet firstBCI.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> () From: ( | {
         'Category: copying\x7fModuleInfo: Module: absBCInterpreter InitialContents: FollowSlot'
        
         initializeForCodes: c Literals: l = ( |
            | 
            codes: c.
            literals: l.
            initialize).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> () From: ( | {
         'Category: copying\x7fModuleInfo: Module: absBCInterpreter InitialContents: FollowSlot'
        
         initializeForMethod: m = ( |
            | 
            method:   m.
            initializeForCodes: m codes Literals: m literals).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> () From: ( | {
         'Category: interpreting general\x7fModuleInfo: Module: absBCInterpreter InitialContents: FollowSlot\x7fVisibility: private'
        
         interpret: aBytecode = ( |
            | 
            aBytecode interpret).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> () From: ( | {
         'Category: interpreting general\x7fModuleInfo: Module: absBCInterpreter InitialContents: FollowSlot\x7fVisibility: public'
        
         interpretBytecode = ( |
             b.
            | 
            b: peekAtNextBytecode.
            pc: pc succ.
            interpret: b).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> () From: ( | {
         'Category: interpreting general\x7fModuleInfo: Module: absBCInterpreter InitialContents: FollowSlot\x7fVisibility: public'
        
         interpretMethod = ( |
            | 
            interpretUpTo: codes size).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> () From: ( | {
         'Category: interpreting general\x7fComment: stop after doing finalPC\x7fModuleInfo: Module: absBCInterpreter InitialContents: FollowSlot\x7fVisibility: public'
        
         interpretTo: finalPC = ( |
            | 
            interpretUpTo: finalPC.
            interpretBytecode).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> () From: ( | {
         'Category: interpreting general\x7fComment: stop when about to do finalPC\x7fModuleInfo: Module: absBCInterpreter InitialContents: FollowSlot\x7fVisibility: public'
        
         interpretUpTo: finalPC = ( |
             r.
            | 
            [pc = finalPC] whileFalse: [r: interpretBytecode].
            r).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> () From: ( | {
         'Category: interbytecode state\x7fCategory: testing\x7fModuleInfo: Module: absBCInterpreter InitialContents: FollowSlot'
        
         isArgumentCountSet = ( |
            | 
            argumentCount != 0).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> () From: ( | {
         'Category: interbytecode state\x7fCategory: testing\x7fModuleInfo: Module: absBCInterpreter InitialContents: FollowSlot'
        
         isDelegateeSet = ( |
            | delegatee isEmpty not).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> () From: ( | {
         'Category: interbytecode state\x7fCategory: testing\x7fModuleInfo: Module: absBCInterpreter InitialContents: FollowSlot'
        
         isIndexSet = ( |
            | 
            index != 0).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> () From: ( | {
         'Category: checking\x7fModuleInfo: Module: absBCInterpreter InitialContents: FollowSlot\x7fVisibility: private'
        
         isInteger: t = ( |
            | 
            (reflect: t) isReflecteeInteger).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> () From: ( | {
         'Category: interbytecode state\x7fCategory: testing\x7fModuleInfo: Module: absBCInterpreter InitialContents: FollowSlot'
        
         isLexicalLevelSet = ( |
            | 
            lexicalLevel != 0).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> () From: ( | {
         'Category: helpers\x7fModuleInfo: Module: absBCInterpreter InitialContents: FollowSlot'
        
         literalAt: i = ( |
            | 
            literals at: i IfAbsent: [|:e| error: 'bad index']).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> () From: ( | {
         'Category: interpreting particular codes, return bc by default\x7fModuleInfo: Module: absBCInterpreter InitialContents: FollowSlot'
        
         nonlocalReturn: bc = ( |
            | 
            bc).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: absBCInterpreter InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'clonable' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> () From: ( | {
         'Category: interpreting general\x7fModuleInfo: Module: absBCInterpreter InitialContents: FollowSlot\x7fVisibility: private'
        
         peekAtNextBytecode = ( |
            | 
            bytecodeAt: pc).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> () From: ( | {
         'Category: interpreting particular codes, return bc by default\x7fModuleInfo: Module: absBCInterpreter InitialContents: FollowSlot'
        
         pop: bc = ( |
            | 
            bc).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> () From: ( | {
         'Category: interpreting particular codes, return bc by default\x7fModuleInfo: Module: absBCInterpreter InitialContents: FollowSlot'
        
         pushLiteral: bc = ( |
            | 
            bc).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> () From: ( | {
         'Category: interpreting particular codes, return bc by default\x7fModuleInfo: Module: absBCInterpreter InitialContents: FollowSlot'
        
         pushSelf: bc = ( |
            | 
            bc).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> () From: ( | {
         'Category: interpreting particular codes, return bc by default\x7fModuleInfo: Module: absBCInterpreter InitialContents: FollowSlot'
        
         scalarBranch: bc = ( |
            | 
            bc).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> () From: ( | {
         'Category: interpreting particular codes, return bc by default\x7fModuleInfo: Module: absBCInterpreter InitialContents: FollowSlot'
        
         send: bc = ( |
            | 
            bc).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> () From: ( | {
         'Category: abstractBytecodeInterpreter\x7fModuleInfo: Module: absBCInterpreter InitialContents: InitializeToExpression: (0)'
        
         pc <- 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: absBCInterpreter InitialContents: FollowSlot'
        
         absBCInterpreter = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'absBCInterpreter' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'absBCInterpreter' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules absBCInterpreter.

CopyDowns:
globals modules init. copy 
SlotsToOmit: directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'absBCInterpreter' -> () From: ( | {
         'ModuleInfo: Module: absBCInterpreter InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'core'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'absBCInterpreter' -> () From: ( | {
         'ModuleInfo: Module: absBCInterpreter InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'absBCInterpreter' -> () From: ( | {
         'ModuleInfo: Module: absBCInterpreter InitialContents: FollowSlot'
        
         myComment <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'absBCInterpreter' -> () From: ( | {
         'ModuleInfo: Module: absBCInterpreter InitialContents: FollowSlot'
        
         postFileIn = ( |
            | resend.postFileIn).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'absBCInterpreter' -> () From: ( | {
         'ModuleInfo: Module: absBCInterpreter InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- '$Revision: 30.14 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'absBCInterpreter' -> () From: ( | {
         'ModuleInfo: Module: absBCInterpreter InitialContents: FollowSlot\x7fVisibility: private'
        
         subpartNames <- 'absBCBytecodes
selectorFinder
methodDisassembler
branchTargetFinder
leafMethodTester
localAccessFinder
stackSizeInterp
'.
        } | ) 



 '-- Sub parts'

 bootstrap read: 'absBCBytecodes' From: 'core'
 bootstrap read: 'selectorFinder' From: 'core'
 bootstrap read: 'methodDisassembler' From: 'core'
 bootstrap read: 'branchTargetFinder' From: 'core'
 bootstrap read: 'leafMethodTester' From: 'core'
 bootstrap read: 'localAccessFinder' From: 'core'
 bootstrap read: 'stackSizeInterp' From: 'core'



 '-- Side effects'

 globals modules absBCInterpreter postFileIn
