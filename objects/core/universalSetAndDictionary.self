 '$Revision: 30.4 $'
 '
Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: universalSetAndDictionary InitialContents: FollowSlot'
        
         universalSetAndDictionary = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'universalSetAndDictionary' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'universalSetAndDictionary' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules universalSetAndDictionary.

CopyDowns:
globals modules init. copy 
SlotsToOmit: directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'universalSetAndDictionary' -> () From: ( | {
         'ModuleInfo: Module: universalSetAndDictionary InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'core'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'universalSetAndDictionary' -> () From: ( | {
         'ModuleInfo: Module: universalSetAndDictionary InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'universalSetAndDictionary' -> () From: ( | {
         'ModuleInfo: Module: universalSetAndDictionary InitialContents: FollowSlot'
        
         myComment <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'universalSetAndDictionary' -> () From: ( | {
         'ModuleInfo: Module: universalSetAndDictionary InitialContents: FollowSlot'
        
         postFileIn = ( |
            | resend.postFileIn).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'universalSetAndDictionary' -> () From: ( | {
         'ModuleInfo: Module: universalSetAndDictionary InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- '$Revision: 30.4 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'universalSetAndDictionary' -> () From: ( | {
         'ModuleInfo: Module: universalSetAndDictionary InitialContents: FollowSlot\x7fVisibility: private'
        
         subpartNames <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: collections\x7fCategory: unordered\x7fCategory: sets\x7fModuleInfo: Module: universalSetAndDictionary InitialContents: FollowSlot\x7fVisibility: public'
        
         universalSet = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'universalSet' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals universalSet.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'universalSet' -> () From: ( | {
         'ModuleInfo: Module: universalSetAndDictionary InitialContents: InitializeToExpression: (false)\x7fVisibility: private'
        
         includesMarker <- bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'universalSet' -> () From: ( | {
         'ModuleInfo: Module: universalSetAndDictionary InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         marker.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'universalSet' -> () From: ( | {
         'ModuleInfo: Module: universalSetAndDictionary InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         mySetOrDictionary.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: collections\x7fCategory: unordered\x7fCategory: can hold markers\x7fModuleInfo: Module: universalSetAndDictionary InitialContents: FollowSlot\x7fVisibility: public'
        
         universalSet = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'universalSet' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits universalSet.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'universalSet' -> () From: ( | {
         'ModuleInfo: Module: universalSetAndDictionary InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'universalSet' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'universalSet' -> () From: ( | {
         'ModuleInfo: Module: universalSetAndDictionary InitialContents: FollowSlot\x7fVisibility: private'
        
         prototype = ( |
            | 
            universalSet).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'universalSet' -> () From: ( | {
         'ModuleInfo: Module: universalSetAndDictionary InitialContents: FollowSlot\x7fVisibility: private'
        
         abstractTraits* = bootstrap stub -> 'traits' -> 'abstractSet' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'universalSet' -> () From: ( | {
         'Category: printing\x7fModuleInfo: Module: universalSetAndDictionary InitialContents: FollowSlot\x7fVisibility: public'
        
         collectionName = 'universalSet'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: collections\x7fCategory: unordered\x7fCategory: can hold markers\x7fModuleInfo: Module: universalSetAndDictionary InitialContents: FollowSlot\x7fVisibility: public'
        
         universalSetOrDictionary = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'universalSetOrDictionary' -> () From: ( |
             {} = 'Comment: Ordinary hash-table-based sets and dictionaries use an
emptyMarker and a removedMarker to indicate the absence
of a key. This means that those markers cannot be used
as keys in an ordinary set or dictionary.

I am a set or dictionary that can hold those markers
(though I\'m a bit slower than ordinary sets and
dictionaries).\x7fModuleInfo: Creator: traits universalSetOrDictionary.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'universalSet' -> () From: ( | {
         'ModuleInfo: Module: universalSetAndDictionary InitialContents: FollowSlot\x7fVisibility: private'
        
         representationTraits* = bootstrap stub -> 'traits' -> 'universalSetOrDictionary' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'universalSet' -> () From: ( | {
         'ModuleInfo: Module: universalSetAndDictionary InitialContents: FollowSlot\x7fVisibility: private'
        
         safety* = bootstrap stub -> 'traits' -> 'abstractSetOrDictionary' -> 'unsafeMixin' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'universalSet' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: universalSetAndDictionary InitialContents: FollowSlot\x7fVisibility: public'
        
         size = ( |
            | 
            representationTraits.size).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'universalSet' -> () From: ( | {
         'Category: iterating\x7fModuleInfo: Module: universalSetAndDictionary InitialContents: FollowSlot\x7fVisibility: private'
        
         unsafe_with: c1 Do: b FirstKey: firstK1 FirstValue: firstV1 = ( |
            | 
            representationTraits.unsafe_with: c1 Do: b FirstKey: firstK1 FirstValue: firstV1).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'universalSet' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: universalSetAndDictionary InitialContents: FollowSlot\x7fVisibility: private'
        
         valueForMarker = ( |
            | 
            marker).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'universalSetOrDictionary' -> () From: ( | {
         'ModuleInfo: Module: universalSetAndDictionary InitialContents: FollowSlot\x7fVisibility: private'
        
         comparisonTraits = ( |
            | 
            mySetOrDictionary comparisonTraits).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'universalSetOrDictionary' -> () From: ( | {
         'Category: copying\x7fModuleInfo: Module: universalSetAndDictionary InitialContents: FollowSlot\x7fVisibility: public'
        
         copyFor: aSetOrDictionary Marker: m = ( |
            | 
            ((clone mySetOrDictionary: aSetOrDictionary)
                               marker: m) initialize).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'universalSetOrDictionary' -> () From: ( | {
         'Category: fast accessing and adding\x7fComment: if collection contains k, 
invoke replacementValueBlock with arg old value
and replace contents at k with result of replacementValueBlock.
Then invoke presentActionBlock with arg new value.
If k is absent, add result of evaluating newValueBlock at key k 
(for dicts) and invoke absentActionBlock with new value.\x7fModuleInfo: Module: universalSetAndDictionary InitialContents: FollowSlot\x7fVisibility: private'
        
         if: k IsPresentAnd: doPresentPut Put: replacementValueBlock AndDo: presentActionBlock IfAbsentAnd: doAbsentPut Put: newValueBlock AndDo: absentActionBlock = ( |
            | 
            marker == k ifTrue: [
              ^ includesMarker
                  ifTrue: [
                     doPresentPut
                       ifTrue: [ | newValue |
                                 newValue:  replacementValueBlock value: valueForMarker With: marker.
                                 valueForMarker: newValue.
                                 presentActionBlock value: newValue       With: marker]
                        False: [ presentActionBlock value: valueForMarker With: marker] ]
                   False: [
                     doAbsentPut
                       ifTrue: [ absentActionBlock value: valueForMarker:  newValueBlock value: k ]
                        False: [ absentActionBlock value:                                       k ]]
            ].

            mySetOrDictionary if: k
                    IsPresentAnd: doPresentPut
                             Put: replacementValueBlock
                           AndDo: presentActionBlock
                     IfAbsentAnd: doAbsentPut
                             Put: newValueBlock
                           AndDo: absentActionBlock).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'universalSetOrDictionary' -> () From: ( | {
         'Category: copying\x7fModuleInfo: Module: universalSetAndDictionary InitialContents: FollowSlot\x7fVisibility: private'
        
         initialize = ( |
            | 
            includesMarker: false.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'universalSetOrDictionary' -> () From: ( | {
         'Category: removing\x7fComment: Remove an arbitrary element from the set or dictionary.
Return the removed element (not the key).\x7fModuleInfo: Module: universalSetAndDictionary InitialContents: FollowSlot\x7fVisibility: public'
        
         removeFirstIfAbsent: absentBlk = ( |
            | 
            includesMarker ifTrue: [^ removeValueForMarker].
            mySetOrDictionary removeFirstIfAbsent: absentBlk).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'universalSetOrDictionary' -> () From: ( | {
         'Category: removing\x7fModuleInfo: Module: universalSetAndDictionary InitialContents: FollowSlot\x7fVisibility: public'
        
         removeKey: k IfAbsent: b = ( |
            | 
            marker == k ifTrue: [^ includesMarker ifTrue: [removeValueForMarker] False: b].
            mySetOrDictionary removeKey: k IfAbsent: b).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'universalSetOrDictionary' -> () From: ( | {
         'Category: removing\x7fModuleInfo: Module: universalSetAndDictionary InitialContents: FollowSlot\x7fVisibility: private'
        
         removeValueForMarker = ( |
             oldValue.
            | 
            includesMarker ifFalse: [error: 'marker is not present'].
            oldValue: valueForMarker.
            valueForMarker: nil. "Necessary to avoid memory leaks."
            includesMarker: false.
            oldValue).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'universalSetOrDictionary' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: universalSetAndDictionary InitialContents: FollowSlot\x7fVisibility: public'
        
         size = ( |
            | 
            mySetOrDictionary size + includesMarker asInteger).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'universalSetOrDictionary' -> () From: ( | {
         'ModuleInfo: Module: universalSetAndDictionary InitialContents: FollowSlot\x7fVisibility: private'
        
         unitTests = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'universalSetOrDictionary' -> 'unitTests' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits universalSetOrDictionary unitTests.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'universalSetOrDictionary' -> 'unitTests' -> () From: ( | {
         'ModuleInfo: Module: universalSetAndDictionary InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'universalSetOrDictionary' -> 'unitTests' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits universalSetOrDictionary unitTests parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'universalSetOrDictionary' -> 'unitTests' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: universalSetAndDictionary InitialContents: FollowSlot\x7fVisibility: private'
        
         assert: b = ( |
            | 
            b value ifFalse: [error: 'assertion failure']).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'universalSetOrDictionary' -> 'unitTests' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: universalSetAndDictionary InitialContents: FollowSlot\x7fVisibility: private'
        
         assert: a Is: b = ( |
            | 
            "This method is just useful because you
             can click on a and b right in the debugger
             to see what the two values are."
            assert: [a = b]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'universalSetOrDictionary' -> 'unitTests' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: universalSetAndDictionary InitialContents: FollowSlot\x7fVisibility: private'
        
         pairsWhenIteratingOver: c1 InParallelWith: c2 = ( |
             pairs.
            | 
            pairs: list copyRemoveAll.
            c1 with: c2 Do: [|:v1. :v2. :k1. :k2|
              pairs add: (v1 @ v2) @ (k1 @ k2).
            ].
            pairs).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'universalSetOrDictionary' -> 'unitTests' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: universalSetAndDictionary InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'clonable' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'universalSetOrDictionary' -> 'unitTests' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: universalSetAndDictionary InitialContents: FollowSlot\x7fVisibility: public'
        
         run = ( |
            | 
            testAdding.
            testRemoving.
            testCopying.
            testIterating.
            testIteratingInParallel.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'universalSetOrDictionary' -> 'unitTests' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: universalSetAndDictionary InitialContents: FollowSlot\x7fVisibility: private'
        
         testAdding = ( |
             s.
            | 
            s: set copyRemoveAll asUniversal.
            assert: s size Is: 0.
            s add: 'aardvark'.
            assert: s size Is: 1.
            assert: s includes: 'aardvark'.
            s add: set emptyMarker.
            assert: s size Is: 2.
            assert: s includes: set emptyMarker.
            s add: set emptyMarker.
            assert: s size Is: 2.
            assert: s includes: set emptyMarker.
            s add: set removedMarker.
            assert: s size Is: 3.
            assert: s includes: set removedMarker.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'universalSetOrDictionary' -> 'unitTests' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: universalSetAndDictionary InitialContents: FollowSlot\x7fVisibility: private'
        
         testCopying = ( |
             s.
             s2.
            | 
            s: set copyRemoveAll asUniversal.
            s add: 'aardvark'.
            s add: set removedMarker.
            s2: s copy.
            assert: s2 = s.
            s  remove: set removedMarker.
            s2 remove: 'aardvark'.
            assert:  s  includes: 'aardvark'.
            assert: (s2 includes: 'aardvark') not.
            assert: (s  includes: set removedMarker) not.
            assert:  s2 includes: set removedMarker.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'universalSetOrDictionary' -> 'unitTests' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: universalSetAndDictionary InitialContents: FollowSlot\x7fVisibility: private'
        
         testIterating = ( |
             s.
            | 
            s: set copyRemoveAll asUniversal.
            s add: 'aardvark'.
            s add: set emptyMarker.
            s add: set removedMarker.
            assert: s asVector Is: (set removedMarker & set emptyMarker & 'aardvark') asVector.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'universalSetOrDictionary' -> 'unitTests' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: universalSetAndDictionary InitialContents: FollowSlot\x7fVisibility: private'
        
         testIteratingInParallel = ( |
             d.
             pairs.
             s.
             v.
            | 
            d: dictionary copyRemoveAll asUniversal.
            d at: 'aardvark'               Put: 'banana'.
            d at: dictionary   emptyMarker Put: 'kumquat'.
            d at: dictionary removedMarker Put: 'noodle'.
            v: (10 & 20 & 30 & 40 & 50) asVector.
            pairs: pairsWhenIteratingOver: d InParallelWith: v.
            assert: pairs Is: ( (('noodle'  @ 10) @ (dictionary removedMarker @ 0))
                              & (('kumquat' @ 20) @ (dictionary   emptyMarker @ 1))
                              & (('banana'  @ 30) @ ('aardvark'               @ 2))) asList.

            s: set copyRemoveAll asUniversal.
            s add: 333.
            s add: set removedMarker.
            s add: 444.
            pairs: pairsWhenIteratingOver: d InParallelWith: s.
            assert: pairs Is: ( (('noodle'  @ set removedMarker) @ (dictionary removedMarker @ set removedMarker))
                              & (('kumquat' @               444) @ (dictionary   emptyMarker @               444))
                              & (('banana'  @               333) @ ('aardvark'               @               333))) asList.

            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'universalSetOrDictionary' -> 'unitTests' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: universalSetAndDictionary InitialContents: FollowSlot\x7fVisibility: private'
        
         testRemoving = ( |
             s.
            | 
            s: set copyRemoveAll asUniversal.
            s add: 'aardvark'.
            s add: set removedMarker.
            assert: s size Is: 2.
            s remove: set removedMarker.
            assert: s size Is: 1.
            assert: (s includes: set removedMarker) not.
            s remove: 'aardvark'.
            assert: s size Is: 0.
            assert: (s includes: 'aardvark') not.

            s add: 'aardvark'.
            s add: set removedMarker.
            assert: s size Is: 2.
            assert: s removeFirst Is: set removedMarker.
            assert: s size Is: 1.
            assert: (s includes: set removedMarker) not.
            assert: s includes: 'aardvark'.
            assert: s removeFirst Is: 'aardvark'.
            assert: s size Is: 0.
            assert: (s includes: 'aardvark') not.

            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'universalSetOrDictionary' -> () From: ( | {
         'Category: copying\x7fModuleInfo: Module: universalSetAndDictionary InitialContents: FollowSlot\x7fVisibility: private'
        
         unsafe_copy = ( |
            | 
            clone mySetOrDictionary: mySetOrDictionary copy).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'universalSetOrDictionary' -> () From: ( | {
         'Category: sizing\x7fModuleInfo: Module: universalSetAndDictionary InitialContents: FollowSlot\x7fVisibility: private'
        
         unsafe_desiredMinCapacity: s = ( |
            | 
            mySetOrDictionary unsafe_desiredMinCapacity: s.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'universalSetOrDictionary' -> () From: ( | {
         'Category: iterating\x7fModuleInfo: Module: universalSetAndDictionary InitialContents: FollowSlot\x7fVisibility: private'
        
         unsafe_do: b = ( |
            | 
            includesMarker ifTrue: [b value: valueForMarker With: marker].
            mySetOrDictionary unsafe_do: b.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'universalSetOrDictionary' -> () From: ( | {
         'Category: removing\x7fModuleInfo: Module: universalSetAndDictionary InitialContents: FollowSlot\x7fVisibility: private'
        
         unsafe_removeAll = ( |
            | 
            mySetOrDictionary: mySetOrDictionary copyRemoveAll.
            initialize).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'universalSetOrDictionary' -> () From: ( | {
         'Category: iterating\x7fModuleInfo: Module: universalSetAndDictionary InitialContents: FollowSlot\x7fVisibility: private'
        
         unsafe_with: c Do: b = ( |
            | 
            includesMarker ifFalse: [^ mySetOrDictionary unsafe_with: c Do: b ].

            "Double-dispatch to enable faster implementation in the case where
             c is another universalSetOrDictionary (or some other collection
             with a linked-list kind of structure)."
            c unsafe_with: mySetOrDictionary Do: b FirstKey: marker FirstValue: valueForMarker).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'universalSetOrDictionary' -> () From: ( | {
         'Category: iterating\x7fModuleInfo: Module: universalSetAndDictionary InitialContents: FollowSlot\x7fVisibility: private'
        
         unsafe_with: c1 Do: b FirstKey: firstK1 FirstValue: firstV1 = ( |
            | 
            "Double-dispatch from another universalSetOrDictionary. Iterate in
             parallel over the other collection and this one, treating firstK1
             and firstV1 as the first key and value from the other collection.
             If we both include our marker, we can yield the two markers
             together, rather than fall back on the default implementation
             back in traits collection."

            includesMarker ifTrue: [
              b value: firstV1 With: valueForMarker With: firstK1 With: marker.
              c1 with: mySetOrDictionary Do: b.
            ] False: [
              mySetOrDictionary unsafe_with: c1 Do: b FirstKey: firstK1 FirstValue: firstV1.
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'universalSetOrDictionary' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: universalSetAndDictionary InitialContents: FollowSlot\x7fVisibility: private'
        
         valueForMarker: newValue = ( |
            | 
            includesMarker: true.
            newValue).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: collections\x7fCategory: unordered\x7fCategory: dictionaries\x7fModuleInfo: Module: universalSetAndDictionary InitialContents: FollowSlot\x7fVisibility: public'
        
         universalDictionary = bootstrap define: bootstrap stub -> 'globals' -> 'universalDictionary' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             bootstrap remove: 'prototype' From:
             globals universalSet copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'universalDictionary' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals universalDictionary.

CopyDowns:
globals universalSet. copy 
SlotsToOmit: parent prototype.

'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'universalDictionary' -> () From: ( | {
         'ModuleInfo: Module: universalSetAndDictionary InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         myValueForMarker.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: collections\x7fCategory: unordered\x7fCategory: can hold markers\x7fModuleInfo: Module: universalSetAndDictionary InitialContents: FollowSlot\x7fVisibility: public'
        
         universalDictionary = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'universalDictionary' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits universalDictionary.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'universalDictionary' -> () From: ( | {
         'ModuleInfo: Module: universalSetAndDictionary InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'universalDictionary' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'universalDictionary' -> () From: ( | {
         'ModuleInfo: Module: universalSetAndDictionary InitialContents: FollowSlot\x7fVisibility: private'
        
         prototype = ( |
            | 
            universalDictionary).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractDictionary' -> () From: ( | {
         'Category: universalSetAndDictionary\x7fModuleInfo: Module: universalSetAndDictionary InitialContents: FollowSlot\x7fVisibility: private'
        
         prototypeForUniversalSetOrDictionary = ( |
            | 
            universalDictionary).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSet' -> () From: ( | {
         'Category: transforming\x7fCategory: universalSetAndDictionary\x7fModuleInfo: Module: universalSetAndDictionary InitialContents: FollowSlot\x7fVisibility: private'
        
         prototypeForUniversalSetOrDictionary = ( |
            | 
            universalSet).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSetOrDictionary' -> () From: ( | {
         'Category: transforming\x7fCategory: universalSetAndDictionary\x7fModuleInfo: Module: universalSetAndDictionary InitialContents: FollowSlot\x7fVisibility: public'
        
         asUniversal = ( |
             c.
            | 
            c: self.
            invalidKeysDo: [|:k| c: c interposeHolderFor: k].
            c).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSetOrDictionary' -> () From: ( | {
         'Category: transforming\x7fCategory: universalSetAndDictionary\x7fModuleInfo: Module: universalSetAndDictionary InitialContents: FollowSlot\x7fVisibility: private'
        
         interposeHolderFor: marker = ( |
            | 
            prototypeForUniversalSetOrDictionary copyFor: self Marker: marker).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'collection' -> () From: ( | {
         'Category: double-dispatch from universalSetOrDictionary\x7fModuleInfo: Module: universalSetAndDictionary InitialContents: FollowSlot\x7fVisibility: private'
        
         unsafe_with: c1 Do: b FirstKey: firstK1 FirstValue: firstV1 = ( |
             firstPair.
             pairs.
            | 

            "Double-dispatch from a universalSetOrDictionary. Iterate in
             parallel over the other collection and this one, treating firstK1
             and firstV1 as the first key and value from the other collection."

            isEmpty ifTrue: [^ self].
            pairs: list copyRemoveAll.
            do: [|:v. :k| pairs add: v @ k].
            firstPair: pairs removeFirst.
            b value: firstV1 With: firstPair x With: firstK1 With: firstPair y.
            pairs with: c1 Do: [|:pair. :v1. :unused. :k1|
              b value: v1 With: pair x With: k1 With: pair y.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'universalDictionary' -> () From: ( | {
         'ModuleInfo: Module: universalSetAndDictionary InitialContents: FollowSlot\x7fVisibility: private'
        
         abstractTraits* = bootstrap stub -> 'traits' -> 'abstractDictionary' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'universalDictionary' -> () From: ( | {
         'Category: printing\x7fModuleInfo: Module: universalSetAndDictionary InitialContents: FollowSlot\x7fVisibility: public'
        
         collectionName = 'universalDictionary'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'universalDictionary' -> () From: ( | {
         'Category: copying\x7fModuleInfo: Module: universalSetAndDictionary InitialContents: FollowSlot\x7fVisibility: private'
        
         initialize = ( |
            | 
            resend.initialize.
            myValueForMarker: nil. "Necessary to avoid memory leaks."
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'universalDictionary' -> () From: ( | {
         'ModuleInfo: Module: universalSetAndDictionary InitialContents: FollowSlot\x7fVisibility: private'
        
         representationTraits* = bootstrap stub -> 'traits' -> 'universalSetOrDictionary' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'universalDictionary' -> () From: ( | {
         'ModuleInfo: Module: universalSetAndDictionary InitialContents: FollowSlot\x7fVisibility: private'
        
         safety* = bootstrap stub -> 'traits' -> 'abstractSetOrDictionary' -> 'unsafeMixin' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'universalDictionary' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: universalSetAndDictionary InitialContents: FollowSlot\x7fVisibility: public'
        
         size = ( |
            | 
            representationTraits.size).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'universalDictionary' -> () From: ( | {
         'Category: iterating\x7fModuleInfo: Module: universalSetAndDictionary InitialContents: FollowSlot\x7fVisibility: private'
        
         unsafe_with: c1 Do: b FirstKey: firstK1 FirstValue: firstV1 = ( |
            | 
            representationTraits.unsafe_with: c1 Do: b FirstKey: firstK1 FirstValue: firstV1).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'universalDictionary' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: universalSetAndDictionary InitialContents: FollowSlot\x7fVisibility: private'
        
         valueForMarker = ( |
            | 
            myValueForMarker).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'universalDictionary' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: universalSetAndDictionary InitialContents: FollowSlot\x7fVisibility: private'
        
         valueForMarker: newValue = ( |
            | 
                 myValueForMarker: newValue.
            resend.valueForMarker: newValue).
        } | ) 



 '-- Side effects'

 globals modules universalSetAndDictionary postFileIn
