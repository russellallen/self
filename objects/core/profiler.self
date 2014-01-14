 'Sun-$Revision: 30.29 $'
 '
Copyright 1992-2012 AUTHORS.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: profiler InitialContents: FollowSlot'
        
         profiler = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'profiler' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'profiler' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules profiler.

CopyDowns:
globals modules init. copy 
SlotsToOmit: directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'profiler' -> () From: ( | {
         'ModuleInfo: Module: profiler InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'core'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'profiler' -> () From: ( | {
         'ModuleInfo: Module: profiler InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'profiler' -> () From: ( | {
         'ModuleInfo: Module: profiler InitialContents: FollowSlot'
        
         myComment <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'profiler' -> () From: ( | {
         'ModuleInfo: Module: profiler InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- 'Sun-$Revision: 30.29 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'profiler' -> () From: ( | {
         'ModuleInfo: Module: profiler InitialContents: FollowSlot\x7fVisibility: private'
        
         subpartNames <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'profiler' -> () From: ( | {
         'Comment: used by getProfile for profiler UI\x7fModuleInfo: Module: profiler InitialContents: InitializeToExpression: (\'\')\x7fVisibility: public'
        
         blockMethodSource <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'profiler' -> () From: ( | {
         'ModuleInfo: Module: profiler InitialContents: InitializeToExpression: (nil)\x7fVisibility: public'
        
         blockResult.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'profiling' -> () From: ( | {
         'Category: debug primitives\x7fModuleInfo: Module: profiler InitialContents: FollowSlot'
        
         dumpGraph = ( |
            | _ProfilerDumpCallGraph).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'profiling' -> () From: ( | {
         'Category: debug primitives\x7fModuleInfo: Module: profiler InitialContents: FollowSlot'
        
         dumpGraph: bool = ( |
            | _ProfilerDumpCallGraph: bool).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'profiling' -> () From: ( | {
         'Category: printing\x7fModuleInfo: Module: profiler InitialContents: FollowSlot'
        
         statePrintString = ( |
            | 
            'Profiling status:',
            ' patch=',  usePatch     printString,
            ', reuse=', useLastStack printString,
            ', fold=',  useFold      printString,
            ', dump=',  dumpGraph    printString, '.').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'profiling' -> () From: ( | {
         'Category: debug primitives\x7fModuleInfo: Module: profiler InitialContents: FollowSlot'
        
         useFold = ( |
            | _ProfilerUseFold).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'profiling' -> () From: ( | {
         'Category: debug primitives\x7fModuleInfo: Module: profiler InitialContents: FollowSlot'
        
         useFold: bool = ( |
            | _ProfilerUseFold: bool).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'profiling' -> () From: ( | {
         'Category: debug primitives\x7fModuleInfo: Module: profiler InitialContents: FollowSlot'
        
         useLastStack = ( |
            | _ProfilerUseLastStack).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'profiling' -> () From: ( | {
         'Category: debug primitives\x7fModuleInfo: Module: profiler InitialContents: FollowSlot'
        
         useLastStack: bool = ( |
            | _ProfilerUseLastStack: bool).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'profiling' -> () From: ( | {
         'Category: debug primitives\x7fModuleInfo: Module: profiler InitialContents: FollowSlot'
        
         usePatch = ( |
            | _ProfilerUsePatch).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'profiling' -> () From: ( | {
         'Category: debug primitives\x7fModuleInfo: Module: profiler InitialContents: FollowSlot'
        
         usePatch: bool = ( |
            | _ProfilerUsePatch: bool).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: system\x7fCategory: profiling\x7fModuleInfo: Module: profiler InitialContents: FollowSlot\x7fVisibility: public'
        
         profiler = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'profiler' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits profiler.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'profiler' -> () From: ( | {
         'Category: passed into VM to get profile\x7fCategory: passed in to VM for call graph\x7fCategory: nodes\x7fModuleInfo: Module: profiler InitialContents: FollowSlot\x7fVisibility: private'
        
         abstractCallGraphProfileNode = bootstrap define: ((bootstrap stub -> 'traits' -> 'profiler') \/-> 'abstractCallGraphProfileNode') -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals vector copy ) From: bootstrap setObjectAnnotationOf: ((bootstrap stub -> 'traits' -> 'profiler') \/-> 'abstractCallGraphProfileNode') -> () From: ( |
             {} = 'ModuleInfo: Creator: traits profiler abstractCallGraphProfileNode.

CopyDowns:
globals vector. copy 
SlotsToOmit: parent.

'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: ((bootstrap stub -> 'traits' -> 'profiler') \/-> 'abstractCallGraphProfileNode') -> () From: ( | {
         'Category: profiling info\x7fModuleInfo: Module: profiler InitialContents: FollowSlot\x7fVisibility: publicReadPrivateWrite'
        
         blocks <- 0.
        } | ) 

 bootstrap addSlotsTo: ((bootstrap stub -> 'traits' -> 'profiler') \/-> 'abstractCallGraphProfileNode') -> () From: ( | {
         'Category: profiling info\x7fModuleInfo: Module: profiler InitialContents: FollowSlot\x7fVisibility: publicReadPrivateWrite'
        
         bytes <- 0.
        } | ) 

 bootstrap addSlotsTo: ((bootstrap stub -> 'traits' -> 'profiler') \/-> 'abstractCallGraphProfileNode') -> () From: ( | {
         'Category: profiling info not from VM\x7fModuleInfo: Module: profiler InitialContents: InitializeToExpression: (0)\x7fVisibility: public'
        
         flatTime <- 0.
        } | ) 

 bootstrap addSlotsTo: ((bootstrap stub -> 'traits' -> 'profiler') \/-> 'abstractCallGraphProfileNode') -> () From: ( | {
         'Category: profiling info\x7fModuleInfo: Module: profiler InitialContents: FollowSlot\x7fVisibility: publicReadPrivateWrite'
        
         optimized <- 0.0.
        } | ) 

 bootstrap addSlotsTo: ((bootstrap stub -> 'traits' -> 'profiler') \/-> 'abstractCallGraphProfileNode') -> () From: ( | {
         'Category: profiling info not from VM\x7fComment: node that is the parent of this one\x7fModuleInfo: Module: profiler InitialContents: InitializeToExpression: (nil)\x7fVisibility: public'
        
         owner.
        } | ) 

 bootstrap addSlotsTo: ((bootstrap stub -> 'traits' -> 'profiler') \/-> 'abstractCallGraphProfileNode') -> () From: ( | {
         'ModuleInfo: Module: profiler InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap setObjectAnnotationOf: ((bootstrap stub -> 'traits' -> 'profiler') \/-> 'abstractCallGraphProfileNode') -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits profiler abstractCallGraphProfileNode parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: ((bootstrap stub -> 'traits' -> 'profiler') \/-> 'abstractCallGraphProfileNode') -> 'parent' -> () From: ( | {
         'Category: arithmetic\x7fModuleInfo: Module: profiler InitialContents: FollowSlot\x7fVisibility: public'
        
         + node = ( |
             new_node.
            | 
            assert: = node Message: 'both nodes must be similar in +'.
            new_node: copyMerge: node OnLeft:  [|:a| a ]
                                      OnRight: [|:b| b ]
                                      OnMerge: [|:a. :b| a node: a node + b node ].
            new_node time:      time      + node time.
            new_node bytes:     bytes     + node bytes.
            new_node blocks:    blocks    + node blocks.
            new_node optimized: optimized + node optimized.
            new_node).
        } | ) 

 bootstrap addSlotsTo: ((bootstrap stub -> 'traits' -> 'profiler') \/-> 'abstractCallGraphProfileNode') -> 'parent' -> () From: ( | {
         'Category: arithmetic\x7fModuleInfo: Module: profiler InitialContents: FollowSlot\x7fVisibility: public'
        
         - node = ( |
             new_node.
            | 
            assert: = node Message: 'both nodes must be similar in -'.
            new_node: copyMerge: node OnLeft:  [|:a| a ]
                                      OnRight: [|:b| b node: b node negate ]
                                      OnMerge: [|:a. :b| a node: a node - b node ].
            new_node time:      time      - node time.
            new_node bytes:     bytes     - node bytes.
            new_node blocks:    blocks    - node blocks.
            new_node optimized: 0.0.
            new_node).
        } | ) 

 bootstrap addSlotsTo: ((bootstrap stub -> 'traits' -> 'profiler') \/-> 'abstractCallGraphProfileNode') -> 'parent' -> () From: ( | {
         'Category: printing\x7fCategory: printing just me\x7fModuleInfo: Module: profiler InitialContents: FollowSlot\x7fVisibility: public'
        
         allocationString = ( |
            | 
            ', (', bytes printString, ' #bytes + ',
            blocks printString, ' #[])').
        } | ) 

 bootstrap addSlotsTo: ((bootstrap stub -> 'traits' -> 'profiler') \/-> 'abstractCallGraphProfileNode') -> 'parent' -> () From: ( | {
         'Category: printing\x7fCategory: flat\x7fModuleInfo: Module: profiler InitialContents: FollowSlot\x7fVisibility: public'
        
         asFlatVector = ( |
             entries <- bootstrap stub -> 'globals' -> 'set' -> ().
             sorted <- bootstrap stub -> 'globals' -> 'list' -> ().
            | 
            entries:  set copyRemoveAll.
            entries: collectSet: entries.

            sorted: entries asVector.
            sorted sortBy: (|
              element: e1 Precedes: e2 = (
                e1 node flatTime > e2 node flatTime )
            |).
            sorted).
        } | ) 

 bootstrap addSlotsTo: ((bootstrap stub -> 'traits' -> 'profiler') \/-> 'abstractCallGraphProfileNode') -> 'parent' -> () From: ( | {
         'Category: iterating\x7fModuleInfo: Module: profiler InitialContents: FollowSlot\x7fVisibility: private'
        
         asList = ( |
            | 
            bcisAndNodes).
        } | ) 

 bootstrap addSlotsTo: ((bootstrap stub -> 'traits' -> 'profiler') \/-> 'abstractCallGraphProfileNode') -> 'parent' -> () From: ( | {
         'Category: arithmetic\x7fModuleInfo: Module: profiler InitialContents: FollowSlot\x7fVisibility: private'
        
         assert: bool Message: msg = ( |
            | 
            bool ifFalse: [ ('Assert failed: ', msg) printLine. halt. ]).
        } | ) 

 bootstrap addSlotsTo: ((bootstrap stub -> 'traits' -> 'profiler') \/-> 'abstractCallGraphProfileNode') -> 'parent' -> () From: ( | {
         'Category: iterating\x7fModuleInfo: Module: profiler InitialContents: FollowSlot\x7fVisibility: private'
        
         bciAndNode = bootstrap setObjectAnnotationOf: ((bootstrap stub -> 'traits' -> 'profiler') \/-> 'abstractCallGraphProfileNode') -> 'parent' -> 'bciAndNode' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits profiler abstractCallGraphProfileNode parent bciAndNode.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: ((bootstrap stub -> 'traits' -> 'profiler') \/-> 'abstractCallGraphProfileNode') -> 'parent' -> 'bciAndNode' -> () From: ( | {
         'ModuleInfo: Module: profiler InitialContents: FollowSlot\x7fVisibility: public'
        
         bci.
        } | ) 

 bootstrap addSlotsTo: ((bootstrap stub -> 'traits' -> 'profiler') \/-> 'abstractCallGraphProfileNode') -> 'parent' -> 'bciAndNode' -> () From: ( | {
         'ModuleInfo: Module: profiler InitialContents: FollowSlot\x7fVisibility: public'
        
         node.
        } | ) 

 bootstrap addSlotsTo: ((bootstrap stub -> 'traits' -> 'profiler') \/-> 'abstractCallGraphProfileNode') -> 'parent' -> 'bciAndNode' -> () From: ( | {
         'ModuleInfo: Module: profiler InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap setObjectAnnotationOf: ((bootstrap stub -> 'traits' -> 'profiler') \/-> 'abstractCallGraphProfileNode') -> 'parent' -> 'bciAndNode' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits profiler abstractCallGraphProfileNode parent bciAndNode parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: ((bootstrap stub -> 'traits' -> 'profiler') \/-> 'abstractCallGraphProfileNode') -> 'parent' -> 'bciAndNode' -> 'parent' -> () From: ( | {
         'Category: comparing\x7fModuleInfo: Module: profiler InitialContents: FollowSlot\x7fVisibility: public'
        
         = other = ( |
            | 
               (bci  = other bci )
            && [node = other node]).
        } | ) 

 bootstrap addSlotsTo: ((bootstrap stub -> 'traits' -> 'profiler') \/-> 'abstractCallGraphProfileNode') -> 'parent' -> 'bciAndNode' -> 'parent' -> () From: ( | {
         'Category: comparing\x7fModuleInfo: Module: profiler InitialContents: FollowSlot\x7fVisibility: public'
        
         hash = ( |
            | 
            bci hash ^^ node hash).
        } | ) 

 bootstrap addSlotsTo: ((bootstrap stub -> 'traits' -> 'profiler') \/-> 'abstractCallGraphProfileNode') -> 'parent' -> 'bciAndNode' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: profiler InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'clonable' -> ().
        } | ) 

 bootstrap addSlotsTo: ((bootstrap stub -> 'traits' -> 'profiler') \/-> 'abstractCallGraphProfileNode') -> 'parent' -> () From: ( | {
         'Category: iterating\x7fModuleInfo: Module: profiler InitialContents: FollowSlot\x7fVisibility: public'
        
         bcisAndNodes = ( |
             r <- bootstrap stub -> 'globals' -> 'list' -> ().
            | 
            r: list copyRemoveAll.
            bcisAndNodesDo: [| :b. :n | r add:  (bciAndNode copy bci: b) node: n ].
            r).
        } | ) 

 bootstrap addSlotsTo: ((bootstrap stub -> 'traits' -> 'profiler') \/-> 'abstractCallGraphProfileNode') -> 'parent' -> () From: ( | {
         'Category: iterating\x7fModuleInfo: Module: profiler InitialContents: FollowSlot\x7fVisibility: public'
        
         bcisAndNodesDo: blk = ( |
            | 
            "Evaluates blk for each (bci, node) pair"
            isNode ifTrue: [
              0 to: size pred By: 2 Do: [| :i | 
                blk value: (at: i) With: (at: i succ) ]
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: ((bootstrap stub -> 'traits' -> 'profiler') \/-> 'abstractCallGraphProfileNode') -> 'parent' -> () From: ( | {
         'Category: timing\x7fComment: Returns the time spent in this node only\x7fModuleInfo: Module: profiler InitialContents: FollowSlot\x7fVisibility: public'
        
         calculateShallowTime = ( |
             t.
            | 
            t: time.
            nodesDo: [|:n| n isLeafNode ifFalse: [ t: t - n time ]].
            t).
        } | ) 

 bootstrap addSlotsTo: ((bootstrap stub -> 'traits' -> 'profiler') \/-> 'abstractCallGraphProfileNode') -> 'parent' -> () From: ( | {
         'Category: verifying\x7fModuleInfo: Module: profiler InitialContents: FollowSlot\x7fVisibility: public'
        
         checkGraph = ( |
            | 
            pathIterate: [|:p. :b. :n | 
              n isBlockNode && [ n outer isNil ] ifTrue: [
                 'Block node found with wrong outer method' printLine.
                 '- path:' printLine.
                 p do: [|:n| 
                   ('  ', n printString, '  ', n objectID) printLine ].
                 '- node:' printLine.
                 ('  ', n printString, '  @', b printString, '  ', n objectID)
                   printLine
              ].
              true
            ]).
        } | ) 

 bootstrap addSlotsTo: ((bootstrap stub -> 'traits' -> 'profiler') \/-> 'abstractCallGraphProfileNode') -> 'parent' -> () From: ( | {
         'Category: arithmetic\x7fModuleInfo: Module: profiler InitialContents: FollowSlot'
        
         collect: name = ( |
             l <- bootstrap stub -> 'globals' -> 'list' -> ().
            | 
            l: list copyRemoveAll.
            iterate: [| :b. :n. :d | 
              n isMethodNode && [ n selector = name ] ifTrue: [
                l add: n.
              ].
              true]. l).
        } | ) 

 bootstrap addSlotsTo: ((bootstrap stub -> 'traits' -> 'profiler') \/-> 'abstractCallGraphProfileNode') -> 'parent' -> () From: ( | {
         'Category: pruning\x7fModuleInfo: Module: profiler InitialContents: FollowSlot\x7fVisibility: public'
        
         copyAndPruneForCutoff: cutoff Modules: aModulePartitioning = ( |
             r.
            | 
            r: deepCopy.
            r pruningInfo markInterestingNodesForCutoff: cutoff.
            r pruningInfo markRelevantInterestingNodesForModules: aModulePartitioning
                                         NearestRelevantAncestor: r
                                   LookingForARelevantDescendant: false.
            r copyAndPruneAssumingPruningInformationIsPresent).
        } | ) 

 bootstrap addSlotsTo: ((bootstrap stub -> 'traits' -> 'profiler') \/-> 'abstractCallGraphProfileNode') -> 'parent' -> () From: ( | {
         'Category: copying\x7fModuleInfo: Module: profiler InitialContents: FollowSlot\x7fVisibility: public'
        
         copyIteratively = ( |
             indices.
             nodes.
             root.
            | 
            root: (0 & self copy) asVector.
            nodes:   list copyRemoveAll addLast:  root.
            indices: list copyRemoveAll addLast:  0.
            [ |n. i. |
              n: nodes   last.
              i: indices removeLast.
              indices addLast: i + 2.
              case    if: [i >= n size]         
                    Then: [nodes removeLast. indices removeLast]
                    Else: [
                      n at: i      Put: (n at: i)      copy.
                      n at: i succ Put: (n at: i succ) copy.
                      nodes addLast: (n at: i succ). 
                      indices addLast: 0]
            ] untilTrue: [nodes isEmpty].
            root at: 1).
        } | ) 

 bootstrap addSlotsTo: ((bootstrap stub -> 'traits' -> 'profiler') \/-> 'abstractCallGraphProfileNode') -> 'parent' -> () From: ( | {
         'Category: copying\x7fModuleInfo: Module: profiler InitialContents: FollowSlot\x7fVisibility: private'
        
         copyMappingNodesBy: blk = ( |
             r.
            | 
            r: copy.
            1 to: size By: 2 Do: [|:i|
              r at: i Put:  blk value: at: i.
            ].
            r).
        } | ) 

 bootstrap addSlotsTo: ((bootstrap stub -> 'traits' -> 'profiler') \/-> 'abstractCallGraphProfileNode') -> 'parent' -> () From: ( | {
         'Category: iterating\x7fModuleInfo: Module: profiler InitialContents: FollowSlot\x7fVisibility: private'
        
         copyMerge: node OnLeft: lb OnRight: rb OnMerge: mb = ( | {
                 'ModuleInfo: Module: profiler InitialContents: FollowSlot'
                
                 index <- 0.
                }  {
                 'ModuleInfo: Module: profiler InitialContents: FollowSlot'
                
                 new_node.
                }  {
                 'ModuleInfo: Module: profiler InitialContents: FollowSlot'
                
                 sons.
                } 
            | 
            sons: mergeListOfSons: node OnLeft: lb OnRight: rb OnMerge: mb.
            new_node: copySize: sons size double.
            sons do: [| :e |
              new_node at: index      Put: e bci.
              new_node at: index succ Put: e node.
              index: index succ succ].
            new_node).
        } | ) 

 bootstrap addSlotsTo: ((bootstrap stub -> 'traits' -> 'profiler') \/-> 'abstractCallGraphProfileNode') -> 'parent' -> () From: ( | {
         'Category: copying\x7fModuleInfo: Module: profiler InitialContents: FollowSlot\x7fVisibility: private'
        
         deepCopy = ( |
            | 
            copyMappingNodesBy: [|:n| n deepCopy]).
        } | ) 

 bootstrap addSlotsTo: ((bootstrap stub -> 'traits' -> 'profiler') \/-> 'abstractCallGraphProfileNode') -> 'parent' -> () From: ( | {
         'Category: sizing\x7fModuleInfo: Module: profiler InitialContents: FollowSlot'
        
         depth = ( | {
                 'ModuleInfo: Module: profiler InitialContents: FollowSlot'
                
                 i <- 0.
                } 
            | iterate: [| :b. :n. :d | i: i max: d. true]. i).
        } | ) 

 bootstrap addSlotsTo: ((bootstrap stub -> 'traits' -> 'profiler') \/-> 'abstractCallGraphProfileNode') -> 'parent' -> () From: ( | {
         'Category: searching\x7fModuleInfo: Module: profiler InitialContents: FollowSlot\x7fVisibility: public'
        
         findFirstNode: eb IfPresent: pb = ( |
            | 
            findFirstNode: eb IfPresent: pb IfAbsent: [ error: 'node not found!']).
        } | ) 

 bootstrap addSlotsTo: ((bootstrap stub -> 'traits' -> 'profiler') \/-> 'abstractCallGraphProfileNode') -> 'parent' -> () From: ( | {
         'Category: searching\x7fModuleInfo: Module: profiler InitialContents: FollowSlot\x7fVisibility: public'
        
         findFirstNode: eb IfPresent: pb IfAbsent: ab = ( |
             found <- bootstrap stub -> 'globals' -> 'false' -> ().
             r.
            | 
            iterate: [|:bci. :n| 
              found not && (eb value: bci With: n) ifTrue: [r: pb value: bci With: n. found: true].
              found not
            ].
            found ifTrue: [r] False: ab).
        } | ) 

 bootstrap addSlotsTo: ((bootstrap stub -> 'traits' -> 'profiler') \/-> 'abstractCallGraphProfileNode') -> 'parent' -> () From: ( | {
         'Category: iterating\x7fModuleInfo: Module: profiler InitialContents: FollowSlot\x7fVisibility: private'
        
         hasList: l Element: e = ( |
            | 
            l do: [|:i| 
              i bci > e bci ifTrue: [^false].
              i bci = e bci ifTrue: [i node = e node ifTrue: [^true]]].
            false).
        } | ) 

 bootstrap addSlotsTo: ((bootstrap stub -> 'traits' -> 'profiler') \/-> 'abstractCallGraphProfileNode') -> 'parent' -> () From: ( | {
         'Category: printing\x7fCategory: helpers\x7fModuleInfo: Module: profiler InitialContents: FollowSlot\x7fVisibility: public'
        
         holderIDString = ( |
            | 
            idString).
        } | ) 

 bootstrap addSlotsTo: ((bootstrap stub -> 'traits' -> 'profiler') \/-> 'abstractCallGraphProfileNode') -> 'parent' -> () From: ( | {
         'Category: printing\x7fCategory: helpers\x7fComment: added some slots so copyDownTemplate could print.
	   Because it is vectorish, it is sent printString even though
	   it is not annotated as complete.
	   This is a bug in the mirror code that should be fixed.--dmu\x7fModuleInfo: Module: profiler InitialContents: FollowSlot\x7fVisibility: public'
        
         idString = 'copyDownTemplate'.
        } | ) 

 bootstrap addSlotsTo: ((bootstrap stub -> 'traits' -> 'profiler') \/-> 'abstractCallGraphProfileNode') -> 'parent' -> () From: ( | {
         'Category: timing\x7fModuleInfo: Module: profiler InitialContents: FollowSlot\x7fVisibility: public'
        
         initializeRecursively = ( |
            | 
            shallowTime: calculateShallowTime.
            nodesDo: [|:n|
               n totalTime: totalTime.
              (n initializeRecursively) 
                 owner: self].
            self).
        } | ) 

 bootstrap addSlotsTo: ((bootstrap stub -> 'traits' -> 'profiler') \/-> 'abstractCallGraphProfileNode') -> 'parent' -> () From: ( | {
         'Category: timing\x7fModuleInfo: Module: profiler InitialContents: FollowSlot\x7fVisibility: public'
        
         initializeTree = ( |
            | 
            time = 0 ifFalse: [ totalTime: time asFloat. initializeRecursively ].
            self).
        } | ) 

 bootstrap addSlotsTo: ((bootstrap stub -> 'traits' -> 'profiler') \/-> 'abstractCallGraphProfileNode') -> 'parent' -> () From: ( | {
         'Category: comparison\x7fModuleInfo: Module: profiler InitialContents: FollowSlot\x7fVisibility: private'
        
         is: a EqualTo: b = ( | {
                 'ModuleInfo: Module: profiler InitialContents: FollowSlot'
                
                 m.
                }  {
                 'ModuleInfo: Module: profiler InitialContents: FollowSlot'
                
                 n.
                }  {
                 'ModuleInfo: Module: profiler InitialContents: FollowSlot'
                
                 x.
                }  {
                 'ModuleInfo: Module: profiler InitialContents: FollowSlot'
                
                 y.
                } 
            | 
            "Check the structural parts of the a and b"
            n: (reflect: a).
            m: (reflect: b).
            n = m ifTrue: [^ true].
            x: n names.
            y: m names.
            x = y ifTrue: [^true].
            false).
        } | ) 

 bootstrap addSlotsTo: ((bootstrap stub -> 'traits' -> 'profiler') \/-> 'abstractCallGraphProfileNode') -> 'parent' -> () From: ( | {
         'Category: testing\x7fModuleInfo: Module: profiler InitialContents: FollowSlot'
        
         isAccessNode = bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: ((bootstrap stub -> 'traits' -> 'profiler') \/-> 'abstractCallGraphProfileNode') -> 'parent' -> () From: ( | {
         'Category: testing\x7fModuleInfo: Module: profiler InitialContents: FollowSlot'
        
         isBlockNode = bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: ((bootstrap stub -> 'traits' -> 'profiler') \/-> 'abstractCallGraphProfileNode') -> 'parent' -> () From: ( | {
         'Category: testing\x7fModuleInfo: Module: profiler InitialContents: FollowSlot'
        
         isLeafNode = bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: ((bootstrap stub -> 'traits' -> 'profiler') \/-> 'abstractCallGraphProfileNode') -> 'parent' -> () From: ( | {
         'Category: testing\x7fModuleInfo: Module: profiler InitialContents: FollowSlot'
        
         isMethodNode = bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: ((bootstrap stub -> 'traits' -> 'profiler') \/-> 'abstractCallGraphProfileNode') -> 'parent' -> () From: ( | {
         'Category: testing\x7fModuleInfo: Module: profiler InitialContents: FollowSlot'
        
         isNode = bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: ((bootstrap stub -> 'traits' -> 'profiler') \/-> 'abstractCallGraphProfileNode') -> 'parent' -> () From: ( | {
         'Category: testing\x7fModuleInfo: Module: profiler InitialContents: FollowSlot'
        
         isPrimNode = bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: ((bootstrap stub -> 'traits' -> 'profiler') \/-> 'abstractCallGraphProfileNode') -> 'parent' -> () From: ( | {
         'Category: pruning\x7fCategory: significant children\x7fComment: A significant child is one that takes up more than
a tiny fraction of my time. Most nodes have only
one significant child.\x7fModuleInfo: Module: profiler InitialContents: FollowSlot\x7fVisibility: private'
        
         isSignificantChild: n = ( |
             childTime.
             threshold = 0.03.
            | 
            childTime: (n time asFloat / time asFloat).
            (childTime >= threshold) && [childTime <= (1 - threshold)]).
        } | ) 

 bootstrap addSlotsTo: ((bootstrap stub -> 'traits' -> 'profiler') \/-> 'abstractCallGraphProfileNode') -> 'parent' -> () From: ( | {
         'Category: iterating\x7fModuleInfo: Module: profiler InitialContents: FollowSlot\x7fVisibility: public'
        
         iterate: blk = ( |
            | 
            iterativeIterate: blk).
        } | ) 

 bootstrap addSlotsTo: ((bootstrap stub -> 'traits' -> 'profiler') \/-> 'abstractCallGraphProfileNode') -> 'parent' -> () From: ( | {
         'Category: iterating\x7fModuleInfo: Module: profiler InitialContents: FollowSlot\x7fVisibility: public'
        
         iterate: blk Bci: b Path: list = ( |
            | 
            list add: self.
            "Traverse children first"
            bcisAndNodesDo: [|:b. :n | n iterate: blk Bci: b Path: list].
            list removeLast.
            blk value: list With: b With: self).
        } | ) 

 bootstrap addSlotsTo: ((bootstrap stub -> 'traits' -> 'profiler') \/-> 'abstractCallGraphProfileNode') -> 'parent' -> () From: ( | {
         'Category: iterating\x7fModuleInfo: Module: profiler InitialContents: FollowSlot\x7fVisibility: private'
        
         iterativeIterate: blk = ( |
             indices.
             nodes.
            | 
            nodes: list copyRemoveAll addLast: (0 & self) asVector.
            indices: list copyRemoveAll addLast: 0.
            [ |n. i|
              n: nodes   last.
              i: indices removeLast.
              indices addLast: i + 2.
              case if: [i >= n size]  Then: [nodes removeLast.            indices removeLast]
                   If: [blk value: (n at: i) With: (n at: i succ) With: nodes size pred]
                                      Then: [nodes addLast: n at: i succ. indices addLast: 0]
            ] untilTrue: [nodes isEmpty].
            self).
        } | ) 

 bootstrap addSlotsTo: ((bootstrap stub -> 'traits' -> 'profiler') \/-> 'abstractCallGraphProfileNode') -> 'parent' -> () From: ( | {
         'Category: printing\x7fCategory: flat\x7fComment: traverse the scope of node\x7fModuleInfo: Module: profiler InitialContents: FollowSlot\x7fVisibility: private'
        
         lexScope: path Node: node Do: blk = ( |
             lexNode.
            | 
            node isBlockNode ifTrue: [lexNode: node outer].
            path reverseDo: [|:n|
              lexNode ifNil: [
                blk value: n.
                n isBlockNode ifTrue: [lexNode: n outer]
              ] IfNotNil: [
                lexNode = n ifTrue: [blk value: n. lexNode: nil]
            ]]).
        } | ) 

 bootstrap addSlotsTo: ((bootstrap stub -> 'traits' -> 'profiler') \/-> 'abstractCallGraphProfileNode') -> 'parent' -> () From: ( | {
         'Category: iterating\x7fModuleInfo: Module: profiler InitialContents: FollowSlot\x7fVisibility: private'
        
         mergeListOfSons: node OnLeft: lb OnRight: rb OnMerge: mb = ( | {
                 'ModuleInfo: Module: profiler InitialContents: FollowSlot'
                
                 result <- bootstrap stub -> 'globals' -> 'list' -> ().
                }  {
                 'ModuleInfo: Module: profiler InitialContents: FollowSlot'
                
                 s1 <- bootstrap stub -> 'globals' -> 'list' -> ().
                }  {
                 'ModuleInfo: Module: profiler InitialContents: FollowSlot'
                
                 s2 <- bootstrap stub -> 'globals' -> 'list' -> ().
                } 
            | 
            result: list copy.
            s1: asList.
            s2: node asList.
            [| :exitLoop |
              s1 isEmpty && [ s2 isEmpty ] ifTrue: exitLoop.
              [| :exit. a. b |
                  s1 isEmpty ifTrue: [
                     result add: (rb value: s2 removeFirst). exit value ].
                  s2 isEmpty ifTrue: [
                     result add: (lb value: s1 removeFirst). exit value ].
                  a: s1 first. b: s2 first.
                  a bci = b bci ifTrue: [
                    a node = b node ifTrue: [
                      result add: (mb value: s1 removeFirst With: s2 removeFirst)
                    ] False: [
                      (hasList: s2 Element: a) ifTrue: [
                         result add: (rb value: s2 removeFirst). exit value].
                      (hasList: s1 Element: b) ifTrue: [
                         result add: (lb value: s1 removeFirst). exit value].
                      result add: (lb value: s1 removeFirst).
                    ]
                  ] False: [
                    a bci < b bci ifTrue: [result add: (lb value: s1 removeFirst)] 
                                   False: [result add: (rb value: s2 removeFirst)]
                  ]
              ] exit.
            ] loopExit.
            result).
        } | ) 

 bootstrap addSlotsTo: ((bootstrap stub -> 'traits' -> 'profiler') \/-> 'abstractCallGraphProfileNode') -> 'parent' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: profiler InitialContents: FollowSlot\x7fVisibility: public'
        
         methodHolder = ( |
            | childMustImplement).
        } | ) 

 bootstrap addSlotsTo: ((bootstrap stub -> 'traits' -> 'profiler') \/-> 'abstractCallGraphProfileNode') -> 'parent' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: profiler InitialContents: FollowSlot\x7fVisibility: public'
        
         methodHolderMirror = ( |
            | 
            reflect: methodHolder).
        } | ) 

 bootstrap addSlotsTo: ((bootstrap stub -> 'traits' -> 'profiler') \/-> 'abstractCallGraphProfileNode') -> 'parent' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: profiler InitialContents: FollowSlot\x7fVisibility: public'
        
         moduleIfNone: nb = ( |
            | 
            (slotIfNone: [^ nb value]) module).
        } | ) 

 bootstrap addSlotsTo: ((bootstrap stub -> 'traits' -> 'profiler') \/-> 'abstractCallGraphProfileNode') -> 'parent' -> () From: ( | {
         'Category: arithmetic\x7fModuleInfo: Module: profiler InitialContents: FollowSlot\x7fVisibility: public'
        
         negate = ( | {
                 'ModuleInfo: Module: profiler InitialContents: FollowSlot'
                
                 new_node.
                } 
            | 
            new_node: copy.
            new_node size do: [|:i|
                i odd ifTrue: [ new_node at: i Put: (new_node at: i) negate]].
            new_node time:      time negate.
            new_node bytes:     bytes negate.
            new_node blocks:    blocks negate.
            new_node optimized: 0.0.
            new_node).
        } | ) 

 bootstrap addSlotsTo: ((bootstrap stub -> 'traits' -> 'profiler') \/-> 'abstractCallGraphProfileNode') -> 'parent' -> () From: ( | {
         'Category: printing\x7fCategory: helpers\x7fModuleInfo: Module: profiler InitialContents: FollowSlot\x7fVisibility: private'
        
         nodeInfoForPrinting = bootstrap setObjectAnnotationOf: ((bootstrap stub -> 'traits' -> 'profiler') \/-> 'abstractCallGraphProfileNode') -> 'parent' -> 'nodeInfoForPrinting' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits profiler abstractCallGraphProfileNode parent nodeInfoForPrinting.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: ((bootstrap stub -> 'traits' -> 'profiler') \/-> 'abstractCallGraphProfileNode') -> 'parent' -> 'nodeInfoForPrinting' -> () From: ( | {
         'ModuleInfo: Module: profiler InitialContents: FollowSlot'
        
         bci <- 0.
        } | ) 

 bootstrap addSlotsTo: ((bootstrap stub -> 'traits' -> 'profiler') \/-> 'abstractCallGraphProfileNode') -> 'parent' -> 'nodeInfoForPrinting' -> () From: ( | {
         'ModuleInfo: Module: profiler InitialContents: FollowSlot'
        
         copy = ( |
            | _Clone).
        } | ) 

 bootstrap addSlotsTo: ((bootstrap stub -> 'traits' -> 'profiler') \/-> 'abstractCallGraphProfileNode') -> 'parent' -> 'nodeInfoForPrinting' -> () From: ( | {
         'ModuleInfo: Module: profiler InitialContents: FollowSlot'
        
         indent <- 0.
        } | ) 

 bootstrap addSlotsTo: ((bootstrap stub -> 'traits' -> 'profiler') \/-> 'abstractCallGraphProfileNode') -> 'parent' -> 'nodeInfoForPrinting' -> () From: ( | {
         'ModuleInfo: Module: profiler InitialContents: FollowSlot'
        
         node.
        } | ) 

 bootstrap addSlotsTo: ((bootstrap stub -> 'traits' -> 'profiler') \/-> 'abstractCallGraphProfileNode') -> 'parent' -> 'nodeInfoForPrinting' -> () From: ( | {
         'ModuleInfo: Module: profiler InitialContents: FollowSlot'
        
         printed <- bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: ((bootstrap stub -> 'traits' -> 'profiler') \/-> 'abstractCallGraphProfileNode') -> 'parent' -> () From: ( | {
         'Category: iterating\x7fModuleInfo: Module: profiler InitialContents: FollowSlot\x7fVisibility: public'
        
         nodesDo: blk = ( |
            | 
            bcisAndNodesDo: [|:bci. :n| blk value: n].
            self).
        } | ) 

 bootstrap addSlotsTo: ((bootstrap stub -> 'traits' -> 'profiler') \/-> 'abstractCallGraphProfileNode') -> 'parent' -> () From: ( | {
         'Category: timing\x7fModuleInfo: Module: profiler InitialContents: FollowSlot\x7fVisibility: public'
        
         normalizedTime = ( |
            | time asFloat / totalTime asFloat).
        } | ) 

 bootstrap addSlotsTo: ((bootstrap stub -> 'traits' -> 'profiler') \/-> 'abstractCallGraphProfileNode') -> 'parent' -> () From: ( | {
         'Category: sizing\x7fModuleInfo: Module: profiler InitialContents: FollowSlot'
        
         numOfNodes = ( | {
                 'ModuleInfo: Module: profiler InitialContents: FollowSlot'
                
                 i <- 0.
                } 
            | iterate: [i: i succ. true]. i).
        } | ) 

 bootstrap addSlotsTo: ((bootstrap stub -> 'traits' -> 'profiler') \/-> 'abstractCallGraphProfileNode') -> 'parent' -> () From: ( | {
         'Category: sizing\x7fModuleInfo: Module: profiler InitialContents: FollowSlot'
        
         numOfNodes: depth = ( | {
                 'ModuleInfo: Module: profiler InitialContents: FollowSlot'
                
                 i <- 0.
                } 
            | 
            iterate: [| :b. :n. :d | i: i succ. d < depth]. i).
        } | ) 

 bootstrap addSlotsTo: ((bootstrap stub -> 'traits' -> 'profiler') \/-> 'abstractCallGraphProfileNode') -> 'parent' -> () From: ( | {
         'Category: printing\x7fCategory: printing just me\x7fModuleInfo: Module: profiler InitialContents: FollowSlot\x7fVisibility: public'
        
         optimizedString = ( |
            | 
            isMethodNode || [isBlockNode] ifTrue: [
             ^ ', (', (optimized * 100) asInteger printString,
               '% optimized)'].
            '').
        } | ) 

 bootstrap addSlotsTo: ((bootstrap stub -> 'traits' -> 'profiler') \/-> 'abstractCallGraphProfileNode') -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: profiler InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'vector' -> ().
        } | ) 

 bootstrap addSlotsTo: ((bootstrap stub -> 'traits' -> 'profiler') \/-> 'abstractCallGraphProfileNode') -> 'parent' -> () From: ( | {
         'Category: iterating\x7fComment: blk is envoked with three arguments for each node in the graph:
       path [root->...->node], byte code index, and node\x7fModuleInfo: Module: profiler InitialContents: FollowSlot\x7fVisibility: public'
        
         pathIterate: blk = ( |
            | 
            iterate: blk Bci: 0 Path: list copyRemoveAll).
        } | ) 

 bootstrap addSlotsTo: ((bootstrap stub -> 'traits' -> 'profiler') \/-> 'abstractCallGraphProfileNode') -> 'parent' -> () From: ( | {
         'Category: slicing\x7fModuleInfo: Module: profiler InitialContents: FollowSlot\x7fVisibility: public'
        
         principalDescendentIfPresent: pb IfAbsent: ab = ( |
            | 
            pb value: 
              (bcisAndNodes asVector 
               copySortBy: (| element: a Precedes: b = (a node time > b node time) |)
              ) firstIfAbsent: [^ ab value]).
        } | ) 

 bootstrap addSlotsTo: ((bootstrap stub -> 'traits' -> 'profiler') \/-> 'abstractCallGraphProfileNode') -> 'parent' -> () From: ( | {
         'Category: printing\x7fComment: Print callgraph cutting off (whatever that means)
as a fraction of total time. -- dmu 10/04\x7fModuleInfo: Module: profiler InitialContents: FollowSlot\x7fVisibility: public'
        
         printCutoff: cutoff = ( |
             threshold.
            | 
            threshold: cutoff * time max: 0.000001.
            iterate: [| :bci. :node. :depth. continue|
              continue: (node size = 0) || [node time >= threshold].
              printIndent: depth.
              (node idString, ' @', bci printString, 
               (node timeStringRelative: self),
               (profiler preferences printOptimizedTime
                  ifTrue: [node optimizedString] False: ''),
               (profiler preferences printNodeAllocation
                  ifTrue: [node allocationString] False: ''),
               (continue ifTrue: '' False:  [' ', node objectID])
              ) printLine.
              continue]).
        } | ) 

 bootstrap addSlotsTo: ((bootstrap stub -> 'traits' -> 'profiler') \/-> 'abstractCallGraphProfileNode') -> 'parent' -> () From: ( | {
         'Category: printing\x7fModuleInfo: Module: profiler InitialContents: FollowSlot\x7fVisibility: public'
        
         printFlat = ( |
             file <- ''.
             sorted.
            | 

            sorted: asFlatVector sortBy: (|
              element: e1 Precedes: e2 = (
                e1 node file < e2 node file ifTrue: [^e1 node true].
                (e1 node file = e2 node file) && [e1 node time > e2 node time])
            |).

            sorted do: [|:p. n |
               n: p node.
               n time > (time * 0.01) ifTrue: [
                 file = n file ifFalse: [
                   file: n file. 
                   ('*', file ) printLine
                 ].
                 ('   ', (n printStringRelative: self)) printLine
              ]
            ].
            '').
        } | ) 

 bootstrap addSlotsTo: ((bootstrap stub -> 'traits' -> 'profiler') \/-> 'abstractCallGraphProfileNode') -> 'parent' -> () From: ( | {
         'Category: printing\x7fCategory: hierarchical by call-graph\x7fModuleInfo: Module: profiler InitialContents: FollowSlot\x7fVisibility: public'
        
         printIndent: i = ( | {
                 'ModuleInfo: Module: profiler InitialContents: FollowSlot'
                
                 r.
                } 
            | 
            r: i.
            [r > 10] whileTrue: ['         .' print. r: r - 10 ].
            r do: [' ' print]).
        } | ) 

 bootstrap addSlotsTo: ((bootstrap stub -> 'traits' -> 'profiler') \/-> 'abstractCallGraphProfileNode') -> 'parent' -> () From: ( | {
         'Category: printing\x7fModuleInfo: Module: profiler InitialContents: FollowSlot\x7fVisibility: public'
        
         printLex = ( |
            | printLexCutoff: 0.10 * time).
        } | ) 

 bootstrap addSlotsTo: ((bootstrap stub -> 'traits' -> 'profiler') \/-> 'abstractCallGraphProfileNode') -> 'parent' -> () From: ( | {
         'Category: printing\x7fModuleInfo: Module: profiler InitialContents: FollowSlot\x7fVisibility: public'
        
         printLexCutoff: cutoff = ( |
            | 
            printLexCutoff: cutoff Bci: 0 Path: list copyRemoveAll).
        } | ) 

 bootstrap addSlotsTo: ((bootstrap stub -> 'traits' -> 'profiler') \/-> 'abstractCallGraphProfileNode') -> 'parent' -> () From: ( | {
         'Category: printing\x7fCategory: lexically\x7fModuleInfo: Module: profiler InitialContents: FollowSlot\x7fVisibility: private'
        
         printLexCutoff: cutoff Bci: bci Path: path = ( |
            | 
            path addLast: (
              ((nodeInfoForPrinting copy node: self) bci: bci) indent: path size).
            (isNode && [size > 0]) ifTrue: [ 
              bcisAndNodesDo: [|:bci. :n| n printLexCutoff: cutoff Bci: bci Path: path ]
            ] False: [ printPath: path Cutoff: cutoff ].
            path removeLast).
        } | ) 

 bootstrap addSlotsTo: ((bootstrap stub -> 'traits' -> 'profiler') \/-> 'abstractCallGraphProfileNode') -> 'parent' -> () From: ( | {
         'Category: printing\x7fModuleInfo: Module: profiler InitialContents: FollowSlot\x7fVisibility: public'
        
         printPage = ( | {
                 'ModuleInfo: Module: profiler InitialContents: FollowSlot'
                
                 dep <- 0.
                }  {
                 'ModuleInfo: Module: profiler InitialContents: FollowSlot'
                
                 height <- 0.
                } 
            | 
            height: tty height.
            dep: height.
            (numOfNodes: dep succ) >  height ifTrue: [
              dep: 0.
              [ height > numOfNodes: dep succ ] whileTrue:[ dep: dep succ ]].

            iterate: [| :b. :n. :d. cont <- false|
              cont: d < dep.
              ((b printString padOnLeft: d succ), ' ', n printString, 
               (' ', n objectID),
               (cont || [ n size > 0 ] ifTrue: '' False: '<-'))
                  printLine.
              cont
            ]).
        } | ) 

 bootstrap addSlotsTo: ((bootstrap stub -> 'traits' -> 'profiler') \/-> 'abstractCallGraphProfileNode') -> 'parent' -> () From: ( | {
         'Category: printing\x7fCategory: lexically\x7fModuleInfo: Module: profiler InitialContents: FollowSlot\x7fVisibility: private'
        
         printPath: path Cutoff: cutoff = ( |
             lexNode.
             printList <- bootstrap stub -> 'globals' -> 'list' -> ().
            | 
            "called for all leaveds in the call graph"
            path last node isNode && [path last node time < cutoff] 
              ifTrue: [^self].
            printList: list copyRemoveAll.
            [| :exit |
              path reverseDo: [|:e|
                lexNode ifNil: [
                  printList addFirst: e.
                  e node isBlockNode ifTrue: [lexNode: e node outer]
                ] IfNotNil: [
                  lexNode = e node ifTrue: [printList addFirst: e. lexNode: nil]
               ]]
            ] exit.
            printList do: [|:e|
              e printed ifFalse: [
                e indent do: [ ' ' print ].
                e bci = prologueBCI ifTrue: [ 
                  '^ ' print. e node printString printLine
                ] False: [
                  e bci printString print. 
                  ' ' print. e node printString printLine.
                  e printed: true]]]).
        } | ) 

 bootstrap addSlotsTo: ((bootstrap stub -> 'traits' -> 'profiler') \/-> 'abstractCallGraphProfileNode') -> 'parent' -> () From: ( | {
         'Category: printing\x7fModuleInfo: Module: profiler InitialContents: FollowSlot\x7fVisibility: public'
        
         printPrims = ( |
             prims.
             sortedPrims.
            | 
            'Time sec, time %, Primitivename' printLine.
            prims: dictionary copyRemoveAll.
            sortedPrims: list copyRemoveAll.
            iterate: [|:b. :n|
              n isPrimNode ifTrue: [| t |
                t: (prims at: n selector IfAbsent: 0).
                prims at: n selector Put: t + n shallowTime.
              ].
              true.
            ].
            prims do: [|:s. :v| sortedPrims add: s @ v].
            sortedPrims: sortedPrims asVector.
            sortedPrims sortBy: (| element: e1 Precedes: e2 = (e1 x > e2 x) |).
            sortedPrims do: [|:pair. t. node|
              t: pair x.
              node: pair y.
              t > 0.0 ifTrue: [
                ((((t/1000) printStringPrecision: 3) padOnLeft: 8),
                 ((((t/time)*100) printStringPrecision: 2) padOnLeft: 8),
                 '  ', node) printLine ]
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: ((bootstrap stub -> 'traits' -> 'profiler') \/-> 'abstractCallGraphProfileNode') -> 'parent' -> () From: ( | {
         'Category: printing\x7fModuleInfo: Module: profiler InitialContents: FollowSlot\x7fVisibility: public'
        
         printSelector: sel = ( | {
                 'ModuleInfo: Module: profiler InitialContents: FollowSlot'
                
                 file <- ''.
                }  {
                 'ModuleInfo: Module: profiler InitialContents: FollowSlot'
                
                 isRecursive <- bootstrap stub -> 'globals' -> 'false' -> ().
                }  {
                 'ModuleInfo: Module: profiler InitialContents: FollowSlot'
                
                 nodeSet <- bootstrap stub -> 'globals' -> 'set' -> ().
                }  {
                 'ModuleInfo: Module: profiler InitialContents: FollowSlot'
                
                 sorted <- ((bootstrap stub -> 'globals') \/-> 'vector') -> ().
                }  {
                 'ModuleInfo: Module: profiler InitialContents: FollowSlot'
                
                 total <- 0.
                } 
            | 
            nodeSet: list copy.
            pathIterate: [| :path. :bci. :node |
              node isMethodNode && [ node selector = sel ] ifTrue: [
                nodeSet add: node@(path asVector).
                "check path for recursion"
                isRecursive not ifTrue: [ 
                  [| :exit | 
                     path reverseDo:[| :n |
                       node = n ifTrue: [ isRecursive: true. exit value]]
                  ] exit.
                ].
              ]
            ].

            "print the set"
             sorted: nodeSet asVector.
             sorted sortBy: (|
               element: e1 Precedes: e2 = (
                 e1 x file < e2 x file ifTrue: [^1 true].
                 (e1 x file = e2 x file) && [e1 x time > e2 x time])
             |).
             sorted do: [|:p. n. path| 
                n: p x.
                path: p y.

                n time > (time * 0.01) ifTrue: [
                  file = n file ifFalse: [
                    file: n file. 
                    ('*', file ) printLine
                  ].

                  path size printLine.
                  ('   ', (n printStringRelative: self)) printLine.
                  total: total + n time.
               ]
             ].
             isRecursive ifTrue: [ (sel, ' is recursive') printLine]
                          False: [ ('Total: ', total printString, '%') printLine].
             '').
        } | ) 

 bootstrap addSlotsTo: ((bootstrap stub -> 'traits' -> 'profiler') \/-> 'abstractCallGraphProfileNode') -> 'parent' -> () From: ( | {
         'Category: printing\x7fCategory: printing just me\x7fModuleInfo: Module: profiler InitialContents: FollowSlot\x7fVisibility: public'
        
         printString = ( |
            | 
             idString,
            ', ',
            timeString,
            (profiler preferences printNodeAllocation ifFalse: '' True: [allocationString])).
        } | ) 

 bootstrap addSlotsTo: ((bootstrap stub -> 'traits' -> 'profiler') \/-> 'abstractCallGraphProfileNode') -> 'parent' -> () From: ( | {
         'Category: printing\x7fCategory: printing just me\x7fModuleInfo: Module: profiler InitialContents: FollowSlot\x7fVisibility: public'
        
         printStringRelative: node = ( |
            | 
            ((((100.0 * time)/ node time) printStringPrecision: 1)
               padOnLeft: 5), '%, ', printString).
        } | ) 

 bootstrap addSlotsTo: ((bootstrap stub -> 'traits' -> 'profiler') \/-> 'abstractCallGraphProfileNode') -> 'parent' -> () From: ( | {
         'Category: slicing\x7fModuleInfo: Module: profiler InitialContents: FollowSlot\x7fVisibility: public'
        
         profileSliceGroupOutlinersForChildren: bcisAndNodesToShow ControlPanel: controlPanel = ( |
            | 
            bcisAndNodesToShow asVector copyMappedBy: [|:p| 
                (profileSliceModel 
                  hierarchicalSuboutlinerForHolder: p 
                                             Items: p node bcisAndNodes
                                      ControlPanel: controlPanel) model myOutliner]).
        } | ) 

 bootstrap addSlotsTo: ((bootstrap stub -> 'traits' -> 'profiler') \/-> 'abstractCallGraphProfileNode') -> 'parent' -> () From: ( | {
         'Category: printing\x7fCategory: helpers\x7fModuleInfo: Module: profiler InitialContents: FollowSlot\x7fVisibility: private'
        
         prologueBCI = -2.
        } | ) 

 bootstrap addSlotsTo: ((bootstrap stub -> 'traits' -> 'profiler') \/-> 'abstractCallGraphProfileNode') -> 'parent' -> () From: ( | {
         'Category: pruning\x7fCategory: attaching pruning information to nodes\x7fModuleInfo: Module: profiler InitialContents: FollowSlot\x7fVisibility: public'
        
         pruningInfo = ( |
            | 
            pruningInfoOrNil ifNil: [pruningInfoOrNil: pruningInfoProto copyForNode: self. pruningInfoOrNil]).
        } | ) 

 bootstrap addSlotsTo: ((bootstrap stub -> 'traits' -> 'profiler') \/-> 'abstractCallGraphProfileNode') -> 'parent' -> () From: ( | {
         'Category: pruning\x7fCategory: attaching pruning information to nodes\x7fModuleInfo: Module: profiler InitialContents: FollowSlot\x7fVisibility: private'
        
         pruningInfoProto = bootstrap setObjectAnnotationOf: ((bootstrap stub -> 'traits' -> 'profiler') \/-> 'abstractCallGraphProfileNode') -> 'parent' -> 'pruningInfoProto' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits profiler abstractCallGraphProfileNode parent pruningInfoProto.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: ((bootstrap stub -> 'traits' -> 'profiler') \/-> 'abstractCallGraphProfileNode') -> 'parent' -> 'pruningInfoProto' -> () From: ( | {
         'Category: interesting features of my node\x7fComment: Nodes that take up a significant amount of time all by themselves
(not just through their children) are interesting.\x7fModuleInfo: Module: profiler InitialContents: InitializeToExpression: (false)\x7fVisibility: private'
        
         hasHighShallowTime <- bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: ((bootstrap stub -> 'traits' -> 'profiler') \/-> 'abstractCallGraphProfileNode') -> 'parent' -> 'pruningInfoProto' -> () From: ( | {
         'Category: interesting features of my node\x7fComment: Object-oriented programs tend to have call trees with long
stretches that look like this:
   84.0%
      0.1%
      83.9%
        0.1%
        83.8%
          0.1%
          83.7%
            ...

Occasionally, though, you get a node that has two or more
significant children:
   63.0%
      24.7%
      38.3%

These \"split points\" are interesting, and so the profiler shows
both the split point itself (the 63.0% node) and its children
(the 24.7% and 38.3% nodes) in the pruned profile.\x7fModuleInfo: Module: profiler InitialContents: InitializeToExpression: (false)\x7fVisibility: private'
        
         isASplitPoint <- bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: ((bootstrap stub -> 'traits' -> 'profiler') \/-> 'abstractCallGraphProfileNode') -> 'parent' -> 'pruningInfoProto' -> () From: ( | {
         'Category: module-based pruning\x7fComment: The profiler allows the user to partition the system\'s modules
into \"relevant\" and \"irrelevant\" modules. The profiler will not
show any nodes in irrelevant modules.\x7fModuleInfo: Module: profiler InitialContents: InitializeToExpression: (false)\x7fVisibility: private'
        
         isInARelevantModule <- bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: ((bootstrap stub -> 'traits' -> 'profiler') \/-> 'abstractCallGraphProfileNode') -> 'parent' -> 'pruningInfoProto' -> () From: ( | {
         'Category: interesting features of my node\x7fComment: The profiler lets the user specify a cutoff percentage. The profiler
only displays the first node below the cutoff point, and prunes away
the rest.\x7fModuleInfo: Module: profiler InitialContents: InitializeToExpression: (false)\x7fVisibility: private'
        
         isJustBelowCutoff <- bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: ((bootstrap stub -> 'traits' -> 'profiler') \/-> 'abstractCallGraphProfileNode') -> 'parent' -> 'pruningInfoProto' -> () From: ( | {
         'Category: module-based pruning\x7fComment: If a node in an irrelevant module has interesting features,
the profiler shows the nearest relevant ancestor and
descendants of that node.\x7fModuleInfo: Module: profiler InitialContents: InitializeToExpression: (false)\x7fVisibility: private'
        
         isNearestRelevantAncestorOfAnInterestingNode <- bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: ((bootstrap stub -> 'traits' -> 'profiler') \/-> 'abstractCallGraphProfileNode') -> 'parent' -> 'pruningInfoProto' -> () From: ( | {
         'Category: module-based pruning\x7fComment: See comment in isNearestRelevantAncestorOfAnInterestingNode.\x7fModuleInfo: Module: profiler InitialContents: InitializeToExpression: (false)\x7fVisibility: private'
        
         isNearestRelevantDescendantOfAnInterestingNode <- bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: ((bootstrap stub -> 'traits' -> 'profiler') \/-> 'abstractCallGraphProfileNode') -> 'parent' -> 'pruningInfoProto' -> () From: ( | {
         'Category: interesting features of my node\x7fComment: See comment in isASplitPoint.\x7fModuleInfo: Module: profiler InitialContents: InitializeToExpression: (false)\x7fVisibility: private'
        
         isTheChildOfASplitPoint <- bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: ((bootstrap stub -> 'traits' -> 'profiler') \/-> 'abstractCallGraphProfileNode') -> 'parent' -> 'pruningInfoProto' -> () From: ( | {
         'Comment: The node I am attached to.\x7fModuleInfo: Module: profiler InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         myNode.
        } | ) 

 bootstrap addSlotsTo: ((bootstrap stub -> 'traits' -> 'profiler') \/-> 'abstractCallGraphProfileNode') -> 'parent' -> 'pruningInfoProto' -> () From: ( | {
         'ModuleInfo: Module: profiler InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap setObjectAnnotationOf: ((bootstrap stub -> 'traits' -> 'profiler') \/-> 'abstractCallGraphProfileNode') -> 'parent' -> 'pruningInfoProto' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits profiler abstractCallGraphProfileNode parent pruningInfoProto parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: ((bootstrap stub -> 'traits' -> 'profiler') \/-> 'abstractCallGraphProfileNode') -> 'parent' -> 'pruningInfoProto' -> 'parent' -> () From: ( | {
         'Category: copying\x7fModuleInfo: Module: profiler InitialContents: FollowSlot\x7fVisibility: public'
        
         copyForNode: aNode = ( |
            | 
            copy myNode: aNode).
        } | ) 

 bootstrap addSlotsTo: ((bootstrap stub -> 'traits' -> 'profiler') \/-> 'abstractCallGraphProfileNode') -> 'parent' -> 'pruningInfoProto' -> 'parent' -> () From: ( | {
         'Category: printing\x7fModuleInfo: Module: profiler InitialContents: FollowSlot\x7fVisibility: private'
        
         interestingFeatureNames = ( |
             r.
            | 
            r: list copyRemoveAll.
            hasHighShallowTime                             ifTrue: [r add: 'hasHighShallowTime'                            ].
            isJustBelowCutoff                              ifTrue: [r add: 'isJustBelowCutoff'                             ].
            isNearestRelevantAncestorOfAnInterestingNode   ifTrue: [r add: 'isNearestRelevantAncestorOfAnInterestingNode'  ].
            isNearestRelevantDescendantOfAnInterestingNode ifTrue: [r add: 'isNearestRelevantDescendantOfAnInterestingNode'].
            isTheChildOfASplitPoint                        ifTrue: [r add: 'isTheChildOfASplitPoint'                       ].
            isASplitPoint                                  ifTrue: [r add: 'isASplitPoint'                                 ].
            r).
        } | ) 

 bootstrap addSlotsTo: ((bootstrap stub -> 'traits' -> 'profiler') \/-> 'abstractCallGraphProfileNode') -> 'parent' -> 'pruningInfoProto' -> 'parent' -> () From: ( | {
         'Category: testing\x7fModuleInfo: Module: profiler InitialContents: FollowSlot\x7fVisibility: private'
        
         isInteresting = ( |
            | 
                isASplitPoint
            || [isTheChildOfASplitPoint
            "|| [isJustBelowCutoff"
            || [hasHighShallowTime]]"]").
        } | ) 

 bootstrap addSlotsTo: ((bootstrap stub -> 'traits' -> 'profiler') \/-> 'abstractCallGraphProfileNode') -> 'parent' -> 'pruningInfoProto' -> 'parent' -> () From: ( | {
         'Category: determining interesting features\x7fModuleInfo: Module: profiler InitialContents: FollowSlot\x7fVisibility: public'
        
         markInterestingNodesForCutoff: cutoff = ( |
             shallowTimeSignificanceThreshold = 0.02.
            | 
            myNode normalizedTime < cutoff ifTrue: [
              isJustBelowCutoff: true.
              "Don't bother recursing through myNode's children - we
               don't care about the interestingness of any nodes below
               the cutoff."
            ] False: [ |count <- 0|
              myNode significantChildrenDo:[|:n| n pruningInfo isTheChildOfASplitPoint: true. count: count succ].
              count > 1 ifTrue: [isASplitPoint: true].

              myNode shallowNormalizedTime >= shallowTimeSignificanceThreshold ifTrue: [
                hasHighShallowTime: true.
              ].

              myNode nodesDo: [|:n| n pruningInfo markInterestingNodesForCutoff: cutoff].
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: ((bootstrap stub -> 'traits' -> 'profiler') \/-> 'abstractCallGraphProfileNode') -> 'parent' -> 'pruningInfoProto' -> 'parent' -> () From: ( | {
         'Category: determining interesting features\x7fModuleInfo: Module: profiler InitialContents: FollowSlot\x7fVisibility: public'
        
         markRelevantInterestingNodesForModules: aModulePartitioning NearestRelevantAncestor: relevantAncestor LookingForARelevantDescendant: isLookingForARelevantDescendant = ( |
             isLookingForNextRelevantDescendants <- bootstrap stub -> 'globals' -> 'false' -> ().
             relevantAncestorToPassDown.
            | 

            "If a node in an irrelevant module has interesting features, the profiler
             should show the nearest relevant ancestor and descendants of that node.
             To do this, we pass down two pieces of information as we recurse through
             the tree:
                relevantAncestor - The nearest relevant ancestor of myNode, so that if
                                   myNode happens to be interesting but in an irrelevant
                                   module, we can mark the relevantAncestor with the
                                   isNearestRelevantAncestorOfAnInterestingNode flag.

                isLookingForARelevantDescendant - Iff one of myNode's ancestors is
                                   interesting but in an irrelevant module, and all
                                   of the ancestors between that ancestor and myNode
                                   are in irrelevant modules, then this boolean will
                                   be true."

            isInARelevantModule:  aModulePartitioning includes: myNode moduleIfNone: ''.

            isLookingForARelevantDescendant ifTrue: [
              isInARelevantModule ifTrue: [
                isNearestRelevantDescendantOfAnInterestingNode: true.
              ] False: [
                "Haven't found a relevant descendant yet, so we need to keep looking
                 through this node's children."
                isLookingForNextRelevantDescendants: true.
              ].
            ].

            isInteresting ifTrue: [
              isInARelevantModule ifFalse: [
                relevantAncestor pruningInfo isNearestRelevantAncestorOfAnInterestingNode: true.
                isLookingForNextRelevantDescendants: true.
              ].
            ].

            relevantAncestorToPassDown: isInARelevantModule ifTrue: [myNode]
                                                             False: [relevantAncestor].

            "Recurse through myNode's children."
            myNode nodesDo: [|:n|
              n pruningInfo markRelevantInterestingNodesForModules: aModulePartitioning
                                           NearestRelevantAncestor: relevantAncestorToPassDown
                                     LookingForARelevantDescendant: isLookingForNextRelevantDescendants.
            ].

            self).
        } | ) 

 bootstrap addSlotsTo: ((bootstrap stub -> 'traits' -> 'profiler') \/-> 'abstractCallGraphProfileNode') -> 'parent' -> 'pruningInfoProto' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: profiler InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'clonable' -> ().
        } | ) 

 bootstrap addSlotsTo: ((bootstrap stub -> 'traits' -> 'profiler') \/-> 'abstractCallGraphProfileNode') -> 'parent' -> 'pruningInfoProto' -> 'parent' -> () From: ( | {
         'Category: printing\x7fModuleInfo: Module: profiler InitialContents: FollowSlot\x7fVisibility: public'
        
         printString = ( |
             s <- ''.
            | 
            interestingFeatureNames do: [|:n| s: s & n   ]
                           SeparatedBy: [     s: s & ', '].
            s flatString).
        } | ) 

 bootstrap addSlotsTo: ((bootstrap stub -> 'traits' -> 'profiler') \/-> 'abstractCallGraphProfileNode') -> 'parent' -> 'pruningInfoProto' -> 'parent' -> () From: ( | {
         'Category: testing\x7fModuleInfo: Module: profiler InitialContents: FollowSlot\x7fVisibility: public'
        
         shouldBeShown = ( |
            | 
                isNearestRelevantAncestorOfAnInterestingNode
            || [isNearestRelevantDescendantOfAnInterestingNode
            || [isInARelevantModule && [isInteresting]]]).
        } | ) 

 bootstrap addSlotsTo: ((bootstrap stub -> 'traits' -> 'profiler') \/-> 'abstractCallGraphProfileNode') -> 'parent' -> () From: ( | {
         'Category: printing\x7fCategory: printing just me\x7fModuleInfo: Module: profiler InitialContents: FollowSlot\x7fVisibility: public'
        
         pruningInfoString = ( |
             s.
            | 
            s: pruningInfo printString.
            s = '' ifFalse: [s: ', ', s].
            s).
        } | ) 

 bootstrap addSlotsTo: ((bootstrap stub -> 'traits' -> 'profiler') \/-> 'abstractCallGraphProfileNode') -> 'parent' -> () From: ( | {
         'Category: printing\x7fCategory: flat\x7fComment: find the top most recursive node in path\x7fModuleInfo: Module: profiler InitialContents: FollowSlot\x7fVisibility: private'
        
         recursion: path Node: node IfPresent: pBlk IfAbsent: aBlk = ( |
             bot.
            | 
            lexScope: path Node: node Do: [|:n | n = node ifTrue: [bot: n]].
            bot ifNil: aBlk IfNotNil: pBlk).
        } | ) 

 bootstrap addSlotsTo: ((bootstrap stub -> 'traits' -> 'profiler') \/-> 'abstractCallGraphProfileNode') -> 'parent' -> () From: ( | {
         'Category: iterating\x7fModuleInfo: Module: profiler InitialContents: FollowSlot\x7fVisibility: private'
        
         recursiveIterate: blk = ( |
            | 
            recursiveIterate: blk Bci: 0 Depth: 0).
        } | ) 

 bootstrap addSlotsTo: ((bootstrap stub -> 'traits' -> 'profiler') \/-> 'abstractCallGraphProfileNode') -> 'parent' -> () From: ( | {
         'Category: iterating\x7fModuleInfo: Module: profiler InitialContents: FollowSlot\x7fVisibility: private'
        
         recursiveIterate: blk Bci: b Depth: depth = ( |
            | 
            "Traverses the call graph recursively and evaluates blk for each 
             (bci, node) pair"
            (blk value: b With: self With: depth) ifTrue: [
              bcisAndNodesDo: [|:b. :n | n recursiveIterate: blk Bci: b Depth: depth succ]].
            self).
        } | ) 

 bootstrap addSlotsTo: ((bootstrap stub -> 'traits' -> 'profiler') \/-> 'abstractCallGraphProfileNode') -> 'parent' -> () From: ( | {
         'Category: owner\x7fModuleInfo: Module: profiler InitialContents: FollowSlot\x7fVisibility: public'
        
         setOwners = ( |
            | 
            nodesDo: [|:n| n owner: self.
                           n setOwners].
            self).
        } | ) 

 bootstrap addSlotsTo: ((bootstrap stub -> 'traits' -> 'profiler') \/-> 'abstractCallGraphProfileNode') -> 'parent' -> () From: ( | {
         'Category: timing\x7fModuleInfo: Module: profiler InitialContents: FollowSlot\x7fVisibility: public'
        
         shallowNormalizedTime = ( |
            | 
            time = 0 ifTrue: [^ 0].
            shallowTime asFloat / totalTime asFloat).
        } | ) 

 bootstrap addSlotsTo: ((bootstrap stub -> 'traits' -> 'profiler') \/-> 'abstractCallGraphProfileNode') -> 'parent' -> () From: ( | {
         'Category: printing\x7fCategory: printing just me\x7fModuleInfo: Module: profiler InitialContents: FollowSlot\x7fVisibility: public'
        
         shrink: str = ( |
            | str copyAtMostWithEllipsis: 25).
        } | ) 

 bootstrap addSlotsTo: ((bootstrap stub -> 'traits' -> 'profiler') \/-> 'abstractCallGraphProfileNode') -> 'parent' -> () From: ( | {
         'Category: printing\x7fCategory: printing just me\x7fModuleInfo: Module: profiler InitialContents: FollowSlot\x7fVisibility: public'
        
         shrinkWrap: str = ( | {
                 'ModuleInfo: Module: profiler InitialContents: FollowSlot'
                
                 r <- ''.
                }  {
                 'ModuleInfo: Module: profiler InitialContents: FollowSlot'
                
                 space <- bootstrap stub -> 'globals' -> 'false' -> ().
                } 
            | 
            (str copyFrom: str leadingWhiteSpace) do: [| :c |
              ('\n\t ' includes: c)
                 ifFalse: [ r: r, c. space: false]
                    True: [space ifFalse: [ r: r, ' '. space: true ]]].
            shrink: r).
        } | ) 

 bootstrap addSlotsTo: ((bootstrap stub -> 'traits' -> 'profiler') \/-> 'abstractCallGraphProfileNode') -> 'parent' -> () From: ( | {
         'Category: pruning\x7fCategory: significant children\x7fModuleInfo: Module: profiler InitialContents: FollowSlot\x7fVisibility: private'
        
         significantChildrenDo: blk = ( |
            | 
            nodesDo: [|:n| (isSignificantChild: n) ifTrue: [blk value: n]].
            self).
        } | ) 

 bootstrap addSlotsTo: ((bootstrap stub -> 'traits' -> 'profiler') \/-> 'abstractCallGraphProfileNode') -> 'parent' -> () From: ( | {
         'Category: pruning\x7fModuleInfo: Module: profiler InitialContents: FollowSlot\x7fVisibility: public'
        
         skipTop = ( |
             n.
            | 
            n: self.
            [|:exit|
              n selector = '_OnNonLocalReturn:IfFail:'
                ifTrue: exit.
              n size = 2 ifFalse: [^ n].
              n: n at: 1
            ] loopExit.
            n at: 1).
        } | ) 

 bootstrap addSlotsTo: ((bootstrap stub -> 'traits' -> 'profiler') \/-> 'abstractCallGraphProfileNode') -> 'parent' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: profiler InitialContents: FollowSlot\x7fVisibility: public'
        
         slotIfNone: nb = ( |
            | 
            nb value).
        } | ) 

 bootstrap addSlotsTo: ((bootstrap stub -> 'traits' -> 'profiler') \/-> 'abstractCallGraphProfileNode') -> 'parent' -> () From: ( | {
         'Category: printing\x7fModuleInfo: Module: profiler InitialContents: FollowSlot\x7fVisibility: public'
        
         storeStringIfFail: fb = ( |
            | fb value: 'unimplemented').
        } | ) 

 bootstrap addSlotsTo: ((bootstrap stub -> 'traits' -> 'profiler') \/-> 'abstractCallGraphProfileNode') -> 'parent' -> () From: ( | {
         'Category: comparison\x7fModuleInfo: Module: profiler InitialContents: FollowSlot\x7fVisibility: private'
        
         structuralHashOf: obj = ( |
            | 
            (reflect: obj) names hash).
        } | ) 

 bootstrap addSlotsTo: ((bootstrap stub -> 'traits' -> 'profiler') \/-> 'abstractCallGraphProfileNode') -> 'parent' -> () From: ( | {
         'Category: arithmetic\x7fModuleInfo: Module: profiler InitialContents: FollowSlot\x7fVisibility: public'
        
         subtractInfo: node = ( |
            | 
            time:              time        - node time.
            bytes:             bytes       - node bytes.
            blocks:            blocks      - node blocks.
            optimized: 0.0).
        } | ) 

 bootstrap addSlotsTo: ((bootstrap stub -> 'traits' -> 'profiler') \/-> 'abstractCallGraphProfileNode') -> 'parent' -> () From: ( | {
         'Category: arithmetic\x7fModuleInfo: Module: profiler InitialContents: FollowSlot'
        
         sum: name = ( |
             s <- 0.0.
            | 
            (collect: name) do: [| :e |
               (e printStringRelative: self) printLine.
               s: s + e time.
            ].
            ('Total ', (s/time) printString) printLine.
            self).
        } | ) 

 bootstrap addSlotsTo: ((bootstrap stub -> 'traits' -> 'profiler') \/-> 'abstractCallGraphProfileNode') -> 'parent' -> () From: ( | {
         'Category: printing\x7fCategory: printing just me\x7fModuleInfo: Module: profiler InitialContents: FollowSlot\x7fVisibility: public'
        
         timeString = ( |
            | 
            ((normalizedTime * 100.0) printStringPrecision: 0), '%').
        } | ) 

 bootstrap addSlotsTo: ((bootstrap stub -> 'traits' -> 'profiler') \/-> 'abstractCallGraphProfileNode') -> 'parent' -> () From: ( | {
         'Category: printing\x7fCategory: printing just me\x7fModuleInfo: Module: profiler InitialContents: FollowSlot\x7fVisibility: public'
        
         timeStringRelative: node = ( |
            | 
            ', ',
            (((100.0 * time) / (node time max: 0.001)) printStringPrecision: 1),
            '%').
        } | ) 

 bootstrap addSlotsTo: ((bootstrap stub -> 'traits' -> 'profiler') \/-> 'abstractCallGraphProfileNode') -> 'parent' -> () From: ( | {
         'Category: printing\x7fCategory: printing just me\x7fModuleInfo: Module: profiler InitialContents: FollowSlot\x7fVisibility: private'
        
         truncate: str Width: width = ( | {
                 'ModuleInfo: Module: profiler InitialContents: FollowSlot'
                
                 field <- ''.
                } 
            | 
            field: str shrinkwrapped detabified: 1.
            field size do: [|:i| ('\n' = (field at: i)) ifTrue:
                                   [ field at: i Put: ' ' ] ].
            (width <= str size) ifTrue:[
               field: field copyAtMostWithEllipsis: width].
            field).
        } | ) 

 bootstrap addSlotsTo: ((bootstrap stub -> 'traits' -> 'profiler') \/-> 'abstractCallGraphProfileNode') -> () From: ( | {
         'ModuleInfo: Module: profiler InitialContents: FollowSlot\x7fVisibility: private'
        
         prototype = ( |
            | traits profiler copyDownTemplate).
        } | ) 

 bootstrap addSlotsTo: ((bootstrap stub -> 'traits' -> 'profiler') \/-> 'abstractCallGraphProfileNode') -> () From: ( | {
         'Category: profiling info not from VM\x7fComment: We don\'t bother determining the pruning information until
the user asks for a pruned profile, so by default the value
of this slot is nil.\x7fModuleInfo: Module: profiler InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         pruningInfoOrNil.
        } | ) 

 bootstrap addSlotsTo: ((bootstrap stub -> 'traits' -> 'profiler') \/-> 'abstractCallGraphProfileNode') -> () From: ( | {
         'Category: profiling info not from VM\x7fModuleInfo: Module: profiler InitialContents: InitializeToExpression: (0)\x7fVisibility: public'
        
         shallowTime <- 0.
        } | ) 

 bootstrap addSlotsTo: ((bootstrap stub -> 'traits' -> 'profiler') \/-> 'abstractCallGraphProfileNode') -> () From: ( | {
         'Category: profiling info\x7fModuleInfo: Module: profiler InitialContents: FollowSlot\x7fVisibility: publicReadPrivateWrite'
        
         time <- 0.0.
        } | ) 

 bootstrap addSlotsTo: ((bootstrap stub -> 'traits' -> 'profiler') \/-> 'abstractCallGraphProfileNode') -> () From: ( | {
         'Category: profiling info not from VM\x7fComment: Fraction of total time\x7fModuleInfo: Module: profiler InitialContents: InitializeToExpression: (1)\x7fVisibility: public'
        
         totalTime <- 1.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'profiler' -> () From: ( | {
         'Category: passed into VM to get profile\x7fCategory: passed in to VM for call graph\x7fCategory: nodes\x7fModuleInfo: Module: profiler InitialContents: FollowSlot\x7fVisibility: public'
        
         accessPt = bootstrap define: ((bootstrap stub -> 'traits' -> 'profiler') \/-> 'accessPt') -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             bootstrap remove: 'prototype' From:
             traits profiler abstractCallGraphProfileNode copy ) From: bootstrap setObjectAnnotationOf: ((bootstrap stub -> 'traits' -> 'profiler') \/-> 'accessPt') -> () From: ( |
             {} = 'ModuleInfo: Creator: traits profiler accessPt.

CopyDowns:
traits profiler abstractCallGraphProfileNode. copy 
SlotsToOmit: parent prototype.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: ((bootstrap stub -> 'traits' -> 'profiler') \/-> 'accessPt') -> () From: ( | {
         'Category: profiling info\x7fModuleInfo: Module: profiler InitialContents: FollowSlot\x7fVisibility: publicReadPrivateWrite'
        
         methodHolder <- bootstrap setObjectAnnotationOf: ((bootstrap stub -> 'traits' -> 'profiler') \/-> 'accessPt') -> 'methodHolder' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits profiler accessPt methodHolder.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: ((bootstrap stub -> 'traits' -> 'profiler') \/-> 'accessPt') -> () From: ( | {
         'ModuleInfo: Module: profiler InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap setObjectAnnotationOf: ((bootstrap stub -> 'traits' -> 'profiler') \/-> 'accessPt') -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits profiler accessPt parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: ((bootstrap stub -> 'traits' -> 'profiler') \/-> 'accessPt') -> 'parent' -> () From: ( | {
         'Category: testing\x7fModuleInfo: Module: profiler InitialContents: FollowSlot\x7fVisibility: public'
        
         = node = ( |
            | 
            node isAccessNode                        ifFalse: [^false].
            node selector = selector                 ifFalse: [^false].
            (is: node receiver    EqualTo: receiver) ifFalse: [^false].
            is: node methodHolder EqualTo: methodHolder).
        } | ) 

 bootstrap addSlotsTo: ((bootstrap stub -> 'traits' -> 'profiler') \/-> 'accessPt') -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: profiler InitialContents: FollowSlot\x7fVisibility: public'
        
         file = '~access'.
        } | ) 

 bootstrap addSlotsTo: ((bootstrap stub -> 'traits' -> 'profiler') \/-> 'accessPt') -> 'parent' -> () From: ( | {
         'Category: testing\x7fModuleInfo: Module: profiler InitialContents: FollowSlot\x7fVisibility: public'
        
         hash = ( |
            | 
            selector hash ^^ (structuralHashOf: receiver) ^^ (structuralHashOf: methodHolder)).
        } | ) 

 bootstrap addSlotsTo: ((bootstrap stub -> 'traits' -> 'profiler') \/-> 'accessPt') -> 'parent' -> () From: ( | {
         'Category: printing\x7fModuleInfo: Module: profiler InitialContents: FollowSlot\x7fVisibility: public'
        
         idString = ( |
            | shrink: selector).
        } | ) 

 bootstrap addSlotsTo: ((bootstrap stub -> 'traits' -> 'profiler') \/-> 'accessPt') -> 'parent' -> () From: ( | {
         'Category: testing\x7fModuleInfo: Module: profiler InitialContents: FollowSlot\x7fVisibility: public'
        
         isAccessNode = bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: ((bootstrap stub -> 'traits' -> 'profiler') \/-> 'accessPt') -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: profiler InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = ((bootstrap stub -> 'traits' -> 'profiler') \/-> 'abstractCallGraphProfileNode') -> 'parent' -> ().
        } | ) 

 bootstrap addSlotsTo: ((bootstrap stub -> 'traits' -> 'profiler') \/-> 'accessPt') -> () From: ( | {
         'ModuleInfo: Module: profiler InitialContents: FollowSlot\x7fVisibility: private'
        
         prototype = ( |
            | traits profiler accessPt).
        } | ) 

 bootstrap addSlotsTo: ((bootstrap stub -> 'traits' -> 'profiler') \/-> 'accessPt') -> () From: ( | {
         'Category: profiling info\x7fModuleInfo: Module: profiler InitialContents: FollowSlot\x7fVisibility: publicReadPrivateWrite'
        
         receiver <- bootstrap setObjectAnnotationOf: ((bootstrap stub -> 'traits' -> 'profiler') \/-> 'accessPt') -> 'receiver' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits profiler accessPt receiver.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: ((bootstrap stub -> 'traits' -> 'profiler') \/-> 'accessPt') -> () From: ( | {
         'Category: profiling info\x7fModuleInfo: Module: profiler InitialContents: FollowSlot\x7fVisibility: publicReadPrivateWrite'
        
         selector <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'profiler' -> () From: ( | {
         'Category: passed into VM to get profile\x7fCategory: passed in to VM for call graph\x7fCategory: nodes\x7fModuleInfo: Module: profiler InitialContents: FollowSlot\x7fVisibility: public'
        
         blockPt = bootstrap define: ((bootstrap stub -> 'traits' -> 'profiler') \/-> 'blockPt') -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             bootstrap remove: 'prototype' From:
             traits profiler abstractCallGraphProfileNode copy ) From: bootstrap setObjectAnnotationOf: ((bootstrap stub -> 'traits' -> 'profiler') \/-> 'blockPt') -> () From: ( |
             {} = 'ModuleInfo: Creator: traits profiler blockPt.

CopyDowns:
traits profiler abstractCallGraphProfileNode. copy 
SlotsToOmit: parent prototype.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: ((bootstrap stub -> 'traits' -> 'profiler') \/-> 'blockPt') -> () From: ( | {
         'Category: profiling info\x7fModuleInfo: Module: profiler InitialContents: FollowSlot\x7fVisibility: publicReadPrivateWrite'
        
         method <- bootstrap stub -> 'globals' -> 'mirrors' -> 'method' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'profiler' -> () From: ( | {
         'Category: passed into VM to get profile\x7fCategory: passed in to VM for call graph\x7fCategory: nodes\x7fModuleInfo: Module: profiler InitialContents: FollowSlot\x7fVisibility: public'
        
         methodPt = bootstrap define: ((bootstrap stub -> 'traits' -> 'profiler') \/-> 'methodPt') -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             bootstrap remove: 'prototype' From:
             traits profiler abstractCallGraphProfileNode copy ) From: bootstrap setObjectAnnotationOf: ((bootstrap stub -> 'traits' -> 'profiler') \/-> 'methodPt') -> () From: ( |
             {} = 'ModuleInfo: Creator: traits profiler methodPt.

CopyDowns:
traits profiler abstractCallGraphProfileNode. copy 
SlotsToOmit: parent prototype.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: ((bootstrap stub -> 'traits' -> 'profiler') \/-> 'blockPt') -> () From: ( | {
         'Category: profiling info\x7fModuleInfo: Module: profiler InitialContents: FollowSlot\x7fVisibility: publicReadPrivateWrite'
        
         outer <- ((bootstrap stub -> 'traits' -> 'profiler') \/-> 'methodPt') -> ().
        } | ) 

 bootstrap addSlotsTo: ((bootstrap stub -> 'traits' -> 'profiler') \/-> 'blockPt') -> () From: ( | {
         'ModuleInfo: Module: profiler InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap setObjectAnnotationOf: ((bootstrap stub -> 'traits' -> 'profiler') \/-> 'blockPt') -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits profiler blockPt parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: ((bootstrap stub -> 'traits' -> 'profiler') \/-> 'blockPt') -> 'parent' -> () From: ( | {
         'Category: testing\x7fModuleInfo: Module: profiler InitialContents: FollowSlot\x7fVisibility: public'
        
         = node = ( |
            | 
            node isBlockNode         ifFalse: [^false].
            node selector = selector ifFalse: [^false].
            node method   = method).
        } | ) 

 bootstrap addSlotsTo: ((bootstrap stub -> 'traits' -> 'profiler') \/-> 'blockPt') -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: profiler InitialContents: FollowSlot\x7fVisibility: public'
        
         file = ( |
            | method file).
        } | ) 

 bootstrap addSlotsTo: ((bootstrap stub -> 'traits' -> 'profiler') \/-> 'blockPt') -> 'parent' -> () From: ( | {
         'Category: testing\x7fModuleInfo: Module: profiler InitialContents: FollowSlot\x7fVisibility: public'
        
         hash = ( |
            | 
            selector hash ^^ method hash).
        } | ) 

 bootstrap addSlotsTo: ((bootstrap stub -> 'traits' -> 'profiler') \/-> 'blockPt') -> 'parent' -> () From: ( | {
         'Category: printing\x7fModuleInfo: Module: profiler InitialContents: FollowSlot\x7fVisibility: public'
        
         holderIDString = ( |
            | 
            outer ifNil: [' no holder'] IfNotNil: [outer holderIDString]).
        } | ) 

 bootstrap addSlotsTo: ((bootstrap stub -> 'traits' -> 'profiler') \/-> 'blockPt') -> 'parent' -> () From: ( | {
         'Category: printing\x7fModuleInfo: Module: profiler InitialContents: FollowSlot\x7fVisibility: public'
        
         idString = ( |
            | '[', (shrinkWrap: method source), ']').
        } | ) 

 bootstrap addSlotsTo: ((bootstrap stub -> 'traits' -> 'profiler') \/-> 'blockPt') -> 'parent' -> () From: ( | {
         'Category: testing\x7fModuleInfo: Module: profiler InitialContents: FollowSlot\x7fVisibility: public'
        
         isBlockNode = bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: ((bootstrap stub -> 'traits' -> 'profiler') \/-> 'blockPt') -> 'parent' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: profiler InitialContents: FollowSlot\x7fVisibility: public'
        
         methodHolder = ( |
            | 
            outer ifNil: [()] IfNotNil: [outer methodHolder]).
        } | ) 

 bootstrap addSlotsTo: ((bootstrap stub -> 'traits' -> 'profiler') \/-> 'blockPt') -> 'parent' -> () From: ( | {
         'Category: printing\x7fModuleInfo: Module: profiler InitialContents: FollowSlot'
        
         ownerIDString = ( |
            | 
            outer ifNil: [' no owner'] IfNotNil: [outer idString]).
        } | ) 

 bootstrap addSlotsTo: ((bootstrap stub -> 'traits' -> 'profiler') \/-> 'blockPt') -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: profiler InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = ((bootstrap stub -> 'traits' -> 'profiler') \/-> 'abstractCallGraphProfileNode') -> 'parent' -> ().
        } | ) 

 bootstrap addSlotsTo: ((bootstrap stub -> 'traits' -> 'profiler') \/-> 'blockPt') -> 'parent' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: profiler InitialContents: FollowSlot\x7fVisibility: public'
        
         slotIfNone: nb = ( |
            | 
            outer ifNil: nb IfNotNil: [outer slotIfNone: nb]).
        } | ) 

 bootstrap addSlotsTo: ((bootstrap stub -> 'traits' -> 'profiler') \/-> 'blockPt') -> () From: ( | {
         'ModuleInfo: Module: profiler InitialContents: FollowSlot\x7fVisibility: private'
        
         prototype = ( |
            | 
            traits profiler blockPt).
        } | ) 

 bootstrap addSlotsTo: ((bootstrap stub -> 'traits' -> 'profiler') \/-> 'blockPt') -> () From: ( | {
         'Category: profiling info\x7fModuleInfo: Module: profiler InitialContents: FollowSlot\x7fVisibility: publicReadPrivateWrite'
        
         selector <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'profiler' -> () From: ( | {
         'Category: primitives\x7fModuleInfo: Module: profiler InitialContents: FollowSlot\x7fVisibility: public'
        
         callGraph = ( |
            | callGraph: 1).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'profiler' -> () From: ( | {
         'Category: primitives\x7fModuleInfo: Module: profiler InitialContents: FollowSlot\x7fVisibility: public'
        
         callGraph: cutoffPct = ( |
            | 
            callGraph: cutoffPct IfFail: raiseError).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'profiler' -> () From: ( | {
         'Category: primitives\x7fComment: returns a copy of the VM callgraph\x7fModuleInfo: Module: profiler InitialContents: FollowSlot\x7fVisibility: public'
        
         callGraph: cutoffPct IfFail: blk = ( |
             r.
            | 
            r: _ProfilerCopyGraphMethod: methodPt
                               Block: blockPt
                              Access: accessPt
                                Prim: primPt
                                Leaf: leafPt
                                Fold: foldPt
                             Unknown: unknownObj
                              Cutoff: cutoffPct
                              IfFail: [|:error|
               'outOfMemoryError' == error ifFalse: [
                 blk value: error
               ] True: [
                 memory allocationFailed.
                 _ProfilerCopyGraphMethod: methodPt
                                    Block: blockPt
                                   Access: accessPt
                                     Prim: primPt
                                     Leaf: leafPt
                                     Fold: foldPt
                                  Unknown: unknownObj
                                   Cutoff: cutoffPct
                                   IfFail: blk
               ]
            ].
            r initializeTree).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'profiler' -> () From: ( | {
         'Category: creating\x7fModuleInfo: Module: profiler InitialContents: FollowSlot\x7fVisibility: public'
        
         copyAndRun: b = ( |
            | 
            (copyForBlock: b) run: b).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'profiler' -> () From: ( | {
         'Category: creating\x7fModuleInfo: Module: profiler InitialContents: FollowSlot\x7fVisibility: public'
        
         copyForBlock: b = ( |
            | 
            copy blockMethodSource: b asMirror methodSource).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'profiler' -> () From: ( | {
         'Category: primitives\x7fModuleInfo: Module: profiler InitialContents: FollowSlot\x7fVisibility: public'
        
         disengage = ( |
            | disengageIfFail: raiseError).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'profiler' -> () From: ( | {
         'Category: primitives\x7fModuleInfo: Module: profiler InitialContents: FollowSlot\x7fVisibility: public'
        
         disengageIfFail: blk = ( |
            | _ProfilerDisengageIfFail: blk).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'profiler' -> () From: ( | {
         'Category: primitives\x7fModuleInfo: Module: profiler InitialContents: FollowSlot\x7fVisibility: public'
        
         engage: process = ( |
            | 
            engage: process IfFail: raiseError).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'profiler' -> () From: ( | {
         'Category: primitives\x7fModuleInfo: Module: profiler InitialContents: FollowSlot\x7fVisibility: public'
        
         engage: process IfFail: blk = ( |
            | 
            _ProfilerEngage: process IfFail: blk).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'profiler' -> () From: ( | {
         'Category: passed into VM to get profile\x7fCategory: passed in to VM for call graph\x7fCategory: edges\x7fComment: prototype for fold edges.
Only used if _ProfilerUseFold is true, which is false by default.
Who knows if this still (ever) works(ed)? -- dmu 10/04\x7fModuleInfo: Module: profiler InitialContents: FollowSlot\x7fVisibility: public'
        
         foldPt = bootstrap define: ((bootstrap stub -> 'traits' -> 'profiler') \/-> 'foldPt') -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals vector copyRemoveAll ) From: bootstrap setObjectAnnotationOf: ((bootstrap stub -> 'traits' -> 'profiler') \/-> 'foldPt') -> () From: ( |
             {} = 'ModuleInfo: Creator: traits profiler foldPt.

CopyDowns:
globals vector. copyRemoveAll 
SlotsToOmit: parent.

'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: ((bootstrap stub -> 'traits' -> 'profiler') \/-> 'foldPt') -> () From: ( | {
         'Category: profiling info\x7fModuleInfo: Module: profiler InitialContents: InitializeToExpression: (0)'
        
         average <- 0.
        } | ) 

 bootstrap addSlotsTo: ((bootstrap stub -> 'traits' -> 'profiler') \/-> 'foldPt') -> () From: ( | {
         'Category: profiling info\x7fModuleInfo: Module: profiler InitialContents: InitializeToExpression: (nil)'
        
         fold.
        } | ) 

 bootstrap addSlotsTo: ((bootstrap stub -> 'traits' -> 'profiler') \/-> 'foldPt') -> () From: ( | {
         'Category: profiling info\x7fModuleInfo: Module: profiler InitialContents: InitializeToExpression: (0)'
        
         max <- 0.
        } | ) 

 bootstrap addSlotsTo: ((bootstrap stub -> 'traits' -> 'profiler') \/-> 'foldPt') -> () From: ( | {
         'Category: profiling info\x7fModuleInfo: Module: profiler InitialContents: InitializeToExpression: (0)'
        
         min <- 0.
        } | ) 

 bootstrap addSlotsTo: ((bootstrap stub -> 'traits' -> 'profiler') \/-> 'foldPt') -> () From: ( | {
         'ModuleInfo: Module: profiler InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap setObjectAnnotationOf: ((bootstrap stub -> 'traits' -> 'profiler') \/-> 'foldPt') -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits profiler foldPt parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: ((bootstrap stub -> 'traits' -> 'profiler') \/-> 'foldPt') -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: profiler InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'vector' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'profiler' -> () From: ( | {
         'Category: testing\x7fModuleInfo: Module: profiler InitialContents: FollowSlot\x7fVisibility: public'
        
         isActive = ( |
            | processIfFail: [^false]. true).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'profiler' -> () From: ( | {
         'Category: passed into VM to get profile\x7fCategory: passed in to VM for call graph\x7fCategory: nodes\x7fModuleInfo: Module: profiler InitialContents: FollowSlot\x7fVisibility: public'
        
         leafPt = bootstrap define: ((bootstrap stub -> 'traits' -> 'profiler') \/-> 'leafPt') -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             bootstrap remove: 'prototype' From:
             traits profiler abstractCallGraphProfileNode copy ) From: bootstrap setObjectAnnotationOf: ((bootstrap stub -> 'traits' -> 'profiler') \/-> 'leafPt') -> () From: ( |
             {} = 'ModuleInfo: Creator: traits profiler leafPt.

CopyDowns:
traits profiler abstractCallGraphProfileNode. copy 
SlotsToOmit: parent prototype.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: ((bootstrap stub -> 'traits' -> 'profiler') \/-> 'leafPt') -> () From: ( | {
         'ModuleInfo: Module: profiler InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap setObjectAnnotationOf: ((bootstrap stub -> 'traits' -> 'profiler') \/-> 'leafPt') -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits profiler leafPt parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: ((bootstrap stub -> 'traits' -> 'profiler') \/-> 'leafPt') -> 'parent' -> () From: ( | {
         'Category: testing\x7fModuleInfo: Module: profiler InitialContents: FollowSlot\x7fVisibility: public'
        
         = node = ( |
            | node isLeafNode).
        } | ) 

 bootstrap addSlotsTo: ((bootstrap stub -> 'traits' -> 'profiler') \/-> 'leafPt') -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: profiler InitialContents: FollowSlot\x7fVisibility: public'
        
         file = '~leaf'.
        } | ) 

 bootstrap addSlotsTo: ((bootstrap stub -> 'traits' -> 'profiler') \/-> 'leafPt') -> 'parent' -> () From: ( | {
         'Category: testing\x7fModuleInfo: Module: profiler InitialContents: FollowSlot\x7fVisibility: public'
        
         hash = ( |
            | identityHash).
        } | ) 

 bootstrap addSlotsTo: ((bootstrap stub -> 'traits' -> 'profiler') \/-> 'leafPt') -> 'parent' -> () From: ( | {
         'Category: printing\x7fModuleInfo: Module: profiler InitialContents: FollowSlot\x7fVisibility: public'
        
         idString = '<send>'.
        } | ) 

 bootstrap addSlotsTo: ((bootstrap stub -> 'traits' -> 'profiler') \/-> 'leafPt') -> 'parent' -> () From: ( | {
         'Category: testing\x7fModuleInfo: Module: profiler InitialContents: FollowSlot\x7fVisibility: public'
        
         isLeafNode = bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: ((bootstrap stub -> 'traits' -> 'profiler') \/-> 'leafPt') -> 'parent' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: profiler InitialContents: FollowSlot\x7fVisibility: public'
        
         methodHolder = bootstrap setObjectAnnotationOf: ((bootstrap stub -> 'traits' -> 'profiler') \/-> 'leafPt') -> 'parent' -> 'methodHolder' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits profiler leafPt parent methodHolder.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: ((bootstrap stub -> 'traits' -> 'profiler') \/-> 'leafPt') -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: profiler InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = ((bootstrap stub -> 'traits' -> 'profiler') \/-> 'abstractCallGraphProfileNode') -> 'parent' -> ().
        } | ) 

 bootstrap addSlotsTo: ((bootstrap stub -> 'traits' -> 'profiler') \/-> 'leafPt') -> () From: ( | {
         'ModuleInfo: Module: profiler InitialContents: FollowSlot\x7fVisibility: private'
        
         prototype = ( |
            | traits profiler leafPt).
        } | ) 

 bootstrap addSlotsTo: ((bootstrap stub -> 'traits' -> 'profiler') \/-> 'methodPt') -> () From: ( | {
         'Category: profiling info\x7fModuleInfo: Module: profiler InitialContents: FollowSlot\x7fVisibility: publicReadPrivateWrite'
        
         method <- bootstrap stub -> 'globals' -> 'mirrors' -> 'method' -> ().
        } | ) 

 bootstrap addSlotsTo: ((bootstrap stub -> 'traits' -> 'profiler') \/-> 'methodPt') -> () From: ( | {
         'Category: profiling info\x7fModuleInfo: Module: profiler InitialContents: FollowSlot\x7fVisibility: publicReadPrivateWrite'
        
         methodHolder <- bootstrap setObjectAnnotationOf: ((bootstrap stub -> 'traits' -> 'profiler') \/-> 'methodPt') -> 'methodHolder' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits profiler methodPt methodHolder.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: ((bootstrap stub -> 'traits' -> 'profiler') \/-> 'methodPt') -> () From: ( | {
         'ModuleInfo: Module: profiler InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap setObjectAnnotationOf: ((bootstrap stub -> 'traits' -> 'profiler') \/-> 'methodPt') -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits profiler methodPt parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: ((bootstrap stub -> 'traits' -> 'profiler') \/-> 'methodPt') -> 'parent' -> () From: ( | {
         'Category: testing\x7fModuleInfo: Module: profiler InitialContents: FollowSlot\x7fVisibility: public'
        
         = node = ( |
            | 
            node isMethodNode ifFalse:                        [^false].
            node selector = selector                 ifFalse: [^false].
            (is: node receiver    EqualTo: receiver) ifFalse: [^false].
            is: node methodHolder EqualTo: methodHolder).
        } | ) 

 bootstrap addSlotsTo: ((bootstrap stub -> 'traits' -> 'profiler') \/-> 'methodPt') -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: profiler InitialContents: FollowSlot\x7fVisibility: public'
        
         file = ( |
            | method file).
        } | ) 

 bootstrap addSlotsTo: ((bootstrap stub -> 'traits' -> 'profiler') \/-> 'methodPt') -> 'parent' -> () From: ( | {
         'Category: testing\x7fModuleInfo: Module: profiler InitialContents: FollowSlot\x7fVisibility: public'
        
         hash = ( |
            | 
            selector hash ^^ (structuralHashOf: receiver) ^^ (structuralHashOf: methodHolder)).
        } | ) 

 bootstrap addSlotsTo: ((bootstrap stub -> 'traits' -> 'profiler') \/-> 'methodPt') -> 'parent' -> () From: ( | {
         'Category: printing\x7fModuleInfo: Module: profiler InitialContents: FollowSlot\x7fVisibility: public'
        
         holderIDString = ( |
            | 
            methodHolderMirror name).
        } | ) 

 bootstrap addSlotsTo: ((bootstrap stub -> 'traits' -> 'profiler') \/-> 'methodPt') -> 'parent' -> () From: ( | {
         'Category: printing\x7fModuleInfo: Module: profiler InitialContents: FollowSlot\x7fVisibility: public'
        
         idString = ( |
            | 
            selector = mirrors method topLevelExprName
             ifTrue: ['"', (shrinkWrap: method source), '"']
              False: [shrink:     selector]).
        } | ) 

 bootstrap addSlotsTo: ((bootstrap stub -> 'traits' -> 'profiler') \/-> 'methodPt') -> 'parent' -> () From: ( | {
         'Category: testing\x7fModuleInfo: Module: profiler InitialContents: FollowSlot\x7fVisibility: public'
        
         isMethodNode = bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: ((bootstrap stub -> 'traits' -> 'profiler') \/-> 'methodPt') -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: profiler InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = ((bootstrap stub -> 'traits' -> 'profiler') \/-> 'abstractCallGraphProfileNode') -> 'parent' -> ().
        } | ) 

 bootstrap addSlotsTo: ((bootstrap stub -> 'traits' -> 'profiler') \/-> 'methodPt') -> 'parent' -> () From: ( | {
         'Category: outliner\x7fModuleInfo: Module: profiler InitialContents: FollowSlot\x7fVisibility: public'
        
         slotIfNone: nb = ( |
            | 
            methodHolderMirror at: selector IfAbsent: nb).
        } | ) 

 bootstrap addSlotsTo: ((bootstrap stub -> 'traits' -> 'profiler') \/-> 'methodPt') -> () From: ( | {
         'ModuleInfo: Module: profiler InitialContents: FollowSlot\x7fVisibility: private'
        
         prototype = ( |
            | traits profiler methodPt).
        } | ) 

 bootstrap addSlotsTo: ((bootstrap stub -> 'traits' -> 'profiler') \/-> 'methodPt') -> () From: ( | {
         'Category: profiling info\x7fModuleInfo: Module: profiler InitialContents: FollowSlot\x7fVisibility: publicReadPrivateWrite'
        
         receiver <- bootstrap setObjectAnnotationOf: ((bootstrap stub -> 'traits' -> 'profiler') \/-> 'methodPt') -> 'receiver' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits profiler methodPt receiver.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: ((bootstrap stub -> 'traits' -> 'profiler') \/-> 'methodPt') -> () From: ( | {
         'Category: profiling info\x7fModuleInfo: Module: profiler InitialContents: FollowSlot\x7fVisibility: publicReadPrivateWrite'
        
         selector <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'profiler' -> () From: ( | {
         'ModuleInfo: Module: profiler InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'clonable' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'profiler' -> () From: ( | {
         'Category: preferences\x7fModuleInfo: Module: profiler InitialContents: FollowSlot'
        
         preferences = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'profiler' -> 'preferences' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits profiler preferences.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'profiler' -> 'preferences' -> () From: ( | {
         'ModuleInfo: Module: profiler InitialContents: FollowSlot'
        
         printNodeAllocation <- bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'profiler' -> 'preferences' -> () From: ( | {
         'ModuleInfo: Module: profiler InitialContents: InitializeToExpression: (false)'
        
         printOptimizedTime <- bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'profiler' -> () From: ( | {
         'Category: passed into VM to get profile\x7fCategory: passed in to VM for call graph\x7fCategory: nodes\x7fModuleInfo: Module: profiler InitialContents: FollowSlot\x7fVisibility: public'
        
         primPt = bootstrap define: ((bootstrap stub -> 'traits' -> 'profiler') \/-> 'primPt') -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             bootstrap remove: 'prototype' From:
             traits profiler abstractCallGraphProfileNode copy ) From: bootstrap setObjectAnnotationOf: ((bootstrap stub -> 'traits' -> 'profiler') \/-> 'primPt') -> () From: ( |
             {} = 'ModuleInfo: Creator: traits profiler primPt.

CopyDowns:
traits profiler abstractCallGraphProfileNode. copy 
SlotsToOmit: parent prototype.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: ((bootstrap stub -> 'traits' -> 'profiler') \/-> 'primPt') -> () From: ( | {
         'ModuleInfo: Module: profiler InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap setObjectAnnotationOf: ((bootstrap stub -> 'traits' -> 'profiler') \/-> 'primPt') -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits profiler primPt parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: ((bootstrap stub -> 'traits' -> 'profiler') \/-> 'primPt') -> 'parent' -> () From: ( | {
         'Category: testing\x7fModuleInfo: Module: profiler InitialContents: FollowSlot\x7fVisibility: public'
        
         = node = ( |
            | node isPrimNode && [ node selector = selector ]).
        } | ) 

 bootstrap addSlotsTo: ((bootstrap stub -> 'traits' -> 'profiler') \/-> 'primPt') -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: profiler InitialContents: FollowSlot\x7fVisibility: public'
        
         file = '~primitive'.
        } | ) 

 bootstrap addSlotsTo: ((bootstrap stub -> 'traits' -> 'profiler') \/-> 'primPt') -> 'parent' -> () From: ( | {
         'Category: testing\x7fModuleInfo: Module: profiler InitialContents: FollowSlot\x7fVisibility: public'
        
         hash = ( |
            | selector hash).
        } | ) 

 bootstrap addSlotsTo: ((bootstrap stub -> 'traits' -> 'profiler') \/-> 'primPt') -> 'parent' -> () From: ( | {
         'Category: printing\x7fModuleInfo: Module: profiler InitialContents: FollowSlot\x7fVisibility: public'
        
         idString = ( |
            | shrink: selector).
        } | ) 

 bootstrap addSlotsTo: ((bootstrap stub -> 'traits' -> 'profiler') \/-> 'primPt') -> 'parent' -> () From: ( | {
         'Category: testing\x7fModuleInfo: Module: profiler InitialContents: FollowSlot\x7fVisibility: public'
        
         isPrimNode = bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: ((bootstrap stub -> 'traits' -> 'profiler') \/-> 'primPt') -> 'parent' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: profiler InitialContents: FollowSlot\x7fVisibility: public'
        
         methodHolder = bootstrap setObjectAnnotationOf: ((bootstrap stub -> 'traits' -> 'profiler') \/-> 'primPt') -> 'parent' -> 'methodHolder' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits profiler primPt parent methodHolder.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: ((bootstrap stub -> 'traits' -> 'profiler') \/-> 'primPt') -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: profiler InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = ((bootstrap stub -> 'traits' -> 'profiler') \/-> 'abstractCallGraphProfileNode') -> 'parent' -> ().
        } | ) 

 bootstrap addSlotsTo: ((bootstrap stub -> 'traits' -> 'profiler') \/-> 'primPt') -> () From: ( | {
         'ModuleInfo: Module: profiler InitialContents: FollowSlot\x7fVisibility: private'
        
         prototype = ( |
            | traits profiler primPt).
        } | ) 

 bootstrap addSlotsTo: ((bootstrap stub -> 'traits' -> 'profiler') \/-> 'primPt') -> () From: ( | {
         'Category: profiling info\x7fModuleInfo: Module: profiler InitialContents: FollowSlot\x7fVisibility: publicReadPrivateWrite'
        
         selector <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'profiler' -> () From: ( | {
         'Category: printing\x7fModuleInfo: Module: profiler InitialContents: FollowSlot\x7fVisibility: public'
        
         printCutoff: cutoff = ( |
             graph.
            | 
            '' printLine. ('profile of: ', blockMethodSource) print.

            '' printLine. times print.
            '' printLine. ticks print.

            '' printLine.
            _ProfilerIgnoreCallGraph ifTrue: [^self].
            ('Call graph (', (cutoff*100) printString, '% cutoff):')
              printLine.

            graph: callGraph skipTop.
            graph printCutoff: cutoff.

            '' printLine.
            'Flat profile of the primitives' printLine.
            graph printPrims.

            '' printLine.
            ('Allocation: #bytes  = ', graph bytes printString) printLine.
            ('            #blocks = ', graph blocks printString) printLine.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'profiler' -> () From: ( | {
         'Category: printing\x7fModuleInfo: Module: profiler InitialContents: FollowSlot\x7fVisibility: public'
        
         printFlat = ( |
            | 
            ('Flat profile of: ', blockMethodSource) printLine.
            callGraph printFlat).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'profiler' -> () From: ( | {
         'Category: printing\x7fModuleInfo: Module: profiler InitialContents: FollowSlot\x7fVisibility: public'
        
         printLex = ( | {
                 'ModuleInfo: Module: profiler InitialContents: FollowSlot'
                
                 n.
                } 
            | n: callGraph. 7 do: [ n: n at: 1]. n printLex).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'profiler' -> () From: ( | {
         'Category: printing\x7fModuleInfo: Module: profiler InitialContents: FollowSlot\x7fVisibility: public'
        
         printPrims = ( |
            | 
            callGraph printPrims).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'profiler' -> () From: ( | {
         'Category: primitives\x7fModuleInfo: Module: profiler InitialContents: FollowSlot\x7fVisibility: public'
        
         process = ( |
            | processIfFail: raiseError).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'profiler' -> () From: ( | {
         'Category: primitives\x7fModuleInfo: Module: profiler InitialContents: FollowSlot\x7fVisibility: public'
        
         processIfFail: blk = ( |
            | _ProfilerProcessIfFail: blk).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'profiler' -> () From: ( | {
         'Category: primitives\x7fComment: resets and deallocates the vm part of the profiler\x7fModuleInfo: Module: profiler InitialContents: FollowSlot\x7fVisibility: public'
        
         reset = ( |
            | _ProfilerReset).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'profiler' -> () From: ( | {
         'Category: creating\x7fModuleInfo: Module: profiler InitialContents: FollowSlot\x7fVisibility: private'
        
         run: b = ( |
            | 
            engage: _ThisProcess.
            blockResult: b onReturn: [disengage].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'profiler' -> () From: ( | {
         'Category: printing\x7fModuleInfo: Module: profiler InitialContents: FollowSlot\x7fVisibility: public'
        
         statePrintString = ( |
            | 
            'active on ', 
             (processIfFail: [ ^'Profiler (inactive)']) printString).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'profiler' -> () From: ( | {
         'Category: passed into VM to get profile\x7fComment: prototype for tick imformation\x7fModuleInfo: Module: profiler InitialContents: FollowSlot\x7fVisibility: public'
        
         tickPt = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'profiler' -> 'tickPt' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits profiler tickPt.
\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'profiler' -> 'tickPt' -> () From: ( | {
         'Category: profiling info\x7fModuleInfo: Module: profiler InitialContents: FollowSlot\x7fVisibility: publicReadPrivateWrite'
        
         inConversion <- 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'profiler' -> 'tickPt' -> () From: ( | {
         'Category: profiling info\x7fModuleInfo: Module: profiler InitialContents: FollowSlot\x7fVisibility: publicReadPrivateWrite'
        
         inLookup <- 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'profiler' -> 'tickPt' -> () From: ( | {
         'Category: profiling info\x7fModuleInfo: Module: profiler InitialContents: FollowSlot\x7fVisibility: publicReadPrivateWrite'
        
         inPrim <- 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'profiler' -> 'tickPt' -> () From: ( | {
         'Category: profiling info\x7fModuleInfo: Module: profiler InitialContents: FollowSlot\x7fVisibility: publicReadPrivateWrite'
        
         inProfiler <- 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'profiler' -> 'tickPt' -> () From: ( | {
         'Category: profiling info\x7fModuleInfo: Module: profiler InitialContents: FollowSlot\x7fVisibility: publicReadPrivateWrite'
        
         inSelf <- 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'profiler' -> 'tickPt' -> () From: ( | {
         'Category: profiling info\x7fModuleInfo: Module: profiler InitialContents: FollowSlot\x7fVisibility: publicReadPrivateWrite'
        
         inSemaphore <- 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'profiler' -> 'tickPt' -> () From: ( | {
         'ModuleInfo: Module: profiler InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'clonable' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'profiler' -> 'tickPt' -> () From: ( | {
         'Category: printing\x7fModuleInfo: Module: profiler InitialContents: FollowSlot\x7fVisibility: public'
        
         print = ( |
            | 
            'Tick distribution:' printLine.
            printTick: inSelf      Title: 'Self'.
            printTick: inPrim      Title: 'Primitives'.
            printTick: inLookup    Title: 'Lookup'.
            printTick: inSemaphore Title: 'Semaphores'.
            printTick: inConversion Title: 'Conversion'.
            printTick: inProfiler  Title: 'Profiler'.
            printTick: total       Title: 'Total').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'profiler' -> 'tickPt' -> () From: ( | {
         'Category: printing\x7fModuleInfo: Module: profiler InitialContents: FollowSlot\x7fVisibility: public'
        
         printString = ( |
            | 
            'Ticks:  ',
               'self: ',        inSelf printString, ', ',
                'sem: ',   inSemaphore printString, ', ',
             'lookup: ',      inLookup printString, ', ',
               'prim: ',        inPrim printString, ', ',
             'convert: ', inConversion printString, ', ',
             'prof: ',      inProfiler printString).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'profiler' -> 'tickPt' -> () From: ( | {
         'Category: printing\x7fModuleInfo: Module: profiler InitialContents: FollowSlot\x7fVisibility: public'
        
         printTick: t Title: s = ( | {
                 'ModuleInfo: Module: profiler InitialContents: FollowSlot'
                
                 w = 12.
                } 
            | 
            t = 0 ifTrue: [^self].
            (' - ', ((s, ' =') padOnRight: w), '  ', t printString, '.')
              printLine).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'profiler' -> 'tickPt' -> () From: ( | {
         'Category: printing\x7fModuleInfo: Module: profiler InitialContents: FollowSlot\x7fVisibility: public'
        
         total = ( |
            | 
            inSelf + inPrim + inLookup + 
            inSemaphore + inProfiler + inConversion).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'profiler' -> () From: ( | {
         'Category: primitives\x7fComment: returns a copy of tickPt filled with tick information\x7fModuleInfo: Module: profiler InitialContents: FollowSlot\x7fVisibility: public'
        
         ticks = ( |
            | _ProfilerTicks: tickPt IfFail: [|:error|
              'outOfMemoryError' == error ifFalse: [
                error: error
              ] True: [
                _ProfilerTicks: tickPt
              ]
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'profiler' -> () From: ( | {
         'Category: passed into VM to get profile\x7fComment: prototype for timing information\x7fModuleInfo: Module: profiler InitialContents: FollowSlot\x7fVisibility: public'
        
         timePt = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'profiler' -> 'timePt' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits profiler timePt.
\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'profiler' -> 'timePt' -> () From: ( | {
         'Category: profiling info\x7fModuleInfo: Module: profiler InitialContents: FollowSlot\x7fVisibility: public'
        
         build <- 0.0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'profiler' -> 'timePt' -> () From: ( | {
         'Category: profiling info\x7fModuleInfo: Module: profiler InitialContents: FollowSlot\x7fVisibility: public'
        
         collect <- 0.0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'profiler' -> 'timePt' -> () From: ( | {
         'Category: profiling info\x7fModuleInfo: Module: profiler InitialContents: FollowSlot\x7fVisibility: public'
        
         compile <- 0.0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'profiler' -> 'timePt' -> () From: ( | {
         'Category: printing\x7fModuleInfo: Module: profiler InitialContents: FollowSlot\x7fVisibility: public'
        
         do: blk = ( |
            | 
            blk value: runtime        With: 'Program'.
            blk value: collect        With: 'Collect time'.
            blk value: build          With: 'Build call graph'.
            blk value: compile        With: 'Compilation'.
            blk value: recompile      With: 'Recompilation'.
            blk value: uncommon       With: 'Uncommon compilation'.
            blk value: scavenge       With: 'GC, scavenge'.
            blk value: garbageCollect With: 'GC, mark-sweep'.
            blk value: methodFlush    With: 'Flush methods'.
            blk value: methodCompact  With: 'Compact methods').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'profiler' -> 'timePt' -> () From: ( | {
         'Category: profiling info\x7fModuleInfo: Module: profiler InitialContents: FollowSlot\x7fVisibility: public'
        
         garbageCollect <- 0.0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'profiler' -> 'timePt' -> () From: ( | {
         'Category: profiling info\x7fModuleInfo: Module: profiler InitialContents: FollowSlot\x7fVisibility: public'
        
         methodCompact <- 0.0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'profiler' -> 'timePt' -> () From: ( | {
         'Category: profiling info\x7fModuleInfo: Module: profiler InitialContents: FollowSlot\x7fVisibility: public'
        
         methodFlush <- 0.0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'profiler' -> 'timePt' -> () From: ( | {
         'Category: profiling info\x7fModuleInfo: Module: profiler InitialContents: FollowSlot\x7fVisibility: public'
        
         monitor <- 0.0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'profiler' -> 'timePt' -> () From: ( | {
         'ModuleInfo: Module: profiler InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'clonable' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'profiler' -> 'timePt' -> () From: ( | {
         'Category: printing\x7fModuleInfo: Module: profiler InitialContents: FollowSlot\x7fVisibility: public'
        
         print = ( |
            | 
            'Time distribution:' printLine.
            do: [|:time. :title | printTime: time Title: title].
            printTime: total  Title: 'Total').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'profiler' -> 'timePt' -> () From: ( | {
         'Category: printing\x7fModuleInfo: Module: profiler InitialContents: FollowSlot\x7fVisibility: public'
        
         printString = ( |
             m <- 0.
             r.
             vm <- 0.
            | 
            do: [|:v. :n| m: m max: n size.  vm: vm max: v printString size].
            r: 'Times:\n'.
            do: [|:v. :n|
              r: r & ' ' & (n padOnLeft: m) & ': ' & (v printString padOnLeft: vm) & ' ms\n'
            ].
            r flatString copyWithoutLast).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'profiler' -> 'timePt' -> () From: ( | {
         'Category: printing\x7fModuleInfo: Module: profiler InitialContents: FollowSlot\x7fVisibility: public'
        
         printTime: t Title: s = ( | {
                 'ModuleInfo: Module: profiler InitialContents: FollowSlot'
                
                 w = 22.
                } 
            | 
            t = 0.0 ifTrue: [^self].
            (' - ', (s, ' =' padOnRight: w), 
             ((timeString: t) padOnLeft: 12), '.')
               printLine).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'profiler' -> 'timePt' -> () From: ( | {
         'Category: profiling info\x7fModuleInfo: Module: profiler InitialContents: FollowSlot\x7fVisibility: public'
        
         recompile <- 0.0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'profiler' -> 'timePt' -> () From: ( | {
         'Category: profiling info\x7fModuleInfo: Module: profiler InitialContents: FollowSlot\x7fVisibility: public'
        
         runtime <- 0.0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'profiler' -> 'timePt' -> () From: ( | {
         'Category: profiling info\x7fModuleInfo: Module: profiler InitialContents: FollowSlot\x7fVisibility: public'
        
         scavenge <- 0.0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'profiler' -> 'timePt' -> () From: ( | {
         'Category: printing\x7fModuleInfo: Module: profiler InitialContents: FollowSlot\x7fVisibility: private'
        
         timeString: msec = ( |
             hour = 3600000.
             min = 60000.
             rest <- 0.0.
             sec = 1000.
             str <- ''.
             threshold = 0.01.
             units <- 0.
            | 

            infinity = msec  ifTrue: [^ msec printString].

            rest: msec.

            "Hours"
            units: rest /- hour. rest: rest - (units * hour).
            units > 0 ifTrue: [
              str: str, units printString, ' hours '.
              (rest / msec) < threshold ifTrue: [^str]].

            "Minutes"
            units: rest /- min. rest: rest - (units * min).
            units > 0 ifTrue: [
              str: str, units printString, ' min '.
              (rest / msec) < threshold ifTrue: [^str]].

            "Seconds"
            units: rest / sec.
            units > 0 ifTrue: [ str: str, (units printStringPrecision: 3), ' sec' ].
            str).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'profiler' -> 'timePt' -> () From: ( | {
         'Category: printing\x7fModuleInfo: Module: profiler InitialContents: FollowSlot\x7fVisibility: public'
        
         total = ( |
             sum <- 0.0.
            | 
            do: [|:t | sum: sum + t ].
            sum).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'profiler' -> 'timePt' -> () From: ( | {
         'Category: profiling info\x7fModuleInfo: Module: profiler InitialContents: FollowSlot\x7fVisibility: public'
        
         uncommon <- 0.0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'profiler' -> () From: ( | {
         'Category: primitives\x7fComment: returns a copy of timePt filled with time information\x7fModuleInfo: Module: profiler InitialContents: FollowSlot\x7fVisibility: public'
        
         times = ( |
            | _ProfilerTimes: timePt IfFail: [|:error|
              'outOfMemoryError' == error ifFalse: [
                error: error
              ] True: [
                _ProfilerTimes: timePt
              ]
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'profiler' -> () From: ( | {
         'Category: passed into VM to get profile\x7fCategory: passed in to VM for call graph\x7fComment: Whenever the profiler does not know the contents of a data slot
in some object that was (I think) the receiver of a method, it fills
in the data slot with this object. -- dmu 10/04\x7fModuleInfo: Module: profiler InitialContents: FollowSlot\x7fVisibility: public'
        
         unknownObj = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'profiler' -> 'unknownObj' -> () From: ( |
             {} = 'Comment: Indicates the value that may have changed during profiling\x7fModuleInfo: Creator: traits profiler unknownObj.
\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'profiler' -> 'unknownObj' -> () From: ( | {
         'ModuleInfo: Module: profiler InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'clonable' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'profiler' -> 'unknownObj' -> () From: ( | {
         'Category: printing\x7fModuleInfo: Module: profiler InitialContents: FollowSlot\x7fVisibility: public'
        
         printString = ( |
            | 'unknown object').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'profiler' -> () From: ( | {
         'Category: primitives\x7fModuleInfo: Module: profiler InitialContents: FollowSlot\x7fVisibility: public'
        
         vmPrint = ( |
            | _ProfilerPrint: 0.01).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'profiler' -> () From: ( | {
         'Category: primitives\x7fComment: dumps the VM callgraph on stdout\x7fModuleInfo: Module: profiler InitialContents: FollowSlot\x7fVisibility: public'
        
         vmPrint: cutoff = ( |
            | _ProfilerPrint: cutoff asFloat).
        } | ) 



 '-- Side effects'

 globals modules profiler postFileIn
