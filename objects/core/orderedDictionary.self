 '$Revision: 30.8 $'
 '
Copyright 1992-2012 AUTHORS.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: orderedDictionary InitialContents: FollowSlot'
        
         orderedDictionary = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'orderedDictionary' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'comment' From:
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'orderedDictionary' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules orderedDictionary.

CopyDowns:
globals modules init. copy 
SlotsToOmit: comment directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'orderedDictionary' -> () From: ( | {
         'ModuleInfo: Module: orderedDictionary InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'core'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'orderedDictionary' -> () From: ( | {
         'ModuleInfo: Module: orderedDictionary InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'orderedDictionary' -> () From: ( | {
         'ModuleInfo: Module: orderedDictionary InitialContents: FollowSlot'
        
         myComment <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'orderedDictionary' -> () From: ( | {
         'ModuleInfo: Module: orderedDictionary InitialContents: FollowSlot'
        
         postFileIn = ( |
            | resend.postFileIn).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'orderedDictionary' -> () From: ( | {
         'ModuleInfo: Module: orderedDictionary InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- '$Revision: 30.8 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'orderedDictionary' -> () From: ( | {
         'ModuleInfo: Module: orderedDictionary InitialContents: FollowSlot\x7fVisibility: private'
        
         subpartNames <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: collections\x7fCategory: ordered\x7fModuleInfo: Module: orderedDictionary InitialContents: FollowSlot\x7fVisibility: public'
        
         orderedDictionary = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'orderedDictionary' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals orderedDictionary.
\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'orderedDictionary' -> () From: ( | {
         'Category: printing\x7fModuleInfo: Module: orderedDictionary InitialContents: FollowSlot\x7fVisibility: public'
        
         collectionName = 'orderedDictionary'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'orderedDictionary' -> () From: ( | {
         'Category: ordered dictionary state\x7fModuleInfo: Module: orderedDictionary InitialContents: InitializeToExpression: (dictionary copyRemoveAll)\x7fVisibility: private'
        
         pairs <- dictionary copyRemoveAll.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'orderedDictionary' -> () From: ( | {
         'Category: ordered dictionary state\x7fModuleInfo: Module: orderedDictionary InitialContents: InitializeToExpression: (list copyRemoveAll)\x7fVisibility: private'
        
         privateKeys <- list copyRemoveAll.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'orderedDictionary' -> () From: ( | {
         'Category: filing out\x7fModuleInfo: Module: orderedDictionary InitialContents: FollowSlot\x7fVisibility: public'
        
         prototype = ( |
            | orderedDictionary).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'orderedDictionary' -> () From: ( | {
         'ModuleInfo: Module: orderedDictionary InitialContents: FollowSlot\x7fVisibility: private'
        
         safety* = bootstrap stub -> 'traits' -> 'abstractSetOrDictionary' -> 'unsafeMixin' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: collections\x7fCategory: ordered\x7fModuleInfo: Module: orderedDictionary InitialContents: FollowSlot\x7fVisibility: public'
        
         orderedDictionary = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'orderedDictionary' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits orderedDictionary.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'orderedDictionary' -> () From: ( | {
         'ModuleInfo: Module: orderedDictionary InitialContents: FollowSlot\x7fVisibility: private'
        
         traits* = bootstrap stub -> 'traits' -> 'orderedDictionary' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'orderedDictionary' -> () From: ( | {
         'Category: concatenating\x7fModuleInfo: Module: orderedDictionary InitialContents: FollowSlot\x7fVisibility: public'
        
         , c = ( |
             r.
            | 
            r: copy.
            c do: [|:v. :k| r at: k Put: v].
            r).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'orderedDictionary' -> () From: ( | {
         'ModuleInfo: Module: orderedDictionary InitialContents: FollowSlot\x7fVisibility: private'
        
         areKeysOrdered = bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'orderedDictionary' -> () From: ( | {
         'Category: transforming\x7fModuleInfo: Module: orderedDictionary InitialContents: FollowSlot\x7fVisibility: public'
        
         asDictionary = ( |
            | pairs copy).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'orderedDictionary' -> () From: ( | {
         'Category: copying\x7fModuleInfo: Module: orderedDictionary InitialContents: FollowSlot\x7fVisibility: public'
        
         copyRemoveAll = ( |
            | 
            sync: [(clone privateKeys: privateKeys copyRemoveAll) pairs: pairs copyRemoveAll]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'orderedDictionary' -> () From: ( | {
         'Category: iterating\x7fModuleInfo: Module: orderedDictionary InitialContents: FollowSlot\x7fVisibility: public'
        
         do: b = ( |
            | 
            keys do: [|:k| b value: (pairs at: k) With: k ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'orderedDictionary' -> () From: ( | {
         'Category: searching\x7fComment: Evaluate eb for each element and index.
If true is returned, evaluate fb with the element and index,
and return the result.  Otherwise, evaluate `fail\' and return
the result.\x7fModuleInfo: Module: orderedDictionary InitialContents: FollowSlot\x7fVisibility: public'
        
         findFirst: eb IfPresent: fb IfAbsent: fail = ( |
            | 
            pairs findFirst: eb IfPresent: fb IfAbsent: fail).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'orderedDictionary' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: orderedDictionary InitialContents: FollowSlot\x7fVisibility: public'
        
         first = ( |
            | 
            at: firstKey).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'orderedDictionary' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: orderedDictionary InitialContents: FollowSlot\x7fVisibility: public'
        
         firstKey = ( |
            | keys first).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'orderedDictionary' -> () From: ( | {
         'Category: hashing\x7fModuleInfo: Module: orderedDictionary InitialContents: FollowSlot\x7fVisibility: public'
        
         hash = ( |
            | keys hash ^^ pairs hash).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'orderedDictionary' -> () From: ( | {
         'Category: fast accessing\x7fModuleInfo: Module: orderedDictionary InitialContents: FollowSlot\x7fVisibility: public'
        
         if: k IsPresentDo: presentActionBlock IfAbsentDo: absentActionBlock = ( |
            | 
            pairs if: k IsPresentDo: presentActionBlock
                  IfAbsentDo: absentActionBlock).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'orderedDictionary' -> () From: ( | {
         'Category: fast accessing\x7fComment: If collection contains k invoke presentActionBlock with value at k.
If k is absent, add result of evaluating newValueBlock on k,
at key k (for dicts) and invoke absentActionBlock with new value.\x7fModuleInfo: Module: orderedDictionary InitialContents: FollowSlot\x7fVisibility: public'
        
         if: k IsPresentDo: presentActionBlock IfAbsentPut: newValueBlock AndDo: absentActionBlock = ( |
            | 
            pairs if: k IsPresentDo: presentActionBlock
                  IfAbsentPut: newValueBlock
                  AndDo: [ |:newV. :oldK| 
                           privateKeys addLast: oldK.
                           absentActionBlock value: newV With: oldK ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'orderedDictionary' -> () From: ( | {
         'Category: fast accessing\x7fComment: if collection contains k, invoke replacementValueBlock with arg 
old value and replace contents at k with result of replacementValueBlock.
Then invoke presentActionBlock with arg new value.
If k is absent, invoke absentActionBlock with k.\x7fModuleInfo: Module: orderedDictionary InitialContents: FollowSlot\x7fVisibility: public'
        
         if: k IsPresentPut: replacementValueBlock AndDo: presentActionBlock IfAbsentDo: absentActionBlock = ( |
            | 
            pairs if: 
                  k IsPresentPut: replacementValueBlock
                  AndDo: presentActionBlock
                  IfAbsentDo: absentActionBlock).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'orderedDictionary' -> () From: ( | {
         'Category: fast accessing\x7fComment: if collection contains k, 
invoke replacementValueBlock with arg old value
and replace contents at k with result of replacementValueBlock.
Then invoke presentActionBlock with arg new value.
If k is absent, add result of evaluating newValueBlock at key k 
(for dicts) and invoke absentActionBlock with new value.\x7fModuleInfo: Module: orderedDictionary InitialContents: FollowSlot\x7fVisibility: public'
        
         if: k IsPresentPut: replacementValueBlock AndDo: presentActionBlock IfAbsentPut: newValueBlock AndDo: absentActionBlock = ( |
            | 
            pairs
              if: k
              IsPresentPut: replacementValueBlock
                     AndDo: presentActionBlock
               IfAbsentPut: newValueBlock
                     AndDo: [|:newV. :oldK| 
                             privateKeys addLast: oldK.  
                             absentActionBlock value: newV With: oldK]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'orderedDictionary' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: orderedDictionary InitialContents: FollowSlot\x7fVisibility: public'
        
         includesKey: k = ( |
            | pairs includesKey: k).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'orderedDictionary' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: orderedDictionary InitialContents: FollowSlot\x7fVisibility: public'
        
         keys = ( |
            | privateKeys).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'orderedDictionary' -> () From: ( | {
         'Category: removing\x7fComment: Remove an arbitrary element from the set or dictionary.
Return the removed element (not the key).\x7fModuleInfo: Module: orderedDictionary InitialContents: FollowSlot\x7fVisibility: public'
        
         removeFirstIfAbsent: absentBlk = ( |
            | 
            removeKey: firstKey IfAbsent: absentBlk).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'orderedDictionary' -> () From: ( | {
         'Category: removing\x7fModuleInfo: Module: orderedDictionary InitialContents: FollowSlot\x7fVisibility: public'
        
         removeKey: k IfAbsent: b = ( |
            | 
            pairs removeKey: k IfAbsent: [^ b value].
            privateKeys remove: k.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'orderedDictionary' -> () From: ( | {
         'Category: sizing\x7fModuleInfo: Module: orderedDictionary InitialContents: FollowSlot\x7fVisibility: public'
        
         size = ( |
            | keys size).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'orderedDictionary' -> () From: ( | {
         'ModuleInfo: Module: orderedDictionary InitialContents: FollowSlot\x7fVisibility: private'
        
         traits* = bootstrap stub -> 'traits' -> 'abstractDictionary' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'orderedDictionary' -> () From: ( | {
         'Category: copying\x7fModuleInfo: Module: orderedDictionary InitialContents: FollowSlot\x7fVisibility: private'
        
         unsafe_copy = ( |
            | 
            (clone privateKeys: privateKeys copy) pairs: pairs copy).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'orderedDictionary' -> () From: ( | {
         'Category: removing\x7fModuleInfo: Module: orderedDictionary InitialContents: FollowSlot'
        
         unsafe_removeAll = ( |
            | 
            privateKeys removeAll. 
            pairs       removeAll. self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'orderedDictionary' -> () From: ( | {
         'Category: iterating\x7fModuleInfo: Module: orderedDictionary InitialContents: FollowSlot\x7fVisibility: public'
        
         withNonindexable: c Do: b = ( |
            | 
            "result of double-dispatch, a with: b Do: ends up
             b withNonindexable: a Do:"
            c with: keys asVector Do: [|:c_v. :c_k. :my_k|
              b value: c_v With: (at: my_k) With: c_k With: my_k
            ]).
        } | ) 



 '-- Side effects'

 globals modules orderedDictionary postFileIn
