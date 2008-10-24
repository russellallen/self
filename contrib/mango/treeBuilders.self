"Sun-$Revision: 1.1.1.1 $"
 
"Copyright 1992-9 Sun Microsystems, Inc. and Stanford University.
 See the LICENSE file for license information."

"                                                Ole Agesen, October 1992."

traits mango treeBuilders tbConstructor _Define: ( |
  "tb abbreviates 'tree builder'. This object helps construct the 
   'tree builder objects' (which are objects that are sent messages
   during parsing to build parse trees).

   A tree builder object is constructed specifically for a given 
   unstructured production. It is sent a message, 'doStack:',
   when a reduction with the given production occurs during parsing.
   The tree builder must then:
      1. Perhaps build a new tree node (if the production is one that
         results in new nodes in the parse tree).
      2. Pop 2*n elements from the stack, where n is the number of
         symbols on the rhs of the production, and set the sons of
         the new node (if any) to the n of the popped elements that
         are tree nodes. (The stack contains an alternating sequence
         of tree nodes and parser states; the top being a state when
         'doStack:' is invoked). (Due to inlining in the grammars,
         the number of nodes popped may be smaller than 2*n).
      3. Return a node which will be put on the stack by the parser."

  "_" parent*       = traits clonable.
  "^" copy          = ( resend.copy init. ).
  "^" copyEmpty     = ( | r | resend.copy initEmpty. ).
  "^" printString   = ( 'tbConstructor(', steps printString, ')'. ).
  "_" tbSkeleton    = ( | "_" parent* = traits clonable. | ).
  "^" addLast: step = ( steps addLast: step. ).

  "^" noOfPops      = ( 
      | res <- 0. |
      steps do: [|:step| res: res + step noOfPops].
      res.    "Don't double it - we are not counting states."
    ).

  "^" assertNoOfPops: n = (
      noOfPops != n ifTrue: [error: 'bad number of pops'].
      self.
    ).

  "_" allObjDecls = (
      | r <- ''. |
      steps do: [|:step| r: r, step objDeclString]. 
      r.
    ).

  "_" allMethodDecls = (
      | r <- ''. |
      steps do: [|:step| r: r, step methodDeclString].
      r.
    ).

  "_" allActions = (
      | r <- ''. |
      steps do: [|:step| 
          r: (step popOptimizingConcat: r With: step actionString).
      ].
      r.
    ).

  "^" allSlotsString = (
      | tb. a. od. md. |
      od: allObjDecls.
      md: allMethodDecls.
      a:  allActions, finalResultStep finalResultExp.
      od: (od asTextLines indent: 2) asString, '\n'.
      a:  (a  asTextLines indent: 6) asString.
      od: od, '  "^" doStack: stack = (\n',
              '      | ', md, '|\n', 
              a, 
              '    ).\n'.
      od: '( |\n', od, '| )'.
      od.
    ).

  "^" setReduceActionIn: prod = (
      "Return the tree builder object that is described by this
       'tbConstructor'."
      | treeBuilder. |
      treeBuilder: (tbSkeleton copy _AddSlots: allSlotsString eval).
      steps do: [|:step| step initialization: treeBuilder].
      prod reduceAction: treeBuilder.
    ).

  "^" atStackDepth: d Inline: tbCons = (
      "Let the result built by tbCons be consumed by the step that 
       would otherwise have consumed the element d deep in the stack
       (actually 2*d since the stack also contains parser states).
       NB: The stack top corresponds to the rightmost symbol on the
       rhs of the production being reduced by. That is why everything
       is 'backwards'. d is one-based, i.e. has range 1, 2, ..."
      | i <- 0. allsteps <- list. |
      allsteps: allsteps copy.
      [steps isEmpty not] whileTrue: [| step <- mango treeBuilders tbStep. |
          step: steps removeFirst.
          step suppliers do: [|:suppl. :supplIdx|
              suppl isStackSupplier ifTrue: [i: 1 + i].
              i = d ifTrue: [
                  "Found the crucial place where the inlinee's result is
                   being consumed."
                  step suppliers at: supplIdx Put: tbCons finalResultStep.
                  allsteps addAll:  tbCons steps.
                  allsteps addLast: step.
                  allsteps addAll:  steps.
                  steps: allsteps.
                  ^ self.             "Done."
              ].
          ].
          allsteps addLast: step.     "Not this step."
      ].
      error: 'atStackDepth:Inline: bad depth'.
    ).

  "_" initEmpty = (
      steps: steps copyRemoveAll.
      finalResultStep: nil.
      self.
    ).

  "_" init = (
      "Copying (and intializing) a 'tbConstructor' is not simple. 
       The reason is that the steps may internally have references
       to each other. This structure must be preserved in the copy."
      | copyMap <- dictionary. |
      copyMap: copyMap copy.
      steps:   steps   copy.
      steps mapBy: [|:step. r. | 
          r: step copy. 
          copyMap at: step Put: r.
          r suppliers: step suppliers copy.  "Because copy has reset all 
				  	      suppliers in r to be 
 					      stacksupplier."
          r.
      ]. 
      steps do: [|:step| step adjustReferences: copyMap].
      finalResultStep: (copyMap at: finalResultStep).
      self.
    ).
| )

mango treeBuilders tbConstructor _Define: ( |
      {} = 'IsComplete: '.
  "_" parent* = traits mango treeBuilders tbConstructor.
  "_" steps <- list.

    "The step which is responsible for producing the final result.
     Not necessarily the last step."
  "^" finalResultStep <- mango treeBuilders tbStep.  
| )


traits mango treeBuilders tbStep _Define: ( |
  "_" parent*          = traits clonable.
  "^" copy             = ( resend.copy initTbStep. ).
  "^" printString      = 'tbStep'.
  "^" objDeclString    = ''.  "Put in tree builder object."
  "^" methodDeclString = ''.  "Put in decl part of 'doParser:Stack:Production:'"
  "^" actionString     = ''.  "Put in body of 'doParser:Stack:Production:'"
  "^" noOfArgs         = 0.   "How many subexp's I consume."
  "^" resultPrelude    = ''.
  "^" resultExp        = ( error: 'childShouldImplement'. ). "How to get result."
  "^" resultPostlude   = ''.
  "^" initialization: treeBuilder = ( self. ).
  "^" isStackSupplier  = false.
  "_" uniqueNo <- 0.

  "_" initializeNode: nodeName = ( 
      "Whenever a tree node is completed (i.e. all its sons have been added
       (for constructor nodes) or all its elements have been added (for list
       nodes) it is sent an initialization message ('initialize_node:'). 
       In this way, all the nodes in the tree will be initialized bottom up,
       and a node will always be 'complete' when it is initialized. We 
       provide no guarantees as to the initialization order, except that it 
       is bottom up. I.e. it is not guaranteed that sons of a node will be 
       initialized in any given order (the reason is that this may depend on
       whether productions are inlined or not)." 
      nodeName, ' initialize_node: stack.\n'.
    ).

  "^" noOfPops = (
      | res <- 0. |
      suppliers do: [|:suppl| suppl isStackSupplier ifTrue: [res: 1 + res]].
      res.
    ).

  "^" popOptimizingConcat: str1 With: str2 = (
      "Simple optim:   'stack pop. stack pop.' --> 'stack pop: 2'."
      | stackpop = 'stack pop.\n'. |
      (stackpop isPrefixOf: str2) && [stackpop isSuffixOf: str1] ifTrue: [
          | s <- ''. |
          s: (str1 copySize: (str1 size - stackpop size)).
          s: s, 'stack pop: 2.\n'.
          s: s, (str2 copyFrom: stackpop size).
          s.
      ] False: [
          str1, str2.
      ].
    ).

  "^" adjustReferences: copyMap = ( 
      "Here we just do the suppliers."
      suppliers mapBy: [|:sup| copyMap at: sup IfAbsent: [sup]].
      self. 
    ).

  "^" finalResultExp = ( 
      resultExp. "NB: stack supplier should not implement this message."
    ).

  "_" withSupplier: n Do: blk = (
      "'blk' is invoked with a string that is an expression denoting the
       output of the n'th supplier. 'blk' should return a string that 
       denotes how this output is used."
      (suppliers at: n) resultPrelude,
      (blk value: (suppliers at: n) resultExp),
      (suppliers at: n) resultPostlude.
    ).

  "_" initTbStep = ( 
      uniqueStr: '_', uniqueNo printString.
      uniqueNo: 1 + uniqueNo. 
      suppliers: (vector copySize: noOfArgs FillingWith: ( |      
        {} = 'IsComplete: '.
        "Default is to get arguments from stack.
         This is changed when productions are inlined."
        "_" parent*          = traits oddball.
        "^" printString      = 'stackSupplier'.
        "^" resultPrelude    = 'stack pop.\n'.
        "^" resultExp        = 'stack top'.
        "^" resultPostlude   = 'stack pop.\n'.
        "^" isStackSupplier  = true.
      | )).
      self.
    ).

  "^" includeAsserts  <- true.
  
  "_" assert: exp HasKind: k = (
      includeAsserts ifTrue: [
          'mango assertSwitch && [', exp, ' is_', k, ' not] ifTrue: [\n',
          '    error: \'bad kind supplied \', ', exp, ' token_kind,\n',
                       '       \'; expecting symbol of kind ', k, '\'.\n',
          '].\n'.
      ] False: ''.
    ).
| )

mango treeBuilders tbStep _Define: ( |
      {} = 'IsComplete: '.
  "_" parent* = traits mango treeBuilders tbStep.
  "_" uniqueStr <- '_123'.
  "^" suppliers <- vector.    "Where I get my arguments from."
| )


traits mango treeBuilders tbNewNodeStep _Define: ( |
  "_" parent*          = traits mango treeBuilders tbStep.
  "^" noOfArgs         = 0.
  "^" printString      = ( 'tbNewNodeStep(', sym printString, ')'. ).
  "^" methodDeclString = ( newNodeName, '. '. ).
  "^" objDeclString    = ( objDeclName, ' = nil.\n'. ).
  "^" resultExp        = ( newNodeName. ).
  "_" objDeclName      = ( (sym kindAsSlotName), uniqueStr. ).
  "_" newNodeName      = ( 'newNode', uniqueStr. ).

  "^" actionString = ( 
      newNodeName, ': ', objDeclName, ' copy.\n',
      (initialize ifTrue: [initializeNode: newNodeName] False: '').
    ).

  "^" copySymbol: sym Initialize: bool = ( 
      resend.copy initSymbol: sym Initialize: bool.
    ).

  "^" initialization: treeBuilder = (
      (reflect: treeBuilder) at: objDeclName
                                  PutContents: (reflect: sym protoSkeleton)
                                       IfFail: raiseError.
      "We can't just assign, since the slot is constant for efficiency
       and principal reasons. This is how it would have been done, had
       the slot been assignable:
       (objDeclName, ':') sendTo: treeBuilder With: sym protoSkeleton."
      self.
    ).

  "_" initSymbol: s Initialize: bool = ( 
      sym: s. 
      initialize: bool.  "If this is true, initialize node immediately. Used
                          for nodes that have no sons, i.e. epsilon
                          productions."
      self.
    ).
| )

(mango treeBuilders tbNewNodeStep _Define: 
 mango treeBuilders tbStep copy _AddSlots: ( |
  "_" parent* = traits mango treeBuilders tbNewNodeStep.
 "^_" sym <- mango symbols symbol.
 "^_" initialize <- false.
| ))


traits mango treeBuilders tbSetSonStep _Define: ( |
    "Set a single son in a tree node."
  "_" parent*          = traits mango treeBuilders tbStep.
  "^" printString      = ( 'tbSetSonStep(', sonSym printString, ')'. ).
  "^" noOfArgs         = 1.
  "^" resultExp        = ( parentNodeStep resultExp. ).
  "^" methodDeclString = ( sonName, '. '. ).
  "_" sonName          = ( sonSym tagAsSlotName, uniqueStr. ).

  "^" adjustReferences: copyMap = (
      parentNodeStep: (copyMap at: parentNodeStep).
      resend.adjustReferences: copyMap.
    ).

  "^" copyParentNode: pns SonSymbol: ss InitializeParent: bool = (
      resend.copy initParentNode: pns SonSymbol: ss InitializeParent: bool.
    ).

  "^" actionString = (
      mango assertSwitch && 
      [initializeParent && parentNodeStep initialize] ifTrue: [
          error: 'both son and parent tries to initialize node'.
      ].
      (withSupplier: 0 Do: [|:child|
          sonName, ': ', child, '.\n',    "Store in temporary."
          (assert: sonName HasKind: sonSym kindAsSlotName),
          resultExp, ' ', sonSym tagAsSlotName, ': ', sonName, '.\n', 
          (initializeParent ifTrue: [initializeNode: resultExp] False: '').
      ]).
    ).

  "_" initParentNode: pns SonSymbol: ss InitializeParent: bool = ( 
      parentNodeStep:   pns.   "The 'tbNewNodeStep' that builds the parent."
      sonSym:           ss.
      initializeParent: bool.
      self.
    ).
| )

(mango treeBuilders tbSetSonStep _Define: 
 mango treeBuilders tbStep copy _AddSlots: ( |
  "_" parent* = traits mango treeBuilders tbSetSonStep.
 "^_" parentNodeStep   <- mango treeBuilders tbNewNodeStep.
 "^_" sonSym           <- mango symbols symbol.
 "^_" initializeParent <- false.   "True if this step is setting the last son."
| ))


traits mango treeBuilders tbAddListElmStep _Define: ( |
  "_" parent*           = traits mango treeBuilders tbStep.
  "^" printString       = ( 'tbAddListElmStep(', elmSym printString, ')'. ).
  "^" noOfArgs          = 2.
  "_" listName          = ( 'list', uniqueStr.    ).
  "_" elmName           = ( 'element', uniqueStr. ).
  "^" methodDeclString  = ( listName, '. ', elmName, '. '. ).
  "^" resultExp         = ( listName. ).
  "_" separatorAction1  = ''.
  "_" separatorAction2  = ''.

  "^" copyListSymbol: ls ElmSymbol: es = ( 
      copy initListSymbol: ls ElmSymbol: es.
     ).

  "_" initListSymbol: ls ElmSymbol: es = ( 
      listSym: ls.
      elmSym: es. 
      self.
    ).

  "^" actionString = (
      | str <- ''. s <- ''. |
      str: (withSupplier: 0 Do: [|:elm|
          elmName,  ': ', elm, '.\n',     "Store in temporary."
          (assert: elmName HasKind: elmSym kindAsSlotName)
      ]).  
      str: (popOptimizingConcat: str With: separatorAction1).
      s: (withSupplier: noOfArgs - 1 Do: [|:lst| 
          (assert: lst HasKind: listSym kindAsSlotName),
          listName, ': ', lst, '.\n'.
      ]).
      str: (popOptimizingConcat: str With: s).
      str, separatorAction2,
      listName , ' add_elem: ', elmName, '.\n'.     "Add element to lst."
    ).
| )

(mango treeBuilders tbAddListElmStep _Define: 
 mango treeBuilders tbStep copy _AddSlots: ( |
  "_" parent* = traits mango treeBuilders tbAddListElmStep.
 "^_" elmSym  <- mango symbols symbol.
 "^_" listSym <- mango symbols symbol.
| ))


traits mango treeBuilders tbAddListSepElmStep _Define: ( |
  "_" parent*           = traits mango treeBuilders tbAddListElmStep.
  "^" noOfArgs          = 3.
  "_" sepName           = ( 'separator', uniqueStr. ).
  "^" methodDeclString  = ( resend.methodDeclString, sepName, '. '. ).
  "_" initSepSymbol: ss = ( sepSym: ss. self. ).
  "_" separatorAction2  = ( listName, ' add_sep: ', sepName, '.\n'. ). 

  "_" separatorAction1  = ( 
      withSupplier: 1 Do: [|:sep| 
          sepName, ': ', sep, '.\n',    "Store in temporary."
          (assert: sepName HasKind: sepSym kindAsSlotName)
      ].
    ).

  "^" printString = ( 
      'tbAddListSepElmStep(', 
      elmSym printString, ',',
      sepSym printString, ')'.
    ).

  "^" copyListSymbol: ls ElmSymbol: es SepSymbol: ss = ( 
      (resend.copyListSymbol: ls ElmSymbol: es) initSepSymbol: ss.
    ).
| )

(mango treeBuilders tbAddListSepElmStep _Define: 
 mango treeBuilders tbAddListElmStep copy _AddSlots: ( |
  "_" parent* = traits mango treeBuilders tbAddListSepElmStep.
 "^_" sepSym <- mango symbols symbol.
| ))


traits mango treeBuilders tbStartList0Step _Define: ( |
  "_" parent*     = traits mango treeBuilders tbNewNodeStep.
  "^" printString = ( 'tbStartList0Step(', sym printString, ')'. ).
  "^" noOfArgs    = 0.
  "^" copyListSym: ls = ( resend.copySymbol: ls Initialize: false. ).
| )

(mango treeBuilders tbStartList0Step _Define: 
 mango treeBuilders tbNewNodeStep copy _AddSlots: ( |
  "_" parent*  = traits mango treeBuilders tbStartList0Step.
| ))


traits mango treeBuilders tbStartList1Step _Define: ( |
  "_" parent*     = traits mango treeBuilders tbStartList0Step.
  "^" noOfArgs    = 1.
  "^" copyListSym: ls ElmSym: es = ( (resend.copyListSym: ls) initElmSym: es. ).
  "_" initElmSym: es    = ( elmSym: es. self. ).
  "_" elmName           = ( 'element', uniqueStr. ).
  "^" methodDeclString  = ( resend.methodDeclString, elmName, '. '. ).

  "^" printString = ( 
      'tbStartList1Step(', sym printString, ',', elmSym printString, ')'. 
    ).

  "^" actionString = (
      resend.actionString,                   "Construct the new list."
      (withSupplier: 0 Do: [|:elm|
          elmName, ': ', elm, '.\n',    "Store in temporary."
          (assert: elmName HasKind: elmSym kindAsSlotName),
          newNodeName, ' add_elem: ', elmName, '.\n'
      ]).
    ).
| )

(mango treeBuilders tbStartList1Step _Define: 
 mango treeBuilders tbStartList0Step copy _AddSlots: ( |
  "_" parent* = traits mango treeBuilders tbStartList1Step.
 "^_" elmSym <- mango symbols symbol.
| ))


traits mango treeBuilders tbNoChangeStep _Define: ( |
  "Returns the topmost symbol on the stack as the new symbol to
   push, i.e. is a no-op. Use only with productions whose rhs has
   size 1 and which do not result in a new node on the stack."
  "_" parent*          = traits mango treeBuilders tbStep.
  "^" printString      = 'tbNoChangeStep'.
  "^" noOfArgs         = 1.
  "_" nodeName         = ( 'node', uniqueStr. ).
  "^" methodDeclString = ( nodeName, '. '. ).
  "^" resultExp        = ( nodeName. ).
  "_" initializePart   = ''.

  "^" actionString = ( 
      withSupplier: 0 Do: [|:node| nodeName, ': ', node, '.\n', initializePart].
    ).
| )

(mango treeBuilders tbNoChangeStep _Define: 
 mango treeBuilders tbStep copy _AddSlots: ( |
  "_" parent* = traits mango treeBuilders tbNoChangeStep.
| ))


traits mango treeBuilders tbInitializeStep _Define: ( |
  "Same as 'tbNoChangeStep' but in addition initializes the tree
   node it is passing on."
  "_" parent*        = traits mango treeBuilders tbNoChangeStep.
  "^" printString    = 'tbInitializeStep'.
  "_" initializePart = ( initializeNode: nodeName. ).
| )

(mango treeBuilders tbInitializeStep _Define: 
 mango treeBuilders tbNoChangeStep copy _AddSlots: ( |
  "_" parent* = traits mango treeBuilders tbInitializeStep.
| ))


traits mango treeBuilders tbInitializeListStep _Define: ( |
  "Same as 'tbInitializeStep' but provides a different initialization
   routine that does things specific to list nodes."
  "_" parent*        = traits mango treeBuilders tbInitializeStep.
  "^" printString    = 'tbInitializeListStep'.
  "_" initializePart = ( initializeNode: nodeName. ).

  "_" initializeNode: nodeName = (
      nodeName, ' list_specific_init.\n',
      (resend.initializeNode: nodeName).
    ).
| )

(mango treeBuilders tbInitializeListStep _Define: 
 mango treeBuilders tbInitializeStep copy _AddSlots: ( |
  "_" parent* = traits mango treeBuilders tbInitializeListStep.
| ))
