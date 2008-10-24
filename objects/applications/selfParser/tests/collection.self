 'Sun-$Revision: 30.8 $'
 '
Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'defaultBehavior' -> () From: ( | {
         'Category: printing\x7fComment: Used only for collections.
See printStringSize:Depth: in traits collection
-- dmu\x7fModuleInfo: Module: collection InitialContents: FollowSlot\x7fVisibility: private'
        
         printStringSize: s Depth: d = ( |
            | printStringSize: s).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: collection InitialContents: FollowSlot'
        
         collection = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'collection' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'comment' From:
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'collection' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules collection.

CopyDowns:
globals modules init. copy 
SlotsToOmit: comment directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'collection' -> () From: ( | {
         'ModuleInfo: Module: collection InitialContents: FollowSlot\x7fVisibility: private'
        
         myComment <- ' \'\'
            \" A minimalist collection subsystem.  dmu 2/90\"'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'collection' -> () From: ( | {
         'ModuleInfo: Module: collection InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'core'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'collection' -> () From: ( | {
         'ModuleInfo: Module: collection InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'collection' -> () From: ( | {
         'ModuleInfo: Module: collection InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- 'Sun-$Revision: 30.8 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'collection' -> () From: ( | {
         'ModuleInfo: Module: collection InitialContents: FollowSlot\x7fVisibility: public'
        
         subpartNames <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: collections\x7fModuleInfo: Module: collection InitialContents: FollowSlot\x7fVisibility: public'
        
         collection = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'collection' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits collection.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'collection' -> () From: ( | {
         'Category: concatenating\x7fModuleInfo: Module: collection InitialContents: FollowSlot\x7fVisibility: public'
        
         , c = ( |
            | 
            "Returns the concatenation of this collection with c,
             a collection like the receiver consisting of all the
             elements of the receiver followed by all the elements of
             the argument collection. If the argument is an unordered
             collection such as a set, its arguments are appended in
             enumeration order. If the receiver is unordered, then
             the result is also unordered. Consider using & and
             flatXXX when concatenating more than 50 collections;
             see collector.self for details."

            (copyRemoveAll addAll: self) addAll: c).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'collection' -> () From: ( | {
         'Category: comparing\x7fModuleInfo: Module: collection InitialContents: FollowSlot\x7fVisibility: public'
        
         < c = ( |
            | 
            == c  ifTrue:  [^ false ].
            with: c Do: [|:e1. :e2|  e1 = e2 ifFalse: [^ e1 < e2]].
            size < c size).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'collection' -> () From: ( | {
         'Category: comparing\x7fModuleInfo: Module: collection InitialContents: FollowSlot\x7fVisibility: public'
        
         = c = ( |
            | 
            == c ifTrue:  [^ true ].
            c equalsCollection: self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'collection' -> () From: ( | {
         'Category: adding\x7fModuleInfo: Module: collection InitialContents: FollowSlot\x7fVisibility: public'
        
         add: v WithKey: k = ( |
            | at: k Put: v).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'collection' -> () From: ( | {
         'Category: adding\x7fModuleInfo: Module: collection InitialContents: FollowSlot\x7fVisibility: public'
        
         addAll: c = ( |
            | c do: [ |:v. :k| add: v WithKey: k ]. self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'collection' -> () From: ( | {
         'ModuleInfo: Module: collection InitialContents: FollowSlot\x7fVisibility: private'
        
         areKeysOrdered = bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'collection' -> () From: ( | {
         'Category: transforming\x7fModuleInfo: Module: collection InitialContents: FollowSlot\x7fVisibility: public'
        
         asByteVector = ( |
            | 
            byteVector copyContaining: self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'collection' -> () From: ( | {
         'Category: transforming\x7fModuleInfo: Module: collection InitialContents: FollowSlot\x7fVisibility: public'
        
         asDictionary = ( |
            | 
            dictionary copyContaining: self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'collection' -> () From: ( | {
         'Category: transforming\x7fModuleInfo: Module: collection InitialContents: FollowSlot\x7fVisibility: public'
        
         asList = ( |
            | 
            list copyContaining: self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'collection' -> () From: ( | {
         'Category: transforming\x7fModuleInfo: Module: collection InitialContents: FollowSlot\x7fVisibility: public'
        
         asSequence = ( |
            | 
            sequence copyContaining: self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'collection' -> () From: ( | {
         'Category: transforming\x7fModuleInfo: Module: collection InitialContents: FollowSlot\x7fVisibility: public'
        
         asSet = ( |
            | 
            set copyContaining: self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'collection' -> () From: ( | {
         'Category: transforming\x7fModuleInfo: Module: collection InitialContents: FollowSlot\x7fVisibility: public'
        
         asString = ( |
            | 
            mutableString copyContaining: self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'collection' -> () From: ( | {
         'Category: transforming\x7fModuleInfo: Module: collection InitialContents: FollowSlot\x7fVisibility: public'
        
         asTreeBag = ( |
            | 
            treeBag copyContaining: self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'collection' -> () From: ( | {
         'Category: transforming\x7fModuleInfo: Module: collection InitialContents: FollowSlot\x7fVisibility: public'
        
         asTreeSet = ( |
            | 
            treeSet copyContaining: self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'collection' -> () From: ( | {
         'Category: transforming\x7fModuleInfo: Module: collection InitialContents: FollowSlot\x7fVisibility: public'
        
         asVMByteVector = ( |
            | asByteVector).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'collection' -> () From: ( | {
         'Category: transforming\x7fModuleInfo: Module: collection InitialContents: FollowSlot\x7fVisibility: public'
        
         asVector = ( |
            | 
            vector copyContaining: self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'collection' -> () From: ( | {
         'Category: sorting\x7fModuleInfo: Module: collection InitialContents: FollowSlot\x7fVisibility: public'
        
         ascendingOrder = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'collection' -> 'ascendingOrder' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits collection ascendingOrder.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'collection' -> 'ascendingOrder' -> () From: ( | {
         'ModuleInfo: Module: collection InitialContents: FollowSlot'
        
         element: e1 Precedes: e2 = ( |
            | e1 < e2).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'collection' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: collection InitialContents: FollowSlot\x7fVisibility: public'
        
         at: k = ( |
            | at: k
            IfAbsent: [ error: k printString, ' is absent']).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'collection' -> () From: ( | {
         'Category: printing\x7fModuleInfo: Module: collection InitialContents: FollowSlot\x7fVisibility: private'
        
         buildStringWith: block = ( | {
                 'ModuleInfo: Module: collection InitialContents: FollowSlot'
                
                 str.
                } 
            | 
            "build string element-by-element using a client-supplied
             block with args:
                1. current element
                2. current key
                3. collector for string constructed so far"

            str: collectionName & leftBracket.
            doFirst: [ | :e. :k |
                str: str & (block value: e With: k With: str) ]
              MiddleLast: [ | :e. :k. |
                str: str & separator & (block value: e With: k With: str) ]
              IfEmpty: [].
            str & rightBracket).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'collection' -> () From: ( | {
         'Category: printing\x7fModuleInfo: Module: collection InitialContents: FollowSlot\x7fVisibility: public'
        
         collectionName = ( |
            | 
            "Return a name for this type of collection.
             In order for storeStringIfFail: to work (used for filing out),
             this name needs to be the same as the name of the prototype.
             --dmu 4/93.
             NB: the constraint may (!) no longer be required, Ole 2/94."
            error: 'child should implement ',
                   '(see method comment in traits collection)').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'collection' -> () From: ( | {
         'Category: printing\x7fModuleInfo: Module: collection InitialContents: FollowSlot\x7fVisibility: public'
        
         comment1 = ( |
            | 
            'Objects that print should understand the four messages printString,
            printStringSize:, printStringDepth:, and printStringSize:Depth:.
            Children of traits collection may simply implement 
            printStringSize:Depth: and inherit reasonable behavior from here.

            To get the UI to print an object, its prototype (not traits) should
            be annotated with isComplete = true.
            See nameSize: in traits mirror to understand how this works.').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'collection' -> () From: ( | {
         'Category: sorting\x7fModuleInfo: Module: collection InitialContents: FollowSlot\x7fVisibility: public'
        
         comment2 = ( |
            | 
            'Any ordered collection can be copySorted (via heapsort).

            The sort methods supplied here return a collection of the same
            type as the receiver. If the receiver is an unordered collection
            such as a set, the result will also be unordered, which is not
            very useful. Typically, one uses "mySet asVector sort" in this
            situation.

            Note:  Heapsort is known as an "unstable" sort. That is, if you
            sorted a collection of addressBookEntry objects first by name,
            and then state, the second sort would not preserve the by-name
            ordering within each state. For these situations, it is best
            to convert the collection into a vector or sequence and sort
            that, since indexable collections are sorted using mergeSort,
            which is a stable sort.').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'collection' -> () From: ( | {
         'Category: comparing\x7fModuleInfo: Module: collection InitialContents: FollowSlot\x7fVisibility: public'
        
         compare: c IfLess: lb Equal: eb Greater: gb = ( |
            | 
             == c ifTrue: [ ^ eb value ]. "optimization"
            with: c Do: [ |:v1. :v2|
                v1 = v2 ifFalse: [ ^ v1 < v2 ifTrue: lb False: gb ].
            ].
            size compare: c size IfLess: lb Equal: eb Greater: gb).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'collection' -> () From: ( | {
         'Category: printing\x7fModuleInfo: Module: collection InitialContents: FollowSlot\x7fVisibility: private'
        
         continued = ' ...}'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'collection' -> () From: ( | {
         'Category: copying\x7fModuleInfo: Module: collection InitialContents: FollowSlot\x7fVisibility: public'
        
         copyContaining: c = ( |
            | copyRemoveAll addAll: c).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'collection' -> () From: ( | {
         'Category: transforming\x7fModuleInfo: Module: collection InitialContents: FollowSlot\x7fVisibility: public'
        
         copyFilteredBy: eb = ( |
            | filterBy: eb Into: copyRemoveAll).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'collection' -> () From: ( | {
         'Category: transforming\x7fModuleInfo: Module: collection InitialContents: FollowSlot\x7fVisibility: public'
        
         copyMappedBy: eb = ( |
            | copy mapBy: eb).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'collection' -> () From: ( | {
         'Category: sorting\x7fModuleInfo: Module: collection InitialContents: FollowSlot\x7fVisibility: public'
        
         copySort = ( |
            | 
            copySortBy: ascendingOrder).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'collection' -> () From: ( | {
         'Category: sorting\x7fModuleInfo: Module: collection InitialContents: FollowSlot\x7fVisibility: public'
        
         copySortBy: cmp = ( | {
                 'ModuleInfo: Module: collection InitialContents: FollowSlot'
                
                 result.
                } 
            | 
            result: copyRemoveAll.
            sortedBy: cmp Do: [| :el | result add: el].
            result).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'collection' -> () From: ( | {
         'Category: reducing\x7fModuleInfo: Module: collection InitialContents: FollowSlot\x7fVisibility: public'
        
         countHowMany: testBlock = ( |
             r <- 0.
            | 
            "count how many items make testBlock evaluate to true"
            do: [|:e. :i| (testBlock value: e With: i) ifTrue: [r: r succ]].
            r).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'collection' -> () From: ( | {
         'Category: printing\x7fModuleInfo: Module: collection InitialContents: FollowSlot\x7fVisibility: private'
        
         defaultPrintSize = 400.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'collection' -> () From: ( | {
         'ModuleInfo: Module: collection InitialContents: FollowSlot\x7fVisibility: private'
        
         descendantResponsibilities = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'collection' -> 'descendantResponsibilities' -> () From: ( |
             {} = 'Comment: The following methods must be implemented by a descendant.\x7fModuleInfo: Creator: traits collection descendantResponsibilities.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'collection' -> 'descendantResponsibilities' -> () From: ( | {
         'ModuleInfo: Module: collection InitialContents: FollowSlot\x7fVisibility: public'
        
         at: k IfAbsent: b = ( |
            | 
            'Return the value at the given key. Evaluate the block
             b if there is no value associated with the given key.').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'collection' -> 'descendantResponsibilities' -> () From: ( | {
         'ModuleInfo: Module: collection InitialContents: FollowSlot\x7fVisibility: public'
        
         at: k Put: v = ( |
            | 'Insert the given value at the given key.').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'collection' -> 'descendantResponsibilities' -> () From: ( | {
         'ModuleInfo: Module: collection InitialContents: FollowSlot\x7fVisibility: public'
        
         copy = ( |
            | 'Return a copy of the receiver.').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'collection' -> 'descendantResponsibilities' -> () From: ( | {
         'ModuleInfo: Module: collection InitialContents: FollowSlot\x7fVisibility: public'
        
         copyRemoveAll = ( |
            | 'Return an empty copy of the receiver.').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'collection' -> 'descendantResponsibilities' -> () From: ( | {
         'ModuleInfo: Module: collection InitialContents: FollowSlot\x7fVisibility: public'
        
         do: b = ( |
            | 
            'Evaluate the given block for each element. The first
             argument passed to the block is the key, the second is
             the value. If desired, doFirst:MiddleLast:IfEmpty: can
             be implemented instead of do:.').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'collection' -> 'descendantResponsibilities' -> () From: ( | {
         'ModuleInfo: Module: collection InitialContents: FollowSlot\x7fVisibility: public'
        
         prototype = ( |
            | 
            'Return the prototype for this collection.
             This is used for filing out (via storeStringIfFail:)
             and for printing out the names of collections.
             --dmu 4/93').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'collection' -> () From: ( | {
         'Category: iterating\x7fModuleInfo: Module: collection InitialContents: FollowSlot\x7fVisibility: public'
        
         do: b = ( |
            | doFirst: b MiddleLast: b IfEmpty: self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'collection' -> () From: ( | {
         'Category: iteratingWithEnds\x7fModuleInfo: Module: collection InitialContents: FollowSlot\x7fVisibility: public'
        
         doFirst: f Middle: m Last: lst IfEmpty: e = ( | {
                 'ModuleInfo: Module: collection InitialContents: FollowSlot'
                
                 i <- 0.
                }  {
                 'ModuleInfo: Module: collection InitialContents: FollowSlot'
                
                 pk.
                }  {
                 'ModuleInfo: Module: collection InitialContents: FollowSlot'
                
                 pv.
                } 
            | 
            do: [|:v. :k|
                0 = i ifTrue: [ i: 1 ] False: [
                    ( 1 = i ifTrue: [i: 2.  f  ] False: [ m ] )
                      value: pv With: pk.
                ].
                pv: v.  pk: k.
            ].
            0 = i ifTrue: [^ e value].
            (1 = i ifTrue: [f] False: [lst]) value: pv With: pk.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'collection' -> () From: ( | {
         'Category: iteratingWithEnds\x7fModuleInfo: Module: collection InitialContents: FollowSlot\x7fVisibility: public'
        
         doFirst: f MiddleLast: ml = ( |
            | 
            doFirst: f Middle: ml Last: ml IfEmpty: []).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'collection' -> () From: ( | {
         'Category: iteratingWithEnds\x7fModuleInfo: Module: collection InitialContents: FollowSlot\x7fVisibility: public'
        
         doFirst: f MiddleLast: ml IfEmpty: e = ( |
            | 
            doFirst: f Middle: ml Last: ml IfEmpty: e).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'collection' -> () From: ( | {
         'Category: iteratingWithEnds\x7fModuleInfo: Module: collection InitialContents: FollowSlot\x7fVisibility: public'
        
         doFirstLast: fl Middle: m = ( |
            | 
            doFirst: fl Middle: m Last: fl IfEmpty: []).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'collection' -> () From: ( | {
         'Category: iteratingWithEnds\x7fModuleInfo: Module: collection InitialContents: FollowSlot\x7fVisibility: public'
        
         doFirstLast: fl Middle: m IfEmpty: e = ( |
            | 
            doFirst: fl Middle: m Last: fl IfEmpty: e).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'collection' -> () From: ( | {
         'Category: iteratingWithEnds\x7fModuleInfo: Module: collection InitialContents: FollowSlot\x7fVisibility: public'
        
         doFirstMiddle: fm Last: lst = ( |
            | 
            doFirst: fm Middle: fm Last: lst IfEmpty: []).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'collection' -> () From: ( | {
         'Category: iteratingWithEnds\x7fModuleInfo: Module: collection InitialContents: FollowSlot\x7fVisibility: public'
        
         doFirstMiddle: fm Last: lst IfEmpty: e = ( |
            | 
            doFirst: fm Middle: fm Last: lst IfEmpty: e).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'collection' -> () From: ( | {
         'Category: comparing\x7fModuleInfo: Module: collection InitialContents: FollowSlot\x7fVisibility: private'
        
         equalsCollection: c = ( |
            | 
            size = c size  ifFalse: [^ false].
            with: c Do: [|:e1. :e2|  e1 = e2 ifFalse: [^ false]].
            true).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'collection' -> () From: ( | {
         'Category: transforming\x7fModuleInfo: Module: collection InitialContents: FollowSlot\x7fVisibility: public'
        
         filterBy: eb Into: c = ( |
            | 
            do: [|:v. :k| (eb value: v With: k) ifTrue: [c add: v WithKey: k]].
            c).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'collection' -> () From: ( | {
         'Category: searching\x7fComment: Evaluate eb for each element and index.
If true is returned, evaluate fb with the element and index,
and return the result.  Raise an error if no element returns
true.\x7fModuleInfo: Module: collection InitialContents: FollowSlot\x7fVisibility: public'
        
         findFirst: eb IfPresent: fb = ( |
            | 
            findFirst: eb IfPresent: fb IfAbsent: []).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'collection' -> () From: ( | {
         'Category: searching\x7fComment: Evaluate eb for each element and index.
If true is returned, evaluate fb with the element and index,
and return the result.  Otherwise, evaluate `fail\' and return
the result.\x7fModuleInfo: Module: collection InitialContents: FollowSlot\x7fVisibility: public'
        
         findFirst: eb IfPresent: fb IfAbsent: fail = ( |
            | 
            do: [|:v. :k|
                (eb value: v With: k) ifTrue: [^fb value: v With: k].
            ].
            fail value).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'collection' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: collection InitialContents: FollowSlot\x7fVisibility: public'
        
         first = ( |
            | 
               doFirst: [ | :e | ^ e ]
            MiddleLast: [ error: 'should not get here' ]
               IfEmpty: [ error: 'empty collection' ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'collection' -> () From: ( | {
         'Category: comparing\x7fModuleInfo: Module: collection InitialContents: FollowSlot\x7fVisibility: public'
        
         hash = ( | {
                 'ModuleInfo: Module: collection InitialContents: FollowSlot'
                
                 h <- 0.
                } 
            | 
            do: [|:e| h: h ^^ e hash].
            h).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'collection' -> () From: ( | {
         'Category: searching\x7fModuleInfo: Module: collection InitialContents: FollowSlot\x7fVisibility: public'
        
         includes: v = ( |
            | 
            "Subtle, but important: it says v = e, not e = v.
             The argument is in control, not the elements!
             You can depend on it! -- dmu"
            findFirst: [|:e| v = e] IfPresent: true IfAbsent: false).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'collection' -> () From: ( | {
         'Category: setLikeOperations\x7fModuleInfo: Module: collection InitialContents: FollowSlot\x7fVisibility: public'
        
         includesAll: c = ( |
            | "subset"
            c do: [ | :v |
                (includes: v) ifFalse: [ ^ false ].
            ].
            true).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'collection' -> () From: ( | {
         'Category: setLikeOperations\x7fModuleInfo: Module: collection InitialContents: FollowSlot\x7fVisibility: public'
        
         intersect: c = ( | {
                 'ModuleInfo: Module: collection InitialContents: FollowSlot'
                
                 r.
                } 
            | 
            r: copy.
            do: [ | :v |
                (c includes: v) ifFalse: [ r remove: v ].
            ].
            r).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'collection' -> () From: ( | {
         'Category: sizing\x7fModuleInfo: Module: collection InitialContents: FollowSlot\x7fVisibility: public'
        
         isEmpty = ( |
            | 0 = size).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'collection' -> () From: ( | {
         'Category: comparing\x7fComment: is self a prefix of c?\x7fModuleInfo: Module: collection InitialContents: FollowSlot\x7fVisibility: public'
        
         isPrefixOf: c = ( |
            | 
            with: c Do: [ | :prefixElem.  :testElem.  |
                prefixElem = testElem ifFalse: [^false].
            ].
            size  <=  c size).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'collection' -> () From: ( | {
         'Category: comparing\x7fComment: is self a suffix of c?\x7fModuleInfo: Module: collection InitialContents: FollowSlot\x7fVisibility: public'
        
         isSuffixOf: c = ( |
            | 
            with: c ReverseDo: [ | :suffixElem.  :testElem.  |
                suffixElem = testElem ifFalse: [^false].
            ].
            size  <=  c size).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'collection' -> () From: ( | {
         'Category: searching\x7fComment: Return the key of elem -- Mario, 4/11/95\x7fModuleInfo: Module: collection InitialContents: FollowSlot\x7fVisibility: public'
        
         keyOf: elem = ( |
            | 
            keyOf: elem IfAbsent: raiseError).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'collection' -> () From: ( | {
         'Category: searching\x7fModuleInfo: Module: collection InitialContents: FollowSlot\x7fVisibility: public'
        
         keyOf: elem IfAbsent: ab = ( |
            | 
            "Subtle, but important: it says elem = v, not v = elem.
             The argument is in control, not the elements!
             You can depend on it!"
            findFirst: [| :v | elem = v] IfPresent: [| :v. :k. | k] IfAbsent: ab).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'collection' -> () From: ( | {
         'ModuleInfo: Module: collection InitialContents: FollowSlot\x7fVisibility: public'
        
         keyedStoreStringIfFail: fb = ( |
             atPuts.
             r.
            | 
            size > 20 ifTrue: [^ fb value: 'too big'].
            "first collect a series of  ... Put: ..., then sort them
             to get a fixpoint"

            atPuts: list copyRemoveAll.
            do: [|:v. :k|
                atPuts addLast:
                    ( k storeStringIfFail: [|:e| ^ fb value: e] ),
                    ')',
                    ' Put: (',
                    ( v storeStringIfFail: [|:e| ^ fb value: e] ),
                    ')'
            ].
            atPuts: atPuts asVector.
            areKeysOrdered ifFalse: [ atPuts: atPuts copySort].

            "need a paren for 2nd to nth elems"
            r: collector copyFirst: '' "ugh!".
            (size pred max: 0) do: [r: r & '('].
            r: r & collectionName &  ' copyRemoveAll'.
            atPuts do: [| :s. :i. | 
                r: r & ' at: (' & s & (i = atPuts lastKey ifFalse: ')' True: '' ).
            ].
            r flatString).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'collection' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: collection InitialContents: FollowSlot\x7fVisibility: public'
        
         keys = ( | {
                 'ModuleInfo: Module: collection InitialContents: FollowSlot'
                
                 r.
                } 
            | 
            r: list copyRemoveAll.
            do: [|:e. :k| r addLast: k].
            r).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'collection' -> () From: ( | {
         'Category: printing\x7fModuleInfo: Module: collection InitialContents: FollowSlot\x7fVisibility: private'
        
         leftBracket = '{'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'collection' -> () From: ( | {
         'Category: transforming\x7fModuleInfo: Module: collection InitialContents: FollowSlot\x7fVisibility: public'
        
         mapBy: eb = ( |
            | mapBy: eb Into: self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'collection' -> () From: ( | {
         'Category: transforming\x7fModuleInfo: Module: collection InitialContents: FollowSlot\x7fVisibility: public'
        
         mapBy: eb Into: c = ( |
            | 
            do: [|:v. :k| c add: (eb value: v With: k) WithKey: k].
            c).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'collection' -> () From: ( | {
         'Category: reducing\x7fModuleInfo: Module: collection InitialContents: FollowSlot\x7fVisibility: public'
        
         max = ( |
            | reduceWith: [|:e1. :e2| e1 max: e2] IfSingleton: [|:e| e ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'collection' -> () From: ( | {
         'Category: reducing\x7fModuleInfo: Module: collection InitialContents: FollowSlot\x7fVisibility: public'
        
         mean = ( |
            | sum /~ size).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'collection' -> () From: ( | {
         'Category: reducing\x7fModuleInfo: Module: collection InitialContents: FollowSlot\x7fVisibility: public'
        
         min = ( |
            | reduceWith: [|:e1. :e2| e1 min: e2] IfSingleton: [|:e| e ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'collection' -> () From: ( | {
         'Category: printing\x7fModuleInfo: Module: collection InitialContents: FollowSlot\x7fVisibility: private'
        
         minContentsSize = 2.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'collection' -> () From: ( | {
         'Category: printing\x7fModuleInfo: Module: collection InitialContents: FollowSlot\x7fVisibility: private'
        
         minElSize = 15.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'collection' -> () From: ( | {
         'Category: sizing\x7fModuleInfo: Module: collection InitialContents: FollowSlot\x7fVisibility: public'
        
         nonEmpty = ( |
            | isEmpty not).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'collection' -> () From: ( | {
         'Category: searching\x7fModuleInfo: Module: collection InitialContents: FollowSlot\x7fVisibility: public'
        
         occurrencesOf: v = ( | {
                 'ModuleInfo: Module: collection InitialContents: FollowSlot'
                
                 i <- 0.
                } 
            | 
            do: [|:e| v = e ifTrue: [i: i succ]].
            i).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'collection' -> () From: ( | {
         'ModuleInfo: Module: collection InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'orderedClonable' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'collection' -> () From: ( | {
         'Category: printing\x7fComment: Most collections don\'t print keys...\x7fModuleInfo: Module: collection InitialContents: FollowSlot\x7fVisibility: private'
        
         printStringKey: k = ( |
            | '').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'collection' -> () From: ( | {
         'Category: printing\x7fComment: No longer a general method.
Use this only for collections, and only
for collections of concrete objects.
-- dmu\x7fModuleInfo: Module: collection InitialContents: FollowSlot\x7fVisibility: public'
        
         printStringSize: smax Depth: dmax = ( |
             r.
             sizePerEl.
             totalSubSize.
            | 
            (dmax <= 0) ||
            ((collectionName size +
              leftBracket size + continued size +
              minContentsSize) >= smax) ifTrue: [
                ^ collectionName copyAtMostWithEllipsis: smax.
            ].
            size = 0 ifTrue: [ ^ collectionName, leftBracket, rightBracket ].

            totalSubSize: smax -
                (size * separator size) - collectionName size -
                leftBracket size - rightBracket size.
            sizePerEl: totalSubSize / size max: minElSize.
            r: buildStringWith: [ | :e. :k. :oldStr. elString. newSize |
                elString:
                    (printStringKey: k) &
                    (e printStringSize: sizePerEl Depth: dmax pred).
                newSize:
                    oldStr flatSizeHint + separator size +
                    elString flatSizeHint + continued size.
                newSize > smax ifTrue: [ ^ (oldStr & continued) flatString ].
                elString].
            r flatString).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'collection' -> () From: ( | {
         'Category: reducing\x7fModuleInfo: Module: collection InitialContents: FollowSlot\x7fVisibility: public'
        
         product = ( |
            | 
            reduceWith: [|:e1. :e2| e1 * e2] IfSingleton: [|:e| e] IfEmpty: 1).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'collection' -> () From: ( | {
         'Category: reducing\x7fModuleInfo: Module: collection InitialContents: FollowSlot\x7fVisibility: public'
        
         reduceWith: b = ( |
            | 
            reduceWith: b IfSingleton: [ error: 'singleton!' ]
                              IfEmpty: [ error: 'I am empty!' ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'collection' -> () From: ( | {
         'Category: reducing\x7fModuleInfo: Module: collection InitialContents: FollowSlot\x7fVisibility: public'
        
         reduceWith: b IfSingleton: sb = ( |
            | 
            reduceWith: b IfSingleton: sb IfEmpty: [ error: 'I am empty!' ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'collection' -> () From: ( | {
         'Category: reducing\x7fModuleInfo: Module: collection InitialContents: FollowSlot\x7fVisibility: public'
        
         reduceWith: b IfSingleton: sb IfEmpty: mt = ( | {
                 'ModuleInfo: Module: collection InitialContents: FollowSlot'
                
                 r.
                } 
            | 
            size = 1 ifTrue: [ ^ sb value: first ].
            doFirst: [|:e| r: e]
              MiddleLast: [|:e| r: b value: r With: e]
              IfEmpty: [r: mt value].
            r).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'collection' -> () From: ( | {
         'Category: removing\x7fModuleInfo: Module: collection InitialContents: FollowSlot\x7fVisibility: public'
        
         remove: x = ( |
            | 
            remove: x IfAbsent: [ error: x printString, ' is absent' ]. self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'collection' -> () From: ( | {
         'Category: removing\x7fModuleInfo: Module: collection InitialContents: FollowSlot\x7fVisibility: public'
        
         removeAll: aCollection = ( |
            | 
            aCollection do: [|:e| remove: e].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'collection' -> () From: ( | {
         'Category: printing\x7fModuleInfo: Module: collection InitialContents: FollowSlot\x7fVisibility: private'
        
         rightBracket = '}'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'collection' -> () From: ( | {
         'Category: printing\x7fModuleInfo: Module: collection InitialContents: FollowSlot\x7fVisibility: private'
        
         separator = ', '.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'collection' -> () From: ( | {
         'Category: sizing\x7fModuleInfo: Module: collection InitialContents: FollowSlot\x7fVisibility: public'
        
         size = ( | {
                 'ModuleInfo: Module: collection InitialContents: FollowSlot'
                
                 i <- 0.
                } 
            | 
            do: [i: i succ].
            i).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'collection' -> () From: ( | {
         'Category: sorting\x7fModuleInfo: Module: collection InitialContents: FollowSlot\x7fVisibility: public'
        
         sortedBy: cmp Do: b = ( | {
                 'ModuleInfo: Module: collection InitialContents: FollowSlot'
                
                 queue.
                } 
            | 
            queue: priorityQueue copyRemoveAll.
            queue sorter: cmp.
            do: [| :el | queue add: el].
            [queue isEmpty] whileFalse: [b value: queue removeFirst].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'collection' -> () From: ( | {
         'Category: sorting\x7fModuleInfo: Module: collection InitialContents: FollowSlot\x7fVisibility: public'
        
         sortedDo: b = ( |
            | sortedBy: ascendingOrder Do: b).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'collection' -> () From: ( | {
         'Category: printing\x7fModuleInfo: Module: collection InitialContents: FollowSlot\x7fVisibility: public'
        
         statePrintString = ( |
            | 
            size <= 7  ifTrue: [ statePrintStringOfElements ] False: [statePrintStringOfSize ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'collection' -> () From: ( | {
         'Category: printing\x7fModuleInfo: Module: collection InitialContents: FollowSlot\x7fVisibility: private'
        
         statePrintStringOfElements = ( |
             r <- ''.
            | 
                         "safe name prevents loops if collection contains itself"

                        doFirst:      [|:e| r: r &      (reflect: e) safeName]
                          MiddleLast: [|:e| r: r & ', ' & (reflect: e) safeName]
                          IfEmpty:    [ ^ '' ].

            r flatString).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'collection' -> () From: ( | {
         'Category: printing\x7fModuleInfo: Module: collection InitialContents: FollowSlot\x7fVisibility: private'
        
         statePrintStringOfSize = ( |
            | size printString, ' elements').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'collection' -> () From: ( | {
         'Category: printing\x7fModuleInfo: Module: collection InitialContents: FollowSlot\x7fVisibility: public'
        
         storeStringForUnkeyedCollectorIfFail: fb = ( | {
                 'ModuleInfo: Module: collection InitialContents: FollowSlot'
                
                 ss.
                } 
            | 
            "used by unkeyed collections to get a string for a (foo1 & foo2)"
            size > 50 ifTrue: [^ fb value: 'too big'].
            ss: copyMappedBy: [|:e| 
                '(', (e storeStringIfFail: [|:e| ^ fb value: e]), ')'.
            ].
            isOrdered ifFalse: [ ss: ss asVector sort ].
            ss reduceWith: [|:e1. :e2| e1, '\n\t& ', e2]
              IfSingleton: [|:e1| ^ 'collector copyFirst: ', e1]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'collection' -> () From: ( | {
         'Category: printing\x7fModuleInfo: Module: collection InitialContents: FollowSlot\x7fVisibility: public'
        
         storeStringIfFail: fb = ( |
            | 
            "used by file out to file out a nice string for empty collections"
            isEmpty  
                ifFalse: [ fb value: 'collection not empty'     ]
                   True: [ collectionName, ' ', 'copyRemoveAll' ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'collection' -> () From: ( | {
         'Category: printing\x7fModuleInfo: Module: collection InitialContents: FollowSlot\x7fVisibility: public'
        
         storeStringNeeds = ( |
            | prototype).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'collection' -> () From: ( | {
         'Category: reducing\x7fModuleInfo: Module: collection InitialContents: FollowSlot\x7fVisibility: public'
        
         sum = ( |
            | 
            reduceWith: [|:e1. :e2| e1 + e2] IfSingleton: [|:e| e] IfEmpty: 0).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'collection' -> () From: ( | {
         'Category: printing\x7fModuleInfo: Module: collection InitialContents: FollowSlot\x7fVisibility: public'
        
         unkeyedStoreStringIfFail: fb = ( |
            | 
            isEmpty ifTrue: [^ collectionName, ' ', 'copyRemoveAll'].
            '(',
                ( storeStringForUnkeyedCollectorIfFail: [|:e| ^ fb value: e] ),
             ') as', collectionName capitalize).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'collection' -> () From: ( | {
         'Category: iterating\x7fModuleInfo: Module: collection InitialContents: FollowSlot\x7fVisibility: public'
        
         with: c Do: b = ( |
            | 
            c withNonindexable: self Do: [|:v1. :v2. :k1. :k2|
                b value: v2 With: v1 With: k2 With: k1].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'collection' -> () From: ( | {
         'Category: iterating\x7fModuleInfo: Module: collection InitialContents: FollowSlot\x7fVisibility: private'
        
         withNonindexable: c Do: b = ( |
            | 
            error: 'cannot co-iterate these two collections'.
            self).
        } | ) 



 '-- Side effects'

 globals modules collection postFileIn
