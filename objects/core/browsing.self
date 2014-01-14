 'Sun-$Revision: 30.19 $'
 '
Copyright 1992-2012 AUTHORS.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: system\x7fCategory: searching\x7fModuleInfo: Module: browsing InitialContents: FollowSlot\x7fVisibility: public'
        
         browse = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'browse' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals browse.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'browse' -> () From: ( | {
         'Category: all objects\x7fComment: Collect all objects\x7fModuleInfo: Module: browsing InitialContents: FollowSlot\x7fVisibility: public'
        
         all = ( |
            | allLimit: infinity).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'browse' -> () From: ( | {
         'Category: all objects\x7fComment: Collect all objects\x7fModuleInfo: Module: browsing InitialContents: FollowSlot\x7fVisibility: public'
        
         allLimit: n = ( |
            | 
            (enumerating all copy limit: n) enumerate).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'browse' -> () From: ( | {
         'Category: children\x7fCategory: immediate children\x7fModuleInfo: Module: browsing InitialContents: FollowSlot\x7fVisibility: public'
        
         childrenOf: obj = ( |
            | childrenOf: obj Limit: infinity).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'browse' -> () From: ( | {
         'Category: children\x7fCategory: immediate children\x7fModuleInfo: Module: browsing InitialContents: FollowSlot\x7fVisibility: public'
        
         childrenOf: obj Limit: n = ( |
            | childrenOfReflectee: (reflect: obj) Limit: n).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'browse' -> () From: ( | {
         'Category: children\x7fCategory: immediate children\x7fModuleInfo: Module: browsing InitialContents: FollowSlot\x7fVisibility: public'
        
         childrenOfReflectee: mir = ( |
            | 
            childrenOfReflectee: mir Limit: infinity).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'browse' -> () From: ( | {
         'Category: children\x7fCategory: immediate children\x7fComment: Collect objects that have (mirr reflectee) as a parent\x7fModuleInfo: Module: browsing InitialContents: FollowSlot\x7fVisibility: public'
        
         childrenOfReflectee: mirr Limit: n = ( |
             children <- bootstrap stub -> 'globals' -> 'list' -> ().
            | 
            children: children copyRemoveAll.
            n <= 0 ifTrue: [^ children].
            [|:exit|
                (referencesOfReflectee: mirr) do: [|:slot|
                    slot isParent ifTrue: [
                      children addLast: slot holder.
                      children size >= n ifTrue: exit.
                    ].
                ].
            ] exit.
            children asVector).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'browse' -> () From: ( | {
         'Category: children\x7fCategory: copy-down children\x7fModuleInfo: Module: browsing InitialContents: FollowSlot\x7fVisibility: public'
        
         copyDownChildrenOf: obj = ( |
            | 
            copyDownChildrenOf: obj Limit: infinity).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'browse' -> () From: ( | {
         'Category: children\x7fCategory: copy-down children\x7fModuleInfo: Module: browsing InitialContents: FollowSlot\x7fVisibility: public'
        
         copyDownChildrenOf: obj Limit: n = ( |
            | 
            copyDownChildrenOfReflectee: (reflect: obj) Limit: n).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'browse' -> () From: ( | {
         'Category: children\x7fCategory: copy-down children\x7fModuleInfo: Module: browsing InitialContents: FollowSlot\x7fVisibility: public'
        
         copyDownChildrenOfReflectee: mir = ( |
            | 
            copyDownChildrenOfReflectee: mir Limit: infinity).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'browse' -> () From: ( | {
         'Category: children\x7fCategory: copy-down children\x7fComment: Collect objects that have (mirr reflectee) as a copy-down parent\x7fModuleInfo: Module: browsing InitialContents: FollowSlot\x7fVisibility: public'
        
         copyDownChildrenOfReflectee: mirr Limit: n = ( |
             r <- bootstrap stub -> 'globals' -> 'list' -> ().
             t.
            | 
            r: r copyRemoveAll.
            t: mirr type.
            all do: [|:m| 
              "screen for speed"
              m areReflecteesSlotsMutable && [(t = m type)]
                ifTrue: [
                  m copyDowns findFirst: [|:cd| cd parentMirror = mirr]
                              IfPresent: [r add: m].
              ].
            ].
            r asVector).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'browse' -> () From: ( | {
         'Category: textual searches\x7fModuleInfo: Module: browsing InitialContents: FollowSlot\x7fVisibility: public'
        
         copyDownsContainingString: substring = ( |
             r.
            | 
            "return a collection of all objects
             whose annotations contains substring"

            r: list copyRemoveAll.
            all do: [|:m| 
              m annotation moduleInfo copyDowns  
                findFirst: [|:cd| isSubstring: substring ContainedIn: cd asString ]
                IfPresent: [r add: m]
            ].
            r).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'browse' -> () From: ( | {
         'Category: children\x7fCategory: children and grandchildren\x7fModuleInfo: Module: browsing InitialContents: FollowSlot\x7fVisibility: public'
        
         descendantsOf: obj = ( |
            | 
            descendantsOf: obj Limit: infinity).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'browse' -> () From: ( | {
         'Category: children\x7fCategory: children and grandchildren\x7fModuleInfo: Module: browsing InitialContents: FollowSlot\x7fVisibility: public'
        
         descendantsOf: obj Limit: n = ( |
            | 
            descendantsOfReflectee: (reflect: obj) Limit: n).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'browse' -> () From: ( | {
         'Category: children\x7fCategory: children and grandchildren\x7fModuleInfo: Module: browsing InitialContents: FollowSlot\x7fVisibility: public'
        
         descendantsOfReflectee: mir = ( |
            | 
            descendantsOfReflectee: mir Limit: infinity).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'browse' -> () From: ( | {
         'Category: children\x7fCategory: children and grandchildren\x7fComment: Collect objects that have (mirr reflectee) as an ancestor (parent or grandparent or...) -- aaa, 2/18/04\x7fModuleInfo: Module: browsing InitialContents: FollowSlot\x7fVisibility: public'
        
         descendantsOfReflectee: mirr Limit: n = ( |
             descendants.
             objectsToBeChecked.
            | 
            "Traverse through descendants breadth-first."
            descendants:         orderedSet copyRemoveAll.
            objectsToBeChecked:  orderedSet copyContaining:  childrenOfReflectee: mirr.

            [objectsToBeChecked isEmpty not && [descendants size < n]] whileTrue: [ |c|
              c: objectsToBeChecked removeFirst.
              descendants if: c
                 IsPresentDo: []
                 IfAbsentPut: [c]
                       AndDo: [objectsToBeChecked addAll:  childrenOfReflectee: c].
            ].
            descendants asVector).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'browse' -> () From: ( | {
         'Category: implementors\x7fComment: Collect methods implementing messages with selector s\x7fModuleInfo: Module: browsing InitialContents: FollowSlot\x7fVisibility: public'
        
         implementorsOf: s = ( |
            | implementorsOf: s Limit: infinity).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'browse' -> () From: ( | {
         'Category: implementors\x7fComment: Collect methods implementing messages with selector s\x7fModuleInfo: Module: browsing InitialContents: FollowSlot\x7fVisibility: public'
        
         implementorsOf: s Limit: n = ( |
            | 
            (enumerating implementors copy limit: n) enumerate: s canonicalize).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'browse' -> () From: ( | {
         'Category: textual searches\x7fModuleInfo: Module: browsing InitialContents: FollowSlot\x7fVisibility: public'
        
         initialContentsContainingString: substring = ( |
             r.
            | 
            "return a collection of all slots (mirrors)
             whose annotations contains substring"

            r: list copyRemoveAll.
            all do: [|:m|
              m do: [|:s. ic| 
                     ic: s annotation moduleInfo initialContents.
                     ic isInitializeToExpression
                     && [ isSubstring: substring ContainedIn: ic expressionMethod source ]
                       ifTrue: [r add: s]
              ].
            ].
            r).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'browse' -> () From: ( | {
         'Category: textual searches\x7fModuleInfo: Module: browsing InitialContents: FollowSlot\x7fVisibility: private'
        
         isSubstring: s ContainedIn: str = ( |
            | 
            str includesSubstring: s).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'browse' -> () From: ( | {
         'Category: textual searches\x7fModuleInfo: Module: browsing InitialContents: FollowSlot\x7fVisibility: public'
        
         methodsContainingString: substring = ( |
             r.
            | 
            "return a collection of all methods (mirrors)
             whose source contains substring"

            r: list copyRemoveAll.
            all do: [|:m|
              (m type = 'method') && [isSubstring: substring ContainedIn: m source ]
                ifTrue: [ r add: m ].
            ].
            r).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'browse' -> () From: ( | {
         'Category: senders\x7fModuleInfo: Module: browsing InitialContents: FollowSlot\x7fVisibility: private'
        
         methodsSlots: methods Limit: n = ( |
            | 
            referencesOfAllReflectees: methods Limit: n).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'browse' -> () From: ( | {
         'ModuleInfo: Module: browsing InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'oddball' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'browse' -> () From: ( | {
         'Category: references\x7fModuleInfo: Module: browsing InitialContents: FollowSlot\x7fVisibility: public'
        
         referencesOf: obj = ( |
             m.
             r.
             s.
            | 
            "someday all such methods should filter out m"
            m: reflect: obj.
            r: referencesOfReflectee: m.
            s: r asSet.
            r do: [|:sl| sl holder = m ifTrue: [s remove: sl]].
            s asVector).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'browse' -> () From: ( | {
         'Category: references\x7fModuleInfo: Module: browsing InitialContents: FollowSlot\x7fVisibility: public'
        
         referencesOf: obj Limit: n = ( |
            | 
            referencesOfReflectee: (reflect: obj) Limit: n).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'browse' -> () From: ( | {
         'Category: references\x7fModuleInfo: Module: browsing InitialContents: FollowSlot\x7fVisibility: public'
        
         referencesOfAllReflectees: aVectorOfMirrors FilterHoldersBy: filterBlock Limit: n = ( |
            | 
            ((enumerating references 
                copy 
                limit: n) 
                filterBlock: filterBlock)
                enumerateContents: aVectorOfMirrors asVector).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'browse' -> () From: ( | {
         'Category: references\x7fModuleInfo: Module: browsing InitialContents: FollowSlot\x7fVisibility: public'
        
         referencesOfAllReflectees: aVectorOfMirrors Limit: n = ( |
            | 
            referencesOfAllReflectees: aVectorOfMirrors
              FilterHoldersBy: true
              Limit: n).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'browse' -> () From: ( | {
         'Category: references\x7fModuleInfo: Module: browsing InitialContents: FollowSlot\x7fVisibility: public'
        
         referencesOfReflectee: mir = ( |
            | referencesOfReflectee: mir Limit: infinity).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'browse' -> () From: ( | {
         'Category: references\x7fComment: Collect objects that contain references to (mirr reflectee)\x7fModuleInfo: Module: browsing InitialContents: FollowSlot\x7fVisibility: public'
        
         referencesOfReflectee: mirr Limit: n = ( |
            | 
            referencesOfAllReflectees: (vector copyAddFirst: mirr) Limit: n).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'browse' -> () From: ( | {
         'Category: senders\x7fComment: Collect methods sending messages with selector s\x7fModuleInfo: Module: browsing InitialContents: FollowSlot\x7fVisibility: public'
        
         sendersOf: s = ( |
            | sendersOf: s Limit: infinity).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'browse' -> () From: ( | {
         'Category: senders\x7fComment: Collect methods sending messages with selector s\x7fModuleInfo: Module: browsing InitialContents: FollowSlot\x7fVisibility: public'
        
         sendersOf: s Limit: n = ( |
             methods.
             mirs.
            | 
            methods: set copy.
            "first find objects that reference the selector (as a string)"
            mirs: (vector copyAddLast: s canonicalize asMirror)
                    _EnumerateVectorReferencesLimit: maxSmallInt.
            mirs do: [|:m| 
              [|:exit. meth|
                "follow back pointer in literal vector to outer method"
                meth: m reflecteeMethodPointerIfFail: exit.
                "string must be used as selector of a sent message"
                meth messagesDo: [| :msg |
                  msg = s ifTrue: [
                    "found one!"
                    methods add: meth.
                    exit value.
                  ].
                ].
              ] exit.
            ].
            methods isEmpty
                ifTrue: [ vector copy ]
                 False: [ methodsSlots: methods Limit: n ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'browse' -> () From: ( | {
         'Category: slots in category\x7fModuleInfo: Module: browsing InitialContents: FollowSlot\x7fVisibility: public'
        
         slotsInCategory: c = ( |
             r.
            | 
            r: list copyRemoveAll.
            all do: [|:m|
              m do: [|:s| (c categories includes: c)
                            ifTrue: [r addlast: s]
              ].
            ].
            r).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'browse' -> () From: ( | {
         'ModuleInfo: Module: browsing InitialContents: FollowSlot\x7fVisibility: public'
        
         test = ( |
            | 
            (implementorsOf: 'name' Limit: 1) size = 1 ifFalse:[^false].
            (sendersOf:      'name' Limit: 1) size = 1 ifFalse:[^false].
            (referencesOf:   lobby  Limit: 1) size = 1 ifFalse:[^false].
            (childrenOf:     lobby  Limit: 1) size = 1 ifFalse:[^false].
            (allLimit: 1                    ) size = 1 ifFalse:[^false].
            true).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'browse' -> () From: ( | {
         'Category: unit tests\x7fModuleInfo: Module: browsing InitialContents: FollowSlot\x7fVisibility: private'
        
         unitTests = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'browse' -> 'unitTests' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals browse unitTests.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'browse' -> 'unitTests' -> () From: ( | {
         'ModuleInfo: Module: browsing InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'browse' -> 'unitTests' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals browse unitTests parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'browse' -> 'unitTests' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: browsing InitialContents: FollowSlot\x7fVisibility: private'
        
         assert: b = ( |
            | 
            b value ifFalse: [error: 'assertion failure'].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'browse' -> 'unitTests' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: browsing InitialContents: FollowSlot\x7fVisibility: private'
        
         assert: x Equals: y = ( |
            | 
            "This method is useful only because it lets you get at the arguments
             very easily in the debugger. -- ads, 2/04"
            assert: x = y).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'browse' -> 'unitTests' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: browsing InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'clonable' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'browse' -> 'unitTests' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: browsing InitialContents: FollowSlot\x7fVisibility: public'
        
         run = ( |
            | 
            testDescendants.
            testDescendantsRespectingInheritanceLoops.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'browse' -> 'unitTests' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: browsing InitialContents: FollowSlot\x7fVisibility: private'
        
         testDescendants = ( |
             x.
            | 
            x: (| p* = (| p* = traits oddball |) |).
            assert: (browse descendantsOf: x) isEmpty.
            assert: (browse descendantsOf: x p) Equals: (vector copyAddLast: x asMirror)).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'browse' -> 'unitTests' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: browsing InitialContents: FollowSlot\x7fVisibility: private'
        
         testDescendantsRespectingInheritanceLoops = ( |
             a.
             b.
             o.
            | 
            o: (| p* <- (). clonable* = traits clonable |).
            a: o copy.
            b: o copy.
            a p: b.
            b p: a.
            assert: (browse descendantsOf: a) Equals: (b asMirror & a asMirror) asVector.
            assert: (browse descendantsOf: b) Equals: (a asMirror & b asMirror) asVector).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: system\x7fCategory: searching\x7fComment: filters out anonymous objects\x7fModuleInfo: Module: browsing InitialContents: FollowSlot\x7fVisibility: public'
        
         browseWellKnown = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'browseWellKnown' -> () From: ( |
             {} = 'Comment: I only return well-known objects\x7fModuleInfo: Creator: globals browseWellKnown.
\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'browseWellKnown' -> () From: ( | {
         'ModuleInfo: Module: browsing InitialContents: FollowSlot\x7fVisibility: public'
        
         all = ( |
            | 
            filterMirrorsIn: resend.all).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'browseWellKnown' -> () From: ( | {
         'Comment: Collect objects that have (mirr reflectee) as a parent\x7fModuleInfo: Module: browsing InitialContents: FollowSlot\x7fVisibility: public'
        
         copyDownChildrenOfReflectee: mirr Limit: n = ( |
            | 
            "optimized via module cache"
            (transporter moduleDictionary copyDownChildrenOf: mirr) asVector).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'browseWellKnown' -> () From: ( | {
         'ModuleInfo: Module: browsing InitialContents: FollowSlot\x7fVisibility: public'
        
         copyDownsContainingString: substring = ( |
             r.
            | 
            r: list copyRemoveAll.
            transporter moduleDictionary do: [|:mod|
              mod interestingHolders do: [|:m|
                m annotation moduleInfo copyDowns
                  findFirst: [|:cd| isSubstring: substring ContainedIn: cd asString ]
                  IfPresent: [r add: m]
              ]
            ].
            r).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'browseWellKnown' -> () From: ( | {
         'Comment: given a collection of mirrors, return only the well-known ones\x7fModuleInfo: Module: browsing InitialContents: FollowSlot'
        
         filterMirrorsIn: mirrors = ( |
            | 
            ( mirrors asList 
                copyFilteredBy: [|:mir| isMirrorWellKnown: mir]
            ) asVector).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'browseWellKnown' -> () From: ( | {
         'Comment: given a collection of slots, return only the ones in well-known objects\x7fModuleInfo: Module: browsing InitialContents: FollowSlot'
        
         filterSlotsIn: slots = ( |
            | 
            ( slots asList
                copyFilteredBy: [|:s| isMirrorWellKnown: s holder]
            ) asVector).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'browseWellKnown' -> () From: ( | {
         'ModuleInfo: Module: browsing InitialContents: FollowSlot\x7fVisibility: public'
        
         implementorsOf: s = ( |
            | 
            filterMirrorsIn: resend.implementorsOf: s).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'browseWellKnown' -> () From: ( | {
         'ModuleInfo: Module: browsing InitialContents: FollowSlot\x7fVisibility: public'
        
         initialContentsContainingString: substring = ( |
            | 
            transporter moduleDictionary gather: [|:mod|
              mod slotsFilteredBy: [|:s| 
                     s exists 
                && [ |ic| ic: s annotation moduleInfo initialContents.
                          ic isInitializeToExpression
                        && [ isSubstring: substring ContainedIn: ic expressionMethod source ]
                   ]
              ].
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'browseWellKnown' -> () From: ( | {
         'ModuleInfo: Module: browsing InitialContents: FollowSlot\x7fVisibility: private'
        
         isMirrorWellKnown: mir = ( |
            | mir isReflecteeMethod not  &&  [mir hasCreator]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'browseWellKnown' -> () From: ( | {
         'ModuleInfo: Module: browsing InitialContents: FollowSlot\x7fVisibility: public'
        
         methodsContainingString: substring = ( |
            | 
            transporter moduleDictionary gather: [|:mod|
              mod slotsFilteredBy: [|:s|
                     s exists 
                && [ s isMethod
                && [ isSubstring: substring ContainedIn: s contents source]]
              ].
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'browseWellKnown' -> () From: ( | {
         'ModuleInfo: Module: browsing InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'globals' -> 'browse' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'browseWellKnown' -> () From: ( | {
         'ModuleInfo: Module: browsing InitialContents: FollowSlot\x7fVisibility: public'
        
         referencesOfAllReflectees: aVectorOfMirrors Limit: n = ( |
            | 
            referencesOfAllReflectees: aVectorOfMirrors
              FilterHoldersBy: [|:m| isMirrorWellKnown: m]
              Limit: n).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'browseWellKnown' -> () From: ( | {
         'ModuleInfo: Module: browsing InitialContents: FollowSlot\x7fVisibility: public'
        
         slotsInCategory: c = ( |
             r.
            | 
            "optimized via module dictionary"
            r: set copyRemoveAll.
            transporter moduleDictionary wellKnownSlotsDo: [|:s|
              (s categories includes: c) ifTrue: [r add: s]].
            r).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: browsing InitialContents: FollowSlot'
        
         browsing = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'browsing' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'browsing' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules browsing.

CopyDowns:
globals modules init. copy 
SlotsToOmit: directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'browsing' -> () From: ( | {
         'ModuleInfo: Module: browsing InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'core'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'browsing' -> () From: ( | {
         'ModuleInfo: Module: browsing InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'browsing' -> () From: ( | {
         'ModuleInfo: Module: browsing InitialContents: FollowSlot'
        
         myComment <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'browsing' -> () From: ( | {
         'ModuleInfo: Module: browsing InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- 'Sun-$Revision: 30.19 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'browsing' -> () From: ( | {
         'ModuleInfo: Module: browsing InitialContents: FollowSlot\x7fVisibility: private'
        
         subpartNames <- ''.
        } | ) 



 '-- Side effects'

 globals modules browsing postFileIn
