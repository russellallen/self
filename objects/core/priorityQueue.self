 'Sun-$Revision: 30.8 $'
 '
Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: priorityQueue InitialContents: FollowSlot'
        
         priorityQueue = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'priorityQueue' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'priorityQueue' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules priorityQueue.

CopyDowns:
globals modules init. copy 
SlotsToOmit: directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'priorityQueue' -> () From: ( | {
         'ModuleInfo: Module: priorityQueue InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'core'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'priorityQueue' -> () From: ( | {
         'ModuleInfo: Module: priorityQueue InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'priorityQueue' -> () From: ( | {
         'ModuleInfo: Module: priorityQueue InitialContents: FollowSlot'
        
         myComment <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'priorityQueue' -> () From: ( | {
         'ModuleInfo: Module: priorityQueue InitialContents: FollowSlot\x7fVisibility: public'
        
         postFileIn = ( |
            | resend.postFileIn).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'priorityQueue' -> () From: ( | {
         'ModuleInfo: Module: priorityQueue InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- 'Sun-$Revision: 30.8 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'priorityQueue' -> () From: ( | {
         'ModuleInfo: Module: priorityQueue InitialContents: FollowSlot\x7fVisibility: private'
        
         subpartNames <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: collections\x7fCategory: unordered\x7fModuleInfo: Module: priorityQueue InitialContents: FollowSlot\x7fVisibility: public'
        
         priorityQueue = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'priorityQueue' -> () From: ( |
             {} = 'Comment: Invariants:
 - contents size is a power of two
 - count is the number of elements stored
 - count is also the index of the next free element in contents
 - sortObj responds to element:Precedes:
 - the children of an element at i have indices 2i + 1 and 2i + 2)
 - the parent of an element at i has index (i - 1) / 2 if i > 0
 - each element of contents precedes its two children\x7fModuleInfo: Creator: globals priorityQueue.
\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'priorityQueue' -> () From: ( | {
         'ModuleInfo: Module: priorityQueue InitialContents: InitializeToExpression: (vector copySize: 4 FillingWith: nil)\x7fVisibility: private'
        
         contents <- vector copySize: 4 FillingWith: nil.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'priorityQueue' -> () From: ( | {
         'ModuleInfo: Module: priorityQueue InitialContents: FollowSlot\x7fVisibility: private'
        
         count <- 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: collections\x7fCategory: unordered\x7fModuleInfo: Module: priorityQueue InitialContents: FollowSlot\x7fVisibility: public'
        
         priorityQueue = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'priorityQueue' -> () From: ( |
             {} = 'Comment: This is a priority queue data structure stored as a heap. The basic
operations on a priority queue are add: and removeFirst. removeFirst
always returns the highest priority element in the queue. Elements
may be ordered according to the default sorting relation (<, which gives
higher priority to smaller elements) or the client may supply a sorter
object that responds to element:Precedes: with true if the first argument
has higher priority than the second. Priority queues do not support random
access to their elements; only the highest priority element may be examined
(with first) or removed (with removeFirst). They do respond to do:, but
do not necessarily enumerate the elements in priority order.\x7fModuleInfo: Creator: traits priorityQueue.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'priorityQueue' -> () From: ( | {
         'ModuleInfo: Module: priorityQueue InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'priorityQueue' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'priorityQueue' -> () From: ( | {
         'ModuleInfo: Module: priorityQueue InitialContents: FollowSlot\x7fVisibility: private'
        
         prototype = ( |
            | priorityQueue).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'priorityQueue' -> () From: ( | {
         'ModuleInfo: Module: priorityQueue InitialContents: FollowSlot\x7fVisibility: private'
        
         sortObj <- bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'priorityQueue' -> 'sortObj' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals priorityQueue sortObj.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'priorityQueue' -> 'sortObj' -> () From: ( | {
         'ModuleInfo: Module: priorityQueue InitialContents: FollowSlot'
        
         element: x Precedes: y = ( |
            | x < y).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'priorityQueue' -> () From: ( | {
         'Comment: Insert the given element.\x7fModuleInfo: Module: priorityQueue InitialContents: FollowSlot\x7fVisibility: public'
        
         add: newElement = ( |
            | 
            count = contents size ifTrue: [
                contents:  contents copySize: count double.
            ].
            contents at: count Put: newElement.
            count: count succ.
            pushLastUp.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'priorityQueue' -> () From: ( | {
         'ModuleInfo: Module: priorityQueue InitialContents: FollowSlot\x7fVisibility: public'
        
         at: k Put: v = ( |
            | error: 'this collection is not indexable').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'priorityQueue' -> () From: ( | {
         'Category: printing\x7fModuleInfo: Module: priorityQueue InitialContents: FollowSlot\x7fVisibility: public'
        
         collectionName = 'priorityQueue'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'priorityQueue' -> () From: ( | {
         'ModuleInfo: Module: priorityQueue InitialContents: FollowSlot\x7fVisibility: public'
        
         copy = ( |
            | clone contents: contents copy).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'priorityQueue' -> () From: ( | {
         'ModuleInfo: Module: priorityQueue InitialContents: FollowSlot\x7fVisibility: public'
        
         copyRemoveAll = ( |
            | 
            copy removeAll).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'priorityQueue' -> () From: ( | {
         'Comment: Evaluate aBlock with each of the priority queue\'s elements in
some arbitrary order (not necessarily sorted).\x7fModuleInfo: Module: priorityQueue InitialContents: FollowSlot\x7fVisibility: public'
        
         do: aBlock = ( |
            | 
            count do: [|:i. elm|
                elm: (contents at: i).
                aBlock value: elm With: elm.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'priorityQueue' -> () From: ( | {
         'ModuleInfo: Module: priorityQueue InitialContents: FollowSlot\x7fVisibility: private'
        
         element: e1 Precedes: e2 = ( |
            | sortObj element: e1 Precedes: e2).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'priorityQueue' -> () From: ( | {
         'ModuleInfo: Module: priorityQueue InitialContents: FollowSlot\x7fVisibility: private'
        
         errorEmptyCollection = ( |
            | 
            error: 'attempt to extract an element from an empty collection').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'priorityQueue' -> () From: ( | {
         'Comment: Evaluate aBlock with each of the priority queue\'s elements in order,
removing the elements in the process. The queue is left empty.\x7fModuleInfo: Module: priorityQueue InitialContents: FollowSlot\x7fVisibility: public'
        
         extractingDo: aBlock = ( |
            | 
            [isEmpty] whileFalse: [aBlock value: removeFirst].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'priorityQueue' -> () From: ( | {
         'Comment: Return the highest priority element without removing it.\x7fModuleInfo: Module: priorityQueue InitialContents: FollowSlot\x7fVisibility: public'
        
         first = ( |
            | 
            isEmpty ifTrue: [^ errorEmptyCollection].
            contents at: 0).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'priorityQueue' -> () From: ( | {
         'ModuleInfo: Module: priorityQueue InitialContents: FollowSlot\x7fVisibility: private'
        
         getIndexOf: elm IfAbsent: blk = ( |
            | 
            count do: [|:i|
                elm = (contents at: i) ifTrue: [^ i].
            ].
            blk value).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'priorityQueue' -> () From: ( | {
         'Comment: Evaluate aBlock with each of the priority queue\'s elements in order.\x7fModuleInfo: Module: priorityQueue InitialContents: FollowSlot\x7fVisibility: public'
        
         orderedDo: aBlock = ( |
            | 
            copy extractingDo: aBlock.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'priorityQueue' -> () From: ( | {
         'ModuleInfo: Module: priorityQueue InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'collection' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'priorityQueue' -> () From: ( | {
         'ModuleInfo: Module: priorityQueue InitialContents: FollowSlot\x7fVisibility: private'
        
         pushElmDown: idx = ( |
             child.
             childIndex.
             leaves.
             left.
             parent.
             parentIndex.
             right.
            | 
            leaves:       count / 2.
            parentIndex:  idx.

            [parentIndex < leaves] whileTrue: [    "while parent is not a leaf..."
                left:   1 + (2 * parentIndex).
                right:  1 + left.
                right = count  ifTrue: [
                    "left is an only-child"
                    childIndex: left.
                ] False: [
                    "select the higher priority child"
                    (element: (contents at: left) Precedes: (contents at: right))
                        ifTrue: [ childIndex:   left ]
                         False: [ childIndex:  right ].
                ].
                parent:  contents at: parentIndex.
                child:   contents at: childIndex.
                (element: child Precedes: parent)  ifTrue: [
                    "a child has higher priority, so swap with parent"
                    contents at: parentIndex  Put: child.
                    contents at: childIndex   Put: parent.
                    parentIndex: childIndex.
                ] False: [
                    "parent has higher priority than its children; we're done"
                    ^ self.
                ]
            ].
            "element was pushed all the way to a leaf"
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'priorityQueue' -> () From: ( | {
         'ModuleInfo: Module: priorityQueue InitialContents: FollowSlot\x7fVisibility: private'
        
         pushLastUp = ( |
             child.
             childIndex.
             parent.
             parentIndex.
            | 
            childIndex:  count - 1.  "the last element"
            [   "while the new element precedes its parent..."
                0 = childIndex  ifTrue: [
                    "this the root, so it has no parent"
                    ^ self.
                ].
                parentIndex:  (childIndex - 1) / 2.
                child:   contents at: childIndex.
                parent:  contents at: parentIndex.
                element: child Precedes: parent.
            ] whileTrue: [
                "...exchange it with its parent"
                contents at: childIndex   Put: parent.
                contents at: parentIndex  Put: child.
                childIndex:  parentIndex ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'priorityQueue' -> () From: ( | {
         'ModuleInfo: Module: priorityQueue InitialContents: FollowSlot\x7fVisibility: private'
        
         pushRootDown = ( |
            | 
            pushElmDown: 0).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'priorityQueue' -> () From: ( | {
         'ModuleInfo: Module: priorityQueue InitialContents: FollowSlot\x7fVisibility: public'
        
         releaseObjects = ( |
            | 
            count upTo: contents size Do: [|:i| 
              contents at: i Put: nil
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'priorityQueue' -> () From: ( | {
         'Comment: Remove given element if it is in queue.\x7fModuleInfo: Module: priorityQueue InitialContents: FollowSlot\x7fVisibility: public'
        
         remove: elm IfAbsent: blk = ( |
            | 
            "The second test below is an optimization."
            isEmpty || [element: elm Precedes: first] ifTrue: [^ blk value]. 
            removeAtIndex: (getIndexOf: elm IfAbsent: [^ blk value]).
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'priorityQueue' -> () From: ( | {
         'Comment: Empty the priority queue.\x7fModuleInfo: Module: priorityQueue InitialContents: FollowSlot\x7fVisibility: public'
        
         removeAll = ( |
            | 
            count: 0.
            contents do: [|:e. :i|
              contents at: i Put: nil
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'priorityQueue' -> () From: ( | {
         'ModuleInfo: Module: priorityQueue InitialContents: FollowSlot\x7fVisibility: private'
        
         removeAtIndex: i = ( |
            | 
            count: count - 1.
            i = count ifTrue: [^ self].  "Done."
            "Replace the removed element with the last, then push it down."
            contents at: i Put: (contents at: count).
            contents at: count Put: nil.  "Clear entry."
            pushElmDown: i).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'priorityQueue' -> () From: ( | {
         'ModuleInfo: Module: priorityQueue InitialContents: FollowSlot\x7fVisibility: public'
        
         removeFirst = ( |
             result.
            | 
            isEmpty ifTrue: [^ errorEmptyCollection].
            "The first element has the highest priority."
            result: (contents at: 0).
            removeAtIndex: 0.
            result).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'priorityQueue' -> () From: ( | {
         'Comment: Return the number of elements in the priority queue.\x7fModuleInfo: Module: priorityQueue InitialContents: FollowSlot\x7fVisibility: public'
        
         size = ( |
            | 
            count).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'priorityQueue' -> () From: ( | {
         'Comment: Use a client-supplied sorter object. This object should respond to
element:Precedes: with true if the first object should have higher
priority than the second and false otherwise.\x7fModuleInfo: Module: priorityQueue InitialContents: FollowSlot\x7fVisibility: public'
        
         sorter: sorter = ( |
            | 
            sortObj: sorter).
        } | ) 



 '-- Side effects'

 globals modules priorityQueue postFileIn
