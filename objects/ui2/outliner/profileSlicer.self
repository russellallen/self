 '$Revision: 1.13 $'
 '
Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: profileSlicer InitialContents: FollowSlot'
        
         profileSlicer = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'profileSlicer' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'profileSlicer' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules profileSlicer.

CopyDowns:
globals modules init. copy 
SlotsToOmit: directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'profileSlicer' -> () From: ( | {
         'ModuleInfo: Module: profileSlicer InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'ui2/outliner'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'profileSlicer' -> () From: ( | {
         'ModuleInfo: Module: profileSlicer InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'profileSlicer' -> () From: ( | {
         'ModuleInfo: Module: profileSlicer InitialContents: FollowSlot'
        
         myComment <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'profileSlicer' -> () From: ( | {
         'ModuleInfo: Module: profileSlicer InitialContents: FollowSlot'
        
         postFileIn = ( |
            | resend.postFileIn).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'profileSlicer' -> () From: ( | {
         'ModuleInfo: Module: profileSlicer InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- '$Revision: 1.13 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'profileSlicer' -> () From: ( | {
         'ModuleInfo: Module: profileSlicer InitialContents: FollowSlot\x7fVisibility: private'
        
         subpartNames <- 'profileSliceModel
profileSliceCP
profileSliceGrpOut
profileSliceGrpMod
profileSelfSlotMdl
'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'block' -> () From: ( | {
         'Category: timing\x7fModuleInfo: Module: profileSlicer InitialContents: FollowSlot\x7fVisibility: public'
        
         getProfile = ( |
            | 
            profiler copyAndRun: self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'block' -> () From: ( | {
         'Category: timing\x7fModuleInfo: Module: profileSlicer InitialContents: FollowSlot\x7fVisibility: public'
        
         profileSlice = ( |
             p.
            | 
            process defaultProcessSize: process defaultProcessSize max: 5000000.
            p: getProfile.
            p putSliceOutlinerIntoWorld.
            p blockResult).
        } | ) 

 bootstrap addSlotsTo: ((bootstrap stub -> 'traits' -> 'profiler') \/-> 'abstractCallGraphProfileNode') -> 'parent' -> () From: ( | {
         'Category: printing\x7fCategory: flat\x7fModuleInfo: Module: profileSlicer InitialContents: FollowSlot\x7fVisibility: private'
        
         add: aBCIAndNode ToSet: aSet = ( |
             en.
            | 
            en: aSet at: aBCIAndNode IfAbsent: [^ aSet add: aBCIAndNode copy node:  (aBCIAndNode node copySize: 0) flatTime: aBCIAndNode node shallowTime].
            aSet remove: en.
            aSet add: (en node: en node flatTime: (en node flatTime + aBCIAndNode node shallowTime))).
        } | ) 

 bootstrap addSlotsTo: ((bootstrap stub -> 'traits' -> 'profiler') \/-> 'abstractCallGraphProfileNode') -> 'parent' -> () From: ( | {
         'Category: pruning\x7fModuleInfo: Module: profileSlicer InitialContents: FollowSlot\x7fVisibility: private'
        
         bcisAndNodesForCutoff: cutoff Do: blk = ( |
            | 
            bcisAndNodesDo: [|:bci. :n|
              case    if: [n isLeafNode]
                    Then: ["never show leaf nodes"]
                      If: [n normalizedTime > cutoff]
                    Then: [blk value: bci With: n]
                    Else: [n bcisAndNodesForCutoff: cutoff Do: [|:x. :nn| blk value: bci With: nn]].
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: ((bootstrap stub -> 'traits' -> 'profiler') \/-> 'abstractCallGraphProfileNode') -> 'parent' -> () From: ( | {
         'Category: pruning\x7fComment: Assuming that I am a node that should be shown, iterate
through the children of mine that should be shown.\x7fModuleInfo: Module: profileSlicer InitialContents: FollowSlot\x7fVisibility: private'
        
         bcisAndNodesToShowDo: blk = ( |
            | 
            bcisAndNodesDo: [|:bci. :n|
              case if:   [n isLeafNode]
                   Then: ["never show leaf nodes"]
                   If:   [n pruningInfo shouldBeShown]
                   Then: [blk value: bci With: n]
                   Else: [n bcisAndNodesToShowDo: [|:x. :nn| blk value: bci With: nn]].
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: ((bootstrap stub -> 'traits' -> 'profiler') \/-> 'abstractCallGraphProfileNode') -> 'parent' -> () From: ( | {
         'Category: printing\x7fCategory: flat\x7fModuleInfo: Module: profileSlicer InitialContents: FollowSlot\x7fVisibility: private'
        
         collectSet: aSet = ( |
             mySet.
            | 
            mySet: customizableSet copyRemoveAll.
            mySet comparisonTraits: comparisonMixin.
            pathIterate: [| :path. :bci. :node |
               [| :exit |
               node isLeafNode ifTrue: exit.
               add: ((bciAndNode copy bci: bci) node: node) ToSet: mySet.
              ] exit
            ].
            mySet).
        } | ) 

 bootstrap addSlotsTo: ((bootstrap stub -> 'traits' -> 'profiler') \/-> 'abstractCallGraphProfileNode') -> 'parent' -> () From: ( | {
         'Category: printing\x7fCategory: flat\x7fModuleInfo: Module: profileSlicer InitialContents: FollowSlot\x7fVisibility: public'
        
         comparisonMixin = bootstrap setObjectAnnotationOf: ((bootstrap stub -> 'traits' -> 'profiler') \/-> 'abstractCallGraphProfileNode') -> 'parent' -> 'comparisonMixin' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits profiler abstractCallGraphProfileNode parent comparisonMixin.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: ((bootstrap stub -> 'traits' -> 'profiler') \/-> 'abstractCallGraphProfileNode') -> 'parent' -> 'comparisonMixin' -> () From: ( | {
         'ModuleInfo: Module: profileSlicer InitialContents: FollowSlot\x7fVisibility: public'
        
         hashElement: e = ( |
            | 
            e node hash).
        } | ) 

 bootstrap addSlotsTo: ((bootstrap stub -> 'traits' -> 'profiler') \/-> 'abstractCallGraphProfileNode') -> 'parent' -> 'comparisonMixin' -> () From: ( | {
         'ModuleInfo: Module: profileSlicer InitialContents: FollowSlot\x7fVisibility: public'
        
         is: e1 EqualTo: e2 = ( |
            | 
            e1 node = e2 node).
        } | ) 

 bootstrap addSlotsTo: ((bootstrap stub -> 'traits' -> 'profiler') \/-> 'abstractCallGraphProfileNode') -> 'parent' -> 'comparisonMixin' -> () From: ( | {
         'ModuleInfo: Module: profileSlicer InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'defaultBehavior' -> ().
        } | ) 

 bootstrap addSlotsTo: ((bootstrap stub -> 'traits' -> 'profiler') \/-> 'abstractCallGraphProfileNode') -> 'parent' -> () From: ( | {
         'Category: pruning\x7fModuleInfo: Module: profileSlicer InitialContents: FollowSlot\x7fVisibility: public'
        
         copyAndPruneAssumingPruningInformationIsPresent = ( |
             newBCIsAndNodes.
            | 
            newBCIsAndNodes: list copyRemoveAll.
            bcisAndNodesToShowDo: [|:bci. :n| newBCIsAndNodes addLast:  (bciAndNode copy bci: bci) node: n copyAndPruneAssumingPruningInformationIsPresent].
            generateNodeListFromBCIsAndNodes: newBCIsAndNodes asVector).
        } | ) 

 bootstrap addSlotsTo: ((bootstrap stub -> 'traits' -> 'profiler') \/-> 'abstractCallGraphProfileNode') -> 'parent' -> () From: ( | {
         'Category: pruning\x7fModuleInfo: Module: profileSlicer InitialContents: FollowSlot\x7fVisibility: public'
        
         copyAndPruneCutoff: cutoff = ( |
             newBCIsAndNodes.
             r.
            | 
            newBCIsAndNodes: list copyRemoveAll.
            bcisAndNodesForCutoff: cutoff Do: [|:bci. :n| newBCIsAndNodes addLast:  (bciAndNode copy bci: bci) node: n copyAndPruneCutoff: cutoff].
            generateNodeListFromBCIsAndNodes: newBCIsAndNodes asVector).
        } | ) 

 bootstrap addSlotsTo: ((bootstrap stub -> 'traits' -> 'profiler') \/-> 'abstractCallGraphProfileNode') -> 'parent' -> () From: ( | {
         'Category: pruning\x7fModuleInfo: Module: profileSlicer InitialContents: FollowSlot\x7fVisibility: private'
        
         generateNodeListFromBCIsAndNodes: newBCIsAndNodes = ( |
             r.
            | 
            r: copySize: newBCIsAndNodes size * 2.
            newBCIsAndNodes do: [|:newBCIAndNode. :i|
              r at:  i * 2       Put: newBCIAndNode bci.
              r at: (i * 2) succ Put: newBCIAndNode node.
            ].
            r).
        } | ) 

 bootstrap addSlotsTo: ((bootstrap stub -> 'traits' -> 'profiler') \/-> 'abstractCallGraphProfileNode') -> 'parent' -> () From: ( | {
         'Category: printing\x7fCategory: flat\x7fComment: iterate over nodes not part of the lexical scope\x7fModuleInfo: Module: profileSlicer InitialContents: FollowSlot\x7fVisibility: private'
        
         inBetweenLex: path Node: node Do: blk = ( | {
                 'ModuleInfo: Module: profiler InitialContents: FollowSlot'
                
                 lexNode.
                } 
            | 
            node isBlockNode ifTrue: [
              lexNode: node outer.
              path reverseDo: [|:n| 
                (lexNode = n) || [n isBlockNode && [ lexNode = n outer ]]
                  ifTrue: [^lexNode] False: [ blk value: n]
              ]
            ]).
        } | ) 

 bootstrap addSlotsTo: ((bootstrap stub -> 'traits' -> 'profiler') \/-> 'abstractCallGraphProfileNode') -> 'parent' -> () From: ( | {
         'Category: printing\x7fCategory: helpers\x7fModuleInfo: Module: profileSlicer InitialContents: FollowSlot\x7fVisibility: public'
        
         ownerIDString = ( |
            | 
            owner idString).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'profiler' -> () From: ( | {
         'Category: slicing\x7fModuleInfo: Module: profileSlicer InitialContents: FollowSlot\x7fVisibility: public'
        
         asSliceOutliner = ( |
             r.
            | 
            0 process defaultProcessSize: 0 process defaultProcessSize * 10.
            r: profileSliceModel outlinerForProfiler: self.
            0 process defaultProcessSize: 0 process defaultProcessSize / 10.
            r).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'profiler' -> () From: ( | {
         'Category: slicing\x7fModuleInfo: Module: profileSlicer InitialContents: FollowSlot\x7fVisibility: public'
        
         putSliceOutlinerInto: aWorld At: pt = ( |
             o.
            | 
            o: asSliceOutliner.
            aWorld addMorph: o.
            aWorld moveToFront: o.
            o moveToPosition: pt.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'profiler' -> () From: ( | {
         'Category: slicing\x7fModuleInfo: Module: profileSlicer InitialContents: FollowSlot\x7fVisibility: public'
        
         putSliceOutlinerIntoWorld = ( |
            | 
            putSliceOutlinerIntoWorld: globals process this birthEvent).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'profiler' -> () From: ( | {
         'Category: slicing\x7fModuleInfo: Module: profileSlicer InitialContents: FollowSlot\x7fVisibility: public'
        
         putSliceOutlinerIntoWorld: evt = ( |
            | 
            putSliceOutlinerInto: evt sourceHand world
                              At: evt cursorPoint).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'profiler' -> () From: ( | {
         'Category: testing\x7fModuleInfo: Module: profileSlicer InitialContents: FollowSlot\x7fVisibility: public'
        
         testSlicer = ( |
            | 
            [transporter moduleDictionary alwaysRefill] profileSlice).
        } | ) 



 '-- Sub parts'

 bootstrap read: 'profileSliceModel' From: 'ui2/outliner'
 bootstrap read: 'profileSliceCP' From: 'ui2/outliner'
 bootstrap read: 'profileSliceGrpOut' From: 'ui2/outliner'
 bootstrap read: 'profileSliceGrpMod' From: 'ui2/outliner'
 bootstrap read: 'profileSelfSlotMdl' From: 'ui2/outliner'



 '-- Side effects'

 globals modules profileSlicer postFileIn
