 'Sun-$Revision: 30.19 $'
 '
Copyright 1992-2012 AUTHORS.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: collections\x7fCategory: unordered\x7fCategory: sets\x7fModuleInfo: Module: setAndDictionary InitialContents: FollowSlot\x7fVisibility: public'
        
         set = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'set' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals set.
\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'hashTableSetOrDictionary' -> () From: ( | {
         'Category: markers\x7fModuleInfo: Module: setAndDictionary InitialContents: FollowSlot\x7fVisibility: private'
        
         emptyMarker = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'hashTableSetOrDictionary' -> 'emptyMarker' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits hashTableSetOrDictionary emptyMarker.
\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'set' -> () From: ( | {
         'ModuleInfo: Module: setAndDictionary InitialContents: FollowSlot\x7fVisibility: private'
        
         emptyMarker = bootstrap stub -> 'traits' -> 'hashTableSetOrDictionary' -> 'emptyMarker' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'set' -> () From: ( | {
         'Comment: When size reaches this, we double # buckets.\x7fModuleInfo: Module: setAndDictionary InitialContents: FollowSlot\x7fVisibility: publicReadPrivateWrite'
        
         highMark <- 3.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'set' -> () From: ( | {
         'Comment: When size reaches this, we halve # buckets.\x7fModuleInfo: Module: setAndDictionary InitialContents: FollowSlot\x7fVisibility: publicReadPrivateWrite'
        
         lowMark <- 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'set' -> () From: ( | {
         'Comment: Never shrink below this number of buckets.\x7fModuleInfo: Module: setAndDictionary InitialContents: FollowSlot\x7fVisibility: private'
        
         minBuckets <- 4.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'set' -> () From: ( | {
         'ModuleInfo: Module: setAndDictionary InitialContents: InitializeToExpression: ( vector _Clone: 4 Filler: bootstrap stub -> \'globals\'-> \'set\' -> \'emptyMarker\' -> () )\x7fVisibility: private'
        
         myKeys <-  vector _Clone: 4 Filler: bootstrap stub -> 'globals'-> 'set' -> 'emptyMarker' -> () .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: collections\x7fCategory: unordered\x7fCategory: hash table based\x7fModuleInfo: Module: setAndDictionary InitialContents: FollowSlot\x7fVisibility: public'
        
         set = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'set' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits set.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'set' -> () From: ( | {
         'ModuleInfo: Module: setAndDictionary InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'set' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'set' -> () From: ( | {
         'ModuleInfo: Module: setAndDictionary InitialContents: FollowSlot\x7fVisibility: private'
        
         prototype = ( |
            | 
            set).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'hashTableSetOrDictionary' -> () From: ( | {
         'Category: markers\x7fModuleInfo: Module: setAndDictionary InitialContents: FollowSlot\x7fVisibility: private'
        
         removedMarker = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'hashTableSetOrDictionary' -> 'removedMarker' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits hashTableSetOrDictionary removedMarker.
\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'set' -> () From: ( | {
         'ModuleInfo: Module: setAndDictionary InitialContents: FollowSlot\x7fVisibility: private'
        
         removedMarker = bootstrap stub -> 'traits' -> 'hashTableSetOrDictionary' -> 'removedMarker' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSetOrDictionary' -> () From: ( | {
         'Category: safety mixins\x7fModuleInfo: Module: setAndDictionary InitialContents: FollowSlot\x7fVisibility: private'
        
         unsafeMixin = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'abstractSetOrDictionary' -> 'unsafeMixin' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits abstractSetOrDictionary unsafeMixin.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'set' -> () From: ( | {
         'ModuleInfo: Module: setAndDictionary InitialContents: FollowSlot\x7fVisibility: private'
        
         safety* = bootstrap stub -> 'traits' -> 'abstractSetOrDictionary' -> 'unsafeMixin' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'set' -> () From: ( | {
         'ModuleInfo: Module: setAndDictionary InitialContents: FollowSlot\x7fVisibility: publicReadPrivateWrite'
        
         size <- 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: collections\x7fCategory: unordered\x7fCategory: abstract\x7fComment: representation-indep
set\x7fModuleInfo: Module: setAndDictionary InitialContents: FollowSlot\x7fVisibility: public'
        
         abstractSet = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'abstractSet' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits abstractSet.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSet' -> () From: ( | {
         'Category: comparing\x7fModuleInfo: Module: setAndDictionary InitialContents: FollowSlot\x7fVisibility: public'
        
         = x = ( |
            | x equalsSet: self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSet' -> () From: ( | {
         'Category: adding\x7fModuleInfo: Module: setAndDictionary InitialContents: FollowSlot\x7fVisibility: public'
        
         add: k = ( |
            | at: k Put: k).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSet' -> () From: ( | {
         'Category: adding\x7fModuleInfo: Module: setAndDictionary InitialContents: FollowSlot\x7fVisibility: public'
        
         add: v WithKey: k = ( |
            | add: v).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSet' -> () From: ( | {
         'Category: adding\x7fModuleInfo: Module: setAndDictionary InitialContents: FollowSlot\x7fVisibility: public'
        
         addAll: c = ( |
            | c do: [ | :v | add: v ]. self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSet' -> () From: ( | {
         'Category: comparing\x7fModuleInfo: Module: setAndDictionary InitialContents: FollowSlot\x7fVisibility: private'
        
         equalsSet: s = ( |
            | sync: [unsafe_equalsSet: s]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSet' -> () From: ( | {
         'Category: fast accessing and adding\x7fComment: If v is absent, add v to the set, and invoke absentActionBlock with v.
-- Adam, 6/05\x7fModuleInfo: Module: setAndDictionary InitialContents: FollowSlot\x7fVisibility: public'
        
         if: v IsAbsentAddAndDo: absentActionBlock = ( |
            | 
            if: v IsPresentDo: [] IfAbsentAddAndDo: absentActionBlock).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSet' -> () From: ( | {
         'Category: fast accessing and adding\x7fComment: If this set contains v, invoke presentActionBlock with v.
If v is absent, add v to the set, and invoke absentActionBlock with v.
-- Adam, 6/05\x7fModuleInfo: Module: setAndDictionary InitialContents: FollowSlot\x7fVisibility: public'
        
         if: v IsPresentDo: presentActionBlock IfAbsentAddAndDo: absentActionBlock = ( |
            | 
                     if: v
            IsPresentDo: presentActionBlock
            IfAbsentPut: [v]
                  AndDo: absentActionBlock).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSet' -> () From: ( | {
         'Category: transforming\x7fModuleInfo: Module: setAndDictionary InitialContents: FollowSlot\x7fVisibility: public'
        
         mapBy: eb = ( | {
                 'ModuleInfo: Module: setAndDictionary InitialContents: FollowSlot'
                
                 c.
                } 
            | c: copy. removeAll. c mapBy: eb Into: self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSet' -> () From: ( | {
         'Category: searching\x7fModuleInfo: Module: setAndDictionary InitialContents: FollowSlot\x7fVisibility: public'
        
         occurrencesOf: v = ( |
            | (includesKey: v) ifTrue: 1 False: 0).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: collections\x7fCategory: unordered\x7fCategory: abstract\x7fComment: implementation-independant
set or dictionary behavior -- dmu 2/97\x7fModuleInfo: Module: setAndDictionary InitialContents: FollowSlot\x7fVisibility: public'
        
         abstractSetOrDictionary = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'abstractSetOrDictionary' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits abstractSetOrDictionary.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSet' -> () From: ( | {
         'ModuleInfo: Module: setAndDictionary InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'abstractSetOrDictionary' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSet' -> () From: ( | {
         'Category: printing\x7fModuleInfo: Module: setAndDictionary InitialContents: FollowSlot\x7fVisibility: public'
        
         storeStringIfFail: fb = ( |
            | 
            "Sort the elements for preserving the storestring fixpoint"
            unkeyedStoreStringIfFail: fb).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSet' -> () From: ( | {
         'Category: comparing\x7fModuleInfo: Module: setAndDictionary InitialContents: FollowSlot\x7fVisibility: private'
        
         unsafe_equalsSet: s = ( |
            | 
            == s ifTrue: [^true].   "optimization"
            size = s size ifFalse: [^false].
            do: [|:v| (s includes: v) ifFalse: [^false]].
            true).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSet' -> () From: ( | {
         'Category: removing\x7fModuleInfo: Module: setAndDictionary InitialContents: FollowSlot\x7fVisibility: private'
        
         unsafe_remove: v IfAbsent: ab = ( |
            | removeKey: v IfAbsent: ab).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSet' -> () From: ( | {
         'Category: dictionary place holders\x7fModuleInfo: Module: setAndDictionary InitialContents: FollowSlot\x7fVisibility: private'
        
         values = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'abstractSet' -> 'values' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits abstractSet values.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSet' -> 'values' -> () From: ( | {
         'ModuleInfo: Module: setAndDictionary InitialContents: FollowSlot'
        
         at: i Put: v = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSet' -> 'values' -> () From: ( | {
         'ModuleInfo: Module: setAndDictionary InitialContents: FollowSlot'
        
         copy = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSet' -> 'values' -> () From: ( | {
         'ModuleInfo: Module: setAndDictionary InitialContents: FollowSlot'
        
         copySize: n = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSet' -> () From: ( | {
         'Category: dictionary place holders\x7fModuleInfo: Module: setAndDictionary InitialContents: FollowSlot\x7fVisibility: private'
        
         values: v = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSetOrDictionary' -> () From: ( | {
         'Category: comparing\x7fModuleInfo: Module: setAndDictionary InitialContents: FollowSlot\x7fVisibility: public'
        
         < x = ( |
            | error: 'sets and dictionaries are unordered').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSetOrDictionary' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: setAndDictionary InitialContents: FollowSlot\x7fVisibility: public'
        
         at: k IfAbsent: b = ( |
            | 
            if: k
            IsPresentDo: [|:v| v]
            IfAbsentDo: [b value: k]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSetOrDictionary' -> () From: ( | {
         'Category: fast accessing and adding\x7fComment: If the specified key is present, return the value associated with it.
If it is absent, add the result of the specified block and return it.
-- aaa, 2/18/04\x7fModuleInfo: Module: setAndDictionary InitialContents: FollowSlot\x7fVisibility: public'
        
         at: k IfAbsentPut: blk = ( |
            | 
                     if: k
            IsPresentDo: [|:v| v]
            IfAbsentPut: blk
                  AndDo: [|:v| v]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSetOrDictionary' -> () From: ( | {
         'Category: adding\x7fModuleInfo: Module: setAndDictionary InitialContents: FollowSlot\x7fVisibility: public'
        
         at: k Put: v = ( |
            | 
            if: k IsPresentPut: [v] AndDo: [self]
                  IfAbsentPut:  [v] AndDo: [self]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSetOrDictionary' -> () From: ( | {
         'Category: sizing\x7fModuleInfo: Module: setAndDictionary InitialContents: FollowSlot\x7fVisibility: private'
        
         checkHash = ( |
            | 
            " check hashes; crude approximation"
            do: [| :v. :k. |
                (
                  if: k
                  IsPresentDo: [|:vv | v == vv]
                  IfAbsentDo: false
                ) ifFalse: [error: 'hash changed'].
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSetOrDictionary' -> () From: ( | {
         'Category: copying\x7fModuleInfo: Module: setAndDictionary InitialContents: FollowSlot\x7fVisibility: private'
        
         clone = ( |
            | 
            resend.clone resetLock).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSetOrDictionary' -> () From: ( | {
         'Category: copying\x7fModuleInfo: Module: setAndDictionary InitialContents: FollowSlot\x7fVisibility: public'
        
         copy = ( |
            | sync: [unsafe_copy]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSetOrDictionary' -> () From: ( | {
         'Category: copying\x7fModuleInfo: Module: setAndDictionary InitialContents: FollowSlot\x7fVisibility: public'
        
         copyContaining: c = ( |
            | 
            "override to optimize"
            (copyRemoveAll desiredMinCapacity: c size) addAll: c).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSetOrDictionary' -> () From: ( | {
         'Category: copying\x7fModuleInfo: Module: setAndDictionary InitialContents: FollowSlot\x7fVisibility: public'
        
         copyRemoveAll = ( |
            | clone removeAll).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSetOrDictionary' -> () From: ( | {
         'Category: not sorting\x7fModuleInfo: Module: setAndDictionary InitialContents: FollowSlot\x7fVisibility: public'
        
         copySortBy: x = ( |
            | error: 'cannot sort, try asVector sortBy:').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSetOrDictionary' -> () From: ( | {
         'Category: sizing\x7fModuleInfo: Module: setAndDictionary InitialContents: FollowSlot\x7fVisibility: public'
        
         desiredMinCapacity: s = ( |
            | sync: [unsafe_desiredMinCapacity: s]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSetOrDictionary' -> () From: ( | {
         'Category: iterating\x7fModuleInfo: Module: setAndDictionary InitialContents: FollowSlot\x7fVisibility: public'
        
         do: b = ( |
            | sync: [unsafe_do: b]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSetOrDictionary' -> () From: ( | {
         'Category: comparison mixins\x7fModuleInfo: Module: setAndDictionary InitialContents: FollowSlot\x7fVisibility: private'
        
         equalityComparisonMixin = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'abstractSetOrDictionary' -> 'equalityComparisonMixin' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits abstractSetOrDictionary equalityComparisonMixin.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSetOrDictionary' -> 'equalityComparisonMixin' -> () From: ( | {
         'ModuleInfo: Module: setAndDictionary InitialContents: FollowSlot\x7fVisibility: public'
        
         hashElement: e = ( |
            | e hash).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSetOrDictionary' -> 'equalityComparisonMixin' -> () From: ( | {
         'ModuleInfo: Module: setAndDictionary InitialContents: FollowSlot\x7fVisibility: public'
        
         is: e1 EqualTo: e2 = ( |
            | e1 = e2).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSetOrDictionary' -> () From: ( | {
         'Category: fast accessing and adding\x7fModuleInfo: Module: setAndDictionary InitialContents: FollowSlot\x7fVisibility: public'
        
         if: k IsPresentDo: blk = ( |
            | if: k IsPresentDo: blk IfAbsentDo: []).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSetOrDictionary' -> () From: ( | {
         'Category: fast accessing and adding\x7fModuleInfo: Module: setAndDictionary InitialContents: FollowSlot\x7fVisibility: public'
        
         if: k IsPresentDo: presentActionBlock IfAbsentDo: absentActionBlock = ( |
            | 
                      if: k
            IsPresentAnd: false
                     Put: [error: 'should not be called']
                   AndDo: presentActionBlock
             IfAbsentAnd: false
                     Put: [error: 'should not be called']
                   AndDo: absentActionBlock).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSetOrDictionary' -> () From: ( | {
         'Category: fast accessing and adding\x7fComment: If collection contains k invoke presentActionBlock with value at k.
If k is absent, add result of evaluating newValueBlock on k,
at key k (for dicts) and invoke absentActionBlock with new value.\x7fModuleInfo: Module: setAndDictionary InitialContents: FollowSlot\x7fVisibility: public'
        
         if: k IsPresentDo: presentActionBlock IfAbsentPut: newValueBlock AndDo: absentActionBlock = ( |
            | 
                      if: k
            IsPresentAnd: false
                     Put: [error: 'should not be called']
                   AndDo: presentActionBlock
             IfAbsentAnd: true
                     Put: newValueBlock
                   AndDo: absentActionBlock).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSetOrDictionary' -> () From: ( | {
         'Category: fast accessing and adding\x7fComment: if collection contains k, invoke replacementValueBlock with arg 
old value and replace contents at k with result of replacementValueBlock.
Then invoke presentActionBlock with arg new value.
If k is absent, invoke absentActionBlock with k.\x7fModuleInfo: Module: setAndDictionary InitialContents: FollowSlot\x7fVisibility: public'
        
         if: k IsPresentPut: replacementValueBlock AndDo: presentActionBlock IfAbsentDo: absentActionBlock = ( |
            | 
                      if: k
            IsPresentAnd: true
                     Put: replacementValueBlock
                   AndDo: presentActionBlock
             IfAbsentAnd: false
                     Put: [error: 'should not be called']
                   AndDo: absentActionBlock).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSetOrDictionary' -> () From: ( | {
         'Category: fast accessing and adding\x7fComment: if collection contains k, 
invoke replacementValueBlock with arg old value
and replace contents at k with result of replacementValueBlock.
Then invoke presentActionBlock with arg new value.
If k is absent, add result of evaluating newValueBlock at key k 
(for dicts) and invoke absentActionBlock with new value.\x7fModuleInfo: Module: setAndDictionary InitialContents: FollowSlot\x7fVisibility: public'
        
         if: k IsPresentPut: replacementValueBlock AndDo: presentActionBlock IfAbsentPut: newValueBlock AndDo: absentActionBlock = ( |
            | 
                      if: k
            IsPresentAnd: true
                     Put: replacementValueBlock
                   AndDo: presentActionBlock
             IfAbsentAnd: true
                     Put: newValueBlock
                   AndDo: absentActionBlock).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSetOrDictionary' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: setAndDictionary InitialContents: FollowSlot\x7fVisibility: public'
        
         includesKey: k = ( |
            | if: k IsPresentDo: true IfAbsentDo: false).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSetOrDictionary' -> () From: ( | {
         'Category: objects that cannot be keys\x7fModuleInfo: Module: setAndDictionary InitialContents: FollowSlot\x7fVisibility: private'
        
         invalidKeysDo: b = ( |
            | 
            "Override in children (such as hash-table-based sets
             or dictionaries) that cannot hold particular objects
             (like the emptyMarker or removedMarker)."
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSetOrDictionary' -> () From: ( | {
         'Category: testing\x7fModuleInfo: Module: setAndDictionary InitialContents: FollowSlot\x7fVisibility: public'
        
         isOrdered = bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSetOrDictionary' -> () From: ( | {
         'ModuleInfo: Module: setAndDictionary InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'collection' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSetOrDictionary' -> () From: ( | {
         'Category: removing\x7fModuleInfo: Module: setAndDictionary InitialContents: FollowSlot\x7fVisibility: public'
        
         remove: v IfAbsent: fb = ( |
            | sync: [ unsafe_remove: v IfAbsent: fb ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSetOrDictionary' -> () From: ( | {
         'Category: removing\x7fModuleInfo: Module: setAndDictionary InitialContents: FollowSlot\x7fVisibility: public'
        
         removeAll = ( |
            | sync: [unsafe_removeAll]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSetOrDictionary' -> () From: ( | {
         'Category: removing\x7fModuleInfo: Module: setAndDictionary InitialContents: FollowSlot\x7fVisibility: public'
        
         removeFirst = ( |
            | removeFirstIfAbsent: raiseError).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSetOrDictionary' -> () From: ( | {
         'Category: removing\x7fModuleInfo: Module: setAndDictionary InitialContents: FollowSlot\x7fVisibility: public'
        
         removeKey: k = ( |
            | removeKey: k
            IfAbsent: [error: k printString, ' is absent']).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSetOrDictionary' -> () From: ( | {
         'Category: safety mixins\x7fModuleInfo: Module: setAndDictionary InitialContents: FollowSlot\x7fVisibility: private'
        
         safeMixin = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'abstractSetOrDictionary' -> 'safeMixin' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits abstractSetOrDictionary safeMixin.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSetOrDictionary' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: setAndDictionary InitialContents: FollowSlot\x7fVisibility: public'
        
         selectAtRandom: howMany = ( |
            | 
            selectAtRandom: howMany IfFail: [|:e| error: e]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSetOrDictionary' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: setAndDictionary InitialContents: FollowSlot\x7fVisibility: public'
        
         selectAtRandom: howMany IfFail: fb = ( |
             r.
             x.
            | 
            size < howMany ifTrue: [^ fb value: 'not enough elements'].
            x: copy.
            r: copyRemoveAll.
            howMany do: [|ks. i. k|
              ks: x keys asVector.
              i: random integer: ks size.
              k: keys at: i.
              r add: (x at: k) WithKey: k.
              x remove: k.
            ].
            r).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSetOrDictionary' -> 'unsafeMixin' -> () From: ( | {
         'ModuleInfo: Module: setAndDictionary InitialContents: FollowSlot\x7fVisibility: public'
        
         resetLock = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSetOrDictionary' -> 'unsafeMixin' -> () From: ( | {
         'ModuleInfo: Module: setAndDictionary InitialContents: FollowSlot\x7fVisibility: private'
        
         sync: b = ( |
            | b value).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSetOrDictionary' -> () From: ( | {
         'Category: iterating\x7fModuleInfo: Module: setAndDictionary InitialContents: FollowSlot\x7fVisibility: public'
        
         with: c Do: b = ( |
            | sync: [ unsafe_with: c Do: b ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: collections\x7fCategory: unordered\x7fCategory: hash table based\x7fComment: representation-indep
set\x7fModuleInfo: Module: setAndDictionary InitialContents: FollowSlot\x7fVisibility: public'
        
         hashTableSet = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'hashTableSet' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits hashTableSet.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'hashTableSet' -> () From: ( | {
         'ModuleInfo: Module: setAndDictionary InitialContents: FollowSlot\x7fVisibility: private'
        
         abstractTraits* = bootstrap stub -> 'traits' -> 'abstractSet' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'hashTableSet' -> () From: ( | {
         'Category: fast accessing and adding\x7fModuleInfo: Module: setAndDictionary InitialContents: FollowSlot\x7fVisibility: private'
        
         at: i ReplaceKey: k Value: v = ( |
            | 
            myKeys   at: i Put: k.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'hashTableSet' -> () From: ( | {
         'Category: testing\x7fModuleInfo: Module: setAndDictionary InitialContents: FollowSlot\x7fVisibility: public'
        
         includes: v = ( |
            | 
            includesKey: v).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'hashTableSet' -> () From: ( | {
         'Category: testing\x7fModuleInfo: Module: setAndDictionary InitialContents: FollowSlot\x7fVisibility: public'
        
         includesKey: k = ( |
            | 
            representationTraits.includesKey: k).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'hashTableSet' -> () From: ( | {
         'Category: markers\x7fModuleInfo: Module: setAndDictionary InitialContents: FollowSlot\x7fVisibility: private'
        
         invalidKeysDo: b = ( |
            | 
            representationTraits.invalidKeysDo: b).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'hashTableSet' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: setAndDictionary InitialContents: FollowSlot\x7fVisibility: private'
        
         key: k OrValueAt: i = ( |
            | k).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'hashTableSet' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: setAndDictionary InitialContents: FollowSlot\x7fVisibility: private'
        
         keyAtOrValueAt: i = ( |
            | myKeys at: i).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: collections\x7fCategory: unordered\x7fCategory: hash table based\x7fComment: set or dictionary behavior
implemented by a hash table
-- dmu 2/97\x7fModuleInfo: Module: setAndDictionary InitialContents: FollowSlot\x7fVisibility: public'
        
         hashTableSetOrDictionary = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'hashTableSetOrDictionary' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits hashTableSetOrDictionary.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'hashTableSet' -> () From: ( | {
         'ModuleInfo: Module: setAndDictionary InitialContents: FollowSlot\x7fVisibility: private'
        
         representationTraits* = bootstrap stub -> 'traits' -> 'hashTableSetOrDictionary' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'hashTableSet' -> () From: ( | {
         'Category: fast accessing and adding\x7fModuleInfo: Module: setAndDictionary InitialContents: FollowSlot\x7fVisibility: private'
        
         usingHashForOldKeyIfPossible: i AddKey: k Value: v = ( |
            | 
            (comparisonTraits is: k EqualTo: v) 
              ifTrue: [resend.usingHashForOldKeyIfPossible: i AddKey: k Value: v]
               False: [add: v]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'hashTableSet' -> () From: ( | {
         'Category: fast accessing and adding\x7fModuleInfo: Module: setAndDictionary InitialContents: FollowSlot\x7fVisibility: private'
        
         usingHashForOldKeyIfPossible: i ReplaceKey: k Value: v = ( |
            | 
            (comparisonTraits is: k EqualTo: v)
                  ifTrue: [resend.usingHashForOldKeyIfPossible: i ReplaceKey: k Value: v]
                   False: [remove: k.
                              add: v]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'hashTableSetOrDictionary' -> () From: ( | {
         'Category: sizing\x7fModuleInfo: Module: setAndDictionary InitialContents: FollowSlot\x7fVisibility: private'
        
         buckets = ( |
            | myKeys size).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'hashTableSetOrDictionary' -> () From: ( | {
         'Category: sizing\x7fComment: There are two notions of size associated with hash tables:
 1. The number of buckets. This is a strictly internal
    measure. It is not part of the exported interface.
 2. The capacity, which is the number of elements that 
    can be put in the hash table before a growing rehash 
    is forced. The capacity concept is exported through
    the public messages   \"capacity\" and \"desiredMinCapacity:\".
The relationship between capacity and buckets is:
    capacity = ((buckets * growLimit) / 100).
This value is also cached as \"highMark\" for efficiency reasons.
A further invariant is that \"buckets\" must be a power of 2
(for efficiency, so that we can use \"&&\" instead of \"%\" in
the \"hash:\" method). Max size without rehash happening.\x7fModuleInfo: Module: setAndDictionary InitialContents: FollowSlot\x7fVisibility: public'
        
         capacity = ( |
            | highMark - 1).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'hashTableSetOrDictionary' -> () From: ( | {
         'ModuleInfo: Module: setAndDictionary InitialContents: FollowSlot\x7fVisibility: private'
        
         comparisonTraits = bootstrap stub -> 'traits' -> 'abstractSetOrDictionary' -> 'equalityComparisonMixin' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'hashTableSetOrDictionary' -> () From: ( | {
         'Category: sizing\x7fModuleInfo: Module: setAndDictionary InitialContents: FollowSlot\x7fVisibility: private'
        
         decSize = ( |
            | 
            size: size - 1.
            size <= lowMark ifTrue: [resizeTo: buckets/2 max: minBuckets].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'hashTableSetOrDictionary' -> 'emptyMarker' -> () From: ( | {
         'ModuleInfo: Module: setAndDictionary InitialContents: FollowSlot\x7fVisibility: private'
        
         p* = bootstrap stub -> 'traits' -> 'oddball' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'hashTableSetOrDictionary' -> () From: ( | {
         'Category: fast accessing and adding\x7fModuleInfo: Module: setAndDictionary InitialContents: FollowSlot\x7fVisibility: private'
        
         getValue: valueBlock Arg1: x Arg2: k = ( |
             newV.
             oldSize.
            | 
            oldSize: size. "cheap check for valueBlock perturbing me"
            newV: valueBlock value: x With: k.
            size = oldSize ifFalse: [
                    error: 
                             'Cannot use if:... message when
                              a Put: block alters receiver; in this case size was ',
                              oldSize printString, ' before block and is ',
                              size printString, ' after.  Offending block is: ',
                              valueBlock printString.
            ].
            newV).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'hashTableSetOrDictionary' -> () From: ( | {
         'Category: sizing\x7fComment: The following numbers are performance critical. They determine 
the space utilization. E.g. a growing hash table will on average
be 3*growLimit/4 percent full, whereas a shrinking hash table will
be 3*shrinkLimit/2 percent full. Also, growLimit determines worst 
case expected performance, when inserting into a hash table that
is \"almost at the rehash limit\". Specifically,
    1/(1.0 - growLimit/100.0) 
probes are expected before an empty bucket is found. 
When this many percent full, double capacity.\x7fModuleInfo: Module: setAndDictionary InitialContents: FollowSlot\x7fVisibility: private'
        
         growLimit = 85.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'hashTableSetOrDictionary' -> () From: ( | {
         'Category: hashing\x7fComment: Because we use && here, the number of buckets
in a hash table must be a power of 2.\x7fModuleInfo: Module: setAndDictionary InitialContents: FollowSlot\x7fVisibility: private'
        
         hash: x = ( |
            | 
            buckets predecessor && (comparisonTraits hashElement: x)).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'hashTableSetOrDictionary' -> () From: ( | {
         'Category: fast accessing and adding\x7fComment: if collection contains k, 
invoke replacementValueBlock with arg old value
and replace contents at k with result of replacementValueBlock.
Then invoke presentActionBlock with arg new value.
If k is absent, add result of evaluating newValueBlock at key k 
(for dicts) and invoke absentActionBlock with new value.\x7fModuleInfo: Module: setAndDictionary InitialContents: FollowSlot\x7fVisibility: private'
        
         if: k IsPresentAnd: doPresentPut Put: replacementValueBlock AndDo: presentActionBlock IfAbsentAnd: doAbsentPut Put: newValueBlock AndDo: absentActionBlock = ( |
            | 
            indexOf: k IfPresent:  [|:i. :oldKey| 
              doPresentPut ifTrue: [|newValue|
                newValue: getValue: replacementValueBlock Arg1: (keyAtOrValueAt: i) Arg2: k.
                usingHashForOldKeyIfPossible: i ReplaceKey: k Value: newValue.
                presentActionBlock value: newValue With: k.
              ] False: [
                presentActionBlock value: (keyAtOrValueAt: i) With: oldKey.
              ].
            ] IfAbsent: [|:i|
              doAbsentPut ifTrue: [|newValue|
                newValue: getValue: newValueBlock Arg1: k Arg2: nil.
                usingHashForOldKeyIfPossible: i AddKey: k Value: newValue.
                absentActionBlock value: newValue With: k.
              ] False: [
                absentActionBlock value: k.
              ].
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'hashTableSetOrDictionary' -> () From: ( | {
         'Category: sizing\x7fModuleInfo: Module: setAndDictionary InitialContents: FollowSlot\x7fVisibility: private'
        
         incSize = ( |
            | 
            size: size + 1.
            size >= highMark ifTrue: [resizeTo: 2*buckets].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'hashTableSetOrDictionary' -> () From: ( | {
         'Category: testing\x7fModuleInfo: Module: setAndDictionary InitialContents: FollowSlot\x7fVisibility: public'
        
         includesKey: k = ( |
            | 
            indexOf: k IfPresent: true IfAbsent: false).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'hashTableSetOrDictionary' -> () From: ( | {
         'Category: hashing\x7fComment: Invokes the appropriate block with the index of the key.
Try to get rid of removed markers.
Return the value of the block.
Optimized with Ole\'s suggestion to have two loops -- Dave 9/92
Optimized to use array index checking for detecting when
to wrap around -- Ole Agesen, 3/93.\x7fModuleInfo: Module: setAndDictionary InitialContents: FollowSlot\x7fVisibility: private'
        
         indexOf: key IfPresent: pb IfAbsent: ab = ( |
            | 
            sync: [ unsafe_indexOf: key IfPresent: pb IfAbsent: ab ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'hashTableSetOrDictionary' -> () From: ( | {
         'Category: hashing\x7fModuleInfo: Module: setAndDictionary InitialContents: FollowSlot\x7fVisibility: private'
        
         indexOf: key IfPresent: pb IfAbsent: ab FirstRM: firstRM = ( |
             firstWrap <- bootstrap stub -> 'globals' -> 'true' -> ().
             i <- 0.
            | 
            i: firstRM + 1.
            [|k|
                k: (myKeys at: i IfAbsent: [
                    firstWrap ifTrue: [firstWrap: false. i: 0. myKeys at: 0] 
                               False: [^ ab value: firstRM].
                ]).
                emptyMarker    = k  ifTrue: [^ ab value: firstRM].
                       (removedMarker = k) not  
                 &&  [ comparisonTraits is: key EqualTo: k]  ifTrue: [
                    at: firstRM ReplaceKey: k             Value: (key: k OrValueAt: i).
                    at: i       ReplaceKey: removedMarker Value:  nil.
                  ^ pb value: firstRM With: k.
                ].
                i: i + 1.
            ] loop).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'hashTableSetOrDictionary' -> () From: ( | {
         'Category: markers\x7fModuleInfo: Module: setAndDictionary InitialContents: FollowSlot\x7fVisibility: private'
        
         invalidKeysDo: b = ( |
            | 
            b value: emptyMarker.
            b value: removedMarker.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'hashTableSetOrDictionary' -> () From: ( | {
         'Category: removing\x7fModuleInfo: Module: setAndDictionary InitialContents: FollowSlot\x7fVisibility: private'
        
         removeAllBuckets: newBuckets = ( |
            | 
            myKeys:     vector copySize: newBuckets FillingWith: emptyMarker.
            values:     vector copySize: newBuckets.
            "Cache the two marks to save time on critical paths (add,remove)."
            lowMark:  (buckets * shrinkLimit) / 100.
            highMark: (buckets *   growLimit) / 100.
            size: 0.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'hashTableSetOrDictionary' -> () From: ( | {
         'Category: removing\x7fComment: Remove an arbitrary element from the set or dictionary.
Return the removed element (not the key).\x7fModuleInfo: Module: setAndDictionary InitialContents: FollowSlot\x7fVisibility: public'
        
         removeFirstIfAbsent: absentBlk = ( |
            | 
            myKeys do: [|:k. :i|
                (emptyMarker != k) && [removedMarker != k] ifTrue: [|v|
                    v: (keyAtOrValueAt: i).
                    myKeys at: i Put: removedMarker.
                    values at: i Put: nil.
                    decSize.
                    ^ v.
                ].
            ].
            absentBlk value: 'no element to remove').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'hashTableSetOrDictionary' -> () From: ( | {
         'Category: removing\x7fModuleInfo: Module: setAndDictionary InitialContents: FollowSlot\x7fVisibility: public'
        
         removeKey: k IfAbsent: b = ( |
            | 
            indexOf: k IfPresent: [ |:i|
                myKeys   at: i Put: removedMarker.
                values   at: i Put: nil.
                decSize.
            ] IfAbsent: b).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'hashTableSetOrDictionary' -> 'removedMarker' -> () From: ( | {
         'ModuleInfo: Module: setAndDictionary InitialContents: FollowSlot\x7fVisibility: private'
        
         p* = bootstrap stub -> 'traits' -> 'oddball' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'hashTableSetOrDictionary' -> () From: ( | {
         'Category: sizing\x7fModuleInfo: Module: setAndDictionary InitialContents: FollowSlot\x7fVisibility: private'
        
         resizeTo: newBuckets = ( | {
                 'ModuleInfo: Module: setAndDictionary InitialContents: FollowSlot'
                
                 oldSize <- 0.
                }  {
                 'ModuleInfo: Module: setAndDictionary InitialContents: FollowSlot'
                
                 s.
                } 
            | 
            newBuckets = buckets ifTrue: [^ self].
            oldSize: size.
            s: clone.
            removeAllBuckets: newBuckets.
            addAll: s.
            "The following test guards against inconsistent hash tables
             in which the keys have mutated. The test is not 100% reliable,
             but it is a cheap test, compared to the cost of rehashing,
             so we may as well do it."
            oldSize != size ifTrue: [
                s checkHash.
                error: 'size error after rehashing - mutating keys?',
                       ' (old size=', oldSize printString,
                       ', new size=', size    printString, ')'.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'hashTableSetOrDictionary' -> () From: ( | {
         'Category: sizing\x7fComment: When this many percent full, halve capacity.
See commment in growLimit.\x7fModuleInfo: Module: setAndDictionary InitialContents: FollowSlot\x7fVisibility: private'
        
         shrinkLimit = 20.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'hashTableSetOrDictionary' -> () From: ( | {
         'Category: copying\x7fModuleInfo: Module: setAndDictionary InitialContents: FollowSlot\x7fVisibility: private'
        
         unsafe_copy = ( |
            | 
            (clone myKeys: myKeys copy) values: values copy).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'hashTableSetOrDictionary' -> () From: ( | {
         'Category: sizing\x7fModuleInfo: Module: setAndDictionary InitialContents: FollowSlot\x7fVisibility: private'
        
         unsafe_desiredMinCapacity: s = ( | {
                 'ModuleInfo: Module: setAndDictionary InitialContents: FollowSlot'
                
                 r <- 2.
                } 
            | 
            0 > s ifTrue: [error: 'negative capacity requested'].
            [((growLimit * r) / 100) <= s] whileTrue: [r: 2 * r].
            minBuckets: r.    "Must be a power of 2."
            resizeTo: minBuckets.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'hashTableSetOrDictionary' -> () From: ( | {
         'Category: iterating\x7fModuleInfo: Module: setAndDictionary InitialContents: FollowSlot\x7fVisibility: private'
        
         unsafe_do: b = ( |
            | 
            isEmpty ifTrue: [^self]. "an optimization"
            myKeys do: [ | :k. :i. |
                (emptyMarker = k) || [removedMarker = k] ifFalse: [
                    b value: (key: k OrValueAt: i) With: k].
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'hashTableSetOrDictionary' -> () From: ( | {
         'Category: hashing\x7fComment: Invokes the appropriate block with the index of the key.
Try to get rid of removed markers.
Return the value of the block.
Optimized with Ole\'s suggestion to have two loops -- Dave 9/92
Optimized to use array index checking for detecting when
to wrap around -- Ole Agesen, 3/93.\x7fModuleInfo: Module: setAndDictionary InitialContents: FollowSlot\x7fVisibility: private'
        
         unsafe_indexOf: key IfPresent: pb IfAbsent: ab = ( |
             firstWrap <- bootstrap stub -> 'globals' -> 'true' -> ().
             i <- 0.
            | 
            i: hash: key.
            [|k|
                k: (myKeys at: i IfAbsent: [
                    firstWrap ifTrue: [firstWrap: false. i: 0. myKeys at: 0] 
                               False: [error: 'I should never get this full!'].
                ]).
                emptyMarker   = k    ifTrue: [^ ab  value: i].
                removedMarker = k    ifTrue: [^ indexOf: key IfPresent: pb 
                                                  IfAbsent: ab FirstRM: i].
                (comparisonTraits is: key EqualTo: k) ifTrue: [^ pb  value: i With: k].
                i: i + 1.
            ] loop).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'hashTableSetOrDictionary' -> () From: ( | {
         'Category: removing\x7fModuleInfo: Module: setAndDictionary InitialContents: FollowSlot\x7fVisibility: private'
        
         unsafe_removeAll = ( |
            | removeAllBuckets: minBuckets).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'hashTableSetOrDictionary' -> () From: ( | {
         'Category: iterating\x7fModuleInfo: Module: setAndDictionary InitialContents: FollowSlot\x7fVisibility: private'
        
         unsafe_with: c Do: b = ( |
             i <- 0.
            | 
            isEmpty ifTrue: [^ self]. "an optimization"
            c do: [ | :v2. :k2. k1. v1 |
              [ | :exit. |
                i >= myKeys size ifTrue: [^ self].
                k1: myKeys at: i.
                (emptyMarker = k1) || [removedMarker = k1] ifFalse: [
                  v1: key: k1 OrValueAt: i.
                  i: i succ.
                  exit value.
                ].
                i: i succ.
              ] loopExit.
              b value: v1 With: v2 With: k1 With: k2.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'hashTableSetOrDictionary' -> () From: ( | {
         'Category: adding\x7fModuleInfo: Module: setAndDictionary InitialContents: FollowSlot\x7fVisibility: private'
        
         usingHashForOldKeyIfPossible: i AddKey: k Value: v = ( |
            | 
            at: i ReplaceKey: k Value: v.
            incSize).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'hashTableSetOrDictionary' -> () From: ( | {
         'Category: adding\x7fModuleInfo: Module: setAndDictionary InitialContents: FollowSlot\x7fVisibility: private'
        
         usingHashForOldKeyIfPossible: i ReplaceKey: k Value: v = ( |
            | 
            at: i ReplaceKey: k Value: v).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'set' -> () From: ( | {
         'Category: printing\x7fModuleInfo: Module: setAndDictionary InitialContents: FollowSlot\x7fVisibility: public'
        
         collectionName = 'set'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'set' -> () From: ( | {
         'ModuleInfo: Module: setAndDictionary InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'hashTableSet' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: collections\x7fCategory: unordered\x7fCategory: dictionaries\x7fModuleInfo: Module: setAndDictionary InitialContents: FollowSlot\x7fVisibility: public'
        
         dictionary = bootstrap define: bootstrap stub -> 'globals' -> 'dictionary' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             bootstrap remove: 'prototype' From:
             globals set copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'dictionary' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals dictionary.

CopyDowns:
globals set. copy 
SlotsToOmit: parent prototype.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: collections\x7fCategory: unordered\x7fCategory: hash table based\x7fModuleInfo: Module: setAndDictionary InitialContents: FollowSlot\x7fVisibility: public'
        
         dictionary = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'dictionary' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits dictionary.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'dictionary' -> () From: ( | {
         'ModuleInfo: Module: setAndDictionary InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'dictionary' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'dictionary' -> () From: ( | {
         'ModuleInfo: Module: setAndDictionary InitialContents: FollowSlot\x7fVisibility: private'
        
         prototype = ( |
            | 
            dictionary).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'dictionary' -> () From: ( | {
         'ModuleInfo: Module: setAndDictionary InitialContents: InitializeToExpression: ( vector _Clone: 4 Filler: nil )\x7fVisibility: private'
        
         values <-  vector _Clone: 4 Filler: nil .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: setAndDictionary InitialContents: FollowSlot'
        
         setAndDictionary = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'setAndDictionary' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'comment' From:
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'setAndDictionary' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules setAndDictionary.

CopyDowns:
globals modules init. copy 
SlotsToOmit: comment directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'setAndDictionary' -> () From: ( | {
         'ModuleInfo: Module: setAndDictionary InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'core'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'setAndDictionary' -> () From: ( | {
         'ModuleInfo: Module: setAndDictionary InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'setAndDictionary' -> () From: ( | {
         'ModuleInfo: Module: setAndDictionary InitialContents: FollowSlot'
        
         myComment <- 'Common behavior for sets and dictionary implemented via hash tables.\"

            \"Set implemented with a hash table.\"
            \"Dictionary implemented with a hash table.'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'setAndDictionary' -> () From: ( | {
         'ModuleInfo: Module: setAndDictionary InitialContents: FollowSlot'
        
         postFileIn = ( |
            | 
            set removeAll.
            dictionary removeAll.
            resend.postFileIn).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'setAndDictionary' -> () From: ( | {
         'ModuleInfo: Module: setAndDictionary InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- 'Sun-$Revision: 30.19 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'setAndDictionary' -> () From: ( | {
         'ModuleInfo: Module: setAndDictionary InitialContents: FollowSlot\x7fVisibility: private'
        
         subpartNames <- 'orderedDictionary
idSetAndDictionary
universalSetAndDictionary
customizableSetAndDictionary
'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: collections\x7fCategory: unordered\x7fCategory: hash table based\x7fModuleInfo: Module: setAndDictionary InitialContents: FollowSlot\x7fVisibility: public'
        
         sharedDictionary = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'sharedDictionary' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits sharedDictionary.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'sharedDictionary' -> () From: ( | {
         'ModuleInfo: Module: setAndDictionary InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'sharedDictionary' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: collections\x7fCategory: unordered\x7fCategory: hash table based\x7fModuleInfo: Module: setAndDictionary InitialContents: FollowSlot\x7fVisibility: public'
        
         sharedSet = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'sharedSet' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits sharedSet.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'sharedSet' -> () From: ( | {
         'ModuleInfo: Module: setAndDictionary InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'sharedSet' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: collections\x7fCategory: unordered\x7fCategory: abstract\x7fComment: representation-indep
dictionary\x7fModuleInfo: Module: setAndDictionary InitialContents: FollowSlot\x7fVisibility: public'
        
         abstractDictionary = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'abstractDictionary' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits abstractDictionary.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractDictionary' -> () From: ( | {
         'Category: comparing\x7fModuleInfo: Module: setAndDictionary InitialContents: FollowSlot\x7fVisibility: public'
        
         = x = ( |
            | x equalsDictionary: self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractDictionary' -> () From: ( | {
         'Category: adding\x7fModuleInfo: Module: setAndDictionary InitialContents: FollowSlot\x7fVisibility: public'
        
         add: a = ( |
            | at: a key Put: a value).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractDictionary' -> () From: ( | {
         'Category: adding\x7fModuleInfo: Module: setAndDictionary InitialContents: FollowSlot\x7fVisibility: public'
        
         addAll: c = ( |
            | c do: [ | :v. :k. | at: k Put: v ]. self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractDictionary' -> () From: ( | {
         'Category: comparing\x7fModuleInfo: Module: setAndDictionary InitialContents: FollowSlot\x7fVisibility: public'
        
         equalsDictionary: s = ( |
            | sync: [unsafe_equalsDictionary: s ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractDictionary' -> () From: ( | {
         'ModuleInfo: Module: setAndDictionary InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'abstractSetOrDictionary' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractDictionary' -> () From: ( | {
         'Category: printing\x7fModuleInfo: Module: setAndDictionary InitialContents: FollowSlot\x7fVisibility: private'
        
         printStringKey: k = ( |
            | (k printStringSize: 20), '->').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractDictionary' -> () From: ( | {
         'Category: sorting\x7fModuleInfo: Module: setAndDictionary InitialContents: FollowSlot\x7fVisibility: public'
        
         sortedDo: b = ( |
            | 
            keys asVector sortedDo: [|:n| b value: (at: n) With: n].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractDictionary' -> () From: ( | {
         'Category: printing\x7fModuleInfo: Module: setAndDictionary InitialContents: FollowSlot\x7fVisibility: public'
        
         storeStringIfFail: fb = ( |
            | 
            "Sort the elements for preserving the storestring fixpoint"
            keyedStoreStringIfFail: fb).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractDictionary' -> () From: ( | {
         'Category: comparing\x7fModuleInfo: Module: setAndDictionary InitialContents: FollowSlot\x7fVisibility: private'
        
         unsafe_equalsDictionary: s = ( |
            | 
            == s ifTrue: [^true].   "optimization"
            size = s size ifFalse: [^false].
            do: [ |:v. :k| (s at: k IfAbsent: [^false]) = v ifFalse: [^false]].
            true).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractDictionary' -> () From: ( | {
         'Category: removing\x7fModuleInfo: Module: setAndDictionary InitialContents: FollowSlot\x7fVisibility: private'
        
         unsafe_remove: v IfAbsent: ab = ( |
            | 
            removeKey: keyOf: v IfAbsent: [^ ab value]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'collection' -> () From: ( | {
         'Category: transforming\x7fModuleInfo: Module: setAndDictionary InitialContents: FollowSlot\x7fVisibility: public'
        
         asDictionary = ( |
            | 
            dictionary copyContaining: self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'collection' -> () From: ( | {
         'Category: transforming\x7fModuleInfo: Module: setAndDictionary InitialContents: FollowSlot\x7fVisibility: public'
        
         asSet = ( |
            | 
            set copyContaining: self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'collector' -> () From: ( | {
         'Category: conversions\x7fModuleInfo: Module: setAndDictionary InitialContents: FollowSlot\x7fVisibility: public'
        
         asSet = ( | {
                 'ModuleInfo: Module: collector InitialContents: FollowSlot'
                
                 r.
                } 
            | 
            prependIntoGrowable: set  By: [|:r. :e| r add:      e element]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'dictionary' -> () From: ( | {
         'Category: printing\x7fModuleInfo: Module: setAndDictionary InitialContents: FollowSlot\x7fVisibility: public'
        
         collectionName = 'dictionary'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: collections\x7fCategory: unordered\x7fCategory: hash table based\x7fComment: representation-indep
dictionary\x7fModuleInfo: Module: setAndDictionary InitialContents: FollowSlot\x7fVisibility: public'
        
         hashTableDictionary = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'hashTableDictionary' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits hashTableDictionary.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'dictionary' -> () From: ( | {
         'ModuleInfo: Module: setAndDictionary InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'hashTableDictionary' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'hashTableDictionary' -> () From: ( | {
         'ModuleInfo: Module: setAndDictionary InitialContents: FollowSlot\x7fVisibility: private'
        
         abstractTraits* = bootstrap stub -> 'traits' -> 'abstractDictionary' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'hashTableDictionary' -> () From: ( | {
         'Category: adding\x7fModuleInfo: Module: setAndDictionary InitialContents: FollowSlot\x7fVisibility: private'
        
         at: i ReplaceKey: k Value: v = ( |
            | 
            myKeys   at: i Put: k.
            values   at: i Put: v.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'hashTableDictionary' -> () From: ( | {
         'Category: printing\x7fModuleInfo: Module: setAndDictionary InitialContents: FollowSlot\x7fVisibility: public'
        
         collectionName = 'dictionary'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'hashTableDictionary' -> () From: ( | {
         'Category: testing\x7fModuleInfo: Module: setAndDictionary InitialContents: FollowSlot\x7fVisibility: public'
        
         includesKey: k = ( |
            | 
            representationTraits.includesKey: k).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'hashTableDictionary' -> () From: ( | {
         'Category: markers\x7fModuleInfo: Module: setAndDictionary InitialContents: FollowSlot\x7fVisibility: private'
        
         invalidKeysDo: b = ( |
            | 
            representationTraits.invalidKeysDo: b).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'hashTableDictionary' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: setAndDictionary InitialContents: FollowSlot\x7fVisibility: private'
        
         key: k OrValueAt: i = ( |
            | values at: i).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'hashTableDictionary' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: setAndDictionary InitialContents: FollowSlot\x7fVisibility: private'
        
         keyAtOrValueAt: i = ( |
            | values at: i).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'hashTableDictionary' -> () From: ( | {
         'ModuleInfo: Module: setAndDictionary InitialContents: FollowSlot\x7fVisibility: private'
        
         representationTraits* = bootstrap stub -> 'traits' -> 'hashTableSetOrDictionary' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'sharedDictionary' -> () From: ( | {
         'Category: printing\x7fModuleInfo: Module: setAndDictionary InitialContents: FollowSlot\x7fVisibility: public'
        
         collectionName = 'sharedDictionary'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'sharedDictionary' -> () From: ( | {
         'ModuleInfo: Module: setAndDictionary InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'hashTableDictionary' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'sharedSet' -> () From: ( | {
         'Category: printing\x7fModuleInfo: Module: setAndDictionary InitialContents: FollowSlot\x7fVisibility: public'
        
         collectionName = 'sharedSet'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'sharedSet' -> () From: ( | {
         'ModuleInfo: Module: setAndDictionary InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'hashTableSet' -> ().
        } | ) 



 '-- Sub parts'

 bootstrap read: 'orderedDictionary' From: 'core'
 bootstrap read: 'idSetAndDictionary' From: 'core'
 bootstrap read: 'universalSetAndDictionary' From: 'core'
 bootstrap read: 'customizableSetAndDictionary' From: 'core'



 '-- Side effects'

 globals modules setAndDictionary postFileIn
