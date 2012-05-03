 'Sun-$Revision: 30.7 $'
 '
Copyright 1992-2012 AUTHORS.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: sortedSequence InitialContents: FollowSlot'
        
         sortedSequence = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'sortedSequence' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'comment' From:
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'sortedSequence' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules sortedSequence.

CopyDowns:
globals modules init. copy 
SlotsToOmit: comment directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'sortedSequence' -> () From: ( | {
         'ModuleInfo: Module: sortedSequence InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'core'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'sortedSequence' -> () From: ( | {
         'ModuleInfo: Module: sortedSequence InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'sortedSequence' -> () From: ( | {
         'ModuleInfo: Module: sortedSequence InitialContents: FollowSlot'
        
         myComment <- '\'A sorted sequence is a sequence that maintains its elements in sorted order.
            The elements are compared using the messages = and < to
            determine the ordering.  Use a different comparator for a
            different order. 

            Like a ST80 SortedCollection.

            Adding and removing an element by naming the element is O(log size).  
            Removing by index is O(n) (to compress the collection); adding
            by index is not allowed.\''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'sortedSequence' -> () From: ( | {
         'ModuleInfo: Module: sortedSequence InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- 'Sun-$Revision: 30.7 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'sortedSequence' -> () From: ( | {
         'ModuleInfo: Module: sortedSequence InitialContents: FollowSlot\x7fVisibility: private'
        
         subpartNames <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: collections\x7fCategory: sorted\x7fModuleInfo: Module: sortedSequence InitialContents: FollowSlot\x7fVisibility: public'
        
         sortedSequence = bootstrap define: bootstrap stub -> 'globals' -> 'sortedSequence' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             bootstrap remove: 'prototype' From:
             globals sequence copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'sortedSequence' -> () From: ( |
             {} = 'Comment: sortedSequence inherits a lot of inappropriate stuff
from sequence (such as insert:At:, addLast:, etc.).
Do not attempt to use anything that could violate the
invariant that its elements are always maintained
in sorted order.\x7fModuleInfo: Creator: globals sortedSequence.

CopyDowns:
globals sequence. copy 
SlotsToOmit: parent prototype.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'sortedSequence' -> () From: ( | {
         'ModuleInfo: Module: sortedSequence InitialContents: FollowSlot\x7fVisibility: public'
        
         comparator <- bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'sortedSequence' -> 'comparator' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals sortedSequence comparator.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'sortedSequence' -> 'comparator' -> () From: ( | {
         'ModuleInfo: Module: sortedSequence InitialContents: FollowSlot'
        
         element: a Equals: b = ( |
            | a=b).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'sortedSequence' -> 'comparator' -> () From: ( | {
         'ModuleInfo: Module: sortedSequence InitialContents: FollowSlot'
        
         element: a Precedes: b = ( |
            | a<b).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: collections\x7fCategory: sorted\x7fModuleInfo: Module: sortedSequence InitialContents: FollowSlot\x7fVisibility: public'
        
         sortedSequence = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'sortedSequence' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits sortedSequence.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'sortedSequence' -> () From: ( | {
         'ModuleInfo: Module: sortedSequence InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'sortedSequence' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'sortedSequence' -> () From: ( | {
         'Category: adding\x7fModuleInfo: Module: sortedSequence InitialContents: FollowSlot\x7fVisibility: public'
        
         add: el = ( | {
                 'ModuleInfo: Module: sortedSequence InitialContents: FollowSlot'
                
                 index.
                } 
            | 
            index: indexForInserting: el.
            insert: el At: index).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'sortedSequence' -> () From: ( | {
         'Category: adding\x7fModuleInfo: Module: sortedSequence InitialContents: FollowSlot\x7fVisibility: public'
        
         addAll: els = ( | {
                 'ModuleInfo: Module: sortedSequence InitialContents: FollowSlot'
                
                 k.
                } 
            | 
            (els size < 5) || (els size < size half) ifTrue: [
              els do: [ | :el | add: el. ]
            ] False: [
              els do: [ | :el | resend.addLast: el. ].
              sortBy: comparator
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'sortedSequence' -> () From: ( | {
         'Category: printing\x7fModuleInfo: Module: sortedSequence InitialContents: FollowSlot\x7fVisibility: public'
        
         collectionName = 'sortedSequence'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'sortedSequence' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: sortedSequence InitialContents: FollowSlot\x7fVisibility: private'
        
         indexForInserting: el = ( |
             high.
             low.
            | 
            "Use indexes of elems to avoid arithmetic in loop"
            low: firstKey + start.
            high: lastKey + start.
            [| mid |
             low > high ifTrue: [^low - start].
             mid: (low + high) >> 1.
             (comparator element: (elems at: mid) Precedes: el)
                  ifTrue: [low: mid succ]
                   False: [high: mid pred]
            ] loop).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'sortedSequence' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: sortedSequence InitialContents: FollowSlot\x7fVisibility: public'
        
         last = ( |
            | 
            unsafeAt: lastKey).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'sortedSequence' -> () From: ( | {
         'ModuleInfo: Module: sortedSequence InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'sequence' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'sortedSequence' -> () From: ( | {
         'ModuleInfo: Module: sortedSequence InitialContents: FollowSlot\x7fVisibility: public'
        
         prototype = ( |
            | sortedSequence).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'sortedSequence' -> () From: ( | {
         'Category: replacing\x7fComment: Find the place at which aValue would normally be inserted
into the sequence, and replace that element with aValue, returning
the index.  If aValue is already in the sequence, do nothing and
return nil.  Append to the end if necessary.
Because this operation preserves the sort order, it can be
implemented in an efficient and direct way.\x7fModuleInfo: Module: sortedSequence InitialContents: FollowSlot\x7fVisibility: public'
        
         replaceNextLargerWith: aValue = ( |
             index.
             lastEl.
            | 
               isEmpty
            || [lastEl: last.
                comparator element: lastEl Precedes: aValue] ifTrue: [
                  addLast: aValue.
                  ^lastKey
            ].

            "quick check for common case: if
               (aValue < last) && (at: lastKey pred < aValue)
             replace last with aValue"

               (comparator element: aValue Precedes: lastEl)
            && [   (size = 1)
                || [comparator element: (unsafeAt: lastKey pred) Precedes: aValue]]  ifTrue: [
                unsafeAt: lastKey Put: aValue.
                ^lastKey
            ].

            index: indexForInserting: aValue.

            ((index != firstKey)
             && [comparator element: (unsafeAt: index pred) Equals: aValue])
                   ifTrue: [^nil].
            unsafeAt: index Put: aValue.
            ^index).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'sortedSequence' -> () From: ( | {
         'Category: tests\x7fModuleInfo: Module: sortedSequence InitialContents: FollowSlot\x7fVisibility: public'
        
         tests = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'sortedSequence' -> 'tests' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits sortedSequence tests.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'sortedSequence' -> 'tests' -> () From: ( | {
         'Category: tests\x7fModuleInfo: Module: sortedSequence InitialContents: FollowSlot\x7fVisibility: public'
        
         doTests = ( |
            | 
            testAdds.
            testBulkAdd).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'sortedSequence' -> 'tests' -> () From: ( | {
         'ModuleInfo: Module: sortedSequence InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'oddball' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'sortedSequence' -> 'tests' -> () From: ( | {
         'Category: tests\x7fModuleInfo: Module: sortedSequence InitialContents: FollowSlot\x7fVisibility: public'
        
         testAdds = ( | {
                 'ModuleInfo: Module: sortedSequence InitialContents: FollowSlot'
                
                 s.
                } 
            | 
            s:  sortedSequence copy.
            "add before, after and dupes at beginning, middle and end"
            (4 & 5 & 2 & 3 & 0 & 3 & 0 & 5) asVector
              do: [|:e| s add: e].
            tests
              check: s asVector
              Against: (0 & 0 & 2 & 3 & 3 & 4 & 5 & 5) asVector
              Named: 'sorted sequence: adding').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'sortedSequence' -> 'tests' -> () From: ( | {
         'Category: tests\x7fModuleInfo: Module: sortedSequence InitialContents: FollowSlot\x7fVisibility: public'
        
         testBulkAdd = ( | {
                 'ModuleInfo: Module: sortedSequence InitialContents: FollowSlot'
                
                 s.
                }  {
                 'ModuleInfo: Module: sortedSequence InitialContents: FollowSlot'
                
                 t.
                } 
            | 
            s:  sortedSequence copy.
            s add: 2.
            s add: 10.
            s add: 16.
            s add: 30.
            t:  vector copySize: 18.
            20 to: 3 By: -1 Do: [|:e| t at: e-3 Put: 23-e].
            s addAll: t.
            s replaceNextLargerWith: 10.
            s replaceNextLargerWith: 26.
            s replaceNextLargerWith: 26.
            "compute a signature"
            tests
              check: (s reduceWith: [|:e1. :e2| (e1 << 1) ^^ e2])
              Against: 4775038
              Named: 'sorted sequence: adding').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'sortedSequence' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: sortedSequence InitialContents: FollowSlot\x7fVisibility: private'
        
         unsafeAt: k = ( |
            | elems at: start + (k - firstKey)).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'sortedSequence' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: sortedSequence InitialContents: FollowSlot\x7fVisibility: private'
        
         unsafeAt: k Put: v = ( |
            | 
            elems at: start + (k - firstKey) Put: v.
            self).
        } | ) 



 '-- Side effects'

 globals modules sortedSequence postFileIn
