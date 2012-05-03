"Sun-$Revision: 30.6 $"

"Copyright 1992-2012 AUTHORS.
 See the LICENSE file for license information."

"                                                Ole Agesen, April 1993."

traits mango productions prodSet _Define: ( |
  "This object represents a set of unstructured productions. The main role 
   of this object is to support manipulating productions *before* a grammar 
   object is created (actually during creating of the grammar object). 
   (Why not immediately create the grammar object? Because the 
   transformations will then be dragging along too much baggage).
   The object supports a set-like view of the productions (hence the name),
   but also allows for specific transformations to be applied to the 
   productions.An example of a transformation is to inline away all 
   nonterminals that have an epsilon production, often significantly 
   reducing the number of conflicts in the parse table. In general, the
   intention with the transformations is to make the productions more
   suitable for parsing.
   The underlying data structure is an array of lists: each list holds the
   productions for a given nonterminal. The array is indexed by nonterminal
   comparisonId's. This data structure allows fast access to all the 
   productions of a given nonterminal, something that is important for many
   transformations."

  "_" parent*             = traits clonable.
  "_" tracer*             = mixins mango tracer.
  "^" copy                = ( resend.copy init. ).
  "^" printString         = ( 'prodSet(size=', size printString, ')'. ).
  "^" do: blk             = ( nt2prods do: [|:ntprods| ntprods do: blk]. self. ).
  "^" startSymbol         = ( startProduction lhs. ).
  "^" startProduction     = ( startProd. "Defaults to first production added." ).
  "^" startProduction: sp = ( add: sp. startProd: sp. self.  ).
  "^" addAll: prods       = ( prods do: [|:p| add: p]. self. ).
  "^" prodsFor: nt        = ( nt2prods at: nt comparisonId - minNTComparisonId ).
  "^" includes: prod      = ( (prodsFor: prod lhs) includes: prod. ).

  "^" kind2nonterminal: k IfAbsent: aBlk = (
      nonterminals do: [|:s| s kind = k ifTrue: [^ s]].
      aBlk value.
    ).

  "^" asProdList = (
      "Return a list of all the productions. The first production in the list
       is the start production."
      | res <- list. |
      res: res copy.
      do: [|:p| res add: p].
      res remove: startProduction.
      res addFirst: startProduction.
      res.
    ).

  "^" add: prod = (
      prod psymbolsDo: [|:s|
          s isNonterminal ifTrue: [
              nonterminals add: s.
              s comparisonId < minNTComparisonId ifTrue: [
                  0 = nt2prods size ifTrue: [ "Special case first time."
                      nt2prods: (nt2prods copySize: 1 FillingWith: list copy).
                      minNTComparisonId: s comparisonId.
                  ] False: [| delta <- 1. |
                      delta: minNTComparisonId - s comparisonId.
                      minNTComparisonId: minNTComparisonId - delta.
                      nt2prods: (vector copySize: delta), nt2prods.
                      delta do: [|:i| nt2prods at: i Put: list copy].
                      (3 * (1 + size)) < nonterminals size ifTrue: [
                          warning: 'found sparse comparisonIds -- inefficient'.
                      ].
                  ].
              ].
          ].
      ].
      (includes: prod) ifFalse: [
          (prodsFor: prod lhs) add: prod.
          0 = size ifTrue: [startProduction: prod].  "Use as start prod."
          size: 1 + size.
      ].
      self.
    ).

    "^" reachableNonterms = (
        "Return set of reachable nonterminals."
        | res <- set. todo <- list. |
        res:  (res  copy add: startSymbol).
        todo: (todo copy add: startSymbol).
        [todo isEmpty] whileFalse: [| nt <- mango symbols nonterminal. |
            nt: todo removeFirst.
            (prodsFor: nt) do: [|:p|
                p rhs do: [|:s|
                    s isNonterminal && [(res includes: s) not] ifFalse: [
                        res  add: s. 
                        todo add: s.
                    ].
                ].
            ].
        ].
        res.   
      ).

  "_" replaceProdsFor: nt With: prodList = (
      | ntProds <- list. plist <- list. |
      mango assert: [prodList do: [|:p| assert: [p lhs = nt]]].
      mango assert: [nt != startSymbol  "Don't do this for startSymbol."].
      mango assert: [
          prodList size = prodList asSet size. "Verify no duplicates."
      ].
      ntProds: (prodsFor: nt).
      plist: prodList.
      ntProds == plist ifTrue: [
          plist: plist copy. "Needed for 'removeAll' below."
      ].
      size: (size - ntProds size) + plist size.
      ntProds removeAll.
      ntProds addAll: plist.   "Faster than calling 'add:' on every prod."
      self.
    ).

  "^" removeAll = ( 
      nonterminals removeAll.
      nt2prods:    vector copy. 
      size:        0. 
      minNTComparisonId: maxSmallInt / 2.
    ).

  "_" init = (
      nonterminals: nonterminals copy.
      nt2prods:     nt2prods     copy.
      self.
    ).

  "^" initPrototype = (
      "Should only be called once for the prototype."
      init.
      removeAll.
    ).

  { 'terminalClassification'

    "NB: Uses the 'scratch' field of terminals."

    "_" scratchObj = ( |
        "_" parent* = traits clonable.
        "^" class <- set.
        "^" prods <- set.
      | ).
  
    "_" findClasses = (
        | terminals <- set. classes <- dictionary. terminalsV <- vector. 
          noOfTerminals <- 0. |
        "First find all terminals and initialize them to have 
         a class of their own."
        terminals: terminals copy.  
        do: [|:p| 
            p rhs do: [|:s| 
                s isTerminal ifTrue: [|scratch|
                    scratch: scratchObj copy.
                    scratch class: (set copy add: s).
                    scratch prods: set copy.
                    s scratch: scratch.
                    terminals add: s.
                ]
             ].
        ].
        "Now register for each terminal which productions mention it."
        do: [|:p| 
            p rhs do: [|:s| s isTerminal ifTrue: [s scratch prods add: p]].
        ].
  
        "Iterate over vector to avoid duplicating tests (e.g. testing
         if A and B are in the same class and later testing if B and A
         are in the same class."
        terminalsV: terminals asVector.  
        noOfTerminals: terminalsV size.
        terminalsV do: [|:s1. :idx1|
            1 + idx1 upTo: noOfTerminals Do: [|:idx2. s2. s1Class <- set. | 
                s2: (terminalsV at: idx2).
                s1Class: s1 scratch class.
                (s1Class includes: s2) ifFalse: [
                    (sameClass: s1 And: s2) ifTrue: [
                        s1Class addAll: s2 scratch class.
                        s2 scratch class: s1Class.
                    ].
                ].
            ].
        ].
        classes: classes copy.
        terminals do: [|:s| classes at: s Put: s scratch class].
        mango assertSwitch ifTrue: [terminals do: [|:s| s scratch: nil]].
        level: 3 Print: '  Found ', classes asSet size printString, 
                        ' classes.\n'.
        classes.
      ).
  
    "_" sameClass: s1 And: s2 = (
        | s1Prods. s2Prods. |
        s1Prods: s1 scratch prods.
        s2Prods: s2 scratch prods.
        s1Prods size != s2Prods size ifTrue: [^ false]. "Very effective optim!"
        s1Prods do: [|:p|
            (s2Prods includes: (p copyReplacing: s1 With: s2)) ifFalse: [
                ^ false.
            ].
        ].
        true.
      ).
  
    "_" commitToClasses: classes = (
        | newProds <- set. |
        nonterminals do: [|:nt|
            newProds: set copy.
            (prodsFor: nt) do: [|:p. p1|
                p1: p copy.
                p1 rhs mapBy: [|:s| 
                    s isTerminal ifTrue: [(classes at: s) first] False: [s].
                ].
                newProds add: p1.
            ].
            replaceProdsFor: nt With: newProds asList.
        ].
        self.
      ).
  }

  { 'transformations'

    "_" inlineProds: prods InProd: p Changed: signal = (
        "This method is functional: the result is a list of new productions
         and neither 'prods' nor 'p' are sideeffected. The result may
         contain duplicates.
         Inline the productions 'prods' into 'p'. It is assumed that all
         productions in 'prods' have the same lhs, say B. I.e. for each 
         occurrence of B we substitute the rhs of each production in prods. 
         If there are n occurrences of 'p lhs', the result is a list with 
         (prods size)**n productions. E.g.:
             prods =  B -> b | c,  p  =  A -> BB,   then the result is   
             A -> bb | bc | cb | cc   
         If something is acutally inlined (changed), the 'signal' block is 
         evaluated for side effects in the caller. Note that it may be 
         evaluated several times."
        | trace = false. res <- list. v1. theLhs. |
        mango assertSwitch ifTrue: [
            prods do: [|:p|
                p lhs != prods first lhs ifTrue: [
                    error: 'different lhs\'s can\'t be inlined simultaneously'.
                ].
            ].
        ].
        res: res copy.
        theLhs: prods first lhs.
        (p rhs includes: theLhs) ifFalse: [^ res add: p].
        trace ifTrue: [
            '-----------------' printLine.
            p printLine.
            '------' printLine.
            prods do: [|:p| p printLine].
            '------' printLine.
        ].
        v1: (vector copySize: 1 FillingWith: theLhs).
        res: res copy.
        res add: p.
        p rhs reverseDo: [|:x. :index|
            "Do in reverse order so that unprocessed indices do not change
             due to the inlining."
            x = theLhs ifTrue: [| res2 <- list. |
                res2: res2 copy.
                res do: [|:client| 
                    prods do: [|:target| 
                        res2 add: (client copy at: index Inline: target).
                    ].
                ].
                res: res2.
                signal value.  "Signal that something has changed."
            ].
        ].
        trace ifTrue: [
            res do: [|:p| p printLine].
            '-----------------' printLine.
        ].
        res.
      ).

    "_" inlineProds: prodList1 InProds: prodList2 Changed: signal = (
        "Functional method. NB: resulting list of productions may 
         contain duplicates."
        | res <- list. |
        res: res copy.
        prodList2 do: [|:p| 
            res addAll: (inlineProds: prodList1 InProd: p Changed: signal).
        ].
        res.
      ).

    "^" printOverview = (
        level: 2 Print: '  The result is ', size printString, 
                        ' productions.\n'.
      ).

    "_" elimUnused: elims = (
        "Go through all the nonterminals in 'elims' to see if they are still
         used somewhere on a rhs. If not eliminate their productions from 
         'prodList'."
        | plist <- list. e1 <- set. e2 <- set. reachable <- set. |
        reachable: reachableNonterms.
        elims do: [|:nt|
            (reachable includes: nt) ifFalse: [
                replaceProdsFor: nt With: list copy.
                nonterminals remove: nt.
            ].
        ].
        self.
      ).
                
    "_" hasSymbol: s OnRHSIn: prodList = (
        "Return true iff one of the productions in 'prodList' has the 
         symbol 's' on it's rhs."
        prodList do: [|:p| (p rhs includes: s) ifTrue: [^ true]].
        false. 
      ).

    "_" inlineNonterm: nontermA Changed: signal IfRecursive: rBlk = (
        | aProds <- list. anyChanges <- false. keepAProds <- false. |
        aProds: (prodsFor: nontermA).
        (hasSymbol: nontermA OnRHSIn: aProds) ifTrue: [
            ^ rBlk value.   "The nonterminal is directly recursive!"
        ].
        nonterminals do: [|:nt|
            nontermA != nt ifTrue: [
                | ntProds <- list. newNtProds <- list. changed <- false. |
                ntProds: (prodsFor: nt).
                newNtProds: (inlineProds: aProds 
                                 InProds: ntProds 
                                 Changed: [changed: true]).
                changed ifTrue: [
                    replaceProdsFor: nt With: newNtProds asSet asList.
                    anyChanges: true.
                ].
                keepAProds: keepAProds || 
                            [(hasSymbol: nontermA OnRHSIn: (prodsFor: nt))].
                
            ].
        ].
        keepAProds ifTrue: [
            level: 3 Print: ' \t(not inlined everywhere)'.
        ] False: [
            anyChanges: true.
            replaceProdsFor: nontermA With: list copy.
            nonterminals remove: nontermA.
        ].
        anyChanges ifTrue: signal.
        self.
      ).

    "_" elimProdsForNonterm: nonterm Changed: signal = (
        level: 3 Print: '  ', nonterm printString.
        nonterm dontInline ifTrue: [
            level: 3 Print: ' \tinlining prevented'.
        ] False: [
            inlineNonterm: nonterm 
                  Changed: signal
              IfRecursive: [
                  level: 3 Print: ' \tis directly recursive (not inlined)'.
                  prodList.   "Return 'prodList', i.e. no change."
              ].
        ].
        level: 3 Print: '\n'.
        self.
      ).

    "_" elimProdsForNonterms: nonterms Changed: signal = (
        nonterms isEmpty ifTrue: [
            level: 3 Print: '    No applicable nonterminals.\n'.
            ^ prodList.
        ].
        nonterms do: [|:nt| elimProdsForNonterm: nt Changed: signal].
        printOverview.
        self.
      ).

    "_" elimOneEpsilonProdFor: nontermA Changed: signal = (
        "There are two cases depending on whether 'nontermA' is directly 
	 recursive or not. If it is, we eliminate the epsilon
	 production only, else we are more brutal and eliminate all
	 productions for 'nontermA'.  If this method actually succeds in
	 inlining anything, it will evaluate 'signal' for side effects."
        | aProds <- list. |
        aProds: (prodsFor: nontermA).
        (hasSymbol: nontermA OnRHSIn: aProds) not ifTrue: [
            elimProdsForNonterm: nontermA Changed: signal.
        ] False: [
            "The directly recursive case. Let A = 'nontermA'.
             We inline A -> <epsilon> in a copy of all other productions, 
             including the other A-productions. The non-epsilon productions
             for A are retained and so are the productions in which A occurs."
            | nonEpsAProds <- list. epsAProd <- list. |
            level: 3 Print: '  ', nontermA printString, '\n'.
            epsAProd: epsAProd copy.
            nonEpsAProds: nonEpsAProds copy.
            aProds do: [|:p|
                p isEpsilonProduction ifTrue: [epsAProd add: p] 
                                       False: [nonEpsAProds add: p].
            ].
            mango assert: [epsAProd size = 1. "Check only 1 eps prod."].
            nonterminals do: [
                |:nt. ntProds <- list. newNtProds <- set. changed <- false. |
                nontermA = nt ifTrue: [ntProds: nonEpsAProds. changed: true]
                               False: [ntProds: (prodsFor: nt)].
                newNtProds: (inlineProds: epsAProd
                                 InProds: ntProds
                                 Changed: [changed: true]).
                changed ifTrue: [
                    newNtProds: newNtProds asSet.
                    newNtProds addAll: ntProds.
                    replaceProdsFor: nt With: newNtProds asList.
                    signal value.
                ].
            ].
        ].
        self.
      ).

    "_" elimEpsilons2 = (
        "This is the core of eliminating epsilon productions. It may need
         to be iterated since new epsilon productions may show up when others
         are eliminated (a rhs in which a symbol is replaced by epsilon gets
         shorter and may end up being epsilon)."
        | ntEps <- set. redo <- false. |
        ntEps: ntEps copyRemoveAll.  "Collect nonterm's with eps. prod. here."
        do: [|:p| 
            p isEpsilonProduction && [p lhs dontInline not] ifTrue: [
                ntEps add: p lhs.
            ].
        ].
        ntEps do: [|:nt| elimOneEpsilonProdFor: nt Changed: [redo: true]].
        redo ifTrue: [elimEpsilons2].
        self.
      ).

    "^" elimEpsilons = (
        elimEpsilons2.
        printOverview.
      ).

    "^" elimSingletons = (
        "Eliminate all nonterminals that have only a single production."
        | singles <- set. |
        singles: singles copy.
        nonterminals do: [|:nt|
            1 = (prodsFor: nt) size ifTrue: [singles add: nt].
        ].
        elimProdsForNonterms: singles Changed: nil.
      ).

    "^" flatten: nt = (
        "Completely expand the productions of the nonterminal nt.
         This is only possible if it contains no cycles."
        | "nt <- mango symbols nonterminal."
          ntProds <- list. elims <- set. allElims <- set. giveUp <- ''. |
        giveUp: 'Warning: cycle detected; ', nt printString, ' not flattened.'.
        ntProds: (prodsFor: nt).
        allElims: allElims copyRemoveAll.
        [ elims: elims copyRemoveAll.
          ntProds do: [|:p| 
              p rhs do: [|:x| x isNonterminal ifTrue: [elims add: x]].
          ].
          (elims includes: nt) ifTrue: [
              giveUp printLine.
              ^ self.
          ].
          allElims addAll: elims.
          elims isEmpty not. 
        ] whileTrue: [
            elims do: [|:elimNt. elimNtProds <- list. change <- false. |
                "We can't call 'inlineNonterm:Changed:IfRecursive:'
                 since it inlines everywhere. Here we only inline in the
                 productions being flattened."
                elimNtProds: (prodsFor: elimNt).
                (hasSymbol: elimNt OnRHSIn: elimNtProds) ifTrue: [
                    giveUp printLine. 
                    ^ self.
                ].
                ntProds: (inlineProds: elimNtProds 
                              InProds: ntProds
                              Changed: [change: true]).
                change ifTrue: [
                    ntProds: ntProds asSet asList.  "Get rid of duplicates."
                ].
            ].
        ].
        replaceProdsFor: nt With: ntProds.   "Here we commit to the changes."
        level: 3 Print: '  result: ', ntProds size printString, 
                        ' flat productions.\n'.
        "Finally remove any nonterminals that are no longer used."
        elimUnused: allElims.
      ).

    "^" forceInline: nt = (
        | "nt <- mango symbols nonterminal." |
        inlineNonterm: nt Changed: nil IfRecursive: [
            '  ' print. 
            nt print. 
            ' is recursive - not inlined' printLine.
        ].
      ).

    "^" useCharClasses: tcBlk = (
        | classes <- dictionary. |
        classes: findClasses.
        commitToClasses: classes.
        tcBlk value: classes.
        printOverview.
        self.
      ).

    "_" indexOf: ch In: str = (
        str do: [|:ch1. :idx| ch = ch1 ifTrue: [^ idx]].
        error: 'no \'', ch, '\' in \'', str, '\''.
      ).

    "_" getNonterminal: trans IfPresent: blk = (
        | ntName <- ''. |
        ntName: (trans copyFrom: 1 + (indexOf: ':' In: trans)) shrinkwrapped.
        blk value: (kind2nonterminal: ntName IfAbsent: [
            trans print. '  failed. No such nonterminal.' printLine.
            ^ self.
        ]).
      ).

    "^" applyTransformations: transf TerminalClasses: tcBlk = (
        "'transf' is a list of transformation names that are applied.
         The transformation that introduces terminal classes need to
         return information back to the calling grammar object. This
         is accomplished through the tcBlk."
        | startprod <- mango productions production. |
        "Make sure we don't change the form of the start production when we
         do all the inlining. We can't allow this since it must have a very 
         restricted form.
         Note: this potentially weakens the optim. It could be fixed by
         introducing an extra singleton prod. after the start production.
         Another partial fix would be to allow inlining of 
            startprod rhs first 
         everywhere except in the start production, but this requires a
         per-instance marking of where inlining is disallowed."
        startProduction lhs dontInline: true. "Set 'dontInline' to protect."
        startProduction rhs first dontInline: true.
        transf do: [|:trans|
            level: 2 Print: 'Applying transformation \'', trans, '\'\n'.
            'elimEpsilons' = trans ifTrue: [
                elimEpsilons.
            ] False: [
            'useCharClasses' = trans ifTrue: [
                useCharClasses: tcBlk.
            ] False: [
            'elimSingletons' = trans ifTrue: [
                elimSingletons.
            ] False: [
            ('dontInline:' isPrefixOf: trans) ifTrue: [
                getNonterminal: trans IfPresent: [|:nt| nt dontInline: true].
            ] False: [
            ('flatten:' isPrefixOf: trans) ifTrue: [
                getNonterminal: trans IfPresent: [|:nt| flatten: nt].
            ] False: [
            ('inline:' isPrefixOf: trans) ifTrue: [
                getNonterminal: trans IfPresent: [|:nt| forceInline: nt].
            ] False: [
                'Warning: unknown transformation ignored: \'' print. 
                trans print.
                '\'' printLine.
            ]]]]]].
        ].
        self.
      ).
  }
| )

mango productions prodSet _Define: ( |
      {} = 'IsComplete: '.
  "_" parent*            = traits mango productions prodSet.
 "^_" size              <- 0.
 "^_" nonterminals      <- set.
  "_" minNTComparisonId <- maxSmallInt / 2.
  "_" nt2prods          <- vector.
  "_" startProd         <- mango productions production.
| )

mango productions prodSet initPrototype   "Initialize the prototype."
