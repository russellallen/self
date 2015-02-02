 'Sun-$Revision: 30.16 $'
 '
Copyright 1992-2012 AUTHORS.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: system\x7fCategory: virtual machine interface\x7fModuleInfo: Module: bytecodeFormat InitialContents: FollowSlot\x7fVisibility: public'
        
         bytecodeFormat = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'bytecodeFormat' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals bytecodeFormat.
\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'bytecodeFormat' -> () From: ( | {
         'Category: instruction sets\x7fCategory: initialization\x7fModuleInfo: Module: bytecodeFormat InitialContents: FollowSlot\x7fVisibility: public'
        
         addInstructionSet: is WithIndex: i = ( |
             v.
            | 
            v: instructionSetsByIndex.
            v size <= i ifTrue: [| m |
              v: v copySize: i succ.
              m: asMirror.
              m frozenDefine: m copyAt: 'instructionSetsByIndex' PutContents: reflect: v.
            ].
            v at: i Put: is.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'bytecodeFormat' -> () From: ( | {
         'Category: extracting and merging fields\x7fModuleInfo: Module: bytecodeFormat InitialContents: FollowSlot\x7fVisibility: public'
        
         breakUpIndex: i AndDo: aBlock = ( |
             iHigh.
             iLow.
            | 
            iLow: indexOf: i.
            iHigh: nonIndexPartOf: i.
            aBlock value: iLow With: iHigh).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'bytecodeFormat' -> () From: ( | {
         'Category: sizes\x7fModuleInfo: Module: bytecodeFormat InitialContents: FollowSlot\x7fVisibility: public'
        
         bytecodeBitSize = 8.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'bytecodeFormat' -> () From: ( | {
         'Category: instruction sets\x7fModuleInfo: Module: bytecodeFormat InitialContents: FollowSlot\x7fVisibility: public'
        
         bytecodeForInstructionSetWithIndex: i = ( |
            | 
            opcode: instructionSetOpcode Index: i).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'bytecodeFormat' -> () From: ( | {
         'Category: extracting and merging fields\x7fModuleInfo: Module: bytecodeFormat InitialContents: FollowSlot\x7fVisibility: public'
        
         bytecodeNamed: n = ( |
            | 
            "This method left here for backward compatibility. Whenever possible,
            use" [instructionSetForCodes: codes]. "to get an instructionSet object,
            and then call this method on the instructionSet directly. -- Adam, 2/06"

            mostRecentSelfInstructionSet bytecodeNamed: n).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'bytecodeFormat' -> () From: ( | {
         'Category: extracting and merging fields\x7fModuleInfo: Module: bytecodeFormat InitialContents: FollowSlot\x7fVisibility: public'
        
         bytecodeNamed: n Index: i = ( |
            | 
            "This method left here for backward compatibility. Whenever possible,
            use" [instructionSetForCodes: codes]. "to get an instructionSet object,
            and then call this method on the instructionSet directly. -- Adam, 2/06"

            mostRecentSelfInstructionSet bytecodeNamed: n Index: i).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'bytecodeFormat' -> () From: ( | {
         'Category: instruction sets\x7fModuleInfo: Module: bytecodeFormat InitialContents: FollowSlot\x7fVisibility: private'
        
         defaultInstructionSet = ( |
            | 
            instructionSets twentiethCentury).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'bytecodeFormat' -> () From: ( | {
         'Category: sizes\x7fModuleInfo: Module: bytecodeFormat InitialContents: FollowSlot\x7fVisibility: public'
        
         indexBitSize = ( |
            | bytecodeBitSize - opcodeBitSize).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'bytecodeFormat' -> () From: ( | {
         'Category: sizes\x7fModuleInfo: Module: bytecodeFormat InitialContents: FollowSlot\x7fVisibility: public'
        
         indexMask = ( |
            | (1 << indexBitSize) - 1).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'bytecodeFormat' -> () From: ( | {
         'Category: extracting and merging fields\x7fModuleInfo: Module: bytecodeFormat InitialContents: FollowSlot\x7fVisibility: public'
        
         indexOf: n = ( |
            | n && indexMask).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'bytecodeFormat' -> () From: ( | {
         'Category: instruction sets\x7fCategory: initialization\x7fModuleInfo: Module: bytecodeFormat InitialContents: FollowSlot\x7fVisibility: public'
        
         initialize = ( |
            | 
            instructionSetsDo: [|:is| is initialize].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'bytecodeFormat' -> () From: ( | {
         'Category: instruction sets\x7fModuleInfo: Module: bytecodeFormat InitialContents: FollowSlot\x7fVisibility: public'
        
         instructionSetForCodes: c = ( |
            | 
            c isEmpty ifTrue: [defaultInstructionSet]
                       False: [instructionSetOf: c firstByte]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'bytecodeFormat' -> () From: ( | {
         'Category: querying\x7fModuleInfo: Module: bytecodeFormat InitialContents: FollowSlot\x7fVisibility: private'
        
         instructionSetOf: firstBytecode = ( |
            | 
            (isInstructionSetBytecode: firstBytecode)
               ifFalse: [defaultInstructionSet]
                  True: [instructionSetsByIndex at:  indexOf: firstBytecode]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'bytecodeFormat' -> () From: ( | {
         'Category: instruction sets\x7fModuleInfo: Module: bytecodeFormat InitialContents: FollowSlot\x7fVisibility: private'
        
         instructionSetOpcode = 13.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'bytecodeFormat' -> () From: ( | {
         'Category: instruction sets\x7fModuleInfo: Module: bytecodeFormat InitialContents: FollowSlot\x7fVisibility: private'
        
         instructionSets = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'bytecodeFormat' -> 'instructionSets' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals bytecodeFormat instructionSets.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'bytecodeFormat' -> 'instructionSets' -> () From: ( | {
         'ModuleInfo: Module: bytecodeFormat InitialContents: FollowSlot\x7fVisibility: private'
        
         abstract = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'bytecodeFormat' -> 'instructionSets' -> 'abstract' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals bytecodeFormat instructionSets abstract.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'bytecodeFormat' -> 'instructionSets' -> 'abstract' -> () From: ( | {
         'Category: recreating bytecodes\x7fModuleInfo: Module: bytecodeFormat InitialContents: FollowSlot\x7fVisibility: public'
        
         bytecodeNamed: n = ( |
            | 
            extendedOpcodeNames findFirst: [|:nn| n = nn]
                                IfPresent: [|:nn. :i| bytecodeFormat opcode: opcodes extended Index: i]
                                IfAbsent:  [error: n, ' is not an extended opcode name']).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'bytecodeFormat' -> 'instructionSets' -> 'abstract' -> () From: ( | {
         'Category: recreating bytecodes\x7fModuleInfo: Module: bytecodeFormat InitialContents: FollowSlot\x7fVisibility: public'
        
         bytecodeNamed: n Index: i = ( |
            | 
            opcodeNames findFirst: [|:nn| n = nn]
                        IfPresent: [|:nn. :op| bytecodeFormat opcode: op Index: i]
                        IfAbsent:  [ error: n, ' is not an opcode name']).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'bytecodeFormat' -> 'instructionSets' -> 'abstract' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: bytecodeFormat InitialContents: FollowSlot\x7fVisibility: public'
        
         firstBCI = ( |
            | childShouldImplement).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'bytecodeFormat' -> 'instructionSets' -> 'abstract' -> () From: ( | {
         'Category: testing\x7fModuleInfo: Module: bytecodeFormat InitialContents: FollowSlot\x7fVisibility: public'
        
         includesArgumentCount = ( |
            | childShouldImplement).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'bytecodeFormat' -> 'instructionSets' -> 'abstract' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: bytecodeFormat InitialContents: FollowSlot\x7fVisibility: public'
        
         indexIfNone: noneBlk = ( |
            | 
            childShouldImplement).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'bytecodeFormat' -> 'instructionSets' -> 'abstract' -> () From: ( | {
         'Category: initialization\x7fModuleInfo: Module: bytecodeFormat InitialContents: FollowSlot\x7fVisibility: public'
        
         initialize = ( |
            | 
            [opcodes. extendedOpcodes]. "browsing"

            installNameSpaceFor: opcodeNames         At: 'opcodes'.
            installNameSpaceFor: extendedOpcodeNames At: 'extendedOpcodes'.

            bytecodeFormat addInstructionSet: self WithIndex: indexIfNone: [^ self].

            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'bytecodeFormat' -> 'instructionSets' -> 'abstract' -> () From: ( | {
         'Category: initialization\x7fModuleInfo: Module: bytecodeFormat InitialContents: FollowSlot\x7fVisibility: private'
        
         installNameSpaceFor: nameVec At: nameSpaceSlotName = ( |
             m.
             om.
            | 
            om: (asMirror at: nameSpaceSlotName) contents.
            m: om copyRemoveAll.
            nameVec do: [|:n. :i| m: m copyAt: n PutContents: i asMirror].
            om frozenDefine: m.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'bytecodeFormat' -> 'instructionSets' -> 'abstract' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: bytecodeFormat InitialContents: FollowSlot\x7fVisibility: public'
        
         name = ( |
            | 
            asMirror creatorSlotHint name).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'bytecodeFormat' -> 'instructionSets' -> 'abstract' -> () From: ( | {
         'Category: recreating bytecodes\x7fModuleInfo: Module: bytecodeFormat InitialContents: FollowSlot\x7fVisibility: public'
        
         opcodeNameOf: bytecode = ( |
             r.
            | 
            r: opcodeNames at: bytecodeFormat opcodeOf: bytecode.
            r = 'extended' ifTrue: [extendedOpcodeNames at: bytecodeFormat indexOf: bytecode]
                            False: r).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'bytecodeFormat' -> 'instructionSets' -> 'abstract' -> () From: ( | {
         'ModuleInfo: Module: bytecodeFormat InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'oddball' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'bytecodeFormat' -> 'instructionSets' -> 'abstract' -> () From: ( | {
         'Category: recreating bytecodes\x7fModuleInfo: Module: bytecodeFormat InitialContents: FollowSlot\x7fVisibility: public'
        
         recreateInstructionSetBytecodeIfNone: noneBlk = ( |
            | 
            (bytecodeFormat bytecodeForInstructionSetWithIndex: indexIfNone: [^ noneBlk value]) asCharacter).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'bytecodeFormat' -> 'instructionSets' -> () From: ( | {
         'ModuleInfo: Module: bytecodeFormat InitialContents: FollowSlot\x7fVisibility: public'
        
         twentiethCentury = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'bytecodeFormat' -> 'instructionSets' -> 'twentiethCentury' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals bytecodeFormat instructionSets twentiethCentury.
\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'bytecodeFormat' -> 'instructionSets' -> 'twentiethCentury' -> () From: ( | {
         'Category: opcodes\x7fModuleInfo: Module: bytecodeFormat InitialContents: FollowSlot\x7fVisibility: private'
        
         extendedOpcodeNames = [ | x =  ( bootstrap setObjectAnnotationOf: vector _Clone From: ( |
                     {} = 'ModuleInfo: Creator: globals bytecodeFormat instructionSets twentiethCentury extendedOpcodeNames.
'.
                    | ) ) _Clone: 4 Filler: 0| 
             x _At: 0  Put: ().
             x _At: 1  Put: ().
             x _At: 2  Put: ().
             x _At: 3  Put: ().
             x] value.
        } | ) 

 ((bootstrap stub -> 'globals' -> 'bytecodeFormat' -> 'instructionSets' -> 'twentiethCentury') \/-> 'extendedOpcodeNames') -> () _At: 0 Put: (
     'pushSelf')

 ((bootstrap stub -> 'globals' -> 'bytecodeFormat' -> 'instructionSets' -> 'twentiethCentury') \/-> 'extendedOpcodeNames') -> () _At: 1 Put: (
     'pop')

 ((bootstrap stub -> 'globals' -> 'bytecodeFormat' -> 'instructionSets' -> 'twentiethCentury') \/-> 'extendedOpcodeNames') -> () _At: 2 Put: (
     'nonlocalReturn')

 ((bootstrap stub -> 'globals' -> 'bytecodeFormat' -> 'instructionSets' -> 'twentiethCentury') \/-> 'extendedOpcodeNames') -> () _At: 3 Put: (
     'undirectedResend')

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'bytecodeFormat' -> 'instructionSets' -> 'twentiethCentury' -> () From: ( | {
         'Category: opcodes\x7fModuleInfo: Module: bytecodeFormat InitialContents: InitializeToExpression: (())\x7fVisibility: private'
        
         extendedOpcodes = ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'bytecodeFormat' -> 'instructionSets' -> 'twentiethCentury' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: bytecodeFormat InitialContents: FollowSlot\x7fVisibility: public'
        
         firstBCI = 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'bytecodeFormat' -> 'instructionSets' -> 'twentiethCentury' -> () From: ( | {
         'Category: testing\x7fModuleInfo: Module: bytecodeFormat InitialContents: FollowSlot\x7fVisibility: public'
        
         includesArgumentCount = bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'bytecodeFormat' -> 'instructionSets' -> 'twentiethCentury' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: bytecodeFormat InitialContents: FollowSlot\x7fVisibility: public'
        
         indexIfNone: noneBlk = ( |
            | 
            noneBlk value).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'bytecodeFormat' -> 'instructionSets' -> 'twentiethCentury' -> () From: ( | {
         'Category: opcodes\x7fModuleInfo: Module: bytecodeFormat InitialContents: FollowSlot\x7fVisibility: private'
        
         opcodeNames = [ | x =  ( bootstrap setObjectAnnotationOf: vector _Clone From: ( |
                     {} = 'ModuleInfo: Creator: globals bytecodeFormat instructionSets twentiethCentury opcodeNames.
'.
                    | ) ) _Clone: 14 Filler: 0| 
             x _At: 0  Put: ().
             x _At: 1  Put: ().
             x _At: 2  Put: ().
             x _At: 3  Put: ().
             x _At: 4  Put: ().
             x _At: 5  Put: ().
             x _At: 6  Put: ().
             x _At: 7  Put: ().
             x _At: 8  Put: ().
             x _At: 9  Put: ().
             x _At: 10  Put: ().
             x _At: 11  Put: ().
             x _At: 12  Put: ().
             x _At: 13  Put: ().
             x] value.
        } | ) 

 ((bootstrap stub -> 'globals' -> 'bytecodeFormat' -> 'instructionSets' -> 'twentiethCentury') \/-> 'opcodeNames') -> () _At: 0 Put: (
     'index')

 ((bootstrap stub -> 'globals' -> 'bytecodeFormat' -> 'instructionSets' -> 'twentiethCentury') \/-> 'opcodeNames') -> () _At: 1 Put: (
     'literal')

 ((bootstrap stub -> 'globals' -> 'bytecodeFormat' -> 'instructionSets' -> 'twentiethCentury') \/-> 'opcodeNames') -> () _At: 10 Put: (
     'branchIfFalse')

 ((bootstrap stub -> 'globals' -> 'bytecodeFormat' -> 'instructionSets' -> 'twentiethCentury') \/-> 'opcodeNames') -> () _At: 11 Put: (
     'branchIndexed')

 ((bootstrap stub -> 'globals' -> 'bytecodeFormat' -> 'instructionSets' -> 'twentiethCentury') \/-> 'opcodeNames') -> () _At: 12 Put: (
     'delegatee')

 ((bootstrap stub -> 'globals' -> 'bytecodeFormat' -> 'instructionSets' -> 'twentiethCentury') \/-> 'opcodeNames') -> () _At: 13 Put: (
     'argumentCount')

 ((bootstrap stub -> 'globals' -> 'bytecodeFormat' -> 'instructionSets' -> 'twentiethCentury') \/-> 'opcodeNames') -> () _At: 2 Put: (
     'send')

 ((bootstrap stub -> 'globals' -> 'bytecodeFormat' -> 'instructionSets' -> 'twentiethCentury') \/-> 'opcodeNames') -> () _At: 3 Put: (
     'implicitSelfSend')

 ((bootstrap stub -> 'globals' -> 'bytecodeFormat' -> 'instructionSets' -> 'twentiethCentury') \/-> 'opcodeNames') -> () _At: 4 Put: (
     'extended')

 ((bootstrap stub -> 'globals' -> 'bytecodeFormat' -> 'instructionSets' -> 'twentiethCentury') \/-> 'opcodeNames') -> () _At: 5 Put: (
     'readLocal')

 ((bootstrap stub -> 'globals' -> 'bytecodeFormat' -> 'instructionSets' -> 'twentiethCentury') \/-> 'opcodeNames') -> () _At: 6 Put: (
     'writeLocal')

 ((bootstrap stub -> 'globals' -> 'bytecodeFormat' -> 'instructionSets' -> 'twentiethCentury') \/-> 'opcodeNames') -> () _At: 7 Put: (
     'lexicalLevel')

 ((bootstrap stub -> 'globals' -> 'bytecodeFormat' -> 'instructionSets' -> 'twentiethCentury') \/-> 'opcodeNames') -> () _At: 8 Put: (
     'branchAlways')

 ((bootstrap stub -> 'globals' -> 'bytecodeFormat' -> 'instructionSets' -> 'twentiethCentury') \/-> 'opcodeNames') -> () _At: 9 Put: (
     'branchIfTrue')

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'bytecodeFormat' -> 'instructionSets' -> 'twentiethCentury' -> () From: ( | {
         'Category: opcodes\x7fModuleInfo: Module: bytecodeFormat InitialContents: InitializeToExpression: (())\x7fVisibility: private'
        
         opcodes = ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'bytecodeFormat' -> 'instructionSets' -> 'twentiethCentury' -> () From: ( | {
         'ModuleInfo: Module: bytecodeFormat InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'globals' -> 'bytecodeFormat' -> 'instructionSets' -> 'abstract' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'bytecodeFormat' -> 'instructionSets' -> () From: ( | {
         'ModuleInfo: Module: bytecodeFormat InitialContents: FollowSlot\x7fVisibility: public'
        
         twentiethCenturyPlusArgumentCount = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'bytecodeFormat' -> 'instructionSets' -> 'twentiethCenturyPlusArgumentCount' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals bytecodeFormat instructionSets twentiethCenturyPlusArgumentCount.
\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'bytecodeFormat' -> 'instructionSets' -> 'twentiethCenturyPlusArgumentCount' -> () From: ( | {
         'Category: opcodes\x7fModuleInfo: Module: bytecodeFormat InitialContents: FollowSlot\x7fVisibility: private'
        
         extendedOpcodeNames = [ | x =  ( bootstrap setObjectAnnotationOf: vector _Clone From: ( |
                     {} = 'ModuleInfo: Creator: globals bytecodeFormat instructionSets twentiethCenturyPlusArgumentCount extendedOpcodeNames.
'.
                    | ) ) _Clone: 4 Filler: 0| 
             x _At: 0  Put: ().
             x _At: 1  Put: ().
             x _At: 2  Put: ().
             x _At: 3  Put: ().
             x] value.
        } | ) 

 ((bootstrap stub -> 'globals' -> 'bytecodeFormat' -> 'instructionSets' -> 'twentiethCenturyPlusArgumentCount') \/-> 'extendedOpcodeNames') -> () _At: 0 Put: (
     'pushSelf')

 ((bootstrap stub -> 'globals' -> 'bytecodeFormat' -> 'instructionSets' -> 'twentiethCenturyPlusArgumentCount') \/-> 'extendedOpcodeNames') -> () _At: 1 Put: (
     'pop')

 ((bootstrap stub -> 'globals' -> 'bytecodeFormat' -> 'instructionSets' -> 'twentiethCenturyPlusArgumentCount') \/-> 'extendedOpcodeNames') -> () _At: 2 Put: (
     'nonlocalReturn')

 ((bootstrap stub -> 'globals' -> 'bytecodeFormat' -> 'instructionSets' -> 'twentiethCenturyPlusArgumentCount') \/-> 'extendedOpcodeNames') -> () _At: 3 Put: (
     'undirectedResend')

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'bytecodeFormat' -> 'instructionSets' -> 'twentiethCenturyPlusArgumentCount' -> () From: ( | {
         'Category: opcodes\x7fModuleInfo: Module: bytecodeFormat InitialContents: InitializeToExpression: (())\x7fVisibility: private'
        
         extendedOpcodes = ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'bytecodeFormat' -> 'instructionSets' -> 'twentiethCenturyPlusArgumentCount' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: bytecodeFormat InitialContents: FollowSlot\x7fVisibility: public'
        
         firstBCI = 1.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'bytecodeFormat' -> 'instructionSets' -> 'twentiethCenturyPlusArgumentCount' -> () From: ( | {
         'Category: testing\x7fModuleInfo: Module: bytecodeFormat InitialContents: FollowSlot\x7fVisibility: public'
        
         includesArgumentCount = bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'bytecodeFormat' -> 'instructionSets' -> 'twentiethCenturyPlusArgumentCount' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: bytecodeFormat InitialContents: FollowSlot\x7fVisibility: public'
        
         indexIfNone: noneBlk = ( |
            | 
            0).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'bytecodeFormat' -> 'instructionSets' -> 'twentiethCenturyPlusArgumentCount' -> () From: ( | {
         'Category: opcodes\x7fModuleInfo: Module: bytecodeFormat InitialContents: FollowSlot\x7fVisibility: private'
        
         opcodeNames = [ | x =  ( bootstrap setObjectAnnotationOf: vector _Clone From: ( |
                     {} = 'ModuleInfo: Creator: globals bytecodeFormat instructionSets twentiethCenturyPlusArgumentCount opcodeNames.
'.
                    | ) ) _Clone: 14 Filler: 0| 
             x _At: 0  Put: ().
             x _At: 1  Put: ().
             x _At: 2  Put: ().
             x _At: 3  Put: ().
             x _At: 4  Put: ().
             x _At: 5  Put: ().
             x _At: 6  Put: ().
             x _At: 7  Put: ().
             x _At: 8  Put: ().
             x _At: 9  Put: ().
             x _At: 10  Put: ().
             x _At: 11  Put: ().
             x _At: 12  Put: ().
             x _At: 13  Put: ().
             x] value.
        } | ) 

 ((bootstrap stub -> 'globals' -> 'bytecodeFormat' -> 'instructionSets' -> 'twentiethCenturyPlusArgumentCount') \/-> 'opcodeNames') -> () _At: 0 Put: (
     'index')

 ((bootstrap stub -> 'globals' -> 'bytecodeFormat' -> 'instructionSets' -> 'twentiethCenturyPlusArgumentCount') \/-> 'opcodeNames') -> () _At: 1 Put: (
     'literal')

 ((bootstrap stub -> 'globals' -> 'bytecodeFormat' -> 'instructionSets' -> 'twentiethCenturyPlusArgumentCount') \/-> 'opcodeNames') -> () _At: 10 Put: (
     'branchIfFalse')

 ((bootstrap stub -> 'globals' -> 'bytecodeFormat' -> 'instructionSets' -> 'twentiethCenturyPlusArgumentCount') \/-> 'opcodeNames') -> () _At: 11 Put: (
     'branchIndexed')

 ((bootstrap stub -> 'globals' -> 'bytecodeFormat' -> 'instructionSets' -> 'twentiethCenturyPlusArgumentCount') \/-> 'opcodeNames') -> () _At: 12 Put: (
     'delegatee')

 ((bootstrap stub -> 'globals' -> 'bytecodeFormat' -> 'instructionSets' -> 'twentiethCenturyPlusArgumentCount') \/-> 'opcodeNames') -> () _At: 13 Put: (
     'argumentCount')

 ((bootstrap stub -> 'globals' -> 'bytecodeFormat' -> 'instructionSets' -> 'twentiethCenturyPlusArgumentCount') \/-> 'opcodeNames') -> () _At: 2 Put: (
     'send')

 ((bootstrap stub -> 'globals' -> 'bytecodeFormat' -> 'instructionSets' -> 'twentiethCenturyPlusArgumentCount') \/-> 'opcodeNames') -> () _At: 3 Put: (
     'implicitSelfSend')

 ((bootstrap stub -> 'globals' -> 'bytecodeFormat' -> 'instructionSets' -> 'twentiethCenturyPlusArgumentCount') \/-> 'opcodeNames') -> () _At: 4 Put: (
     'extended')

 ((bootstrap stub -> 'globals' -> 'bytecodeFormat' -> 'instructionSets' -> 'twentiethCenturyPlusArgumentCount') \/-> 'opcodeNames') -> () _At: 5 Put: (
     'readLocal')

 ((bootstrap stub -> 'globals' -> 'bytecodeFormat' -> 'instructionSets' -> 'twentiethCenturyPlusArgumentCount') \/-> 'opcodeNames') -> () _At: 6 Put: (
     'writeLocal')

 ((bootstrap stub -> 'globals' -> 'bytecodeFormat' -> 'instructionSets' -> 'twentiethCenturyPlusArgumentCount') \/-> 'opcodeNames') -> () _At: 7 Put: (
     'lexicalLevel')

 ((bootstrap stub -> 'globals' -> 'bytecodeFormat' -> 'instructionSets' -> 'twentiethCenturyPlusArgumentCount') \/-> 'opcodeNames') -> () _At: 8 Put: (
     'branchAlways')

 ((bootstrap stub -> 'globals' -> 'bytecodeFormat' -> 'instructionSets' -> 'twentiethCenturyPlusArgumentCount') \/-> 'opcodeNames') -> () _At: 9 Put: (
     'branchIfTrue')

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'bytecodeFormat' -> 'instructionSets' -> 'twentiethCenturyPlusArgumentCount' -> () From: ( | {
         'Category: opcodes\x7fModuleInfo: Module: bytecodeFormat InitialContents: InitializeToExpression: (())\x7fVisibility: private'
        
         opcodes = ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'bytecodeFormat' -> 'instructionSets' -> 'twentiethCenturyPlusArgumentCount' -> () From: ( | {
         'ModuleInfo: Module: bytecodeFormat InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'globals' -> 'bytecodeFormat' -> 'instructionSets' -> 'abstract' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'bytecodeFormat' -> () From: ( | {
         'Category: instruction sets\x7fModuleInfo: Module: bytecodeFormat InitialContents: InitializeToExpression: (vector)\x7fVisibility: private'
        
         instructionSetsByIndex = ((bootstrap stub -> 'globals') \/-> 'vector') -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'bytecodeFormat' -> () From: ( | {
         'Category: instruction sets\x7fModuleInfo: Module: bytecodeFormat InitialContents: FollowSlot\x7fVisibility: private'
        
         instructionSetsDo: blk = ( |
            | 
            (reflect: instructionSets) do: [|:s. isMir|
              isMir: s contents.
              isMir isComplete ifTrue: [
                blk value: isMir reflectee.
              ].
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'bytecodeFormat' -> () From: ( | {
         'Category: querying\x7fModuleInfo: Module: bytecodeFormat InitialContents: FollowSlot\x7fVisibility: public'
        
         isInstructionSetBytecode: n = ( |
            | 
            (opcodeOf: n) = instructionSetOpcode).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'bytecodeFormat' -> () From: ( | {
         'Category: instruction sets\x7fModuleInfo: Module: bytecodeFormat InitialContents: FollowSlot\x7fVisibility: public'
        
         mostRecentSelfInstructionSet = bootstrap stub -> 'globals' -> 'bytecodeFormat' -> 'instructionSets' -> 'twentiethCenturyPlusArgumentCount' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'bytecodeFormat' -> () From: ( | {
         'Category: extracting and merging fields\x7fModuleInfo: Module: bytecodeFormat InitialContents: FollowSlot\x7fVisibility: private'
        
         nonIndexPartOf: n = ( |
            | 
            n >> indexBitSize).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'bytecodeFormat' -> () From: ( | {
         'Category: sizes\x7fModuleInfo: Module: bytecodeFormat InitialContents: FollowSlot\x7fVisibility: public'
        
         numberOfOpcodes = ( |
            | 1 << opcodeBitSize).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'bytecodeFormat' -> () From: ( | {
         'Category: extracting and merging fields\x7fModuleInfo: Module: bytecodeFormat InitialContents: FollowSlot\x7fVisibility: private'
        
         opcode: op Index: i = ( |
            | (op << indexBitSize) || i).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'bytecodeFormat' -> () From: ( | {
         'Category: sizes\x7fModuleInfo: Module: bytecodeFormat InitialContents: FollowSlot\x7fVisibility: public'
        
         opcodeBitSize = 4.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'bytecodeFormat' -> () From: ( | {
         'Category: querying\x7fModuleInfo: Module: bytecodeFormat InitialContents: FollowSlot\x7fVisibility: public'
        
         opcodeNameOf: bytecode = ( |
            | 
            "This method left here for backward compatibility. Whenever possible,
            use" [instructionSetForCodes: codes]. "to get an instructionSet object,
            and then call this method on the instructionSet directly. -- Adam, 2/06"

            mostRecentSelfInstructionSet opcodeNameOf: bytecode).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'bytecodeFormat' -> () From: ( | {
         'Category: extracting and merging fields\x7fModuleInfo: Module: bytecodeFormat InitialContents: FollowSlot\x7fVisibility: private'
        
         opcodeOf: n = ( |
            | 
            nonIndexPartOf: n).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'bytecodeFormat' -> () From: ( | {
         'ModuleInfo: Module: bytecodeFormat InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'oddball' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'bytecodeFormat' -> () From: ( | {
         'Category: extracting and merging fields\x7fModuleInfo: Module: bytecodeFormat InitialContents: FollowSlot\x7fVisibility: public'
        
         shiftIndex: high AndAdd: low = ( |
            | 
            (high << indexBitSize) || low).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: bytecodeFormat InitialContents: FollowSlot'
        
         bytecodeFormat = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'bytecodeFormat' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'comment' From:
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'bytecodeFormat' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules bytecodeFormat.

CopyDowns:
globals modules init. copy 
SlotsToOmit: comment directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'bytecodeFormat' -> () From: ( | {
         'ModuleInfo: Module: bytecodeFormat InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'core'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'bytecodeFormat' -> () From: ( | {
         'ModuleInfo: Module: bytecodeFormat InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'bytecodeFormat' -> () From: ( | {
         'ModuleInfo: Module: bytecodeFormat InitialContents: FollowSlot'
        
         myComment <- 'no comment'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'bytecodeFormat' -> () From: ( | {
         'ModuleInfo: Module: bytecodeFormat InitialContents: FollowSlot'
        
         postFileIn = ( |
            | 
             bytecodeFormat initialize. 
            resend.postFileIn).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'bytecodeFormat' -> () From: ( | {
         'ModuleInfo: Module: bytecodeFormat InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- 'Sun-$Revision: 30.16 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'bytecodeFormat' -> () From: ( | {
         'ModuleInfo: Module: bytecodeFormat InitialContents: FollowSlot\x7fVisibility: private'
        
         subpartNames <- ''.
        } | ) 



 '-- Side effects'

 globals modules bytecodeFormat postFileIn
