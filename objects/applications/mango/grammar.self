"Sun-$Revision: 30.6 $"
 
"Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
 See the LICENSE file for license information."


"Unless otherwise noted, references on the form 'p. 233' are to pages in 
      Aho, Sethi, Ulmann: 'Compilers  Principles, Techniques and Tools'
      (the 'Dragon book').

                                                 Ole Agesen, September 1992."


mixins mango accessorsMixin _Define: ( |
  "Accessors shared between grammar and stGrammar.
   Some of the accessor methods come in two varieties: those with a prefix 
   of 'em_' and those without. The former variety includes the 'endMarker' 
   in the set of terminals. It is mainly intended for internal use.
   Example:   em_noOfTerminals = noOfTerminals + 1"

  "^" startSymbol         = ( nonterminals at: 0 ).

  "^" em_noOfTerminals    = ( terminals size. ).
  "^" em_noOfSymbols      = ( em_noOfTerminals + noOfNonterminals. ).
  "^" em_terminalsDo: blk = ( terminals do: blk. self. ).
  "^" em_symbolsDo: blk   = ( em_terminalsDo: blk. nonterminalsDo: blk. ).

  "^" noOfSymbols         = ( em_noOfSymbols   - 1. ).
  "^" noOfTerminals       = ( em_noOfTerminals - 1. ).
  "^" noOfNonterminals    = ( nonterminals size. ).
  "^" nonterminalsDo: blk = ( nonterminals do: blk. self. ).
  "^" symbolsDo: blk      = ( terminalsDo: blk. nonterminalsDo: blk. ).

  "^" terminalsDo: blk    = ( 
      em_terminalsDo: [|:s| s != endMarker ifTrue: [blk value: s]].
    ).

  "^" symbolsMapBy: blk      = ( 
	   terminalsMapBy: blk. 
	nonterminalsMapBy: blk. ).

  "^" nonterminalsMapBy: blk = ( 
	nonterminals size do: [|:i| 
	    nonterminals at: i Put: blk value: (nonterminals at: i) With: i.
	].
	self).

  "^" em_nonterminalsMapBy: blk = ( 
	terminals size do: [|:i| 
	    terminals at: i Put: blk value: (terminals at: i) With: i.
	].
	self).


  "^" terminalsMapBy: blk    = ( 
      em_terminalsMapBy: [|:s| 
	s != endMarker ifTrue: [blk value: s] False: [s]
      ]).

  "^" kind2terminal: kind = ( 
      kind2terminal: kind IfAbsent: raiseError.
    ).

  "^" kind2terminal: kind IfAbsent: blk = ( 
      em_terminalsDo: [|:s| kind = s kind ifTrue: [^ s]].
      blk value: 'no terminal of kind \'', kind, '\''.
    ).

  "^" kind2nonterminal: kind = ( 
      kind2nonterminal: kind IfAbsent: raiseError.
    ).

  "^" kind2nonterminal: kind IfAbsent: blk = ( 
      nonterminalsDo: [|:s| kind = s kind ifTrue: [^ s]].
      blk value: 'no nonterminal of kind \'', kind, '\''.
    ).

  "^" symbolId2symbol: id = ( 
      "For efficiency (this method is used during parsing), 
       try it as a terminal - if fails, try as nonterminal."
      terminals at: id IfAbsent: [nonterminals at: id - em_noOfTerminals].
    ).

  "^" literalTerminalKinds = (
      | litKinds <- set. |
      litKinds: litKinds copy.
      terminalsDo: [|:s| s isLiteral ifTrue: [litKinds add: s kind]].
      litKinds.
    ).
| )


mixins mango utilitiesMixin _Define: ( |
  "Various utitility routines found here."
  "_" initAndCheck: prodList IfFail: errBlk = (
      removeUnreachable: prodList IfFail: [|:e| ^ errBlk value: e].
      warnNonterminating.
      checkRestrictionsIfFail: [|:e| ^ errBlk value: e].
      self.
    ).

  "_" removeUnreachable: prodList IfFail: errBlk = (
      "Remove symbols and productions not reachable from start symbol."
      | reachable <- set. n <- 0. unreachable <- set. |
      partition: prodList IfFail: [|:e| ^ errBlk value: e].
      reachable:   reachable   copy.
      unreachable: unreachable copy.
      reachableFrom: startSymbol Into: reachable.
      reachable add: endMarker.
      n: em_noOfSymbols - reachable size.
      0 < n ifTrue: [| prodRemoved <- false. |
          'Warning: found ' print.
          n print.
          ' unreachable symbol' print. 
          1 != n ifTrue: ['s' print].
          ': ' print.
          em_symbolsDo: [|:s|
              (reachable includes: s) ifFalse: [
                  s print. '  ' print.
                  unreachable add: s.
              ].
          ].
          '' printLine.
          1 = n ifTrue: [
              '  Removing it and its productions: ' printLine.
          ] False: [
              '  Removing them and their productions: ' printLine.
          ].
          prodList do: [|:p|
              (unreachable includes: p lhs) ifTrue: [
                  '    ' print. p printLine. 
                  prodList remove: p.
                  prodRemoved: true.
              ].
          ].
          prodRemoved ifFalse: ['(no productions found/removed).' print].
          "Redo partitioning now that things have been removed."
          partition: prodList IfFail: [|:e| ^ errBlk value: e].
      ].
      self.
    ).

  "_" terminating = (
      "Compute set of symbols that can terminate."
      | res <- set. oldSize <- -1. |
      res: res copy.
      res addAll: terminals.   "terminals can always terminate."
      [oldSize != res size] whileTrue: [
          oldSize: res size.
          productionsDo: [|:p. b <- true. |
              (res includes: p lhs) ifFalse: [
                  (p canTerminateWith: res) ifTrue: [res add: p lhs].
              ].
          ].
      ].
      res.
    ).

  "_" warnNonterminating = (
      "Warn about any nonterminals that can not terminate."
      | t <- set. oldSize <- -1. |
      t: terminating.
      t size != em_noOfSymbols ifTrue: [
          'Warning: the following nonterminals can not terminate:' printLine.
          '  ' print.
          nonterminalsDo: [|:s|
              (t includes: s) ifFalse: [s print. '  ' print.].
          ].
          '' printLine.
      ].
      self.
    ).

  "_" partition: prodList IfFail: errBlk = (
      "Partition symbols into nonterminals and terminals and distribute
       productions according to their lhs. Also assign id's to productions
       and symbols."
      | terms <- dictionary. nonterms <- dictionary. 
        pid <- 0. sid <- 0. startsym <- mango symbols nonterminal. |
      terms: terms copy.
      nonterms: nonterms copy.
      prodList do: [|:p| 
          p prodId: pid. 
          pid: 1 + pid.
          p psymbolsDo: [|:s| 
              (s isTerminal ifTrue: [terms] False: [nonterms]) 
              at: s kind Put: s.
          ].
      ].
      terms at: endMarker kind Put: endMarker.
      terminals: terms asVector.
     
      "Make sure start symbol is first in list of nonterminals."
      startsym: prodList first lhs. "Start sym. is defined by first prod."
      nonterms removeKey: startsym kind.
      nonterminals: (nonterms asList addFirst: startsym) asVector.

      "Now assign symbolId's."
      em_terminalsDo: [|:s| s symbolId: sid. sid: 1 + sid].
      nonterminalsDo: [|:s| s symbolId: sid. sid: 1 + sid].

      mango assertSwitch ifTrue: [
          em_symbolsDo: [|:s| 
              (s != (symbolId2symbol: s symbolId)) ||
              [s isNonterminal && [s != (kind2nonterminal: s kind)]] ||
              [s isTerminal    && [s != (kind2terminal:    s kind)]] ifTrue: [
                  error: 'bad symbol index'.
              ].
          ].
      ].
      partitionProds: prodList IfFail: [|:e| errBlk value: e].
      level: 2 Print: em_noOfTerminals printString, 
                      ' terminals (incl. endMaker), ',
                      noOfNonterminals printString, ' nonterminals, and ',
                      noOfProductions  printString, ' productions.\n'.
      self.
    ).
| )


traits mango counter _Define: ( |
  "_" parent*        = traits clonable.
  "^" copy           = ( copyVisible: true. ).
  "^" copyVisible: v = ( resend.copy initVisible: v. ).
  "^" printString    = ( 'counter(', value printString, ')'. ).
  "^" value          = ( val. ).
  "^" value: n       = ( val: n. show: value printString. ).
  "^" inc            = ( value:  1 + value. ).
  "^" dec            = ( value: -1 + value. ).
  "^" hide           = ( show: ''. visible: false. ).
  "^" show           = ( visible: true. show: value printString. ).
  "_" initVisible: v = ( visible: v. show: value printString. ).

  "_" show: str = ( 
      | n <- 0. m <- 0. |
      visible ifTrue: [
          n: str size.
          back:  oldSize.
          m: oldSize - n.
          0 < m ifTrue: [('' copySize: m FillingWith: ' ') print. back: m.].
          oldSize: n. 
          str print.
      ].
      self.
    ).

  "_" back: n = (
      | backSpace = 8 asCharacter. |
      ('' copySize: n FillingWith: backSpace) print.
      self.
    ).
| )

mango counter _Define: ( |
  {} = 'IsComplete: '.
  "_" parent* = traits mango counter.
  "_" oldSize <- 0.
  "_" val     <- 0.
  "_" visible <- true.
| )


mixins mango tracer _Define: ( |
  "^" noiseLevel <- 1.       "Set to 0, 1, 2, or 3 to get fewer/more output."

  "^" level: n Print: str = ( 
      n <= noiseLevel ifTrue: [str print].
      self.
    ).
| )


traits mango symbols symbol _Define: ( |
  "_" parent*         = traits clonable.
  "^" isSymbol        = true.
  "^"   isTerminal    = false.
  "^"   isNonterminal = false.
  "^" copyKind: k     = ( copy initKind: k. ).
  "^" yaccName        = ( kindAsSlotName, yaccSuffix. ).
  "^" kindAsSlotName  = ( asSlotName: kind. ).
  "^" tagAsSlotName   = ( asSlotName: tag. ).
  "^" printString     = ( (tag = kind ifTrue: '' False: tag, ':'), kind. ).
  "^" tag             = ( kind. ).     "Default tag. Overridden in instances."
  "^" tag: t          = ( self. ).
  "_" idCounter      <- minSmallInt.

  { 'equality'
        "Defined in terms of the 'comparisonId' slot which is given a unique
         value every time a the 'compyKind:' method is called. In particular, 
         the comparisonId's of terminals and nonterminals are distinct. 
         It used to be that there was no distinction between 'symbolId' and
         'comparisonId', but this turned out to be too inconvenient (since
         the grammars *have* to set the symbolId's)."
      "^" = x  = ( comparisonId = x comparisonId. ).
      "^" hash = ( comparisonId hash. ).
  }

  "^" kindPrintString = (
      kind = mango grammars grammar endMarker kind ifTrue: [
          '<end of input>'.
      ] False: [
          '\'', kind, '\''.
      ].
    ).

  "_" convertChar: ch = (
      "What a pain!"
      ch isLetter ifTrue: [^ ch             ].
      ch isDigit  ifTrue: [^ ch             ].
      ' ' = ch    ifTrue: [^ 'space_'       ].
      '!' = ch    ifTrue: [^ 'emark_'       ].
      '"' = ch    ifTrue: [^ 'doublequote_' ].
      '#' = ch    ifTrue: [^ 'sharp_'       ].
      '$' = ch    ifTrue: [^ 'dollar_'      ].
      '%' = ch    ifTrue: [^ 'percent_'     ].
      '&' = ch    ifTrue: [^ 'and_'         ].
      '\''= ch    ifTrue: [^ 'singlequote_' ].
      '(' = ch    ifTrue: [^ 'beginParen_'  ].
      ')' = ch    ifTrue: [^ 'endParen_'    ].
      '*' = ch    ifTrue: [^ 'star_'        ].
      '+' = ch    ifTrue: [^ 'plus_'        ].
      ',' = ch    ifTrue: [^ 'comma_'       ].
      '-' = ch    ifTrue: [^ 'minus_'       ].
      '.' = ch    ifTrue: [^ 'dot_'         ].
      '/' = ch    ifTrue: [^ 'slash_'       ].
      ':' = ch    ifTrue: [^ 'colon_'       ].
      ';' = ch    ifTrue: [^ 'semicolon_'   ].
      '<' = ch    ifTrue: [^ 'lessThan_'    ].
      '=' = ch    ifTrue: [^ 'equals_'      ].
      '>' = ch    ifTrue: [^ 'greaterThan_' ].
      '?' = ch    ifTrue: [^ 'qmark_'       ].
      '@' = ch    ifTrue: [^ 'alpha_'       ].
      '[' = ch    ifTrue: [^ 'beginBrkt_'   ].
      '\\'= ch    ifTrue: [^ 'backslash_'   ].
      ']' = ch    ifTrue: [^ 'endBrkt_'     ].
      '^' = ch    ifTrue: [^ 'upArrow_'     ].
      '_' = ch    ifTrue: [^ '__'           ]. "Double; to ensure uniqueness."
      '`' = ch    ifTrue: [^ 'backQuote_'   ].
      '{' = ch    ifTrue: [^ 'beginBrc_'    ].
      '|' = ch    ifTrue: [^ 'vbar_'        ].
      '}' = ch    ifTrue: [^ 'endBrc_'      ].
      '~' = ch    ifTrue: [^ 'tilde_'       ].
      ch asByte printString, '_'.
    ).

  "^" asSlotName: t = (
      "Tags and kinds may not be legal slot names. When we need to use them
       as such, this method maps them in a predictable way. May also be
       called from outside so that the user can understand the mapping.
       For now just map the non-letter/digit chars to their ascii codes!"
      | res <- ''. |
      res: ''.
      t do: [|:ch| res: res, (convertChar: ch)].
      res first isLowerCase ifFalse: [res: 'a_', res].
      'self'   = res ifTrue: [res: 'self_']. "'self' is not a legal slot name."
      'resend' = res ifTrue: [res: 'resend_'].  "Nor is 'resend'."
      res.
    ).

  "_" initKind: k = (
      kindSharedState: kindSharedState copy.
      tag:          k asString.
      kind:         tag.
      comparisonId: idCounter.
      idCounter:    1 + idCounter.
      self.
    ).

   "fast functional add slots"
  "^" protoSkeletonFAddSlots: x = (
	protoSkeleton: protoSkeleton _Clone _AddSlots: x. "xxx"
	setBackpointer.
	self).

   "fast functional add slots"
  "^" traitsSkeletonFAddSlots: x = (
	traitsSkeleton: traitsSkeleton _Clone _AddSlots: x). "xxx"

  { 'sharedStateAccessors'
      "Forwarders for state that is shared per kind of symbol."
      "^" kind              = ( kindSharedState kind.                    ).
      "_" kind: k           = ( kindSharedState kind: k. self.           ).
    
      "^" comparisonId      = ( kindSharedState comparisonId.            ).
      "_" comparisonId: s   = ( kindSharedState comparisonId: s. self.   ).
    
      "^" scratch           = ( kindSharedState scratch.                 ).
      "^" scratch: s        = ( kindSharedState scratch: s. self.        ).
    
      "^" symbolId          = ( kindSharedState symbolId.                ).
      "^" symbolId: s       = ( kindSharedState symbolId: s. self.       ).
    
      "^" first1            = ( kindSharedState first1.                  ).
      "^" first1: f         = ( kindSharedState first1: f. self.         ).

      "^" traitsSkeleton    = ( kindSharedState traitsSkeleton.          ).
      "^" traitsSkeleton: t = ( kindSharedState traitsSkeleton: t. self. ).

      "^" protoSkeleton     = ( kindSharedState protoSkeleton.           ).
      "^" protoSkeleton: t  = ( kindSharedState protoSkeleton: t. self.  ).
  }
| )

mango symbols symbol _Define: ( |
      {} = 'IsComplete: '.
  "_" parent*          = traits mango symbols symbol.
  "^" tag             <- 'symbol'. 
  "_" kindSharedState <- mango symbols symbolSharedState.  
                 "State that is shared among all symbols of same kind."
| )


mango symbols symbolSharedState _Define: ( |
  "_" parent*         = traits clonable.
  "^" kind           <- 'symbol'.
  "^" symbolId       <- 0.
  "^" comparisonId   <- 0.
  "^" first1         <- nil.      "A set object when first1 has been computed."
  "^" traitsSkeleton <- traits mango tokens nodeSkeleton.
  "^" protoSkeleton  <-        mango tokens nodeSkeleton.
  "^" scratch.                    "Used for efficiently holding data during 
				 certain computations. Has a temporary
				 nature and should not be trusted to
				 maintain data over time. Also, use of
				 this field assumes no concurrency!"
| )


traits mango symbols terminal _Define: ( |
  "_" parent*    = traits mango symbols symbol.
  "^" isTerminal = true.
  "_" yaccSuffix = '0'.   "To make terms and nonterms unique in yaccDump."
  "^" shortPrintString = ( '{', symbolId printString, '}'. ).
  "^" printString      = ( '{', resend.printString, '}'. ).

  "^" setBackpointer = ( 
      "Do a mirror assisted modification of a constant slot;
       equiv. assignment is:    shifting protoSkeleton: protoSkeleton."

      (reflect: shifting) at: 'protoSkeleton' PutContents: reflect: protoSkeleton.
      self.
    ).

  { 'sharedStateAccessors'
      "Forwarders for state that is shared per kind of symbol."
      "^" shifting          = ( kindSharedState shifting.                ).
      "^" shifting: s       = ( kindSharedState shifting: s. self.       ).
    
      "^" isLiteral         = ( kindSharedState isLiteral.               ).
      "^" isLiteral: s      = ( kindSharedState isLiteral: s. self.      ).
  }
| )

(mango symbols terminal _Define: 
 mango symbols symbol copy _AddSlots: ( |
  "_" parent* = traits mango symbols terminal.
  "_" kindSharedState <- mango symbols terminalSharedState.  
                 "State that is shared among all symbols of same kind."
| ) )


(mango symbols terminalSharedState _Define: 
 mango symbols symbolSharedState copy _AddSlots: ( |
  "^" shifting <- ( |      "stGrammars put another object here to build trees."
      "_" parent* = traits clonable.
      "^" toPutOnStack: myTerminal = ( myTerminal. ).
      "^" protoSkeleton: x = (self). "not used cause I don't build trees"
    | ).
  "^" isLiteral <- false.  "True if this terminal-kind is defined by literal 
                          string in grammar specification."
| ) )


traits mango symbols nonterminal _Define: ( |
  "_" parent*          = traits mango symbols symbol.
  "^" isNonterminal    = true.
  "_" yaccSuffix       = '1'.   "To make terms and nonterms unique in yaccDump."
  "^" shortPrintString = ( '<', symbolId printString, '>'. ).
  "^" printString      = ( '<', resend.printString, '>'. ).
  "^" setBackpointer   = ( self ).

  { 'sharedStateAccessors'
      "Forwarders for state that is shared per kind of symbol."
      "^" follow1           = ( kindSharedState follow1.                 ).
      "^" follow1: f        = ( kindSharedState follow1: f. self.        ).
    
      "^" dontInline        = ( kindSharedState dontInline.              ).
      "^" dontInline: d     = ( kindSharedState dontInline: d. self.     ).
    
      "^" productions       = ( kindSharedState productions              ).
      "^" productions: p    = ( kindSharedState productions: p. self.    ).
    
      "^" structuredProd    = ( kindSharedState structuredProd           ).
      "^" structuredProd: p = ( kindSharedState structuredProd: p. self. ).
  }
| )
    
(mango symbols nonterminal _Define: 
 mango symbols symbol copy _AddSlots: ( |
  "_" parent* = traits mango symbols nonterminal.
  "_" kindSharedState <- mango symbols nonterminalSharedState.  
                 "State that is shared among all symbols of same kind."
| ) )


(mango symbols nonterminalSharedState _Define: 
 mango symbols symbolSharedState copy _AddSlots: ( |
  "^" follow1     <- nil.    "A set object when follow1 has been computed."
  "^" dontInline  <- false.  "Probably only C/C++ grtammar will ever need 
                            to set some of these true!"
  "^" productions <- vector. "(Unstructured) productions for this nonterminal."
  "^" structuredProd.        "Structured production (if any)."
| ) )


traits mango productions production _Define: ( |
  "_" parent*             = traits clonable.
  "_" dot                 = '@'.
  "^" psymbolsDo: blk     = ( blk value: lhs. rhs do: blk. self. ).
  "^" isEpsilonProduction = ( 0 = rhs size.).
  "^" copy                = ( resend.copy init. ).
  "^" copyLHS: l RHS: r   = ( copy initLHS: l RHS: r. ).

  "^" copyReplacing: s1 With: s2 = (
      "Used for determining character classes. Return copy of this production
       with all occurences of s1 replaced by s2."
      copyLHS: lhs 
          RHS: (rhs copyMappedBy: [|:s| s = s1 ifTrue: [s2] False: [s1]]).
    ).

  "^" assertReduceActionPops = (
      mango assertSwitch ifTrue: [tbConstructor assertNoOfPops: rhs size].
      self.
    ).

  "^" at: index Inline: prod = (
      "Note: this operation sideeffects the receiver, but not the argument."
      assertReduceActionPops.
      prod assertReduceActionPops.
      mango assert: [(rhs at: index) = prod lhs.  "bad inline request?"].
      tbConstructor atStackDepth: rhs size - index 
                          Inline: prod tbConstructor copy.
      rhs: (rhs copySize: index), prod rhs, (rhs copyFrom: 1 + index).
      assertReduceActionPops.
      prod assertReduceActionPops.
      self.
    ).

  { 'equality'
      "^" = x  = ( (lhs = x lhs) && [rhs = x rhs]. ).
      "^" hash = ( lhs hash ^^ rhs hash. ).
  }

  "^" canTerminateWith: t = (
      "Given that 't' is a set of symbols that can terminate, can the
       lhs of this production also terminate?"
       rhs do: [|:s| (t includes: s) ifFalse: [^ false]. ].
       true.
    ).

  "^" printString = ( printStringWithDotAt: -1. ).

  "^" printStringWithDotAt: idx = (
      | res <- ''. |
      res: lhs printString, ' ->'.
      rhs do: [ |:s. :i.| 
          idx = i ifTrue: [res: res, ' ', dot].
          res: res, ' ', s printString. 
      ].
      idx = rhs size ifTrue: [res: res, ' ', dot].
      res.
    ).

  "_" init = (
      tbConstructor: tbConstructor copy.
      self.
     ).

  "_" initLHS: l RHS: r = ( 
      lhs: l. 
      rhs: r asVector. 
      lhs isNonterminal ifFalse: [error: lhs objectID, ' is not a nonterminal'].
      lhs tag != lhs kind ifTrue: [
          error: 'lhs of production should not have diff. tag (\'', tag, 
                 '\') and kind (\'', kind, '\')'.
      ].
      rhs do: [|:s| 
          s isSymbol ifFalse: [error: s objectID, ' is not a symbol'].
      ].
      self. 
    ).
| )

mango productions production _Define: ( |
      {} = 'IsComplete: '.
  "_" parent* = traits mango productions production.
 "^_" lhs    <- mango symbols nonterminal.
 "^_" rhs    <- vector.   "Vector of symbols."
  "^" prodId <- -1.       "Unique id (within a given grammar)."

    "The 'reduceAction' slot is used to generate output during parsing. It
     simply prints the reducing production whenever a reduction occurs. 
     This is probably only useful for debugging, but if desired, these
     actions can be modifed to accumulate the list of applied productions.
     stGrammars replace this object with objects that build parse trees 
     instead of simply printing the productions. Those reduce actions are 
     constructued using the 'tbConstructor'."
  "^" reduceAction.

    "The 'tbConstructor' is an object that can produce a reduce action.
     The default is a one that produces a very simple reduce action.
     Structured grammars, however, replace this object with an object
     that spits out a reduce action that builds parse trees."
  "^" tbConstructor <- ( |
      "_" parent* = traits oddball.
      "^" assertNoOfPops: n = ( self. ).
      "^" atStackDepth: n Inline: tbCons = ( self. ).

      "^" setReduceActionIn: prod = (
          | ra. |
          ra: simpleReduceAction copy.
          ra prod: prod.
          prod reduceAction: ra.
          self.
        ).

      "_" simpleReduceAction = ( |
          "_" parent* = traits clonable.
          "^" prod   <- mango productions production.

          "^" doStack: stack = (
              "Pop the right number of symbols/states of the stack;
               return new symbol to push on stack."
              "We build a new rhs from the symbols on the stack so that we
               obtain to have the actual input terminal instances appear in 
               the output productions."
              rhs: prod rhs copy.
              rhs reverseDo: [|:s. :idx. stackElm. |
                  stack pop.     "Skip state."
                  mango assertSwitch && 
                  [s symbolId != stack top symbolId] ifTrue: [
                      error: 'unexpected symbolId on stack top; expected \'',
                             s symbolId, 
                             '\', found \'', stack top symbolId, '\''.
                  ].
                  stackElm: stack top.
                  stack pop.
                  rhs at: idx Put: stackElm.
              ].
              (prod copyLHS: prod lhs RHS: rhs) printLine. 
              prod lhs.   "Stack lhs."
            ). 
        | ).
    | ).
| )


traits mango grammars slrItem _Define: ( |
  "An SLR(1) item. Actually it is not clear whether the best terminology
   is 'SLR(1)' or 'SLR(0)' since it is not combined with follow1 sets 
   (however, even though the follow1 sets are not stored, they can be 
   computed by need). For simplicity, the single word 'SLR(1)' is used 
   everywhere."
  "_" parent*     = traits clonable.
  "^" itemKind    = 'SLR(1)'.
  "^" printString = ( production printStringWithDotAt: dotIndex. ).

    "For SLR(1) items the lookahead is simply follow1 of the lhs of the prod."
  "^" lookahead   = ( production lhs follow1 ).

  "^" sameCoreAs: x = ( 
      mango assert: [grammar = x grammar.  
                       "only compare within grammar; else domain error"].
      "It is OK to use identity comparison of the productions (& faster), 
       since once we start generating items, we no longer modify
       the productions, and we know that there are no two equal but
       non-identical productions in the grammar."
      (production == x production) && [dotIndex = x dotIndex].
    ).

  { 'equality'
      "^" = x  = ( sameCoreAs: x. ).
      "^" hash = ( dotIndex hash ^^ production hash. ).
  }

  { 'creating'
      "^" copyForward = ( 
          copyProduction: production DotIndex: 1 + dotIndex Grammar: grammar. 
        ).

      "^" copyDescendantProduction: p = ( 
          copyProduction: p DotIndex: 0 Grammar: grammar.
        ).

      "^" copyProduction: p DotIndex: i Grammar: g = ( 
          copy initProduction: p DotIndex: i Grammar: g.
        ).

      "^" core = ( 
          "The core of an item, whether SLR(1) or LR(1), is always an
           LR(1) item but with empty lookahead."
          mango grammars lrItem copyProduction: production DotIndex: dotIndex
               Grammar: grammar Lookahead: set copy.
        ).

      "_" initProduction: p DotIndex: i Grammar: g = (
          restDerivesEps: nil.    "Indicate not computed."
          production: p.
          dotIndex:   i.
          grammar:    g.
          mango assert: [(0 <= dotIndex) && [dotIndex <= production rhs size]].
          self.
        ).
  }

  "^" dotAtEnd = (
      "Return true iff the dot is at the end of the right hand side."
      dotIndex = production rhs size.
    ).

  "^" symbolAfterDot = ( symbolAfterDotIfFail: raiseError. ).

  "^" symbolAfterDotIfFail: errBlk = (
      dotAtEnd ifTrue: [errBlk value: 'item: no symbol after the dot']
                False: [production rhs at: dotIndex].
    ).

  "^" rest = (
      "Return stuff after dot, though excluding symbol immediately after
       dot. E.g.     rest(X @ Y Z) = Z."
      production rhs copyFrom: 1 + dotIndex.      "Fails if dot is at end."
    ).

  "^" registerDescendant: dec = ( self. ).  "No need to keep track of desc."
  "^" verifyNoDescendants = ( self. ). 

  "_" computeRestDerivesEps = (
      | rhs <- vector. epsilon <- mango symbols terminal. |
      dotAtEnd ifTrue: [^ false].
      rhs: production rhs.
      epsilon: grammar epsilon.
      1 + dotIndex upTo: rhs size Do: [|:i|
          ((rhs at: i) first1 includes: epsilon) ifFalse: [^false].
      ].
      true.
    ). 

  "^" restDerivesEpsilon= (
      "Return true iff the stuff after the dot derives epsilon. Equivalent 
       to deciding if epsilon is in 'first1: rest' but the following impl. 
       is more efficient. 
       In the degenerate case where the dot is at the end, this method
       _by_definition_ returns 'false'. This is exploited at 910."
      nil = restDerivesEps ifTrue: [restDerivesEps: computeRestDerivesEps].
      restDerivesEps.
    ).
| )

mango grammars slrItem _Define: ( |
      {} = 'IsComplete: '.
  "_" parent*          = traits mango grammars slrItem.
 "^_" production      <- mango productions production.
 "^_" dotIndex        <- 0.     "Range 0 .. production rhs size."
 "^_" grammar         <- mango grammars grammar.
  "_" restDerivesEps  <- nil. "nil until computed, then true or false dep. on
                             whether '(first1: rest) includes: epsilon'."
| )


traits mango grammars lrItem _Define: ( |
  "An LR(1) item."
  "_" parent*     = traits mango grammars slrItem.
  "^" itemKind    = 'LALR(1)/LR(1)'.
  "^" printString = ( '[', resend.printString, ', ', lookahead printString, ']' ).

  { 'equality'
      "NB: hash is not defined to depend on 'lookahead'. The reason is that
       it then becomes impossible to modify the lookaheads of lrItems that 
       are in sets etc. These modifications are in fact needed when computing 
       LALR(1) states."
      "^" = x  = ( (resend.= x) && [lookahead = x lookahead]. ).
  }

  { 'creating'
      "^" copyProduction: p DotIndex: i Grammar: g Lookahead: l = (
          (resend.copyProduction: p DotIndex: i Grammar: g) initLookahead: l.
        ).

      "^" copyForward = ( 
          "NB: 'copyForward' could be modified to let the lookahead sets of
           master and copy be shared. This would result in space savings but
           also be a potential source of bugs, e.g. when merging LR(1) states
           into LALR(1) states."
          copyProduction: production DotIndex: 1 + dotIndex
                 Grammar: grammar Lookahead: lookahead copy. 
        ).

      "^" copyDescendantProduction: p = (
          copyProduction: p DotIndex: 0 Grammar: grammar Lookahead: set copy. 
          "Empty lookahead for descendant."
        ).

      "_" initLookahead: l = ( 
          lookahead: l. 
          descendants: set copy.
          self. 
        ).

      "^" copyProduction: p DotIndex: i Grammar: g = ( 
          error: 'I\'m not a SLR(1) item'. 
        ).
  }

  "^" registerDescendant: dec = ( descendants add: dec. self. ).

  "^" verifyNoDescendants = ( 
      mango assert: [descendants isEmpty.  "must not have descendants now"].
      self. 
    ).

  "_" propagate: s = (
      "Propagate the symbol 's' to all descendant items."
      mango assert: [
          dotAtEnd not || descendants isEmpty.
          "assertion error message: 'I can\'t possibly have an ancestor'"
      ].
      descendants do: [|:item| item addToLookahead: s].
      self.
    ).

  "^" propagateLookahead = (
      "Only to be called on kernel items."
      restDerivesEpsilon ifTrue: [lookahead do: [|:s| propagate: s]].    "910"
      self.
    ).

  "^" addToLookahead: s = (
      "Add symbol 's' to lookahead set, and propagate it to descendant items."
      (lookahead includes: s) ifFalse:[
          lookahead add: s.  
          restDerivesEpsilon ifTrue: [propagate: s].                     "910"
      ].
      self.
    ).

  "^" propagateSpontaneousLookahead = (
      | spontla <- set. |
      mango assert: [dotAtEnd not. 
                    "should not call 'propagateSpontaneousLookahead' on me."].
      spontla: (grammar first1: rest).
      mango assert: [
          restDerivesEpsilon = (spontla includes: grammar epsilon).
          "assertion fails  if bad 'restDerivesEps' 
           (or not computed, but should be)."
      ].
      restDerivesEpsilon ifTrue: [spontla remove: grammar epsilon].
      spontla do: [|:s| propagate: s].
      self.
    ).

  "^" mergeWithItem: item = ( 
      mango assert: [sameCoreAs: item.  
                       "Trying to merge with item that has differnent core."].
      item lookahead do: [|:s| addToLookahead: s].
      self. 
    ).
| )

mango grammars lrItem _Define: mango grammars slrItem copy _AddSlots: ( |
  "_" parent*      = traits mango grammars lrItem.
  "^" lookahead   <- set.   "set of 'mango symbols terminal'."
  "_" descendants <- set.   "set of 'lrItem'."
| )


traits mango grammars lrState _Define: ( |
    "An LR(1) or SLR(1) state is a set of items of the particular kind."
  "_" parent*          = traits clonable.
  "^" printString      = ( 'state', (kernel printString copyFrom: 3). ).
  "^" kind             = ( kernel first itemKind. ).
  "^" kernelDo: blk    = ( kernel  do: blk. self. ).
  "^" nonkernelDo: blk = ( closure do: blk. self. ).
  "^" itemsDo: blk     = ( kernelDo: blk. nonkernelDo: blk. ).

  "^" nonfinalItemsDo: blk = ( 
      itemsDo: [|:item| item dotAtEnd ifFalse: [blk value: item]].
    ).

  "^" finalItemsDo: blk = (
      "Iterate over all items with the dot at the end. Only bother iterating
       over (computing) closure if there is a chance that it contains final 
       items that are non-kernel. This test is approximated (conservatively) 
       by 'useFullClosure'. Motivation for this optimization is that most
       grammars contain few epsilon productions, especially after being
       transformed." 
      useFullClosure ifTrue: [
          itemsDo:  [|:item| item dotAtEnd ifTrue: [blk value: item]].
      ] False: [
          kernelDo: [|:item| item dotAtEnd ifTrue: [blk value: item]].
      ].
      self.
    ).

  "_" useFullClosure = (
      kernelDo: [|:item. s <- mango symbols symbol. |
          s: (item symbolAfterDotIfFail: nil).
          nil != s ifTrue: [(grammar canCloseToEpsilon: s) ifTrue: [^true]].
      ].
      false.
    ).

  "^" itemsWith: sym AfterDotDo: blk = (
      nil = distributedItems ifTrue: [distributeItems].
      (distributedItems at: sym symbolId) do: blk.
      self.
    ).

  "_" distributeItems = (
      | finalIdx <- 0. |
      finalIdx: grammar em_noOfSymbols.
      distributedItems: (vector copySize: 1 + grammar em_noOfSymbols).
      distributedItems mapBy: [list copy].
      itemsDo: [|:item. sym|
          sym: (item symbolAfterDotIfFail: nil).
          nil = sym ifTrue: [(distributedItems at: finalIdx)     add: item]
                     False: [(distributedItems at: sym symbolId) add: item].
      ].
      distributedItems mapBy: [|:items| items asVector].
      self.
    ).
          
  { 'equality'
        "Compare hash first (it is cached/cheap); hopefully we don't have to 
         make the more expensive comparison of the kernel sets. E.g. when 
         computing 514 SLR(1) states for a 'typical' grammar, there were
         81549 comparisons of lrStates. 80% of these comparisons returned
         false and in 97% of these cases it was enough to compare the
         'khash' values to determine that the result was false."
      "^" = x  = ( khashInvariant. (hash = x hash) && [kernel = x kernel] ).
      "^" hash = ( khashInvariant. khash. ).
  }

  "^" pprint = ( pprint: stdout. ).

  "^" pprint: file = (
      file writeLine: 'state ', id printString, ':'.
      file writeLine: 'kernel items:'.
      kernelDo:    [|:item| file writeLine: '\t', item printString].
      file writeLine: 'non-kernel items:'.
      nonkernelDo: [|:item| file writeLine: '\t', item printString].
      file writeLine: ''.
      self. 
    ).

  "^" copyKernel: k Grammar: g = (
      "Copy and set the kernel items (set of lrItem or slrItem) to k."
      copy initKernel: k Grammar: g 
        Outgoing: (vector copySize: g em_noOfSymbols FillingWith: unknown). 
    ).

  "^" coreStateNC = ( 
      "Does the same as 'coreState' but is guaranteed to return a new
       object every time it is called (i.e. no caching). NB: returned 
       object shares 'outgoing' with original."
      copy initKernel: (kernel copy mapBy: [|:item| item core]) 
              Grammar: grammar Outgoing: outgoing.
    ).

  "^" coreState = (
      "Return similar lrState as this one, but always an LR(1) state where
       all items have empty lookahead.
       Warning: 'outgoing' is shared between 'coreState' and master.
       This method caches result and returns same object if called several 
       times SO DON'T SIDEEFFECT THE RESULT."
      nil = myCoreState ifTrue: [myCoreState: coreStateNC].
      myCoreState.
    ).

  "^" mergeWithState: lrState = (
      | i <- 0. |
      "Used for merging LR(1) states into LALR(1) states."
      mango assert: [coreState = lrState coreState. 
                       "Tried to merge LR(1) sets with different core."].
      "Note: when merging the kernels there is no need to worry about the
       closure since the 'descendants' graph is still in place, keeping the
       lookaheads for non-kernel items up to date."
      kernelDo: [|:item1|   
          lrState kernelDo: [|:item2|
              (item1 sameCoreAs: item2) ifTrue: [
                  item1 mergeWithItem: item2. 
                  i: 1 + i.
              ].
          ].
      ].
      i != kernel size ifTrue: [error: 'merge failed'].
      self.
    ).

  "^" goOver: sym = (
      "Compute the lr state we end up in if we do a goto over the symbol
       'sym' from the state represented by this object. If no transition is
       possible on 'sym', return nil. According to p. 224."
      | res <- mango grammars lrState. |
      res: (outgoing at: sym symbolId).
      unknown = res ifTrue: [    "Result not cached."
          | newKernel <- set. |
          newKernel: newKernel copy.
          itemsWith: sym AfterDotDo: [|:item| newKernel add: item copyForward].
          res: (newKernel isEmpty ifTrue: nil
                False: [copyKernel: newKernel Grammar: grammar]).
      ].
      res.
    ).

  "^" cacheGoOver: sym Result: res = (
      "Cache that the transition on 'sym' goes to state 'res'. In essence
       cacing the info that goOver computes."
      mango assert: [unknown = (outgoing at: sym symbolId).
                       "Must not already have outgoing edge for this symbol."].
      outgoing at: sym symbolId Put: res.
      self.
    ).

  "_" computeClosureNoLA: ancestor = (
      | s <- mango symbols symbol. |
      s: (ancestor symbolAfterDotIfFail: nil).
      (nil != s) && [s isNonterminal] ifTrue: [
          s productions do: [|:p. desc. |
              desc: (ancestor copyDescendantProduction: p). 
              "Note: 'myClosure' is a set, but we use a dictionary operation
               for efficiency."
              myClosure if: desc IsPresentDo: [|:d| desc: d]
                                 IfAbsentPut: [desc]
                                       AndDo: [computeClosureNoLA: desc].
              ancestor registerDescendant: desc.
          ].
      ].
      self.
    ).
 
  "_" computeClosure = (
      "Compute the closure of the kernel items. The following algorithm is
       NOT the one on p. 222/223 (too ineffcient). Here we start by computing
       the core of the closure - i.e. lrItems with an empty lookahead. At
       the same time as the core is computed, we build up a graph describing
       how lookaheads are propagated from item to item. Having computed the
       core, the closure is completed by propagating the lookaheads."
      | epsilon <- mango symbols terminal. |
      myClosure: set copy.
      mango assertSwitch ifTrue: [
          kernelDo: [|:item| item verifyNoDescendants].
      ].
      kernelDo: [|:item| computeClosureNoLA: item].
      "We can't fold the (beginning of the) lookahead computation into 
       'computeClosureNoLA:' since then it wont be able to recognize when
       a previously seen item is re-encountered."
      'SLR(1)' = kind ifTrue: [^ self].    "No lookaheads in this case."
      epsilon: grammar epsilon.
      itemsDo:         [|:item| item restDerivesEpsilon].
      nonfinalItemsDo: [|:item| item propagateSpontaneousLookahead].
      kernelDo:        [|:item| item propagateLookahead].
      self.
    ).

  "_" closure = (
      nil = myClosure ifTrue: [computeClosure].
      myClosure.
    ).

    "Used in 'outgoing'; indicates that resulting state has not yet been
     computed."
  "_" unknown = ( | parent* = traits oddball. | ).

  "_" khashInvariant = (
      mango assert: [khash = kernel hash. "khashInvariant must hold"].
      self.
    ).

  "_" initKernel: k Grammar: g Outgoing: o = (
      distributedItems: nil.   "Force initialization later on (by need)."
      myCoreState: nil.
      myClosure: nil.
      outgoing: o.
      grammar: g.
      kernel: k.
      khash: kernel hash.    "Establish khash invariant!"
      khashInvariant.
      self.
    ).
| )

mango grammars lrState _Define: ( |
      {} = 'IsComplete: '.
  "_" parent*    = traits mango grammars lrState.
  "^" id        <- -1.        "The state ID of the corr. LR parser state."
  "_" kernel    <- set.       "Kernel items (~ items with dot not at beginning)."
  "_" khash     <- 0.         "khashInvariant: 'khash = kernel hash'."
  "_" myClosure <- nil.       "closure over kernel (non-kernel items); lazy comp"
 "^_" grammar   <- mango grammars grammar.
 "^_" outgoing  <- vector.     "Maps symbolId (edge) to other state/nil/unknown."
  "^" pred      <- vector.     "Indexed by symboldID's. Inverse of 'outgoing'."
  "^" predCache <- dictionary. "Keyed by paths. Transitive closure of 'pred'."
  "_" myCoreState <- nil.      "Lazily computed."
  "_" distributedItems <- nil. "nil until 'distributeItems' is called."
| )


traits mango grammars lrStateMachine _Define: ( |
  "_" parent*       = traits clonable.
  "_" tracer*       = mixins mango tracer.
  "^" noOfStates    = ( states size. ).
  "^" statesDo: blk = ( states do: blk. self. ).

  "^" orderedStatesDo: blk = ( 
      "Iterate over states in order of 'id'. For printing etc."
      | v <- vector. |
      v: v copySize: noOfStates.
      statesDo: [|:state| v at: state id Put: state].
      v do: blk.
      self.
    ).

  "^" pprint = ( pprint: stdout. ).

  "^" pprint: file = (
      file writeLine: objectID, ' = '.
      orderedStatesDo: [|:state| state pprint: file].
    ).

  "^" printString   = ( 
      '<', kind, ' state machine for ', grammar printString, '>'. 
    ).

  "^" copyGrammar: g Kind: k = ( copy initGrammar: g Kind: k. ).

  "^" diff: stateMachine = (
      | equiv <- true. |
      "Compare two state machines, print out differences if any."
      '  Comparing state machines ' print. objectID print.  
      ' and ' print. stateMachine objectID print. '... ' print.
      noOfStates != stateMachine noOfStates ifTrue: [
          '    State machines have different number of states' printLine.
      ].
      stateMachine orderedStatesDo: [|:state2. state1. |
          (states includes: state2) ifTrue: [
              state1: (states at: state2).
              state1 outgoing != state2 outgoing ifTrue: [
                  '    outgoing edges differ for states ' print.
                  state2 objectID print. ' and ' print. 
                  state1 objectID printLine.
                  equiv: false.
              ].
          ] False: [
              '    state ' print. state2 id print. ' found in ' print.
              stateMachine objectID print. ' but not in ' print.
              objectID printLine. 
              equiv: false.
          ].
      ].
      equiv ifTrue: ['done. They are equivalent.' printLine].
      self.
    ).

  "^" mergeLR1ToLALR1 = (
      "This is not an efficient way to produce the LALR1 machine!
       Main reason for having this method is to be able to verify that
       'extendSLR1ToLALR1' is correct."
      | core2LALRState <- dictionary. becomes <- dictionary.
        count <- mango counter. |
      'LR(1)' != kind ifTrue: [
          error: 'compute LR(1) states before calling \'mergeLR1ToLALR1\''.
      ].
      level: 3 Print: '    Merging LR(1) states into LALR(1) states... '.
      count: count copyVisible: noiseLevel >= 3.
      becomes: becomes copy.
      core2LALRState: core2LALRState copy.
      statesDo: [|:lrState. lalrState. | 
          core2LALRState if: lrState coreState 
                IsPresentDo: [|:l| lalrState: l]
                IfAbsentPut: [lalrState: lrState coreStateNC. lalrState]
                      AndDo: [].
          lalrState mergeWithState: lrState.
          becomes at: lrState id Put: lalrState.   
          "Using 'lrState id' as key instead of 'lrState' is an optim."
          count inc.
      ].
      count hide.
      level: 3 Print: ' done. ', core2LALRState size printString, 
                      ' LALR(1) states.\n'.
      remapGotoAndInstall: core2LALRState Becomes: becomes.
      setStateIDs.
    ).

  { 'kristensenMadsen'
      "^" extendSLR1ToLALR1 = (
          "According to B. B. Kristensen and O. L. Madsen, TOPLAS Jan. 1981."
          | lalrStates <- vector. count <- mango counter. |
          level: 2 
            Print: '    Extending SLR(1) items with LALR(1) lookaheads... '.
          count: (count copyVisible: noiseLevel >= 2).
          'SLR(1)' != kind ifTrue: [ 
              error: 'compute SLR(1) states before ',
                     'calling \'extendSLR1ToLALR1\''.
          ].
          computePredVectors.
          lalrStates: (vector copySize: noOfStates).
          statesDo: [|:slrState. lalrState <- mango grammars lrState. | 
              lalrState: slrState coreStateNC.
              "Enough to compute lookaheads for kernel items."
              lalrState kernelDo: [|:item|
                  item lookahead: (lalr1Item: item State: slrState).
              ].
              lalrStates at: slrState id Put: lalrState.
              count inc.
          ].
          count hide.
          level: 2 Print: 'done.\n'.
          remapGotoAndInstall: lalrStates Becomes: lalrStates.
          "The LALR(1) states already have id's. Got them from SLR(1) states."
        ).

      "_" predOf: endState Path: alpha = (
          "Return the set of states for which a goto on the symbol string
           'alpha' will result in 'endState' as the resulting state."
          | pre <- set. |
          "Caching makes as lot of sense here. For example, during computation
           of the LALR(1) lookaheads for a C grammar, this method is called
           95,000 times, but there are only 600 different arguments. 
           Ole Agesen, 4/3/93."
          pre: (endState predCache at: alpha IfAbsent: nil).
          nil != pre ifTrue: [^ pre].
          pre: set copy.
          pre add: endState.
          alpha reverseDo: [|:sym. pre2 <- set. |
              pre2: pre2 copy. 
              pre do: [|:state| pre2 addAll: (state pred at: sym symbolId)].
              pre: pre2.
          ].
          endState predCache at: alpha Put: pre.  "Cache for next time."
          pre.
        ).

      "_" computePredVectors = (
          statesDo: [|:state| 
              state predCache: dictionary copy.
              state pred: (vector copySize: grammar em_noOfSymbols
                               FillingWith: set).
          ].
          statesDo: [|:state|
              grammar em_symbolsDo: [|:sym. to. pred. |
                  to: (state goOver: sym).
                  nil != to ifTrue: [
                      (to pred at: sym symbolId) isEmpty ifTrue: [ 
                          to pred at: sym symbolId Put: set copy. "Lazy alloc"
                       ].
                       (to pred at: sym symbolId) add: state.
                  ].
              ].
          ].
          self.
        ).

      "_" lalr1Item: i State: t = (
          | la <- set. |
          la: la copy.
          i production = grammar startProduction ifTrue: [
              la add: grammar endMarker.
          ] False: [
              lalrItem: i State: t Done: set copy La: la Tm: set copy.
          ].
          la.
        ).

      "_" lalrItem: i State: t Done: done La: la Tm: tm = (
          | alpha <- vector. a <- mango symbols nonterminal. 
            prod <- mango productions production. 
            donePair <- 47. aSymId <- 47. |
          prod: i production.
          alpha: (prod rhs copySize: i dotIndex).
          a: prod lhs.
          aSymId: a symbolId.   "Just to get it out of loop."
          (predOf: t Path: alpha) do: [|:s|  
              mango assertSwitch ifTrue: [| t1 <- mango grammars lrState. |
                  "Verify that by starting in state 's' and traversing the
                   path 'alpha' we end up in state 't'."
                  t1: s.
                  alpha do: [|:x| t1: (t1 goOver: x)].
                  t != t1 ifTrue: [error: 'bad predecessor'].
              ].
              donePair: aSymId + (noOfStates * s id). "Arithmetic is MUCH 
                                                       faster than
                                                       'aSymId @ s id'
                                                       (doubles speed).
                                                       Reason: better hash
                                                       value?"
              (done includes: donePair) ifFalse: [
                  | t1 <- mango grammars lrState. |
                  done add: donePair.
                  t1: (s goOver: a).
                  nil != t1 ifTrue: [trans: t1 La: la Tm: tm].
                  s itemsWith: a AfterDotDo: [|:item|
                      item restDerivesEpsilon ifTrue: [
                          lalrItem: item State: s Done: done La: la Tm: tm.
                      ].
                  ].
              ].
          ].
          self.
        ).

      "_" trans: t La: la Tm: tm = (
          | startP  <- mango productions production. 
            epsilon <- mango symbols terminal. |
          (tm includes: t id) ifTrue: [^ self].
          tm add: t id.
          startP:  grammar startProduction.   "Just to get it out of loop."
          epsilon: grammar epsilon. 
          t itemsDo: [|:item. x. |
              startP = item production ifTrue: [la add: grammar endMarker].
              x: (item symbolAfterDotIfFail: nil).
              nil != x ifTrue: [
                  x isTerminal ifTrue: [
                      la add: x.
                  ] False: [| g0 <- mango grammars lrState. |
                      (x first1 includes: epsilon) &&
                      [g0: (t goOver: x). nil != g0] ifTrue: [
                          trans: g0 La: la Tm: tm.
                      ].
                  ].
              ].
          ].
          self.
        ).
  }

  "_" remapGotoAndInstall: lalrStates Becomes: becomes = (
      "NB: 'lalrStates' and 'becomes' may be aliased."
      | count <- mango counter. |
      level: 3 Print: '    Remapping goto... '.
      count: count copyVisible: noiseLevel >= 3.
      initialState: (becomes at: initialState id).
      states removeAll.
      lalrStates do: [|:lalrState| 
          states add: lalrState.
          lalrState outgoing mapBy: [|:to| 
              nil = to ifTrue: nil False: [becomes at: to id].
          ].
          count inc.
      ].
      kind: 'LALR(1)'.
      count hide. 
      level: 3 Print: 'done.\n'.
      self.
    ).

  "_" closureState: state Count: count = (
      | r <- mango grammars lrState. 
        liveSymbols <- byteVector. live = 0. notLive = 1. |
      "First build a byte vector, identifying those symbols for which we will
       have an outgoing edge. Building this vector and using it to filter
       the symbols for which we call 'goOver:' is really just an optimization,
       since 'goOver:' is designed to work correctly also in the case where 
       there is no outgoing edge."
      liveSymbols: (liveSymbols copySize: grammar em_noOfSymbols 
                             FillingWith: notLive).
      state itemsDo: [|:item. s. | 
          s: (item symbolAfterDotIfFail: nil).
          nil != s ifTrue: [liveSymbols at: s symbolId Put: live].
      ].
      grammar em_symbolsDo: [|:s. isNew <- false. |
          live = (liveSymbols at: s symbolId) ifTrue: [
              r: (state goOver: s).
              mango assert: [nil != r. "Should have outgoing edge!"].
              "If this is a previously reached state, get the object in 
               the 'states' set representing this state."
              "Note: 'states' is a set, but we use a dictionary operation
               for efficiency."
              states if: r IsPresentDo: [|:s| r: s]
                           IfAbsentPut: [count inc. isNew: true. r]
                                 AndDo: [].
          ] False: [
              mango assert: [
                  nil = (state goOver: s).  "Shouldn't have outgoing edge!"
              ].
              r: nil.  "Designates no outgoing edge."
          ].
          state cacheGoOver: s Result: r.
          isNew ifTrue: [closureState: r Count: count].
      ].
      self.
    ).

  "_" computeStates  = (
      "Computes all SLR(1) states if 'initialState' is initial SLR(1) state.
       Computes all  LR(1) states if 'initialState' is initial  LR(1) state.
       Requires that first1/follow1 have been computed for grammar.
       According to p. 224 and 232."
       | count <- mango counter. |
      count: count copyVisible: noiseLevel >= 2.
      states: states copyRemoveAll.
      states add: initialState.
      count inc.
      closureState: initialState Count: count.
      count hide.
      setStateIDs.
    ).

  "_" setStateIDs = (
      | i <- 0. |
      statesDo: [|:st| st id: i. i: 1 + i].
      "Now ensure that initialState has id 0."
      statesDo: [|:st| st id: initialState id. initialState id: 0. ^self.].
    ).
      
  "_" initGrammar: g Kind: k = (
      level: 2 Print: '  Computing ', k, ' state machine...\n'.
      'LALR(1)' = k ifTrue: [ 
          basicInitGrammar: g Kind: 'SLR(1)'. extendSLR1ToLALR1.
      ] False: [
      'slow-LALR(1)' = k ifTrue: [
          basicInitGrammar: g Kind: 'LR(1)'.  mergeLR1ToLALR1
      ] False: [
          basicInitGrammar: g Kind: k.
      ]].
      self.
    ).

  "_" basicInitGrammar: g Kind: k = (
      | initItem <- nil. |
      level: 2 Print: '    Computing ', k, ' states... '.
      kind: k.
      grammar: g.
      'SLR(1)' = kind ifTrue: [initItem: grammar initialSLRItem].
      'LR(1)'  = kind ifTrue: [initItem: grammar initialLRItem].
      nil = initItem  ifTrue: [error: 'bad kind of state machine: ', kind].
      initialState: (mango grammars lrState 
                     copyKernel: (set copy add: initItem) Grammar: g).
      computeStates.
      level: 2 Print: 'done. ', noOfStates printString, ' states.\n'.
      self.
    ).
| )

mango grammars lrStateMachine _Define: ( |
      {} = 'IsComplete: '.
  "_" parent*       = traits mango grammars lrStateMachine.
  "_" states       <- set.    "set of lrState."
 "^_" initialState <- mango grammars lrState.
 "^_" grammar      <- mango grammars grammar.
 "^_" kind         <- 'none'.   "Will be set to 'SLR(1)', 'LR(1)' or 'LALR(1)'."
| )


traits mango grammars grammar _Define: ( |
  "_" parent*         = traits clonable.
  "_" tracer*         = mixins mango tracer.
  "_" utilitiesMixin* = mixins mango utilitiesMixin.
  "^" printString     = ( 'grammar(', name, ')'. ).
  "^" pprint          = ( pprint: stdout. ).

  "^" pprint: file = (
      file writeLine: objectID, ' = ', printString, '\n'.
      file writeLine: 'Nonterminals: '.
      nonterminalsDo: [|:s| file write: s printString, ' ']. 
      file writeLine: '\n\nTerminals:'.
      terminalsDo:    [|:s| file write: s printString, ' ']. 
      file writeLine: '\n\nProductions:'.
      nonterminalsDo: [|:s. first <- true. | 
          file write: s printString, '  ->  '.
          s productions do: [|:p| 
              first ifTrue: [first: false] False: [file write: '  |  '].
              p rhs do: [|:r| file write: r printString, ' '].
          ].
          file writeLine: ''.
      ].
       self.
    ).

  { 'creating'
      "^" copyName: n Productions: pl = (
          copyName: n Productions: pl Transformations: list copy.
        ).

      "^" copyName: n Productions: pl Transformations: transf = (
          copyName: n Productions: pl Transformations: transf
            IfFail: raiseError
       ).

      "^" copyName: n Productions: pl Transformations: transf IfFail: errBlk = (
          "Construct a grammar with the given productions. The terminal and 
           nonterminal symbols of the grammar are extrated from the list of 
           productions. The lhs of the first production is the start symbol."
           copyName: n Productions: pl Transformations: transf
               EndMarker: (endMarker copyKind: endMarker kind) IfFail: errBlk.
        ).

      "^" copyName: n Productions: pl Transformations: transf
                      EndMarker: em IfFail: errBlk = (
          "As 'copyName:Productions:IfFail:' but in addition specifies the
           endMarker (used since endMarker is shared between structured and
           unstructured grammar). Primarily to be called by 'stGrammar'."
          copy initName: n Productions: pl Transformations: transf
              EndMarker: em IfFail: errBlk.
        ).

      "_" initName: n Productions: plist Transformations: transf
                      EndMarker: em IfFail: errBlk = (
          | ps <- mango productions prodSet. |
          name:      n.
          epsilon:   epsilon copy.
          endMarker: em.
          level: 2 Print: 'Initializing unstructured grammar ', name, '...\n'.
          ps: ps copy.
          ps addAll: plist.
          ps applyTransformations: transf TerminalClasses: [|:classes|
              terminalClasses: classes.
          ].
          "For debugging:
               'storing transformed productions in shell f' printLine.
               shell f: ps asProdList."
          initAndCheck: ps asProdList IfFail: [|:e| ^ errBlk value: e].
          self.
        ).

      "_" partitionProds: prodList IfFail: errBlk = (
          noOfProductions: prodList size.
          nonterminalsDo: [|:s. sProductions <- list. |
              sProductions: (prodList filterBy: [|:p| p lhs = s] 
                                          Into: list copy).
              s productions: sProductions asVector.
          ].
          self.
        ).

      "_" reachableFrom: sym Into: res = (
          (res includes: sym) ifFalse: [
              res add: sym.
              sym isNonterminal ifTrue: [
                  sym productions do: [|:p|
                      p rhs do: [|:s| reachableFrom: s Into: res.].
                  ].
              ].
          ].
          self.
        ).

      "_" checkRestrictionsIfFail: errBlk = (
          "Check specific restrictions on grammar:
              * Only one production with start symbol; rhs has lenght 1.
              * Start symbol not on any rhs."
          | st <- mango symbols nonterminal. |
          st: startSymbol.
          1 < st productions size ifTrue: [ 
              ^ errBlk value: 'more than one production for start symbol ',
                              startSymbol printString.
          ].
          1 != startProduction rhs size ifTrue: [
              ^ errBlk value: 'first production must be of form: S\' -> S'.
          ].
          productionsDo: [|:p|
              (p rhs includes: st) ifTrue: [
                  ^ errBlk value: 'start symbol not allowed on rhs of ',
                                  'production'.
              ].
          ].
          self.
        ).
  }

  { 'accessing'
      "_" accessorsMixin* = mixins mango accessorsMixin.
      "^" startProduction = ( startSymbol productions first. ).

      "^" productionsDo: blk = ( 
          "Iterate over all productions."
          nonterminalsDo: [|:s| s productions do: blk].
          self.
        ).

      "^" nonepsilonProductionsDo: blk = (
          "Iterate over all epsilon productions."
          productionsDo: [|:p| p isEpsilonProduction ifFalse: [blk value: p]].
        ).

      "^" epsilonProductionsDo: blk = (
          "Iterate over all epsilon productions."
          productionsDo: [|:p| p isEpsilonProduction ifTrue: [blk value: p]].
        ).
  }

  { 'parsingRelated'
      "^" first1: symStr = (
          "Compute first1 for the given string of symbols. Note: first1 of
           the empty symbol string is 'epsilon' which is not the empty 
           symbols string."
          | res <- set. |
          res: res copy.
          res add: epsilon.
          symStr do: [|:s|
              res addAll: s first1.
              (s first1 includes: epsilon) ifFalse: [
                  res remove: epsilon.
                  ^ res
              ].
          ].
          res.
        ).
          
      "_" computeFirst1 = (
          "According to p. 189."
          | newSize <- 0. oldSize <- -1. |
          level: 3 Print: '  Computing first1...  '.
          em_symbolsDo:   [|:s| s first1: set copy].    
          em_terminalsDo: [|:s| s first1 add: s].
          "Loop invariant: newSize == total size of first1 for nonterminals."
          [oldSize != newSize] whileTrue: [
              oldSize: newSize.
              newSize: 0.
              productionsDo: [|:p. f1 <- set. |
                  f1: p lhs first1.
                  f1 addAll: (first1: p rhs).
                  newSize: newSize + f1 size.
              ].
          ].
          level: 3 Print: 'done.\n'.
          self.
        ).

      "_" computeFollow1 = (
          "According to p. 189."
          | oldSize <- 0. newSize <- 1. |
          level: 3 Print: '  Computing follow1... '.
          nonterminalsDo: [|:s| s follow1: set copy].    
          startSymbol follow1 add: endMarker.                      "Step 1."
          "Loop invariant: newSize == total size of follow1 for nonterminals."
          [oldSize != newSize] whileTrue: [
              oldSize: newSize.
              newSize: 0.
              productionsDo: [|:p|
                  p rhs do: [|:b. :index. fi1 <- set. fo1 <- set. |
                      b isNonterminal ifTrue: [
                          | beta <- vector. |
                          beta: (p rhs copyFrom: 1 + index).
                          fi1: (first1: beta).
                          fo1: b follow1.
                          fo1 addAll: fi1.                         "Case 2."
                          (fi1 includes: epsilon) ifTrue: [ 
                              fo1 remove: epsilon.
                              fo1 addAll: p lhs follow1.           "Case 3."
                          ].
                          newSize: newSize + fo1 size.
                      ].
                  ].
              ].
          ].
          level: 3 Print: 'done.\n'.
          self.
        ).

      "_" freeFirst1AndFollow1 = (
          "Called when first1/follow1 are no longer needed. 
           To free up memory."
          "Set to nil so we get an error if access is attempted."
          nonterminalsDo: [|:s| s first1: nil. s follow1: nil]. 
          em_terminalsDo: [|:s| s first1: nil]. 
          self.
        ).

      "^" canCloseToEpsilon: nont = ( canCloseToEps at: nont symbolId. ).

      "_" computeCanCloseToEpsilon = (
          "For all nonterminals compute if closing over it can result in
           (non-kernel) items with an epsilon production."
          | changed <- true. |
          canCloseToEps: (vector copySize: em_noOfSymbols FillingWith: false).
          epsilonProductionsDo: [|:p| 
              canCloseToEps at: p lhs symbolId Put: true.
          ].
          [changed] whileTrue: [
              changed: false.
              nonepsilonProductionsDo: [|:p. old <- true. new <- true. |
                  (canCloseToEps at: p lhs symbolId) ifFalse: [
                      (canCloseToEps at: p rhs first symbolId) ifTrue: [
                          canCloseToEps at: p lhs symbolId Put: true.
                          changed: true.
                      ].
                  ].
              ].
          ].
          self.
        ).

      "^" initialSLRItem = ( 
          mango grammars slrItem copyProduction: startProduction 
                            DotIndex: 0 Grammar: self.
        ).

      "^" initialLRItem = (
          mango grammars lrItem copyProduction: startProduction DotIndex: 0 
                       Grammar: self Lookahead: (set copy add: endMarker).
        ).

      "_" isShiftReduce: action1 And: action2 = (
          (action1 isShift && action2 isReduce) ||
          [action2 isShift && action1 isReduce].
        ).

      "_" resolve: action1 Vs: action2 In: state = (
          "Resolve a conflict. First see if the user-supplied conflict
           block will handle it. If not, use default rule."
          | res <- nil. |
          res: (conflictBlk value: action1 With: action2 With: state).
          (isShiftReduce: action1 And: action2) ifTrue: [
              shiftReduceConflicts: 1 + shiftReduceConflicts.
              nil = res ifTrue: [
                  defaultSRResolutions: 1 + defaultSRResolutions.
                  res: (defaultResolve: action1 Vs: action2 In: state).
              ].
          ] False: [
              reduceReduceConflicts: 1 + reduceReduceConflicts.
              nil = res ifTrue: [
                  defaultRRResolutions: 1 + defaultRRResolutions.
                  res: (defaultResolve: action1 Vs: action2 In: state).
              ].
          ].
          logFile isOpen ifFalse: [
              logFile: (logFile openForWriting: logFilename IfFail: [stderr]).
          ].
          logFile write: '\nConflict found in '.
          state pprint: logFile.
          logFile writeLine: action1 printString, '      vs. '. 
          logFile writeLine: action2 printString.
          logFile writeLine: 'choosing the ',
                                  (res = action1 ifTrue: 'former' 
                                   False: 'latter'), ' action.'.
          res.
        ).
        
      "_" defaultResolve: action1 Vs: action2 In: state = (
          "The default conflict resolution rule is the following:
           Resolve shift/reduce conflicts in favor of shifting. 
           For reduce/reduce conflicts pick production with lowest 'prodId'
           (i.e. the first one in the production list)."
          action1 isShift && [action2 isReduce] ifTrue: [^ action1].
          action2 isShift && [action1 isReduce] ifTrue: [^ action2].
          action1 production prodId < action2 production prodId ifTrue: [
              ^ action1.
          ].
          action2.
        ).

      "^" logFilename = ( name, '.conflicts'. ).

      "^" computeParseTable: kind = ( 
          "Compute parse table using the default conflict resolution only."
          yaccDumpOnly ifTrue: [
              yaccDump. 
              error: 'DONE WRITING YACCDUMP'.
          ].
          computeParseTable: kind Conflict: [nil].
        ).

      "^" computeParseTable: kind Conflict: cBlk = (
          "Compute parse table using a 'cBlk' to resolve conflicts.
           'cBlk' is invoked with three arguments whenever a conflict
           is detected:   action1, action2 and state. 'cBlk' must return
           either action1 or action2 to resolve the conflict, or return
           nil to indicate that the default conflict resolution should be
           used to resolve this particular conflict."
          | msg <- ''. |
          conflictBlk: cBlk.
          shiftReduceConflicts:  0.
          reduceReduceConflicts: 0.
          defaultSRResolutions:  0.
          defaultRRResolutions:  0.
          basicComputeParseTable: kind.

          msg: 'Conflict summary:\n'.
          msg: msg, '    ', shiftReduceConflicts printString. 
          msg: msg, ' shift-reduce  ('.
          msg: msg, defaultSRResolutions printString.
          msg: msg, ' resolved by default rules).\n'.

          msg: msg, '    ', reduceReduceConflicts printString. 
          msg: msg, ' reduce-reduce ('.
          msg: msg, defaultRRResolutions printString.
          msg: msg, ' resolved by default rules).\n'.
         
          level: 1 Print: msg.
          0 < (shiftReduceConflicts + reduceReduceConflicts) ifTrue: [
              logFile write: msg. 
              logFilename = logFile name ifTrue: [
                  level: 1 
                  Print: '    Conflicts dumped on file \'',
                         logFilename, '\'\n'.
              ].
          ].
          logFile isOpen && [logFile != stderr] ifTrue: [logFile close].
          compressTable.
          self.
        ).

      "_" basicComputeParseTable: kind = (
          "'kind' must be one of 'SLR(1)', 'LALR(1)', and 'LR(1)'.
           No compression done. According to p. 227/234."
          | stateMachine <- mango grammars lrStateMachine. initItem. | 
          level: 1 Print: 'Computing ', kind, ' parse table for ',
                          printString, '...\n'.
          computeFirst1.
          computeFollow1.
          computeCanCloseToEpsilon.
          parseTableKind: kind.
          stateMachine: (stateMachine copyGrammar: self Kind: kind).
          verifyLALR1 && ['LALR(1)' = kind] ifTrue: [
              | stateMachine2 <- mango grammars lrStateMachine. |
              '  Verifying correctness of LALR(1) state machine... ' printLine.
              stateMachine2: (stateMachine2 copyGrammar: self 
                                                   Kind: 'slow-LALR(1)').
              dump ifTrue: [
                  stateMachine2 pprint.  '' printLine. 
                  stateMachine  pprint.  '' printLine.
              ].
              stateMachine diff: stateMachine2.
          ] False: [
              dump ifTrue: [   "Only dump if not already done above."
                  stateMachine  pprint.  '' printLine.
              ].
          ].
          productionsDo: [|:p| p tbConstructor setReduceActionIn: p].
          filloutTable: stateMachine.
          self.
        ).

      "_" filloutTable: stateMachine = (
          | count <- mango counter.  shifts <- vector. reduces <- vector. |
          level: 2 Print: '  Filling out action/goto table... '.
          count: count copyVisible: noiseLevel >= 2.
          noOfStates:   stateMachine noOfStates.
          initialState: stateMachine initialState id.

          "The same shift and reduce actions can occur in many places in the
           table. To share these, we precompute all possible shift and
           reduce actions. This results in substantial space savings for 
           larger grammars."
          reduces: (reduces copySize: noOfProductions).
          shifts:  (shifts  copySize: noOfStates).
          productionsDo: [|:p| 
              reduces at: p prodId Put: (reduceA copyProduction: p).
          ].
          stateMachine statesDo: [|:state|
              shifts at: state id Put: (shiftA copyState: state id).
          ].

          parseTable: parseTable copySize: noOfStates.
          parseTable mapBy: [vector copySize: em_noOfSymbols].
          stateMachine statesDo: [|:state. row. |
              setActions: state Reduces: reduces Shifts: shifts.     "Case 2."
              setGotoOutOf: state.                                   "Case 3."
              row: (parseTable at: state id).
              em_terminalsDo: [|:sym| "Set remaining action entries to error."
                  nil = (row at: sym symbolId) ifTrue: [
                      row at: sym symbolId Put: errorA copyAction.
                  ].
              ].
              count inc.
          ].
          count hide.
          level: 2 Print: 'done.\n'.
          dump ifTrue: [dumpTable].
          freeFirst1AndFollow1.
          canCloseToEps: vector.    "Free up memory."
          self.
        ).

      "_" setActions: state Reduces: reduces Shifts: shifts = (
          | row <- vector. |
          row: (parseTable at: state id).
          em_terminalsDo: [|:a. to <- mango grammars lrState. |    "Case 2a."
              to: (state goOver: a).
              nil != to ifTrue: [
                  inRow: row AtTerminal: a PutAction: (shifts at: to id) 
                                  State: state.
              ].
          ].
          mango assertSwitch ifTrue: [
              "Verify correctness of 'finalItemsDo:'."
              | final1 <- set. final2 <- set. |
              final1: final1 copy.
              final2: final2 copy.
              state finalItemsDo: [|:item| final1 add: item].
              state itemsDo: [|:item| item dotAtEnd ifTrue: [final2 add: item]].
              final1 != final2 ifTrue: [error: 'bad \'finalItemsDo:\''].
          ].
          state finalItemsDo: [|:item|
              startSymbol != item production lhs ifTrue: [          "Case 2b."
                  item lookahead do: [|:a|
                      inRow: row AtTerminal: a
                                  PutAction: (reduces 
                                                 at: item production prodId)
                                      State: state.
                  ].
              ] False: [                                            "Case 2c."
                  inRow: row AtTerminal: endMarker
                       PutAction: (acceptA copyProduction: startProduction)
                           State: state.
              ].
          ].
          self.
        ).

      "_" inRow: row AtTerminal: term PutAction: a State: state = (
          "Store the given action in the action table. Resolve conflicts using
           'blk' if there is already a different action at the given position."
          | act <- mango parsers action. symId <- 0. |
          symId: term symbolId.
          act: (row at: symId).
          nil = act ifTrue: [act: a].
          act != a  ifTrue: [act: (resolve: act Vs: a In: state)].
          row at: symId Put: act.
          self.
        ).

      "_" setGotoOutOf: state = (
          | row <- vector. |
          row: (parseTable at: state id).
          nonterminalsDo: [|:capA. to <- mango grammars lrState. |
              to: (state goOver: capA).
              nil != to ifTrue: [row at: capA symbolId Put: to id].
          ].
          self.
        ).

      "^" actionsDo: blk = (
          "Iterate 'blk' over all actions in parse table."
          parseTable do: [|:row. :stateId|
              em_terminalsDo: [|:s|
                  blk value: (row at: s symbolId) 
                       With: stateId 
                       With: s symbolId.
              ].
          ].
          self. 
        ).

      "^" acceptOneEarlier = (
          "Add additional accept actions to the previously computed parse
           table. This is mainly used for grammars that are driving
           lexers. In those grammars, the top productions are

                <start>   ->  <second>
                <second>  ->  <token1>
                <second>  ->  <token2>
                <second>  ->  <token3>
                  ...           ...

           By changing the reduce on the <start> -> <tokeni> productions
           to accept actions we can stop parsing one step earlier. 
           More important than saving a parser step, the last reduction 
           (which is the newly introduced accept) directly tells which 
           token was found. Of course, letting the parser run till normal 
           completion would in principle be just as good. But we would 
           have to use the second-last reduction to determine which token 
           was found. Keeping continuously track of the last two reductions 
           is potentially expensive, which is why we change them to accept 
           actions instead. 
           The final change we do to the parse table is to change the
           accepts on    <start>  ->  <second>    to be simple reduces. This
           is harmless, since the action will never be executed (some
           <second>  ->  <tokeni>  will accept first), but it does eliminate
           an (impossible) type from the set of output types that the parser
           can produce.
           See also comment in 'compressTable'."
          | second <- mango symbols nonterminal. red.
            accepts <- vector. |
          "We replace original accept actions with this reduce action."
          red:  (reduceA copyProduction: startProduction).
          second: startProduction rhs first.
          accepts: (accepts copySize: noOfProductions).
          second productions do: [|:p|
              accepts at: p prodId Put: (acceptA copyProduction: p).
          ].
          "Verify that all <second> productions are of the simple form 
           shown above, and that <second> appears only on the rhs of the 
           start production."
          productionsDo: [|:p|
              (p != startProduction) && [p rhs includes: second] ifTrue: [
                  error: 'can\'t complete \'acceptOneEarlier\'; production ',
                         p printString, ' violates assumption'.
             ].
          ].
          actionsDo: [|:action. :rowIdx. :colIdx|
              action isReduce && [second = action production lhs] ifTrue: [
                  (parseTable at: rowIdx) 
                     at: colIdx Put: (accepts at: action production prodId).
              ].
              action isAccept && 
              [startProduction = action production] ifTrue: [
                  (parseTable at: rowIdx) at: colIdx Put: red.
              ].
          ].
          self.
        ).

      "_" compressTable = (
          "Simple compression: find equal elements (rows) and make them be 
           identical (shared). NB: If a more fancy compression is implemented,
           it may become necessary to restrict compression to be done *after*
           'acceptOneEarlier' and 'acceptOnNonEndMarker' has been called."
          | rows <- set. count <- mango counter. |
          rows: (rows copy desiredMinCapacity: parseTable size).
          level: 2 Print: '  Compressing parse table... '.
      false ifTrue: [                                      "Search for 171292."
          count: count copyVisible: noiseLevel >= 2.
          parseTable mapBy: [|:row|
              count inc.
              (rows includes: row) ifTrue: [rows at: row]
                                    False: [rows add: row. row].
          ].
          count hide.
          level: 2 Print: 'done.  Reduction: ',
                          noOfStates printString, ' -> ',
                          rows size  printString, ' rows.\n'.
      ] False: ['Not compressing parse table.' printLine].
          self.
        ).

      "_" print: str Width: n = (
          | str2 <- ''. |
          str2: (n < str size ifTrue: [str copySize: n] False: [str]).
          ('' copySize: n - str2 size FillingWith: ' ') print.
          str2 print.
          self.
        ).

      "^" dumpTable = (
          | width <- 5. oProds <- vector. |
          '' printLine. 
          "Print productions in order."
          'productions: ' printLine.
          oProds: oProds copySize: noOfProductions.
          productionsDo: [|:p| oProds at: p prodId Put: p].
          oProds do: [|:p| p prodId print. ':\t' print. p printLine.].
          '' printLine.
          em_symbolsDo: [|:s|
              s shortPrintString print. 
              ' = ' print. 
              s printLine.
          ].
          '' printLine.
          print: 'Symbol' Width: width +  6.
          print: 'first'  Width: width + 20.
          print: 'follow' Width: width + 20.
          '' printLine.
          nonterminalsDo: [|:s| 
              print: s shortPrintString    Width: width +  6.
              print: s first1  printString Width: width + 20.
              print: s follow1 printString Width: width + 20.
              '' printLine.
          ].
          '' printLine.
          print: '' Width: width.
          em_terminalsDo: [|:s| print: s shortPrintString Width: width].
          '  ' print.
          nonterminalsDo: [|:s| print: s shortPrintString Width: width].
          '' printLine.
          parseTable do: [|:row. :stateid|
              print: stateid printString Width: width.
              em_terminalsDo: [|:s. action. | 
                  action: (row at: s symbolId).
                  action isShift ifTrue: [
                      print: ('s', action state printString) Width: width.
                  ].
                  action isReduce && [action isAccept not] ifTrue: [ 
                      print: ('r', action production prodId printString) 
                      Width: width.
                  ].
                  action isAccept ifTrue: [print: 'acc' Width: width].
                  action isError  ifTrue: [print: ''    Width: width].
              ].
              '  ' print.
              nonterminalsDo: [|:s. to. |
                  to: (row at: s symbolId).
                  nil != to ifTrue: [print: to printString Width: width]
                             False: [print: ''             Width: width].
              ].
              '' printLine.
          ].
          self.
        ).

      "^" yaccDump = (
          "Dump this grammar onto a file named 'name.yacc' (where name is
           the name of this grammar). The dump is in a format that can be
           processed by yacc. Mostly for debugging this code and concrete
           grammars."
          | yf <- os_file. yfname <- ''. linelen = 80. col <- 9999. 
            terminalSuffix    = '0'.   "These are used to make nonterms"
            nonterminalSuffix = '1'.   "and terms distinct."
          |
          yfname: name, '.yacc'.
          'Dumping grammar to file \'' print. yfname print. '\'... ' print.
          yf: (yf openForWriting: yfname).
          yf writeLine: '%{'.
          yf writeLine: '   /* This is a dump from ', printString, '. */'.
          yf writeLine: '%}'.
          yf writeLine: ''.
          terminalsDo: [|:s. str <- ''. | 
              str: s yaccName, '  '.
              (col + str size) >= linelen ifTrue: [
                  yf writeLine: ''.
                  yf write: '%token '. 
                  col: '%token' size.
              ].
              yf write: str.
              col: col + str size.
          ].
          yf writeLine: ''.
          yf writeLine: ''.
          yf writeLine: '%start ', startSymbol yaccName.
          yf writeLine: ''.
          yf writeLine: '%%'.
          nonterminalsDo: [|:s. first <- true. |
              yf writeLine: s yaccName, ':'.
              s productions do: [|:p|
                  yf write: '  ', (first ifTrue: '    ' False: '|   ').
                  p rhs do: [|:x| yf write: x yaccName, '  '].
                  yf writeLine: ''.
                  first: false.
              ].
              yf writeLine: '  ;'.
              yf writeLine: ''.
          ].
          yf writeLine: '%%'.
          yf close.
          'done.' printLine.
          self.
        ).
  }
| )
    
mango grammars grammar _Define: ( |
      {} = 'IsComplete: '.
  "_" parent*         = traits mango grammars grammar.
  "^" dump           <- false.  "If true, dump table and state machine."
  "^" verifyLALR1    <- false.  "If true, compute LALR(1) table in two diff. 
                               ways and compare results. For debugging; slow."
  "^" yaccDumpOnly   <- false.  "If true, dump grammar on file and stop."
 "^_" name           <- 'some_grammar'.
  "_" nonterminals   <- vector. "All nonterminal symbols."
  "_" terminals      <- vector. "All term. syms; incl endMarker, excl epsilon."
                              "endMarker and epsilon are grammar specific."
  "_" canCloseToEps  <- vector. "Map symbol to boolean."

                      "All endmarkers must have this same kind."
 "^_" endMarker      <- mango symbols terminal 
                        copyKind: 'endMarker_internal0000'. 

 "^_" epsilon        <- (mango symbols terminal 
                        copyKind: '#epsilon#_internal0000') symbolId: -1.  
                                      "Any unique 'symbolId' will do.        "

 "^_" shiftReduceConflicts  <- -1.      "Defined after computing parse table.  "
 "^_" reduceReduceConflicts <- -1.      "          ----- || -----              "
 "^_" defaultSRResolutions  <- -1.      "          ----- || -----              "
 "^_" defaultRRResolutions  <- -1.      "          ----- || -----              "
 "^_" noOfStates            <- -1.      "          ----- || -----              "
 "^_" noOfProductions       <- -1.      "          ----- || -----              "
 "^_" initialState          <- -1.      "Initial state for parser to start in. "
 "^_" parseTableKind        <- 'none'.  "Set to 'SLR(1)', 'LR(1)', or 'LALR(1)."
 "^_" parseTable            <- vector.  "Indexed by states."
  "^" stGrammar             <- nil.     "Backlink to stGrammar, if this grammar
                                       is derived from a stGrammar."
  "^" shiftA  <- mango parsers shift. "Prototypes for actions put in parse   "
  "^" acceptA <- mango parsers accept."table. Can be replaced with other     "
  "^" reduceA <- mango parsers reduce."actions to obtain non-standard        "
  "^" errorA  <- mango parsers error. "behavior of parser.                   "

  "_" conflictBlk.                      "For conflict resolution."
  "_" logFile <- os_file.              "Conflict resolution log."
 "^_" terminalClasses <- dictionary.    "Set in lex grammar using char classes."
| )
