 'Sun-$Revision: 30.23 $'
 '
Copyright 1992-2012 AUTHORS.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: tests InitialContents: FollowSlot'
        
         tests = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'tests' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'comment' From:
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'tests' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules tests.

CopyDowns:
globals modules init. copy 
SlotsToOmit: comment directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'tests' -> () From: ( | {
         'ModuleInfo: Module: tests InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'tests'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'tests' -> () From: ( | {
         'ModuleInfo: Module: tests InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'tests' -> () From: ( | {
         'ModuleInfo: Module: tests InitialContents: FollowSlot'
        
         myComment <- 'Regression test methods'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'tests' -> () From: ( | {
         'ModuleInfo: Module: tests InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- 'Sun-$Revision: 30.23 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'tests' -> () From: ( | {
         'ModuleInfo: Module: tests InitialContents: FollowSlot\x7fVisibility: public'
        
         subpartNames <- 'programmingTests
debugTests
lowLevelTests
numberTests
deltablue
sicTests
branchTests
nicTests
testSuite
languageTests
'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: bench\x7fModuleInfo: Module: tests InitialContents: FollowSlot'
        
         tests = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'tests' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals tests.
\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> () From: ( | {
         'Category: infrastructure\x7fModuleInfo: Module: tests InitialContents: FollowSlot\x7fVisibility: private'
        
         aConstantReference = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'tests' -> 'aConstantReference' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals tests aConstantReference.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> () From: ( | {
         'Category: infrastructure\x7fModuleInfo: Module: tests InitialContents: FollowSlot\x7fVisibility: private'
        
         aRefHolder = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'tests' -> 'aRefHolder' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals tests aRefHolder.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'aRefHolder' -> () From: ( | {
         'ModuleInfo: Module: tests InitialContents: FollowSlot'
        
         aVariableReference.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> () From: ( | {
         'Category: abstract syntax\x7fModuleInfo: Module: tests InitialContents: FollowSlot'
        
         abstractSyntaxTest: errorMessages = ( |
            | 
            abstractSyntax abstractSyntaxTest doTestStructureEditor: errorMessages).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> () From: ( | {
         'Category: numbers and other magnitudes\x7fModuleInfo: Module: tests InitialContents: FollowSlot\x7fVisibility: public'
        
         arithmeticTest = ( |
            | 
            'Testing arithmetic simplifications...' printLine.
            check: [ testInt + testInt. testInt + testInt ] Against: 6
                Named: 'N + N'.
            check: [ testInt * testInt. testInt * testInt ] Against: 9
                Named: 'N * N'.
            check: [ testInt + 0. testInt + 0 ] Against: 3
                Named: 'N + 0'.
            check: [ 0 + testInt. 0 + testInt ] Against: 3
                Named: '0 + N'.
            check: [ testInt - 0. testInt - 0 ] Against: 3
                Named: 'N - 0'.
            check: [ 0 - testInt. 0 - testInt ] Against: -3
                Named: '0 - N'.
            check: [ testInt * 0. testInt * 0 ] Against: 0
                Named: 'N * 0'.
            check: [ 0 * testInt. 0 * testInt ] Against: 0
                Named: '0 * N'.
            check: [ testInt * 1. testInt * 1 ] Against: 3
                Named: 'N * 1'.
            check: [ 1 * testInt. 1 * testInt ] Against: 3
                Named: '1 * N'.
            check: [ testInt * -1. testInt * -1 ] Against: -3
                Named: 'N * -1'.
            check: [ -1 * testInt. -1 * testInt ] Against: -3
                Named: '-1 * N'.
            check: [ testInt * 2. testInt * 2 ] Against: 6
                Named: 'N * 2'.
            check: [ 2 * testInt. 2 * testInt ] Against: 6
                Named: '2 * N'.
            check: [ testInt * 1024. testInt * 1024 ] Against: 3072
                Named: 'N * 1024'.
            check: [ 1024 * testInt. 1024 * testInt ] Against: 3072
                        Named: '1024 * N'.
            check: [ testInt / 1. testInt / 1 ] Against: 3
                Named: 'N / 1'.
            check: [ 1 / testInt. 1 / testInt ] Against: 0
                Named: '1 / N'.
            check: [ testInt && 0. testInt && 0 ] Against: 0
                Named: 'N && 0'.
            check: [ 0 && testInt. 0 && testInt ] Against: 0
                Named: '0 && N'.
            check: [ testInt || 0. testInt || 0 ] Against: 3
                Named: 'N || 0'.
            check: [ 0 || testInt. 0 || testInt ] Against: 3
                Named: '0 || N'.
            check: [ testInt ^^ 0. testInt ^^ 0 ] Against: 3
                Named: 'N ^^ 0'.
            check: [ 0 ^^ testInt. 0 ^^ testInt ] Against: 3
                Named: '0 ^^ N'.
            check: [ testInt <+ 0. testInt <+ 0 ] Against: 3
                Named: 'N <+ 0'.
            check: [ 0 <+ testInt. 0 <+ testInt ] Against: 0
                Named: '0 <+ N'.
            check: [ testInt << 0. testInt << 0 ] Against: 3
                Named: 'N << 0'.
            check: [ 0 << testInt. 0 << testInt ] Against: 0
                Named: '0 << N'.
            check: [ testInt +> 0. testInt +> 0 ] Against: 3
                Named: 'N +> 0'.
            check: [ 0 +> testInt. 0 +> testInt ] Against: 0
                Named: '0 +> N'.
            check: [ testInt >> 0. testInt >> 0 ] Against: 3
                Named: 'N >> 0'.
            check: [ 0 >> testInt. 0 >> testInt ] Against: 0
                Named: '0 >> N'.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> () From: ( | {
         'Category: test suites\x7fModuleInfo: Module: tests InitialContents: FollowSlot\x7fVisibility: public'
        
         benchmarkTest = ( |
            | 
            check: [ benchmarks measurePerformance2: 1 ] Named: 'benchmarks'.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> () From: ( | {
         'Category: VM tests\x7fCategory: enumeration\x7fModuleInfo: Module: tests InitialContents: FollowSlot\x7fVisibility: public'
        
         browsingTest = ( |
            | 
            check: [browse copy test] Against: true Named: 'browsingTest'.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> () From: ( | {
         'Category: infrastructure\x7fModuleInfo: Module: tests InitialContents: FollowSlot\x7fVisibility: private'
        
         check: xb Against: yb Named: n = ( |
             x.
             xs.
             y.
             ys.
            | 
            ('testing ', n, ' ... ') print.
            x: xb value.
            y: yb value.
            xs: x printString.
            ys: y printString.
            x = y ifFalse: [ error:  '', xs, ' != ', ys ].
            ('ok: ', xs, ' = ', ys) printLine.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> () From: ( | {
         'Category: infrastructure\x7fModuleInfo: Module: tests InitialContents: FollowSlot\x7fVisibility: private'
        
         check: xb Named: n = ( |
             x.
            | 
            ('running ', n, ' ... ') print.
            x: xb value.
            ('value: ', x printString) printLine.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> () From: ( | {
         'Category: VM tests\x7fCategory: debugging and debugging info\x7fModuleInfo: Module: tests InitialContents: FollowSlot\x7fVisibility: private'
        
         compare: method At: bci With: sel = ( |
             realBCI.
             start <- 0.
             table <- ((bootstrap stub -> 'globals') \/-> 'vector') -> ().
            | 
            "skip instruction set selection bytecode if using it.
             Can only test for arg count BCs, which imply the iset bc at the start
             -- dmu 10/01"

            realBCI: bci + (_GenArgCountBytecode ifTrue: 1 False: 0).
            table: method _ParseObjectIntoPositionTable.
            start: table at: realBCI double.
              check: [method copyFrom: start
                                 UpTo: start + (table at: realBCI double succ)]
            Against: sel
              Named: 'PositionTable').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> () From: ( | {
         'Category: VM tests\x7fCategory: debugging and debugging info\x7fModuleInfo: Module: tests InitialContents: FollowSlot\x7fVisibility: private'
        
         compare: method Size: n = ( |
            | 
              check: method _ParseObjectIntoPositionTable size half
            Against: n + (_GenArgCountBytecode ifTrue: 1 False: 0)
              Named: 'Table size').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> () From: ( | {
         'Category: VM tests\x7fCategory: conversion prologue\x7fComment: Added in order to test the fix to the VM crashing
that surfaced doing Klein export work in winter/spring 2003.
-- David Ungar\x7fModuleInfo: Module: tests InitialContents: FollowSlot\x7fVisibility: public'
        
         conversionPrologueTest = ( |
            | 
            'Testing conversion of method in prologue...' print.
            "shell useNIC."
            _Flush.
            [conversionPrologueTestLoop]. "browsing"
            (message copy receiver: self Selector: 'conversionPrologueTestLoop') fork.
            1000 do: [
              (vector copySize: 17 FillingWith: 0) asMirror removeAll.
              times delay: 1.
              '.' print.
            ].
            'ok' printLine.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> () From: ( | {
         'Category: VM tests\x7fCategory: conversion prologue\x7fModuleInfo: Module: tests InitialContents: FollowSlot\x7fVisibility: private'
        
         conversionPrologueTestLoop = ( |
             v.
             vv.
            | 
            v: vector copySize: 100.
            1000 do: [vv: v at: 3 IfAbsent: 17. times delay: 1. '*' print.].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> () From: ( | {
         'Category: VM tests\x7fCategory: perform tests\x7fModuleInfo: Module: tests InitialContents: FollowSlot\x7fVisibility: private'
        
         conversionTestObj = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'tests' -> 'conversionTestObj' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals tests conversionTestObj.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'conversionTestObj' -> () From: ( | {
         'ModuleInfo: Module: tests InitialContents: FollowSlot'
        
         a = ( |
            | 
            0 true ifTrue: [foob]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'conversionTestObj' -> () From: ( | {
         'ModuleInfo: Module: tests InitialContents: FollowSlot'
        
         test = ( |
            | 
            self _Perform: 'test2').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'conversionTestObj' -> () From: ( | {
         'ModuleInfo: Module: tests InitialContents: FollowSlot'
        
         test2 = ( |
            | 
            self _Perform: 'a' DelegatingTo: self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> () From: ( | {
         'Category: application-level tests\x7fModuleInfo: Module: tests InitialContents: FollowSlot\x7fVisibility: public'
        
         deltablueTest = ( |
            | 
            'Deltablue test...' printLine.
            deltablue chain: 100.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> () From: ( | {
         'Category: VM tests\x7fCategory: messages and inheritance\x7fCategory: dynamic inheritance\x7fModuleInfo: Module: tests InitialContents: FollowSlot\x7fVisibility: public'
        
         diTest = ( |
            | 
            'Testing dynamic inheritance...' printLine.
            diTest1.
            diTest2.
            diTest3.
            diTest4.
            diTest5.
            diTest6.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> () From: ( | {
         'Category: VM tests\x7fCategory: messages and inheritance\x7fCategory: dynamic inheritance\x7fModuleInfo: Module: tests InitialContents: FollowSlot\x7fVisibility: public'
        
         diTest1 = ( |
            | 
            objs q parent: objs o.
            check: [ objs q x ] Against: 'a' Named: 'di object fetch test'.
            check: [ objs q foo ] Against: 'a' Named: 'di object fetch test'.
            objs q parent: objs p.
            check: [ objs q x ] Against: 'b' Named: 'di object fetch test'.
            check: [ objs q foo ] Against: 'b' Named: 'di object fetch test'.
            check: [ (objs z baz: 1) == objs z ] Against: [ true ]
                Named: 'di assignment result'.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> () From: ( | {
         'Category: VM tests\x7fCategory: messages and inheritance\x7fCategory: dynamic inheritance\x7fModuleInfo: Module: tests InitialContents: FollowSlot\x7fVisibility: public'
        
         diTest2 = ( |
            | 
            objs r parent1: objs o.
            objs r parent2: objs o.
            check: [ objs r x ] Against: 'a' Named: 'dual-di object fetch test'.
            check: [ objs r foo ] Against: 'a' Named: 'dual-di object fetch test'.
            check: [ objs r foo1 ] Against: 'a' Named: 'dual-di object fetch test'.
            check: [ objs r foo2 ] Against: 'a' Named: 'dual-di object fetch test'.
            objs r parent2: objs p.
            check: [ objs r x ] Against: 'messageAmbiguous'
                Named: 'dual-di object fetch test'.
            check: [ objs r foo ] Against: 'messageAmbiguous'
                Named: 'dual-di object fetch test'.
            objs r parent1: objs p.
            check: [ objs r x ] Against: 'b' Named: 'dual-di object fetch test'.
            check: [ objs r foo ] Against: 'b' Named: 'dual-di object fetch test'.
            check: [ objs r foo1 ] Against: 'b' Named: 'dual-di object fetch test'.
            check: [ objs r foo2 ] Against: 'b' Named: 'dual-di object fetch test'.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> () From: ( | {
         'Category: VM tests\x7fCategory: messages and inheritance\x7fCategory: dynamic inheritance\x7fModuleInfo: Module: tests InitialContents: FollowSlot\x7fVisibility: public'
        
         diTest3 = ( |
            | 
            objs s parent: objs o.
            check: [ objs s x ] Against: 'a' Named: 'di object fetch test'.
            check: [ objs s foo ] Against: 'a' Named: 'di object fetch test'.
            objs s parent: objs p.
            check: [ objs s x ] Against: 'b' Named: 'di object fetch test'.
            check: [ objs s foo ] Against: 'b' Named: 'di object fetch test'.
            objs t parent1: objs o.
            objs t parent2: objs o.
            check: [ objs t x ] Against: 'a' Named: 'dual-di object fetch test'.
            check: [ objs t foo ] Against: 'a' Named: 'dual-di object fetch test'.
            check: [ objs t foo1 ] Against: 'a' Named: 'dual-di object fetch test'.
            check: [ objs t foo2 ] Against: 'a' Named: 'dual-di object fetch test'.
            objs t parent2: objs p.
            check: [ objs t x ] Against: 'messageAmbiguous'
                Named: 'dual-di object fetch test'.
            check: [ objs t foo ] Against: 'messageAmbiguous'
                Named: 'dual-di object fetch test'.
            objs t parent1: objs p.
            check: [ objs t x ] Against: 'b' Named: 'dual-di object fetch test'.
            check: [ objs t foo ] Against: 'b' Named: 'dual-di object fetch test'.
            check: [ objs t foo1 ] Against: 'b' Named: 'dual-di object fetch test'.
            check: [ objs t foo2 ] Against: 'b' Named: 'dual-di object fetch test'.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> () From: ( | {
         'Category: VM tests\x7fCategory: messages and inheritance\x7fCategory: dynamic inheritance\x7fModuleInfo: Module: tests InitialContents: FollowSlot\x7fVisibility: public'
        
         diTest4 = ( |
            | 
            objs q parent: objs o.
            objs u parent: objs q.
            check: [ objs u x ] Against: 'a' Named: 'grand-di object fetch test'.
            check: [ objs u foo ] Against: 'a' Named: 'grand-di object fetch test'.
            objs q parent: objs p.
            check: [ objs u x ] Against: 'b' Named: 'grand-di object fetch test'.
            check: [ objs u foo ] Against: 'b' Named: 'grand-di object fetch test'.
            objs w parent: objs o.
            objs u parent: objs w.
            check: [ objs u x ] Against: 'a' Named: 'grand-di object fetch test'.
            check: [ objs u foo ] Against: 'a' Named: 'grand-di object fetch test'.
            objs w parent: objs p.
            check: [ objs u x ] Against: 'b' Named: 'grand-di object fetch test'.
            check: [ objs u foo ] Against: 'b' Named: 'grand-di object fetch test'.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> () From: ( | {
         'Category: VM tests\x7fCategory: messages and inheritance\x7fCategory: dynamic inheritance\x7fModuleInfo: Module: tests InitialContents: FollowSlot\x7fVisibility: public'
        
         diTest5 = ( |
            | 
            objs r parent1: objs o.
            objs r parent2: objs o.
            objs v parent: objs r.
            check: [ objs v x ] Against: 'a'
                Named: 'dual-grand-di object fetch test'.
            check: [ objs v foo ] Against: 'a'
                Named: 'dual-grand-di object fetch test'.
            check: [ objs v foo1 ] Against: 'a'
                Named: 'dual-grand-di object fetch test'.
            check: [ objs v foo2 ] Against: 'a'
                Named: 'dual-grand-di object fetch test'.
            objs r parent2: objs p.
            check: [ objs v x ] Against: 'messageAmbiguous'
                Named: 'dual-grand-di object fetch test'.
            check: [ objs v foo ] Against: 'messageAmbiguous'
                Named: 'dual-grand-di object fetch test'.
            objs r parent1: objs p.
            check: [ objs v x ] Against: 'b'
                Named: 'dual-grand-di object fetch test'.
            check: [ objs v foo ] Against: 'b'
                Named: 'dual-grand-di object fetch test'.
            check: [ objs v foo1 ] Against: 'b'
                Named: 'dual-grand-di object fetch test'.
            check: [ objs v foo2 ] Against: 'b'
                Named: 'dual-grand-di object fetch test'.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> () From: ( | {
         'Category: VM tests\x7fCategory: messages and inheritance\x7fCategory: dynamic inheritance\x7fModuleInfo: Module: tests InitialContents: FollowSlot\x7fVisibility: public'
        
         diTest6 = ( |
            | 
            objs x parent1: objs o.
            objs x parent2: objs o.
            objs v parent: objs x.
            check: [ objs v x ] Against: 'a'
                Named: 'dual-grand-di object fetch test'.
            check: [ objs v foo ] Against: 'a'
                Named: 'dual-grand-di object fetch test'.
            check: [ objs v foo1 ] Against: 'a'
                Named: 'dual-grand-di object fetch test'.
            check: [ objs v foo2 ] Against: 'a'
                Named: 'dual-grand-di object fetch test'.
            objs x parent2: objs p.
            check: [ objs v x ] Against: 'messageAmbiguous'
                Named: 'dual-grand-di object fetch test'.
            check: [ objs v foo ] Against: 'messageAmbiguous'
                Named: 'dual-grand-di object fetch test'.
            objs x parent1: objs p.
            check: [ objs v x ] Against: 'b'
                Named: 'dual-grand-di object fetch test'.
            check: [ objs v foo ] Against: 'b'
                Named: 'dual-grand-di object fetch test'.
            check: [ objs v foo1 ] Against: 'b'
                Named: 'dual-grand-di object fetch test'.
            check: [ objs v foo2 ] Against: 'b'
                Named: 'dual-grand-di object fetch test'.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> () From: ( | {
         'Category: infrastructure\x7fModuleInfo: Module: tests InitialContents: FollowSlot\x7fVisibility: private'
        
         endOfTests: errorMessages = ( |
            | 
            _Verify.
            '\nEnd of tests.\n' printLine.
            errorMessages do: [ | :err | err printLine ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> () From: ( | {
         'Category: VM tests\x7fCategory: enumeration\x7fModuleInfo: Module: tests InitialContents: FollowSlot\x7fVisibility: public'
        
         enumerationTest = ( |
            | 
            'Testing path cache and enumeration operations...' printLine.
            memory thoroughCleanup: true. "need to flush old data and code to pass the following tests"
            check: [enumerating all copy test]
                Against: true
                Named: 'enumerate all test'.

            memory thoroughCleanup: true. "previous test may have left references - get rid of them."
            check: [enumerating references copy test]
                Against: true
                Named: 'enumerate references test'.

            memory thoroughCleanup: true. "previous test may have left references - get rid of them."
            check: [enumerating implementors copy test]
                Against: true
                Named: 'enumerate implementors test'.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> () From: ( | {
         'Category: VM tests\x7fCategory: debugging and debugging info\x7fModuleInfo: Module: tests InitialContents: FollowSlot'
        
         errorHandlingTest = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'tests' -> 'errorHandlingTest' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals tests errorHandlingTest.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'errorHandlingTest' -> () From: ( | {
         'ModuleInfo: Module: tests InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'lobby' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'errorHandlingTest' -> () From: ( | {
         'ModuleInfo: Module: tests InitialContents: FollowSlot'
        
         provoke: error Message: string = ( | {
                 'ModuleInfo: Module: tests InitialContents: FollowSlot'
                
                 p.
                } 
            | 
            ('Provoking: ', string) printLine.
            p: process copySend: message copy receiver: error Selector: 'test'.
            p resume.
            p waitForSuspension.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'errorHandlingTest' -> () From: ( | {
         'ModuleInfo: Module: tests InitialContents: FollowSlot\x7fVisibility: public'
        
         run = ( |
            | 
            'Testing error handling...' printLine.
            provoke: processErrors undefinedSelector
                Message: 'undefinedSelector'.
            provoke: processErrors ambiguousSelector
                Message: 'ambiguousSelector'.
            provoke: processErrors missingDelegatee
                Message: 'missingDelegatee'.
            provoke: processErrors performTypeErrorSelector
                Message: 'performTypeErrorSelector'.
            provoke: processErrors mismatchedArgumentCountSelector
                Message: 'mismatchedArgumentCountSelector'.
            provoke: processErrors primitiveFailed
                Message: 'primitiveFailed'.
            provoke: processErrors stackOverflow 
                Message: 'stackOverflow'.
            provoke: processErrors nonLifoBlock
                Message: 'nonLifoBlock'.
            provoke: processErrors userError
                Message: 'userError'.
            provoke: processErrors userErrorWithArguments
                Message: 'userErrorWithArguments'.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> () From: ( | {
         'Category: VM tests\x7fModuleInfo: Module: tests InitialContents: FollowSlot\x7fVisibility: public'
        
         evalTest = ( |
            | perverseFac: 3).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> () From: ( | {
         'Category: VM tests\x7fModuleInfo: Module: tests InitialContents: FollowSlot\x7fVisibility: public'
        
         gcDerivedPointersTest = ( |
            | 
            'Testing garbage collection in the presence of derived pointers...'
                printLine.
            [ | v |
                v: vector copySize: 5.
                3 do: [ | :i | v at: i Put: random printableString: 5 ].
                3 do: [ | :i. t1. t2. |
                    t1: v at: i.
                    _GarbageCollect.
                    t2: v at: i.
                    check: t2 Against: t1 Named: 'test'.
                ].
            ] withNewCompiler.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> () From: ( | {
         'Category: VM tests\x7fComment: Test to see if adding behavior to non-slot objects does the right thing -- Mario, 1/13/95\x7fModuleInfo: Module: tests InitialContents: FollowSlot\x7fVisibility: public'
        
         immediateTest = ( |
             b.
            | 
            'Testing adding slots to smallInt, float and block parents ... ' print.
            b: [|:imm|
             imm parent _AddSlots: (| xxx <- 41. frob = (xxx succ ) |).
             imm parent frob = imm frob ifFalse: [error: 'immediateTest failed!'].
             imm parent _RemoveSlot: 'xxx'.
             imm parent _RemoveSlot: 'frob'].
            b value: 0.
            b value: 0.0.
            b value: [].
            'ok' printLine).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> () From: ( | {
         'Category: VM tests\x7fCategory: messages and inheritance\x7fModuleInfo: Module: tests InitialContents: FollowSlot\x7fVisibility: public'
        
         inheritanceTest = ( |
            | 
            'Testing inheritance semantics...' printLine.
            check: [ objs f foo ] Against: 'b'
                Named: 'sends outside of sender path'.
            check: [ objs d delegatedX ] Against: 'b' Named: 'delegated sends'.
            check: [ objs i x ] Against: 'b' Named: 'merging parent paths'.
            check: [ objs n bar ] Against: 'messageAmbiguous'
                Named: 'sender path constraint'.
            check: [ (objs y baz2: 1) == objs y ] Against: [ true ]
                Named: 'assignment result'.
            check: [ (objs y baz: 1) == objs y ] Against: [ true ]
                Named: 'inherited assignment result'.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> () From: ( | {
         'Category: VM tests\x7fCategory: June 2005 bug\x7fModuleInfo: Module: tests InitialContents: FollowSlot\x7fVisibility: private'
        
         june2005Bug = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'tests' -> 'june2005Bug' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals tests june2005Bug.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'june2005Bug' -> () From: ( | {
         'ModuleInfo: Module: tests InitialContents: FollowSlot\x7fVisibility: private'
        
         andWithTwelve: n = ( |
            | 
            n && 12).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'june2005Bug' -> () From: ( | {
         'ModuleInfo: Module: tests InitialContents: FollowSlot\x7fVisibility: public'
        
         runOn: n = ( |
            | 
            (andWithTwelve: n) = zeroShiftedLeftByTwo).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'june2005Bug' -> () From: ( | {
         'ModuleInfo: Module: tests InitialContents: FollowSlot\x7fVisibility: private'
        
         two = ( |
            | 
            2).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'june2005Bug' -> () From: ( | {
         'ModuleInfo: Module: tests InitialContents: FollowSlot\x7fVisibility: private'
        
         zeroShiftedLeftByTwo = ( |
            | 
            0 << two).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> () From: ( | {
         'Category: VM tests\x7fCategory: June 2005 bug\x7fComment: This slot is assignable rather than constant so that the VM doesn\'t
inline the call to runOn: into the june2005BugTest method. Is there
a better way to ensure that? -- Adam, 6/05\x7fModuleInfo: Module: tests InitialContents: InitializeToExpression: (tests june2005Bug)\x7fVisibility: private'
        
         june2005BugAssignable <- bootstrap stub -> 'globals' -> 'tests' -> 'june2005Bug' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> () From: ( | {
         'Category: VM tests\x7fCategory: June 2005 bug\x7fModuleInfo: Module: tests InitialContents: FollowSlot\x7fVisibility: public'
        
         june2005BugTest = ( |
            | 
            _Flush.

              check: ([june2005BugAssignable runOn: 0] withCompiler: 'sic')
            Against: true
              Named: 'June 2005 bug'.

            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> () From: ( | {
         'Category: VM tests\x7fModuleInfo: Module: tests InitialContents: FollowSlot\x7fVisibility: public'
        
         lexicalParentTest = ( |
             thisActivationPlease.
            | 

            [3] asMirror lexicalParent includesKey: 'thisActivationPlease').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> () From: ( | {
         'Category: collections\x7fModuleInfo: Module: tests InitialContents: FollowSlot\x7fVisibility: public'
        
         listTest = ( | {
                 'ModuleInfo: Module: tests InitialContents: FollowSlot'
                
                 l.
                } 
            | 
            'Testing list operations...' printLine.
            check: [ l: list copyRemoveAll. l ] Named: 'list copy'.
            check: [ l add: 2 ] Named: 'add: 2'.
            check: [ l add: -3.34 ] Named: 'add: -3.34'.
            check: [ l addFirst: 1 ] Named: 'addFirst: 1'.
            check: [ l copy ] Against: l Named: 'l copy = l'.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> () From: ( | {
         'Category: VM tests\x7fCategory: lookup\x7fModuleInfo: Module: tests InitialContents: FollowSlot\x7fVisibility: private'
        
         lookupParent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'tests' -> 'lookupParent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals tests lookupParent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'lookupParent' -> () From: ( | {
         'ModuleInfo: Module: tests InitialContents: FollowSlot'
        
         xp1 <- 'xp1'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'lookupParent' -> () From: ( | {
         'ModuleInfo: Module: tests InitialContents: FollowSlot'
        
         xp2 <- 'xp2'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> () From: ( | {
         'Category: VM tests\x7fCategory: lookup\x7fModuleInfo: Module: tests InitialContents: FollowSlot\x7fVisibility: public'
        
         lookupTest = ( |
            | 
            'Testing message lookup...' printLine.
            lookupTest: 'xa1' Xa2: 'xa2' Xa3: 'xa3' Xa4: 'xa4'
                              Xa5: 'xa5' Xa6: 'xa6' Xa7: 'xa7'
                              Xa8: 'xa8' Xa9: 'xa9' Xa10: 'xa10'
                              Xa11: 'xa11' Xa12: 'xa12' Xa13: 'xa13'
                              Recursive: false.
            lookupTest: 'xa1' Xa2: 'xa2'.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> () From: ( | {
         'Category: VM tests\x7fCategory: lookup\x7fModuleInfo: Module: tests InitialContents: FollowSlot'
        
         lookupTest: xa1 Xa2: xa2 = ( | {
                 'ModuleInfo: Module: tests InitialContents: FollowSlot'
                
                 xm1 <- 'xm1'.
                }  {
                 'ModuleInfo: Module: tests InitialContents: FollowSlot'
                
                 xm10 <- 'xm10'.
                }  {
                 'ModuleInfo: Module: tests InitialContents: FollowSlot'
                
                 xm11 <- 'xm11'.
                }  {
                 'ModuleInfo: Module: tests InitialContents: FollowSlot'
                
                 xm12 <- 'xm12'.
                }  {
                 'ModuleInfo: Module: tests InitialContents: FollowSlot'
                
                 xm2 <- 'xm2'.
                }  {
                 'ModuleInfo: Module: tests InitialContents: FollowSlot'
                
                 xm3 <- 'xm3'.
                }  {
                 'ModuleInfo: Module: tests InitialContents: FollowSlot'
                
                 xm4 <- 'xm4'.
                }  {
                 'ModuleInfo: Module: tests InitialContents: FollowSlot'
                
                 xm5 <- 'xm5'.
                }  {
                 'ModuleInfo: Module: tests InitialContents: FollowSlot'
                
                 xm6 <- 'xm6'.
                }  {
                 'ModuleInfo: Module: tests InitialContents: FollowSlot'
                
                 xm7 <- 'xm7'.
                }  {
                 'ModuleInfo: Module: tests InitialContents: FollowSlot'
                
                 xm8 <- 'xm8'.
                }  {
                 'ModuleInfo: Module: tests InitialContents: FollowSlot'
                
                 xm9 <- 'xm9'.
                } 
            | 
            check: xa1 Against: 'xa1' Named: 'argument lookup'.
            check: xa2 Against: 'xa2' Named: 'argument lookup'.
            check: xm1 Against: 'xm1' Named: 'local lookup'.
            check: xm2 Against: 'xm2' Named: 'local lookup'.
            check: xm3 Against: 'xm3' Named: 'local lookup'.
            check: xm4 Against: 'xm4' Named: 'local lookup'.
            check: xm5 Against: 'xm5' Named: 'local lookup'.
            check: xm6 Against: 'xm6' Named: 'local lookup'.
            check: xm7 Against: 'xm7' Named: 'local lookup'.
            check: xm8 Against: 'xm8' Named: 'local lookup'.
            check: xm9 Against: 'xm9' Named: 'local lookup'.
            check: xm10 Against: 'xm10' Named: 'local lookup'.
            check: xm11 Against: 'xm11' Named: 'local lookup'.
            check: xm12 Against: 'xm12' Named: 'local lookup'.
            check: xr1 Against: 'xr1' Named: 'receiver lookup'.
            check: xr2 Against: 'xr2' Named: 'receiver lookup'.
            check: xp1 Against: 'xp1' Named: 'parent lookup'.
            check: xp2 Against: 'xp2' Named: 'parent lookup'.
            [ | :xba1. :xba2. xb1 <- 'xb1'. xb2 <- 'xb2' |
                check: xba1 Against: 'xba1' Named: 'block argument lookup'.
                check: xba2 Against: 'xba2' Named: 'block argument lookup'.
                check: xb1 Against: 'xb1' Named: 'block lookup'.
                check: xb2 Against: 'xb2' Named: 'block lookup'.
                check: xa1 Against: 'xa1' Named: 'argument lookup'.
                check: xa2 Against: 'xa2' Named: 'argument lookup'.
                check: xm1 Against: 'xm1' Named: 'local lookup'.
                check: xm2 Against: 'xm2' Named: 'local lookup'.
                check: xm3 Against: 'xm3' Named: 'local lookup'.
                check: xm4 Against: 'xm4' Named: 'local lookup'.
                check: xm5 Against: 'xm5' Named: 'local lookup'.
                check: xm6 Against: 'xm6' Named: 'local lookup'.
                check: xm7 Against: 'xm7' Named: 'local lookup'.
                check: xm8 Against: 'xm8' Named: 'local lookup'.
                check: xm9 Against: 'xm9' Named: 'local lookup'.
                check: xm10 Against: 'xm10' Named: 'local lookup'.
                check: xm11 Against: 'xm11' Named: 'local lookup'.
                check: xm12 Against: 'xm12' Named: 'local lookup'.
                check: xr1 Against: 'xr1' Named: 'receiver lookup'.
                check: xr2 Against: 'xr2' Named: 'receiver lookup'.
                check: xp1 Against: 'xp1' Named: 'parent lookup'.
                check: xp2 Against: 'xp2' Named: 'parent lookup'.
                check: [ xba1 ] Against: 'xba1' Named: 'nested argument lookup'.
                check: [ xba2 ] Against: 'xba2' Named: 'nested argument lookup'.
                check: [ xb1 ] Against: 'xb1' Named: 'nested block lookup'.
                check: [ xb2 ] Against: 'xb2' Named: 'nested block lookup'.
            ] value: 'xba1' With: 'xba2'.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> () From: ( | {
         'Category: VM tests\x7fCategory: lookup\x7fModuleInfo: Module: tests InitialContents: FollowSlot'
        
         lookupTest: xa1 Xa2: xa2 Xa3: xa3 Xa4: xa4 Xa5: xa5 Xa6: xa6 Xa7: xa7 Xa8: xa8 Xa9: xa9 Xa10: xa10 Xa11: xa11 Xa12: xa12 Xa13: xa13 Recursive: recursive = ( | {
                 'ModuleInfo: Module: tests InitialContents: FollowSlot'
                
                 w.
                }  {
                 'ModuleInfo: Module: tests InitialContents: FollowSlot'
                
                 xm1 <- 'xm1'.
                }  {
                 'ModuleInfo: Module: tests InitialContents: FollowSlot'
                
                 xm10 <- 'xm10'.
                }  {
                 'ModuleInfo: Module: tests InitialContents: FollowSlot'
                
                 xm11 <- 'xm11'.
                }  {
                 'ModuleInfo: Module: tests InitialContents: FollowSlot'
                
                 xm12 <- 'xm12'.
                }  {
                 'ModuleInfo: Module: tests InitialContents: FollowSlot'
                
                 xm2 <- 'xm2'.
                }  {
                 'ModuleInfo: Module: tests InitialContents: FollowSlot'
                
                 xm3 <- 'xm3'.
                }  {
                 'ModuleInfo: Module: tests InitialContents: FollowSlot'
                
                 xm4 <- 'xm4'.
                }  {
                 'ModuleInfo: Module: tests InitialContents: FollowSlot'
                
                 xm5 <- 'xm5'.
                }  {
                 'ModuleInfo: Module: tests InitialContents: FollowSlot'
                
                 xm6 <- 'xm6'.
                }  {
                 'ModuleInfo: Module: tests InitialContents: FollowSlot'
                
                 xm7 <- 'xm7'.
                }  {
                 'ModuleInfo: Module: tests InitialContents: FollowSlot'
                
                 xm8 <- 'xm8'.
                }  {
                 'ModuleInfo: Module: tests InitialContents: FollowSlot'
                
                 xm9 <- 'xm9'.
                } 
            | 
            check: xa1 Against: 'xa1' Named: 'argument lookup'.
            check: xa2 Against: 'xa2' Named: 'argument lookup'.
            check: xa3 Against: 'xa3' Named: 'argument lookup'.
            check: xa4 Against: 'xa4' Named: 'argument lookup'.
            check: xa5 Against: 'xa5' Named: 'argument lookup'.
            check: xa6 Against: 'xa6' Named: 'argument lookup'.
            check: xa7 Against: 'xa7' Named: 'argument lookup'.
            check: xa8 Against: 'xa8' Named: 'argument lookup'.
            check: xa9 Against: 'xa9' Named: 'argument lookup'.
            check: xa10 Against: 'xa10' Named: 'argument lookup'.
            check: xa11 Against: 'xa11' Named: 'argument lookup'.
            check: xa12 Against: 'xa12' Named: 'argument lookup'.
            check: xa13 Against: 'xa13' Named: 'argument lookup'.
            check: xm1 Against: 'xm1' Named: 'local lookup'.
            check: xm2 Against: 'xm2' Named: 'local lookup'.
            check: xm3 Against: 'xm3' Named: 'local lookup'.
            check: xm4 Against: 'xm4' Named: 'local lookup'.
            check: xm5 Against: 'xm5' Named: 'local lookup'.
            check: xm6 Against: 'xm6' Named: 'local lookup'.
            check: xm7 Against: 'xm7' Named: 'local lookup'.
            check: xm8 Against: 'xm8' Named: 'local lookup'.
            check: xm9 Against: 'xm9' Named: 'local lookup'.
            check: xm10 Against: 'xm10' Named: 'local lookup'.
            check: xm11 Against: 'xm11' Named: 'local lookup'.
            check: xm12 Against: 'xm12' Named: 'local lookup'.
            memory scavenge.                  "test scavenging of extra args"
            w: _WizardMode: true.             "include expr stack in stack trace"
            process this lowLevelStackTrace.  "should break if scavenge isn't ok"
            _WizardMode: w.
            recursive ifFalse: [
                  lookupTest: xa1 Xa2: xa2 Xa3: xa3 Xa4: xa4
                                    Xa5: xa5 Xa6: xa6 Xa7: xa7
                                    Xa8: xa8 Xa9: xa9 Xa10: xa10
                                    Xa11: xa11 Xa12: xa12 Xa13: xa13
                                    Recursive: true ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> () From: ( | {
         'Category: VM tests\x7fModuleInfo: Module: tests InitialContents: FollowSlot\x7fVisibility: public'
        
         lowLevelTest = ( |
            | 
            tests lowLevel run.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> () From: ( | {
         'Category: VM tests\x7fCategory: messages and inheritance\x7fModuleInfo: Module: tests InitialContents: FollowSlot\x7fVisibility: public'
        
         messageTest = ( |
            | 
            check: [ sender example ] Named: 'message interception and resending'.
            check: [ transmitter example ]
                Named: 'message interception and broadcasting'.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> () From: ( | {
         'Category: VM tests\x7fCategory: lookup\x7fModuleInfo: Module: tests InitialContents: FollowSlot'
        
         mirrorLookupTestObject = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'tests' -> 'mirrorLookupTestObject' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals tests mirrorLookupTestObject.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'mirrorLookupTestObject' -> () From: ( | {
         'ModuleInfo: Module: tests InitialContents: FollowSlot'
        
         baz <- 'fooey'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'mirrorLookupTestObject' -> () From: ( | {
         'ModuleInfo: Module: tests InitialContents: FollowSlot'
        
         p1* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'tests' -> 'mirrorLookupTestObject' -> 'p1' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals tests mirrorLookupTestObject p1.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'mirrorLookupTestObject' -> 'p1' -> () From: ( | {
         'ModuleInfo: Module: tests InitialContents: FollowSlot'
        
         bar = bootstrap stub -> 'globals' -> 'nil' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'mirrorLookupTestObject' -> 'p1' -> () From: ( | {
         'ModuleInfo: Module: tests InitialContents: FollowSlot'
        
         foo = 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'mirrorLookupTestObject' -> () From: ( | {
         'ModuleInfo: Module: tests InitialContents: FollowSlot'
        
         p2* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'tests' -> 'mirrorLookupTestObject' -> 'p2' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals tests mirrorLookupTestObject p2.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'mirrorLookupTestObject' -> 'p2' -> () From: ( | {
         'ModuleInfo: Module: tests InitialContents: FollowSlot'
        
         baz = 'blah'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'mirrorLookupTestObject' -> 'p2' -> () From: ( | {
         'ModuleInfo: Module: tests InitialContents: FollowSlot'
        
         foo = bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> () From: ( | {
         'Category: VM tests\x7fCategory: lookup\x7fModuleInfo: Module: tests InitialContents: FollowSlot\x7fVisibility: public'
        
         mirrorLookupTests = ( |
             failed <- bootstrap stub -> 'globals' -> 'false' -> ().
             mir.
             pth.
            | 
            mir:  reflect: mirrorLookupTestObject.
            pth:  mir pathToKey: 'baz' 
                       Multiple: [|:p| path]
                           None: [path].
              check:  pth
            Against:  (path copyWith: 'baz')
              Named:  'mirror lookup 1'.

            pth:  mir pathToKey: 'bar' 
                       Multiple: [|:p| path]
                           None: [path].
              check:  pth
            Against:  (path copyWith: 'p1' With: 'bar')
              Named:  'mirror lookup 2'.

            pth:  mir pathToKey: 'blah' 
                       Multiple: [|:p| true]
                           None: [false].
              check:  pth
            Against:  false
              Named:  'mirror lookup 3'.

            pth:  mir pathToKey: 'foo' 
                       Multiple: [|:p| p]
                           None: [path].
              check:  pth 
            Against:  (((set copy)
                         add: (path copyWith: 'p1' With: 'foo'))
                         add: (path copyWith: 'p2' With: 'foo'))
              Named:  'mirror lookup 4').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> () From: ( | {
         'Category: VM tests\x7fModuleInfo: Module: tests InitialContents: FollowSlot\x7fVisibility: public'
        
         mirrorTest = ( |
             m.
             nm.
            | 
            'Testing mirror operations...' printLine.
            m:  reflect: ( |
                    parent1* = traits clonable.
                    parent2* = traits oddball.
                    slot1 = 17.
                    aMethod: b With: a = (17 + 4 asFloat).
                | ).
            check: [m size] Against: 4 Named: 'mirror size test'.
            check: [(m slotAt: 'parent1') key] Against: 'parent1'
                Named: 'mirror slot name test'.
            check: [(m slotAt: 'slot1') value] Against: [reflect: 17]
                Named: 'mirror value test'.
            check: [(m slotAt: 'parent2') longKey] 
                Against: 'parent2*'
                Named: 'mirror long key test'.
            check: [(m slotAt: 'aMethod:With:') value source]
                Against: '17 + 4 asFloat'
                Named: 'mirror source test'.
            check: [(m slotAt: 'aMethod:With:') longKey]
                Against: 'aMethod: b With: a'
                Named: 'mirror key test'.
            check: [ lexicalParentTest ]
                Against: true
                Named: 'lexical parent test'.
            nm: _NakedMethods.
            (true & false) asVector do: [|:tf|
              _NakedMethods: tf.
              check: [ nakedMethodTest ]
                  Against: _NakedMethods
                  Named: 'naked method test'.
            ].
            _NakedMethods: nm.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> () From: ( | {
         'Category: VM tests\x7fModuleInfo: Module: tests InitialContents: FollowSlot'
        
         mismatchedArgumentCountSelector: sel Type: msgType Delegatee: del MethodHolder: mh Arguments: args = ( |
            | 
            sel != 'stackTest' ifTrue: [
                process this suspendAndTrace: 
                    (((((processErrors mismatchedArgumentCountSelector copy
                        receiver:     self)
                        selector:     sel)
                        type:         msgType)
                        delegatee:    del)
                        methodHolder: mh)
                        arguments:    args.
            ].
            args size = 2 ifFalse: [^error: 'wrong size arguments vector'].
            (1 = (args at: 0)) && ['asd' = (args at: 1)] ifFalse: [
                ^error: 'wrong arguments'].
            'argumentMismatch').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> () From: ( | {
         'Category: processes\x7fModuleInfo: Module: tests InitialContents: FollowSlot\x7fVisibility: public'
        
         monitorTest = ( |
            | 
            'Testing monitors... ' print.
            monitor monitorTest. 
            'done.' printLine.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> () From: ( | {
         'Category: VM tests\x7fCategory: unwind protect and non-local returns\x7fModuleInfo: Module: tests InitialContents: InitializeToExpression: (nil)'
        
         nlrEvalBlock.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> () From: ( | {
         'Category: VM tests\x7fCategory: unwind protect and non-local returns\x7fModuleInfo: Module: tests InitialContents: FollowSlot\x7fVisibility: public'
        
         nlrEvalTest = ( |
            | 
            nlrEvalBlock: [ ^ 'nlrResult' ].
            'tests nlrEvalBlock value' eval.
            'failed').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> () From: ( | {
         'Category: VM tests\x7fCategory: unwind protect and non-local returns\x7fModuleInfo: Module: tests InitialContents: FollowSlot\x7fVisibility: public'
        
         nlrInliningTest = ( |
            | 
            'testing NLR inlining ... ' print.
            ( _Interpret || [ _Inline not ] ifTrue: 10 False: 10000 )
               do: [tests nlrInliningTestMethod].
            'ok' printLine).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> () From: ( | {
         'Category: VM tests\x7fCategory: unwind protect and non-local returns\x7fComment: Run this repeatedly to test if inlining the loop breaks nlrs.
One possible fault is that the whole stack unwinds! -- Mario, 2/8/95\x7fModuleInfo: Module: tests InitialContents: FollowSlot\x7fVisibility: private'
        
         nlrInliningTestMethod = ( |
             n <- 0.
             s <- semaphore copyCount: 1 Capacity: 1.
            | 
            [| :exit |
             n: n succ.
             s protect: [n = 2 ifTrue: exit].
             n = 5 ifTrue: [error: 'shouldn\'t get here'].
            ] loopExit.
            n).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> () From: ( | {
         'Category: numbers and other magnitudes\x7fModuleInfo: Module: tests InitialContents: FollowSlot\x7fVisibility: public'
        
         numberTest = ( |
            | 
            tests number run.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> () From: ( | {
         'Category: test suites\x7fModuleInfo: Module: tests InitialContents: FollowSlot'
        
         objs = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'tests' -> 'objs' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals tests objs.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'objs' -> () From: ( | {
         'ModuleInfo: Module: tests InitialContents: FollowSlot'
        
         a = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'tests' -> 'objs' -> 'a' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals tests objs a.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'objs' -> 'a' -> () From: ( | {
         'ModuleInfo: Module: tests InitialContents: FollowSlot'
        
         foo = ( |
            | x).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'objs' -> () From: ( | {
         'ModuleInfo: Module: tests InitialContents: FollowSlot'
        
         b = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'tests' -> 'objs' -> 'b' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals tests objs b.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'objs' -> 'b' -> () From: ( | {
         'ModuleInfo: Module: tests InitialContents: FollowSlot'
        
         x = 'b'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'objs' -> () From: ( | {
         'ModuleInfo: Module: tests InitialContents: FollowSlot'
        
         c = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'tests' -> 'objs' -> 'c' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals tests objs c.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'objs' -> 'c' -> () From: ( | {
         'ModuleInfo: Module: tests InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'globals' -> 'tests' -> 'objs' -> 'a' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'objs' -> 'c' -> () From: ( | {
         'ModuleInfo: Module: tests InitialContents: FollowSlot'
        
         x = 'c'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'objs' -> () From: ( | {
         'ModuleInfo: Module: tests InitialContents: FollowSlot'
        
         d = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'tests' -> 'objs' -> 'd' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals tests objs d.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'objs' -> 'd' -> () From: ( | {
         'ModuleInfo: Module: tests InitialContents: FollowSlot'
        
         delegatedX = ( |
            | parent1.x).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'objs' -> 'd' -> () From: ( | {
         'ModuleInfo: Module: tests InitialContents: FollowSlot'
        
         parent1* = bootstrap stub -> 'globals' -> 'tests' -> 'objs' -> 'b' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'objs' -> 'd' -> () From: ( | {
         'ModuleInfo: Module: tests InitialContents: FollowSlot'
        
         parent2* = bootstrap stub -> 'globals' -> 'tests' -> 'objs' -> 'c' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'objs' -> () From: ( | {
         'ModuleInfo: Module: tests InitialContents: FollowSlot'
        
         e = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'tests' -> 'objs' -> 'e' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals tests objs e.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'objs' -> 'e' -> () From: ( | {
         'ModuleInfo: Module: tests InitialContents: FollowSlot'
        
         parent1* = bootstrap stub -> 'globals' -> 'tests' -> 'objs' -> 'b' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'objs' -> 'e' -> () From: ( | {
         'ModuleInfo: Module: tests InitialContents: FollowSlot'
        
         parent2* = bootstrap stub -> 'globals' -> 'tests' -> 'objs' -> 'c' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'objs' -> () From: ( | {
         'ModuleInfo: Module: tests InitialContents: FollowSlot'
        
         f = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'tests' -> 'objs' -> 'f' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals tests objs f.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'objs' -> 'f' -> () From: ( | {
         'ModuleInfo: Module: tests InitialContents: FollowSlot'
        
         parent1* = bootstrap stub -> 'globals' -> 'tests' -> 'objs' -> 'a' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'objs' -> 'f' -> () From: ( | {
         'ModuleInfo: Module: tests InitialContents: FollowSlot'
        
         parent2* = bootstrap stub -> 'globals' -> 'tests' -> 'objs' -> 'b' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'objs' -> () From: ( | {
         'ModuleInfo: Module: tests InitialContents: FollowSlot'
        
         g = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'tests' -> 'objs' -> 'g' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals tests objs g.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'objs' -> 'g' -> () From: ( | {
         'ModuleInfo: Module: tests InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'globals' -> 'tests' -> 'objs' -> 'b' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'objs' -> () From: ( | {
         'ModuleInfo: Module: tests InitialContents: FollowSlot'
        
         h = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'tests' -> 'objs' -> 'h' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals tests objs h.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'objs' -> 'h' -> () From: ( | {
         'ModuleInfo: Module: tests InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'globals' -> 'tests' -> 'objs' -> 'b' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'objs' -> () From: ( | {
         'ModuleInfo: Module: tests InitialContents: FollowSlot'
        
         i = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'tests' -> 'objs' -> 'i' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals tests objs i.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'objs' -> 'i' -> () From: ( | {
         'ModuleInfo: Module: tests InitialContents: FollowSlot'
        
         parent1* = bootstrap stub -> 'globals' -> 'tests' -> 'objs' -> 'g' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'objs' -> 'i' -> () From: ( | {
         'ModuleInfo: Module: tests InitialContents: FollowSlot'
        
         parent2* = bootstrap stub -> 'globals' -> 'tests' -> 'objs' -> 'h' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'objs' -> () From: ( | {
         'ModuleInfo: Module: tests InitialContents: FollowSlot'
        
         j = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'tests' -> 'objs' -> 'j' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals tests objs j.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'objs' -> 'j' -> () From: ( | {
         'ModuleInfo: Module: tests InitialContents: FollowSlot'
        
         x = 'b'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'objs' -> () From: ( | {
         'ModuleInfo: Module: tests InitialContents: FollowSlot'
        
         k = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'tests' -> 'objs' -> 'k' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals tests objs k.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'objs' -> 'k' -> () From: ( | {
         'ModuleInfo: Module: tests InitialContents: FollowSlot'
        
         x = 'c'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'objs' -> () From: ( | {
         'ModuleInfo: Module: tests InitialContents: FollowSlot'
        
         l = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'tests' -> 'objs' -> 'l' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals tests objs l.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'objs' -> 'l' -> () From: ( | {
         'ModuleInfo: Module: tests InitialContents: FollowSlot'
        
         parent1* = bootstrap stub -> 'globals' -> 'tests' -> 'objs' -> 'j' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'objs' -> 'l' -> () From: ( | {
         'ModuleInfo: Module: tests InitialContents: FollowSlot'
        
         parent2* = bootstrap stub -> 'globals' -> 'tests' -> 'objs' -> 'k' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'objs' -> () From: ( | {
         'ModuleInfo: Module: tests InitialContents: FollowSlot'
        
         m = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'tests' -> 'objs' -> 'm' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals tests objs m.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'objs' -> 'm' -> () From: ( | {
         'ModuleInfo: Module: tests InitialContents: FollowSlot'
        
         foo = ( |
            | x).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'objs' -> 'm' -> () From: ( | {
         'ModuleInfo: Module: tests InitialContents: FollowSlot'
        
         x = 'a'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'objs' -> () From: ( | {
         'ModuleInfo: Module: tests InitialContents: FollowSlot'
        
         n = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'tests' -> 'objs' -> 'n' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals tests objs n.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'objs' -> 'n' -> () From: ( | {
         'ModuleInfo: Module: tests InitialContents: FollowSlot'
        
         ambiguousSelector: sel Type: msgType Delegatee: del MethodHolder: mh Arguments: args = ( |
            | 
            'messageAmbiguous').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'objs' -> 'n' -> () From: ( | {
         'ModuleInfo: Module: tests InitialContents: FollowSlot'
        
         bar = ( |
            | x).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'objs' -> 'n' -> () From: ( | {
         'Comment: don\'t reverse the order here; that\'s what\'s being tested!\x7fModuleInfo: Module: tests InitialContents: FollowSlot'
        
         parent1* = bootstrap stub -> 'globals' -> 'tests' -> 'objs' -> 'l' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'objs' -> 'n' -> () From: ( | {
         'ModuleInfo: Module: tests InitialContents: FollowSlot'
        
         parent2* = bootstrap stub -> 'globals' -> 'tests' -> 'objs' -> 'm' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'objs' -> () From: ( | {
         'ModuleInfo: Module: tests InitialContents: FollowSlot'
        
         o = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'tests' -> 'objs' -> 'o' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals tests objs o.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'objs' -> 'o' -> () From: ( | {
         'ModuleInfo: Module: tests InitialContents: FollowSlot'
        
         foo = ( |
            | x).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'objs' -> 'o' -> () From: ( | {
         'ModuleInfo: Module: tests InitialContents: FollowSlot'
        
         x <- 'a'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'objs' -> () From: ( | {
         'ModuleInfo: Module: tests InitialContents: FollowSlot'
        
         p = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'tests' -> 'objs' -> 'p' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals tests objs p.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'objs' -> 'p' -> () From: ( | {
         'ModuleInfo: Module: tests InitialContents: FollowSlot'
        
         foo = ( |
            | x).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'objs' -> 'p' -> () From: ( | {
         'ModuleInfo: Module: tests InitialContents: FollowSlot'
        
         x <- 'b'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'objs' -> () From: ( | {
         'ModuleInfo: Module: tests InitialContents: FollowSlot'
        
         q = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'tests' -> 'objs' -> 'q' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals tests objs q.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'objs' -> 'q' -> () From: ( | {
         'ModuleInfo: Module: tests InitialContents: FollowSlot'
        
         parent* <- bootstrap stub -> 'globals' -> 'tests' -> 'objs' -> 'p' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'objs' -> () From: ( | {
         'ModuleInfo: Module: tests InitialContents: FollowSlot'
        
         r = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'tests' -> 'objs' -> 'r' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals tests objs r.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'objs' -> 'r' -> () From: ( | {
         'ModuleInfo: Module: tests InitialContents: FollowSlot'
        
         ambiguousSelector: sel Type: msgType Delegatee: del MethodHolder: mh Arguments: args = ( |
            | 
            'messageAmbiguous').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'objs' -> 'r' -> () From: ( | {
         'ModuleInfo: Module: tests InitialContents: FollowSlot'
        
         foo1 = ( |
            | parent1.foo).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'objs' -> 'r' -> () From: ( | {
         'ModuleInfo: Module: tests InitialContents: FollowSlot'
        
         foo2 = ( |
            | parent2.foo).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'objs' -> 'r' -> () From: ( | {
         'ModuleInfo: Module: tests InitialContents: FollowSlot'
        
         parent1* <- bootstrap stub -> 'globals' -> 'tests' -> 'objs' -> 'p' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'objs' -> 'r' -> () From: ( | {
         'ModuleInfo: Module: tests InitialContents: FollowSlot'
        
         parent2* <- bootstrap stub -> 'globals' -> 'tests' -> 'objs' -> 'p' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'objs' -> () From: ( | {
         'ModuleInfo: Module: tests InitialContents: FollowSlot'
        
         s = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'tests' -> 'objs' -> 's' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals tests objs s.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'objs' -> 's' -> () From: ( | {
         'ModuleInfo: Module: tests InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'globals' -> 'tests' -> 'objs' -> 'q' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'objs' -> () From: ( | {
         'ModuleInfo: Module: tests InitialContents: FollowSlot'
        
         t = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'tests' -> 'objs' -> 't' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals tests objs t.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'objs' -> 't' -> () From: ( | {
         'ModuleInfo: Module: tests InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'globals' -> 'tests' -> 'objs' -> 'r' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'objs' -> () From: ( | {
         'ModuleInfo: Module: tests InitialContents: FollowSlot'
        
         u = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'tests' -> 'objs' -> 'u' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals tests objs u.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'objs' -> () From: ( | {
         'ModuleInfo: Module: tests InitialContents: FollowSlot'
        
         w = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'tests' -> 'objs' -> 'w' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals tests objs w.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'objs' -> 'u' -> () From: ( | {
         'ModuleInfo: Module: tests InitialContents: FollowSlot'
        
         parent* <- bootstrap stub -> 'globals' -> 'tests' -> 'objs' -> 'w' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'objs' -> () From: ( | {
         'ModuleInfo: Module: tests InitialContents: FollowSlot'
        
         v = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'tests' -> 'objs' -> 'v' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals tests objs v.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'objs' -> () From: ( | {
         'ModuleInfo: Module: tests InitialContents: FollowSlot'
        
         x = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'tests' -> 'objs' -> 'x' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals tests objs x.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'objs' -> 'v' -> () From: ( | {
         'ModuleInfo: Module: tests InitialContents: FollowSlot'
        
         parent* <- bootstrap stub -> 'globals' -> 'tests' -> 'objs' -> 'x' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'objs' -> 'w' -> () From: ( | {
         'ModuleInfo: Module: tests InitialContents: FollowSlot'
        
         parent* <- bootstrap stub -> 'globals' -> 'tests' -> 'objs' -> 'p' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'objs' -> 'x' -> () From: ( | {
         'ModuleInfo: Module: tests InitialContents: FollowSlot'
        
         ambiguousSelector: sel Type: msgType Delegatee: del MethodHolder: mh Arguments: args = ( |
            | 
            'messageAmbiguous').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'objs' -> 'x' -> () From: ( | {
         'ModuleInfo: Module: tests InitialContents: FollowSlot'
        
         foo1 = ( |
            | parent1.foo).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'objs' -> 'x' -> () From: ( | {
         'ModuleInfo: Module: tests InitialContents: FollowSlot'
        
         foo2 = ( |
            | parent2.foo).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'objs' -> 'x' -> () From: ( | {
         'ModuleInfo: Module: tests InitialContents: FollowSlot'
        
         parent1* <- bootstrap stub -> 'globals' -> 'tests' -> 'objs' -> 'p' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'objs' -> 'x' -> () From: ( | {
         'ModuleInfo: Module: tests InitialContents: FollowSlot'
        
         parent2* <- bootstrap stub -> 'globals' -> 'tests' -> 'objs' -> 'p' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'objs' -> () From: ( | {
         'ModuleInfo: Module: tests InitialContents: FollowSlot'
        
         y = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'tests' -> 'objs' -> 'y' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals tests objs y.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'objs' -> 'y' -> () From: ( | {
         'ModuleInfo: Module: tests InitialContents: FollowSlot'
        
         baz2 <- 1.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'objs' -> 'y' -> () From: ( | {
         'ModuleInfo: Module: tests InitialContents: FollowSlot'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'tests' -> 'objs' -> 'y' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals tests objs y parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'objs' -> 'y' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: tests InitialContents: FollowSlot'
        
         baz <- 1.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'objs' -> 'y' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: tests InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'lobby' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'objs' -> () From: ( | {
         'ModuleInfo: Module: tests InitialContents: FollowSlot'
        
         z = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'tests' -> 'objs' -> 'z' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals tests objs z.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'objs' -> 'z' -> () From: ( | {
         'ModuleInfo: Module: tests InitialContents: FollowSlot'
        
         parent* <- bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'tests' -> 'objs' -> 'z' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals tests objs z parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'objs' -> 'z' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: tests InitialContents: FollowSlot'
        
         baz <- 1.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'objs' -> 'z' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: tests InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'lobby' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> () From: ( | {
         'Category: collections\x7fComment: a simle test -- dmu 2/97\x7fModuleInfo: Module: tests InitialContents: FollowSlot\x7fVisibility: public'
        
         orderedDictionaryTests = ( |
             ks.
             n = 1000.
             ns.
             od.
            | 
            'building orderedDictionary keys' printLine.
            ns: set copyRemoveAll.
            ns addAll: n. "ns is set of first N ints"
            ks: list copyRemoveAll.
            [ns isEmpty] whileFalse: [|i|
              i: random integer: n.
              (ns includes: i) ifTrue: [
                ks addLast: i.
                ns remove: i.
              ].
            ].
            'testing orderedDictionary' printLine.
            "now ks is random-ordered list of first N ints"
            od: orderedDictionary copy.
            ks do: [|:k|  od at: k Put: k * 17].
            od do: [|:v. :k|
              k = ks removeFirst  ifFalse: [error: 'bad key'].
              v = (k * 17)        ifFalse: [error: 'bad value'].
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> () From: ( | {
         'ModuleInfo: Module: tests InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'oddball' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> () From: ( | {
         'Category: VM tests\x7fCategory: lookup\x7fModuleInfo: Module: tests InitialContents: FollowSlot\x7fVisibility: public'
        
         parentInMethodTest = ( |
             p* = bootstrap stub -> 'globals' -> 'tests' -> 'parentObj' -> ().
            | 
            check: [foo] Against: 42 Named: 'parent in method'.
            foo: 43.
            check: [foo] Against: 43 Named: 'parent in method'.
            foo: 42).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> () From: ( | {
         'Category: VM tests\x7fCategory: lookup\x7fModuleInfo: Module: tests InitialContents: FollowSlot'
        
         parentObj = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'tests' -> 'parentObj' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals tests parentObj.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'parentObj' -> () From: ( | {
         'ModuleInfo: Module: tests InitialContents: InitializeToExpression: (42)'
        
         foo <- 42.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> () From: ( | {
         'Category: VM tests\x7fModuleInfo: Module: tests InitialContents: FollowSlot\x7fVisibility: public'
        
         parserTest = ( |
            | 
            'Testing the parser...' printLine.
            check: [oldParser parser testXYZ ] Named: 'parser testXYZ'.
            check: [oldParser parser testOnePlusTwo] Named: 'parser testOnePlusTwo'.
            check: [oldParser parser testRandom ] Named: 'parser testRandom'.
            check: [oldParser parser testAddPoints ] Named: 'parser testAddPoints'.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> () From: ( | {
         'Category: VM tests\x7fCategory: perform tests\x7fComment: Build a stack, including a _Perform, then force
frame conversion of all frames.\x7fModuleInfo: Module: tests InitialContents: FollowSlot\x7fVisibility: public'
        
         performConversionTest = ( |
             env* = bootstrap stub -> 'lobby' -> ().
             p.
             t.
            | 
            process this isScheduled  ifFalse: [ warning: 'cannot do performConversionTest without scheduler'. ^ self].
            t: conversionTestObj _Clone.
            p: (message copy receiver: t Selector: 'test') fork.
            p waitForSuspension.
            "This causes each frame, including the _Perform-sending
             frame, to be converted"
            p stackDepth = 0  ifTrue: [ error: 'I need the scheduler!'].
            p stackDepth to: 2 By: -1 Do: [|:i|
              i = p stackDepth ifFalse: [^ i].
              p _KillActivationsUpTo: 1.
            ].
            t _Mirror addSlots: (| foob = 42 |) _Mirror.
            p resume.
            p waitForDeath.
            p returnValue printLine).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> () From: ( | {
         'Category: VM tests\x7fCategory: perform tests\x7fModuleInfo: Module: tests InitialContents: FollowSlot'
        
         performEvalTest <- 'evalTest'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> () From: ( | {
         'Category: VM tests\x7fCategory: perform tests\x7fModuleInfo: Module: tests InitialContents: FollowSlot'
        
         performNotAString <- 17.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> () From: ( | {
         'Category: VM tests\x7fCategory: perform tests\x7fModuleInfo: Module: tests InitialContents: FollowSlot'
        
         performRandomMessage <- 'randomMessage:'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> () From: ( | {
         'Category: VM tests\x7fCategory: perform tests\x7fModuleInfo: Module: tests InitialContents: FollowSlot'
        
         performStackTest <- 'stackTest'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> () From: ( | {
         'Category: VM tests\x7fCategory: perform tests\x7fModuleInfo: Module: tests InitialContents: FollowSlot'
        
         performSumFromTo <- 'sumFrom:To:'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> () From: ( | {
         'Category: VM tests\x7fCategory: perform tests\x7fModuleInfo: Module: tests InitialContents: FollowSlot\x7fVisibility: public'
        
         performTest = ( |
             upLevel.
            | 
            'Testing perform primitive...' printLine.
            check: [ _Perform: performStackTest ] Named: 'perform stackTest'.
            check: [ 0 _Perform: performSumFromTo With: 1 With: 10000 ]
                Against: 50005000 Named: 'perform 0 sumFrom: 1 To: 10000'.
            check: [ _Perform: performStackTest With: 1 With: 'asd' ]
                Against: 'argumentMismatch'
                Named: 'perform with argument mismatch'.
            check: [ _Perform: performRandomMessage With: 23 ]
                Against: 'messageNotUnderstood' Named: 'perform randomMessage: 23'.
            check: [ _Perform: performNotAString ]
                Against: 'performTypeError' Named: 'perform 17'.
            check: [ _Perform: [upLevel] ] Against: 'performTypeError'
                Named: 'perform [upLevel]'.
            check: [ _Perform: performEvalTest ] 
                Against: 6 Named: 'perform evalTest'.
            check: [ nlrEvalTest ] Against: 'nlrResult' Named: 'nlrEvalTest'.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> () From: ( | {
         'Category: VM tests\x7fCategory: perform tests\x7fModuleInfo: Module: tests InitialContents: FollowSlot'
        
         performTypeErrorSelector: sel Type: msgType Delegatee: del MethodHolder: mh Arguments: args = ( |
            | 
                (sel = 17)
            || [(reflect: sel) isReflecteeBlock] ifFalse: [
                process this suspendAndTrace: 
                    (((((processErrors performTypeErrorSelector copy
                        receiver:     self)
                        selector:     sel)
                        type:         msgType)
                        delegatee:    del)
                        methodHolder: mh)
                        arguments:    args.
            ].
            args size = 0 ifFalse: [^error: 'wrong size arguments vector'].
            'performTypeError').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> () From: ( | {
         'Category: VM tests\x7fModuleInfo: Module: tests InitialContents: FollowSlot'
        
         perverseFac: n = ( |
            | 
            n <= 1
                ifTrue: [
                    process this lowLevelStackTrace. 
                    1 ]
                False: [ | s |
                    s: 'tests perverseFac: ', (n - 1) printString. 
                    s eval * n ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> () From: ( | {
         'Category: application-level tests\x7fModuleInfo: Module: tests InitialContents: FollowSlot\x7fVisibility: public'
        
         primitiveMakerTest = ( |
            | 
            'Testing the primitive maker...' printLine.
            check: [ primitiveMaker reader test ] 
            Named: 'static primitive maker'.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> () From: ( | {
         'Category: test suites\x7fModuleInfo: Module: tests InitialContents: FollowSlot\x7fVisibility: public'
        
         runAllTests = ( |
            | 
            runSelfSuite.
            runVMSuite.
            benchmarkTest.              "too slow without inlining"
            "Do last, cause cannot turn it back on without snapshotting--dmu 12/92"
            uncanonicalizedMapsTest.
            _Verify.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> () From: ( | {
         'Category: test suites\x7fComment: Tests of low-level operations\x7fModuleInfo: Module: tests InitialContents: FollowSlot\x7fVisibility: public'
        
         runNICSuite = ( |
             errorMessages.
            | 
            errorMessages: list copyRemoveAll.
            startOfTests.

            [
                immediateTest.
                lookupTest.
                parentInMethodTest.
                inheritanceTest.
                diTest.
                unwindProtectTest.
                nlrInliningTest.
                lowLevelTest.
                mirrorTest.
                enumerationTest.
                timeTest.
                stackTest.
                performTest.
                branches runWithoutNicOrScheduler.
                programming run.
                diProgramming run.
                programmingPrims run.
                performConversionTest.
                positionTableTest.
                killTwiceTest.
                sicAllocationTest.
                divAndModTest.
                [ messageTest        ] twiceWithInlineCacheFlushingBetween.
                [ parserTest         ] twiceWithInlineCacheFlushingBetween.
            ] value.
            _Interpret ifFalse: [ browsingTest. sourceStringTest ]. "too slow for non-inlined"
            snapshotWritingTest.        "no point in doing this twice"

            endOfTests: errorMessages.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> () From: ( | {
         'Category: test suites\x7fComment: Tests of Self-level structures.\x7fModuleInfo: Module: tests InitialContents: FollowSlot\x7fVisibility: public'
        
         runSelfSuite = ( |
             errorMessages.
            | 
            errorMessages: list copyRemoveAll.
            startOfTests.

            [integerTest.
             traits smallInt unitTests run.
             floatTest.
             arithmeticTest.
             divAndModTest.
             listTest.
             treeTest.
             vectorTest.
             stringTest.
             textLinesTest.
             string tokenizingUnitTests run.
             sequenceTest.
             orderedSet unitTests run.
             traits indexable unitTests run.
             traits byteVector unitTests run.
             traits universalSetOrDictionary unitTests run.
             messageTest.
             parserTest.
             errorHandlingTest run.
             numberTest.          
             comparator tests doTests.
             sortedSequence tests doTests.
             sharedSetAndDictionaryTests.
             sharedQueueTests.
             orderedDictionaryTests.
             monitorTest.
             mirrorLookupTests.
             browse unitTests run.
             deltablueTest.
             uiTest: errorMessages.
             primitiveMakerTest.
            ] withAndWithoutInlining.

            [
              "We do not use the so-called fast transporter anymore
               so it does not seem worth testing. -- dmu "
               transporter fast test.      "slow city" 
            ].

            endOfTests: errorMessages.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> () From: ( | {
         'Category: test suites\x7fComment: Tests of low-level operations\x7fModuleInfo: Module: tests InitialContents: FollowSlot\x7fVisibility: public'
        
         runVMSuite = ( |
             errorMessages.
            | 
            errorMessages: list copyRemoveAll.
            startOfTests.

            eqInliningRelocationTest.
            [
                immediateTest.
                conversionPrologueTest.
                lookupTest.
                parentInMethodTest.
                inheritanceTest.
                diTest.
                unwindProtectTest.
                nlrInliningTest.
                lowLevelTest.
                resending run.
                mirrorTest.
                enumerationTest.
                timeTest.
                stackTest.
                performTest.
                branches run.
                programming run.
                diProgramming run.
                programmingPrims run.
                performConversionTest.
                positionTableTest.
                killTwiceTest.
                sicAllocationTest.
                june2005BugTest.
                divAndModTest.
                [ messageTest        ] twiceWithInlineCacheFlushingBetween.
                [ parserTest         ] twiceWithInlineCacheFlushingBetween.
                _Interpret ifFalse: [ browsingTest. sourceStringTest ].
            ] withAndWithoutInlining.

            snapshotWritingTest.        "no point in doing this twice"

            endOfTests: errorMessages.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> () From: ( | {
         'Category: collections\x7fModuleInfo: Module: tests InitialContents: FollowSlot\x7fVisibility: public'
        
         sequenceTest = ( | {
                 'ModuleInfo: Module: tests InitialContents: FollowSlot'
                
                 s.
                } 
            | 
            'Testing sequence operations...' printLine.
            check: [ s: sequence copy. s ] Against: sequence Named: 'sequence copy'.
            check: [ s add: 2 ] Named: 'add: 2'.
            check: [ s add: -3.34 ] Named: 'add: -3.34'.
            check: [ s addFirst: 1 ] Named: 'addFirst: 1'.
            check: [ s copy ] Against: s Named: 's copy = s'.
            check: [ s remove: 2 ] Named: 'remove: 2'.
            check: [ s removeLast ] Named: 'removeLast'.
            check: [ s removeFirst ] Named: 'removeFirst'.
            check: [ s: s copySize: 10 FillingWith: 'asd'. s ]
                Named: 'copySize: 10 FillingWith: \'asd\''.
            check: [ s at: 3 Put: 4.5 ] Named: 'at: 3 Put: 4.5'.
            check: [ s at: 2 ] Against: 'asd' Named: 'at: 2'.
            check: [ s at: 3 ] Against: 4.5 Named: 'at: 3'.
            check: [ s removeKey: 3 ] Named: 'removeKey: 3'.
            check: [ s removeKey: 0 ] Named: 'removeKey: 0'.
            check: [ s removeKey: s size pred ] Named: 'removeKey: s size pred'.
            check: [ s addFirst: 8 ] Named: 'addFirst: 8'.
            check: [ s addFirst: 7 ] Named: 'addFirst: 7'.
            check: [ s addFirst: 6 ] Named: 'addFirst: 6'.
            check: [ s addFirst: 5 ] Named: 'addFirst: 5'.
            check: [ s addFirst: 4 ] Named: 'addFirst: 4'.
            check: [ s addFirst: 3 ] Named: 'addFirst: 3'.
            check: [ s addFirst: 2 ] Named: 'addFirst: 2'.
            check: [ s addFirst: 1 ] Named: 'addFirst: 1'.
            check: [ s addLast: 1 ] Named: 'addLast: 1'.
            check: [ s addLast: 2 ] Named: 'addLast: 2'.
            check: [ s addLast: 3 ] Named: 'addLast: 3'.
            check: [ s addLast: 4 ] Named: 'addLast: 4'.
            check: [ s addLast: 5 ] Named: 'addLast: 5'.
            check: [ s addLast: 6 ] Named: 'addLast: 6'.
            check: [ s addLast: 7 ] Named: 'addLast: 7'.
            check: [ s addLast: 8 ] Named: 'addLast: 8'.
            check: [ s addLast: 9 ] Named: 'addLast: 9'.
            check: [ s addLast: 10 ] Named: 'addLast: 10'.
            check: [ s addLast: 11 ] Named: 'addLast: 11'.
            check: [ s addLast: 12 ] Named: 'addLast: 12'.
            check: [ (sequence copySize: 7) mapBy: 25 ]
                Against: (sequence copySize: 7 FillingWith: 25)
                Named: 'sequence copy & mapBy'.

            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> () From: ( | {
         'Category: collections\x7fCategory: multi-threaded collections\x7fCategory: keyed collections\x7fModuleInfo: Module: tests InitialContents: FollowSlot\x7fVisibility: public'
        
         sharedDictionaryTests: useMT = ( |
             b1.
             b2.
             b3.
             p1.
             p2.
             p3.
             sd.
            | 
            sd:  sharedDictionary copy.

            b1: [1000 do: [sd  at: (random integer: 100) Put: (random integer: 100)]].
            b2: [1000 do: [sd remove: (random integer: 100) IfAbsent: nil]].
            b3: [1000 do: [sd removeKey: (random integer: 100) IfAbsent: nil]].

            useMT ifFalse: [ b1 value. b2 value. b3 value. ]
              True: [
              p1: (message copy  receiver: b1 Selector: 'value') fork.
              p2: (message copy  receiver: b2 Selector: 'value') fork.
              p3: (message copy  receiver: b3 Selector: 'value') fork.

              p1 waitForDeath.  p2 waitForDeath.  p3 waitForDeath.
            ].

            100 do: [|:n| sd removeKey: n IfAbsent: nil].
            check:  sd size  Against:  0  Named:  'shared dictionary test').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> () From: ( | {
         'Category: collections\x7fCategory: multi-threaded collections\x7fModuleInfo: Module: tests InitialContents: FollowSlot\x7fVisibility: public'
        
         sharedQueueTests = ( |
            | 
            sharedQueueTests: false.
            [sharedQueueTests: true]. "disabled because it fails -- dmu 3/97"
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> () From: ( | {
         'Category: collections\x7fCategory: multi-threaded collections\x7fComment: For this and other MT tests, first try serially,
then with MT. That will help isolate the bug. -- dmu\x7fModuleInfo: Module: tests InitialContents: FollowSlot\x7fVisibility: public'
        
         sharedQueueTests: useMT = ( |
             blk.
             failed <- bootstrap stub -> 'globals' -> 'false' -> ().
             ps.
             q.
            | 
            q: sharedQueue copy.
            ps: list copyRemoveAll.
            blk: [ 1000 do: [
                     | elem = 'aString' |
                     q add: elem.
                     q removeFirst = elem ifFalse: [failed: true]]].
            10 do: [ 
              useMT ifFalse:  blk  True: [
                | msg |
                msg:  message copy receiver: blk Selector: 'value'.
                ps add: msg fork.
              ].
            ].
            ps do: [| :p | p waitForDeath ].
            check: q size  Against: 0     Named: 'shared queue cardinality'.
            check: failed  Against: false Named: 'shared queue consistency'.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> () From: ( | {
         'Category: collections\x7fCategory: multi-threaded collections\x7fCategory: keyed collections\x7fModuleInfo: Module: tests InitialContents: FollowSlot\x7fVisibility: public'
        
         sharedSetAndDictionaryTests = ( |
            | 
            sharedSetTests: false.
            sharedSetTests: true.
            sharedDictionaryTests: false.
            sharedDictionaryTests: true).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> () From: ( | {
         'Category: collections\x7fCategory: multi-threaded collections\x7fCategory: keyed collections\x7fModuleInfo: Module: tests InitialContents: FollowSlot\x7fVisibility: public'
        
         sharedSetTests: useMT = ( |
             b.
             b1.
             b2.
             failed.
             p1.
             p2.
             ss.
            | 
            ss:  sharedSet copy.
            failed:  false.
            b:  (message copy
                  receiver: 
                    [1000 do: 
                      [ss add: 'x'.
                      ss size > 1 ifTrue: [failed: true].
                      ss remove: 'x' IfAbsent: nil]]
                  Selector: 'value').
            useMT ifFalse: [b value. b value]  True: [
              p1:  b fork.      p2:  b fork.
              p1 waitForDeath.  p2 waitForDeath.
            ].
            check:  ss size  Against:   0   Named:  'shared set cardinality'.
            check:  failed   Against: false Named:  'shared set interference'.

            ss:  sharedSet copy.
            b1: [1000 do: [ss add: (random integer: 100)]].
            b2: [1000 do: [ss remove: (random integer: 100) IfAbsent: nil]].

            useMT ifFalse: [ b1 value. b2 value ] True: [
              p1: (message copy  receiver: b1 Selector: 'value') fork.
              p2: (message copy  receiver: b2 Selector: 'value') fork.
              p1 waitForDeath.
              p2 waitForDeath.
            ].
            100 do: [|:n| ss remove: n IfAbsent: nil].
            check:  ss size  Against:  0  Named:  'shared set cardinality 2').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> () From: ( | {
         'Category: test suites\x7fComment: these tests are too slow to run in the normal run suite\x7fModuleInfo: Module: tests InitialContents: FollowSlot\x7fVisibility: public'
        
         slowRunSuite = ( |
            | 
            gcDerivedPointersTest.
            tests programmingPrims slowRun.
            _Verify.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> () From: ( | {
         'Category: VM tests\x7fModuleInfo: Module: tests InitialContents: FollowSlot\x7fVisibility: public'
        
         snapshotWritingTest = ( | {
                 'ModuleInfo: Module: tests InitialContents: FollowSlot'
                
                 f = 'test_snap'.
                } 
            | 
            'Testing writing a snapshot...' printLine.
            check: [ f _WriteSnapshot ] Against: f 
                Named: '\'test_snap\' _WriteSnapshot'.
            os unlink: f IfFail: [warning: 'could not unlink test_snap'].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> () From: ( | {
         'Category: VM tests\x7fComment: All methods should have parseable sources -- Mario, 1/6/95\x7fModuleInfo: Module: tests InitialContents: FollowSlot\x7fVisibility: public'
        
         sourceStringTest = ( |
            | 
            'parsing all methods\' sources ... ' print.
            browse all do: [|:m|
              (m type = 'method') || [m type = 'blockMethod'] ifTrue: [
                m mustBeDisassembled ifFalse: [
                        m source _ParseObjectIntoPositionTableIfFail: [|:e|
                          "this is required for methods with empty bodies"
                          m evalName _ParseObjectIntoPositionTableIfFail: [|:e|
                            error: 'Unparseable source for mirror ', m printString
                          ]
                        ]
                      ]
              ]
            ].
            ' ok' printLine).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> () From: ( | {
         'Category: VM tests\x7fModuleInfo: Module: tests InitialContents: FollowSlot\x7fVisibility: public'
        
         stackTest = ( | {
                 'ModuleInfo: Module: tests InitialContents: FollowSlot'
                
                 m = 'test local'.
                }  {
                 'ModuleInfo: Module: tests InitialContents: FollowSlot'
                
                 q <- 'another test local'.
                } 
            | 
            'running lowLevelStackTrace...' printLine.
            [ | :x. n <- 17. | n: 20. process this lowLevelStackTrace. x. ]
                value: vector copy With: list copyRemoveAll.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> () From: ( | {
         'Category: infrastructure\x7fModuleInfo: Module: tests InitialContents: FollowSlot\x7fVisibility: private'
        
         startOfTests = ( |
            | 
            '\nStarting test suite ...' printLine.
            _Verify).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> () From: ( | {
         'Category: collections\x7fModuleInfo: Module: tests InitialContents: FollowSlot\x7fVisibility: public'
        
         stringTest = ( |
            | 
            'Testing string operations...' printLine.
            check: [ 'asd' copyWithoutLast ] Against: 'as'
                Named: '\'asd\' copyWithoutLast'.
            check: [ 'ab' = ('a', 'b')] Against: true
                Named: 'string concatenation'.
            check: [ whiteSpaceTestString leadingWhiteSpace ] Against: 4
                Named: '\'\\t\\n\\r abc\' leadingWhiteSpace'.
            check: [
                | strings <- vector. hashs1 <- vector. hashs2 <- vector. |
                strings: 10 asVector mapBy: [random string: 10].
                hashs1: strings copy mapBy: [|:str| str hash].
                memory garbageCollect.
                hashs2: strings copy mapBy: [|:str| str hash].
                hashs1 = hashs2.
            ] Against: true Named: 'if string hash is preserved across GC'.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> () From: ( | {
         'Category: numbers and other magnitudes\x7fComment: not in line to avoid constant-folding \x7fModuleInfo: Module: tests InitialContents: FollowSlot'
        
         testInt <- 3.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> () From: ( | {
         'Category: infrastructure\x7fCategory: method creation\x7fComment: Test the code in the VM that creates methods from bytecodes.
Given a mirror on a method,
recreate the method and execute it.
Return the result\x7fModuleInfo: Module: tests InitialContents: FollowSlot\x7fVisibility: public'
        
         testMethodCreationCodes: codes Literals: literals Slots: mir IfFail: fb = ( |
             h.
             nm.
            | 
            nm:  _CreateOuterMethodBytecodes: codes
                                    Literals: literals
                                        File: ''
                                        Line: 0
                                      Source: ''
                                      IfFail: [|:e| ^ fb value: e].
            nm: nm copyAddSlots: mir IfFail: [|:e| ^ fb value: e].
            h: reflect: ( | parent* = traits oddball | ).
            h: h copyAt: 'a' PutContents: nm IfFail: [|:e| ^ fb value: e].
            do_NIC_or_SIC: [h reflectee a]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> () From: ( | {
         'Category: collections\x7fModuleInfo: Module: tests InitialContents: FollowSlot\x7fVisibility: public'
        
         textLinesTest = ( |
            | 
            'Testing textLines...' printLine.
            check: [ 'asd\nqwe\n' asTextLines lines ]
                Against: ('asd' & 'qwe' & '') asList
                Named: '\'asd\\nqwe\\n\' asTextLines lines'.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> () From: ( | {
         'Category: numbers and other magnitudes\x7fModuleInfo: Module: tests InitialContents: FollowSlot\x7fVisibility: public'
        
         timeTest = ( |
            | 
            "Testing time parsing and time conversion"
            check: [|r| r: time current printString.
                       (time copyFromString: r) printString = r]
              Against: true
              Named: 'time test').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> () From: ( | {
         'Category: collections\x7fModuleInfo: Module: tests InitialContents: FollowSlot\x7fVisibility: public'
        
         treeTest = ( |
            | 
            'Testing tree operations...' printLine.
            check: [ treeSet example ] Named: 'treeSet example'.
            check: [ treeBag example ] Named: 'treeBag example'.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> () From: ( | {
         'Category: ui1\x7fModuleInfo: Module: tests InitialContents: FollowSlot\x7fVisibility: public'
        
         uiTest: errorMessages = ( |
            | 
                    ui testIfBadDisplay: [ | :err |
                        ('Not testing ui: ', err) printLine.
                        errorMessages add:
            ' 
             #    #     #             #####  ######   ####    #####
             #    #     #               #    #       #          #
             #    #     #               #    #####    ####      #
             #    #     #               #    #            #     #
             #    #     #               #    #       #    #     #
              ####      #               #    ######   ####      #

                                              ###
             #####      #    #####   #    #   ###     #####          #####   #    #  #    #
             #    #     #    #    #  ##   #    #        #            #    #  #    #  ##   #
             #    #     #    #    #  # #  #   #         #            #    #  #    #  # #  #
             #    #     #    #    #  #  # #             #            #####   #    #  #  # #
             #    #     #    #    #  #   ##             #            #   #   #    #  #   ##
             #####      #    #####   #    #             #            #    #   ####   #    #

            '.
                    ].
                    self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> () From: ( | {
         'Category: test suites\x7fComment: Do last, cause cannot turn it back on without snapshotting--dmu 12/92\x7fModuleInfo: Module: tests InitialContents: FollowSlot\x7fVisibility: public'
        
         uncanonicalizedMapsTest = ( |
            | 
            "must not canonicalize maps - otherwise some conversions are "
            "suppressed  -- Urs 10/92"
            _CanonicalizeMaps: false.  
            tests   programming run.
            tests diProgramming run.
            tests programmingPrims run).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> () From: ( | {
         'Category: VM tests\x7fCategory: lookup\x7fModuleInfo: Module: tests InitialContents: FollowSlot'
        
         undefinedSelector: sel Type: msgType Delegatee: del MethodHolder: mh Arguments: args = ( |
            | 
            sel != 'randomMessage:' ifTrue: [
                process this suspendAndTrace: 
                    (((((processErrors undefinedSelector copy
                        receiver:     self)
                        selector:     sel)
                        type:         msgType)
                        delegatee:    del)
                        methodHolder: mh)
                        arguments:    args.
            ].
            args size = 1 ifFalse: [^error: 'wrong size arguments vector'].
            (23 = (args at: 0)) ifFalse: [^error: 'wrong arguments'].
            'messageNotUnderstood').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> () From: ( | {
         'Category: VM tests\x7fCategory: unwind protect and non-local returns\x7fModuleInfo: Module: tests InitialContents: FollowSlot'
        
         unwindProtectFn1 = ( |
            | 
            [ _Scavenge. 'normal return' ]
                onNonLocalReturn: [ 'error return' ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> () From: ( | {
         'Category: VM tests\x7fCategory: unwind protect and non-local returns\x7fModuleInfo: Module: tests InitialContents: FollowSlot'
        
         unwindProtectFn2 = ( |
            | 
            [ _Scavenge. ^ 'non-local return' ] onNonLocalReturn:
                [ | :x | _Scavenge. x, ' (caught)' ].
            'error return').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> () From: ( | {
         'Category: VM tests\x7fCategory: unwind protect and non-local returns\x7fModuleInfo: Module: tests InitialContents: FollowSlot'
        
         unwindProtectFn3 = ( | {
                 'ModuleInfo: Module: tests InitialContents: FollowSlot'
                
                 r.
                } 
            | 
            r: unwindProtectFn3b: [ |:x| _Scavenge. ^ x, ' (caught)' ].
            r, ' (and continued)').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> () From: ( | {
         'Category: VM tests\x7fCategory: unwind protect and non-local returns\x7fModuleInfo: Module: tests InitialContents: FollowSlot'
        
         unwindProtectFn3b: protectBlock = ( |
            | 
            [ _Scavenge. ^ 'non-local return' ]
                onNonLocalReturn: protectBlock.
            'error return').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> () From: ( | {
         'Category: VM tests\x7fCategory: unwind protect and non-local returns\x7fModuleInfo: Module: tests InitialContents: FollowSlot\x7fVisibility: public'
        
         unwindProtectTest = ( |
            | 
            'Testing unwind protection...' printLine.
            check: [ unwindProtectFn1 ] Against: 'normal return'
                Named: 'normal return'.
            check: [ unwindProtectFn2 ] Against: 'non-local return (caught)'
                Named: 'non-local return'.
            check: [ unwindProtectFn3 ]
                Against: 'non-local return (caught) (and continued)'
                Named: 'more non-local return'.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> () From: ( | {
         'Category: collections\x7fModuleInfo: Module: tests InitialContents: FollowSlot\x7fVisibility: public'
        
         vectorTest = ( | {
                 'ModuleInfo: Module: tests InitialContents: FollowSlot'
                
                 a <- 3.
                }  {
                 'ModuleInfo: Module: tests InitialContents: InitializeToExpression: (byteVector copySize: 10)'
                
                 bv <- byteVector copySize: 10.
                }  {
                 'ModuleInfo: Module: tests InitialContents: InitializeToExpression: (vector copySize: 10)'
                
                 v <- vector copySize: 10.
                } 
            | 
            'Testing vector operations...' printLine.
            check: [ (vector copySize: 7) mapBy: 25 ]
                Against: (vector copySize: 7 FillingWith: 25)
                Named: 'vector copy & mapBy'.

            "The _At:, _At:Put:, _ByteAt: and _ByteAt:Put: methods used to be
             called with the corresponding at:, at:Put: etc. arguments directly.
             This failed with badTypeError, if the index was a bigInt.
             Now we are sending asSmallInteger to the arguments first.
             Ole Agesen, Oct. 1991."
            a: 3 asBigInteger.
            v at: a Put: 'a potato'.
            check: [  v at: a ] Against: [  v at: 3 ] Named: 'vector at: aBigInt'.
            bv at: a Put: 71.
            check: [ bv at: a ] Against: [ bv at: 3 ] 
                                  Named: 'byteVector at: aBigInt'.

            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> () From: ( | {
         'Category: collections\x7fModuleInfo: Module: tests InitialContents: FollowSlot'
        
         whiteSpaceTestString <- '	

 abc'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> () From: ( | {
         'Category: VM tests\x7fCategory: lookup\x7fModuleInfo: Module: tests InitialContents: FollowSlot'
        
         xr1 <- 'xr1'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> () From: ( | {
         'Category: VM tests\x7fCategory: lookup\x7fModuleInfo: Module: tests InitialContents: FollowSlot'
        
         xr2 <- 'xr2'.
        } | ) 



 '-- Sub parts'

 bootstrap read: 'programmingTests' From: 'tests'
 bootstrap read: 'debugTests' From: 'tests'
 bootstrap read: 'lowLevelTests' From: 'tests'
 bootstrap read: 'numberTests' From: 'tests'
 bootstrap read: 'deltablue' From: 'tests'
 bootstrap read: 'sicTests' From: 'tests'
 bootstrap read: 'branchTests' From: 'tests'
 bootstrap read: 'nicTests' From: 'tests'
 bootstrap read: 'testSuite' From: 'tests'
 bootstrap read: 'languageTests' From: 'tests'



 '-- Side effects'

 globals modules tests postFileIn
