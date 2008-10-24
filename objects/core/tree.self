 'Sun-$Revision: 30.8 $'
 '
Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: tree InitialContents: FollowSlot'
        
         tree = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'tree' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'comment' From:
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'tree' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules tree.

CopyDowns:
globals modules init. copy 
SlotsToOmit: comment directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'tree' -> () From: ( | {
         'ModuleInfo: Module: tree InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'core'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'tree' -> () From: ( | {
         'ModuleInfo: Module: tree InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'tree' -> () From: ( | {
         'ModuleInfo: Module: tree InitialContents: FollowSlot'
        
         myComment <- 'tree.self: binary tree implementations of sorted sets and bags.\"
            \"Also illustrates the power of dynamic inheritance.'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'tree' -> () From: ( | {
         'ModuleInfo: Module: tree InitialContents: FollowSlot'
        
         postFileIn = ( |
            | 
            "moved here from initializeToExpressions"
            treeBagNode left:  treeBag copyRemoveAll.
            treeBagNode right: treeBag copyRemoveAll.
            treeSetNode left:  treeSet copyRemoveAll.
            treeSetNode right: treeSet copyRemoveAll.

            resend.postFileIn).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'tree' -> () From: ( | {
         'ModuleInfo: Module: tree InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- 'Sun-$Revision: 30.8 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'tree' -> () From: ( | {
         'ModuleInfo: Module: tree InitialContents: FollowSlot\x7fVisibility: public'
        
         subpartNames <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: collections\x7fCategory: sorted\x7fCategory: trees\x7fModuleInfo: Module: tree InitialContents: FollowSlot\x7fVisibility: public'
        
         treeBag = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'treeBag' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals treeBag.
\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'treeBag' -> () From: ( | {
         'Category: printing\x7fModuleInfo: Module: tree InitialContents: FollowSlot\x7fVisibility: public'
        
         collectionName = 'treeBag'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'emptyTrees' -> () From: ( | {
         'ModuleInfo: Module: tree InitialContents: FollowSlot\x7fVisibility: public'
        
         bag = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'emptyTrees' -> 'bag' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits emptyTrees bag.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'treeBag' -> () From: ( | {
         'ModuleInfo: Module: tree InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* <- bootstrap stub -> 'traits' -> 'emptyTrees' -> 'bag' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'treeBag' -> () From: ( | {
         'ModuleInfo: Module: tree InitialContents: FollowSlot\x7fVisibility: private'
        
         prototype = ( |
            | treeBag).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: collections\x7fCategory: sorted\x7fCategory: treeNodes\x7fModuleInfo: Module: tree InitialContents: FollowSlot'
        
         treeBagNode = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'treeBagNode' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals treeBagNode.
\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'treeBagNode' -> () From: ( | {
         'ModuleInfo: Module: tree InitialContents: FollowSlot\x7fVisibility: private'
        
         collectionName = 'treeBagNode'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'treeBagNode' -> () From: ( | {
         'Comment: read/write slot for contents of node \x7fModuleInfo: Module: tree InitialContents: FollowSlot\x7fVisibility: private'
        
         contents.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'treeBagNode' -> () From: ( | {
         'ModuleInfo: Module: tree InitialContents: FollowSlot\x7fVisibility: private'
        
         key.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'treeBagNode' -> () From: ( | {
         'Comment: read/write slot for left subtree \x7fModuleInfo: Module: tree InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         left <- bootstrap stub -> 'globals' -> 'nil' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'treeNodes' -> () From: ( | {
         'ModuleInfo: Module: tree InitialContents: FollowSlot\x7fVisibility: public'
        
         bag = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'treeNodes' -> 'bag' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits treeNodes bag.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'treeBagNode' -> () From: ( | {
         'Comment: read-only slot for shared behavior \x7fModuleInfo: Module: tree InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'treeNodes' -> 'bag' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'treeBagNode' -> () From: ( | {
         'ModuleInfo: Module: tree InitialContents: FollowSlot\x7fVisibility: private'
        
         prototype = ( |
            | treeBagNode).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'treeBagNode' -> () From: ( | {
         'ModuleInfo: Module: tree InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         right <- bootstrap stub -> 'globals' -> 'nil' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: collections\x7fCategory: sorted\x7fCategory: trees\x7fModuleInfo: Module: tree InitialContents: FollowSlot\x7fVisibility: public'
        
         treeSet = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'treeSet' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals treeSet.
\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'treeSet' -> () From: ( | {
         'Category: printing\x7fModuleInfo: Module: tree InitialContents: FollowSlot\x7fVisibility: public'
        
         collectionName = 'treeSet'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'emptyTrees' -> () From: ( | {
         'ModuleInfo: Module: tree InitialContents: FollowSlot\x7fVisibility: public'
        
         set = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'emptyTrees' -> 'set' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits emptyTrees set.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'treeSet' -> () From: ( | {
         'ModuleInfo: Module: tree InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* <- bootstrap stub -> 'traits' -> 'emptyTrees' -> 'set' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'treeSet' -> () From: ( | {
         'ModuleInfo: Module: tree InitialContents: FollowSlot\x7fVisibility: private'
        
         prototype = ( |
            | treeSet).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: collections\x7fCategory: sorted\x7fCategory: treeNodes\x7fModuleInfo: Module: tree InitialContents: FollowSlot'
        
         treeSetNode = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'treeSetNode' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals treeSetNode.
\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'treeSetNode' -> () From: ( | {
         'ModuleInfo: Module: tree InitialContents: FollowSlot\x7fVisibility: private'
        
         collectionName = 'treeBagNode'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'treeSetNode' -> () From: ( | {
         'Comment: read/write slot for contents of node \x7fModuleInfo: Module: tree InitialContents: FollowSlot\x7fVisibility: private'
        
         contents.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'treeSetNode' -> () From: ( | {
         'ModuleInfo: Module: tree InitialContents: FollowSlot\x7fVisibility: private'
        
         key.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'treeSetNode' -> () From: ( | {
         'Comment: read/write slot for left subtree \x7fModuleInfo: Module: tree InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         left <- bootstrap stub -> 'globals' -> 'nil' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'treeNodes' -> () From: ( | {
         'ModuleInfo: Module: tree InitialContents: FollowSlot\x7fVisibility: public'
        
         set = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'treeNodes' -> 'set' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits treeNodes set.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'treeSetNode' -> () From: ( | {
         'Comment: read-only slot for shared behavior \x7fModuleInfo: Module: tree InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'treeNodes' -> 'set' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'treeSetNode' -> () From: ( | {
         'ModuleInfo: Module: tree InitialContents: FollowSlot\x7fVisibility: private'
        
         prototype = ( |
            | treeSetNode).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'treeSetNode' -> () From: ( | {
         'ModuleInfo: Module: tree InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         right <- bootstrap stub -> 'globals' -> 'nil' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'collection' -> () From: ( | {
         'Category: transforming\x7fModuleInfo: Module: tree InitialContents: FollowSlot\x7fVisibility: public'
        
         asTreeBag = ( |
            | 
            treeBag copyContaining: self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'collection' -> () From: ( | {
         'Category: transforming\x7fModuleInfo: Module: tree InitialContents: FollowSlot\x7fVisibility: public'
        
         asTreeSet = ( |
            | 
            treeSet copyContaining: self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: collections\x7fCategory: sorted\x7fModuleInfo: Module: tree InitialContents: FollowSlot\x7fVisibility: public'
        
         emptyTrees = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'emptyTrees' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits emptyTrees.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'emptyTrees' -> () From: ( | {
         'ModuleInfo: Module: tree InitialContents: FollowSlot\x7fVisibility: public'
        
         abstract = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'emptyTrees' -> 'abstract' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits emptyTrees abstract.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'emptyTrees' -> 'abstract' -> () From: ( | {
         'Category: adding\x7fModuleInfo: Module: tree InitialContents: FollowSlot\x7fVisibility: public'
        
         add: x = ( |
            | at: x Put: x).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'emptyTrees' -> 'abstract' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: tree InitialContents: FollowSlot\x7fVisibility: public'
        
         at: k IfAbsent: block = ( |
            | block value: k).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'emptyTrees' -> 'abstract' -> () From: ( | {
         'Category: adding\x7fComment: Wow! The neatest method here: this creates a new tree (node),
          sets its contents, and changes the receiver\'s parent to point to it.\x7fModuleInfo: Module: tree InitialContents: FollowSlot\x7fVisibility: public'
        
         at: k Put: v = ( |
            | parent: nodeProto nodeCopyKey: k Contents: v).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'emptyTrees' -> 'abstract' -> () From: ( | {
         'Category: copying\x7fModuleInfo: Module: tree InitialContents: FollowSlot\x7fVisibility: public'
        
         copy = ( |
            | clone).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'emptyTrees' -> 'abstract' -> () From: ( | {
         'Category: copying\x7fModuleInfo: Module: tree InitialContents: FollowSlot\x7fVisibility: public'
        
         copyRemoveAll = ( |
            | copy).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'emptyTrees' -> 'abstract' -> () From: ( | {
         'Category: printing\x7fModuleInfo: Module: tree InitialContents: FollowSlot\x7fVisibility: public'
        
         debug = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'emptyTrees' -> 'abstract' -> () From: ( | {
         'Category: iterating\x7fModuleInfo: Module: tree InitialContents: FollowSlot\x7fVisibility: public'
        
         do: block = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'emptyTrees' -> 'abstract' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: tree InitialContents: FollowSlot\x7fVisibility: public'
        
         includesKey: k = ( |
            | false).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'emptyTrees' -> 'abstract' -> () From: ( | {
         'Category: removing\x7fModuleInfo: Module: tree InitialContents: FollowSlot\x7fVisibility: private'
        
         leftMost = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: collections\x7fCategory: sorted\x7fModuleInfo: Module: tree InitialContents: FollowSlot\x7fVisibility: public'
        
         tree = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'tree' -> () From: ( |
             {} = 'Comment: create the abstract traits object for all trees, empty and non-empty \x7fModuleInfo: Creator: traits tree.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'emptyTrees' -> 'abstract' -> () From: ( | {
         'ModuleInfo: Module: tree InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'tree' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'emptyTrees' -> 'abstract' -> () From: ( | {
         'Category: iterating\x7fModuleInfo: Module: tree InitialContents: FollowSlot\x7fVisibility: private'
        
         pushLeftsOnto: s = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'emptyTrees' -> 'abstract' -> () From: ( | {
         'Category: removing\x7fModuleInfo: Module: tree InitialContents: FollowSlot\x7fVisibility: public'
        
         remove: x IfAbsent: block = ( |
            | block value).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'emptyTrees' -> 'abstract' -> () From: ( | {
         'Category: removing\x7fModuleInfo: Module: tree InitialContents: FollowSlot\x7fVisibility: public'
        
         removeAll = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'emptyTrees' -> 'abstract' -> () From: ( | {
         'Category: iterating\x7fModuleInfo: Module: tree InitialContents: FollowSlot\x7fVisibility: public'
        
         reverseDo: block = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'emptyTrees' -> 'abstract' -> () From: ( | {
         'Category: iterating\x7fModuleInfo: Module: tree InitialContents: FollowSlot\x7fVisibility: public'
        
         with: c Do: b = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'emptyTrees' -> 'bag' -> () From: ( | {
         'ModuleInfo: Module: tree InitialContents: FollowSlot\x7fVisibility: private'
        
         nodeProto = ( |
            | treeBagNode).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'emptyTrees' -> 'bag' -> () From: ( | {
         'ModuleInfo: Module: tree InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'emptyTrees' -> 'abstract' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'emptyTrees' -> 'set' -> () From: ( | {
         'ModuleInfo: Module: tree InitialContents: FollowSlot\x7fVisibility: private'
        
         nodeProto = ( |
            | treeSetNode).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'emptyTrees' -> 'set' -> () From: ( | {
         'ModuleInfo: Module: tree InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'emptyTrees' -> 'abstract' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'tree' -> () From: ( | {
         'ModuleInfo: Module: tree InitialContents: FollowSlot\x7fVisibility: public'
        
         example = ( | {
                 'ModuleInfo: Module: tree InitialContents: FollowSlot'
                
                 x.
                }  {
                 'ModuleInfo: Module: tree InitialContents: FollowSlot'
                
                 y.
                } 
            | 
            x: copyRemoveAll.
            x printLine.
            x add: 3.
            x printLine.
            x add: 5.
            x printLine.
            y: x copy.
            x add: 3.
            x printLine.
            y printLine.
            (x includes: 3) printLine.
            (x includes: 6) printLine.
            x add: 4.
            x printLine.
            y printLine.
            (y includes: 4) printLine.
            [
                x: copyRemoveAll.
                x add: 3.
                x add: 5.
                y: x copy.
                x add: 3.
                x includes: 3.
                x includes: 6.
                x add: 4.
                x includes: 6.
                y includes: 4.
            ] time printLine.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'tree' -> () From: ( | {
         'ModuleInfo: Module: tree InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'collection' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: collections\x7fCategory: sorted\x7fModuleInfo: Module: tree InitialContents: FollowSlot\x7fVisibility: public'
        
         treeNodes = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'treeNodes' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits treeNodes.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'treeNodes' -> () From: ( | {
         'ModuleInfo: Module: tree InitialContents: FollowSlot\x7fVisibility: public'
        
         abstract = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'treeNodes' -> 'abstract' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits treeNodes abstract.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'treeNodes' -> 'abstract' -> () From: ( | {
         'Category: adding\x7fModuleInfo: Module: tree InitialContents: FollowSlot\x7fVisibility: public'
        
         add: x = ( |
            | 
            findKey: x IfHere: [addDuplicate: x] IfNot: [ | :n | n add: x ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'treeNodes' -> 'abstract' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: tree InitialContents: FollowSlot\x7fVisibility: public'
        
         at: k IfAbsent: block = ( |
            | 
            findKey: k
             IfHere: [ contents ]
              IfNot: [ | :subTree | subTree at: k IfAbsent: block ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'treeNodes' -> 'abstract' -> () From: ( | {
         'Category: adding\x7fModuleInfo: Module: tree InitialContents: FollowSlot\x7fVisibility: public'
        
         at: k Put: v = ( |
            | 
            findKey: k IfHere: [at: k PutDuplicate: v]
                       IfNot: [ | :n | n at: k Put: v ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'treeNodes' -> 'abstract' -> () From: ( | {
         'Category: copying\x7fModuleInfo: Module: tree InitialContents: FollowSlot\x7fVisibility: public'
        
         copy = ( |
            | clone parent: parent nodeCopy).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'treeNodes' -> 'abstract' -> () From: ( | {
         'Category: copying\x7fComment: This method resets the parent of a copy of the tree to the
	   empty tree traits, thus making it empty.
           Works this way rather than simply returning \'protoTree copy\' so that
	   protoTree can be modified (perhaps accidentally) without breaking
	   other code.
	   In other words, no code relies on the prototypical tree being empty.\x7fModuleInfo: Module: tree InitialContents: FollowSlot\x7fVisibility: public'
        
         copyRemoveAll = ( |
            | clone parent: emptyTreeTraits).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'treeNodes' -> 'abstract' -> () From: ( | {
         'Category: printing\x7fModuleInfo: Module: tree InitialContents: FollowSlot\x7fVisibility: public'
        
         debug = ( |
            | 
            '{' print.
            left debug.
            '|' print.
            contents print.
            '|' print.
            right debug.
            '}' print.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'treeNodes' -> 'abstract' -> () From: ( | {
         'Category: removing\x7fModuleInfo: Module: tree InitialContents: FollowSlot\x7fVisibility: private'
        
         deleteNode = ( |
            | 
            "Find the least value of the right subtree and use it
             as replacement.  If the right subtree is empty, use left
             subtree as replacement."
            right isEmpty ifTrue: [ parent: left ]
                          False: [ | replacement |
                                   replacement: right leftMost.
                                   contents: replacement contents.
                                   key: replacement key.
                                   replacement deleteNode]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'treeNodes' -> 'abstract' -> () From: ( | {
         'Category: iterating\x7fModuleInfo: Module: tree InitialContents: FollowSlot\x7fVisibility: public'
        
         do: b = ( |
            | 
            left do: b.
            b value: contents With: key.
            right do: b.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'treeNodes' -> 'abstract' -> () From: ( | {
         'Category: searching\x7fComment: this method factors out the idea that less than is left and
	  greater than is right \x7fModuleInfo: Module: tree InitialContents: FollowSlot\x7fVisibility: private'
        
         findKey: x IfHere: hereBlock IfNot: notHereBlock = ( |
            | 
            notHereBlock value:
                x compare: key
                    IfLess: [left] Equal: [^ hereBlock value] Greater: [right]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'treeNodes' -> 'abstract' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: tree InitialContents: FollowSlot\x7fVisibility: public'
        
         first = ( |
            | leftMost contents).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'treeNodes' -> 'abstract' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: tree InitialContents: FollowSlot\x7fVisibility: public'
        
         firstKey = ( |
            | leftMost  key).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'treeNodes' -> 'abstract' -> () From: ( | {
         'Category: searching\x7fModuleInfo: Module: tree InitialContents: FollowSlot\x7fVisibility: public'
        
         includesKey: x = ( |
            | 
            findKey: x
                IfHere: true
                IfNot: [ | :subTree | subTree includesKey: x ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'treeNodes' -> 'abstract' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: tree InitialContents: FollowSlot\x7fVisibility: public'
        
         last = ( |
            | rightMost contents).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'treeNodes' -> 'abstract' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: tree InitialContents: FollowSlot\x7fVisibility: public'
        
         lastKey = ( |
            | rightMost key).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'treeNodes' -> 'abstract' -> () From: ( | {
         'Category: removing\x7fModuleInfo: Module: tree InitialContents: FollowSlot\x7fVisibility: private'
        
         leftMost = ( |
            | left isEmpty ifTrue: [self] False: [left leftMost]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'treeNodes' -> 'abstract' -> () From: ( | {
         'Category: copying\x7fModuleInfo: Module: tree InitialContents: FollowSlot\x7fVisibility: private'
        
         nodeCopy = ( |
            | (clone left: left copy) right: right copy).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'treeNodes' -> 'abstract' -> () From: ( | {
         'Category: copying\x7fComment: _\x7fModuleInfo: Module: tree InitialContents: FollowSlot'
        
         nodeCopyKey: k Contents: c = ( |
            | (nodeCopy key: k) contents: c).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'treeNodes' -> 'abstract' -> () From: ( | {
         'ModuleInfo: Module: tree InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'tree' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'treeNodes' -> 'abstract' -> () From: ( | {
         'Category: iterating\x7fModuleInfo: Module: tree InitialContents: FollowSlot\x7fVisibility: private'
        
         pushLeftsOnto: s = ( |
            | s addLast: self.  left pushLeftsOnto: s.  self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'treeNodes' -> 'abstract' -> () From: ( | {
         'Category: removing\x7fModuleInfo: Module: tree InitialContents: FollowSlot\x7fVisibility: public'
        
         remove: k IfAbsent: ab = ( |
            | 
            findKey: k IfHere: [ deleteNode ]
                       IfNot:  [ | :subTree | subTree remove: k IfAbsent: ab ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'treeNodes' -> 'abstract' -> () From: ( | {
         'Category: removing\x7fModuleInfo: Module: tree InitialContents: FollowSlot\x7fVisibility: public'
        
         removeAll = ( |
            | parent: emptyTreeTraits).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'treeNodes' -> 'abstract' -> () From: ( | {
         'Category: removing\x7fModuleInfo: Module: tree InitialContents: FollowSlot\x7fVisibility: public'
        
         removeFirst = ( | {
                 'ModuleInfo: Module: tree InitialContents: FollowSlot'
                
                 c.
                } 
            | c: first. remove: firstKey. c).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'treeNodes' -> 'abstract' -> () From: ( | {
         'Category: iterating\x7fModuleInfo: Module: tree InitialContents: FollowSlot\x7fVisibility: public'
        
         reverseDo: b = ( |
            | 
            right reverseDo: b.
            b value: contents With: key.
            left reverseDo: b.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'treeNodes' -> 'abstract' -> () From: ( | {
         'Category: removing\x7fModuleInfo: Module: tree InitialContents: FollowSlot\x7fVisibility: private'
        
         rightMost = ( |
            | right isEmpty ifTrue: [self] False: [right rightMost]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'treeNodes' -> 'abstract' -> () From: ( | {
         'Category: iterating\x7fModuleInfo: Module: tree InitialContents: FollowSlot\x7fVisibility: public'
        
         with: c Do: b = ( | {
                 'ModuleInfo: Module: tree InitialContents: FollowSlot'
                
                 s <- bootstrap stub -> 'globals' -> 'list' -> ().
                } 
            | 
            s: s copyRemoveAll.
            pushLeftsOnto: s.
            c do: [ |:v2. :k2. top|
                s isEmpty ifTrue: [^self].
                top: s removeLast.
                b value: top contents With: v2 With: top key With: k2.
                top right pushLeftsOnto: s.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'treeNodes' -> 'bag' -> () From: ( | {
         'ModuleInfo: Module: tree InitialContents: FollowSlot\x7fVisibility: private'
        
         addDuplicate: x = ( |
            | right add: x).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'treeNodes' -> 'bag' -> () From: ( | {
         'ModuleInfo: Module: tree InitialContents: FollowSlot\x7fVisibility: private'
        
         at: k PutDuplicate: v = ( |
            | right at: k Put: v).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'treeNodes' -> 'bag' -> () From: ( | {
         'ModuleInfo: Module: tree InitialContents: FollowSlot\x7fVisibility: private'
        
         emptyTreeTraits = ( |
            | traits emptyTrees bag).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'treeNodes' -> 'bag' -> () From: ( | {
         'ModuleInfo: Module: tree InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'treeNodes' -> 'abstract' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'treeNodes' -> 'set' -> () From: ( | {
         'ModuleInfo: Module: tree InitialContents: FollowSlot\x7fVisibility: private'
        
         addDuplicate: x = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'treeNodes' -> 'set' -> () From: ( | {
         'ModuleInfo: Module: tree InitialContents: FollowSlot\x7fVisibility: private'
        
         at: k PutDuplicate: v = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'treeNodes' -> 'set' -> () From: ( | {
         'ModuleInfo: Module: tree InitialContents: FollowSlot\x7fVisibility: private'
        
         emptyTreeTraits = ( |
            | traits emptyTrees set).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'treeNodes' -> 'set' -> () From: ( | {
         'ModuleInfo: Module: tree InitialContents: FollowSlot\x7fVisibility: public'
        
         includes: x = ( |
            | includesKey: x).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'treeNodes' -> 'set' -> () From: ( | {
         'ModuleInfo: Module: tree InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'treeNodes' -> 'abstract' -> ().
        } | ) 



 '-- Side effects'

 globals modules tree postFileIn
