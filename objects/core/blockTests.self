 '$Revision:$'
 '
Copyright 1992-2012 AUTHORS.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: blockTests InitialContents: FollowSlot'
        
         blockTests = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'blockTests' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'blockTests' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules blockTests.

CopyDowns:
globals modules init. copy 
SlotsToOmit: directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'blockTests' -> () From: ( | {
         'ModuleInfo: Module: blockTests InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'core'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'blockTests' -> () From: ( | {
         'ModuleInfo: Module: blockTests InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'blockTests' -> () From: ( | {
         'ModuleInfo: Module: blockTests InitialContents: FollowSlot'
        
         myComment <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'blockTests' -> () From: ( | {
         'ModuleInfo: Module: blockTests InitialContents: FollowSlot'
        
         postFileIn = ( |
            | resend.postFileIn).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'blockTests' -> () From: ( | {
         'ModuleInfo: Module: blockTests InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- '$Revision:$'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'blockTests' -> () From: ( | {
         'ModuleInfo: Module: blockTests InitialContents: FollowSlot\x7fVisibility: private'
        
         subpartNames <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'block' -> () From: ( | {
         'Category: testing VM\x7fModuleInfo: Module: blockTests InitialContents: FollowSlot\x7fVisibility: public'
        
         vmTests = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'block' -> 'vmTests' -> () From: ( |
             {} = 'Comment: These tests use primitives instead of the regular +, -, *, etc. methods,
because those methods involve cloning failblocks. -- Adam, Apr. 2009\x7fModuleInfo: Creator: traits block vmTests.
\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'block' -> 'vmTests' -> () From: ( | {
         'Category: assertions\x7fModuleInfo: Module: blockTests InitialContents: FollowSlot\x7fVisibility: private'
        
         assert: b = ( |
            | 
            "Contorted so that we don't even depend on the
             'value' method existing on boolean objects.
             Useful for the Klein miniVM. -- Adam, Apr. 2009"
            __BranchIfTrue:  b       To: 'pass'.
            __BranchIfFalse: b       To: 'fail'.
            __BranchIfTrue:  b value To: 'pass'.
            __DefineLabel: 'fail'.
            error: 'block test failed'.
            __DefineLabel: 'pass'.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'block' -> 'vmTests' -> () From: ( | {
         'Category: assertions\x7fModuleInfo: Module: blockTests InitialContents: FollowSlot\x7fVisibility: private'
        
         assert: x Is: y = ( |
            | 
            "This method is just useful because you
             can click on x and y right in the debugger
             to see what the two values are."
            assert: x _Eq: y).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'block' -> 'vmTests' -> () From: ( | {
         'Category: assertions\x7fModuleInfo: Module: blockTests InitialContents: FollowSlot\x7fVisibility: private'
        
         assertFail: blk = ( |
            | 
            blk value: [^ self].
            fail).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'block' -> 'vmTests' -> () From: ( | {
         'Category: blocks\x7fModuleInfo: Module: blockTests InitialContents: FollowSlot\x7fVisibility: public'
        
         blockTest = ( |
            | 
            blockTest1.
            blockTest2.
            blockTest3.
            blockTest4.

            blockTestUplevel1.
            blockTestUplevel2.
            blockTestUplevel3: 45.

            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'block' -> 'vmTests' -> () From: ( | {
         'Category: blocks\x7fCategory: without uplevel accesses\x7fComment: no locals, no args\x7fModuleInfo: Module: blockTests InitialContents: FollowSlot\x7fVisibility: private'
        
         blockTest1 = ( |
            | 
            assert: [[42] value _IntEQ: 42]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'block' -> 'vmTests' -> () From: ( | {
         'Category: blocks\x7fCategory: without uplevel accesses\x7fComment: no locals, some args\x7fModuleInfo: Module: blockTests InitialContents: FollowSlot\x7fVisibility: private'
        
         blockTest2 = ( |
            | 
            assert: [([|:v| v] value: 42) _IntEQ: 42].
            assert: [([|:b. :a. :c| (b _IntMul: a) _IntSub: c] value: 10 With: 5 With: 8) _IntEQ: 42]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'block' -> 'vmTests' -> () From: ( | {
         'Category: blocks\x7fCategory: without uplevel accesses\x7fComment: some locals, no args\x7fModuleInfo: Module: blockTests InitialContents: FollowSlot\x7fVisibility: private'
        
         blockTest3 = ( |
            | 
            assert: [([|a = 1. b <- 2. c| c: a _IntAdd: b. c] value) _IntEQ: 3]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'block' -> 'vmTests' -> () From: ( | {
         'Category: blocks\x7fCategory: without uplevel accesses\x7fComment: some locals, some args\x7fModuleInfo: Module: blockTests InitialContents: FollowSlot\x7fVisibility: private'
        
         blockTest4 = ( |
            | 
            assert: [([|:v. :w. a <- 1. b = 2| (v _IntMul: w) _IntSub: (a _IntAdd: b)] value: 9 With: 5) _IntEQ: 42].
            assert: [([|:b. :a. :c. z = 9. aa <- 13 | aa: aa _IntAdd: (b _IntMul: a). (aa _IntDiv: z) _IntSub: c] 
                        value: 10 With: 5 With: 8) _IntEQ: -1]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'block' -> 'vmTests' -> () From: ( | {
         'Category: blocks\x7fCategory: with uplevel acceses\x7fComment: uplevel access to self\x7fModuleInfo: Module: blockTests InitialContents: FollowSlot\x7fVisibility: private'
        
         blockTestUplevel1 = ( |
            | 
            "lexical level = 1"
            assert: [blockTestUplevel1b].
            assert: [blockTestUplevel1c].
            assert: [blockTestUplevel1d].

            "lexical level = 2"
            [
              assert: [blockTestUplevel1b].
              assert: [blockTestUplevel1c].
              assert: [blockTestUplevel1d].
            ] value.

            "lexical level = 3"
            [
              assert: [[blockTestUplevel1b] value].
              assert: [[blockTestUplevel1c] value].
              assert: [[blockTestUplevel1d] value].
            ] value).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'block' -> 'vmTests' -> () From: ( | {
         'Category: blocks\x7fCategory: with uplevel acceses\x7fModuleInfo: Module: blockTests InitialContents: FollowSlot\x7fVisibility: private'
        
         blockTestUplevel1b = bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'block' -> 'vmTests' -> () From: ( | {
         'Category: blocks\x7fCategory: with uplevel acceses\x7fModuleInfo: Module: blockTests InitialContents: InitializeToExpression: (true)\x7fVisibility: private'
        
         blockTestUplevel1c <- bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'block' -> 'vmTests' -> () From: ( | {
         'Category: blocks\x7fCategory: with uplevel acceses\x7fModuleInfo: Module: blockTests InitialContents: FollowSlot\x7fVisibility: private'
        
         blockTestUplevel1d = ( |
             true = bootstrap stub -> 'globals' -> 'true' -> ().
            | 
            true).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'block' -> 'vmTests' -> () From: ( | {
         'Category: blocks\x7fCategory: with uplevel acceses\x7fComment: uplevel access to a local, and to self\x7fModuleInfo: Module: blockTests InitialContents: FollowSlot\x7fVisibility: private'
        
         blockTestUplevel2 = ( |
             savedSelf.
            | 
            savedSelf: self.
            assert: [savedSelf _Eq: self]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'block' -> 'vmTests' -> () From: ( | {
         'Category: blocks\x7fCategory: with uplevel acceses\x7fComment: uplevel access to locals and arguments\x7fModuleInfo: Module: blockTests InitialContents: FollowSlot\x7fVisibility: private'
        
         blockTestUplevel3: fortyFive = ( |
             a = 1.
             b <- 2.
             c.
             nil = bootstrap stub -> 'globals' -> 'nil' -> ().
            | 
            "lexical level = 1"
            c: nil.
            assert: [c: a _IntAdd: b. (fortyFive _IntSub: c) _IntEQ: 42].
            assert: [c _IntEQ: 3].

            "lexical level = 2"
            c: nil.
            [
              assert: [c: a _IntAdd: b. (fortyFive _IntSub: c) _IntEQ: 42].
            ] value.
            assert: [c _IntEQ: 3].

            "lexical level = 3"
            c: nil.
            [
              assert: [[c: a _IntAdd: b. (fortyFive _IntSub: c) _IntEQ: 42] value].
            ] value.
            assert: [c _IntEQ: 3]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'block' -> 'vmTests' -> () From: ( | {
         'Category: non-local returns\x7fCategory: methods with NLRs calling methods with NLRs\x7fModuleInfo: Module: blockTests InitialContents: FollowSlot\x7fVisibility: private'
        
         callThisBlock: b = ( |
            | 
            b value).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'block' -> 'vmTests' -> () From: ( | {
         'Category: non-local returns\x7fCategory: methods with NLRs calling methods with NLRs\x7fModuleInfo: Module: blockTests InitialContents: FollowSlot\x7fVisibility: private'
        
         doSomethingWithNLRsAndThenCallSomethingThatCallsThisBlock: b = ( |
            | 
            (0 _IntLT: 1)
              ifTrue: [^ callThisBlock: b]
               False: [error: 'zero is not less than one?']).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'block' -> 'vmTests' -> () From: ( | {
         'Category: non-local returns\x7fCategory: methods with NLRs calling methods with NLRs\x7fModuleInfo: Module: blockTests InitialContents: FollowSlot\x7fVisibility: private'
        
         doSomethingWithNLRsAndThenCallThisBlock: b = ( |
            | 
            (0 _IntLT: 1)
              ifTrue: [^ b value]
               False: [error: 'zero is not less than one?']).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'block' -> 'vmTests' -> () From: ( | {
         'Category: non-local returns\x7fCategory: methods with NLRs calling methods with NLRs\x7fModuleInfo: Module: blockTests InitialContents: FollowSlot\x7fVisibility: private'
        
         doSomethingWithoutNLRsAndThenCallSomethingThatCallsThisBlock: b = ( |
            | 
            (0 _IntLT: 1)
              ifTrue: [callThisBlock: b]
               False: [error: 'zero is not less than one?']).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'block' -> 'vmTests' -> () From: ( | {
         'Category: non-local returns\x7fCategory: methods with NLRs calling methods with NLRs\x7fModuleInfo: Module: blockTests InitialContents: FollowSlot\x7fVisibility: private'
        
         doesReturnFive = ( |
            | 
            doSomethingWithoutNLRsAndThenCallSomethingThatCallsThisBlock: [^ 5].
            6).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'block' -> 'vmTests' -> () From: ( | {
         'Category: non-local returns\x7fCategory: methods with NLRs calling methods with NLRs\x7fModuleInfo: Module: blockTests InitialContents: FollowSlot\x7fVisibility: private'
        
         doesReturnSeventySeven = ( |
            | 
            doSomethingWithNLRsAndThenCallSomethingThatCallsThisBlock: [77]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'block' -> 'vmTests' -> () From: ( | {
         'Category: assertions\x7fModuleInfo: Module: blockTests InitialContents: FollowSlot\x7fVisibility: private'
        
         fail = ( |
            | 
            assert: false).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'block' -> 'vmTests' -> () From: ( | {
         'Category: non-local returns\x7fModuleInfo: Module: blockTests InitialContents: FollowSlot\x7fVisibility: public'
        
         nlrTest = ( |
            | 
            assert: nlrTest1 Is: 42.
            assert: nlrTest2 Is: 42.
            assert: nlrTest3 Is: 42.

            assert: (nlrTest4: 21) Is: 42.
            assert: (nlrTest5: 21) Is: 42.
            assert: nlrTest6 Is: 1. 
            assert: nlrTest7 Is: 5.
            assert: nlrTest8 Is: 12.

            assert: doesReturnFive Is: 5.
            assert: doesReturnSeventySeven Is: 77.
            assert: shouldReturnFive Is: 5. "Tries to call callThisBlock: on 1 or 5 or something."
            assert: shouldAlsoReturnFive Is: 5. "Returns 6."

            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'block' -> 'vmTests' -> () From: ( | {
         'Category: non-local returns\x7fModuleInfo: Module: blockTests InitialContents: FollowSlot\x7fVisibility: private'
        
         nlrTest1 = ( |
            | 
            [^ 42] value _IntAdd: 5).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'block' -> 'vmTests' -> () From: ( | {
         'Category: non-local returns\x7fModuleInfo: Module: blockTests InitialContents: FollowSlot\x7fVisibility: private'
        
         nlrTest2 = ( |
            | 
            [[^ 42] value _IntAdd: 5] value _IntAdd: 7).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'block' -> 'vmTests' -> () From: ( | {
         'Category: non-local returns\x7fModuleInfo: Module: blockTests InitialContents: FollowSlot\x7fVisibility: private'
        
         nlrTest3 = ( |
            | 
            [2 _IntAdd: [3 _IntAdd: [^ 42] value] value] value).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'block' -> 'vmTests' -> () From: ( | {
         'Category: non-local returns\x7fModuleInfo: Module: blockTests InitialContents: FollowSlot\x7fVisibility: private'
        
         nlrTest4: v = ( |
            | 
            [^ v _IntMul: 2] value).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'block' -> 'vmTests' -> () From: ( | {
         'Category: non-local returns\x7fModuleInfo: Module: blockTests InitialContents: FollowSlot\x7fVisibility: private'
        
         nlrTest5: v = ( |
            | 
            nlrTest5b: [^ v _IntMul: 2]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'block' -> 'vmTests' -> () From: ( | {
         'Category: non-local returns\x7fModuleInfo: Module: blockTests InitialContents: FollowSlot\x7fVisibility: private'
        
         nlrTest5b: blk = ( |
            | blk value).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'block' -> 'vmTests' -> () From: ( | {
         'Category: non-local returns\x7fModuleInfo: Module: blockTests InitialContents: FollowSlot\x7fVisibility: private'
        
         nlrTest6 = ( |
            | 
            [3.
             1 __BranchTo: 'end'.
             ^ 2 __DefineLabel: 'end'
            ] value).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'block' -> 'vmTests' -> () From: ( | {
         'Category: non-local returns\x7fComment: tests nlr in a leaf method\x7fModuleInfo: Module: blockTests InitialContents: FollowSlot\x7fVisibility: private'
        
         nlrTest7 = ( |
            | 
            [^ 5] value).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'block' -> 'vmTests' -> () From: ( | {
         'Category: non-local returns\x7fModuleInfo: Module: blockTests InitialContents: FollowSlot\x7fVisibility: private'
        
         nlrTest8 = ( |
            | 
            [|:x| ^ x ] value: 12).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'block' -> 'vmTests' -> () From: ( | {
         'ModuleInfo: Module: blockTests InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'oddball' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'block' -> 'vmTests' -> () From: ( | {
         'ModuleInfo: Module: blockTests InitialContents: FollowSlot\x7fVisibility: public'
        
         run = ( |
            | 
            blockTest.
            nlrTest.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'block' -> 'vmTests' -> () From: ( | {
         'Category: non-local returns\x7fCategory: methods with NLRs calling methods with NLRs\x7fModuleInfo: Module: blockTests InitialContents: FollowSlot\x7fVisibility: private'
        
         shouldAlsoReturnFive = ( |
             r.
            | 
            r: doSomethingWithNLRsAndThenCallThisBlock: [^ 5].
            6).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'block' -> 'vmTests' -> () From: ( | {
         'Category: non-local returns\x7fCategory: methods with NLRs calling methods with NLRs\x7fModuleInfo: Module: blockTests InitialContents: FollowSlot\x7fVisibility: private'
        
         shouldReturnFive = ( |
            | 
            doSomethingWithNLRsAndThenCallSomethingThatCallsThisBlock: [^ 5].
            6).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'block' -> () From: ( | {
         'Category: testing VM\x7fModuleInfo: Module: blockTests InitialContents: FollowSlot\x7fVisibility: public'
        
         withAndWithoutInlining = ( |
             i.
            | 
            _Interpret ifTrue: [^self].

            (_Compilers size = 1)  &&  [_Compilers first = 'nic']
              ifTrue: [^ value].

            i: _Inline.

            _Inline: false. _Flush. value.
            _Inline: true.  _Flush. value.

            _Inline: i. _Flush.

            self).
        } | ) 



 '-- Side effects'

 globals modules blockTests postFileIn
