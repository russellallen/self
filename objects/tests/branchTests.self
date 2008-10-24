 '$Revision: 30.13 $'
 '
Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: branchTests InitialContents: FollowSlot'
        
         branchTests = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'branchTests' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'branchTests' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules branchTests.

CopyDowns:
globals modules init. copy 
SlotsToOmit: directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'branchTests' -> () From: ( | {
         'ModuleInfo: Module: branchTests InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'tests'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'branchTests' -> () From: ( | {
         'ModuleInfo: Module: branchTests InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'branchTests' -> () From: ( | {
         'ModuleInfo: Module: branchTests InitialContents: FollowSlot'
        
         myComment <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'branchTests' -> () From: ( | {
         'ModuleInfo: Module: branchTests InitialContents: FollowSlot'
        
         postFileIn = ( |
            | resend.postFileIn).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'branchTests' -> () From: ( | {
         'ModuleInfo: Module: branchTests InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- '$Revision: 30.13 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'branchTests' -> () From: ( | {
         'ModuleInfo: Module: branchTests InitialContents: FollowSlot\x7fVisibility: private'
        
         subpartNames <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> () From: ( | {
         'Category: VM tests\x7fModuleInfo: Module: branchTests InitialContents: FollowSlot'
        
         branches = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'tests' -> 'branches' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals tests branches.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'branches' -> () From: ( | {
         'Category: block zapping\x7fModuleInfo: Module: branchTests InitialContents: FollowSlot\x7fVisibility: private'
        
         blockZappingCalleeMethod = ( |
             tricky.
            | 
            "ensure that backwards branches do not
             result in unzapped blocks"
            "Create a block, branch back,
             return said block, & have my caller
             try to invoke it."
            __DefineLabel: 'again'.
            "fall through the first time, return block 2nd time"
            [|:a| nil != a ifTrue: [^ a]] value: tricky.
            tricky: [ ^ 'narf' ].
            __BranchTo: 'again').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'branches' -> () From: ( | {
         'Category: block zapping\x7fModuleInfo: Module: branchTests InitialContents: FollowSlot\x7fVisibility: private'
        
         blockZappingCallerMethod = ( |
            | 
            ( do_NIC_or_SIC: [ blockZappingCalleeMethod ] ) value).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'branches' -> () From: ( | {
         'ModuleInfo: Module: branchTests InitialContents: FollowSlot\x7fVisibility: public'
        
         check: checkB Against: againstB Named: name = ( |
            | 
            ('testing ', (testSIC ifTrue: 'SIC ' False: 'NIC '), name, '...') print.
            do_NIC_or_SIC: [ [ checkB value = againstB value ] assert ].
            '' printLine.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'branches' -> () From: ( | {
         'ModuleInfo: Module: branchTests InitialContents: FollowSlot'
        
         do_NIC_or_SIC: b = ( |
             r.
            | 
            (testSIC ifTrue: 20000 False: [_Flush. 1] ) do: [r: b value].
            r).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'branches' -> () From: ( | {
         'Category: indexed\x7fModuleInfo: Module: branchTests InitialContents: FollowSlot'
        
         indexedInLoop: x = ( |
             i <- 0.
            | 
            __DefineLabel: 'loop'.
                    i: i succ.
                    i == 5 ifTrue: [^ 'ok'].
            666 __BranchIndexedBy: x To: 'loop'.
            error: 'just checking').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'branches' -> () From: ( | {
         'Category: conditional\x7fModuleInfo: Module: branchTests InitialContents: FollowSlot'
        
         max: a And: b = ( |
            | 
            a __BranchIfFalse: a < b To: 'end'.
            b __DefineLabel: 'end').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'branches' -> () From: ( | {
         'Category: conditional\x7fModuleInfo: Module: branchTests InitialContents: FollowSlot'
        
         min: a And: b = ( |
            | 
            a __BranchIfTrue: a < b To: 'end'.
            b __DefineLabel: 'end').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'branches' -> () From: ( | {
         'Category: no expression stack\x7fModuleInfo: Module: branchTests InitialContents: FollowSlot'
        
         noStack = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'tests' -> 'branches' -> 'noStack' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals tests branches noStack.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'branches' -> 'noStack' -> () From: ( | {
         'Category: false\x7fModuleInfo: Module: branchTests InitialContents: FollowSlot'
        
         falseBackwards = ( |
             t <- bootstrap stub -> 'globals' -> 'false' -> ().
            | 
            __BranchTo: 'theFuture'.
            error: 'should have branched'.

            __DefineLabel: 'thePresent'.
            [t = false] assert.
            t: t not.
            __DefineLabel: 'theFuture'.
            __BranchIfFalse: t To: 'thePresent'.
            [t = true] assert.
            'ok').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'branches' -> 'noStack' -> () From: ( | {
         'Category: false\x7fModuleInfo: Module: branchTests InitialContents: FollowSlot'
        
         falseForwards = ( |
             t <- bootstrap stub -> 'globals' -> 'true' -> ().
            | 
            __BranchIfFalse: t To: 'oops'.
            t: t not.
            __BranchIfFalse: t To: 'end'.
            error: 'should have branched'.
            __DefineLabel: 'oops'.
            error: 'should not have branched'.
            __DefineLabel: 'end'.
            'ok').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'branches' -> 'noStack' -> () From: ( | {
         'Category: indexed\x7fModuleInfo: Module: branchTests InitialContents: FollowSlot'
        
         indexedBackwards = ( |
             t.
            | 
            __BranchTo: 'fwd'.
            __DefineLabel: 'oops'.
            error: 'should not be here'.

            __DefineLabel: 'ok'.
            __BranchTo: 'end'.

            __DefineLabel: 'fwd'.
            __BranchIndexedBy: t To: 'oops'.
            t: -1.
            __BranchIndexedBy: t To: 'oops'.
            t: 1.
            __BranchIndexedBy: t To: 'oops'.
            __BranchIndexedBy: t To: 'oops' To: 'ok' To: 'oops'.

            error: 'should not get here'.
            __DefineLabel: 'end'.
            'ok').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'branches' -> 'noStack' -> () From: ( | {
         'Category: indexed\x7fModuleInfo: Module: branchTests InitialContents: FollowSlot'
        
         indexedBackwardsConstant = ( |
            | 
            __BranchTo: 'fwd'.
            __DefineLabel: 'oops'.
            error: 'should not be here'.

            __DefineLabel: 'ok'.
            __BranchTo: 'end'.

            __DefineLabel: 'fwd'.
            __BranchIndexedBy: () To: 'oops'.
            __BranchIndexedBy: -1 To: 'oops'.
            __BranchIndexedBy: 1 To: 'oops'.
            __BranchIndexedBy: 1 To: 'oops' To: 'ok' To: 'oops'.

            error: 'should not get here'.
            __DefineLabel: 'end'.
            'ok').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'branches' -> 'noStack' -> () From: ( | {
         'Category: indexed\x7fModuleInfo: Module: branchTests InitialContents: FollowSlot'
        
         indexedBackwardsInteger = ( |
             t.
             z <- 0.
            | 
            __BranchTo: 'fwd'.
            __DefineLabel: 'oops'.
            error: 'should not be here'.

            __DefineLabel: 'ok'.
            __BranchTo: 'end'.

            __DefineLabel: 'fwd'.
            __BranchIndexedBy: () _Clone To: 'oops'.
            t: -1.
            __BranchIndexedBy: (t _IntAdd: z) To: 'oops'.
            t: 1.
            __BranchIndexedBy: (t _IntAdd: z) To: 'oops'.
            __BranchIndexedBy: (t _IntAdd: z) To: 'oops' To: 'ok' To: 'oops'.

            error: 'should not get here'.
            __DefineLabel: 'end'.
            'ok').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'branches' -> 'noStack' -> () From: ( | {
         'Category: indexed\x7fModuleInfo: Module: branchTests InitialContents: FollowSlot'
        
         indexedForwards = ( |
             t.
             w <- 0.
            | 
            __BranchIndexedBy: t To: 'oops'.
            w: 1.
            t: -1.
            __BranchIndexedBy: t To: 'oops'.
            w: 2.
            t: 1.
            __BranchIndexedBy: t To: 'oops'.
            w: 3.
            __BranchIndexedBy: t To: 'oops' To: 'ok' To: 'oops1'.
            w: 4.
            __DefineLabel: 'oops'.
            error: 'should not get here'.
            __DefineLabel: 'oops1'.
            error: 'or here'.
            __DefineLabel: 'ok'.
            'ok').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'branches' -> 'noStack' -> () From: ( | {
         'Category: indexed\x7fModuleInfo: Module: branchTests InitialContents: FollowSlot'
        
         indexedForwardsConstant = ( |
            | 
            __BranchIndexedBy: () To: 'oops'.
            __BranchIndexedBy: -1 To: 'oops'.
            __BranchIndexedBy: 1 To: 'oops'.
            __BranchIndexedBy: 1 To: 'oops' To: 'ok' To: 'oops'.
            __DefineLabel: 'oops'.
            error: 'should not get here'.
            __DefineLabel: 'ok'.
            'ok').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'branches' -> 'noStack' -> () From: ( | {
         'Category: indexed\x7fModuleInfo: Module: branchTests InitialContents: FollowSlot'
        
         indexedForwardsInteger = ( |
             t.
             z <- 0.
            | 
            __BranchIndexedBy: () _Clone To: 'oops'.
            t: -1.
            __BranchIndexedBy: ( t _IntAdd: z ) To: 'oops'.
            t: 1.
            __BranchIndexedBy: ( t _IntAdd: z ) To: 'oops'.
            __BranchIndexedBy: ( t _IntAdd: z ) To: 'oops' To: 'ok' To: 'oops'.
            __DefineLabel: 'oops'.
            error: 'should not get here'.
            __DefineLabel: 'ok'.
            'ok').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'branches' -> 'noStack' -> () From: ( | {
         'ModuleInfo: Module: branchTests InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'globals' -> 'tests' -> 'branches' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'branches' -> 'noStack' -> () From: ( | {
         'ModuleInfo: Module: branchTests InitialContents: FollowSlot'
        
         run = ( |
            | 
            unconditionalForwards.
            unconditionalBackwards.
            trueForwards.
            trueBackwards.
            falseForwards.
            falseBackwards.
            indexedForwards.
            indexedBackwards.
            indexedForwardsConstant.
            indexedBackwardsConstant.
            indexedForwardsInteger.
            indexedBackwardsInteger).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'branches' -> 'noStack' -> () From: ( | {
         'Category: true\x7fModuleInfo: Module: branchTests InitialContents: FollowSlot'
        
         trueBackwards = ( |
             t <- bootstrap stub -> 'globals' -> 'true' -> ().
            | 
            __BranchTo: 'theFuture'.
            error: 'should have branched'.

            __DefineLabel: 'thePresent'.
            [t = true] assert.
            t: t not.
            __DefineLabel: 'theFuture'.
            __BranchIfTrue: t To: 'thePresent'.
            [t = false] assert.
            'ok').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'branches' -> 'noStack' -> () From: ( | {
         'Category: true\x7fModuleInfo: Module: branchTests InitialContents: FollowSlot'
        
         trueForwards = ( |
             t <- bootstrap stub -> 'globals' -> 'false' -> ().
            | 
            __BranchIfTrue: t To: 'oops'.
            t: t not.
            __BranchIfTrue: t To: 'end'.
            error: 'should have branched'.
            __DefineLabel: 'oops'.
            error: 'should not have branched'.
            __DefineLabel: 'end'.
            'ok').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'branches' -> 'noStack' -> () From: ( | {
         'Category: unconditional\x7fModuleInfo: Module: branchTests InitialContents: FollowSlot'
        
         unconditionalBackwards = ( |
             t <- 0.
            | 
            __DefineLabel: 'start'.
            t != 0 ifTrue: [^ 'ok'].
            t: 1.
            __BranchTo: 'start'.
            error: 'oops').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'branches' -> 'noStack' -> () From: ( | {
         'Category: unconditional\x7fModuleInfo: Module: branchTests InitialContents: FollowSlot'
        
         unconditionalForwards = ( |
            | 
            __BranchTo: 'zot'.
            error: 'oops'.
            __DefineLabel: 'zot'.
            'ok').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'branches' -> () From: ( | {
         'ModuleInfo: Module: branchTests InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'globals' -> 'tests' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'branches' -> () From: ( | {
         'ModuleInfo: Module: branchTests InitialContents: FollowSlot'
        
         run = ( |
            | 
            'Testing branches ...' printLine.

            testIllegalSyntax.

            testSIC: false. _Flush.
            2 do: [
              testUnconditionalBranches.
              testConditionalBranches.
              testIndexedBranches.
              testMethodCreation.
              testBlockZapping.
              testSIC: true.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'branches' -> () From: ( | {
         'ModuleInfo: Module: branchTests InitialContents: FollowSlot'
        
         runWithoutNicOrScheduler = ( |
            | 
            'Testing branches ...' printLine.

            testIllegalSyntax.

            testUnconditionalBranches.
            testConditionalBranches.
            testIndexedBranches.
            testMethodCreation.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'branches' -> () From: ( | {
         'Category: unconditional\x7fModuleInfo: Module: branchTests InitialContents: FollowSlot'
        
         testBackUnconditionalBranch = ( |
             i <- 0.
            | 
            i: 0 __DefineLabel: 'loop'.
            i > 9 ifTrue: [^i].
            i + 1 __BranchTo: 'loop').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'branches' -> () From: ( | {
         'Category: unconditional\x7fModuleInfo: Module: branchTests InitialContents: FollowSlot'
        
         testBigStackA: a B: b C: c D: d E: e F: f G: g H: h = ( |
             x.
            | 
               1 p: 10 P: 100 P: 1000 P: 10000 P: 100000 P: 1000000
            P: 7 P: 70 P: 700 P: 7000 P: 70000 P: 700000 P: 7000000 __BranchTo: 'add'.

            error: 'no no'.

            x:
             0 + ( 0 + ( 0 + ( 0 + ( 0 + ( 0 + ( 0 + (
             0 + ( 0 + ( 0 + ( 0 + ( 0 + ( 0 + ( 0 __DefineLabel: 'add' ))))))))))))).

            x = 8888888 ifTrue: 'ok' False: [error: 'wrong answer']).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'branches' -> () From: ( | {
         'Category: block zapping\x7fComment: tests block zapping in the face
of backwards branches\x7fModuleInfo: Module: branchTests InitialContents: FollowSlot\x7fVisibility: public'
        
         testBlockZapping = ( |
             p.
            | 
            "process stuff inspired by killTwiceTest"
            'testing block zapping w/ backward branches' printLine.
            process this isScheduled ifFalse: [error: 'I need the scheduler'].
            p: ( message copy receiver: self Selector: 'blockZappingCallerMethod' ) fork.
            p waitForSuspension.
            'zapping, should execute zapped block' printLine.
            [ 
              p causeOfError errorString  = processErrors nonLifoBlock errorString
            ] assert.
            'ok').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'branches' -> () From: ( | {
         'Category: conditional\x7fModuleInfo: Module: branchTests InitialContents: FollowSlot'
        
         testConditionalBranches = ( |
            | 
            check: [min: 1 And: 2]
              Against: 1
              Named: 'simple branch on true test'.

            check: [min: 'b' And: 'a']
              Against: 'a'
              Named: 'simple branch on true test'.

            check: [max: 1 And: 2]
              Against: 2
              Named: 'simple branch on false test'.

            check: [max: 'b' And: 'a']
              Against: 'b'
              Named: 'simple branch on false test').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'branches' -> () From: ( | {
         'Category: unconditional\x7fModuleInfo: Module: branchTests InitialContents: FollowSlot'
        
         testFwdUnconditionalBranch = ( |
            | 
            'ok' __BranchTo: 'fwd'.
            error: 'did not branch'.
            'bad' __DefineLabel: 'fwd').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'branches' -> () From: ( | {
         'Category: creating methods from bytecodes\x7fModuleInfo: Module: branchTests InitialContents: FollowSlot'
        
         testIllegalMethodCreation = ( |
            | 
            [ |:exit|
              "stack underflow"
              error: 
                testMethodCreationCodesAndOperands:  'pop' & nil
                IfFail: [|:e| exit value: e]
            ] exit.

            [ |:exit|
              "return last bc"
              error: 
                testMethodCreationCodesAndOperands:  'nonlocalReturn' & nil & 'literal' & 1
                IfFail: [|:e| exit value: e]
            ] exit.

            [ |:exit|
              "bad stack depth"
              error: 
                testMethodCreationCodesAndOperands:  'literal' & 1 & 'branchAlways' & 0
                IfFail: [|:e| exit value: e]
            ] exit.

            [|:exit| 
             "empty stack at end of method"
            error:
              testMethodCreationCodesAndOperands: 'branchAlways' & 1
              IfFail: [|:e| exit value: e]
            ] exit.

            [|:exit| 
             "empty stack at end of method"
            error:
              testMethodCreationCodesAndOperands: 
                'literal' & true & 
                'branchIfTrue' & 3 &
                'literal' & 1
              IfFail: [|:e| exit value: e]
            ] exit.

            [|:exit| 
             "empty stack at end of method"
            error:
              testMethodCreationCodesAndOperands:
                'literal' & 1 & 
                'literal' & true & 
                'branchIfTrue' & 4 &
                'pop' & nil
              IfFail: [|:e| exit value: e]
            ] exit).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'branches' -> () From: ( | {
         'Category: syntax errors\x7fModuleInfo: Module: branchTests InitialContents: FollowSlot'
        
         testIllegalSyntax = ( |
             x.
            | 
            x:  '__Snort' 
              & '__Snort: 3' 
              & '100 __DefineLabel: 3 + 4'
              & '__DefineLabel: self'
              & '__DefineLabel: 1.  snort __DefineLabel: 1 '
              & '__BranchTo: \'nowhere\''
              & 'push: 23 Push: 25 __BranchIfTrue: true To: 0.
                 17 __DefineLabel: 0'
              & '__BranchIndexedBy: 0'
              & '__BranchIndexedBy: 0 To: 23'
              & '__BranchIndexedBy: 0 To: 3 + 4'
              & '__BranchIndexedBy: 0 To: 1 And: 2.
                 __DefineLabel: 1.
                 __BranchTo: 2.
                 push: \'narf\' Push: \'zot\' __DefineLabel: 2'.
            x asVector do: [|:e| testIllegalSyntax: e].
            'ok').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'branches' -> () From: ( | {
         'Category: syntax errors\x7fModuleInfo: Module: branchTests InitialContents: FollowSlot'
        
         testIllegalSyntax: bodyString = ( |
            | 
            bodyString parseObjectBodyIfFail: [|:e| ^ e].
            error: bodyString storeString, ' should have failed to parse').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'branches' -> () From: ( | {
         'Category: indexed\x7fModuleInfo: Module: branchTests InitialContents: FollowSlot'
        
         testIndexedBranches = ( |
            | 
            check: [ testThreeCases: 'a']
             Against: 'fell'
             Named:   'branch indexed by string'.

            check: [ testThreeCases: -1]
             Against: 'fell'
             Named:   'branch indexed by -1'.

            check: [ testThreeCases: 3]
             Against: 'fell'
             Named:   'branch indexed by out of range'.

            check: [ testThreeCases: 0]
             Against: 'a'
             Named:   'branch indexed by 0'.

            check: [ testThreeCases: 1]
             Against: 'b'
             Named:   'branch indexed by 1'.

            check: [ testThreeCases: 2]
             Against: 'c'
             Named:   'branch indexed by 2'.

            check: [ indexedInLoop: 0 ]
              Against: 'ok'
              Named: 'branch indexed in loop'.

            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'branches' -> () From: ( | {
         'Category: creating methods from bytecodes\x7fModuleInfo: Module: branchTests InitialContents: FollowSlot'
        
         testLegalMethodCreation = ( |
             cl.
            | 
            cl: 
            "0"    'literal' & 1
            "1"  & 'literal' & 2
            "2"  & 'send' & '<' 
            "3"  & 'branchIfTrue' & 6
            "4"  & 'literal' & 3 
            "5"  & 'branchAlways' & 7
            "6"  & 'literal' & 4.

            'creating method from bytecodes w/ cond. branches' printLine.
            [(testMethodCreationCodesAndOperands: cl IfFail: raiseError) = 4] assert.

            'creating method from bytecodes w/ cond. branches' printLine.
            cl: (cl asVector at: 1 Put: 10) asList.
            [(testMethodCreationCodesAndOperands: cl IfFail: raiseError) = 3] assert.

            'creating method from bytecodes w/ cond. branches' printLine.
            cl: 'literal' & 0 & 'branchIndexed' & (vector copyAddFirst: 3)
              &  'branchAlways' & 3 & 'literal' & 17.
            [(testMethodCreationCodesAndOperands: cl IfFail: raiseError) = 17] assert.

            'ok').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'branches' -> () From: ( | {
         'Category: creating methods from bytecodes\x7fModuleInfo: Module: branchTests InitialContents: FollowSlot'
        
         testMethodCreation = ( |
            | 
            testLegalMethodCreation.
            testIllegalMethodCreation).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'branches' -> () From: ( | {
         'Category: creating methods from bytecodes\x7fModuleInfo: Module: branchTests InitialContents: FollowSlot'
        
         testMethodCreationCodesAndOperands: c IfFail: fb = ( |
             cl.
             codes <- bootstrap stub -> 'globals' -> 'byteVector' -> ().
             instructionSet.
             literals <- ((bootstrap stub -> 'globals') \/-> 'vector') -> ().
             r.
            | 
            instructionSet: bytecodeFormat mostRecentSelfInstructionSet.
            cl: c asList.
            [cl isEmpty] whileFalse: [ | b. lit |
              b:    cl removeFirst.
              lit:  cl removeFirst.
              lit  
                ifNil: [
                  codes: codes, (
                    byteVector copyAddFirst:  instructionSet bytecodeNamed: b).
              ] IfNotNil: [
                  codes: codes, (
                    byteVector copyAddFirst:  instructionSet bytecodeNamed: b Index: literals size).
                  literals: literals, ( vector copyAddFirst: lit ).
              ].
            ].
            testMethodCreationCodes: codes Literals: literals 
                              Slots: (reflect: ())
                             IfFail: fb).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'branches' -> () From: ( | {
         'ModuleInfo: Module: branchTests InitialContents: InitializeToExpression: (false)'
        
         testSIC <- bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'branches' -> () From: ( | {
         'Category: indexed\x7fModuleInfo: Module: branchTests InitialContents: FollowSlot'
        
         testThreeCases: x = ( |
            | 
            666 __BranchIndexedBy: x To: 'zero' To: 'one' To: 'two'.
            'fell' __BranchTo: 'end'.

            (__DefineLabel: 'zero') = 666 ifFalse: [error: 'bad expr'].
            'a' __BranchTo: 'end'.

            (__DefineLabel: 'one') = 666 ifFalse: [error: 'bad expr'].
            'b' __BranchTo: 'end'.

            (__DefineLabel: 'two') = 666 ifFalse: [error: 'bad expr'].
            'c' __BranchTo: 'end'.

            error: 'just checking'.

            'no way' __DefineLabel: 'end').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'branches' -> () From: ( | {
         'Category: unconditional\x7fModuleInfo: Module: branchTests InitialContents: FollowSlot'
        
         testUnconditionalBranches = ( |
            | 
            check: [testFwdUnconditionalBranch]
              Against: 'ok'
              Named: 'test forward unconditional branch'.

            check: [testBackUnconditionalBranch]
              Against: 10
              Named: 'test backward unconditional branch'.
            'ok'.

            testBigStackA: 1 B: 2 C: 3 D: 4 E: 5 F: nil G: 'snort' H: lobby).
        } | ) 



 '-- Side effects'

 globals modules branchTests postFileIn
