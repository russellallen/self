 'Sun-$Revision: 30.9 $'
 '
Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: sequence InitialContents: FollowSlot'
        
         sequence = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'sequence' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'comment' From:
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'sequence' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules sequence.

CopyDowns:
globals modules init. copy 
SlotsToOmit: comment directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'sequence' -> () From: ( | {
         'ModuleInfo: Module: sequence InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'core'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'sequence' -> () From: ( | {
         'ModuleInfo: Module: sequence InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'sequence' -> () From: ( | {
         'ModuleInfo: Module: sequence InitialContents: FollowSlot'
        
         myComment <- 'A sequence is a vector that supports adding and removing from either
             end and inserting and removing from the middle.  It stores elements in
             a nested vector with usually some slop at both ends like a ST80
             OrderedCollection or a CLU array.  The firstKey of a sequence is
             always 0, although it is possible for a child to change this behavior
             by overriding firstKey and lastKey.\"

            \"Sequences are good where O(1) at: and at:Put: behavior is needed in
             conjunction with <= O(n) in-place insertions and removals, e.g. stacks
             and queues.  removeFirst/Last are O(1) and addFirst/Last average
             somewhere between O(1) and O(n). The current empty space policy
             favors applications that repeatedly add elements to the same end.'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'sequence' -> () From: ( | {
         'ModuleInfo: Module: sequence InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- 'Sun-$Revision: 30.9 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'sequence' -> () From: ( | {
         'ModuleInfo: Module: sequence InitialContents: FollowSlot\x7fVisibility: private'
        
         subpartNames <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: collections\x7fCategory: ordered\x7fModuleInfo: Module: sequence InitialContents: FollowSlot\x7fVisibility: public'
        
         sequence = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'sequence' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals sequence.
\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'sequence' -> () From: ( | {
         'Comment: defaultSlop space for element storage\x7fModuleInfo: Module: sequence InitialContents: InitializeToExpression: (vector copySize: 4)\x7fVisibility: private'
        
         elems <- vector copySize: 4.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: collections\x7fCategory: ordered\x7fModuleInfo: Module: sequence InitialContents: FollowSlot\x7fVisibility: public'
        
         sequence = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'sequence' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits sequence.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'sequence' -> () From: ( | {
         'ModuleInfo: Module: sequence InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'sequence' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'sequence' -> () From: ( | {
         'ModuleInfo: Module: sequence InitialContents: FollowSlot\x7fVisibility: private'
        
         prototype = ( |
            | sequence).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'sequence' -> () From: ( | {
         'Comment: # of elements stored in backing vector\x7fModuleInfo: Module: sequence InitialContents: FollowSlot\x7fVisibility: publicReadPrivateWrite'
        
         size <- 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'sequence' -> () From: ( | {
         'Comment: index of first element in backing vector\x7fModuleInfo: Module: sequence InitialContents: FollowSlot\x7fVisibility: private'
        
         start <- 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'collection' -> () From: ( | {
         'Category: transforming\x7fModuleInfo: Module: sequence InitialContents: FollowSlot\x7fVisibility: public'
        
         asSequence = ( |
            | 
            sequence copyContaining: self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'collector' -> () From: ( | {
         'Category: conversions\x7fComment: create a sequence object containing receiver\'s elements.
  -- Randy, 6/1/95\x7fModuleInfo: Module: sequence InitialContents: FollowSlot\x7fVisibility: public'
        
         asSequence = ( |
            | 
            prependIntoGrowable: sequence By: [|:r. :e| r addFirst: e element]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'sequence' -> () From: ( | {
         'Category: adding\x7fModuleInfo: Module: sequence InitialContents: FollowSlot\x7fVisibility: public'
        
         add: el = ( |
            | addLast: el).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'sequence' -> () From: ( | {
         'Category: adding\x7fModuleInfo: Module: sequence InitialContents: FollowSlot\x7fVisibility: public'
        
         add: el WithKey: k = ( |
            | addLast: el).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'sequence' -> () From: ( | {
         'Category: adding\x7fModuleInfo: Module: sequence InitialContents: FollowSlot\x7fVisibility: public'
        
         addAll: els = ( |
            | addAllLast: els).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'sequence' -> () From: ( | {
         'Category: adding\x7fModuleInfo: Module: sequence InitialContents: FollowSlot\x7fVisibility: public'
        
         addAllFirst: els = ( |
             i <- 0.
             s <- 0.
            | 
            s: els size.
            makeSpaceAtStart: s.
            start: start - s.
            i: start.
            els do: [| :el |
                elems at: i Put: el.
                i: 1 + i.
            ].
            size: size + s.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'sequence' -> () From: ( | {
         'Category: adding\x7fModuleInfo: Module: sequence InitialContents: FollowSlot\x7fVisibility: public'
        
         addAllLast: els = ( |
             i <- 0.
             s <- 0.
            | 
            s: els size.
            makeSpaceAtEnd: s.
            i: start + size.
            els do: [| :el |
                elems at: i Put: el.
                i: 1 + i.
            ].
            size: s + size.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'sequence' -> () From: ( | {
         'Category: adding\x7fModuleInfo: Module: sequence InitialContents: FollowSlot\x7fVisibility: public'
        
         addFirst: el = ( |
            | 
            makeSpaceAtStart: 1.
            start: start - 1.
            elems at: start Put: el.
            size: 1 + size.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'sequence' -> () From: ( | {
         'Category: adding\x7fModuleInfo: Module: sequence InitialContents: FollowSlot\x7fVisibility: public'
        
         addLast: el = ( |
             s <- 0.
            | 
            s: size.
            elems at: s + start Put: el IfAbsent: [
                makeSpaceAtEnd: 1.
                elems at: s + start Put: el.
            ].
            size: 1 + s.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'sequence' -> () From: ( | {
         'Category: transforming\x7fModuleInfo: Module: sequence InitialContents: FollowSlot\x7fVisibility: public'
        
         asByteVector = ( |
             bv.
            | 
            bv: byteVector copySize: size.
            do: [|:b. :i| bv at: i Put: b].
            bv).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'sequence' -> () From: ( | {
         'Category: transforming\x7fModuleInfo: Module: sequence InitialContents: FollowSlot\x7fVisibility: public'
        
         asVector = ( |
            | 
            elems copyFrom: start UpTo: start + size).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'sequence' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: sequence InitialContents: FollowSlot\x7fVisibility: public'
        
         at: k IfAbsent: b = ( |
            | 
            (firstKey <= k) && [k <= lastKey] ifFalse: [ ^b value: k ].
            elems at: start + (k - firstKey)).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'sequence' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: sequence InitialContents: FollowSlot\x7fVisibility: public'
        
         at: k Put: v IfAbsent: b = ( |
            | 
            (firstKey <= k) && [k <= lastKey] ifFalse: [ ^b value: k ].
            elems at: start + (k - firstKey) Put: v.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'sequence' -> () From: ( | {
         'Category: private utilities\x7fModuleInfo: Module: sequence InitialContents: FollowSlot\x7fVisibility: private'
        
         clearFrom: from UpTo: to = ( |
            | 
            "Set the elements in the given range of of indices
             to nil to allow the objects to be garbage collected."

            from upTo: to Do: [| :i | elems at: i Put: nil ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'sequence' -> () From: ( | {
         'Category: printing\x7fModuleInfo: Module: sequence InitialContents: FollowSlot\x7fVisibility: public'
        
         collectionName = 'sequence'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'sequence' -> () From: ( | {
         'Category: resizing\x7fModuleInfo: Module: sequence InitialContents: FollowSlot\x7fVisibility: public'
        
         compress = ( |
            | 
            size != elems size ifTrue: [
                elems: (elems copyFrom: start UpTo: start + size). 
                start: 0.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'sequence' -> () From: ( | {
         'Category: creating\x7fModuleInfo: Module: sequence InitialContents: FollowSlot\x7fVisibility: public'
        
         copy = ( |
            | clone elems: elems copy).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'sequence' -> () From: ( | {
         'Category: creating\x7fModuleInfo: Module: sequence InitialContents: FollowSlot\x7fVisibility: public'
        
         copyAddLast: x = ( |
            | copy addLast: x).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'sequence' -> () From: ( | {
         'Category: creating\x7fModuleInfo: Module: sequence InitialContents: FollowSlot\x7fVisibility: public'
        
         copyRemoveAll = ( |
            | 
            ((clone elems: vector copySize: defaultSlop) start: 0) size: 0).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'sequence' -> () From: ( | {
         'Category: creating\x7fModuleInfo: Module: sequence InitialContents: FollowSlot\x7fVisibility: public'
        
         copySize: n FillingWith: f = ( |
             newElems.
            | 
             n = size ifTrue: [ ^copy ].
             n < size ifTrue: [ "copy is truncated"
                 newElems: elems copyFrom: start UpTo: start + n.
            ] False: [          "copy is extended"
                 newElems: vector copySize: n FillingWith: f.
                 size do: [| :i | newElems at: i Put: (elems at: start + i) ].
             ].
             ((clone elems: newElems) start: 0) size: n).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'sequence' -> () From: ( | {
         'ModuleInfo: Module: sequence InitialContents: FollowSlot\x7fVisibility: private'
        
         defaultSlop = 4.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'sequence' -> () From: ( | {
         'Category: resizing\x7fModuleInfo: Module: sequence InitialContents: FollowSlot\x7fVisibility: public'
        
         desiredMinCapacity: n = ( |
            | 
            "Ensure that the receiver has enough space to store at
             least the given number of elements."
            "Note: this method never shrinks the receiver; see compress."

            n > elems size ifTrue: [
                "Double the current capacity, at least."
                elems: elems copySize: ((2 * elems size) max: n).
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'sequence' -> () From: ( | {
         'Category: iterating\x7fModuleInfo: Module: sequence InitialContents: FollowSlot\x7fVisibility: public'
        
         do: block = ( |
             i <- 0.
            | 
            "Optimizes away the overhead of checking keys in at:."
            isEmpty ifTrue: [^ self].  "An optim."
            i: start.
            firstKey to: lastKey Do: [|:k|
                block value: (elems at: i) With: k.
                i: 1 + i.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'sequence' -> () From: ( | {
         'Category: transforming\x7fModuleInfo: Module: sequence InitialContents: FollowSlot\x7fVisibility: public'
        
         filterBy: filterBlock = ( |
             i <- 0.
             k <- 0.
            | 
            "Details: i is the index of the next element to test.
             j is the original key of that element."

            [i < size] whileTrue: [
                (filterBlock value: (at: i) With: k) ifTrue: [i: 1 + i]
                                                      False: [removeKey: i].
                k: k + 1.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'sequence' -> () From: ( | {
         'Category: adding\x7fModuleInfo: Module: sequence InitialContents: FollowSlot\x7fVisibility: public'
        
         insert: el At: k = ( |
            | 
            insert: el At: k IfAbsent:
                [ error: 'bad key for insertion: ', k printString ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'sequence' -> () From: ( | {
         'Category: adding\x7fModuleInfo: Module: sequence InitialContents: FollowSlot\x7fVisibility: public'
        
         insert: el At: k IfAbsent: b = ( |
             i.
            | 
            "Insert the given element at the given index. Elements
             at indices index through lastKey are shifted up to make
             room. If index >= size, then the element is appended."

            (firstKey <= k) && [k <= lastKey succ] ifFalse: [ ^b value ].
            makeSpaceAtEnd: 1.
            i: start + (k - firstKey).
            shiftElemsFrom: i Through: (start + size) - 1 By: 1.
            elems at: i Put: el.
            size: 1 + size.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'sequence' -> () From: ( | {
         'Category: adding\x7fModuleInfo: Module: sequence InitialContents: FollowSlot\x7fVisibility: public'
        
         insertAll: els At: k = ( |
            | 
            insertAll: els At: k IfAbsent:
                [ error: 'bad key for insertion: ', k printString ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'sequence' -> () From: ( | {
         'Category: adding\x7fModuleInfo: Module: sequence InitialContents: FollowSlot\x7fVisibility: public'
        
         insertAll: els At: k IfAbsent: b = ( |
             i.
             n.
            | 
            "Inserts the given elements at the given index. Elements
             at indices index through lastKey are shifted up to make
             room. If index >= size, then the element is appended."

            (firstKey <= k) && [k <= lastKey succ] ifFalse: [ ^b value ].
            n: els size.
            makeSpaceAtEnd: n.
            i: start + (k - firstKey).
            shiftElemsFrom: i Through: (start + size) - 1 By: n.
            els do: [| :el |
                elems at: i Put: el.
                i: 1 + i.
            ].
            size: size + n.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'sequence' -> () From: ( | {
         'Category: private utilities\x7fModuleInfo: Module: sequence InitialContents: FollowSlot\x7fVisibility: private'
        
         makeSpaceAtEnd: space = ( |
            | 
            "Make room for the given number of new elements to be
             added to the end of this sequence. Current contents of
             elems are shifted to the beginning if necessary, based
             on the expectation that a typical client will add new
             elements to the same end of the sequence repeately."

            desiredMinCapacity: size + space.
            (elems size - (start + size)) < space ifTrue: [
                "slide elem contents to the beginning to make room"
                size do: [| :i | elems at: i Put: elems at: start + i ].
                clearFrom: (start max: size) UpTo: (start + size).
                start: 0.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'sequence' -> () From: ( | {
         'Category: private utilities\x7fModuleInfo: Module: sequence InitialContents: FollowSlot\x7fVisibility: private'
        
         makeSpaceAtStart: space = ( |
            | 
            "Make room for the given number of new elements to be
             added to the start of this sequence. Current contents of
             elems are shifted to the end if necessary, based
             on the expectation that a typical client will add new
             elements to the same end of the sequence repeately."

            desiredMinCapacity: size + space.
            space > start ifTrue: [| newStart. j |
                "slide elem contents to the end to make room"
                newStart: elems size - size.
                j: elems size - 1.
                ((start + size) - 1) downTo: start Do: [| :i |
                    elems at: j Put: elems at: i.
                    j: j - 1.
                ].
                clearFrom: start UpTo: ((start + size) min: newStart).
                start: newStart.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'sequence' -> () From: ( | {
         'Category: transforming\x7fModuleInfo: Module: sequence InitialContents: FollowSlot\x7fVisibility: public'
        
         mapBy: mapBlock = ( |
             i <- 0.
            | 
            "Optimizes away the overhead of checking keys in at:."

            i: start.
            firstKey to: lastKey Do: [|:k|
                elems at: i Put: (mapBlock value: (elems at: i) With: k).
                i: 1 + i.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'sequence' -> () From: ( | {
         'Category: sorting\x7fModuleInfo: Module: sequence InitialContents: FollowSlot\x7fVisibility: public'
        
         mergeSortFirst: k Count: n By: cmp = ( |
            | 
            (firstKey <= k) && [k <= lastKey] ifFalse: [
                error: 'bad start index to mergeSortFirst:Count:By:'.
            ].
            n > (size - (k - firstKey)) ifTrue: [
                error: 'bad count to mergeSortFirst:Count:By:'.
            ].
            elems mergeSortFirst: start + (k - firstKey) Count: n By: cmp.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'sequence' -> () From: ( | {
         'ModuleInfo: Module: sequence InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'mutableIndexable' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'sequence' -> () From: ( | {
         'Category: removing\x7fModuleInfo: Module: sequence InitialContents: FollowSlot\x7fVisibility: public'
        
         remove: el = ( |
            | 
            remove: el IfAbsent: [ error: el printString, ' is absent' ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'sequence' -> () From: ( | {
         'Category: removing\x7fModuleInfo: Module: sequence InitialContents: FollowSlot\x7fVisibility: public'
        
         remove: el IfAbsent: b = ( |
            | 
            do: [| :v. :k | el = v ifTrue: [ removeKey: k. ^self ]].
            b value: el).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'sequence' -> () From: ( | {
         'Category: removing\x7fModuleInfo: Module: sequence InitialContents: FollowSlot\x7fVisibility: public'
        
         removeAll = ( |
            | 
            "Details: The start index is set to zero. For clients that
             always add at the end, this is the right thing. For clients
             that always add at the beginning, the first add will fix
             things up."

            clearFrom: start UpTo: start + size.
            start: 0.
            size:  0.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'sequence' -> () From: ( | {
         'Category: removing\x7fModuleInfo: Module: sequence InitialContents: FollowSlot\x7fVisibility: public'
        
         removeFirst = ( |
             el.
            | 
            0 = size ifTrue: [error: 'removing from an empty sequence'].
            el: (elems at: start).
            elems at: start Put: nil.
            start: start + 1.
            size:  size - 1. 
            el).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'sequence' -> () From: ( | {
         'Category: removing\x7fModuleInfo: Module: sequence InitialContents: FollowSlot\x7fVisibility: public'
        
         removeKey: k = ( |
            | 
            removeKey: k IfAbsent: [ error: k printString, ' is absent' ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'sequence' -> () From: ( | {
         'Category: removing\x7fModuleInfo: Module: sequence InitialContents: FollowSlot\x7fVisibility: public'
        
         removeKey: k IfAbsent: b = ( |
             last.
            | 
            (firstKey <= k) && [k <= lastKey] ifFalse: [ ^b value: k ].
            last: (start + size) - 1.
            shiftElemsFrom: 1 + (start + (k - firstKey)) Through: last By: -1.
            elems at: last Put: nil.
            size: size - 1.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'sequence' -> () From: ( | {
         'Category: removing\x7fModuleInfo: Module: sequence InitialContents: FollowSlot\x7fVisibility: public'
        
         removeKeysFrom: k1 To: k2 = ( |
            | 
            removeKeysFrom: k1 To: k2 IfAbsent:
                [ error: 'bad key range for removeKeys ',
                      k1 printString, '...', k2 printString ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'sequence' -> () From: ( | {
         'Category: removing\x7fModuleInfo: Module: sequence InitialContents: FollowSlot\x7fVisibility: public'
        
         removeKeysFrom: k1 To: k2 IfAbsent: b = ( |
             n.
             newSize.
            | 
            (firstKey <= k1) && [(k1 <= k2) && [k2 <= lastKey]]
                ifFalse: [ ^b value ].
            n: 1 + (k2 - k1).
            newSize: size - n.
            shiftElemsFrom: 1 + (start + (k2 - firstKey))
                Through: (start + size) - 1
                By: n negate.
            clearFrom: start + newSize UpTo: start + size.
            size: newSize.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'sequence' -> () From: ( | {
         'Category: removing\x7fModuleInfo: Module: sequence InitialContents: FollowSlot\x7fVisibility: public'
        
         removeLast = ( |
             el.
             i.
             s <- 0.
            | 
            s: size.
            0 = s ifTrue: [error: 'removing from an empty sequence'].
            i: (start + s) - 1.
            el: (elems at: i).
            elems at: i Put: nil.
            size: s - 1. 
            el).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'sequence' -> () From: ( | {
         'Category: private utilities\x7fModuleInfo: Module: sequence InitialContents: FollowSlot\x7fVisibility: private'
        
         shiftElemsFrom: startIndex Through: endIndex By: offset = ( |
            | 
            "Shift the given subrange of the elems vector by the
             given number of positions. A positive offset shifts
             right; a negative one shifts left."

            0 = offset ifTrue: [ ^self ].
            0 < offset ifTrue: [ "shift right"
                endIndex downTo: startIndex Do: [| :i |
                    elems at: (i + offset) Put: (elems at: i).
                ].
            ] False: [ "shift left"
                startIndex to: endIndex Do: [| :i |
                    elems at: (i + offset) Put: (elems at: i).
                ].
            ].
            self).
        } | ) 



 '-- Side effects'

 globals modules sequence postFileIn
