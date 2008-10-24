 'Sun-$Revision: 30.13 $'
 '
Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: programmingTests InitialContents: FollowSlot'
        
         programmingTests = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'programmingTests' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'comment' From:
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'programmingTests' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules programmingTests.

CopyDowns:
globals modules init. copy 
SlotsToOmit: comment directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'programmingTests' -> () From: ( | {
         'ModuleInfo: Module: programmingTests InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'tests'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'programmingTests' -> () From: ( | {
         'ModuleInfo: Module: programmingTests InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'programmingTests' -> () From: ( | {
         'ModuleInfo: Module: programmingTests InitialContents: FollowSlot'
        
         myComment <- 'tests the programming functionality'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'programmingTests' -> () From: ( | {
         'ModuleInfo: Module: programmingTests InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- 'Sun-$Revision: 30.13 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'programmingTests' -> () From: ( | {
         'ModuleInfo: Module: programmingTests InitialContents: FollowSlot\x7fVisibility: private'
        
         subpartNames <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> () From: ( | {
         'Category: VM tests\x7fCategory: messages and inheritance\x7fCategory: dynamic inheritance\x7fModuleInfo: Module: programmingTests InitialContents: FollowSlot'
        
         diProgramming = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'tests' -> 'diProgramming' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals tests diProgramming.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'diProgramming' -> () From: ( | {
         'ModuleInfo: Module: programmingTests InitialContents: FollowSlot\x7fVisibility: private'
        
         initializeDI = ( |
            | parent: parent1).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'diProgramming' -> () From: ( | {
         'ModuleInfo: Module: programmingTests InitialContents: FollowSlot'
        
         parent1 = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'tests' -> 'diProgramming' -> 'parent1' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals tests diProgramming parent1.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'diProgramming' -> () From: ( | {
         'ModuleInfo: Module: programmingTests InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* <- bootstrap stub -> 'globals' -> 'tests' -> 'diProgramming' -> 'parent1' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'diProgramming' -> 'parent1' -> () From: ( | {
         'ModuleInfo: Module: programmingTests InitialContents: FollowSlot'
        
         foo = 1.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'diProgramming' -> 'parent1' -> () From: ( | {
         'ModuleInfo: Module: programmingTests InitialContents: FollowSlot'
        
         switch = ( |
            | parent: parent2).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'diProgramming' -> () From: ( | {
         'ModuleInfo: Module: programmingTests InitialContents: FollowSlot'
        
         parent2 = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'tests' -> 'diProgramming' -> 'parent2' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals tests diProgramming parent2.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'diProgramming' -> 'parent2' -> () From: ( | {
         'ModuleInfo: Module: programmingTests InitialContents: FollowSlot'
        
         foo = 2.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'diProgramming' -> 'parent2' -> () From: ( | {
         'ModuleInfo: Module: programmingTests InitialContents: FollowSlot'
        
         switch = ( |
            | parent: parent1).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'diProgramming' -> () From: ( | {
         'ModuleInfo: Module: programmingTests InitialContents: FollowSlot\x7fVisibility: public'
        
         run = ( |
             comp.
             lim.
            | 
            comp: _Compilers. lim: _RecompileLimits.
            _Compilers: (vector copySize: 1 FillingWith: 'sic')
                Limits: vector copy
                IfFail: ['Warning: no SIC' printLine].
            runTheTests.
            resend.run.
            _Compilers: comp Limits: lim IfFail: self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'diProgramming' -> () From: ( | {
         'ModuleInfo: Module: programmingTests InitialContents: FollowSlot\x7fVisibility: private'
        
         runTheTests = ( |
             comp.
             lim.
            | 
            'Testing VM programming conversions with DI...' printLine.
            initializeDI.
            check: [ diProgTest1: 1 With: 2 ]
                Against: 'ok'
                Named: 'diProgTest1.1'.
            check: [ diProgTest1: 2 With: 1 ]
                Against: 'ok'
                Named: 'diProgTest1.2').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> () From: ( | {
         'Category: VM tests\x7fCategory: programming and programming primitives\x7fModuleInfo: Module: programmingTests InitialContents: FollowSlot\x7fVisibility: public'
        
         programming = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'tests' -> 'programming' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals tests programming.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'diProgramming' -> () From: ( | {
         'ModuleInfo: Module: programmingTests InitialContents: FollowSlot'
        
         testParent* <- bootstrap stub -> 'globals' -> 'tests' -> 'programming' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> () From: ( | {
         'Category: VM tests\x7fCategory: debugging and debugging info\x7fComment: Tests a bug in the VM that was fixed 10/27/95--dmu\x7fModuleInfo: Module: programmingTests InitialContents: FollowSlot\x7fVisibility: public'
        
         killTwiceTest = ( |
             d.
             p.
            | 
                  process this isScheduled  ifFalse: [ warning: 'cannot do killTwiceTest without scheduler'. ^ self].
            p: ( message copy receiver: killTwiceTestObj Selector: 'a' ) fork.
            p waitForSuspension.
            'killing' printLine.
            d: p stackDepth.
            d = 0  ifTrue: [error: 'I need the scheduler!'].
            p _KillActivationsUpTo: 1.
            [p stackDepth succ = d] assert.
            'killing again' printLine.
            p _KillActivationsUpTo: 1.
            [p stackDepth succ succ = d] assert.
            'ok').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'programming' -> () From: ( | {
         'ModuleInfo: Module: programmingTests InitialContents: InitializeToExpression: (nil)'
        
         blk10.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'programming' -> () From: ( | {
         'Category: tests\x7fModuleInfo: Module: programmingTests InitialContents: FollowSlot'
        
         diProgTest1: v1 With: v2 = ( |
             l1.
             l2.
             l3.
            | 
            tests programming xxx2 ifNotNil: [ error: 'AddSlots' ].
            l1: foo.
            l2: progTest4a: [ | l |
                l: foo.
                l == v1 ifFalse: [ error: 'di error 1'].
                switch.
                foo ].
            l3: foo.
            (l1 = v1) && [l2 = v2] && [l3 = l2] ifFalse: [error: 'di error 2'].
            tests programming xxx2 ifNotNil: [ error: 'AddSlots' ].
            'ok').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'programming' -> () From: ( | {
         'ModuleInfo: Module: programmingTests InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'globals' -> 'tests' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'programming' -> () From: ( | {
         'Category: tests\x7fComment: many locals and args\x7fModuleInfo: Module: programmingTests InitialContents: FollowSlot'
        
         progTest1 = ( | {
                 'ModuleInfo: Module: programmingTests InitialContents: FollowSlot'
                
                 l1 = 1.
                }  {
                 'ModuleInfo: Module: programmingTests InitialContents: FollowSlot'
                
                 l2.
                } 
            | 
            l2: 2.
            progTest1a:'a' B:'b' C:'c' D:'d' E:'e' F:'f'
                           G:'g' H:'h' I:'i' J:'j' K:'k'.
            (l1 != 1) || [l2 != 2] ifTrue: [error: 'incorrect l'].
            progTest1b:'a' B:'b' C:'c' D:'d' E:'e' F:'f'
                           G:'g' H:'h' I:'i' J:'j' K:'k'.
            (l1 != 1) || [l2 != 2] ifTrue: [error: 'incorrect l'].
            'ok').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'programming' -> () From: ( | {
         'Category: tests\x7fModuleInfo: Module: programmingTests InitialContents: FollowSlot'
        
         progTest10 = ( |
             r.
            | 
            tests programming xxx2 ifNotNil: [ error: 'AddSlots' ].
            tests programming blk10: [ some code ].
            progTest10a: 1
                With: 'foo'
                With: blk10
                With: (progTest10a:1 With: 'foo' With: blk10 With: progTest4).
            tests programming xxx2 ifNotNil: [ error: 'AddSlots' ].
            'ok').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'programming' -> () From: ( | {
         'Category: tests\x7fModuleInfo: Module: programmingTests InitialContents: FollowSlot'
        
         progTest10a: one With: foo With: blk With: ok = ( |
            | 
            one == 1     ifFalse: [ error: 'incorrect arg one' ].
            foo == 'foo' ifFalse: [ error: 'incorrect arg foo' ].
            blk == tests programming blk10 ifFalse: [ error: 'incorrect arg blk' ].
            ok == 'ok' ifFalse: [ error: 'incorrect arg ok' ].
            'ok').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'programming' -> () From: ( | {
         'Category: tests\x7fModuleInfo: Module: programmingTests InitialContents: FollowSlot'
        
         progTest1a: a B: b C: c D: d E: e F: f G: g H: h I: i J: j K: k = ( |
             la.
             lb.
             lc.
             ld.
             le.
             lf.
             lg.
             lh.
             li.
             lj.
             lk.
             t.
            | 
            la: a. lb: b. lc: c. ld: d. le: e. lf: f.
            lg:g. lh:h. li:i. lj:j. lk:k.
            tests programming _AddSlots: (| xxx1 |).
            tests programming xxx1 ifNotNil: [ error: 'AddSlots' ].
            (la = 'a') && [a = 'a'] && [lb = 'b'] && [b = 'b'] &&
            [lc = 'c'] && [c = 'c'] && [ld = 'd'] && [d = 'd'] &&
            [le = 'e'] && [e = 'e'] && [lf = 'f'] && [f = 'f'] && 
            [lg = 'g'] && [g = 'g'] && [lh = 'h'] && [h = 'h'] && 
            [li = 'i'] && [i = 'i'] && [lj = 'j'] && [j = 'j'] &&  
            [lk = 'k'] && [k = 'k']
               ifFalse: [ error: 'incorrect locals/args 1' ].
            tests programming _RemoveSlot: 'xxx1').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'programming' -> () From: ( | {
         'Category: tests\x7fModuleInfo: Module: programmingTests InitialContents: FollowSlot'
        
         progTest1b: a B: b C: c D: d E: e F: f G: g H: h I: i J: j K: k = ( |
             la.
             lb.
             lc.
             ld.
             le.
             lf.
             lg.
             lh.
             li.
             lj.
             lk.
             t.
            | 
            la: a. lb: b. lc: c. ld: d. le: e. lf: f.
            lg:g. lh:h. li:i. lj:j. lk:k.

            tests programming _AddSlots: (| xxx1 |).
            tests programming xxx1 ifNotNil: [ error: 'AddSlots' ].
            t: ( 
              (la = 'a') && [a = 'a'] && [lb = 'b'] && [b = 'b'] &&
              [lc = 'c'] && [c = 'c'] && [ld = 'd'] && [d = 'd'] &&
              [le = 'e'] && [e = 'e'] && [lf = 'f'] && [f = 'f'] && 
              [lg = 'g'] && [g = 'g'] && [lh = 'h'] && [h = 'h'] && 
              [li = 'i'] && [i = 'i'] && [lj = 'j'] && [j = 'j'] &&  
              [lk = 'k'] && [k = 'k']).
            t ifFalse: [ error: 'incorrect locals/args 2' ].
            tests programming _RemoveSlot: 'xxx1').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'programming' -> () From: ( | {
         'Category: tests\x7fModuleInfo: Module: programmingTests InitialContents: FollowSlot'
        
         progTest2 = ( |
             t.
            | 
            [ | :a. :b. :c. la. lb. lc |
              la: a. lb: b. lc: c.
              tests programming xxx2 ifNotNil: [ error: 'AddSlots' ].
              tests programming _RemoveSlot: 'xxx2'.
              tests programming _AddSlots: (| xxx2 |).
              tests programming xxx2 ifNotNil: [ error: 'AddSlots' ].
              (la = 'a') && [a = 'a'] && [lb = 'b'] && [b = 'b'] &&
              [lc = 'c'] && [c = 'c']
                 ifFalse: [ error: 'incorrect locals/args 1' ].
            ] value: 'a' With: 'b' With: 'c'.
            'ok').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'programming' -> () From: ( | {
         'Category: tests\x7fModuleInfo: Module: programmingTests InitialContents: FollowSlot'
        
         progTest3 = ( |
             t.
            | 
            [ | :a. :b. :c. la. lb. lc |
              la: a. lb: b. lc: c.
              tests programming xxx2 ifNotNil: [ error: 'AddSlots' ].
              tests programming _RemoveSlot: 'xxx2'.
              tests programming _AddSlots: (| xxx2 |).
              tests programming xxx2 ifNotNil: [ error: 'AddSlots' ].
              t: (
                (la = 'a') && [a = 'a'] && [lb = 'b'] && [b = 'b'] &&
                [lc = 'c'] && [c = 'c']).
              t ifFalse: [ error: 'incorrect locals/args 2' ].
            ] value: 'a' With: 'b' With: 'c'.
            'ok').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'programming' -> () From: ( | {
         'Category: tests\x7fModuleInfo: Module: programmingTests InitialContents: FollowSlot'
        
         progTest4 = ( |
            | 
             "NLR into invalid frame - no conversion necessary"
            tests programming xxx2 ifNotNil: [ error: 'AddSlots' ].
            progTest4a: [ ^ 'ok' ].
            error: 'shouldn\'t be here').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'programming' -> () From: ( | {
         'Category: tests\x7fModuleInfo: Module: programmingTests InitialContents: FollowSlot'
        
         progTest4a: block = ( |
            | 
            tests programming xxx2 ifNotNil: [ error: 'AddSlots' ].
            tests programming _RemoveSlot: 'xxx2'.
            tests programming _AddSlots: (| xxx2 |).
            tests programming xxx2 ifNotNil: [ error: 'AddSlots' ].
            block value).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'programming' -> () From: ( | {
         'Category: tests\x7fModuleInfo: Module: programmingTests InitialContents: FollowSlot'
        
         progTest5 = ( |
             r.
            | 
            tests programming xxx2 ifNotNil: [ error: 'AddSlots' ].
            r: progTest4.
            r = 'ok' ifFalse: [ error: 'failed' ].
            tests programming xxx2 ifNotNil: [ error: 'AddSlots' ].
            r).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'programming' -> () From: ( | {
         'Category: tests\x7fModuleInfo: Module: programmingTests InitialContents: FollowSlot'
        
         progTest6 = ( |
             b1.
             lb1 <- 'lb1'.
             res.
            | 
            tests programming xxx2 ifNotNil: [ error: 'AddSlots' ].
            b1: [ lb1 ].
            res: progTest6b.
            res = 'lb3' ifFalse: [ error: 'nlr result failed' ].
            b1 value = 'lb1' ifFalse: [ error: 'lb1 failed' ].
            'ok').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'programming' -> () From: ( | {
         'Category: tests\x7fModuleInfo: Module: programmingTests InitialContents: FollowSlot'
        
         progTest6a: nlrBlk B: blk3 BT: blk3Test = ( |
             l1 <- 1.
             l2.
            | 
            l2: blk3 value.
            tests programming xxx2 ifNotNil: [ error: 'AddSlots' ].
            tests programming _RemoveSlot: 'xxx2'.
            tests programming _AddSlots: (| xxx2 |).
            tests programming xxx2 ifNotNil: [ error: 'AddSlots' ].
            blk3Test value.
            blk3 value.
            nlrBlk value: l2).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'programming' -> () From: ( | {
         'Category: tests\x7fModuleInfo: Module: programmingTests InitialContents: FollowSlot'
        
         progTest6b = ( | {
                 'ModuleInfo: Module: programmingTests InitialContents: FollowSlot'
                
                 b3.
                }  {
                 'ModuleInfo: Module: programmingTests InitialContents: FollowSlot'
                
                 lb3 <- 'lb3'.
                } 
            | 
            [
                   progTest6a: [ | :arg | ^ arg ] B: [ b3: lb3. b3 ] 
                           BT: [ b3 = 'lb3' ifFalse: [ error: 'lb3 failed' ].
                                 b3: nil ].
            ] value.
            error: 'should not get here').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'programming' -> () From: ( | {
         'Category: tests\x7fModuleInfo: Module: programmingTests InitialContents: FollowSlot'
        
         progTest7 = ( |
             r.
            | 
            tests programming xxx2 ifNotNil: [ error: 'AddSlots' ].
            [ r: progTest4 ] value.
            r = 'ok' ifFalse: [ error: 'failed' ].
            tests programming xxx2 ifNotNil: [ error: 'AddSlots' ].
            r).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'programming' -> () From: ( | {
         'Category: tests\x7fModuleInfo: Module: programmingTests InitialContents: FollowSlot'
        
         progTest8: arg = ( |
             r.
            | 
            tests programming xxx2 ifNotNil: [ error: 'AddSlots' ].
            3 _IntAdd: arg IfFail: [ | :err. :name |
                 (name = '_IntAdd:') && ['badTypeError' isPrefixOf: err]
                     ifFalse: [ error: 'incorrect args before'].
                 [ r: progTest4 ] value.
                 (name = '_IntAdd:') && ['badTypeError' isPrefixOf: err]
                     ifFalse: [ error: 'incorrect args after']. ].
            r = 'ok' ifFalse: [ error: 'failed' ].
            tests programming xxx2 ifNotNil: [ error: 'AddSlots' ].
            r).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'programming' -> () From: ( | {
         'Category: tests\x7fModuleInfo: Module: programmingTests InitialContents: FollowSlot'
        
         progTest9 = ( |
             r.
            | 
            tests programming xxx2 ifNotNil: [ error: 'AddSlots' ].
            vector  _At:  0 IfFail: [|:err. :name.|
                 [ r: progTest4 ] value.
                 (name = '_At:') && [err = 'badIndexError']
                     ifFalse: [ error: 'incorrect args']. ].
            r = 'ok' ifFalse: [ error: 'failed' ].
            tests programming xxx2 ifNotNil: [ error: 'AddSlots' ].
            r).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'programming' -> () From: ( | {
         'ModuleInfo: Module: programmingTests InitialContents: FollowSlot\x7fVisibility: public'
        
         run = ( |
             comp.
             lim.
            | 
            comp: _Compilers. lim: _RecompileLimits.
            _Compilers: (vector copySize: 1 FillingWith: 'sic')
                Limits: vector copy
                IfFail: ['Warning: no SIC' printLine].
            'Testing VM programming conversions...' printLine.
            check: [ progTest1 ] Against: 'ok' Named: 'progTest1'.
            check: [ progTest2 ] Against: 'ok' Named: 'progTest2'.
            check: [ progTest3 ] Against: 'ok' Named: 'progTest3'.
            check: [ progTest4 ] Against: 'ok' Named: 'progTest4'.
            check: [ progTest5 ] Against: 'ok' Named: 'progTest5'.
            check: [ progTest6 ] Against: 'ok' Named: 'progTest6'.
            check: [ progTest7 ] Against: 'ok' Named: 'progTest7'.
            check: [ progTest8: 'a' ] Against: 'ok' Named: 'progTest8'.
            check: [ progTest9 ] Against: 'ok' Named: 'progTest9'.
            check: [ progTest10 ] Against: 'ok' Named: 'progTest10'.
            _Compilers: comp Limits: lim IfFail: self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'programming' -> () From: ( | {
         'Comment: xxx1 shouldn\'t be here to start\x7fModuleInfo: Module: programmingTests InitialContents: FollowSlot'
        
         t.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'programming' -> () From: ( | {
         'ModuleInfo: Module: programmingTests InitialContents: FollowSlot'
        
         xxx2.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> () From: ( | {
         'Category: VM tests\x7fCategory: programming and programming primitives\x7fModuleInfo: Module: programmingTests InitialContents: FollowSlot\x7fVisibility: public'
        
         programmingData = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'tests' -> 'programmingData' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals tests programmingData.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'programmingData' -> () From: ( | {
         'ModuleInfo: Module: programmingTests InitialContents: FollowSlot'
        
         constantSlot = 1.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'programmingData' -> () From: ( | {
         'ModuleInfo: Module: programmingTests InitialContents: FollowSlot'
        
         dataSlot.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'programmingData' -> () From: ( | {
         'ModuleInfo: Module: programmingTests InitialContents: FollowSlot'
        
         methodSlot = ( |
             x = bootstrap stub -> 'globals' -> 'tests' -> 'programmingData' -> ().
            | 1 factorial).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'programmingData' -> () From: ( | {
         'ModuleInfo: Module: programmingTests InitialContents: FollowSlot'
        
         methodSlot: arg1 WithArg2: arg2 = ( |
            | 2 successor).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'programmingData' -> () From: ( | {
         'ModuleInfo: Module: programmingTests InitialContents: FollowSlot'
        
         parentSlot* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'tests' -> 'programmingData' -> 'parentSlot' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals tests programmingData parentSlot.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> () From: ( | {
         'Category: VM tests\x7fCategory: programming and programming primitives\x7fModuleInfo: Module: programmingTests InitialContents: FollowSlot\x7fVisibility: public'
        
         programmingPrims = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'tests' -> 'programmingPrims' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals tests programmingPrims.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'programmingPrims' -> () From: ( | {
         'Category: new tests\x7fModuleInfo: Module: programmingTests InitialContents: FollowSlot\x7fVisibility: private'
        
         addSlotsTo: o1 From: o2 NewOnly: newOnly IfFail: errBlk = ( | {
                 'ModuleInfo: Module: programmingTests InitialContents: FollowSlot'
                
                 r.
                }  {
                 'ModuleInfo: Module: programmingTests InitialContents: FollowSlot'
                
                 ts.
                } 
            | 
            ts: _ProgrammingTimestamp.
            r:  newOnly ifTrue: [
                o1 _AddSlotsIfAbsent: o2 IfFail: [|:e|
                    [ts = _ProgrammingTimestamp] assert.
                  ^ errBlk value: e
                ].
            ] False: [
                o1 _AddSlots: o2 IfFail: [|:e|
                    [ts = _ProgrammingTimestamp] assert.
                  ^ errBlk value: e
                ].
            ].
            [ts != _ProgrammingTimestamp] assert.
            r).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'programmingPrims' -> () From: ( | {
         'Category: new tests\x7fCategory: state\x7fModuleInfo: Module: programmingTests InitialContents: InitializeToExpression: (vector copyRemoveAll)'
        
         allTrialMirrors <- vector copyRemoveAll.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'programmingPrims' -> () From: ( | {
         'Category: new tests\x7fModuleInfo: Module: programmingTests InitialContents: FollowSlot\x7fVisibility: private'
        
         argumentCountOf: n = ( |
            | 
            n isEmpty ifTrue: [^ badName].
            n first = '_' ifTrue: [^ badName].
            n first = '.' ifTrue: [^ badName].
            n first isLowerCase ifTrue: [ | kw. nn. c <- 0. |
                n last = ':' ifFalse: [ 
                    ^ (isID: n copyWithoutFirst) ifTrue: 0 False: badName
                ].
                nn: n copyWithoutFirst.
                [| i. id <- ''|
                    i: nn findFirst: [|:c| c = ':'] IfPresent: [|:v. :k| k] 
                         IfAbsent: [error: 'no :'].
                    i do: [id: id, nn first.  nn: nn copyWithoutFirst].
                    (isID: id) ifFalse: [^ badName].
                    nn: nn copyWithoutFirst. "rm :"
                    c: c succ.
                    nn isEmpty ifTrue: [^c].
                    nn first isUpperCase ifFalse: [^ badName].
                    nn: nn copyWithoutFirst.
                ] loop.
            ] False: [ "binary?"
                n = '|' ifTrue: [^ badName].
                n = '^' ifTrue: [^ badName].
                n findFirst: [|:c| ('!@#$%^&*-=+\\|;`~<>,./?' includes: c) not] 
                   IfPresent: badName
                   IfAbsent: 1.
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'programmingPrims' -> () From: ( | {
         'Category: new tests\x7fModuleInfo: Module: programmingTests InitialContents: FollowSlot\x7fVisibility: private'
        
         argumentSlotAddingObjects = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'tests' -> 'programmingPrims' -> 'argumentSlotAddingObjects' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals tests programmingPrims argumentSlotAddingObjects.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'programmingPrims' -> 'argumentSlotAddingObjects' -> () From: ( | {
         'ModuleInfo: Module: programmingTests InitialContents: FollowSlot'
        
         badNames = [ | x =  ( bootstrap setObjectAnnotationOf: vector _Clone From: ( |
                     {} = 'ModuleInfo: Creator: globals tests programmingPrims argumentSlotAddingObjects badNames.
'.
                    | ) ) _Clone: 4 Filler: 0| 
             x _At: 0  Put: ().
             x _At: 1  Put: ().
             x _At: 2  Put: ().
             x _At: 3  Put: ().
             x] value.
        } | ) 

 ((bootstrap stub -> 'globals' -> 'tests' -> 'programmingPrims' -> 'argumentSlotAddingObjects') \/-> 'badNames') -> () _At: 0 Put: (
     'Foo')

 ((bootstrap stub -> 'globals' -> 'tests' -> 'programmingPrims' -> 'argumentSlotAddingObjects') \/-> 'badNames') -> () _At: 1 Put: (
     '+')

 ((bootstrap stub -> 'globals' -> 'tests' -> 'programmingPrims' -> 'argumentSlotAddingObjects') \/-> 'badNames') -> () _At: 2 Put: (
     ':a')

 ((bootstrap stub -> 'globals' -> 'tests' -> 'programmingPrims' -> 'argumentSlotAddingObjects') \/-> 'badNames') -> () _At: 3 Put: (
     'a:')

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'programmingPrims' -> 'argumentSlotAddingObjects' -> () From: ( | {
         'ModuleInfo: Module: programmingTests InitialContents: FollowSlot'
        
         host = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'tests' -> 'programmingPrims' -> 'argumentSlotAddingObjects' -> 'host' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals tests programmingPrims argumentSlotAddingObjects host.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'programmingPrims' -> 'argumentSlotAddingObjects' -> 'host' -> () From: ( | {
         'ModuleInfo: Module: programmingTests InitialContents: FollowSlot'
        
         a = 'a'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'programmingPrims' -> 'argumentSlotAddingObjects' -> 'host' -> () From: ( | {
         'ModuleInfo: Module: programmingTests InitialContents: FollowSlot'
        
         a: a = ( |
            | 
            a).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'programmingPrims' -> 'argumentSlotAddingObjects' -> 'host' -> () From: ( | {
         'ModuleInfo: Module: programmingTests InitialContents: FollowSlot'
        
         b = 'b'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'programmingPrims' -> 'argumentSlotAddingObjects' -> 'host' -> () From: ( | {
         'ModuleInfo: Module: programmingTests InitialContents: FollowSlot'
        
         p* = bootstrap stub -> 'traits' -> 'clonable' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'programmingPrims' -> 'argumentSlotAddingObjects' -> () From: ( | {
         'ModuleInfo: Module: programmingTests InitialContents: FollowSlot'
        
         hostm = ( |
            | host _Mirror).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'programmingPrims' -> 'argumentSlotAddingObjects' -> () From: ( | {
         'ModuleInfo: Module: programmingTests InitialContents: FollowSlot'
        
         meth1 = ( |
            | (_Mirror at: 'meth1o') contents).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'programmingPrims' -> 'argumentSlotAddingObjects' -> () From: ( | {
         'ModuleInfo: Module: programmingTests InitialContents: FollowSlot'
        
         meth1a = ( |
            | 
            (_Mirror at: 'meth1ao:') contents).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'programmingPrims' -> 'argumentSlotAddingObjects' -> () From: ( | {
         'ModuleInfo: Module: programmingTests InitialContents: FollowSlot'
        
         meth1ao: a = ( |
            | 
            a).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'programmingPrims' -> 'argumentSlotAddingObjects' -> () From: ( | {
         'ModuleInfo: Module: programmingTests InitialContents: FollowSlot'
        
         meth1o = ( |
            | a).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'programmingPrims' -> 'argumentSlotAddingObjects' -> () From: ( | {
         'ModuleInfo: Module: programmingTests InitialContents: FollowSlot'
        
         meth2 = ( |
            | (_Mirror at: 'meth2o') contents).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'programmingPrims' -> 'argumentSlotAddingObjects' -> () From: ( | {
         'ModuleInfo: Module: programmingTests InitialContents: FollowSlot'
        
         meth2o = ( |
            | a,b).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'programmingPrims' -> () From: ( | {
         'Category: new tests\x7fModuleInfo: Module: programmingTests InitialContents: FollowSlot\x7fVisibility: private'
        
         badName = -1.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'programmingPrims' -> () From: ( | {
         'Category: new tests\x7fModuleInfo: Module: programmingTests InitialContents: FollowSlot\x7fVisibility: private'
        
         checkTimestampAndDefine: m1 ToBe: m2 WithMirrors: withMirrors IfFail: errBlk = ( | {
                 'ModuleInfo: Module: programmingTests InitialContents: FollowSlot'
                
                 r.
                }  {
                 'ModuleInfo: Module: programmingTests InitialContents: FollowSlot'
                
                 ts.
                } 
            | 
            ts: _ProgrammingTimestamp.
            r: define: m1 ToBe: m2 WithMirrors: withMirrors IfFail: [|:e|
                [ts = _ProgrammingTimestamp] assert.
                ^ errBlk value: e
            ].
            [ts != _ProgrammingTimestamp] assert.
            r).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'programmingPrims' -> () From: ( | {
         'Category: slow tests\x7fModuleInfo: Module: programmingTests InitialContents: FollowSlot\x7fVisibility: private'
        
         cloneMirror: m = ( |
             r.
            | 
            m isReflecteeMethod ifFalse: [
                r: m cloneReflectee.
                [r != m] assert.
                r
            ] True: [ | s. sel. args | 
                s: '( | '.
                args: m arguments.
                sel: 'snort'.
                args isEmpty not ifTrue: [
                    sel: sel, ':'.
                    args size pred do: [sel: sel, 'Snort:'].
                ].
                s: s, sel, ' = ( | '.
                args do: [|:a| s: s, ' :', a, '. '].
                ( reflect: 
                    (s, ' | ', m source, ') | )') eval 
                ) first value
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'programmingPrims' -> () From: ( | {
         'Category: new tests\x7fModuleInfo: Module: programmingTests InitialContents: FollowSlot'
        
         concurrentProgrammingObj = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'tests' -> 'programmingPrims' -> 'concurrentProgrammingObj' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals tests programmingPrims concurrentProgrammingObj.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'programmingPrims' -> 'concurrentProgrammingObj' -> () From: ( | {
         'ModuleInfo: Module: programmingTests InitialContents: FollowSlot\x7fVisibility: public'
        
         keepRunning <- bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'programmingPrims' -> 'concurrentProgrammingObj' -> () From: ( | {
         'ModuleInfo: Module: programmingTests InitialContents: FollowSlot\x7fVisibility: public'
        
         runLoop = ( |
            | [keepRunning] whileTrue. 
            keepRunning ifTrue: 'not ok' False: 'ok').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'programmingPrims' -> () From: ( | {
         'Category: new tests\x7fModuleInfo: Module: programmingTests InitialContents: FollowSlot\x7fVisibility: private'
        
         define: m1 ToBe: m2 WithMirrors: withMirrors IfFail: errBlk = ( |
            | 
            " do _Define or _MirrorDefine"
            '.' print.
            withMirrors ifTrue: [
                m1 _MirrorDefine: m2 IfFail: [|:e| ^ errBlk value: e]
            ] False: [
                reflect:
                       (m1 reflecteeIfFail: [^ errBlk value: 'reflectee failed'])
                    _Define:
                       (m2 reflecteeIfFail: [^ errBlk value: 'reflectee failed'])
                    IfFail: [|:e| ^ errBlk value: e]
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'programmingPrims' -> () From: ( | {
         'Category: new tests\x7fModuleInfo: Module: programmingTests InitialContents: FollowSlot\x7fVisibility: private'
        
         failMethodCodes: c Literals: v Block: isB At: baddie = ( |
             atPos <- 0.
             index <- ''.
             r.
            | 
            r: [|:xit|
                isB ifTrue: [
                    _CreateBlockMethodBytecodes: c asVMByteVector
                                       Literals: v asVector
                                           File: ''
                                           Line: 0
                                         Source: ''
                                         IfFail: [|:e| xit value: e].
                ] False: [
                    _CreateOuterMethodBytecodes: c asVMByteVector
                                       Literals: v asVector
                                           File: ''
                                           Line: 0
                                         Source: ''
                                         IfFail: [|:e| xit value: e].
                ].
                error: 'should fail'.
            ] exitValue.
            c isEmpty ifTrue: [
              ^ r = 'Error: empty byte code vector' 
                  ifTrue: 'ok' False: 'bad empty code error message'.
            ].

            r do: [|:char. :i|
              ('at:' isPrefixOf:  r copyFrom: i)
               ifTrue: [ | j. k |
                j: i + 'at:' size.
                [(r at: j) isDigit] whileFalse: [j: j succ].
                k: j succ.
                [(k < r size)  &&  [(r at: k) isDigit]] whileTrue: [
                  k: k succ.
                ].
                index: r copyFrom: j UpTo: k.
                [index asInteger = baddie] assert.
              ^ 'ok'.
              ].
            ].
            error: 'could not find "at:" in error string').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'programmingPrims' -> () From: ( | {
         'Category: old tests\x7fModuleInfo: Module: programmingTests InitialContents: FollowSlot'
        
         initialize = ( |
            | 
            m: (reflect: tests programmingData).
            meth: (m slotAt: 'methodSlot') value.
            meth isReflecteeMethod ifFalse: [ error: 'wanted a method' ].
            meth2: (m slotAt: 'methodSlot:WithArg2:') value.
            meth2 isReflecteeMethod ifFalse: [ error: 'wanted a method' ].
            tests diProgramming initializeDI).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'programmingPrims' -> () From: ( | {
         'Category: new tests\x7fModuleInfo: Module: programmingTests InitialContents: FollowSlot\x7fVisibility: private'
        
         isID: n = ( |
            | 
            n allSatisfy: [|:c| c isLetter || [c isDigit || [c = '_']]]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'programmingPrims' -> () From: ( | {
         'Category: slow tests\x7fModuleInfo: Module: programmingTests InitialContents: FollowSlot\x7fVisibility: private'
        
         isMirror: m1 SameTypeAs: m2 = ( |
            | "return true if mirrors have same type"
               (m1 isReflecteeActivation  = m2 isReflecteeActivation)
            && (m1 isReflecteeAssignment  = m2 isReflecteeAssignment)
            && (m1 isReflecteeBlock       = m2 isReflecteeBlock)
            && (m1 isReflecteeByteVector  = m2 isReflecteeByteVector)
            && (m1 isReflecteeFloat       = m2 isReflecteeFloat)
            && (m1 isReflecteeInteger     = m2 isReflecteeInteger)
            && (m1 isReflecteeMethod      = m2 isReflecteeMethod)
            && (m1 isReflecteeMirror      = m2 isReflecteeMirror)
            && (m1 isReflecteeProcess     = m2 isReflecteeProcess)
            && (m1 isReflecteeSlots       = m2 isReflecteeSlots)
            && (m1 isReflecteeString      = m2 isReflecteeString)
            && (m1 isReflecteeVector      = m2 isReflecteeVector)).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'programmingPrims' -> () From: ( | {
         'Category: slow tests\x7fModuleInfo: Module: programmingTests InitialContents: FollowSlot\x7fVisibility: private'
        
         isMirrorAProxy: m = ( |
            | 
            (m reflecteeIfFail: [^ false]) _ForeignIsLiveIfFail: [^false].
            true).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'programmingPrims' -> () From: ( | {
         'Category: new tests\x7fModuleInfo: Module: programmingTests InitialContents: FollowSlot\x7fVisibility: private'
        
         isOkToAddSlotTo: dst At: name Contents: contents IsParent: isParent = ( |
            | 
            (reflect: dst) isReflecteeMirror      ifFalse: [^false].
            (reflect: contents) isReflecteeMirror ifFalse: [^false].
            (reflect: name) isReflecteeString     ifFalse: [^false].

            (isProgrammableSlots: dst)                        ifFalse: [^false].
            contents isReflecteeActivation                    ifTrue:  [^false].
            (isSlotName: name)                                ifFalse: [^false].
            (isParent _Eq: true) || [isParent _Eq: false]     ifFalse: [^false].
            contents isReflecteeMethod && [isParent]           ifTrue: [^false].
            contents isReflecteeAssignment && [isParent]       ifTrue: [^false].

            contents isReflecteeAssignment && [(argumentCountOf: name) != 1]
                                                              ifTrue: [^false].
            contents isReflecteeAssignment
            && [ ( dst names includes: name copyWithoutLast) not ]
                                                              ifTrue: [^false].

            contents isReflecteeAssignment
            && [(dst slotAt: name copyWithoutLast) value isReflecteeMethod]
                                                              ifTrue: [^false].

            contents isReflecteeMethod 
            && [(argumentCountOf: name) != contents arguments size]
                                                              ifTrue: [^false].

            dst isReflecteeMethod && [contents isReflecteeMethod] ifTrue: [^false].

            contents isReflecteeMethod not 
            && [contents isReflecteeAssignment  not
            && [(argumentCountOf: name) != 0]]                ifTrue: [^false].

            true).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'programmingPrims' -> () From: ( | {
         'Category: new tests\x7fModuleInfo: Module: programmingTests InitialContents: FollowSlot\x7fVisibility: private'
        
         isPossibleToDefine: m1 ToBe: m2 WithMirrors: withMirrors = ( |
            | 
                  ( isProgrammableSlots: m1)
            &&  [ ( isProgrammableSlots: m2)
            &&  [ ( m1 isReflecteeMethod || [m2 isReflecteeMethod not] )
            &&  [   withMirrors || [     m1 isReflecteeMethod not 
                                     && [m2 isReflecteeMethod not]
                                   ]
                ]]]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'programmingPrims' -> () From: ( | {
         'Category: new tests\x7fModuleInfo: Module: programmingTests InitialContents: FollowSlot'
        
         isProgrammableSlots: m = ( |
            | 
            (
                m isReflecteeActivation
            ||  m isReflecteeAssignment
            ||  m isReflecteeBlock     
            ||  m isReflecteeFloat     
            ||  m isReflecteeInteger   
            ||  m isReflecteeString    
            ) not).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'programmingPrims' -> () From: ( | {
         'Category: new tests\x7fModuleInfo: Module: programmingTests InitialContents: FollowSlot\x7fVisibility: private'
        
         isSlot: s1 SameAs: s2 = ( |
            | 
            (s1 longKey = s2 longKey) && (s1 value = s2 value)).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'programmingPrims' -> () From: ( | {
         'Category: new tests\x7fModuleInfo: Module: programmingTests InitialContents: FollowSlot\x7fVisibility: private'
        
         isSlotName: n = ( |
            | (argumentCountOf: n) != badName).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'programmingPrims' -> () From: ( | {
         'Category: state\x7fComment: globals used by the tests\x7fModuleInfo: Module: programmingTests InitialContents: InitializeToExpression: (nil)'
        
         m.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'programmingPrims' -> () From: ( | {
         'Category: state\x7fModuleInfo: Module: programmingTests InitialContents: InitializeToExpression: (nil)'
        
         meth.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'programmingPrims' -> () From: ( | {
         'Category: state\x7fModuleInfo: Module: programmingTests InitialContents: InitializeToExpression: (nil)'
        
         meth2.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'programmingPrims' -> () From: ( | {
         'Category: slow tests\x7fModuleInfo: Module: programmingTests InitialContents: FollowSlot\x7fVisibility: private'
        
         mirror: m1 MustBeACloneOf: m2 = ( |
            | 
            "return true if m1 and m2 are clones"
            [m1     != m2     ] assert.
            [m1 names = m2 names] assert.
            m1 names do: [|:n. sr. s2|
                sr: m1 at: n.
                s2: m2 at: n.
                [isSlot: sr SameAs: s2] assert.
            ].
            [isMirror: m1 SameTypeAs: m2] assert.
            m2 isReflecteeVectorish ifTrue: [ |o1. o2|
                o1: m1 reflectee.
                o2: m2 reflectee.
                [o1 size = o2 size] assert.
                o1 with: o2 Do: [|:e1. :e2|
                    [(reflect: e1) = (reflect: e2)] assert.
                ].
            ].
            'ok').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'programmingPrims' -> () From: ( | {
         'Category: new tests\x7fModuleInfo: Module: programmingTests InitialContents: FollowSlot\x7fVisibility: private'
        
         newInitialize = ( |
            | 
            trialObjectMirrors: (
                (reflect: ( | a | ) )
              & (reflect: ( | b | ) )
              & (reflect: ( | b <- 18.  d | ) )
              & (reflect: ( | b = 23 | ) )
              & (reflect: ( | b = (doily sludge mump) | ) )
              & (reflect: vector copySize: 1 )
              & (reflect: vector copySize: 3 )
              & (reflect: vector copySize: 3 )
              & (reflect: byteVector copySize: 34 )
              & (reflect: byteVector copySize: 34 )
              & (reflect: (byteVector copySize: 4) 
                                       _AddSlots: ( | snort <- 23 | ) ) 
              & (reflect: ( | z | ) )
              & (reflect: process this)
              & (reflect: proxy)
              & (reflect: foreignFct)
              & (reflect: 17)
              & (reflect: [snort])
              & (reflect: reflect: ( | a. b. c. | ) )
              & (reflect: 'abc')
            ) asVector.

            trialMirrors: (
              (reflect: ( | snort = (foobar) | ) ) first value
                  & process this stack last
                  & mirrors assignment
            ) asVector.

            trialObjects: trialObjectMirrors copyMappedBy: [|:m| m reflectee].
            allTrialMirrors: trialMirrors, trialObjectMirrors).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'programmingPrims' -> () From: ( | {
         'Category: new tests\x7fModuleInfo: Module: programmingTests InitialContents: FollowSlot\x7fVisibility: public'
        
         newRun = ( |
            | 
            newInitialize.
            check: [ testAddSlots: true  ]        Against: 'ok'  Named: 'testAddSlotsIfAbsent'.
            check: [ testAddSlots: false  ]       Against: 'ok'  Named: 'testAddSlots'.
            check: [ testPreserveMethodPointer ]  Against: 'ok'  Named: 'testPreserveMethodPointer'.
            check: [ testMethodCreation  ]        Against: 'ok'  Named: 'testMethodCreation'.
            check: [ testRemoveSlot]              Against: 'ok'  Named: 'testRemoveSlot'.
            check: [ testCopyAddArgumentSlot ]    Against: 'ok'  Named: 'testCopyAddArgumentSlot'.
            check: [ testCopyAtPut ]              Against: 'ok'  Named: 'testCopyAtPut'.
            check: [ testCanonicalization ]       Against: 'ok'  Named: 'testCanonicalization'.
            '\n\n*** Not running testConcurrentProgramming; see codeSlotsMap.h ***\n\n' printLine.
            [ check: [ testConcurrentProgramming ]  Against: 'ok'  Named: 'testConcurrentProgramming'. ].
            _Verify.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'programmingPrims' -> () From: ( | {
         'Category: slow tests\x7fModuleInfo: Module: programmingTests InitialContents: FollowSlot\x7fVisibility: private'
        
         objectOopsInMirror: m = ( | {
                 'ModuleInfo: Module: programmingTests InitialContents: FollowSlot'
                
                 r <- 0.
                } 
            | 
            m do: [|:s| s isAssignable ifTrue: [r: r succ]].
            m isReflecteeVector ifTrue: [r: r + m reflectee _Size].
            r).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'programmingPrims' -> () From: ( | {
         'Category: old tests\x7fModuleInfo: Module: programmingTests InitialContents: FollowSlot\x7fVisibility: public'
        
         oldRun = ( |
            | 
            'Testing programming primitives...' printLine.
            initialize.
            check: [ test1  ] Against: 'slotNameError'             Named: 'test1'.
            check: [ test2  ] Against: 'unassignableSlotError'     Named: 'test2'.
            check: [ test3  ] Against: 'argumentCountError'        Named: 'test3'.
            check: [ test4  ] Against: 'lonelyAssignmentSlotError' Named: 'test4'.
            check: [ test6  ] Against: 'parentError'               Named: 'test6'.
            check: [ test7  ] Against: 'ok'                        Named: 'test7'.
            check: [ test8  ] Against: 'slotNameError'             Named: 'test8'.
            check: [ test9  ] Against: 'argumentCountError'        Named: 'test9'.
            check: [ test10 ] Against: 'argumentCountError'        Named: 'test10'.
            check: [ test12 ] Against: true                        Named: 'test12'.
            check: [ testA1 ] Against: 'ok'                        Named: 'testA1'.
            check: [ testA2 ] Against: mirrors assignment          Named: 'testA2'.
            check: [ testA3 ] Against: 'ok'                        Named: 'testA3'.
            check: [ testA4 ] Against: 'ok'                        Named: 'testA4'.
            check: [ testA5 ] Against: 'ok'                        Named: 'testA5'.
            check: [ testA6 ] Against: true                        Named: 'testA6'.
            check: [ testA7 ] Against: true                        Named: 'testA7').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'programmingPrims' -> () From: ( | {
         'ModuleInfo: Module: programmingTests InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'globals' -> 'tests' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'programmingPrims' -> () From: ( | {
         'Comment: why not do both?\x7fModuleInfo: Module: programmingTests InitialContents: FollowSlot\x7fVisibility: public'
        
         run = ( |
            | newRun.  oldRun).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'programmingPrims' -> () From: ( | {
         'Category: slow tests\x7fModuleInfo: Module: programmingTests InitialContents: FollowSlot\x7fVisibility: public'
        
         slowRun = ( |
            | 
            check: [ testDefine    ] Against: 'ok' Named: 'testDefine').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'programmingPrims' -> () From: ( | {
         'Category: old tests\x7fComment: invalid slot name\x7fModuleInfo: Module: programmingTests InitialContents: FollowSlot'
        
         test1 = ( |
            | m copyAt: 'Foo' PutContents: m IfFail: [ | :err | ^ err ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'programmingPrims' -> () From: ( | {
         'Category: old tests\x7fComment: wrong number of arg slots in method (again)\x7fModuleInfo: Module: programmingTests InitialContents: FollowSlot'
        
         test10 = ( |
            | m at: 'a:' PutContents: meth2 IfFail: [ | :err | err ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'programmingPrims' -> () From: ( | {
         'Category: old tests\x7fComment: changing assignment slot to method -- dmu 7/92 \x7fModuleInfo: Module: programmingTests InitialContents: FollowSlot'
        
         test12 = ( | {
                 'ModuleInfo: Module: programmingTests InitialContents: FollowSlot'
                
                 dataM.
                }  {
                 'ModuleInfo: Module: programmingTests InitialContents: FollowSlot'
                
                 methM.
                } 
            | 
            dataM:      reflect: (| data       |).
            methM:  ( ( reflect: (| m: x = (0) |) )  slotAt: 'm:')  contents.
            (
                (
                   dataM  at: 'data:'  PutContents: methM
                )  slotAt: 'data:'
            ) isMethod).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'programmingPrims' -> () From: ( | {
         'Category: old tests\x7fComment: assignment slot for method\x7fModuleInfo: Module: programmingTests InitialContents: FollowSlot'
        
         test2 = ( |
            | 
            m at: 'methodSlot:' PutContents: mirrors assignment
              IfFail: [ | :err | err ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'programmingPrims' -> () From: ( | {
         'Category: old tests\x7fComment: slot with wrong name\x7fModuleInfo: Module: programmingTests InitialContents: FollowSlot'
        
         test3 = ( |
            | 
            m copyAt: 'x' PutContents: mirrors assignment
              IfFail: [ | :err | err ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'programmingPrims' -> () From: ( | {
         'Category: old tests\x7fComment: lonely assignment slot\x7fModuleInfo: Module: programmingTests InitialContents: FollowSlot'
        
         test4 = ( |
            | 
            m at: 'x:' PutContents: mirrors assignment
              IfFail: [ | :err | err ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'programmingPrims' -> () From: ( | {
         'Category: old tests\x7fComment: parent slot with method\x7fModuleInfo: Module: programmingTests InitialContents: FollowSlot'
        
         test6 = ( |
            | 
            ((m copyAt: 'x' PutContents: meth IfFail: [ | :err | ^ err ]) at: 'x')
              copyHolderForIsParent: true IfFail: [|:err| err]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'programmingPrims' -> () From: ( | {
         'Category: old tests\x7fComment: add slot to method\x7fModuleInfo: Module: programmingTests InitialContents: FollowSlot'
        
         test7 = ( |
            | meth at: 'x' PutContents: m IfFail: [ | :err | ^ err ]. 'ok').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'programmingPrims' -> () From: ( | {
         'Category: old tests\x7fComment: arg slot\x7fModuleInfo: Module: programmingTests InitialContents: FollowSlot'
        
         test8 = ( |
            | m copyAt: ':x' PutContents: m IfFail: [ | :err | err ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'programmingPrims' -> () From: ( | {
         'Category: old tests\x7fComment: wrong number of arg slots in method\x7fModuleInfo: Module: programmingTests InitialContents: FollowSlot'
        
         test9 = ( |
            | m at: 'a' PutContents: meth2 IfFail: [ | :err | err ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'programmingPrims' -> () From: ( | {
         'Category: old tests\x7fComment: add a new slot\x7fModuleInfo: Module: programmingTests InitialContents: FollowSlot'
        
         testA1 = ( | {
                 'ModuleInfo: Module: programmingTests InitialContents: FollowSlot'
                
                 r.
                }  {
                 'ModuleInfo: Module: programmingTests InitialContents: FollowSlot'
                
                 slot.
                } 
            | 
            r: m at: 'new' PutContents: (reflect: 'ok').
            (r at: 'new') isParent: true.
            r = m ifFalse: [ error: 'bad result' ].
            slot: m slotAt: 'new'.
            slot isParent not ||
              [slot isAssignable] ifTrue: [ error: 'new failed' ].
            slot value reflectee).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'programmingPrims' -> () From: ( | {
         'Category: old tests\x7fComment: add assignment slot\x7fModuleInfo: Module: programmingTests InitialContents: FollowSlot'
        
         testA2 = ( | {
                 'ModuleInfo: Module: programmingTests InitialContents: FollowSlot'
                
                 slot.
                } 
            | 
            m at: 'new:' PutContents: mirrors assignment.

            slot: m slotAt: 'new'.
            slot isParent not ||
              [slot isAssignable not] ifTrue: [ error: 'new changed' ].
            slot: m slotAt: 'new:'.
            slot value).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'programmingPrims' -> () From: ( | {
         'Category: old tests\x7fComment: try to remove data slot first\x7fModuleInfo: Module: programmingTests InitialContents: FollowSlot'
        
         testA3 = ( |
            | 
            (m at: 'new') remove.
            m slotAt: 'new:' IfAbsent: [^ 'ok'].
            error: 'should not get here').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'programmingPrims' -> () From: ( | {
         'Category: old tests\x7fComment: remove assignment slot\x7fModuleInfo: Module: programmingTests InitialContents: FollowSlot'
        
         testA4 = ( | {
                 'ModuleInfo: Module: programmingTests InitialContents: FollowSlot'
                
                 slot.
                }  {
                 'ModuleInfo: Module: programmingTests InitialContents: FollowSlot'
                
                 t.
                } 
            | 
            testA1. testA2. "add back the slots"
            (m at: 'new:') remove = m ifFalse: [error: 'bad result'].

            t: m slotAt: 'new:' IfAbsent: [ true ].
            true = t ifFalse: [ error: 'new: is still there' ].
            slot: m slotAt: 'new'.
            slot isParent not  ||
              [slot isAssignable] ifTrue: [ error: 'new incorrect' ].
            'ok').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'programmingPrims' -> () From: ( | {
         'Category: old tests\x7fComment: remove data slot\x7fModuleInfo: Module: programmingTests InitialContents: FollowSlot'
        
         testA5 = ( | {
                 'ModuleInfo: Module: programmingTests InitialContents: FollowSlot'
                
                 t.
                } 
            | 
            (m at: 'new') remove.
            t: m slotAt: 'new' IfAbsent: [ true ].
            true = t ifFalse: [ error: 'new is still there' ].
            'ok').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'programmingPrims' -> () From: ( | {
         'Category: old tests\x7fComment: test result of addSlots: \x7fModuleInfo: Module: programmingTests InitialContents: FollowSlot'
        
         testA6 = ( | {
                 'ModuleInfo: Module: programmingTests InitialContents: FollowSlot'
                
                 m.
                } 
            | 
            m: reflect: ().
            m = (m addSlots: (reflect: ( | n | )) asVector)).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'programmingPrims' -> () From: ( | {
         'Category: old tests\x7fComment: test result of define: \x7fModuleInfo: Module: programmingTests InitialContents: FollowSlot'
        
         testA7 = ( | {
                 'ModuleInfo: Module: programmingTests InitialContents: FollowSlot'
                
                 m.
                } 
            | 
            m: reflect: ().
            m = (m define: reflect: ( | n | ))).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'programmingPrims' -> () From: ( | {
         'Category: new tests\x7fModuleInfo: Module: programmingTests InitialContents: FollowSlot\x7fVisibility: public'
        
         testAddSlots: newOnly = ( |
            | 
            'testing AddSlots primitives: ' print.
            trialObjects do: [|:o1|  trialObjects do: [|:o2|  
                    tryAddingSlotsTo: o1 From: o2 NewOnly: newOnly]].
            '\n' print.
            'ok').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'programmingPrims' -> () From: ( | {
         'Category: new tests\x7fComment: Check that map canonicalization preserves slots.\x7fModuleInfo: Module: programmingTests InitialContents: FollowSlot\x7fVisibility: public'
        
         testCanonicalization = ( |
             obj.
            | 
            obj: (| a <- 1. b <-2 |).
            obj _RemoveSlot: 'a'.
            obj _AddSlots: (| a <- 3 |).
            (obj a = 3) && [obj b = 2] ifTrue: 'ok' False: 'data slots not preserved').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'programmingPrims' -> () From: ( | {
         'Category: new tests\x7fComment: Check if adding a slot to an object which is being accessed
in a different process works ok.  The added slot will go 
before the slot being accessed by the other process (assuming
slots are sorted by the VM).\x7fModuleInfo: Module: programmingTests InitialContents: FollowSlot\x7fVisibility: public'
        
         testConcurrentProgramming = ( |
             p.
             t.
            | 
            t: concurrentProgrammingObj _Clone.
            p: (message copy receiver: t Selector: 'runLoop') fork.
            process this sleep: 50.
            t _AddSlots: (| aSlot <- nil |).
            process this sleep: 50.
            t keepRunning: false.
            p waitForDeath.
            p returnValue printLine).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'programmingPrims' -> () From: ( | {
         'Category: new tests\x7fModuleInfo: Module: programmingTests InitialContents: FollowSlot\x7fVisibility: public'
        
         testCopyAddArgumentSlot = ( |
             r <- ''.
            | 
            " must fail on non-methods"
            allTrialMirrors do: [|:m|
                m isReflecteeMethod ifFalse: [
                    [|:e|
                        m _MirrorCopyAddSlot: 'foo' 
                                    Contents: mirrors slots 
                                    IsParent: false 
                                  IsArgument: true 
                                      IfFail: e.
                        error: 'should fail'.
                    ] exit.
                ].
            ].

            " must fail on non-slot names"
            argumentSlotAddingObjects badNames do: [|:n|
                [|:e|
                        m _MirrorCopyAddSlot: 'foo' 
                                    Contents: mirrors slots 
                                    IsParent: false 
                                  IsArgument: true 
                                      IfFail: e.
                    error: 'should fail'.
                ] exit.
            ].

            " try success w/ zero args"
            [
                'a'  =  (argumentSlotAddingObjects hostm copyAt: 'x' PutContents: argumentSlotAddingObjects meth1) reflectee x
            ] assert.

            " try success w/ one arg"
            (argumentSlotAddingObjects meth1 & argumentSlotAddingObjects meth1a) asVector do: [|:m. r|
                "make a random slot in m"
                r: m copyAt: 'a' PutContents: mirrors slots.
                r: r at: 'a'.

                "change to an argument slot"
                r: r copyHolderForIsArgument: true.

                "put method holding r slot into host at a:"

                argumentSlotAddingObjects hostm at: 'a:' PutContents: r holder.
                "send a: 1 to the method"

                [(argumentSlotAddingObjects hostm reflectee a: '1') = '1'] assert.
            ].
            " try success w/ two args"
            r: (
                argumentSlotAddingObjects hostm copyAt: 'a:B:' PutContents: 
                  ((((((
                  argumentSlotAddingObjects meth2 copyAt: 'a' PutContents: mirrors slots)
                                                  copyAt: 'b' PutContents: mirrors slots)
                                                      at: 'a') copyHolderForIsArgument: true) holder
                                                      at: 'b') copyHolderForIsArgument: true) holder
                ) reflectee  a: '1' B: '2'.
            [r = '12'] assert.
            r: (
                argumentSlotAddingObjects hostm copyAt: 'a:B:' PutContents: 
                  ((((((
                  argumentSlotAddingObjects meth2 copyAt: 'a' PutContents: mirrors slots)
                                                  copyAt: 'b' PutContents: mirrors slots)
                                                      at: 'b') copyHolderForIsArgument: true) holder
                                                      at: 'a') copyHolderForIsArgument: true) holder
                ) reflectee  a: '1' B: '2'.
            [r = '21'] assert.
            'ok').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'programmingPrims' -> () From: ( | {
         'Category: new tests\x7fModuleInfo: Module: programmingTests InitialContents: FollowSlot\x7fVisibility: public'
        
         testCopyAtPut = ( | {
                 'ModuleInfo: Module: programmingTests InitialContents: FollowSlot'
                
                 fm.
                }  {
                 'ModuleInfo: Module: programmingTests InitialContents: FollowSlot'
                
                 fn.
                }  {
                 'ModuleInfo: Module: programmingTests InitialContents: FollowSlot'
                
                 fp.
                }  {
                 'ModuleInfo: Module: programmingTests InitialContents: InitializeToExpression: (
(
	() _Mirror
&	( | a = 3 | ) _Mirror
&	( | a = (3) | ) _Mirror
&	( | a <- 3 | ) _Mirror
&	( | a | ) _Mirror
&	( | a: a = ( a + 2 ) | ) _Mirror
&	3 _Mirror
&	byteVector _Mirror
&	vector _Mirror
&	foreignFct _Mirror
&	(( | snort = ( 3 + 4 ) | ) _Mirror _MirrorContentsAt: \'snort\')
&	(( | snort: a = ( a ) | ) _Mirror _MirrorContentsAt: \'snort:\')
&	(( | snort: a Snort: b = ( a + b ) | ) _Mirror _MirrorContentsAt: \'snort:Snort:\')
&	( | a: a B: b = ( a + b ) | ) _Mirror
&	( | a. b. | ) _Mirror
) asVector
)'
                
                 fullMirs = 
(
	() _Mirror
&	( | a = 3 | ) _Mirror
&	( | a = (3) | ) _Mirror
&	( | a <- 3 | ) _Mirror
&	( | a | ) _Mirror
&	( | a: a = ( a + 2 ) | ) _Mirror
&	3 _Mirror
&	byteVector _Mirror
&	vector _Mirror
&	foreignFct _Mirror
&	(( | snort = ( 3 + 4 ) | ) _Mirror _MirrorContentsAt: 'snort')
&	(( | snort: a = ( a ) | ) _Mirror _MirrorContentsAt: 'snort:')
&	(( | snort: a Snort: b = ( a + b ) | ) _Mirror _MirrorContentsAt: 'snort:Snort:')
&	( | a: a B: b = ( a + b ) | ) _Mirror
&	( | a. b. | ) _Mirror
) asVector
.
                }  {
                 'ModuleInfo: Module: programmingTests InitialContents: InitializeToExpression: ( (\'a\' & \'a:\' & \'b\' & \'b:\' & \'a:B:\') asVector )'
                
                 fullNames =  ('a' & 'a:' & 'b' & 'b:' & 'a:B:') asVector .
                }  {
                 'ModuleInfo: Module: programmingTests InitialContents: InitializeToExpression: ( (false & true ) asVector )'
                
                 fullParents =  (false & true ) asVector .
                } 
             fv. {
                 'ModuleInfo: Module: programmingTests InitialContents: InitializeToExpression: ( (lobby & \'string\' _Mirror & () _Mirror _Mirror & lobby & mirrors assignment ) asVector )'
                
                 partMirs <-  (lobby & 'string' _Mirror & () _Mirror _Mirror & lobby & mirrors assignment ) asVector .
                }  {
                 'ModuleInfo: Module: programmingTests InitialContents: InitializeToExpression: ( 
( \'a\' & \'Foo\' & \'_fo\' & \'a:B\' & \'a:b:\' & \'a+\' & \'foo\' & \'a:B:C\' & \'a_\' & \'+\'
) asVector
)'
                
                 partNames =  
( 'a' & 'Foo' & '_fo' & 'a:B' & 'a:b:' & 'a+' & 'foo' & 'a:B:C' & 'a_' & '+'
) asVector
.
                }  {
                 'ModuleInfo: Module: programmingTests InitialContents: InitializeToExpression: ( 
( lobby & 256 & 1000000 & -1 & 2 ) asVector
)'
                
                 partPrios =  
( lobby & 256 & 1000000 & -1 & 2 ) asVector
.
                } 
            | 
            'testing _MirrorCopyAtPut primitive:' print.

            "add activation now, cause cannot file it out"
            partMirs: partMirs copyAddLast: process this stack last.

            fullMirs do: [|:dst|
                fullNames do: [|:name|
                    fullMirs do: [|:c|
                        fullParents do: [|:p|
                            tryCopy: dst At: name Put: c IsParent: p]]]].
            fm: fullMirs    first.
            fn: fullNames   first.
            fp: fullParents first.
            partMirs do: [|:m|
                tryCopy: m  At: fn Put: fm  IsParent: fp.
                tryCopy: fm At: fn Put: m   IsParent: fp.
            ].
            partNames   do: [|:n|  tryCopy: fm At:  n Put: fm IsParent: fp.].
            (true & false) asVector do: [|:p|  tryCopy: fm At: fn Put: fm IsParent: p. ].
            '\n' print.
            'ok').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'programmingPrims' -> () From: ( | {
         'Category: new tests\x7fModuleInfo: Module: programmingTests InitialContents: FollowSlot\x7fVisibility: private'
        
         testCreateMethodFailures = ( |
             instructionSet.
            | 
            instructionSet: bytecodeFormat mostRecentSelfInstructionSet.

            " return not last bc"

            failMethodCodes: (
                               (instructionSet bytecodeNamed: 'pushSelf'       ) & 
                              ( instructionSet bytecodeNamed: 'nonlocalReturn' ) &
                              ( instructionSet bytecodeNamed: 'pushSelf'       ) ) asByteVector
                   Literals: vector 
                      Block: true
                         At: 1.


            "empty stack on return"

            failMethodCodes: byteVector
                   Literals: vector 
                      Block: false
                         At: 0.


            "non zero index on return"

            failMethodCodes: (byteVector copyAddFirst: instructionSet bytecodeNamed: 'index' Index: 1)
                   Literals: (vector copySize: 33)
                      Block: false
                         At: 1.


            "index >= literal size for literal, send"

            ( (instructionSet bytecodeNamed: 'literal'          Index: 0)
            & (instructionSet bytecodeNamed: 'delegatee'        Index: 0)
            & (instructionSet bytecodeNamed: 'send'             Index: 0)
            & (instructionSet bytecodeNamed: 'implicitSelfSend' Index: 0)
            ) asVector do: [|:bc|
                 failMethodCodes: (byteVector copyAddFirst: bc)
                        Literals: vector
                           Block: false
                              At: 0
            ].


            "delegatee not string"

            failMethodCodes: 
              ( byteVector copyAddFirst:  instructionSet bytecodeNamed: 'delegatee' Index: 0  )
            Literals: (vector     copyAddFirst: ())
               Block: false
                  At: 0.


            "selector of send not string"

            (( instructionSet bytecodeNamed: 'send'             Index: 0 )
            & (instructionSet bytecodeNamed: 'implicitSelfSend' Index: 0) )
              asVector do: [|:op|
                failMethodCodes: (byteVector copyAddFirst: op)
                       Literals: (vector     copyAddFirst: ())
                          Block: false
                             At: 0.
            ].

            "insufficient stack for send"

            failMethodCodes: (byteVector copyAddFirst: instructionSet bytecodeNamed: 'send' Index: 0)
                   Literals: (vector copyAddFirst: 'foo')
                      Block: false
                         At: 0.


            "insufficient stack for impl-rcvr sends"

            failMethodCodes: (byteVector copyAddFirst: instructionSet bytecodeNamed: 'implicitSelfSend' Index: 0  )
                   Literals: (vector copyAddFirst: '+')
                      Block: false
                         At: 0.
            'ok').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'programmingPrims' -> () From: ( | {
         'Category: slow tests\x7fModuleInfo: Module: programmingTests InitialContents: FollowSlot\x7fVisibility: public'
        
         testDefine = ( |
            | "test define primitive"
            'testing _Define primitives:' print.
            allTrialMirrors do: [|:m1|  allTrialMirrors do: [|:m2|  
                    tryDefining: m1 ToBe: m2 WithMirrors: false.
                    tryDefining: m1 ToBe: m2 WithMirrors: true.
                ]
            ].
            [|:e| checkTimestampAndDefine: ( | a | ) ToBe: (reflect: self)
                      WithMirrors: true IfFail: e.
                error: 'should fail'.
            ] exit.
            [|:e| checkTimestampAndDefine: (reflect: self) ToBe: ( | a | )
                      WithMirrors: true IfFail: e.
                error: 'should fail'.
            ] exit.
            '\n' print.
            'ok').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'programmingPrims' -> () From: ( | {
         'Category: new tests\x7fModuleInfo: Module: programmingTests InitialContents: FollowSlot'
        
         testMethod = ( |
             w = ' world'.
            | 
            ['hello', w] value).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'programmingPrims' -> () From: ( | {
         'Category: new tests\x7fComment: failure conditions for method creation:
         return not last bc,
         empty stack on return,
         nonzero index on return,
         return bc in outer method,
         index >= literal size for delegatee, literal, resend,
         delegatee not string,
         selector of send not string,
         insufficient stack for send,        \x7fModuleInfo: Module: programmingTests InitialContents: FollowSlot\x7fVisibility: public'
        
         testMethodCreation = ( |
             blk.
             h.
             r.
             testBlkMethMir.
             testMeth.
             tm.
            | 
            " need to remove all slots so VM will convert local access
             codes to sends"
            testMeth: (asMirror at: 'testMethod') contents.
            tm: testMeth copyRemoveAllSlots.
            testBlkMethMir: (reflect: tm literals first) valueSlot contents copyRemoveAllSlots.
            blk: (
                _CreateBlockMethodBytecodes: testBlkMethMir codes
                                   Literals: testBlkMethMir literals
                                       File: testMeth file
                                       Line: testMeth line
                                     Source: testMeth source
            ) _MirrorCreateBlock.
            h: (
                (reflect: ()) copyAt: 'a' PutContents: (
                    _CreateOuterMethodBytecodes: tm codes
                                       Literals: (blk & 'value') asVector
                                           File: testMeth file
                                           Line: testMeth line
                                         Source: testMeth source
                    ) copyAt: 'w' PutContents: reflect: ' world'
            ) reflectee.
            [h a = 'hello world'] assert.
            testCreateMethodFailures.
            'ok').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'programmingPrims' -> () From: ( | {
         'Category: new tests\x7fModuleInfo: Module: programmingTests InitialContents: FollowSlot\x7fVisibility: public'
        
         testPreserveMethodPointer = ( |
             m.
            | 
            'testing preservation of links from literals to methods' printLine.
              m: ((reflect: '( | x = ( | a | [ a] value. 3 + 4) | )' eval) at: 'x') contents.
              m isReflecteeMethod ifFalse: [^ 'not method'].
              m checkMethodStructureIfFail: [ |:e| ^ 'initially wrong: ', e].
              m at: 'a' PutContents: reflect: '17'.
              (m includesKey: 'a') ifFalse: [^ 'add slot failed'].
              m checkMethodStructureIfFail: [ |:e|  ^ 'at:PutContents: failed: ', e].
              m at: 'a:' PutContents: mirrors assignment.
              m checkMethodStructureIfFail: [ |:e|  ^ 'adding assignment failed: ', e].
              (m at: 'a') remove.
              m checkMethodStructureIfFail: [ |:e|  ^ 'remove: failed: ', e].
              m at: 'b' PutContents: reflect: '17'.
              (m copyAt: 'c' PutContents: reflect: 34)
                checkMethodStructureIfFail: [ |:e|  ^ 'functional add failed: ', e].
              m checkMethodStructureIfFail: [ |:e|  ^ 'functional add corrupted original: ', e ].
              (m at: 'b') copyHolderForRemove
                checkMethodStructureIfFail: [ |:e|  ^ 'functional remove failed: ', e].
              m checkMethodStructureIfFail: [ |:e|  ^ 'functional remove corrupted original: ', e ].
              (m copyAnnotation: objectAnnotation copyForComment: 'no comment')
                checkMethodStructureIfFail: [ |:e|  ^ 'functional set annotation failed: ', e].
              m checkMethodStructureIfFail: [ |:e|  ^ 'functional set annotation corrupted original: ', e ].
              m annotation: 'Comment: snort!'.
              m annotation comment = 'snort!' ifFalse: [^ 'annotation: failed'].
              m checkMethodStructureIfFail: [ |:e| ^ 'wrong 7: ', e].
              'ok').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'programmingPrims' -> () From: ( | {
         'Category: new tests\x7fModuleInfo: Module: programmingTests InitialContents: FollowSlot\x7fVisibility: public'
        
         testRemoveSlot = ( |
            | 
            'testing _RemoveSlot primitives:' print.
            testRemovingArgumentSlot.
            allTrialMirrors do: [|:m|
                m do: [|:s| tryRemovingSlot: s name From: m].
                tryRemovingSlot: 'gazorp' From: m.
                tryRemovingSlot: lobby    From: m.
            ].
            (| foo |)  _MirrorCopyRemoveSlot: 'foo' IfFail: [
                '\n' print.
                ^ 'ok'.
            ].
            error: 'should fail').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'programmingPrims' -> () From: ( | {
         'Category: new tests\x7fModuleInfo: Module: programmingTests InitialContents: FollowSlot\x7fVisibility: public'
        
         testRemovingArgumentSlot = ( |
             m.
             o.
            | 
            o: ( | 
                p* = traits clonable.
                a: a B: b C: c = ( a, b, c ).
                a = '1'. b = '2'. c = '3'.
            | ).
            m: ((reflect: o) slotAt: 'a:B:C:') value.
                  ('a'   & 'b'   & 'c'  ) asVector
            with: ('1xy' & 'x2y' & 'xy3') asVector  Do: [|:n. :soln. mr. res|
                mr: (m at: n) copyHolderForRemove.
                res: (
                    (reflect: o) copyAt: 'x:Y:' PutContents: mr.
                ) reflectee  x: 'x' Y: 'y'.
                [res = soln] assert. "remaining args shift to front"
            ].
            'ok').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'programmingPrims' -> () From: ( | {
         'Category: new tests\x7fCategory: state\x7fModuleInfo: Module: programmingTests InitialContents: InitializeToExpression: (vector copyRemoveAll)'
        
         trialMirrors <- vector copyRemoveAll.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'programmingPrims' -> () From: ( | {
         'Category: new tests\x7fModuleInfo: Module: programmingTests InitialContents: InitializeToExpression: (vector copyRemoveAll)\x7fVisibility: private'
        
         trialObjectMirrors <- vector copyRemoveAll.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'programmingPrims' -> () From: ( | {
         'Category: new tests\x7fCategory: state\x7fModuleInfo: Module: programmingTests InitialContents: InitializeToExpression: (vector copyRemoveAll)'
        
         trialObjects <- vector copyRemoveAll.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'programmingPrims' -> () From: ( | {
         'Category: new tests\x7fModuleInfo: Module: programmingTests InitialContents: FollowSlot\x7fVisibility: private'
        
         tryAddingSlotsTo: o1 From: o2 NewOnly: newOnly = ( | {
                 'ModuleInfo: Module: programmingTests InitialContents: FollowSlot'
                
                 m1.
                }  {
                 'ModuleInfo: Module: programmingTests InitialContents: FollowSlot'
                
                 m1a.
                }  {
                 'ModuleInfo: Module: programmingTests InitialContents: FollowSlot'
                
                 m2.
                }  {
                 'ModuleInfo: Module: programmingTests InitialContents: FollowSlot'
                
                 mr.
                }  {
                 'ModuleInfo: Module: programmingTests InitialContents: FollowSlot'
                
                 o1a.
                }  {
                 'ModuleInfo: Module: programmingTests InitialContents: FollowSlot'
                
                 r.
                }  {
                 'ModuleInfo: Module: programmingTests InitialContents: FollowSlot'
                
                 shouldWork.
                } 
            | 
            m1: reflect: o1.
            o1a: o1 _Clone.
            m1a: reflect: o1a.
            m2: reflect: o2.

            shouldWork:   
                   (isProgrammableSlots: m1) 
                && [isPossibleToDefine: m1 ToBe: m1 WithMirrors: false]
                && [
                    newOnly not || [
                    " check for ( | foo = (method) | ) _AddSlotsIfAbsent: (|foo|)"
                        m2 findFirst: [ |:s|
                                 s isAssignable 
                           && [(m1 names includes: s name)
                           && [(m1 slotAt: s name) contents isReflecteeMethod ]]
                        ] IfPresent: false IfAbsent: true]].

            shouldWork ifFalse: [
                addSlotsTo: o1a From: o2 NewOnly: newOnly IfFail: [^ 'ok'].
                error: 'should fail'.
            ].
            r: addSlotsTo: o1a From: o2 NewOnly: newOnly IfFail: [|:e|
                error: e
            ].
            mr:  reflect: r.
            [mr  = m1a] assert.
            [m1 != m1a] assert.
            m2 do: [|:s|
                newOnly && (m1 names includes: s key) ifFalse: [ | sr |
                    [mr names includes: s key] assert.
                    sr: mr slotAt: s key.
                    [isSlot: s SameAs: sr] assert.
                ].
            ].
            'ok').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'programmingPrims' -> () From: ( | {
         'Category: new tests\x7fModuleInfo: Module: programmingTests InitialContents: FollowSlot\x7fVisibility: private'
        
         tryCopy: dst At: name Put: contents IsParent: isParent = ( | {
                 'ModuleInfo: Module: programmingTests InitialContents: FollowSlot'
                
                 dstClone.
                }  {
                 'ModuleInfo: Module: programmingTests InitialContents: FollowSlot'
                
                 removedAsgSlotName <- ''.
                }  {
                 'ModuleInfo: Module: programmingTests InitialContents: FollowSlot'
                
                 rm.
                } 
            | 

            ( isOkToAddSlotTo: dst At: name Contents: contents IsParent: isParent )
              ifFalse: [
                dst _MirrorCopyAt: name Put: contents
                          IsParent: isParent 
                          IsArgument: false
                          Annotation: slotAnnotation
                              IfFail: [|:e| ^ 'ok' ].
                error: 'should fail'.
            ].
            dstClone: [|:e|
                dst cloneReflecteeIfFail: [e value: dst].
            ] exitValue.

            rm: dstClone 
                  _MirrorCopyAt: name Put: contents
                    IsParent: isParent 
                    IsArgument: false
                    Annotation: slotAnnotation
                    IfFail: raiseError.

                ((argumentCountOf: name) = 0 )
            && [ (dst names includes: name, ':')
            && [ (dst slotAt: name, ':') value isReflecteeAssignment 
            && [ contents isReflecteeMethod ] ] ]  ifTrue: [
                removedAsgSlotName: name, ':'.
            ].

            dst do: [|:s| 
                s name = name ifTrue: [ | newS |
                    newS: rm slotAt: name.
                    [newS contents       = contents] assert.
                    isParent ifTrue: [[newS isParent     ] assert]
                              False: [[newS isParent not ] assert].
                ] False: [
                s name = removedAsgSlotName ifTrue: [
                    [(rm names includes: removedAsgSlotName) not] assert.
                ] False: [
                   [isSlot: s SameAs:  rm slotAt: s name] assert.
                ]].
            ].
            'ok').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'programmingPrims' -> () From: ( | {
         'Category: slow tests\x7fModuleInfo: Module: programmingTests InitialContents: FollowSlot\x7fVisibility: private'
        
         tryDefining: m1 ToBe: m2 WithMirrors: withMirrors = ( | {
                 'ModuleInfo: Module: programmingTests InitialContents: FollowSlot'
                
                 m1NewClone.
                }  {
                 'ModuleInfo: Module: programmingTests InitialContents: FollowSlot'
                
                 m1OldClone.
                }  {
                 'ModuleInfo: Module: programmingTests InitialContents: FollowSlot'
                
                 shouldBeFast.
                } 
            | 
            (isPossibleToDefine: m1 ToBe: m2 WithMirrors: withMirrors) ifFalse: [
                checkTimestampAndDefine: m1 ToBe: m2 
                  WithMirrors: withMirrors  IfFail: [^'ok'].
            ].
            "define had better work, try it and check it"

            shouldBeFast:
                  m1 isReflecteeByteVector not  
            &&  [ m2 isReflecteeByteVector not
            &&  [ (isMirrorAProxy: m1)     not "too hard to compute for proxies"
            &&  [ (isMirrorAProxy: m2)     not  "too hard to compute for proxies"
            &&  [ (isMirror: m1 SameTypeAs: m2)
            &&  [ m2 isReflecteeMethod not
            &&  [ (objectOopsInMirror: m1) = (objectOopsInMirror: m2) ]]]]]].

            " try define with both old and new targets "
            m1OldClone: cloneMirror: m1.
            "m1OldClone reflectee _Tenure."
            "Want to tenure this guy, but may not be able to access reflectee,
              and Tenure tenures all, anyway:"
            _Tenure.
            m1NewClone: cloneMirror: m1.
            (m1OldClone & m1NewClone) asVector do: [
                |
                  :m1Clone. 
                  m1CloneHash.
                  mr.
                  anObj <- ( | p* = traits clonable. var. const = 23 | ).
                  t.
                |
                m1CloneHash: m1Clone _MirrorReflecteeIdentityHash.

                anObj: anObj copy.
                (reflect: anObj) at: 'var'   PutContents: m1Clone.
                (reflect: anObj) at: 'const' PutContents: m1Clone.
                t: [
                    mr: checkTimestampAndDefine: m1Clone ToBe: m2  
                    WithMirrors: withMirrors
                    IfFail: raiseError.
                ] cpuTime.

                shouldBeFast && [t > 300] ifTrue: [
                    warning: 'define should have been fast, but took ', 
                    t printString, ' ms.'.
                ].
                [m1CloneHash = m1Clone _MirrorReflecteeIdentityHash] assert.

                "use m1Clone, not mr here cause it is a tougher test"
                mirror: m1Clone MustBeACloneOf: m2.
                [m1Clone = mr] assert.
                [m1Clone = ((reflect: anObj) slotAt: 'const') value] assert.
                [m1Clone = ((reflect: anObj) slotAt: 'var'  ) value] assert.
            ].
            'ok').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'programmingPrims' -> () From: ( | {
         'Category: new tests\x7fModuleInfo: Module: programmingTests InitialContents: FollowSlot\x7fVisibility: private'
        
         tryRemovingSlot: name From: mir = ( |
            | 
            tryRemovingSlot: name From: mir WithMirrors: true.
            tryRemovingSlot: name From: mir WithMirrors: false).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'programmingPrims' -> () From: ( | {
         'Category: new tests\x7fModuleInfo: Module: programmingTests InitialContents: FollowSlot\x7fVisibility: private'
        
         tryRemovingSlot: name From: mir WithMirrors: withMirrors = ( | {
                 'ModuleInfo: Module: programmingTests InitialContents: FollowSlot'
                
                 goners <- ((bootstrap stub -> 'globals') \/-> 'vector') -> ().
                }  {
                 'ModuleInfo: Module: programmingTests InitialContents: FollowSlot'
                
                 m1.
                }  {
                 'ModuleInfo: Module: programmingTests InitialContents: FollowSlot'
                
                 mr.
                }  {
                 'ModuleInfo: Module: programmingTests InitialContents: FollowSlot'
                
                 o1.
                }  {
                 'ModuleInfo: Module: programmingTests InitialContents: FollowSlot'
                
                 shouldWork.
                } 
            | 
            withMirrors ifFalse: [ 
                o1: (mir reflecteeIfFail: [^self]) _Clone.
                m1: reflect: o1.
            ] True: [  m1: mir. ].
            shouldWork: (isProgrammableSlots: mir) 
                && [(reflect: name) isReflecteeString
                && [mir names includes: name]].
            shouldWork ifFalse: [
                withMirrors ifTrue: [ 
                    mir _MirrorCopyRemoveSlot: name IfFail: [^'ok'].
                ] False: [
                    o1  _RemoveSlot: name IfFail: [^'ok'].
                ].
                error: 'should fail'
            ].
            withMirrors ifTrue: [
                mr: m1 _MirrorCopyRemoveSlot: name.
            ] False: [ 
                | anObj = ( | const = 3. var <- 3 | ) |
                (reflect: anObj) at: 'const' PutContents: m1.
                anObj var: o1.
                mr: reflect: o1 _RemoveSlot: name.
                [mr = m1] assert.
                [anObj var _Eq: mr reflectee] assert.
                [((reflect: anObj) slotAt: 'const') value = mr] assert.
            ].
            (mir slotAt: name, ':' IfAbsent: [reflect: ()]) 
              value isReflecteeAssignment ifTrue: [
                goners: (name & (name, ':')) asVector.
                [mr size = (mir size - 2)] assert.
            ] False: [
                goners: vector copyAddFirst: name.
                [mr size = (mir size - 1)] assert.
            ].
            mir do: [|:s. n|
                n: s name.
                (goners includes: n) 
                  ifTrue: [[(mr names includes: n) not] assert]
                   False: [[isSlot: s SameAs: mr slotAt: n] assert].
            ].
            'ok').
        } | ) 



 '-- Side effects'

 globals modules programmingTests postFileIn
