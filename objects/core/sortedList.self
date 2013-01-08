 '$Revision:$'
 '
Copyright 1992-2012 AUTHORS.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: sortedList InitialContents: FollowSlot'
        
         sortedList = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'sortedList' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'sortedList' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules sortedList.

CopyDowns:
globals modules init. copy 
SlotsToOmit: directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'sortedList' -> () From: ( | {
         'ModuleInfo: Module: sortedList InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'core'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'sortedList' -> () From: ( | {
         'ModuleInfo: Module: sortedList InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'sortedList' -> () From: ( | {
         'ModuleInfo: Module: sortedList InitialContents: FollowSlot'
        
         myComment <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'sortedList' -> () From: ( | {
         'ModuleInfo: Module: sortedList InitialContents: FollowSlot'
        
         postFileIn = ( |
            | resend.postFileIn).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'sortedList' -> () From: ( | {
         'ModuleInfo: Module: sortedList InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- '$Revision:$'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'sortedList' -> () From: ( | {
         'ModuleInfo: Module: sortedList InitialContents: FollowSlot\x7fVisibility: private'
        
         subpartNames <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: collections\x7fCategory: sorted\x7fModuleInfo: Module: sortedList InitialContents: FollowSlot\x7fVisibility: public'
        
         sortedList = bootstrap define: bootstrap stub -> 'globals' -> 'sortedList' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             bootstrap remove: 'prototype' From:
             globals list copyRemoveAll ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'sortedList' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals sortedList.

CopyDowns:
globals list. copyRemoveAll 
SlotsToOmit: parent prototype.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'sortedList' -> () From: ( | {
         'ModuleInfo: Module: sortedList InitialContents: FollowSlot\x7fVisibility: public'
        
         comparator <- bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'sortedList' -> 'comparator' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals sortedList comparator.
\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'sortedList' -> 'comparator' -> () From: ( | {
         'ModuleInfo: Module: sortedList InitialContents: FollowSlot\x7fVisibility: public'
        
         element: a Equals: b = ( |
            | 
            a = b).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'sortedList' -> 'comparator' -> () From: ( | {
         'ModuleInfo: Module: sortedList InitialContents: FollowSlot\x7fVisibility: public'
        
         element: a Precedes: b = ( |
            | 
            a < b).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'sortedList' -> 'comparator' -> () From: ( | {
         'ModuleInfo: Module: sortedList InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'oddball' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'sortedList' -> () From: ( | {
         'ModuleInfo: Module: sortedList InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'sortedList' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals sortedList parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'sortedList' -> 'parent' -> () From: ( | {
         'Category: adding\x7fModuleInfo: Module: sortedList InitialContents: FollowSlot\x7fVisibility: public'
        
         add: elem = ( |
            | 
                             insert: elem
            BeforeElementSatisfying: [|:e| shouldInsert: elem Before: e IfShouldNotBeInsertedAtAll: [^ self]]
                           IfAbsent: [addLast: elem]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'sortedList' -> 'parent' -> () From: ( | {
         'Category: adding\x7fModuleInfo: Module: sortedList InitialContents: FollowSlot\x7fVisibility: public'
        
         addAll: c = ( |
             head.
             lnk.
            | 
            (c isAlreadyKnownToBeSortedBy: comparator) ifFalse: [^ resend.addAll: c].

            lnk: rep next.
            head: lnk prev.
            c do: [|:cElem|
              [|:exit|
                [(head == lnk) || [shouldInsert: cElem Before: lnk value IfShouldNotBeInsertedAtAll: exit]] whileFalse: [lnk: lnk next].
                size: size + 1.
                lnk addPrevLink: link copy value: cElem.
              ] exit.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'sortedList' -> 'parent' -> () From: ( | {
         'Category: testing\x7fModuleInfo: Module: sortedList InitialContents: FollowSlot\x7fVisibility: public'
        
         isAlreadyKnownToBeSortedBy: cmp = ( |
            | 
            comparator = cmp).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'sortedList' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: sortedList InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'list' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'sortedList' -> 'parent' -> () From: ( | {
         'Category: adding\x7fModuleInfo: Module: sortedList InitialContents: FollowSlot\x7fVisibility: private'
        
         shouldInsert: e1 Before: e2 IfShouldNotBeInsertedAtAll: elseBlk = ( |
            | 
            (comparator element: e2 Precedes: e1) not).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'sortedList' -> 'parent' -> () From: ( | {
         'Category: unit tests\x7fModuleInfo: Module: sortedList InitialContents: FollowSlot\x7fVisibility: public'
        
         unitTests = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'sortedList' -> 'parent' -> 'unitTests' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals sortedList parent unitTests.
\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'sortedList' -> 'parent' -> 'unitTests' -> () From: ( | {
         'ModuleInfo: Module: sortedList InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'globals' -> 'tests' -> 'suite' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'sortedList' -> 'parent' -> 'unitTests' -> () From: ( | {
         'ModuleInfo: Module: sortedList InitialContents: FollowSlot\x7fVisibility: public'
        
         run = ( |
            | 
            testAdd.
            testAddAll.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'sortedList' -> 'parent' -> 'unitTests' -> () From: ( | {
         'ModuleInfo: Module: sortedList InitialContents: FollowSlot\x7fVisibility: private'
        
         testAdd = ( |
             r.
            | 
            r: sortedList copyRemoveAll.
            assert: r size Is: 0.

            r add: 5.
            assert: r size Is: 1.
            assert: (r at: 0) Is: 5.

            r add: 1.
            assert: r size Is: 2.
            assert: (r at: 0) Is: 1.
            assert: (r at: 1) Is: 5.

            r add: 3.
            assert: r size Is: 3.
            assert: (r at: 0) Is: 1.
            assert: (r at: 1) Is: 3.
            assert: (r at: 2) Is: 5.

            r add: 7.
            assert: r size Is: 4.
            assert: (r at: 0) Is: 1.
            assert: (r at: 1) Is: 3.
            assert: (r at: 2) Is: 5.
            assert: (r at: 3) Is: 7.

            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'sortedList' -> 'parent' -> 'unitTests' -> () From: ( | {
         'ModuleInfo: Module: sortedList InitialContents: FollowSlot\x7fVisibility: private'
        
         testAddAll = ( |
             r1.
             r2.
            | 
            r1: sortedList copyRemoveAll.
            r1 addAll: ('d' & 'o' & 'g') asVector.
            assert: r1 asVector Equals: ('d' & 'g' & 'o') asVector.

            r2: sortedList copyRemoveAll.
            r2 addAll: ('e' & 'r' & 'a') asVector.
            assert: r2 asVector Equals: ('a' & 'e' & 'r') asVector.
            r2 addAll: r1.
            assert: r1 asVector Equals: ('d' & 'g' & 'o') asVector.
            assert: r2 asVector Equals: ('a' & 'd' & 'e' & 'g' & 'o' & 'r') asVector.

            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'sortedList' -> () From: ( | {
         'ModuleInfo: Module: sortedList InitialContents: FollowSlot\x7fVisibility: private'
        
         prototype = ( |
            | 
            sortedList).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: collections\x7fCategory: sorted\x7fModuleInfo: Module: sortedList InitialContents: FollowSlot\x7fVisibility: public'
        
         sortedListSet = bootstrap define: bootstrap stub -> 'globals' -> 'sortedListSet' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             bootstrap remove: 'prototype' From:
             globals sortedList copyRemoveAll ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'sortedListSet' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals sortedListSet.

CopyDowns:
globals sortedList. copyRemoveAll 
SlotsToOmit: parent prototype.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'sortedListSet' -> () From: ( | {
         'ModuleInfo: Module: sortedList InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'sortedListSet' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals sortedListSet parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'sortedListSet' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: sortedList InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'globals' -> 'sortedList' -> 'parent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'sortedListSet' -> 'parent' -> () From: ( | {
         'Category: adding\x7fModuleInfo: Module: sortedList InitialContents: FollowSlot\x7fVisibility: private'
        
         shouldInsert: e1 Before: e2 IfShouldNotBeInsertedAtAll: elseBlk = ( |
            | 
            (comparator element: e1 Equals:   e2) ifTrue: [^ elseBlk value].
             comparator element: e1 Precedes: e2).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'sortedListSet' -> 'parent' -> () From: ( | {
         'Category: unit tests\x7fModuleInfo: Module: sortedList InitialContents: FollowSlot\x7fVisibility: public'
        
         unitTests = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'sortedListSet' -> 'parent' -> 'unitTests' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals sortedListSet parent unitTests.
\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'sortedListSet' -> 'parent' -> 'unitTests' -> () From: ( | {
         'ModuleInfo: Module: sortedList InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'globals' -> 'tests' -> 'suite' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'sortedListSet' -> 'parent' -> 'unitTests' -> () From: ( | {
         'ModuleInfo: Module: sortedList InitialContents: FollowSlot\x7fVisibility: public'
        
         run = ( |
            | 
            testAdd.
            testAddAll.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'sortedListSet' -> 'parent' -> 'unitTests' -> () From: ( | {
         'ModuleInfo: Module: sortedList InitialContents: FollowSlot\x7fVisibility: private'
        
         testAdd = ( |
             r.
            | 
            r: sortedListSet copyRemoveAll.
            assert: r size Is: 0.

            r add: 5.
            assert: r asVector Equals: vector copyAddFirst: 5.

            r add: 1.
            assert: r asVector Equals: (1 & 5) asVector.

            r add: 3.
            assert: r asVector Equals: (1 & 3 & 5) asVector.

            r add: 3.
            assert: r asVector Equals: (1 & 3 & 5) asVector.

            r add: 1.
            assert: r asVector Equals: (1 & 3 & 5) asVector.

            r add: 5.
            assert: r asVector Equals: (1 & 3 & 5) asVector.

            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'sortedListSet' -> 'parent' -> 'unitTests' -> () From: ( | {
         'ModuleInfo: Module: sortedList InitialContents: FollowSlot\x7fVisibility: private'
        
         testAddAll = ( |
             r1.
             r2.
            | 
            r1: sortedListSet copyRemoveAll.
            r1 addAll: ('g' & 'o' & 'o' & 'd') asVector.
            assert: r1 asVector Equals: ('d' & 'g' & 'o') asVector.

            r2: sortedListSet copyRemoveAll.
            r2 addAll: ('e' & 'r' & 'a' & 's' & 'e' & 'd') asVector.
            assert: r2 asVector Equals: ('a' & 'd' & 'e' & 'r' & 's') asVector.
            r2 addAll: r1.
            assert: r1 asVector Equals: ('d' & 'g' & 'o') asVector.
            assert: r2 asVector Equals: ('a' & 'd' & 'e' & 'g' & 'o' & 'r' & 's') asVector.

            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'sortedListSet' -> () From: ( | {
         'ModuleInfo: Module: sortedList InitialContents: FollowSlot\x7fVisibility: private'
        
         prototype = ( |
            | 
            sortedListSet).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'collection' -> () From: ( | {
         'Category: sorting\x7fComment: Override for sorted collections.\x7fModuleInfo: Module: sortedList InitialContents: FollowSlot\x7fVisibility: public'
        
         isAlreadyKnownToBeSortedBy: cmp = ( |
            | false).
        } | ) 



 '-- Side effects'

 globals modules sortedList postFileIn
