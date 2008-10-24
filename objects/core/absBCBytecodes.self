 '$Revision: 30.24 $'
 '
Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> 'bytecodes' -> () From: ( | {
         'ModuleInfo: Module: absBCBytecodes InitialContents: FollowSlot\x7fVisibility: private'
        
         abstract = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> 'bytecodes' -> 'abstract' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals abstractBytecodeInterpreter parent bytecodes abstract.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> 'bytecodes' -> 'abstract' -> () From: ( | {
         'ModuleInfo: Module: absBCBytecodes InitialContents: InitializeToExpression: (0)'
        
         bytecodeValue <- 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> 'bytecodes' -> 'abstract' -> () From: ( | {
         'ModuleInfo: Module: absBCBytecodes InitialContents: InitializeToExpression: (nil)'
        
         interpreter.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> 'bytecodes' -> 'abstract' -> () From: ( | {
         'ModuleInfo: Module: absBCBytecodes InitialContents: FollowSlot'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> 'bytecodes' -> 'abstract' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals abstractBytecodeInterpreter parent bytecodes abstract parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> 'bytecodes' -> 'abstract' -> 'parent' -> () From: ( | {
         'Category: asserting\x7fModuleInfo: Module: absBCBytecodes InitialContents: FollowSlot'
        
         assert: blk = ( |
            | 
            interpreter assert: blk.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> 'bytecodes' -> 'abstract' -> 'parent' -> () From: ( | {
         'Category: asserting\x7fModuleInfo: Module: absBCBytecodes InitialContents: FollowSlot'
        
         assertString: s = ( |
            | 
            assert: [(reflect: s) isReflecteeString]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> 'bytecodes' -> 'abstract' -> 'parent' -> () From: ( | {
         'Category: asserting\x7fModuleInfo: Module: absBCBytecodes InitialContents: FollowSlot'
        
         assertVector: v = ( |
            | 
            assert: [(reflect: v) isReflecteeVector]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> 'bytecodes' -> 'abstract' -> 'parent' -> () From: ( | {
         'Category: checks\x7fModuleInfo: Module: absBCBytecodes InitialContents: FollowSlot'
        
         checkAll = ( |
            | 
            checkWhateverSendModifiers.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> 'bytecodes' -> 'abstract' -> 'parent' -> () From: ( | {
         'Category: checks\x7fModuleInfo: Module: absBCBytecodes InitialContents: FollowSlot'
        
         checkAllIfAsserts = ( |
            | 
            assert: [checkAll. true]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> 'bytecodes' -> 'abstract' -> 'parent' -> () From: ( | {
         'Category: checks\x7fModuleInfo: Module: absBCBytecodes InitialContents: FollowSlot'
        
         checkWhateverSendModifiers = ( |
            | 
            interpreter checkNoSendModifiers.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> 'bytecodes' -> 'abstract' -> 'parent' -> () From: ( | {
         'Category: consuming parts\x7fModuleInfo: Module: absBCBytecodes InitialContents: FollowSlot'
        
         consumeIndex = ( |
            | 
            interpreter consumeIndex + indexValue).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> 'bytecodes' -> 'abstract' -> 'parent' -> () From: ( | {
         'Category: consuming parts\x7fModuleInfo: Module: absBCBytecodes InitialContents: FollowSlot\x7fVisibility: private'
        
         consumeLiteral = ( |
            | 
            interpreter literalAt: consumeIndex).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> 'bytecodes' -> 'abstract' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: absBCBytecodes InitialContents: FollowSlot\x7fVisibility: public'
        
         copyForInterpreter: i PC: x Code: bc = ( |
            | 
            ((copy
             interpreter: i)
             pc: x)
             bytecodeValue: bc).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> 'bytecodes' -> 'abstract' -> 'parent' -> () From: ( | {
         'Category: interpreting\x7fModuleInfo: Module: absBCBytecodes InitialContents: FollowSlot\x7fVisibility: private'
        
         doIt = ( |
            | 
            childMustImplement).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> 'bytecodes' -> 'abstract' -> 'parent' -> () From: ( | {
         'Category: testing\x7fModuleInfo: Module: absBCBytecodes InitialContents: FollowSlot\x7fVisibility: public'
        
         ignoreForDisassembly = bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> 'bytecodes' -> 'abstract' -> 'parent' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: absBCBytecodes InitialContents: FollowSlot'
        
         indexValue = ( |
            | bytecodeFormat indexOf: bytecodeValue).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> 'bytecodes' -> 'abstract' -> 'parent' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: absBCBytecodes InitialContents: FollowSlot'
        
         indexValue: i = ( |
            | 
            bytecodeValue: instructionSet bytecodeNamed: name Index: i.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> 'bytecodes' -> 'abstract' -> 'parent' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: absBCBytecodes InitialContents: FollowSlot\x7fVisibility: private'
        
         instructionSet = ( |
            | 
            interpreter instructionSet).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> 'bytecodes' -> 'abstract' -> 'parent' -> () From: ( | {
         'Category: interpreting\x7fModuleInfo: Module: absBCBytecodes InitialContents: FollowSlot\x7fVisibility: public'
        
         interpret = ( |
            | 
            checkAllIfAsserts.
            doIt).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> 'bytecodes' -> 'abstract' -> 'parent' -> () From: ( | {
         'Category: testing\x7fModuleInfo: Module: absBCBytecodes InitialContents: FollowSlot\x7fVisibility: public'
        
         isAPrefixCode = bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> 'bytecodes' -> 'abstract' -> 'parent' -> () From: ( | {
         'Category: testing\x7fModuleInfo: Module: absBCBytecodes InitialContents: FollowSlot\x7fVisibility: public'
        
         isBlockLiteral = bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> 'bytecodes' -> 'abstract' -> 'parent' -> () From: ( | {
         'Category: testing\x7fModuleInfo: Module: absBCBytecodes InitialContents: FollowSlot\x7fVisibility: public'
        
         isBranch = ( |
            | 
            isScalarBranch || [isIndexedBranch]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> 'bytecodes' -> 'abstract' -> 'parent' -> () From: ( | {
         'Category: testing\x7fModuleInfo: Module: absBCBytecodes InitialContents: FollowSlot\x7fVisibility: public'
        
         isIndexedBranch = bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> 'bytecodes' -> 'abstract' -> 'parent' -> () From: ( | {
         'Category: testing\x7fModuleInfo: Module: absBCBytecodes InitialContents: FollowSlot\x7fVisibility: public'
        
         isLiteral = bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> 'bytecodes' -> 'abstract' -> 'parent' -> () From: ( | {
         'Category: testing\x7fModuleInfo: Module: absBCBytecodes InitialContents: FollowSlot\x7fVisibility: public'
        
         isLocal = bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> 'bytecodes' -> 'abstract' -> 'parent' -> () From: ( | {
         'Category: testing\x7fModuleInfo: Module: absBCBytecodes InitialContents: FollowSlot\x7fVisibility: public'
        
         isPushSelf = bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> 'bytecodes' -> 'abstract' -> 'parent' -> () From: ( | {
         'Category: testing\x7fModuleInfo: Module: absBCBytecodes InitialContents: FollowSlot\x7fVisibility: public'
        
         isScalarBranch = bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> 'bytecodes' -> 'abstract' -> 'parent' -> () From: ( | {
         'Category: testing\x7fModuleInfo: Module: absBCBytecodes InitialContents: FollowSlot\x7fVisibility: public'
        
         isSend = bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> 'bytecodes' -> 'abstract' -> 'parent' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: absBCBytecodes InitialContents: FollowSlot'
        
         name = ( |
            | 
            asMirror creatorSlotHint name).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> 'bytecodes' -> 'abstract' -> 'parent' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: absBCBytecodes InitialContents: FollowSlot'
        
         opcodeForDisassembly = ( |
            | 
            instructionSet opcodeNameOf: bytecodeValue).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> 'bytecodes' -> 'abstract' -> 'parent' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: absBCBytecodes InitialContents: FollowSlot'
        
         operandIfPresent: pb IfAbsent: ab = ( |
            | 
            ab value).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> 'bytecodes' -> 'abstract' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: absBCBytecodes InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'clonable' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> 'bytecodes' -> 'abstract' -> 'parent' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: absBCBytecodes InitialContents: FollowSlot'
        
         popCount = 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> 'bytecodes' -> 'abstract' -> () From: ( | {
         'ModuleInfo: Module: absBCBytecodes InitialContents: InitializeToExpression: (0)'
        
         pc <- 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> 'bytecodes' -> () From: ( | {
         'Category: branches\x7fModuleInfo: Module: absBCBytecodes InitialContents: FollowSlot\x7fVisibility: private'
        
         abstractBranch = bootstrap define: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> 'bytecodes' -> 'abstractBranch' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals abstractBytecodeInterpreter parent bytecodes abstract copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> 'bytecodes' -> 'abstractBranch' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals abstractBytecodeInterpreter parent bytecodes abstractBranch.

CopyDowns:
globals abstractBytecodeInterpreter parent bytecodes abstract. copy 
SlotsToOmit: parent.

'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> 'bytecodes' -> 'abstractBranch' -> () From: ( | {
         'ModuleInfo: Module: absBCBytecodes InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> 'bytecodes' -> 'abstractBranch' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals abstractBytecodeInterpreter parent bytecodes abstractBranch parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> 'bytecodes' -> 'abstractBranch' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: absBCBytecodes InitialContents: FollowSlot'
        
         checkAll = ( |
            | 
            resend.checkAll.
            interpreter checkNoLexicalLevel.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> 'bytecodes' -> 'abstractBranch' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: absBCBytecodes InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> 'bytecodes' -> 'abstract' -> 'parent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> 'bytecodes' -> () From: ( | {
         'Category: locals\x7fModuleInfo: Module: absBCBytecodes InitialContents: FollowSlot\x7fVisibility: private'
        
         abstractLocal = bootstrap define: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> 'bytecodes' -> 'abstractLocal' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals abstractBytecodeInterpreter parent bytecodes abstract copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> 'bytecodes' -> 'abstractLocal' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals abstractBytecodeInterpreter parent bytecodes abstractLocal.

CopyDowns:
globals abstractBytecodeInterpreter parent bytecodes abstract. copy 
SlotsToOmit: parent.

'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> 'bytecodes' -> 'abstractLocal' -> () From: ( | {
         'ModuleInfo: Module: absBCBytecodes InitialContents: InitializeToExpression: (0)'
        
         indexOfLocal <- 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> 'bytecodes' -> 'abstractLocal' -> () From: ( | {
         'ModuleInfo: Module: absBCBytecodes InitialContents: InitializeToExpression: (0)'
        
         lexicalLevel <- 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> 'bytecodes' -> 'abstractLocal' -> () From: ( | {
         'ModuleInfo: Module: absBCBytecodes InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> 'bytecodes' -> 'abstractLocal' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals abstractBytecodeInterpreter parent bytecodes abstractLocal parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> 'bytecodes' -> 'abstractLocal' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: absBCBytecodes InitialContents: FollowSlot\x7fVisibility: private'
        
         doIt = ( |
            | 
            lexicalLevel: interpreter consumeLexicalLevel.
            indexOfLocal: consumeIndex.
            interpreter accessLocal: self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> 'bytecodes' -> 'abstractLocal' -> 'parent' -> () From: ( | {
         'Category: testing\x7fModuleInfo: Module: absBCBytecodes InitialContents: FollowSlot\x7fVisibility: public'
        
         isLocal = bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> 'bytecodes' -> 'abstractLocal' -> 'parent' -> () From: ( | {
         'Category: testing\x7fModuleInfo: Module: absBCBytecodes InitialContents: FollowSlot\x7fVisibility: public'
        
         isRead = ( |
            | isWrite not).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> 'bytecodes' -> 'abstractLocal' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: absBCBytecodes InitialContents: FollowSlot'
        
         operandIfPresent: pb IfAbsent: ab = ( |
            | 
            pb value: selector).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> 'bytecodes' -> 'abstractLocal' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: absBCBytecodes InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> 'bytecodes' -> 'abstract' -> 'parent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> 'bytecodes' -> 'abstractLocal' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: absBCBytecodes InitialContents: FollowSlot'
        
         selector = ( |
            | 
            childMustImplement).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> 'bytecodes' -> 'abstractLocal' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: absBCBytecodes InitialContents: FollowSlot'
        
         selectorIfNoMethod = ( |
            | 
            (lexicalLevel = 0
              ifTrue: ''
               False: ['lexicalLevel: ', lexicalLevel printString, ', '])
            ,
            'index: ', indexOfLocal printString).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> 'bytecodes' -> 'abstractLocal' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: absBCBytecodes InitialContents: FollowSlot'
        
         slot = ( |
            | 
            interpreter method localSlotLexicalLevel: lexicalLevel Index: indexOfLocal).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> 'bytecodes' -> () From: ( | {
         'Category: prefix codes\x7fModuleInfo: Module: absBCBytecodes InitialContents: FollowSlot\x7fVisibility: private'
        
         abstractPrefixCode = bootstrap define: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> 'bytecodes' -> 'abstractPrefixCode' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals abstractBytecodeInterpreter parent bytecodes abstract copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> 'bytecodes' -> 'abstractPrefixCode' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals abstractBytecodeInterpreter parent bytecodes abstractPrefixCode.

CopyDowns:
globals abstractBytecodeInterpreter parent bytecodes abstract. copy 
SlotsToOmit: parent.

'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> 'bytecodes' -> 'abstractPrefixCode' -> () From: ( | {
         'ModuleInfo: Module: absBCBytecodes InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> 'bytecodes' -> 'abstractPrefixCode' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals abstractBytecodeInterpreter parent bytecodes abstractPrefixCode parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> 'bytecodes' -> 'abstractPrefixCode' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: absBCBytecodes InitialContents: FollowSlot\x7fVisibility: public'
        
         isAPrefixCode = bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> 'bytecodes' -> 'abstractPrefixCode' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: absBCBytecodes InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> 'bytecodes' -> 'abstract' -> 'parent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> 'bytecodes' -> () From: ( | {
         'Category: branches\x7fModuleInfo: Module: absBCBytecodes InitialContents: FollowSlot\x7fVisibility: private'
        
         abstractScalarBranch = bootstrap define: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> 'bytecodes' -> 'abstractScalarBranch' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals abstractBytecodeInterpreter parent bytecodes abstractBranch copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> 'bytecodes' -> 'abstractScalarBranch' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals abstractBytecodeInterpreter parent bytecodes abstractScalarBranch.

CopyDowns:
globals abstractBytecodeInterpreter parent bytecodes abstractBranch. copy 
SlotsToOmit: parent.

'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> 'bytecodes' -> 'abstractScalarBranch' -> () From: ( | {
         'ModuleInfo: Module: absBCBytecodes InitialContents: InitializeToExpression: (0)'
        
         destination <- 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> 'bytecodes' -> 'abstractScalarBranch' -> () From: ( | {
         'ModuleInfo: Module: absBCBytecodes InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> 'bytecodes' -> 'abstractScalarBranch' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals abstractBytecodeInterpreter parent bytecodes abstractScalarBranch parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> 'bytecodes' -> 'abstractScalarBranch' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: absBCBytecodes InitialContents: FollowSlot\x7fVisibility: private'
        
         consumeBranchPC = ( |
             r.
            | 
            r: consumeLiteral.
            interpreter checkBranchTarget: r.
            r).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> 'bytecodes' -> 'abstractScalarBranch' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: absBCBytecodes InitialContents: FollowSlot\x7fVisibility: private'
        
         doIt = ( |
            | 
            destination: consumeBranchPC.
            interpreter scalarBranch: self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> 'bytecodes' -> 'abstractScalarBranch' -> 'parent' -> () From: ( | {
         'Category: testing\x7fModuleInfo: Module: absBCBytecodes InitialContents: FollowSlot'
        
         isConditional = bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> 'bytecodes' -> 'abstractScalarBranch' -> 'parent' -> () From: ( | {
         'Category: testing\x7fModuleInfo: Module: absBCBytecodes InitialContents: FollowSlot\x7fVisibility: public'
        
         isScalarBranch = bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> 'bytecodes' -> 'abstractScalarBranch' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: absBCBytecodes InitialContents: FollowSlot'
        
         operandIfPresent: pb IfAbsent: ab = ( |
            | 
            pb value: destination).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> 'bytecodes' -> 'abstractScalarBranch' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: absBCBytecodes InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> 'bytecodes' -> 'abstractBranch' -> 'parent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> 'bytecodes' -> 'abstractScalarBranch' -> 'parent' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: absBCBytecodes InitialContents: FollowSlot\x7fVisibility: public'
        
         popCount = 2.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> 'bytecodes' -> 'abstractScalarBranch' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: absBCBytecodes InitialContents: FollowSlot'
        
         valueToBranchOn = ( |
            | childResponsibility).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> 'bytecodes' -> () From: ( | {
         'Category: sends\x7fModuleInfo: Module: absBCBytecodes InitialContents: FollowSlot\x7fVisibility: private'
        
         abstractSend = bootstrap define: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> 'bytecodes' -> 'abstractSend' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals abstractBytecodeInterpreter parent bytecodes abstract copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> 'bytecodes' -> 'abstractSend' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals abstractBytecodeInterpreter parent bytecodes abstractSend.

CopyDowns:
globals abstractBytecodeInterpreter parent bytecodes abstract. copy 
SlotsToOmit: parent.

'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> 'bytecodes' -> 'abstractSend' -> () From: ( | {
         'ModuleInfo: Module: absBCBytecodes InitialContents: InitializeToExpression: (0)'
        
         argumentCount <- 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> 'bytecodes' -> 'abstractSend' -> () From: ( | {
         'ModuleInfo: Module: absBCBytecodes InitialContents: InitializeToExpression: (\'\')'
        
         delegatee <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> 'bytecodes' -> 'abstractSend' -> () From: ( | {
         'ModuleInfo: Module: absBCBytecodes InitialContents: InitializeToExpression: (false)'
        
         isUndirectedResend <- bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> 'bytecodes' -> 'abstractSend' -> () From: ( | {
         'ModuleInfo: Module: absBCBytecodes InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> 'bytecodes' -> 'abstractSend' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals abstractBytecodeInterpreter parent bytecodes abstractSend parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> 'bytecodes' -> 'abstractSend' -> 'parent' -> () From: ( | {
         'Category: transforming\x7fModuleInfo: Module: absBCBytecodes InitialContents: FollowSlot\x7fVisibility: public'
        
         asMessage = ( |
            | 
            message copy receiver: nil
                         Selector: selector
                             Type: messageType
                        Delegatee: delegatee
                     MethodHolder: nil
                        Arguments: vector copySize: argumentCount).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> 'bytecodes' -> 'abstractSend' -> 'parent' -> () From: ( | {
         'Category: checking\x7fModuleInfo: Module: absBCBytecodes InitialContents: FollowSlot\x7fVisibility: private'
        
         checkAll = ( |
            | 
            resend.checkAll.
            interpreter checkNoLexicalLevel.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> 'bytecodes' -> 'abstractSend' -> 'parent' -> () From: ( | {
         'Category: interpreting\x7fModuleInfo: Module: absBCBytecodes InitialContents: FollowSlot\x7fVisibility: private'
        
         doIt = ( |
            | 
            selector: consumeLiteral.
            assertString: selector.
            delegatee:          interpreter consumeDelegatee.
            isUndirectedResend: interpreter consumeIsUndirectedResend.
            argumentCount:      interpreter instructionSet includesArgumentCount
                                  ifTrue: [interpreter consumeArgumentCount]
                                   False: [selector           argumentCount].
            interpreter send: self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> 'bytecodes' -> 'abstractSend' -> 'parent' -> () From: ( | {
         'Category: testing\x7fModuleInfo: Module: absBCBytecodes InitialContents: FollowSlot\x7fVisibility: public'
        
         hasDelegatee = ( |
            | delegatee isEmpty not).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> 'bytecodes' -> 'abstractSend' -> 'parent' -> () From: ( | {
         'Category: testing\x7fComment: If this send is a _Perform:DelegatingTo: send, return true;
otherwise (if it\'s another kind of _Perform, or if it\'s
not a _Perform at all) return false. -- Adam, 5/05\x7fModuleInfo: Module: absBCBytecodes InitialContents: FollowSlot\x7fVisibility: public'
        
         isDelegatedPerform = ( |
            | 
            (globals selector copyStr: selector)
                 ifNormalPerform: false
                 IfResendPerform: false
              IfDelegatedPerform: true
                            Else: false).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> 'bytecodes' -> 'abstractSend' -> 'parent' -> () From: ( | {
         'Category: testing\x7fModuleInfo: Module: absBCBytecodes InitialContents: FollowSlot\x7fVisibility: public'
        
         isPrimitive = ( |
            | 
            '_' isPrefixOf: selector).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> 'bytecodes' -> 'abstractSend' -> 'parent' -> () From: ( | {
         'Category: testing\x7fModuleInfo: Module: absBCBytecodes InitialContents: FollowSlot\x7fVisibility: public'
        
         isResend = ( |
            | isUndirectedResend || [hasDelegatee]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> 'bytecodes' -> 'abstractSend' -> 'parent' -> () From: ( | {
         'Category: testing\x7fModuleInfo: Module: absBCBytecodes InitialContents: FollowSlot\x7fVisibility: public'
        
         isSelfExplicit = ( |
            | isSelfImplicit not).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> 'bytecodes' -> 'abstractSend' -> 'parent' -> () From: ( | {
         'Category: testing\x7fModuleInfo: Module: absBCBytecodes InitialContents: FollowSlot\x7fVisibility: public'
        
         isSelfImplicit = ( |
            | childResponsibility).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> 'bytecodes' -> 'abstractSend' -> 'parent' -> () From: ( | {
         'Category: testing\x7fModuleInfo: Module: absBCBytecodes InitialContents: FollowSlot\x7fVisibility: public'
        
         isSend = bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> 'bytecodes' -> 'abstractSend' -> 'parent' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: absBCBytecodes InitialContents: FollowSlot\x7fVisibility: private'
        
         messageType = ( |
            | 
            case
                 if: [hasDelegatee      ] Then: [message   directedResend type]
                 If: [isUndirectedResend] Then: [message undirectedResend type]
                 If: [isSelfImplicit    ] Then: [message     implicitSelf type]
                                          Else: [message           normal type]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> 'bytecodes' -> 'abstractSend' -> 'parent' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: absBCBytecodes InitialContents: FollowSlot\x7fVisibility: public'
        
         operandIfPresent: pb IfAbsent: ab = ( |
            | 
            pb value: selector).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> 'bytecodes' -> 'abstractSend' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: absBCBytecodes InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> 'bytecodes' -> 'abstract' -> 'parent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> 'bytecodes' -> 'abstractSend' -> 'parent' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: absBCBytecodes InitialContents: FollowSlot\x7fVisibility: public'
        
         popCount = ( |
            | 
            isSelfExplicit asInteger + argumentCount).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> 'bytecodes' -> 'abstractSend' -> () From: ( | {
         'ModuleInfo: Module: absBCBytecodes InitialContents: InitializeToExpression: (\'\')'
        
         selector <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> 'bytecodes' -> () From: ( | {
         'Category: prefix codes\x7fModuleInfo: Module: absBCBytecodes InitialContents: FollowSlot\x7fVisibility: public'
        
         argumentCount = bootstrap define: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> 'bytecodes' -> 'argumentCount' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals abstractBytecodeInterpreter parent bytecodes abstractPrefixCode copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> 'bytecodes' -> 'argumentCount' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals abstractBytecodeInterpreter parent bytecodes argumentCount.

CopyDowns:
globals abstractBytecodeInterpreter parent bytecodes abstractPrefixCode. copy 
SlotsToOmit: parent.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> 'bytecodes' -> 'argumentCount' -> () From: ( | {
         'ModuleInfo: Module: absBCBytecodes InitialContents: InitializeToExpression: (0)'
        
         argumentCount <- 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> 'bytecodes' -> 'argumentCount' -> () From: ( | {
         'ModuleInfo: Module: absBCBytecodes InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> 'bytecodes' -> 'argumentCount' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals abstractBytecodeInterpreter parent bytecodes argumentCount parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> 'bytecodes' -> 'argumentCount' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: absBCBytecodes InitialContents: FollowSlot'
        
         checkAll = ( |
            | 
            interpreter checkNoArgumentCount.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> 'bytecodes' -> 'argumentCount' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: absBCBytecodes InitialContents: FollowSlot\x7fVisibility: private'
        
         doIt = ( |
            | 
            argumentCount: consumeIndex.
            interpreter argumentCount: argumentCount).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> 'bytecodes' -> 'argumentCount' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: absBCBytecodes InitialContents: FollowSlot'
        
         operandIfPresent: pb IfAbsent: ab = ( |
            | 
            pb value: argumentCount).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> 'bytecodes' -> 'argumentCount' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: absBCBytecodes InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> 'bytecodes' -> 'abstractPrefixCode' -> 'parent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> 'bytecodes' -> () From: ( | {
         'Category: branches\x7fModuleInfo: Module: absBCBytecodes InitialContents: FollowSlot\x7fVisibility: public'
        
         branchAlways = bootstrap define: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> 'bytecodes' -> 'branchAlways' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals abstractBytecodeInterpreter parent bytecodes abstractScalarBranch copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> 'bytecodes' -> 'branchAlways' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals abstractBytecodeInterpreter parent bytecodes branchAlways.

CopyDowns:
globals abstractBytecodeInterpreter parent bytecodes abstractScalarBranch. copy 
SlotsToOmit: parent.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> 'bytecodes' -> 'branchAlways' -> () From: ( | {
         'ModuleInfo: Module: absBCBytecodes InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> 'bytecodes' -> 'branchAlways' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals abstractBytecodeInterpreter parent bytecodes branchAlways parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> 'bytecodes' -> 'branchAlways' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: absBCBytecodes InitialContents: FollowSlot'
        
         isConditional = bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> 'bytecodes' -> 'branchAlways' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: absBCBytecodes InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> 'bytecodes' -> 'abstractScalarBranch' -> 'parent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> 'bytecodes' -> 'branchAlways' -> 'parent' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: absBCBytecodes InitialContents: FollowSlot\x7fVisibility: public'
        
         popCount = 1.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> 'bytecodes' -> () From: ( | {
         'Category: branches\x7fModuleInfo: Module: absBCBytecodes InitialContents: FollowSlot\x7fVisibility: public'
        
         branchIfFalse = bootstrap define: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> 'bytecodes' -> 'branchIfFalse' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals abstractBytecodeInterpreter parent bytecodes abstractScalarBranch copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> 'bytecodes' -> 'branchIfFalse' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals abstractBytecodeInterpreter parent bytecodes branchIfFalse.

CopyDowns:
globals abstractBytecodeInterpreter parent bytecodes abstractScalarBranch. copy 
SlotsToOmit: parent.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> 'bytecodes' -> 'branchIfFalse' -> () From: ( | {
         'ModuleInfo: Module: absBCBytecodes InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> 'bytecodes' -> 'branchIfFalse' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals abstractBytecodeInterpreter parent bytecodes branchIfFalse parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> 'bytecodes' -> 'branchIfFalse' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: absBCBytecodes InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> 'bytecodes' -> 'abstractScalarBranch' -> 'parent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> 'bytecodes' -> 'branchIfFalse' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: absBCBytecodes InitialContents: FollowSlot'
        
         valueToBranchOn = bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> 'bytecodes' -> () From: ( | {
         'Category: branches\x7fModuleInfo: Module: absBCBytecodes InitialContents: FollowSlot\x7fVisibility: public'
        
         branchIfTrue = bootstrap define: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> 'bytecodes' -> 'branchIfTrue' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals abstractBytecodeInterpreter parent bytecodes abstractScalarBranch copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> 'bytecodes' -> 'branchIfTrue' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals abstractBytecodeInterpreter parent bytecodes branchIfTrue.

CopyDowns:
globals abstractBytecodeInterpreter parent bytecodes abstractScalarBranch. copy 
SlotsToOmit: parent.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> 'bytecodes' -> 'branchIfTrue' -> () From: ( | {
         'ModuleInfo: Module: absBCBytecodes InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> 'bytecodes' -> 'branchIfTrue' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals abstractBytecodeInterpreter parent bytecodes branchIfTrue parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> 'bytecodes' -> 'branchIfTrue' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: absBCBytecodes InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> 'bytecodes' -> 'abstractScalarBranch' -> 'parent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> 'bytecodes' -> 'branchIfTrue' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: absBCBytecodes InitialContents: FollowSlot'
        
         valueToBranchOn = bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> 'bytecodes' -> () From: ( | {
         'Category: branches\x7fModuleInfo: Module: absBCBytecodes InitialContents: FollowSlot\x7fVisibility: public'
        
         branchIndexed = bootstrap define: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> 'bytecodes' -> 'branchIndexed' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals abstractBytecodeInterpreter parent bytecodes abstractBranch copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> 'bytecodes' -> 'branchIndexed' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals abstractBytecodeInterpreter parent bytecodes branchIndexed.

CopyDowns:
globals abstractBytecodeInterpreter parent bytecodes abstractBranch. copy 
SlotsToOmit: parent.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> 'bytecodes' -> 'branchIndexed' -> () From: ( | {
         'ModuleInfo: Module: absBCBytecodes InitialContents: InitializeToExpression: (vector)'
        
         destinations <- ((bootstrap stub -> 'globals') \/-> 'vector') -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> 'bytecodes' -> 'branchIndexed' -> () From: ( | {
         'ModuleInfo: Module: absBCBytecodes InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> 'bytecodes' -> 'branchIndexed' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals abstractBytecodeInterpreter parent bytecodes branchIndexed parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> 'bytecodes' -> 'branchIndexed' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: absBCBytecodes InitialContents: FollowSlot'
        
         checkBranchVector: v = ( |
            | 
            assertVector: v.
            assert: [
              v do: [|:t| interpreter checkBranchTarget: t].
              true
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> 'bytecodes' -> 'branchIndexed' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: absBCBytecodes InitialContents: FollowSlot\x7fVisibility: private'
        
         consumeBranchVector = ( |
             p.
            | 
            p: consumeLiteral.
            checkBranchVector: p.
            p).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> 'bytecodes' -> 'branchIndexed' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: absBCBytecodes InitialContents: FollowSlot\x7fVisibility: private'
        
         doIt = ( |
            | 
            destinations: consumeBranchVector.
            interpreter indexedBranch: self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> 'bytecodes' -> 'branchIndexed' -> 'parent' -> () From: ( | {
         'Category: testing\x7fModuleInfo: Module: absBCBytecodes InitialContents: FollowSlot\x7fVisibility: public'
        
         isIndexedBranch = bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> 'bytecodes' -> 'branchIndexed' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: absBCBytecodes InitialContents: FollowSlot'
        
         operandIfPresent: pb IfAbsent: ab = ( |
            | 
            pb value: destinations).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> 'bytecodes' -> 'branchIndexed' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: absBCBytecodes InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> 'bytecodes' -> 'abstractBranch' -> 'parent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> 'bytecodes' -> 'branchIndexed' -> 'parent' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: absBCBytecodes InitialContents: FollowSlot\x7fVisibility: public'
        
         popCount = 2.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> 'bytecodes' -> () From: ( | {
         'Category: prefix codes\x7fModuleInfo: Module: absBCBytecodes InitialContents: FollowSlot\x7fVisibility: public'
        
         delegatee = bootstrap define: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> 'bytecodes' -> 'delegatee' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals abstractBytecodeInterpreter parent bytecodes abstractPrefixCode copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> 'bytecodes' -> 'delegatee' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals abstractBytecodeInterpreter parent bytecodes delegatee.

CopyDowns:
globals abstractBytecodeInterpreter parent bytecodes abstractPrefixCode. copy 
SlotsToOmit: parent.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> 'bytecodes' -> 'delegatee' -> () From: ( | {
         'ModuleInfo: Module: absBCBytecodes InitialContents: InitializeToExpression: (\'\')'
        
         delegatee <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> 'bytecodes' -> 'delegatee' -> () From: ( | {
         'ModuleInfo: Module: absBCBytecodes InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> 'bytecodes' -> 'delegatee' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals abstractBytecodeInterpreter parent bytecodes delegatee parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> 'bytecodes' -> 'delegatee' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: absBCBytecodes InitialContents: FollowSlot\x7fVisibility: private'
        
         doIt = ( |
            | 
            delegatee: consumeLiteral.
            assertString: delegatee.
            interpreter delegatee: delegatee).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> 'bytecodes' -> 'delegatee' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: absBCBytecodes InitialContents: FollowSlot'
        
         operandIfPresent: pb IfAbsent: ab = ( |
            | 
            pb value: delegatee).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> 'bytecodes' -> 'delegatee' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: absBCBytecodes InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> 'bytecodes' -> 'abstractPrefixCode' -> 'parent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> 'bytecodes' -> () From: ( | {
         'Category: sends\x7fModuleInfo: Module: absBCBytecodes InitialContents: FollowSlot\x7fVisibility: public'
        
         implicitSelfSend = bootstrap define: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> 'bytecodes' -> 'implicitSelfSend' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals abstractBytecodeInterpreter parent bytecodes abstractSend copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> 'bytecodes' -> 'implicitSelfSend' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals abstractBytecodeInterpreter parent bytecodes implicitSelfSend.

CopyDowns:
globals abstractBytecodeInterpreter parent bytecodes abstractSend. copy 
SlotsToOmit: parent.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> 'bytecodes' -> 'implicitSelfSend' -> () From: ( | {
         'ModuleInfo: Module: absBCBytecodes InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> 'bytecodes' -> 'implicitSelfSend' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals abstractBytecodeInterpreter parent bytecodes implicitSelfSend parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> 'bytecodes' -> 'implicitSelfSend' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: absBCBytecodes InitialContents: FollowSlot'
        
         checkWhateverSendModifiers = ( |
            | 
            interpreter checkNoTwoSendModifiers.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> 'bytecodes' -> 'implicitSelfSend' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: absBCBytecodes InitialContents: FollowSlot'
        
         isSelfImplicit = bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> 'bytecodes' -> 'implicitSelfSend' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: absBCBytecodes InitialContents: FollowSlot'
        
         opcodeForDisassembly = ( |
            | 
            isUndirectedResend ifTrue: 'undirectedResend'
                                False: [resend.opcodeForDisassembly]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> 'bytecodes' -> 'implicitSelfSend' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: absBCBytecodes InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> 'bytecodes' -> 'abstractSend' -> 'parent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> 'bytecodes' -> () From: ( | {
         'Category: prefix codes\x7fModuleInfo: Module: absBCBytecodes InitialContents: FollowSlot\x7fVisibility: public'
        
         index = bootstrap define: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> 'bytecodes' -> 'index' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals abstractBytecodeInterpreter parent bytecodes abstractPrefixCode copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> 'bytecodes' -> 'index' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals abstractBytecodeInterpreter parent bytecodes index.

CopyDowns:
globals abstractBytecodeInterpreter parent bytecodes abstractPrefixCode. copy 
SlotsToOmit: parent.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> 'bytecodes' -> 'index' -> () From: ( | {
         'ModuleInfo: Module: absBCBytecodes InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> 'bytecodes' -> 'index' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals abstractBytecodeInterpreter parent bytecodes index parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> 'bytecodes' -> 'index' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: absBCBytecodes InitialContents: FollowSlot'
        
         checkAll = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> 'bytecodes' -> 'index' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: absBCBytecodes InitialContents: FollowSlot\x7fVisibility: private'
        
         doIt = ( |
            | 
            interpreter index: 
              (interpreter index + indexValue)
                << bytecodeFormat indexBitSize).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> 'bytecodes' -> 'index' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: absBCBytecodes InitialContents: FollowSlot'
        
         ignoreForDisassembly = bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> 'bytecodes' -> 'index' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: absBCBytecodes InitialContents: FollowSlot'
        
         operandIfPresent: pb IfAbsent: ab = ( |
            | 
            pb value: indexValue).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> 'bytecodes' -> 'index' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: absBCBytecodes InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> 'bytecodes' -> 'abstractPrefixCode' -> 'parent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> 'bytecodes' -> () From: ( | {
         'Category: prefix codes\x7fModuleInfo: Module: absBCBytecodes InitialContents: FollowSlot\x7fVisibility: public'
        
         lexicalLevel = bootstrap define: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> 'bytecodes' -> 'lexicalLevel' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals abstractBytecodeInterpreter parent bytecodes abstractPrefixCode copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> 'bytecodes' -> 'lexicalLevel' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals abstractBytecodeInterpreter parent bytecodes lexicalLevel.

CopyDowns:
globals abstractBytecodeInterpreter parent bytecodes abstractPrefixCode. copy 
SlotsToOmit: parent.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> 'bytecodes' -> 'lexicalLevel' -> () From: ( | {
         'ModuleInfo: Module: absBCBytecodes InitialContents: InitializeToExpression: (0)'
        
         lexicalLevel <- 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> 'bytecodes' -> 'lexicalLevel' -> () From: ( | {
         'ModuleInfo: Module: absBCBytecodes InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> 'bytecodes' -> 'lexicalLevel' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals abstractBytecodeInterpreter parent bytecodes lexicalLevel parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> 'bytecodes' -> 'lexicalLevel' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: absBCBytecodes InitialContents: FollowSlot\x7fVisibility: private'
        
         doIt = ( |
            | 
            lexicalLevel: consumeIndex.
            interpreter lexicalLevel: lexicalLevel).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> 'bytecodes' -> 'lexicalLevel' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: absBCBytecodes InitialContents: FollowSlot'
        
         ignoreForDisassembly = bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> 'bytecodes' -> 'lexicalLevel' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: absBCBytecodes InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> 'bytecodes' -> 'abstractPrefixCode' -> 'parent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> 'bytecodes' -> () From: ( | {
         'Category: pushes\x7fModuleInfo: Module: absBCBytecodes InitialContents: FollowSlot\x7fVisibility: public'
        
         literal = bootstrap define: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> 'bytecodes' -> 'literal' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals abstractBytecodeInterpreter parent bytecodes abstract copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> 'bytecodes' -> 'literal' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals abstractBytecodeInterpreter parent bytecodes literal.

CopyDowns:
globals abstractBytecodeInterpreter parent bytecodes abstract. copy 
SlotsToOmit: parent.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> 'bytecodes' -> 'literal' -> () From: ( | {
         'ModuleInfo: Module: absBCBytecodes InitialContents: InitializeToExpression: (nil)'
        
         oopToPush.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> 'bytecodes' -> 'literal' -> () From: ( | {
         'ModuleInfo: Module: absBCBytecodes InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> 'bytecodes' -> 'literal' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals abstractBytecodeInterpreter parent bytecodes literal parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> 'bytecodes' -> 'literal' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: absBCBytecodes InitialContents: FollowSlot\x7fVisibility: private'
        
         doIt = ( |
            | 
            oopToPush: consumeLiteral.
            interpreter pushLiteral: self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> 'bytecodes' -> 'literal' -> 'parent' -> () From: ( | {
         'Category: testing\x7fModuleInfo: Module: absBCBytecodes InitialContents: FollowSlot\x7fVisibility: public'
        
         isBlockLiteral = ( |
            | 
            (reflect: oopToPush) isReflecteeBlock).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> 'bytecodes' -> 'literal' -> 'parent' -> () From: ( | {
         'Category: testing\x7fModuleInfo: Module: absBCBytecodes InitialContents: FollowSlot\x7fVisibility: public'
        
         isLiteral = bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> 'bytecodes' -> 'literal' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: absBCBytecodes InitialContents: FollowSlot'
        
         operandIfPresent: pb IfAbsent: ab = ( |
            | 
            pb value: oopToPush).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> 'bytecodes' -> 'literal' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: absBCBytecodes InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> 'bytecodes' -> 'abstract' -> 'parent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> 'bytecodes' -> () From: ( | {
         'ModuleInfo: Module: absBCBytecodes InitialContents: FollowSlot\x7fVisibility: public'
        
         nonlocalReturn = bootstrap define: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> 'bytecodes' -> 'nonlocalReturn' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals abstractBytecodeInterpreter parent bytecodes abstract copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> 'bytecodes' -> 'nonlocalReturn' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals abstractBytecodeInterpreter parent bytecodes nonlocalReturn.

CopyDowns:
globals abstractBytecodeInterpreter parent bytecodes abstract. copy 
SlotsToOmit: parent.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> 'bytecodes' -> 'nonlocalReturn' -> () From: ( | {
         'ModuleInfo: Module: absBCBytecodes InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> 'bytecodes' -> 'nonlocalReturn' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals abstractBytecodeInterpreter parent bytecodes nonlocalReturn parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> 'bytecodes' -> 'nonlocalReturn' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: absBCBytecodes InitialContents: FollowSlot'
        
         checkAll = ( |
            | 
            resend.checkAll.
            interpreter checkNoOperand.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> 'bytecodes' -> 'nonlocalReturn' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: absBCBytecodes InitialContents: FollowSlot\x7fVisibility: private'
        
         doIt = ( |
            | 
            interpreter nonlocalReturn: self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> 'bytecodes' -> 'nonlocalReturn' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: absBCBytecodes InitialContents: FollowSlot\x7fVisibility: public'
        
         isExtended = bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> 'bytecodes' -> 'nonlocalReturn' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: absBCBytecodes InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> 'bytecodes' -> 'abstract' -> 'parent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> 'bytecodes' -> () From: ( | {
         'ModuleInfo: Module: absBCBytecodes InitialContents: FollowSlot\x7fVisibility: public'
        
         pop = bootstrap define: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> 'bytecodes' -> 'pop' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals abstractBytecodeInterpreter parent bytecodes abstract copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> 'bytecodes' -> 'pop' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals abstractBytecodeInterpreter parent bytecodes pop.

CopyDowns:
globals abstractBytecodeInterpreter parent bytecodes abstract. copy 
SlotsToOmit: parent.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> 'bytecodes' -> 'pop' -> () From: ( | {
         'ModuleInfo: Module: absBCBytecodes InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> 'bytecodes' -> 'pop' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals abstractBytecodeInterpreter parent bytecodes pop parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> 'bytecodes' -> 'pop' -> 'parent' -> () From: ( | {
         'Category: checks\x7fModuleInfo: Module: absBCBytecodes InitialContents: FollowSlot'
        
         checkAll = ( |
            | 
            resend.checkAll.
            interpreter checkNoOperand.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> 'bytecodes' -> 'pop' -> 'parent' -> () From: ( | {
         'Category: interpreting\x7fModuleInfo: Module: absBCBytecodes InitialContents: FollowSlot\x7fVisibility: private'
        
         doIt = ( |
            | 
            interpreter pop: self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> 'bytecodes' -> 'pop' -> 'parent' -> () From: ( | {
         'Category: testing\x7fModuleInfo: Module: absBCBytecodes InitialContents: FollowSlot\x7fVisibility: public'
        
         isExtended = bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> 'bytecodes' -> 'pop' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: absBCBytecodes InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> 'bytecodes' -> 'abstract' -> 'parent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> 'bytecodes' -> 'pop' -> 'parent' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: absBCBytecodes InitialContents: FollowSlot\x7fVisibility: public'
        
         popCount = 1.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> 'bytecodes' -> () From: ( | {
         'Category: pushes\x7fModuleInfo: Module: absBCBytecodes InitialContents: FollowSlot\x7fVisibility: public'
        
         pushSelf = bootstrap define: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> 'bytecodes' -> 'pushSelf' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals abstractBytecodeInterpreter parent bytecodes abstract copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> 'bytecodes' -> 'pushSelf' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals abstractBytecodeInterpreter parent bytecodes pushSelf.

CopyDowns:
globals abstractBytecodeInterpreter parent bytecodes abstract. copy 
SlotsToOmit: parent.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> 'bytecodes' -> 'pushSelf' -> () From: ( | {
         'ModuleInfo: Module: absBCBytecodes InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> 'bytecodes' -> 'pushSelf' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals abstractBytecodeInterpreter parent bytecodes pushSelf parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> 'bytecodes' -> 'pushSelf' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: absBCBytecodes InitialContents: FollowSlot'
        
         checkAll = ( |
            | 
            resend.checkAll.
            interpreter checkNoOperand.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> 'bytecodes' -> 'pushSelf' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: absBCBytecodes InitialContents: FollowSlot\x7fVisibility: private'
        
         doIt = ( |
            | 
            interpreter pushSelf: self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> 'bytecodes' -> 'pushSelf' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: absBCBytecodes InitialContents: FollowSlot\x7fVisibility: public'
        
         isExtended = bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> 'bytecodes' -> 'pushSelf' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: absBCBytecodes InitialContents: FollowSlot\x7fVisibility: public'
        
         isPushSelf = bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> 'bytecodes' -> 'pushSelf' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: absBCBytecodes InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> 'bytecodes' -> 'abstract' -> 'parent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> 'bytecodes' -> () From: ( | {
         'Category: locals\x7fModuleInfo: Module: absBCBytecodes InitialContents: FollowSlot\x7fVisibility: public'
        
         readLocal = bootstrap define: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> 'bytecodes' -> 'readLocal' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals abstractBytecodeInterpreter parent bytecodes abstractLocal copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> 'bytecodes' -> 'readLocal' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals abstractBytecodeInterpreter parent bytecodes readLocal.

CopyDowns:
globals abstractBytecodeInterpreter parent bytecodes abstractLocal. copy 
SlotsToOmit: parent.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> 'bytecodes' -> 'readLocal' -> () From: ( | {
         'ModuleInfo: Module: absBCBytecodes InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> 'bytecodes' -> 'readLocal' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals abstractBytecodeInterpreter parent bytecodes readLocal parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> 'bytecodes' -> 'readLocal' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: absBCBytecodes InitialContents: FollowSlot'
        
         isWrite = bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> 'bytecodes' -> 'readLocal' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: absBCBytecodes InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> 'bytecodes' -> 'abstractLocal' -> 'parent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> 'bytecodes' -> 'readLocal' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: absBCBytecodes InitialContents: FollowSlot'
        
         selector = ( |
            | 
            interpreter method 
              ifNil:    [selectorIfNoMethod]
              IfNotNil: [|:m|
                m localReadSelectorLexicalLevel: lexicalLevel
                                          Index: indexOfLocal]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> 'bytecodes' -> () From: ( | {
         'Category: sends\x7fModuleInfo: Module: absBCBytecodes InitialContents: FollowSlot\x7fVisibility: public'
        
         send = bootstrap define: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> 'bytecodes' -> 'send' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals abstractBytecodeInterpreter parent bytecodes abstractSend copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> 'bytecodes' -> 'send' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals abstractBytecodeInterpreter parent bytecodes send.

CopyDowns:
globals abstractBytecodeInterpreter parent bytecodes abstractSend. copy 
SlotsToOmit: parent.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> 'bytecodes' -> 'send' -> () From: ( | {
         'ModuleInfo: Module: absBCBytecodes InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> 'bytecodes' -> 'send' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals abstractBytecodeInterpreter parent bytecodes send parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> 'bytecodes' -> 'send' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: absBCBytecodes InitialContents: FollowSlot'
        
         isSelfImplicit = bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> 'bytecodes' -> 'send' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: absBCBytecodes InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> 'bytecodes' -> 'abstractSend' -> 'parent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> 'bytecodes' -> () From: ( | {
         'Category: prefix codes\x7fModuleInfo: Module: absBCBytecodes InitialContents: FollowSlot\x7fVisibility: public'
        
         undirectedResend = bootstrap define: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> 'bytecodes' -> 'undirectedResend' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals abstractBytecodeInterpreter parent bytecodes abstractPrefixCode copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> 'bytecodes' -> 'undirectedResend' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals abstractBytecodeInterpreter parent bytecodes undirectedResend.

CopyDowns:
globals abstractBytecodeInterpreter parent bytecodes abstractPrefixCode. copy 
SlotsToOmit: parent.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> 'bytecodes' -> 'undirectedResend' -> () From: ( | {
         'ModuleInfo: Module: absBCBytecodes InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> 'bytecodes' -> 'undirectedResend' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals abstractBytecodeInterpreter parent bytecodes undirectedResend parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> 'bytecodes' -> 'undirectedResend' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: absBCBytecodes InitialContents: FollowSlot'
        
         checkAll = ( |
            | 
            resend.checkAll.
            interpreter checkNoOperand.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> 'bytecodes' -> 'undirectedResend' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: absBCBytecodes InitialContents: FollowSlot\x7fVisibility: private'
        
         doIt = ( |
            | 
            interpreter isUndirectedResend: true).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> 'bytecodes' -> 'undirectedResend' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: absBCBytecodes InitialContents: FollowSlot'
        
         ignoreForDisassembly = bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> 'bytecodes' -> 'undirectedResend' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: absBCBytecodes InitialContents: FollowSlot\x7fVisibility: public'
        
         isExtended = bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> 'bytecodes' -> 'undirectedResend' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: absBCBytecodes InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> 'bytecodes' -> 'abstractPrefixCode' -> 'parent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> 'bytecodes' -> () From: ( | {
         'Category: locals\x7fModuleInfo: Module: absBCBytecodes InitialContents: FollowSlot\x7fVisibility: public'
        
         writeLocal = bootstrap define: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> 'bytecodes' -> 'writeLocal' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals abstractBytecodeInterpreter parent bytecodes abstractLocal copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> 'bytecodes' -> 'writeLocal' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals abstractBytecodeInterpreter parent bytecodes writeLocal.

CopyDowns:
globals abstractBytecodeInterpreter parent bytecodes abstractLocal. copy 
SlotsToOmit: parent.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> 'bytecodes' -> 'writeLocal' -> () From: ( | {
         'ModuleInfo: Module: absBCBytecodes InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> 'bytecodes' -> 'writeLocal' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals abstractBytecodeInterpreter parent bytecodes writeLocal parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> 'bytecodes' -> 'writeLocal' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: absBCBytecodes InitialContents: FollowSlot\x7fVisibility: public'
        
         isWrite = bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> 'bytecodes' -> 'writeLocal' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: absBCBytecodes InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> 'bytecodes' -> 'abstractLocal' -> 'parent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> 'bytecodes' -> 'writeLocal' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: absBCBytecodes InitialContents: FollowSlot\x7fVisibility: public'
        
         popCount = 1.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractBytecodeInterpreter' -> 'parent' -> 'bytecodes' -> 'writeLocal' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: absBCBytecodes InitialContents: FollowSlot\x7fVisibility: public'
        
         selector = ( |
            | 
            interpreter method
              ifNil:    [selectorIfNoMethod]
              IfNotNil: [|:m|
                m localWriteSelectorLexicalLevel: lexicalLevel
                                           Index: indexOfLocal]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: absBCBytecodes InitialContents: FollowSlot'
        
         absBCBytecodes = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'absBCBytecodes' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'absBCBytecodes' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules absBCBytecodes.

CopyDowns:
globals modules init. copy 
SlotsToOmit: directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'absBCBytecodes' -> () From: ( | {
         'ModuleInfo: Module: absBCBytecodes InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'core'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'absBCBytecodes' -> () From: ( | {
         'ModuleInfo: Module: absBCBytecodes InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'absBCBytecodes' -> () From: ( | {
         'ModuleInfo: Module: absBCBytecodes InitialContents: FollowSlot'
        
         myComment <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'absBCBytecodes' -> () From: ( | {
         'ModuleInfo: Module: absBCBytecodes InitialContents: FollowSlot'
        
         postFileIn = ( |
            | resend.postFileIn).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'absBCBytecodes' -> () From: ( | {
         'ModuleInfo: Module: absBCBytecodes InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- '$Revision: 30.24 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'absBCBytecodes' -> () From: ( | {
         'ModuleInfo: Module: absBCBytecodes InitialContents: FollowSlot\x7fVisibility: private'
        
         subpartNames <- ''.
        } | ) 



 '-- Side effects'

 globals modules absBCBytecodes postFileIn
