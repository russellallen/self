 '30.24.0'
 '
Copyright 1992-2014 AUTHORS.
See the legal/LICENSE file for license information and legal/AUTHORS for authors.
'
["preFileIn" self] value


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: indexable InitialContents: FollowSlot'
        
         indexable = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'indexable' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'indexable' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules indexable.

CopyDowns:
globals modules init. copy 
SlotsToOmit: directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'indexable' -> () From: ( | {
         'ModuleInfo: Module: indexable InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'core'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'indexable' -> () From: ( | {
         'ModuleInfo: Module: indexable InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'indexable' -> () From: ( | {
         'ModuleInfo: Module: indexable InitialContents: FollowSlot'
        
         myComment <- 'Indexable collection operations.'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'indexable' -> () From: ( | {
         'ModuleInfo: Module: indexable InitialContents: InitializeToExpression: (\'30.24.0\')\x7fVisibility: public'
        
         revision <- '30.24.0'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'indexable' -> () From: ( | {
         'ModuleInfo: Module: indexable InitialContents: FollowSlot\x7fVisibility: private'
        
         subpartNames <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: core\x7fCategory: collections\x7fCategory: vectors\x7fModuleInfo: Module: indexable InitialContents: FollowSlot\x7fVisibility: public'
        
         indexable = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'indexable' -> () From: ( |
             {} = 'Comment: vector-like, but not necessarily writable\x7fModuleInfo: Creator: traits indexable.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'indexable' -> () From: ( | {
         'Category: tokenizing\x7fModuleInfo: Module: indexable InitialContents: FollowSlot'
        
         asTokensSeparatedByItemsSatisfying: aBlock = ( |
             result.
             token.
            | 
            result: list copyRemoveAll.
            token: copyRemoveAll.
            do: [|:c|
              (aBlock value: c) ifTrue: [
                 token isEmpty ifFalse: [result add: token. token: copyRemoveAll]
              ] False: [token: token, c ]
            ].
            token isEmpty ifFalse: [result add: token].
            result).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'indexable' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: indexable InitialContents: FollowSlot\x7fVisibility: public'
        
         at: k IfAbsent: b = ( |
            | 
            (firstKey <= k) && [k <= lastKey]
                ifTrue: [at: k] False: [b value: k]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'indexable' -> () From: ( | {
         'Category: copying\x7fModuleInfo: Module: indexable InitialContents: FollowSlot\x7fVisibility: public'
        
         copyAddFirst: x = ( |
             r.
             s <- 0.
            | 
            s: size.
            r: copySize: s succ.
            r copyRangeDstPos: 1 SrcArray: self SrcPos: 0 Len: s IfFail: [
                do: [|:v. :k| r at: k succ Put: v].
            ].
            r first: x.
            r).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'indexable' -> () From: ( | {
         'Category: copying\x7fModuleInfo: Module: indexable InitialContents: FollowSlot\x7fVisibility: public'
        
         copyAddLast: x = ( | {
                 'ModuleInfo: Module: indexable InitialContents: FollowSlot'
                
                 r.
                } 
            | 
            r: copySize: size succ.
            r last: x.
            r).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'indexable' -> () From: ( | {
         'Category: copying\x7fComment: copy at most n elements\x7fModuleInfo: Module: indexable InitialContents: FollowSlot\x7fVisibility: public'
        
         copyAtMost: n = ( |
            | 
            size <= n ifTrue: [^copy].
            copySize: n).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'indexable' -> () From: ( | {
         'Category: copying\x7fModuleInfo: Module: indexable InitialContents: FollowSlot\x7fVisibility: public'
        
         copyFrom: start = ( |
            | 
            "Copy elements in the range [start..lastKey]."
            copyFrom: start UpTo: lastKey succ).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'indexable' -> () From: ( | {
         'Category: copying\x7fModuleInfo: Module: indexable InitialContents: FollowSlot\x7fVisibility: public'
        
         copyFrom: start Size: n = ( |
            | 
            copyFrom: start UpTo: start + n).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'indexable' -> () From: ( | {
         'Category: copying\x7fModuleInfo: Module: indexable InitialContents: FollowSlot\x7fVisibility: public'
        
         copyFrom: start UpTo: stop = ( |
             r.
            | 
            "Copy elements in the range [start..stop-1]."
            r: copySize: stop - start.
            start = firstKey ifTrue: [^r]. "an optimization -- dmu 1/92"

            r copyRangeDstPos: 0 SrcArray: self SrcPos: start Len: stop - start IfFail: [
                stop - start do: [|:i| r at: i Put: at: i + start].
            ].
            r).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'indexable' -> () From: ( | {
         'Category: copying\x7fModuleInfo: Module: indexable InitialContents: FollowSlot\x7fVisibility: private'
        
         copyRangeDstPos: dstPos SrcArray: srcArray SrcPos: srcPos Len: len IfFail: errBlk = ( |
            | errBlk value).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'indexable' -> () From: ( | {
         'Category: copying\x7fModuleInfo: Module: indexable InitialContents: FollowSlot\x7fVisibility: public'
        
         copyRemoveAll = ( |
            | copySize: 0).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'indexable' -> () From: ( | {
         'Category: copying\x7fModuleInfo: Module: indexable InitialContents: FollowSlot\x7fVisibility: public'
        
         copySize: n = ( |
            | copySize: n FillingWith: filler).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'indexable' -> () From: ( | {
         'Category: copying\x7fModuleInfo: Module: indexable InitialContents: FollowSlot\x7fVisibility: public'
        
         copyWithoutFirst = ( |
             r.
             s <- 0.
            | 
            s: size.
            0 = s ifTrue: [^ copySize: 0].
            r: (copySize: s pred).
            r copyRangeDstPos: 0 SrcArray: self SrcPos: 1 Len: s - 1 IfFail: [
                r do: [|:v. :k| r at: k Put: at: k succ].
            ].
            r).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'indexable' -> () From: ( | {
         'Category: copying\x7fModuleInfo: Module: indexable InitialContents: FollowSlot\x7fVisibility: public'
        
         copyWithoutLast = ( |
            | 
            copySize: size pred).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'indexable' -> () From: ( | {
         'Category: copying\x7fComment: If p is a prefix of this object, return a copy of
this object with the prefix removed. Otherwise
just return a copy of this object. -- Adam & Alex, 4/04\x7fModuleInfo: Module: indexable InitialContents: FollowSlot\x7fVisibility: public'
        
         copyWithoutPrefix: p = ( |
            | 
            (p isPrefixOf: self) ifTrue: [copyFrom: p size] False: [copy]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'indexable' -> () From: ( | {
         'Category: copying\x7fComment: If s is a suffix of this object, return a copy of
this object with the suffix removed. Otherwise
just return a copy of this object. -- Adam & Alex, 4/04\x7fModuleInfo: Module: indexable InitialContents: FollowSlot\x7fVisibility: public'
        
         copyWithoutSuffix: s = ( |
            | 
            (s isSuffixOf: self) ifTrue: [copyFrom: firstKey UpTo: (lastKey - s size) succ] False: [copy]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'indexable' -> () From: ( | {
         'ModuleInfo: Module: indexable InitialContents: FollowSlot\x7fVisibility: private'
        
         descendantResponsibilities = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'indexable' -> 'descendantResponsibilities' -> () From: ( |
             {} = 'Comment: The following methods must be implemented by a descendant.\x7fModuleInfo: Creator: traits indexable descendantResponsibilities.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'indexable' -> 'descendantResponsibilities' -> () From: ( | {
         'ModuleInfo: Module: indexable InitialContents: FollowSlot\x7fVisibility: public'
        
         copy = ( |
            | 'Return a copy of the receiver.').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'indexable' -> 'descendantResponsibilities' -> () From: ( | {
         'ModuleInfo: Module: indexable InitialContents: FollowSlot\x7fVisibility: public'
        
         copySize: n FillingWith: filler = ( |
            | 
            'Return a copy of the receiver with size n. If n is
             larger than the size of the receiver, fill the extra
             slots with filler.').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'indexable' -> () From: ( | {
         'Category: iterating\x7fModuleInfo: Module: indexable InitialContents: FollowSlot\x7fVisibility: public'
        
         do: b = ( |
            | 
            isEmpty ifTrue: [^ self].  "An optim."
            firstKey to: lastKey Do: [|:i| b value: (at: i) With: i].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'indexable' -> () From: ( | {
         'Category: copying\x7fModuleInfo: Module: indexable InitialContents: FollowSlot\x7fVisibility: private'
        
         filler = bootstrap stub -> 'globals' -> 'nil' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'indexable' -> () From: ( | {
         'Category: testing\x7fModuleInfo: Module: indexable InitialContents: FollowSlot\x7fVisibility: public'
        
         findSubstring: subString IfPresent: presentBlock IfAbsent: absentBlock = ( |
            | 
            findSubstring: subString StartingAt: firstKey IfPresent: presentBlock IfAbsent: absentBlock).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'indexable' -> () From: ( | {
         'Category: testing\x7fModuleInfo: Module: indexable InitialContents: FollowSlot\x7fVisibility: public'
        
         findSubstring: subString StartingAt: start IfPresent: presentBlock IfAbsent: absentBlock = ( |
            | 
            start  to:  size - subString size  Do: [|:i|
              subString findFirst: [|:c. :j| c != (at: i + j)]
                        IfPresent: []
                        IfAbsent:  [^ presentBlock value: i].
            ].
            absentBlock value).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'indexable' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: indexable InitialContents: FollowSlot\x7fVisibility: public'
        
         firstIfAbsent: noneBlk = ( |
            | 
            at: firstKey IfAbsent: noneBlk).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'indexable' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: indexable InitialContents: FollowSlot\x7fVisibility: public'
        
         firstKey = 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'indexable' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: indexable InitialContents: FollowSlot\x7fVisibility: private'
        
         if: error IsIndex: outOfBoundsBlock Index: i ElseFailPrim: prim = ( |
            | 
            ('badIndexError' isPrefixOf: error) ||
            ['badSignError'  isPrefixOf: error] 
                ifTrue: [outOfBoundsBlock value: i]
                 False: [primitiveFailedError: error Name: prim]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'indexable' -> () From: ( | {
         'Category: testing\x7fModuleInfo: Module: indexable InitialContents: FollowSlot\x7fVisibility: public'
        
         includesSubstring: subString = ( |
            | 
            findSubstring: subString IfPresent: true IfAbsent: false).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'indexable' -> () From: ( | {
         'Category: testing\x7fModuleInfo: Module: indexable InitialContents: FollowSlot\x7fVisibility: public'
        
         isOrdered = bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'indexable' -> () From: ( | {
         'Category: split and join\x7fModuleInfo: Module: indexable InitialContents: FollowSlot\x7fVisibility: public'
        
         joinUsing: c = ( |
             nc.
            | 
            nc: copyRemoveAll.
            do: [|:e| nc: nc, e, c].
            nc copyWithoutLast).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'indexable' -> () From: ( | {
         'Category: iterating\x7fModuleInfo: Module: indexable InitialContents: FollowSlot\x7fVisibility: public'
        
         keyAt: v = ( |
            | 
            keyAt: v IfAbsent: [ error: 'value not found in collection' ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'indexable' -> () From: ( | {
         'Category: iterating\x7fModuleInfo: Module: indexable InitialContents: FollowSlot\x7fVisibility: public'
        
         keyAt: v IfAbsent: a = ( |
            | 
            do: [|:v2. :k| v = v2 ifTrue: [^ k]].
            a value).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'indexable' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: indexable InitialContents: FollowSlot\x7fVisibility: public'
        
         last = ( |
            | 
            lastIfAbsent: raiseError).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'indexable' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: indexable InitialContents: FollowSlot\x7fVisibility: public'
        
         lastIfAbsent: noneBlk = ( |
            | 
            at: lastKey IfAbsent: noneBlk).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'indexable' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: indexable InitialContents: FollowSlot\x7fVisibility: public'
        
         lastKey = ( |
            | size pred).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'indexable' -> () From: ( | {
         'ModuleInfo: Module: indexable InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'collection' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'indexable' -> () From: ( | {
         'Category: substitution\x7fComment: Replaces all non-overlapping occurrences of the
source subsequence in self with the destination
sequence.  When the source subsequence is empty,
the destination sequence is inserted at the start,
at the end, and between every element in self.\x7fModuleInfo: Module: indexable InitialContents: FollowSlot\x7fVisibility: public'
        
         replace: old With: new = ( |
             dst.
             dstPos <- 0.
             oldEnds.
             oldStarts.
             srcPos <- 0.
            | 
            "not optimal, but linear"

            oldStarts: list copyRemoveAll.
            [srcPos  <=  (size - old size)]  whileTrue: [
              findSubstring: old 
                 StartingAt: srcPos 
                  IfPresent: [|:p| oldStarts addLast: p.
                                   srcPos: p + (1 max: old size)]
                   IfAbsent: [srcPos: size "no more matches: exit the loop"].
            ].
            oldStarts isEmpty ifTrue: [^ self].

            dst: copySize: size + (oldStarts size * (new size - old size)).
            dstPos: oldStarts first.
            oldEnds: oldStarts copy.
            oldEnds removeFirst.
            oldEnds addLast: size.
            oldStarts with: oldEnds Do: [|:from. :to|
              new do: [|:x| dst at: dstPos Put: x.
                            dstPos: dstPos succ].

              from + old size  upTo: to
                                 Do: [|:i| dst at: dstPos Put: at: i.
                                           dstPos: dstPos succ].
            ].
            dst).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'indexable' -> () From: ( | {
         'Category: substitution\x7fComment: Returns a copy of this collection, with any elements that
satisfy the conditionBlk replaced with the result of
running the replacementBlk.\x7fModuleInfo: Module: indexable InitialContents: FollowSlot\x7fVisibility: public'
        
         replaceAllSatisfying: conditionBlk With: replacementBlk = ( |
             c.
            | 
            c: copy.
            do: [|:v. :k|
              (conditionBlk value: v With: k) ifTrue: [
                c at: k Put: replacementBlk value: v With: k.
              ].
            ].
            c).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'indexable' -> () From: ( | {
         'Category: substitution\x7fComment: Removes the range [start...end) from this collection
and insert the specified new stuff in its place.\x7fModuleInfo: Module: indexable InitialContents: FollowSlot\x7fVisibility: public'
        
         replaceFrom: start UpTo: end With: newStuff = ( |
             dst.
             dstPos.
            | 
            dst: copySize: (size - (end - start)) + newStuff size.
            dstPos: start.
            newStuff do: [|:x| dst at: dstPos Put: x.
                               dstPos: dstPos succ].
            end upTo: size Do: [|:i| dst at: dstPos Put: at: i.
                                     dstPos: dstPos succ].
            dst).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'indexable' -> () From: ( | {
         'Category: iterating\x7fModuleInfo: Module: indexable InitialContents: FollowSlot\x7fVisibility: public'
        
         reverseDo: b = ( |
            | 
            isEmpty ifTrue: [^ self].  "An optim."
            lastKey downTo: firstKey Do: [|:i| b value: (at: i) With: i].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'indexable' -> () From: ( | {
         'Category: copying\x7fComment: Similar to python. Useful wrapper to copyFrom:UpTo:

\'hello\' slice: 0 @ infinity ==> \'hello\'
\'hello\' slice: 1 @ 3 ==> \'el\'
\'hello\' slice: -2 @ -1 ==> \'l\'
\x7fModuleInfo: Module: indexable InitialContents: FollowSlot\x7fVisibility: public'
        
         slice: aPair = ( |
             start.
             stop.
            | 
            start: (aPair x < 0 ifTrue: [size + aPair x] False: [aPair x]).
            stop:  (aPair y < 0 ifTrue: [size + aPair y] False: [aPair y]).
            aPair y = infinity ifTrue: [stop: size].
            copyFrom: start UpTo: stop).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'indexable' -> () From: ( | {
         'Category: split and join\x7fModuleInfo: Module: indexable InitialContents: FollowSlot\x7fVisibility: public'
        
         splitOn: o = ( |
            | asTokensSeparatedByItemsSatisfying: [|:i| o = i]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'indexable' -> () From: ( | {
         'Category: unit tests\x7fModuleInfo: Module: indexable InitialContents: FollowSlot\x7fVisibility: private'
        
         unitTests = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'indexable' -> 'unitTests' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits indexable unitTests.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'indexable' -> 'unitTests' -> () From: ( | {
         'ModuleInfo: Module: indexable InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'indexable' -> 'unitTests' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits indexable unitTests parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'indexable' -> 'unitTests' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: indexable InitialContents: FollowSlot\x7fVisibility: private'
        
         assert: b = ( |
            | 
            b value ifFalse: [error: 'assertion failure']).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'indexable' -> 'unitTests' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: indexable InitialContents: FollowSlot\x7fVisibility: private'
        
         fail = ( |
            | assert: false).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'indexable' -> 'unitTests' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: indexable InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'clonable' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'indexable' -> 'unitTests' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: indexable InitialContents: FollowSlot\x7fVisibility: public'
        
         run = ( |
            | 
            testCopyWithoutPrefix.
            testCopyWithoutSuffix.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'indexable' -> 'unitTests' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: indexable InitialContents: FollowSlot\x7fVisibility: private'
        
         testCopyWithoutPrefix = ( |
            | 
            assert: ('abcdefghij' copyWithoutPrefix: '') = 'abcdefghij'.
            assert: ('abcdefghij' copyWithoutPrefix: 'a') = 'bcdefghij'.
            assert: ('abcdefghij' copyWithoutPrefix: 'abc') = 'defghij'.
            assert: ('abcdefghij' copyWithoutPrefix: 'bc') = 'abcdefghij'.
            assert: ('abcdefghij' copyWithoutPrefix: 'abcdefghij') = ''.
            assert: ('abcdefghij' copyWithoutPrefix: 'abcdefghijklm') = 'abcdefghij'.
            assert: ((1 & 2 & 3 & 4) asVector copyWithoutPrefix: (1 & 2) asVector) = (3 & 4) asVector.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'indexable' -> 'unitTests' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: indexable InitialContents: FollowSlot\x7fVisibility: private'
        
         testCopyWithoutSuffix = ( |
            | 
            assert: ('abcdefghij' copyWithoutSuffix: '') = 'abcdefghij'.
            assert: ('abcdefghij' copyWithoutSuffix: 'j') = 'abcdefghi'.
            assert: ('abcdefghij' copyWithoutSuffix: 'hij') = 'abcdefg'.
            assert: ('abcdefghij' copyWithoutSuffix: 'hi') = 'abcdefghij'.
            assert: ('abcdefghij' copyWithoutSuffix: 'abcdefghij') = ''.
            assert: ('abcdefghij' copyWithoutSuffix: 'xyzabcdefghij') = 'abcdefghij'.
            assert: ((1 & 2 & 3 & 4) asVector copyWithoutSuffix: (3 & 4) asVector) = (1 & 2) asVector.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'indexable' -> () From: ( | {
         'Category: iterating\x7fModuleInfo: Module: indexable InitialContents: FollowSlot\x7fVisibility: public'
        
         with: c Do: b = ( |
             i <- 0.
             last <- 0.
            | 
            i: firstKey.
            last: lastKey.
            c do: [|:v. :k|
                i <= last ifFalse: [^ self].
                b value: (at: i) With: v With: i With: k.
                i: i succ.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'indexable' -> () From: ( | {
         'Category: iterating\x7fModuleInfo: Module: indexable InitialContents: FollowSlot\x7fVisibility: public'
        
         with: c ReverseDo: b = ( | {
                 'ModuleInfo: Module: indexable InitialContents: FollowSlot'
                
                 i <- 0.
                } 
            | 
            i: lastKey.
            c reverseDo: [|:v. :k| 
                i >= firstKey ifFalse: [^self].
                b value: (at: i) With: v With: i With: k.
                i: i pred.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'indexable' -> () From: ( | {
         'Category: iterating\x7fModuleInfo: Module: indexable InitialContents: FollowSlot\x7fVisibility: private'
        
         withNonindexable: c Do: b = ( |
            | with: c Do: b).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: core\x7fCategory: collections\x7fCategory: vectors\x7fModuleInfo: Module: indexable InitialContents: FollowSlot\x7fVisibility: public'
        
         mutableIndexable = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'mutableIndexable' -> () From: ( |
             {} = 'Comment: writable and indexable\x7fModuleInfo: Creator: traits mutableIndexable.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mutableIndexable' -> () From: ( | {
         'Category: concatenating\x7fModuleInfo: Module: indexable InitialContents: FollowSlot\x7fVisibility: public'
        
         , c = ( |
             new.
             s1 <- 0.
             s2 <- 0.
            | 
            s1: size.
            s2: c size.
            new: (copySize: s1 + s2).
            new copyRangeDstPos: s1 SrcArray: c SrcPos: 0 Len: s2 IfFail: [
                s2 do: [|:i| new at: i + s1 Put: (c at: i)].
            ].
            new).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mutableIndexable' -> () From: ( | {
         'Category: storing\x7fModuleInfo: Module: indexable InitialContents: FollowSlot\x7fVisibility: public'
        
         at: k Put: v = ( |
            | 
            at: k Put: v
                  IfAbsent: [| :k | error: k printString, ' is absent']).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mutableIndexable' -> () From: ( | {
         'Category: copying\x7fModuleInfo: Module: indexable InitialContents: FollowSlot\x7fVisibility: public'
        
         copyContaining: c = ( | {
                 'ModuleInfo: Module: indexable InitialContents: FollowSlot'
                
                 k.
                }  {
                 'ModuleInfo: Module: indexable InitialContents: FollowSlot'
                
                 r.
                } 
            | 
            r: copySize: c size.
            k: firstKey.
            c do: [ | :v | r at: k Put: v. k: k succ ].
            r).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mutableIndexable' -> () From: ( | {
         'Category: sorting\x7fModuleInfo: Module: indexable InitialContents: FollowSlot\x7fVisibility: public'
        
         copySort = ( |
            | copy sort).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mutableIndexable' -> () From: ( | {
         'Category: sorting\x7fModuleInfo: Module: indexable InitialContents: FollowSlot\x7fVisibility: public'
        
         copySortBy: cmp = ( |
            | copy sortBy: cmp).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mutableIndexable' -> () From: ( | {
         'Category: initializing\x7fModuleInfo: Module: indexable InitialContents: FollowSlot\x7fVisibility: public'
        
         fillFrom: c = ( |
            | with: c Do: [|:v1. :v2. :k1. :k2| at: k1 Put: v2]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mutableIndexable' -> () From: ( | {
         'Category: initializing\x7fModuleInfo: Module: indexable InitialContents: FollowSlot\x7fVisibility: public'
        
         fillWith: v = ( |
            | firstKey to: lastKey Do: [ |:k| at: k Put: v ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mutableIndexable' -> () From: ( | {
         'Category: storing\x7fModuleInfo: Module: indexable InitialContents: FollowSlot\x7fVisibility: public'
        
         first: e = ( |
            | at: firstKey Put: e).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mutableIndexable' -> () From: ( | {
         'Category: initializing\x7fModuleInfo: Module: indexable InitialContents: FollowSlot\x7fVisibility: public'
        
         interpolate: p From: v = ( | {
                 'ModuleInfo: Module: indexable InitialContents: FollowSlot'
                
                 r.
                } 
            | 
            r: copy.
            do: [|:e. :k. | r at: k Put: e interpolate: p From: v at: k].
            r).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mutableIndexable' -> () From: ( | {
         'Category: storing\x7fModuleInfo: Module: indexable InitialContents: FollowSlot\x7fVisibility: public'
        
         last: e = ( |
            | at: lastKey Put: e).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mutableIndexable' -> () From: ( | {
         'Category: sorting\x7fModuleInfo: Module: indexable InitialContents: FollowSlot\x7fVisibility: private'
        
         mergeFirst: f Middle: m Last: l Into: dst By: cmp = ( | {
                 'ModuleInfo: Module: indexable InitialContents: FollowSlot'
                
                 in1.
                }  {
                 'ModuleInfo: Module: indexable InitialContents: FollowSlot'
                
                 in2.
                }  {
                 'ModuleInfo: Module: indexable InitialContents: FollowSlot'
                
                 out.
                }  {
                 'ModuleInfo: Module: indexable InitialContents: FollowSlot'
                
                 v1.
                }  {
                 'ModuleInfo: Module: indexable InitialContents: FollowSlot'
                
                 v2.
                } 
            | 
            in1:  f.
            in2:  m succ.
            out:  f.
            v1:   (at: in1).
            v2:   (at: in2).
            [(in1 <= m) && (in2 <= l)] whileTrue: [
                (cmp element: v2 Precedes: v1) ifTrue: [
                    "this comparison order preserves stability"
                    dst at: out Put: v2.
                    out: out succ.
                    in2: in2 succ.
                    in2 <= l ifTrue: [v2: (at: in2)].
                ] False: [
                    dst at: out Put: v1.
                    out: out succ.
                    in1: in1 succ.
                    in1 <= m ifTrue: [v1: (at: in1)].
                ].
            ].
            in1 to: m Do: [| :i | dst at: out Put: (at: i). out: out succ ].
            in2 to: l Do: [| :i | dst at: out Put: (at: i). out: out succ ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mutableIndexable' -> () From: ( | {
         'Category: sorting\x7fModuleInfo: Module: indexable InitialContents: FollowSlot\x7fVisibility: public'
        
         mergeSortFirst: first Count: count By: cmp = ( | {
                 'ModuleInfo: Module: indexable InitialContents: FollowSlot'
                
                 temp.
                } 
            | 
            "Sort using the mergesort algorithm. Mergesort is a
             worst-case O(NlogN) sorting algorithm that usually does
             only half as many comparisons than heapsort or quicksort."

            "Details: recursively split the range to be sorted into two
             halves, mergesort each half, then merge the two halves together.
             An extra copy of the data is used as temporary storage and
             successive merge phases copy data back and forth between the
             receiver and this copy. The recursion is set up so that the
             final merge is performed into the receiver, culminating with
             the receiver being completely sorted."

            "special check for sorting empty vector"
            (size = 0) && [(first = 0) && [count = 0]] ifTrue: [ ^ self ].

            (first >= size) || [first < 0] ifTrue: [
              ^ error: 'first is outside vector bounds in mergeSort' ].
            0 > count ifTrue: [
              ^ error: 'negative count argument to mergeSort:First:Count:By:' ].

            0 = count ifTrue: [ ^ self ].

            temp: copy.
            mergeSortFirst: first Last: first + count pred
                       Src: temp Dst: self By: cmp.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mutableIndexable' -> () From: ( | {
         'Category: sorting\x7fModuleInfo: Module: indexable InitialContents: FollowSlot\x7fVisibility: private'
        
         mergeSortFirst: f Last: l Src: src Dst: dst By: cmp = ( | {
                 'ModuleInfo: Module: indexable InitialContents: FollowSlot'
                
                 m.
                } 
            | 
            "Split the range to be sorted in half, sort each half, and
             merge the two half-ranges into dst."
            f = l ifTrue: [ ^ self ].
            m: (f + l) / 2.
            mergeSortFirst: f      Last: m Src: dst Dst: src By: cmp.
            mergeSortFirst: m succ Last: l Src: dst Dst: src By: cmp.
            src mergeFirst: f Middle: m Last: l Into: dst By: cmp).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mutableIndexable' -> () From: ( | {
         'ModuleInfo: Module: indexable InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'indexable' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mutableIndexable' -> () From: ( | {
         'Category: sorting\x7fModuleInfo: Module: indexable InitialContents: FollowSlot\x7fVisibility: public'
        
         reverse = ( | {
                 'ModuleInfo: Module: indexable InitialContents: FollowSlot'
                
                 s.
                } 
            | 
            s: size pred.
            s < 0 ifTrue: [ ^self].
            firstKey to: lastKey / 2 Do: [| :i. t |
                t: at: i.
                at: i      Put: (at: s - i).
                at: s - i  Put: t.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mutableIndexable' -> () From: ( | {
         'Category: sorting\x7fModuleInfo: Module: indexable InitialContents: FollowSlot\x7fVisibility: public'
        
         sort = ( |
            | 
            sortBy: ascendingOrder).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mutableIndexable' -> () From: ( | {
         'Category: sorting\x7fModuleInfo: Module: indexable InitialContents: FollowSlot\x7fVisibility: public'
        
         sortBy: cmp = ( |
            | 
            "If empty, just return"
            isEmpty ifTrue: [^ self]. 
            mergeSortFirst: 0 Count: size By: cmp).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mutableIndexable' -> () From: ( | {
         'Category: printing\x7fModuleInfo: Module: indexable InitialContents: FollowSlot\x7fVisibility: public'
        
         storeStringIfFail: fb = ( |
            | 
            case
              if: [isEmpty]  Then: [ collectionName, ' copy' ]
              If: [(reflect: first) isComplete not]  Then: [ fb value: 'first elem is not complete' ]
              Else: [ 
                findFirst: [|:e| first !== e ] 
                IfPresent: [ unkeyedStoreStringIfFail: fb]
                IfAbsent:  [ collectionName, ' copySize: ', size storeString,
                             '  FillingWith: ', 
                                (first storeStringIfFail: [|:e| ^ fb value: 'first elem has no store string: ', e])
                ].
            ]).
        } | ) 



 '-- Side effects'

 globals modules indexable postFileIn
