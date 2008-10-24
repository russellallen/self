"Sun-$Revision: 30.6 $"
 
"Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
 See the LICENSE file for license information."

"                                                Ole Agesen, September 1992."


traits mango productions structuredProduction _Define: ( |
  "_" parent*                = traits clonable.
  "_" trader*                = mixins mango tracer.
  "^" isStructuredProduction = true.
  "^"   isConProduction      = false.
  "^"   isLstProduction      = false.
  "^"     isLst1Production   = false.
  "^"     isLst0Production   = false.
  "^"   isAltProduction      = false.
  "^"   isOptProduction      = false.
  "^" extendTreeSkeleton     = ( "Extended by children."  self. ).
  "^" printString = 'structuredProduction'.
  "_" noChangeTBC = ( oneStepTBC: mango treeBuilders tbNoChangeStep copy. ).

  "_" oneStepTBC: step = (
      | tbc <- mango treeBuilders tbConstructor. |
      tbc: tbc copyEmpty.
      tbc finalResultStep: step.
      tbc addLast: step.
      tbc.
    ).

  "_" conTBCFor: p = (
      "'p' is an unstructored production."
      | tbc. ns  <- mango treeBuilders tbNewNodeStep. |
      "Nodes corresponding to epsilon productions are initialized
       immediately since they have no sons. Other nodes are initialized
       when all their sons have been set."
      ns:  (ns copySymbol: p lhs Initialize: p isEpsilonProduction).
      tbc: (oneStepTBC: ns).
      p rhs reverseDo: [|:s. :idx |
          "When the last son has been set, we must initialize the parent."
          tbc addLast: (mango treeBuilders tbSetSonStep 
                                               copyParentNode: ns 
                                                    SonSymbol: s 
                                             InitializeParent: 0 = idx).
      ].
      tbc.
    ).

  "^" psymbolsDo: blk = (
      "Evaluate 'blk' on all symbols in the lhs/rhs of this 
       structured production. Do not include 'helper' symbols that are
       used only in the equiv. unstructured productions."
      blk value: lhs.
      self.
    ).

  "^" pnonterminalsDo: blk = (
      "Evaluate 'blk' on all nonterminals in the lhs/rhs of this production."
      psymbolsDo: [|:s| s isNonterminal ifTrue: [blk value: s]].
    ).

  "^" pterminalsDo: blk = (
      "Evaluate 'blk' on all terminals in the lhs/rhs of this production."
      psymbolsDo: [|:s| s isTerminal ifTrue: [blk value: s]].
    ).

  "^" pproductionsDo: blk = ( 
      "Evaluate 'blk' on the (unstructured) productions that are equiv.
       to this structured production."
      productions do: blk.
      self.
    ).

  "^" canTerminateWith: t = (
      "Given that 't' is a set of symbols that can terminate, can the
       lhs of this production also terminate?"
       error: 'childShouldImplement'.
    ).

  "_" checkNonterminal: s = (
      s isNonterminal ifFalse: [error: s objectID, ' is not a nonterminal'].
      self.
    ).

  "_" checkTerminal: s = (
      s isTerminal ifFalse: [error: s objectID, ' is not a terminal'].
      self.
    ).

  "_" checkSymbol: s = (
      s isSymbol ifFalse: [error: s objectID, ' is not a symbol'].
      self.
    ).

  "_" initLHS: l = (
      lhs: l.
      checkNonterminal: lhs.
      self.
    ).
| )

mango productions structuredProduction _Define: ( |
      {} = 'IsComplete: '.
  "_" parent*      = traits mango productions structuredProduction.
 "^_" lhs         <- mango symbols nonterminal.
  "_" productions <- vector.     "Unstruct. productions equiv. to this one."
  "^" prodId      <- -1.
| )


traits mango productions conProduction _Define: ( |
    "Expansion is the trivial one."
  "_" parent*           = traits mango productions structuredProduction.
  "^" isConProduction   = true.
  "^" copyLHS: l RHS: r = ( resend.copy initLHS: l RHS: r. ).
  "^" psymbolsDo: blk   = ( rhs do: blk. resend.psymbolsDo: blk. ).

  "^" canTerminateWith: t = (
       rhs do: [|:s| (t includes: s) ifFalse: [^ false]. ].
       true.
    ).

  "^" printString = ( 
      | res <- ''. |
      res: lhs printString, ' ::='.
      rhs do: [|:s| res: res, ' ', s printString].
      res.
    ).

  "^" extendTreeSkeleton = (
      | proto <- ''. traits <- ''. |
      resend.extendTreeSkeleton.
      rhs do: [|:s. child <- ''. | 
          child:  s tagAsSlotName.
          proto:  proto, child, '. '.
          traits: traits, 'blk value: ', child, '. '.
      ].

      proto:  '( | ', proto, ' | )'.
      traits: '( | "^" children_do: blk = (', traits, 'self. ). | )'.

      lhs  protoSkeletonFAddSlots: proto  eval.
      lhs traitsSkeletonFAddSlots: traits eval.
      self.
    ).

  "_" setTBConstructors = ( 
      productions first tbConstructor: (conTBCFor: productions first).
      self. 
    ).

  "_" initLHS: l RHS: r = ( 
      | occurrences <- dictionary. |
      initLHS: l.      "Can't use 'resend.initLHR: l' due to lookup bug."
      rhs: r asVector. 
      occurrences: occurrences copy.
      rhs do: [|:s. oc. | 
          checkSymbol: s. 
          oc: (occurrences at: s tag IfAbsent: 0).
          oc: 1 + oc. 
          occurrences at: s tag Put: oc.
          1 < oc ifTrue: [
              level: 2 Print: 'disambiguating tag \'', s tag, 
                              '\' in production \'', printString, '\'\n'.
              s tag: s tag, '_', oc printString.
          ].
      ].
      productions: (productions copySize: 1).
      productions at: 0 
                 Put: (mango productions production copyLHS: lhs RHS: rhs).
      setTBConstructors.
      self.
    ).
| )

(mango productions conProduction _Define: 
  mango productions structuredProduction copy _AddSlots: ( |
  "_" parent* = traits mango productions conProduction.
 "^_" rhs <- vector.
| ) )


traits mango productions lstProduction _Define: ( |     "Abstract."
  "_" parent* = traits mango productions structuredProduction.
  "_" listPrintKind = ' ::*+ '.
  "^" isLstProduction = true.
  "^" hasSeparator = ( nil != separator. ).
 
  "^" psymbolsDo: blk = (
      blk value: element.
      hasSeparator ifTrue: [blk value: separator].
      resend.psymbolsDo: blk.
    ).

  "^" copyLHS: l Element: e Separator: s = ( 
      resend.copy initLHS: l Element: e Separator: s.
    ).

  "^" printString = ( 
      lhs printString, listPrintKind, element printString, 
      (hasSeparator ifTrue: [' ', separator printString] False: '').
    ).

  "^" extendTreeSkeleton = (
      resend.extendTreeSkeleton.
      hasSeparator ifTrue: [
          lhs  protoSkeletonFAddSlots: ( | 
            "^_" elements   <- sequence. "Use sequences - more space efficient."
            "^_" separators <- sequence.
          | ).
          lhs traitsSkeletonFAddSlots: ( | 
            "_" list_mixin* = traits mango tokens listSepMixin. 
            "^" copy        = ( resend.copy copy_listState. ).
          | ).
      ] False: [
          lhs  protoSkeletonFAddSlots: ( | 
            "^_" elements   <- sequence.
          | ).
          lhs traitsSkeletonFAddSlots: ( | 
            "_" list_mixin* = traits mango tokens listNoSepMixin.
            "^" copy        = ( resend.copy copy_listState. ).
          | ).
      ].
      self.
    ).

  "_" addStep = (
      hasSeparator ifTrue: [
          mango treeBuilders tbAddListSepElmStep 
            copyListSymbol: lhs ElmSymbol: element SepSymbol: separator.
     ] False: [
          mango treeBuilders tbAddListElmStep    
            copyListSymbol: lhs ElmSymbol: element.
     ].
    ).

  "_" addTBC = ( oneStepTBC: addStep. ).

  "_" startLst0TBC = (
      oneStepTBC: (mango treeBuilders tbStartList0Step copyListSym: lhs).
    ).

  "_" startLst1TBC = (
      oneStepTBC: (mango treeBuilders tbStartList1Step 
                   copyListSym: lhs ElmSym: element).
    ).

  "_" endLstTBC = (
      oneStepTBC: (mango treeBuilders tbInitializeListStep copy).
    ).

  "_" initLHS: l Element: e Separator: s = (
      initLHS:   l.   "Can't use 'resend.initLHR: l' due to lookup bug.%%%"
      element:   e. 
      separator: s.
      checkSymbol: element.
      nil != separator ifTrue: [checkSymbol: separator].
      self.
    ).
| )

(mango productions lstProduction _Define: 
 mango productions structuredProduction copy _AddSlots: ( |
  "Abstract."
  "_" parent*    = traits mango productions lstProduction.
 "^_" element   <- mango symbols symbol.
 "^_" separator <- mango symbols symbol. "nil means no separator."
| ) )
  

traits mango productions lst0Production _Define: ( |
    "Expansion of  L ::* E S  is
        0. L -> A 
        1. A -> <epsilon>
        2. A -> B
        3. B -> E
        4. B -> B S E           (leave out S if no separator). 
     Here A and B are a new nonterminals.
     Prefer left recursion since it results in less deep parser stack.
     Why is the L -> A production necessary?! It is only necessary because
     C is a broken language with a broken syntax. When parsing C we need
     to have side effecting initialize actions done during parsing. These 
     must be done in a left to right order. For this to be ensured, we 
     need to know when we reach the end of a list, so that the list's 
     initialize action can be performed.   L -> A allows detection of the
     end of the list.
     If it wasn't for the side effects we could execute these actions in
     *any* order, and thus would not need to perform it immediately after
     the list was completed (i.e. we could wait till the list node is
     later consumed by some other node and initialize it at that point - 
     this strategy results in a right to left action ordering, i.e. is
     incompatible with C).
    "
  "_" parent*             = traits mango productions lstProduction.
  "_" listPrintKind       = ' ::* '.
  "^" isLst0Production    = true.
  "^" canTerminateWith: t = ( true. ).

  "^" setTBConstructors   = (
      (productions at: 0) tbConstructor: endLstTBC.
      (productions at: 1) tbConstructor: startLst0TBC.
      (productions at: 2) tbConstructor: noChangeTBC.
      (productions at: 3) tbConstructor: startLst1TBC.
      (productions at: 4) tbConstructor: addTBC.
    ).

  "_" initLHS: l Element: e Separator: s = (
      | h0 <- vector. 
        h1 <- vector. 
        h2 <- vector. 
        h3 <- vector. 
        h4 <- vector.
        b  <- mango symbols nonterminal. 
        a  <- mango symbols nonterminal. |
      resend.initLHS: l Element: e Separator: s.
      a:  (lhs copyKind: lhs kind, '_internal00002').
      b:  (lhs copyKind: lhs kind, '_internal00003').
      h0: (h0 copySize: 1 FillingWith: a).
      h1: (h1 copySize: 0).
      h2: (h2 copySize: 1 FillingWith: b).
      h3: (h3 copySize: 1 FillingWith: element).
      h4: (hasSeparator ifTrue: [b & separator & element]
                         False: [b & element]) asVector.
      productions: (
          (mango productions production copyLHS: lhs RHS: h0) &
          (mango productions production copyLHS: a   RHS: h1) &
          (mango productions production copyLHS: a   RHS: h2) &
          (mango productions production copyLHS: b   RHS: h3) &
          (mango productions production copyLHS: b   RHS: h4)
      ) asVector.
      setTBConstructors.
      self.
    ).
| )

(mango productions lst0Production _Define: 
 mango productions lstProduction copy _AddSlots: ( |
  "_" parent* = traits mango productions lst0Production.
| ) )


traits mango productions lst1Production _Define: ( |
    "Expansion of  L ::+ E S  is
       0. L -> A
       1. A -> E  
       2. A -> A S E   (leave out S if no separator).
     Prefer left recursion since it results in less deep parser stack.
     Also see long comment in section explaining expansion of 
     lst0Production.
    "
  "_" parent*             = traits mango productions lstProduction.
  "_" listPrintKind       = ' ::+ '.
  "^" isLst1Production    = true.
  "^" canTerminateWith: t = ( t includes: element. ).

  "^" setTBConstructors = (
      1 != (productions at: 0) rhs size ifTrue: [error: 'prod\'s reordered'].
      (productions at: 0) tbConstructor: endLstTBC.
      (productions at: 1) tbConstructor: startLst1TBC.
      (productions at: 2) tbConstructor: addTBC.
      self.
    ).

  "_" initLHS: l Element: e Separator: s = (
      | h0 <- vector. h1 <- vector. h2 <- vector. 
        a <- mango symbols nonterminal. |
      resend.initLHS: l Element: e Separator: s.
      a:  (lhs copyKind: lhs kind, '_internal00002').
      h0: (h0 copySize: 1 FillingWith: a).
      h1: (h1 copySize: 1 FillingWith: element).
      h2: (hasSeparator ifTrue: [a & separator & element]
                         False: [a & element]) asVector.
      productions: (
          (mango productions production copyLHS: lhs RHS: h0) &
          (mango productions production copyLHS: a   RHS: h1) &
          (mango productions production copyLHS: a   RHS: h2)
      ) asVector.
      setTBConstructors.
      self.
    ).
| )

(mango productions lst1Production _Define: 
 mango productions lstProduction copy _AddSlots: ( |
  "_" parent* = traits mango productions lst1Production.
| ) )


traits mango productions altProduction _Define: ( |
    "Expansion of    h ::| a1 | a2 | ... | an   is  
                     h ::= a1, h ::= a2, ..., h ::= an."
  "_" parent* = traits mango productions structuredProduction.
  "^" isAltProduction = true.
  "^" copyLHS: l Alternatives: a = ( resend.copy initLHS: l Alternatives: a).
  "^" psymbolsDo: blk = ( alternatives do: blk. resend.psymbolsDo: blk. ).

  "^" canTerminateWith: t = ( 
      alternatives do: [|:s| (t includes: s) ifTrue: [^ true]].
      false.
    ).

  "^" printString = (
      | res <- ''. |
      res: lhs printString, ' ::| '.
      alternatives doFirst: [|:s| res: res, s printString]
                MiddleLast: [|:s| res: res, ' | ', s printString]
                   IfEmpty: [].
      res.
    ).

  "^" setTBConstructors = (
      pproductionsDo: [|:p| p tbConstructor: noChangeTBC].
      self.
    ).

  "_" initLHS: l Alternatives: a = (
      initLHS: l.      "Can't use 'resend.initLHR: l' due to lookup bug."
      alternatives: a asVector.
      alternatives isEmpty ifTrue: [
          error: 'empty alternatives list for ', lhs printString.
      ].
      productions: (alternatives copy mapBy: [|:s. h <- vector. |
          checkSymbol: s.
          mango productions production 
              copyLHS: lhs RHS: (h copySize: 1 FillingWith: s).
      ]).
      setTBConstructors.
      self.
    ).
| )

(mango productions altProduction _Define: 
 mango productions structuredProduction copy _AddSlots: ( |
  "_" parent* = traits mango productions altProduction.
 "^_" alternatives <- vector.   "Vector of nonterminals."
| ) )


traits mango productions optProduction _Define: ( |
    "Expansion of   h ::? e    is   h ::= <epsilon>, h ::= e."
  "_" parent*               = traits mango productions structuredProduction.
  "^" isOptProduction       = true.
  "^" printString           = ( lhs printString, ' ::? ', element printString. ).
  "^" copyLHS: l Element: e = ( resend.copy initLHS: l Element: e ).
  "^" psymbolsDo: blk       = ( blk value: element. resend.psymbolsDo: blk. ).
  "^" canTerminateWith: t   = ( true. ).

  "^" extendTreeSkeleton = (
      resend.extendTreeSkeleton.

      lhs protoSkeletonFAddSlots: ('( | ', 
          element tagAsSlotName, ' <- nil.   "nil means element is absent. 472"
      | )') eval.

      lhs traitsSkeletonFAddSlots: ('( |
        "^" opt_is_present   = ( nil != ', element tagAsSlotName, '. ).
        "^" children_do: blk = ( 
            opt_is_present ifTrue: [blk value: ', element tagAsSlotName, '].
            self.
          ).
      | )') eval.
    ).

  "^" setTBConstructors = (
      productions do: [|:p| p tbConstructor: (conTBCFor: p)].
      self.
    ).

  "_" initLHS: l Element: e = (
      | h0 <- vector. h1 <- vector. |
      initLHS: l.      "Can't use 'resend.initLHR: l' due to lookup bug."
      element: e.
      checkSymbol: element.
      h0: (h0 copySize: 0).
      h1: (h1 copySize: 1).
      h1 at: 0 Put: element.
      productions: (
          (mango productions production copyLHS: lhs RHS: h0) &
          (mango productions production copyLHS: lhs RHS: h1)
      ) asVector.
      setTBConstructors.
      self.
    ).
| )

(mango productions optProduction _Define: 
 mango productions structuredProduction copy _AddSlots: ( |
  "_" parent*  = traits mango productions optProduction.
 "^_" element <- mango symbols nonterminal.
| ) )


traits mango grammars stGrammar _Define: ( |
  "A structured grammar, stGrammar, has a derived unstructured grammar."
  "_" parent*         = traits clonable.
  "_" utilitiesMixin* = mixins mango utilitiesMixin.
  "_" tracer*         = mixins mango tracer.
  "^" printString     = ( 'stGrammar(', name, ')'. ).

  { 'creating'
      "^" copyName: n Productions: pl 
                  Transformations: transf 
                         Behavior: behav = (
          copyName: n Productions: pl Transformations: transf Behavior: behav 
            IfFail: raiseError.
        ).

      "^" copyName: n Productions: pl Transformations: transf 
                       Behavior: behav IfFail: errBlk = ( 
          copy initName: n Productions: pl Transformations: transf
               Behavior: behav IfFail: errBlk.
        ).

      "_" initName: n Productions: pl Transformations: transf Behavior: behav
          IfFail: errBlk = (
          | ugProdList <- list. prodList <- list. |
          name: n.
          prodList: pl asList copy.
          endMarker: (endMarker copyKind: endMarker kind).
          level: 2 Print: 'Initializing structured grammar ', name, '...\n'.
          addInternalStartProduction: prodList.
          initAndCheck: prodList IfFail: [|:e| ^ errBlk value: e].
          makeTreeNodesBehavior: behav IfFail: [|:e| ^ errBlk value: e].
          level: 3 Print: 'Building unstructured grammar...\n'.
          ugProdList: ugProdList copy. "Now build derived (unstruct) grammar."
          unstructuredProductionsDo: [|:p| ugProdList addLast: p].
          grammar: (grammar copyName: name, '-unstruct' 
                         Productions: ugProdList
                     Transformations: transf
                           EndMarker: endMarker 
                              IfFail: [|:e| ^ errBlk value: e]).
          grammar stGrammar: self.
          level: 3 Print: 'Done building unstructured grammar.\n'.
          self.
        ).

      "_" addInternalStartProduction: prodList = (
          "Add an extra production to the front of the list of productions.
           By doing this, the user of stGrammars isn't forced to let the 
           first production be a trivial construction such as 
                 <start0> ::= <start>.
           We use an 'altProduction' here so that we don't get a trivial
           node at the top of the parse tree."
          | lhs <- mango symbols nonterminal. alt <- vector. |
          lhs: (lhs copyKind: 'start_internal00001').
          alt: (alt copySize: 1).
          alt at: 0 Put: prodList first lhs.
          prodList addFirst: (mango productions altProduction copyLHS: lhs 
                                                           Alternatives: alt).
          self.
        ).

      "_" partitionProds: prodList IfFail: errBlk = (
          "Also checks that each nonterminal has exactly one production."
          nonterminalsDo: [|:s| s structuredProd: nil].
          prodList do: [|:p|
              nil != p lhs structuredProd ifTrue: [
                  ^ errBlk value: 'more than one production for ', 
                                  p lhs printString.
              ].
              p lhs structuredProd: p.
          ].
          prodList size != noOfNonterminals ifTrue: [| msg <- ''. |
              msg: 'the following nonterminals have no production: '.
              nonterminalsDo: [|:s| 
                  nil = s structuredProd ifTrue: [
                      msg: msg, '\'', s printString, '\', '.
                  ].
              ].
              ^ errBlk value: (msg copySize: msg size - 2). "Remove last ', '."
          ].
          self.
        ).

      "_" reachableFrom: sym Into: res = (
          (res includes: sym) ifFalse: [
              res add: sym.
              sym isNonterminal ifTrue: [
                  sym structuredProd psymbolsDo: [|:s| 
                      reachableFrom: s Into: res.
                  ].
              ].
          ].
          self.
        ).
 
      "_" checkRestrictionsIfFail: errBlk = (
          "Check specific restrictions on structured grammars: 
              * Exactly one production per nonterminal 
                (checked in 'partitionProds:IfFail:')."
          self.
        ).
  }

  { 'accessing'
      "_" accessorsMixin* = mixins mango accessorsMixin.

        "NB: because of the internally added extra start production,
         the start symbol may not be what you expect! I.e. it is the
         lhs of the internally added start production."
      "^" startProduction = ( startSymbol structuredProd. ).
      "^" noOfProductions = ( noOfNonterminals. ).

      "^" productionsDo: blk = (
          nonterminalsDo: [|:s| blk value: s structuredProd].
        ).

      "^" lstProductionsDo: blk = (
          productionsDo: [|:p| p isLstProduction ifTrue: [blk value: p]].
        ).

      "^" altProductionsDo: blk = (
          productionsDo: [|:p| p isAltProduction ifTrue: [blk value: p]].
        ).

      "^" conProductionsDo: blk = (
          productionsDo: [|:p| p isConProduction ifTrue: [blk value: p]].
        ).

      "^" optProductionsDo: blk = (
          productionsDo: [|:p| p isOptProduction ifTrue: [blk value: p]].
        ).

      "_" unstructuredProductionsDo: blk = (
          productionsDo: [|:sp| sp pproductionsDo: [|:p| blk value: p]].
        ).
  }

  { 'treeNodes'
      "^" parentName = 'parent'. "Towards the top of the hierarchy we have only
                                single inheritance. Here we use this name as
                                the sole name for parents. It is 
                                important that this name is the same name as
                                is used in the prototypes since in some
                                places an existing parent in a prototype must
                                be adjusted."

      "_" asSlotName: kind = ( mango symbols symbol asSlotName: kind ).

      "_" getSlotNamed: name In: obj = (
          ((reflect: obj) lookupKey: name) isEmpty ifTrue: [^ ()].
          "((reflect: obj) names includes: name) ifFalse: [^ ()].%%%"
          name sendTo: obj.
        ).

      "_" tBFor: kind In: behav = ( 
	  getSlotNamed: (asSlotName: kind) In: behav. 
	).

      "_" pBFor: kind In: behav = ( 
	  getSlotNamed: (asSlotName: kind), '_proto' In: behav.
	).

      "_" makeTreeNodesBehavior: behav IfFail: errBlk = (
          | parentsOf <- dictionary. done <- set. 
            count <- mango counter. mi <- false. |
          "Create the hierarchy of tree node objects in a top-down manner."
          level: 2 Print: 'Building tree nodes... '.

	  stGramNode: stGramNode copyKind: 'gramNode_internal00001'.
	  stGramNode traitsSkeleton: traits mango tokens gramNode copy.
	  stGramNode  protoSkeleton:        mango tokens gramNode copy.

          stGramNode traitsSkeletonFAddSlots:
	      getSlotNamed: 'shared_behavior'       In: behav.

	  stGramNode protoSkeletonFAddSlots: 
	      getSlotNamed: 'shared_behavior_proto' In: behav.

          make:         stGramNode  protoSkeleton 
	    BeChildOf:  stGramNode traitsSkeleton 
	    ParentName: parentName.
          stGramNode traitsSkeleton my_grammar: self.
          count: (count copyVisible: noiseLevel >= 2).

          "Now the nodes corresponding to specific symbols. 
           Need to be done in a top-down manner, i.e. both
           prototype and traits skeleton for a general node must be 
           constructed before the prototype and traits skeleton for a
           specialization. This is because we use copy-down of slots on
           the prototypes (to simulate inheritance of instance variables).
           First allocate all the skeletons without worrying about parent
           relations and copy-down inheritance."

          allocateTreeNodesBehavior: behav.
          addClassifiers.

          "Set up parents and do copy-down for imm. descendants of 
           'stGramNode traitsSkeleton'."
          parentsOf: computeParentRelations.
          done: done copy.
          symbolsDo: [|:s|
              (parentsOf includesKey: s) ifTrue: [
                  "This object will get new parent(s) below."
                  s traitsSkeleton _RemoveSlot: parentName.
              ] False: [
                  done add: s.
		  copyDownFrom: stGramNode
                          Into: s
                    ProtoParentName: parentName
                   TraitsParentName: parentName.
                  count inc.
              ].
          ].

          "Next process the remaining node skeletons, top-down."
          [noOfSymbols != done size] whileTrue: [| oldSize <- 0. |
              oldSize: done size.
              symbolsDo: [|:s|
                  (done includes: s) ifFalse: [
                      | pars <- set. parsDone <- true. |
                      pars: (parentsOf at: s).
                      pars do: [|:p| parsDone: parsDone && [done includes: p]].
                      parsDone ifTrue: [
                          pars do: [|:par. tpname <- ''. |
                              tpname: par kind, '_parent'.
			      s traitsSkeletonFAddSlots:
                                        ('(| ', tpname, '* = () |)') eval.
                              copyDownFrom: par
                                      Into: s
                                ProtoParentName: parentName
                               TraitsParentName: tpname.
                          ].
                          done add: s.
                          mi: mi || [1 < pars size]. "Multiple inheritance?"
                          count inc.
                      ].
                  ].
              ].
              oldSize = done size ifTrue: [
                  cycleDetected: done IfFail: [|:e| ^ errBlk value: e].
              ].
          ].
          
          count hide.
          level: 2 Print: 'done.\n'.
          mi ifTrue: [
              level: 1 Print: 'The following symbols have multiple parents: '.
              parentsOf do: [|:pars. :s|
                  1 < pars size ifTrue: [level: 1 Print: s printString, ' '].
              ].
              level: 1 Print: '\n'.
          ].
          self.
        ).

      "_" allocateTreeNodesBehavior: behav = (
	  | termPSkel. termTSkel. nontermPSkel. nontermTSkel. |

	  "xxx"
          termTSkel: (traits mango tokens nodeSkeleton copy _AddSlots: ( |
	      "^" children_do: blk = ( self.             ).
              "^" source           = ( token source.     ).
              "^" fullSource       = ( token fullSource. ).
	  | )).

	  termPSkel: (mango tokens nodeSkeleton copy _AddSlots: ( | "xxx"
	        "Will be set to actual token found on input of parser."
	      "^" token <- mango symbols terminal. 
	  | )).

	  nontermTSkel: traits mango tokens nodeSkeleton copy.
	  nontermPSkel:        mango tokens nodeSkeleton copy.

          terminalsDo: [|:s| 
	      s traitsSkeleton: termTSkel copy.
	      s protoSkeleton:  termPSkel copy.
              "Set the 'shifting' of terminals to build a tree node."
              s shifting: ( | 
                "_" parent* = traits clonable.
                "^" protoSkeleton = nil.  "Will later be modified."
                "^" pushToken: myToken OnStack: stack = (
                    | node. |
                    node: (protoSkeleton copy token: myToken).
                    node initialize_node: stack. "Today always no-op."
                    stack push: node.
                    self.
                  ).
              | ) copy.
              s setBackpointer.  "Set the 'protoSkeleton' slot of 'shifting'."
	  ].
	  nonterminalsDo: [|:s|
	      s traitsSkeleton: nontermTSkel copy.
	      s protoSkeleton:  nontermPSkel copy.
	  ].
          symbolsDo: [|:s. mir. | 
	      s traitsSkeletonFAddSlots: (tBFor: s kind In: behav).
	      s  protoSkeletonFAddSlots: (pBFor: s kind In: behav).

              "Now set the 'token_id' and 'token_kind' fields.
               We can't just assign, since the slots are constant 
               for efficiency and principal reasons. This is how it 
               would have been done, had the slots been assignable:
                  s traitsSkeleton token_id:   s symbolId.
                  s traitsSkeleton token_kind: s kind.
              "
              mir: (reflect: s traitsSkeleton).
              mir at: 'token_id'   PutContents:  reflect: s symbolId.
              mir at: 'token_kind' PutContents:  reflect: s kind.
          ].
	  nonterminalsDo: [|:s| s structuredProd extendTreeSkeleton].
          self.
        ).

      "_" computeParentRelations = (
          "For each symbol compute the nonterminal (!) that it is a speciali-
           zation of. The result is a dictionary, mapping each nonterminal 
           to its set of parents (we allow multiple inheritance!). Symbols 
           that are not in the resulting dictionary should be given 
           'stGramNode traitsSkeleton' as their parent."
          | parentsOf <- dictionary. |
          parentsOf: parentsOf copy.
          altProductionsDo: [|:p| 
              p alternatives do: [|:s. parents <- set. |
                  parentsOf if: s IsPresentDo: [|:p0| parents: p0]
                                  IfAbsentPut: [parents: set copy. parents]
                                        AndDo: [].
                  parents add: p lhs.
              ].
          ].
          parentsOf.
        ).

      "_" cycleDetected: goodGuys IfFail: errBlk = (
          | msg <- ''. |
          msg: 'cyclic parent relations not allowed '.
          msg: msg, '(nonterminals involved in cycles:'.
          nonterminalsDo: [|:s|
              (goodGuys includes: s) ifFalse: [
                  msg: msg, ' ', s printString.
              ].
          ].
          msg: msg, ')'.
          errBlk value: msg.
        ).
         
      "_" addClassifiers = (
          "Add all the 'is_fisk = false' slots to 'stGramNode traitsSkeleton'.
           Also add the 'is_fisk = true' slots to the node skeletons."
          symbolsDo: [|:s. sName <- ''. |
              sName: 'is_', s kindAsSlotName.
              addTo: stGramNode traitsSkeleton   Slot: sName Contents: false.
              addTo: s        traitsSkeleton   Slot: sName Contents: true.
          ].
          self.
        ).

      "_" copyDownFrom: parentSym 
                Into:  childSym
               ProtoParentName: ppname 
              TraitsParentName: tpname = (

          "Make the  childSym be a subtype of the parentSym by copying
	   all the slots of the parentSym's proto- and traits- skeletons
           into the  childSym's proto- and traits- skeletons
           (unless there is already a slot with the given name); 
           then set up the parent slots, 
	   so that the childSym proto- and traits-
	   skeletons are each children of the parentSym proto- and traits-
	   skeletons." 

	  "  I have hacked up this routine to use the functional
	     variation of _AddSlotsIfAbsent: for speed's sake.
             If it gives you trouble, just set useHack to false.
	     --dmu 11/27/92
          "
          | useHack = true |

          useHack ifFalse: [
	      childSym protoSkeleton 
	         _AddSlotsIfAbsent:  parentSym protoSkeleton.  "xxx"
          ] True: [
              childSym isNonterminal ifTrue: [
	          childSym protoSkeleton:
	          childSym protoSkeleton _Clone 
		       _AddSlotsIfAbsent:  parentSym protoSkeleton. "xxx"
              ] False: [
                  childSym protoSkeleton  ==  childSym shifting protoSkeleton  
	           ifFalse: [
		     error: 
		        'better set useHack to false; this should not happen'
                  ].
	          childSym protoSkeleton:
	          childSym protoSkeleton _Clone 
		     _AddSlotsIfAbsent:  parentSym protoSkeleton. "xxx"
                  childSym setBackpointer.
              ].
          ].

          "next statement may be redundant, according to Ole 11/14/92"

          make:          childSym  protoSkeleton 
	    BeChildOf:   childSym traitsSkeleton 
	    ParentName: ppname. 

          make:          childSym traitsSkeleton 
            BeChildOf:  parentSym traitsSkeleton 
            ParentName: tpname.

          self.
        ).


      "_" make: obj BeChildOf: c ParentName: pname = ( 
          "Check that the 'obj' has a parent slot with name 'parentName'.
           If it has, set its contents to be 'c'; if it doesn't, give 
           error message (inconsistency detected)."
          | mir <- mirrors slots. pslot <- slots parent. |
          mir: (reflect: obj).
          pslot: (mir slotAt: pname IfAbsent: [
              error: 'slot renamed - expected it to be ', pname.
          ]).
          pslot isParent ifFalse: [
              error: 'slot should be parent: ', pslot printString.
          ].
          mir at: pname PutContents: reflect: c.
          self.
        ).

      "_" addTo: obj Slot: name Contents: c = (
          (reflect: obj) at: name PutContents: reflect: c.
	  (((reflect: obj) at: name) visibility: publicSlot) isParent: false.
          self.
        ).
  }

  "^" dumpSkeletons = (
      "For debugging."
      productionsDo: [|:p|
          p printLine.
          inspect: p traitsSkeleton.
          inspect: p  protoSkeleton.
          '' printLine.
      ].
    ).

  "^" dumpReduceActionsOptim: includeAsserts = (
      | savedIA <- false. |
      savedIA: mango treeBuilders tbStep includeAsserts.
      mango treeBuilders tbStep includeAsserts: includeAsserts.
      grammar productionsDo: [|:p|
          p printLine.
          p tbConstructor allSlotsString printLine.
          '' printLine.
      ].
      mango treeBuilders tbStep includeAsserts: savedIA.
      self.
   ).

  "^" dumpReduceActionsNoOptim: includeAsserts = (
      "For debugging.
       NB: This method dumps the unstructured production that are directly
       derived from the structured grammar together with their reduce actions.
       There is a similar method on unstructured grammars that dumps
       the same stuff as it is *after* it has been optimized."
      | savedIA <- false. |
      savedIA: mango treeBuilders tbStep includeAsserts.
      mango treeBuilders tbStep includeAsserts: includeAsserts.
      unstructuredProductionsDo: [|:p|
          p printLine.
          p tbConstructor allSlotsString printLine.
          '' printLine.
      ].
      mango treeBuilders tbStep includeAsserts: savedIA.
      self.
   ).
| )

mango grammars stGrammar _Define: ( |
      {} = 'IsComplete: '.
  "_" parent*       = traits mango grammars stGrammar.
  "_" terminals    <- vector.
  "_" nonterminals <- vector.
 "^_" name         <- 'some_stGrammar'.
 "^_" grammar      <- mango grammars grammar.   "Derived unstructured grammar."
                                          "endMarker is shared with 'grammar'."
 "^_" endMarker    <- mango symbols terminal 
                      copyKind: mango grammars grammar endMarker kind.

    "The top of the hierarchy of parse tree nodes for this stGrammar are
     the traitsSkeleton and protoSkeleton of this symbol:"
 "^_" stGramNode      <- mango symbols nonterminal.
| )
