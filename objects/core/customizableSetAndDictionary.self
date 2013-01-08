 '$Revision: 30.4 $'
 '
Copyright 1992-2012 AUTHORS.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: collections\x7fCategory: unordered\x7fCategory: dictionaries\x7fModuleInfo: Module: customizableSetAndDictionary InitialContents: FollowSlot\x7fVisibility: public'
        
         customizableDictionary = bootstrap define: bootstrap stub -> 'globals' -> 'customizableDictionary' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             bootstrap remove: 'prototype' From:
             bootstrap remove: 'safety' From:
             globals dictionary copyRemoveAll ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'customizableDictionary' -> () From: ( |
             {} = 'Comment: I am a dictionary that can have custom
comparisonTraits.\x7fModuleInfo: Creator: globals customizableDictionary.

CopyDowns:
globals dictionary. copyRemoveAll 
SlotsToOmit: parent prototype safety.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'customizableDictionary' -> () From: ( | {
         'ModuleInfo: Module: customizableSetAndDictionary InitialContents: InitializeToExpression: (traits abstractSetOrDictionary equalityComparisonMixin)\x7fVisibility: private'
        
         comparisonTraits <- bootstrap stub -> 'traits' -> 'abstractSetOrDictionary' -> 'equalityComparisonMixin' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'customizableDictionary' -> () From: ( | {
         'ModuleInfo: Module: customizableSetAndDictionary InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'customizableDictionary' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals customizableDictionary parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'customizableDictionary' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: customizableSetAndDictionary InitialContents: FollowSlot\x7fVisibility: public'
        
         collectionName = 'customizableDictionary'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'customizableDictionary' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: customizableSetAndDictionary InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'hashTableDictionary' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'customizableDictionary' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: customizableSetAndDictionary InitialContents: FollowSlot\x7fVisibility: private'
        
         safety* = bootstrap stub -> 'traits' -> 'abstractSetOrDictionary' -> 'unsafeMixin' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'customizableDictionary' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: customizableSetAndDictionary InitialContents: FollowSlot\x7fVisibility: public'
        
         statePrintString = ( |
             r.
             sp.
            | 
            "Duplicated over in customizableSet parent."
            sp: resend.statePrintString.
            r: 'using ' & (reflect: comparisonTraits) safeName.
            sp isEmpty ifFalse: [r: r & ': ' & resend.statePrintString].
            r flatString).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'customizableDictionary' -> () From: ( | {
         'ModuleInfo: Module: customizableSetAndDictionary InitialContents: FollowSlot\x7fVisibility: private'
        
         prototype = ( |
            | 
            customizableDictionary).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: collections\x7fCategory: unordered\x7fCategory: sets\x7fModuleInfo: Module: customizableSetAndDictionary InitialContents: FollowSlot\x7fVisibility: public'
        
         customizableSet = bootstrap define: bootstrap stub -> 'globals' -> 'customizableSet' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             bootstrap remove: 'prototype' From:
             bootstrap remove: 'safety' From:
             globals set copyRemoveAll ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'customizableSet' -> () From: ( |
             {} = 'Comment: I am a set that can have custom
comparisonTraits.\x7fModuleInfo: Creator: globals customizableSet.

CopyDowns:
globals set. copyRemoveAll 
SlotsToOmit: parent prototype safety.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'customizableSet' -> () From: ( | {
         'ModuleInfo: Module: customizableSetAndDictionary InitialContents: InitializeToExpression: (traits abstractSetOrDictionary equalityComparisonMixin)\x7fVisibility: private'
        
         comparisonTraits <- bootstrap stub -> 'traits' -> 'abstractSetOrDictionary' -> 'equalityComparisonMixin' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'customizableSet' -> () From: ( | {
         'ModuleInfo: Module: customizableSetAndDictionary InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'customizableSet' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals customizableSet parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'customizableSet' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: customizableSetAndDictionary InitialContents: FollowSlot\x7fVisibility: public'
        
         collectionName = 'customizableSet'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'customizableSet' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: customizableSetAndDictionary InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'hashTableSet' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'customizableSet' -> 'parent' -> () From: ( | {
         'Category: unit tests\x7fModuleInfo: Module: customizableSetAndDictionary InitialContents: FollowSlot\x7fVisibility: public'
        
         runTests = ( |
            | 
            testAddition.
            testComplexTestingMethods).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'customizableSet' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: customizableSetAndDictionary InitialContents: FollowSlot\x7fVisibility: private'
        
         safety* = bootstrap stub -> 'traits' -> 'abstractSetOrDictionary' -> 'unsafeMixin' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'customizableSet' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: customizableSetAndDictionary InitialContents: FollowSlot\x7fVisibility: public'
        
         statePrintString = ( |
             r.
             sp.
            | 
            "Duplicated over in customizableDictionary parent."
            sp: resend.statePrintString.
            r: 'using ' & (reflect: comparisonTraits) safeName.
            sp isEmpty ifFalse: [r: r & ': ' & resend.statePrintString].
            r flatString).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'customizableSet' -> 'parent' -> () From: ( | {
         'Category: unit tests\x7fModuleInfo: Module: customizableSetAndDictionary InitialContents: FollowSlot\x7fVisibility: private'
        
         testAddition = ( |
             p1.
             p2.
             p3.
             p4.
             p5.
             p6.
             testSet.
            | 
            testSet: customizableSet copyRemoveAll.
            testSet comparisonTraits: unitTestComparisonTraits.
            p1: testPoint copyFor: (1 @ 2).
            p2: testPoint copyFor: (2 @ 2).
            p3: testPoint copyFor: (2 @ 1).
            p4: testPoint copyFor: (1 @ 2).
            p5: testPoint copyFor: (1 @ 3).
            p6: testPoint copyFor: (2 @ 3).
            testSet add: p1.
            testSet add: p2.
            testSet add: p3.
            [|r| r: true.  testSet at: p4 IfAbsent: [r: false]. r] assert.
            [|r| r: false. testSet at: p5 IfAbsent: [r: true ]. r] assert.
            [testSet size = 2] assert.
            testSet at: p5 IfAbsentPut: p6.
            [|r| r: true.  testSet at: p5 IfAbsent: [r: false]. r] assert.
            [((testSet at: p5) = p6) not] assert.
            [ (testSet at: p6) = p5     ] assert.
            true).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'customizableSet' -> 'parent' -> () From: ( | {
         'Category: unit tests\x7fModuleInfo: Module: customizableSetAndDictionary InitialContents: FollowSlot\x7fVisibility: private'
        
         testComplexTestingMethods = ( |
             p1.
             p2.
             p3.
             p4.
             p5.
             testSet.
            | 
            testSet: customizableSet copyRemoveAll.
            testSet comparisonTraits: unitTestComparisonTraits.
            p1: testPoint copyFor: (1 @ 3).
            p2: testPoint copyFor: (2 @ 3).
            p3: testPoint copyFor: (1 @ 4).
            p4: testPoint copyFor: (1 @ 'x').
            p5: testPoint copyFor: (1 @ 'z').
            testSet add: p1.
            testSet   if: p1
            IsPresentPut: [p5]
                   AndDo: []
             IfAbsentPut: []
                   AndDo: [].
            [  testSet includes: p5      ] assert.
            [ (testSet includes: p1) not ] assert.


            testSet   if: p3
            IsPresentPut: [p2]
                   AndDo: []
             IfAbsentPut: [p4]
                   AndDo: [].
            [  testSet includes: p4      ] assert.
            [ (testSet includes: p2) not ] assert.
            true).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'customizableSet' -> 'parent' -> () From: ( | {
         'Category: unit tests\x7fModuleInfo: Module: customizableSetAndDictionary InitialContents: FollowSlot\x7fVisibility: private'
        
         testPoint = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'customizableSet' -> 'parent' -> 'testPoint' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals customizableSet parent testPoint.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'customizableSet' -> 'parent' -> 'testPoint' -> () From: ( | {
         'ModuleInfo: Module: customizableSetAndDictionary InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'customizableSet' -> 'parent' -> 'testPoint' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals customizableSet parent testPoint parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'customizableSet' -> 'parent' -> 'testPoint' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: customizableSetAndDictionary InitialContents: FollowSlot\x7fVisibility: public'
        
         = e = ( |
            | x = e x).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'customizableSet' -> 'parent' -> 'testPoint' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: customizableSetAndDictionary InitialContents: FollowSlot\x7fVisibility: public'
        
         copyFor: p = ( |
            | ((copy) x: p x) y: p y).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'customizableSet' -> 'parent' -> 'testPoint' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: customizableSetAndDictionary InitialContents: FollowSlot\x7fVisibility: public'
        
         hash = ( |
            | x hash).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'customizableSet' -> 'parent' -> 'testPoint' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: customizableSetAndDictionary InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'clonable' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'customizableSet' -> 'parent' -> 'testPoint' -> () From: ( | {
         'ModuleInfo: Module: customizableSetAndDictionary InitialContents: InitializeToExpression: (0)\x7fVisibility: public'
        
         x <- 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'customizableSet' -> 'parent' -> 'testPoint' -> () From: ( | {
         'ModuleInfo: Module: customizableSetAndDictionary InitialContents: InitializeToExpression: (0)\x7fVisibility: public'
        
         y <- 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'customizableSet' -> 'parent' -> () From: ( | {
         'Category: unit tests\x7fModuleInfo: Module: customizableSetAndDictionary InitialContents: FollowSlot\x7fVisibility: private'
        
         unitTestComparisonTraits = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'customizableSet' -> 'parent' -> 'unitTestComparisonTraits' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals customizableSet parent unitTestComparisonTraits.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'customizableSet' -> 'parent' -> 'unitTestComparisonTraits' -> () From: ( | {
         'ModuleInfo: Module: customizableSetAndDictionary InitialContents: FollowSlot\x7fVisibility: public'
        
         hashElement: e = ( |
            | e y hash).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'customizableSet' -> 'parent' -> 'unitTestComparisonTraits' -> () From: ( | {
         'ModuleInfo: Module: customizableSetAndDictionary InitialContents: FollowSlot\x7fVisibility: public'
        
         is: e1 EqualTo: e2 = ( |
            | 
            e1 y = e2 y).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'customizableSet' -> () From: ( | {
         'ModuleInfo: Module: customizableSetAndDictionary InitialContents: FollowSlot\x7fVisibility: private'
        
         prototype = ( |
            | 
            customizableSet).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: customizableSetAndDictionary InitialContents: FollowSlot'
        
         customizableSetAndDictionary = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'customizableSetAndDictionary' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'customizableSetAndDictionary' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules customizableSetAndDictionary.

CopyDowns:
globals modules init. copy 
SlotsToOmit: directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'customizableSetAndDictionary' -> () From: ( | {
         'ModuleInfo: Module: customizableSetAndDictionary InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'core'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'customizableSetAndDictionary' -> () From: ( | {
         'ModuleInfo: Module: customizableSetAndDictionary InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'customizableSetAndDictionary' -> () From: ( | {
         'ModuleInfo: Module: customizableSetAndDictionary InitialContents: FollowSlot'
        
         myComment <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'customizableSetAndDictionary' -> () From: ( | {
         'ModuleInfo: Module: customizableSetAndDictionary InitialContents: FollowSlot'
        
         postFileIn = ( |
            | resend.postFileIn).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'customizableSetAndDictionary' -> () From: ( | {
         'ModuleInfo: Module: customizableSetAndDictionary InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- '$Revision: 30.4 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'customizableSetAndDictionary' -> () From: ( | {
         'ModuleInfo: Module: customizableSetAndDictionary InitialContents: FollowSlot\x7fVisibility: private'
        
         subpartNames <- ''.
        } | ) 



 '-- Side effects'

 globals modules customizableSetAndDictionary postFileIn
