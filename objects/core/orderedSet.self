 '$Revision: 30.10 $'
 '
Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: orderedSet InitialContents: FollowSlot'
        
         orderedSet = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'orderedSet' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'comment' From:
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'orderedSet' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules orderedSet.

CopyDowns:
globals modules init. copy 
SlotsToOmit: comment directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'orderedSet' -> () From: ( | {
         'ModuleInfo: Module: orderedSet InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'core'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'orderedSet' -> () From: ( | {
         'ModuleInfo: Module: orderedSet InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'orderedSet' -> () From: ( | {
         'ModuleInfo: Module: orderedSet InitialContents: FollowSlot'
        
         myComment <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'orderedSet' -> () From: ( | {
         'ModuleInfo: Module: orderedSet InitialContents: FollowSlot'
        
         postFileIn = ( |
            | 
            resend.postFileIn).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'orderedSet' -> () From: ( | {
         'ModuleInfo: Module: orderedSet InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- '$Revision: 30.10 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'orderedSet' -> () From: ( | {
         'ModuleInfo: Module: orderedSet InitialContents: FollowSlot\x7fVisibility: private'
        
         subpartNames <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: collections\x7fCategory: ordered\x7fComment: A set that remembers the order in which things were added -- Mario, 4/10/95\x7fModuleInfo: Module: orderedSet InitialContents: FollowSlot\x7fVisibility: public'
        
         orderedSet = bootstrap define: bootstrap stub -> 'globals' -> 'orderedSet' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             bootstrap remove: 'prototype' From:
             globals list copyRemoveAll ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'orderedSet' -> () From: ( |
             {} = 'Comment: A cross between a list and a set: nothing
appears twice, but the order in which things
are added is significant.\x7fModuleInfo: Creator: globals orderedSet.

CopyDowns:
globals list. copyRemoveAll 
SlotsToOmit: parent prototype.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: collections\x7fCategory: ordered\x7fModuleInfo: Module: orderedSet InitialContents: FollowSlot\x7fVisibility: public'
        
         orderedSet = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'orderedSet' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits orderedSet.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'orderedSet' -> () From: ( | {
         'ModuleInfo: Module: orderedSet InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'orderedSet' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'orderedSet' -> () From: ( | {
         'ModuleInfo: Module: orderedSet InitialContents: FollowSlot\x7fVisibility: private'
        
         prototype = ( |
            | orderedSet).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'orderedSet' -> () From: ( | {
         'Comment: So that we can implement includes: efficiently.
Notice that this makes an orderedSet take twice as
much memory as it would otherwise, and we need to
make sure to keep it in sync.\x7fModuleInfo: Module: orderedSet InitialContents: InitializeToExpression: (set)\x7fVisibility: private'
        
         unorderedElements <- bootstrap stub -> 'globals' -> 'set' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'collection' -> () From: ( | {
         'Category: transforming\x7fComment: Warning: quadratic behavior -- Mario, 4/11/95\x7fModuleInfo: Module: orderedSet InitialContents: FollowSlot\x7fVisibility: public'
        
         asOrderedSet = ( |
            | orderedSet copyContaining: self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'collector' -> () From: ( | {
         'Category: conversions\x7fComment: Warning: this has quadratic behavior -- Mario, 4/11/95\x7fModuleInfo: Module: orderedSet InitialContents: FollowSlot\x7fVisibility: public'
        
         asOrderedSet = ( |
            | 
            "Can't do the prependIntoGrowable: thing because the order that we
            insert the elements matters."
            asVector asOrderedSet).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'orderedSet' -> () From: ( | {
         'Category: adding\x7fModuleInfo: Module: orderedSet InitialContents: FollowSlot\x7fVisibility: public'
        
         addFirst: elem = ( |
            | 
            unorderedElements
                           if: elem
                  IsPresentDo: [^ self]
                  IfAbsentPut: [elem]
                        AndDo: [resend.addFirst: elem].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'orderedSet' -> () From: ( | {
         'Category: adding\x7fModuleInfo: Module: orderedSet InitialContents: FollowSlot\x7fVisibility: public'
        
         addLast: elem = ( |
            | 
            unorderedElements
                           if: elem
                  IsPresentDo: [^ self]
                  IfAbsentPut: [elem]
                        AndDo: [resend.addLast: elem].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'orderedSet' -> () From: ( | {
         'Category: coercing\x7fModuleInfo: Module: orderedSet InitialContents: FollowSlot\x7fVisibility: public'
        
         asList = ( |
            | list copyContaining: self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'orderedSet' -> () From: ( | {
         'Category: coercing\x7fModuleInfo: Module: orderedSet InitialContents: FollowSlot\x7fVisibility: public'
        
         asOrderedSet = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'orderedSet' -> () From: ( | {
         'Category: printing\x7fModuleInfo: Module: orderedSet InitialContents: FollowSlot\x7fVisibility: public'
        
         collectionName = 'orderedSet'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'orderedSet' -> () From: ( | {
         'Category: copying\x7fModuleInfo: Module: orderedSet InitialContents: FollowSlot\x7fVisibility: public'
        
         copyRemoveAll = ( |
            | 
            ((clone rep: rep copy) unorderedElements: unorderedElements copyRemoveAll) removeAll).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'orderedSet' -> () From: ( | {
         'Category: fast accessing\x7fModuleInfo: Module: orderedSet InitialContents: FollowSlot\x7fVisibility: public'
        
         if: k IsPresentDo: presentActionBlock IfAbsentDo: absentActionBlock = ( |
            | 
            unorderedElements if: k
                     IsPresentDo: presentActionBlock
                      IfAbsentDo: absentActionBlock).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'orderedSet' -> () From: ( | {
         'Category: fast accessing\x7fComment: If collection contains k invoke presentActionBlock with value at k.
If k is absent, add result of evaluating newValueBlock on k,
and invoke absentActionBlock with new value.\x7fModuleInfo: Module: orderedSet InitialContents: FollowSlot\x7fVisibility: public'
        
         if: k IsPresentDo: presentActionBlock IfAbsentPut: newValueBlock AndDo: absentActionBlock = ( |
            | 
            unorderedElements if: k
                     IsPresentDo: presentActionBlock
                     IfAbsentPut: newValueBlock
                           AndDo: [|:newV. :oldK| resend.addLast: newV.
                                           absentActionBlock value: newV With: oldK ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'orderedSet' -> () From: ( | {
         'Category: fast accessing\x7fComment: if collection contains k, invoke replacementValueBlock with arg 
old value and replace contents at k with result of replacementValueBlock.
Then invoke presentActionBlock with arg new value.
If k is absent, invoke absentActionBlock with k.\x7fModuleInfo: Module: orderedSet InitialContents: FollowSlot\x7fVisibility: public'
        
         if: k IsPresentPut: replacementValueBlock AndDo: presentActionBlock IfAbsentDo: absentActionBlock = ( |
            | 
            unorderedElements if: k
                    IsPresentPut: replacementValueBlock
                           AndDo: [|:newV. :oldK| firstLinkFor: k
                                              IfPresent: [|:lnk| lnk value: newV. ^ presentActionBlock value: newV With: oldK]
                                               IfAbsent: raiseError]
                      IfAbsentDo: absentActionBlock).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'orderedSet' -> () From: ( | {
         'Category: fast accessing\x7fComment: if collection contains k, 
invoke replacementValueBlock with arg old value
and replace contents at k with result of replacementValueBlock.
Then invoke presentActionBlock with arg new value.
If k is absent, add result of evaluating newValueBlock
and invoke absentActionBlock with new value.\x7fModuleInfo: Module: orderedSet InitialContents: FollowSlot\x7fVisibility: public'
        
         if: k IsPresentPut: replacementValueBlock AndDo: presentActionBlock IfAbsentPut: newValueBlock AndDo: absentActionBlock = ( |
            | 
            unorderedElements if: k
                    IsPresentPut: replacementValueBlock
                           AndDo: [|:newV. :oldK| firstLinkFor: k
                                              IfPresent: [|:lnk| lnk value: newV. ^ presentActionBlock value: newV With: oldK]
                                               IfAbsent: raiseError]
                     IfAbsentPut: newValueBlock
                           AndDo: [|:newV. :oldK| resend.addLast: newV.
                                           absentActionBlock value: newV With: oldK]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'orderedSet' -> () From: ( | {
         'Category: searching\x7fModuleInfo: Module: orderedSet InitialContents: FollowSlot\x7fVisibility: public'
        
         includes: v = ( |
            | 
            unorderedElements includes: v).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'orderedSet' -> () From: ( | {
         'ModuleInfo: Module: orderedSet InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'list' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'orderedSet' -> () From: ( | {
         'Category: removing\x7fModuleInfo: Module: orderedSet InitialContents: FollowSlot\x7fVisibility: public'
        
         remove: elem IfAbsent: block = ( |
            | 
            unorderedElements remove: elem IfAbsent: [^ block value].
            resend.remove: elem IfAbsent: [error: 'should never get here']).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'orderedSet' -> () From: ( | {
         'Category: removing\x7fModuleInfo: Module: orderedSet InitialContents: FollowSlot\x7fVisibility: public'
        
         removeAll = ( |
            | 
            unorderedElements removeAll.
            resend.removeAll).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'orderedSet' -> () From: ( | {
         'Category: removing\x7fModuleInfo: Module: orderedSet InitialContents: FollowSlot\x7fVisibility: public'
        
         removeFirst = ( |
             v.
            | 
            v: resend.removeFirst.
            unorderedElements remove: v.
            v).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'orderedSet' -> () From: ( | {
         'Category: removing\x7fModuleInfo: Module: orderedSet InitialContents: FollowSlot\x7fVisibility: public'
        
         removeLast = ( |
             v.
            | 
            v: resend.removeLast.
            unorderedElements remove: v.
            v).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'orderedSet' -> () From: ( | {
         'ModuleInfo: Module: orderedSet InitialContents: FollowSlot\x7fVisibility: private'
        
         unitTests = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'orderedSet' -> 'unitTests' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits orderedSet unitTests.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'orderedSet' -> 'unitTests' -> () From: ( | {
         'ModuleInfo: Module: orderedSet InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'orderedSet' -> 'unitTests' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits orderedSet unitTests parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'orderedSet' -> 'unitTests' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: orderedSet InitialContents: FollowSlot\x7fVisibility: private'
        
         assert: b = ( |
            | 
            b value ifFalse: [error: 'assertion failure']).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'orderedSet' -> 'unitTests' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: orderedSet InitialContents: FollowSlot\x7fVisibility: private'
        
         fail = ( |
            | assert: false).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'orderedSet' -> 'unitTests' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: orderedSet InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'clonable' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'orderedSet' -> 'unitTests' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: orderedSet InitialContents: FollowSlot\x7fVisibility: public'
        
         run = ( |
            | 
            testConverting.
            testRemoving.
            testAdding.
            testFastAccessing.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'orderedSet' -> 'unitTests' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: orderedSet InitialContents: FollowSlot\x7fVisibility: private'
        
         testAdding = ( |
             s.
            | 
            s: ('one' & 2 & '%') asOrderedSet.

            assert: (s addLast: 'last') = ('one' & 2 & '%' & 'last') asOrderedSet.
            assert: (s addFirst: 'first') = ('first' & 'one' & 2 & '%' & 'last') asOrderedSet.
            assert: (s copyRemoveAll addFirst: 'first') = (vector copyAddLast: 'first') asOrderedSet.
            "this is too cool to take out"
            assert: (s copyRemoveAll addFirst: 'first') = (vector copyAddLast: 'first' asOrderedSet)).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'orderedSet' -> 'unitTests' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: orderedSet InitialContents: FollowSlot\x7fVisibility: private'
        
         testConverting = ( |
             s.
            | 
            s: (1 & 3 & 2 & 3) asOrderedSet.
            assert: s size = 3.
            assert: (s at: 0) = 1.
            assert: (s at: 1) = 3.
            assert: (s at: 2) = 2.
            "Make sure there is no fourth element."
            s at: 3 IfAbsent: [^self].
            fail).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'orderedSet' -> 'unitTests' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: orderedSet InitialContents: FollowSlot\x7fVisibility: private'
        
         testFastAccessing = ( |
             i <- 0.
             s.
            | 
            s: ('one' & 2 & '%') asOrderedSet.

            s if: 2 IsPresentDo: [|:v. :k| i: 11. assert: v = 2. assert: k = 2] IfAbsentDo: [fail].
            assert: i = 11.
            assert: s = ('one' & 2 & '%') asOrderedSet.
            s if: 3 IsPresentDo: [fail] IfAbsentDo: [i: 22].
            assert: i = 22.
            assert: s = ('one' & 2 & '%') asOrderedSet.

            s if: '%' IsPresentDo: [|:v| i: 33. assert: v = '%'] IfAbsentPut: [fail] AndDo: [fail].
            assert: i = 33.
            assert: s = ('one' & 2 & '%') asOrderedSet.
            s if: 'two' IsPresentDo: [fail] IfAbsentPut: ['deux'] AndDo: [|:v. :k| i: 44. assert: v = 'deux'. assert: k = 'two'].
            assert: i = 44.
            assert: s = ('one' & 2 & '%' & 'deux') asOrderedSet.

            s if: 'deux' IsPresentPut: [|:v| assert: v = 'deux'. v, ' potato'] AndDo: [|:v| i: 55. assert: v = 'deux potato'] IfAbsentDo: [fail].
            assert: i = 55.
            assert: s = ('one' & 2 & '%' & 'deux potato') asOrderedSet.
            s if: 0@0 IsPresentPut: [fail] AndDo: [fail] IfAbsentDo: [i: 66].
            assert: i = 66.
            assert: s = ('one' & 2 & '%' & 'deux potato') asOrderedSet.

            s if: '%' IsPresentPut: [|:v| assert: v = '%'. v, ' & *'] AndDo: [|:v| i: 77. assert: v = '% & *'] IfAbsentPut: [fail] AndDo: [fail].
            assert: i = 77.
            assert: s = ('one' & 2 & '% & *' & 'deux potato') asOrderedSet.
            s if: 0 IsPresentPut: [fail] AndDo: [fail] IfAbsentPut: ['zero'] AndDo: [|:v| i: 88. assert: v = 'zero'].
            assert: i = 88.
            assert: s = ('one' & 2 & '% & *' & 'deux potato' & 'zero') asOrderedSet).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'orderedSet' -> 'unitTests' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: orderedSet InitialContents: FollowSlot\x7fVisibility: private'
        
         testRemoving = ( |
             s.
            | 
            s: ('three' & 'one' & 'two' & 'three' & 'two') asList asOrderedSet.
            assert: s asVector = ('three' & 'one' & 'two') asVector.
            s remove: 'one' IfAbsent: [fail].
            assert: s asVector = ('three' & 'two') asVector.

            s: ('three' & 'one' & 'two' & 'three' & 'two') asList asOrderedSet.
            assert: s removeLast = 'two'.
            assert: s asVector = ('three' & 'one') asVector.

            s: ('three' & 'one' & 'two' & 'three' & 'two') asList asOrderedSet.
            assert: s removeFirst = 'three'.
            assert: s asVector = ('one' & 'two') asVector).
        } | ) 



 '-- Side effects'

 globals modules orderedSet postFileIn
