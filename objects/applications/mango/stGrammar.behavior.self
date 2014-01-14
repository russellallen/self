"Sun-$Revision: 30.6 $"
 
"Copyright 1992-2012 AUTHORS.
 See the LICENSE file for license information."
 

( | 
  "_" parent* = traits oddball.
    
    "shared_behavior describes slots to be added to the common ancestor 
     (traits) of all tree nodes. This is the 'stGramNode traitsSkeleton' 
     in the 
     'stGrammar' object. shared_behavior_proto describes slots to be added 
     to 'stGramNode protoSketon'. 
     These slots will be copied down into all concrete
     tree nodes."

  "^" shared_behavior = ( |
      "_" productionNameSpace* = mango productions.   "For easy access."
      "_" tracer*              = mixins mango tracer.
      "_" whitespaceToken_kind = 'whitespace'.          "For whitespaceFilter."

      "_" lexerBehavior* = ( |
          "^" internalNamePrefix = 'lex_internal0000'.
          "_" isInternalName: n  = ( internalNamePrefix isPrefixOf: n ).
          "_" vector1: elm       = ( vector copySize: 1 FillingWith: elm. ).
          "_" unifyWith: ntName2 = ( unify: ntName And: ntName2 ).
          "^" nullify            = ( self. ).
          "^" lexerSymbol        = ( lexerSymbol:  ntName. ).
          "^" lexerNonterm       = ( lexerNonterm: ntName. ).

          "^" lexerNonterm: name = (
              "Return a nonterminal."
              | eff <- ''. nt <- mango symbols nonterminal. |
              "Some of the productions in the lexer are results of inline
               tokens defined inline in the syntax grammar. These productions
               will have lhs's whose name ('name') is not in the 'replMap'
               dictionary. That is why the 'IfAbsent:' part is included 
               below."
              eff: (replMap at: name IfAbsent: [name]).
              lexk2n if: eff IsPresentDo: [|:n| nt: n]
                             IfAbsentPut: [nt: (nt copyKind: eff). nt]
                                   AndDo: [].
              nt copy.
            ).

          "^" lexerSymbol: name = (
              "If 'name' represents something that is a single character,
               then return the corr. terminal; else return a
               nonterminal. This is for use on rhs's of productions.
               The terminal is preferred since it is simpler and gives
               a parser that makes fewer reductions."
              | eff <- ''. |
              eff: (replMap at: name IfAbsent: [name]).
              (literals includesKey: eff) ifTrue: [
                  ^ terminalOfKind: (literals at: eff).
              ].
              lexerNonterm: name.
            ).

          "_" stringProdForStr: str WithLHS: lhsName = (
              | rhs <- vector. other. |
              "Share if another lexer nonterminal already derives 'str'."
              other: (literalStringProds at: str IfAbsent: nil).
              nil != other ifTrue: [ "Yes!  simple do  <me> ::= <other>."
                  rhs: (vector1: (lexerSymbol: other)).
              ] False: [             "No. Do   <me>  ::=  'f' 'i' 's' 'h'"
                  rhs: (rhs copySize: str size).
                  str do: [|:ch. :idx| 
                      rhs at: idx Put: (terminalOfKind: ch).
                  ].
                  literalStringProds at: str Put: lhsName.
              ].
              production copyLHS: (lexerNonterm: lhsName) RHS: rhs.
            ).

          "_" terminalOfKind: ch = (
              | res <- mango symbols terminal. |
              lexk2t if: ch IsPresentDo: [|:r| res: r]
                            IfAbsentPut: [res: (res copyKind: ch). res]
                                  AndDo: [].
              res: res copy.
              res isTerminal ifFalse: [
                  error: 'kind used as both terminal and nonterminal: \'',
                         ch, '\''. 
              ].
              res.
            ).

          "_" unify: ntName1 And: ntName2 = (
              | eff1 <- ''. eff2 <- ''. |
              eff1: (replMap at: ntName1).   "Old representative."
              eff2: (replMap at: ntName2).   "Representative of merge."
              (isInternalName: eff1) not && [isInternalName: eff2] ifTrue: [
                  unify: ntName2 And: ntName1.
              ].
              (isInternalName: eff1) ifTrue: [
                  | lit1 <- ''. lit2 <- ''. |
                  lit1: (literals at: eff1 IfAbsent: nil).
                  lit2: (literals at: eff2 IfAbsent: nil).
                  (nil != lit1) && [nil != lit2] && [lit1 != lit2] ifTrue: [
                      error: 'should not unify different literals'.
                  ].
                  nil != lit1 ifTrue: [
                      literals removeKey: eff1.
                      literals at: eff2 Put: lit1.
                  ].
                  replMap at: ntName1 Put: eff2.
                  replMap mapBy: [|:v. :k| v = eff1 ifTrue: eff2 False: v].
                  nullified: true.
              ].
              self.
            ).
    
          "_" unifyWithLiteral: lit = (
              (isInternalName: ntName) ifTrue: [
                  literals at: (replMap at: ntName) Put: lit.
                  nullified: true.
              ].
              self.
            ).

          "_" listNullify = (
              1 = elements size ifTrue: [unifyWith: elements first ntName].
              self.
            ).
    
          "^" setNameDefault: defName Names: names = (
              "Sends that fall through to here are for nodes with no 
               productions in; they also have no 'ntName' slot."
              self.
            ).

          "_" setMyNtNameTo: name = (
              ntName: name.
              replMap at: ntName Put: ntName.
              self.
            ).

          "_" myProdsDo: blk = ( 
             "Not all nodes result in a productions, but those that do, 
	      specialize this method to iterate over them."
              self. 
            ).

          "_" epsilonProduction = (
              production copyLHS: lexerNonterm RHS: vector copy.
            ).
           
          "_" production: rhs1 = (
              production copyLHS: lexerNonterm RHS: (vector1: rhs1).
            ).
           
          "_" production: rhs1 With: rhs2 = (
              production copyLHS: lexerNonterm 
                             RHS: (vector1: rhs1), (vector1: rhs2).
            ).
    
          "^" addProductionTo: prodList  = (
              nullified ifFalse: [myProdsDo: [|:prod| prodList addLast: prod]].
              self.
            ).
        | ).
    | ).
   
  "^" shared_behavior_proto = ( | 
      "^" synk2t    <- dictionary. "Map syntax grammar kinds 2 terminal."
      "^" synk2n    <- dictionary. "Map syntax grammar kinds 2 nonterminal."
      "^" lexk2t    <- dictionary. "Map lex    grammar kinds 2 terminal."
      "^" lexk2n    <- dictionary. "Map lex    grammar kinds 2 nonterminal."
      "^" nullified <- false.     
      "^" replMap   <- dictionary.
      "^" literals  <- dictionary.
      "^" literalStringProds <- dictionary.
    | ).


  "^" start = ( | 
      "^" gramName = ( name token source eval. ).

      "^" yaccDump = (
          "For debugging."
          computeGrammars.
          synGrammar grammar yaccDump.
          lexGrammar         yaccDump.
          self.
        ).

      "^" makeParser = (
          | pipe <- mango parsers parserPipeline.  |
          computeGrammars.
          pipe: makeLexerPipe.
	  " This hook is here for when we integrate the Self C preprocessor"
	  " It is not working yet -- dmu"
          (isOptionSet: 'cppFilter') ifTrue: [
              pipe -> parsing parsers cppFilter copy.
          ].
          (isOptionSet: 'typedefKludge') ifTrue: [
              pipe -> mango parsers typedefFilter copy.
          ].
          pipe -> synParser.
        ).

      "_" makeLexerPipe = (
          "NB: This method uses the 'synParser'."
          | streamer         <- mango parsers charStreamer.
            lexParser        <- mango parsers lrParser.
            whitespaceFilter <- mango parsers whitespaceFilter.
            pipe             <- mango parsers parserPipeline.
          |
          streamer: streamer copy.
          pipe: pipe copy.
          lexParser: (lexParser copyGrammar: lexGrammar).
          lexParser setAcceptOnNonEndMarker.
          pipe -> streamer -> lexParser.
          (pipe lastParser outputTypes includesKey: whitespaceToken_kind) && 
          [(synParser inputTypes includesKey: whitespaceToken_kind) not] 
          ifTrue: [
              level: 2 Print: 'Inserting whitespaceFilter.\n'.
              pipe -> (whitespaceFilter copyEatingKind: whitespaceToken_kind).
          ].
          nil != keywordRecognizer ifTrue: [pipe -> keywordRecognizer].
          pipe.
        ).

      "_" computeGrammars = (
          level: 2 Print: 'Processing structured grammar ', gramName, '...\n'. 
          initializeSharedStuff.
          computeSynGrammar.
          computeLexGrammar.
        ).

      "_" computeSynGrammar = (
          | synGrammarProductions <- list. |
          synGrammarProductions: syntaxPart getProductions.
          "Now synk2s has been set."
          synGrammar: 
              (synGrammar copyName: gramName, '-syntax'
                       Productions: synGrammarProductions
                   Transformations: syntaxPart prologue getTransformations
                          Behavior: behavior).
          synGrammar grammar computeParseTable: 
                   syntaxPart prologue getParseTableKind.
          synParser: (synParser copyGrammar: synGrammar grammar).
          self.
        ).

      "_" testLiteralsForLexer: forLexer ForKWR: forKWR = (
          | lexer. |
          keywordRecognizer: nil.   "'makeLexerPipe' uses this one."
          lexer: makeLexerPipe.
          level: 1 Print: 'Test-lexing to partition literal terminals\n'.
          synGrammar literalTerminalKinds do: [|:lit. isForLexer <- false. |
              level: 3 Print: '    \'', lit, '\': \t'. 
              lexer parseString: lit IfFail: [isForLexer: true].
              lexer hasMoreInput     ifTrue: [isForLexer: true].
              mango assert: [
                  isForLexer || [lexer output source = lit].
                  "If not for the lexer, then source must match literal."
              ].
              isForLexer ifTrue: [
                  level: 3 Print: ' directly lexed\n'.
                  forLexer add: lit.
              ] False: [
                  lit = lexer output token_kind ifTrue: [
                      level: 3 Print: ' already in lex grammar\n'.
                  ] False: [
                      level: 3 Print: ' lexed as \'', 
                                      lexer output token_kind, '\'\n'.
                      forKWR add: lexer output token_kind @ lit.
                  ].
              ].
          ].
          self.
        ).

      "_" computeLexGrammar = (
          "Computing the lexGrammar is slightly more tricky, since we have
           to figure out which literals to recognize directly and which to
           recognize using a 'keywordRecognizer'. Figuring this out takes
           three steps: 
              1. Make a lexer that doesn't handle any of the literals 
                 explicitly.
              2. Use this lexer to lex all the literals:
                    if it lexes a given literal, this literal should be
                    handled by a 'keywordRecognizer', otherwise the lexer
                    should handle it.
              3. Create new lexer using the information obtained in step 2.
          "
          | forKWR <- set. forLexer <- set. |
          computeLexGrammarLiterals: set copy.   "Step 1."
          1 = lexGrammar noOfProductions ifTrue: [
              "If there was only one production in the lex grammar,
               it means that the user specified an empty lex part. In
               this case we don't need a keyword recognizer and can
               simply ask the lexer to recognize all the literals in
               the syntax grammar."
              forLexer: synGrammar literalTerminalKinds.
              forKWR: set.
          ] False: [
              forKWR: forKWR copy.
              forLexer: forLexer copy.     
              testLiteralsForLexer: forLexer ForKWR: forKWR.   "Step 2."
          ].
          forLexer isEmpty not ifTrue: [    "Step 3."
              computeLexGrammarLiterals: forLexer.
          ].
          forKWR isEmpty not ifTrue: [
              keywordRecognizer: (mango parsers keywordRecognizer 
                                  copyMap: forKWR).
          ].
          self.
        ).

      "_" whitespaceToken_id: gram IfAbsent: blk = (
          gram kind2nonterminal: whitespaceToken_kind IfAbsent: [| res. |
              res: (gram kind2terminal: whitespaceToken_kind IfAbsent: [
                  ^ blk value.
              ]).
              warning: 'Token kind \'', whitespaceToken_kind, 
                       '\' is a terminal'.
              res.
          ].
        ).

      "_" computeLexGrammarLiterals: gramLiterals = (
          | lexProds <- list. |
          lexProds: lexPart getPrimaryProductions. 
          lexPart addRestOfProductions: gramLiterals To: lexProds.

          lexGrammar: 
              (lexGrammar copyName: gramName, '-lex'
                       Productions: lexProds
                   Transformations: lexPart prologue getTransformations).
          lexGrammar shiftA:  mango parsers simpleShift  copyAction.
          lexGrammar reduceA: mango parsers simpleReduce copyAction.
          lexGrammar acceptA: mango parsers simpleAccept copyAction.
          lexGrammar acceptA 
            setWhitespaceToken_id: (whitespaceToken_id: lexGrammar 
                                              IfAbsent: 9999)
                       Token_kind: whitespaceToken_kind.
          lexGrammar computeParseTable: lexPart prologue getParseTableKind.
          lexGrammar acceptOneEarlier.
          self.
        ).

      "_" initializeSharedStuff = (
          | bf <- ''. |
          bf: behaviorFile token source eval.
          behavior: (bf _RunScriptIfFail: [
              ('Warning: could not load behavior \'', bf, '\'') printLine.
              ().  "Use empty object for behavior."
          ]).
          synk2t: synk2t copyRemoveAll.
          synk2n: synk2n copyRemoveAll.
          lexk2t: lexk2t copyRemoveAll.
          lexk2n: lexk2n copyRemoveAll.
          replMap: replMap copyRemoveAll.
          literals: literals copyRemoveAll.
          literalStringProds: literalStringProds copyRemoveAll.
          prefix_walk_do: [|:node| 
              node synk2t:    synk2t.
              node synk2n:    synk2n.
              node lexk2t:    lexk2t.
              node lexk2n:    lexk2n.
              node replMap:   replMap.
              node literals:  literals.
              node literalStringProds: literalStringProds.
          ].
          self.
        ).

      "^" optionsDo: blk = (
          "Iterate 'blk' over all the strings that are in the option part."
          optionsPartOpt opt_is_present ifTrue: [
              optionsPartOpt optionsPart options elements do: [|:option|
                  blk value: option token source eval.
              ].
          ].
          self.
        ).

      "^" isOptionSet: optionName = (
          optionsDo: [|:str| str = optionName ifTrue: [^ true]].
          false.
        ).
    | ).

  "^" start_proto = ( |
      "_" behavior   <- ().
      "_" synGrammar <- mango grammars stGrammar.    "Set by computeGrammars."
      "_" synParser  <- mango parsers lrParser.      "Set by computeGrammars."
      "_" lexGrammar <- mango grammars grammar.      "Set by computeGrammars."
      "_" keywordRecognizer <- nil.             "Will be set non-nil if needed."
    | ).

  "^" prologue = ( |
      "^" getParseTableKind = ( parseTableKind token source. ).

      "^" getTransformations = (
          transformsOpt opt_is_present ifTrue: [
              transformsOpt transforms transNames elements copy mapBy: [|:e|
                  e trans token source eval.
              ].
          ] False: [
              list copy.
          ].
        ).
    | ).

  "^" syntaxPart  = ( | "^" getProductions = ( productions prods ). | ).
  "^" productions = ( | "^" prods = ( elements copy mapBy: [|:e| e prod]. ). | ).
  "^" production0 = ( | "^" prod = ( production prod. ). | ).

  "^" alternation = ( | 
      "^" prod = ( 
          altProduction copyLHS: lhs sym Alternatives: alternatives syms.
        ). 
    | ).

  "^" construction = ( | 
      "^" prod = ( 
          conProduction copyLHS: lhs sym RHS: symbols syms.
        ). 
    | ).

  "^" lst0 = ( |
      "^" prod = ( 
          lst0Production copyLHS: lhs sym Element: elm sym Separator: sep sym.
        ).
    | ).

  "^" lst1 = ( |
      "^" prod = ( 
          lst1Production copyLHS: lhs sym Element: elm sym Separator: sep sym.
        ).
    | ).

  "^" optional = ( |
      "^" prod = ( 
          optProduction copyLHS: lhs sym Element: elm sym.
        ). 
    | ).

  "^" alternatives = ( | "^" syms = ( elements copy mapBy: [|:elm| elm sym] ). | ).

  "^" symOpt = ( |
      "^" sym = ( 
          opt_is_present ifTrue: [symbol sym] False: [nil]. 
        ). 
    | ).

  "^" symbols = ( | "^" syms = ( elements copy mapBy: [|:elm| elm sym]. ). | ).

  "^" symbol = ( |
      "_" symKind2sym: synk2s Proto: proto = ( 
          | res <- mango symbols symbol. kind0 <- ''. |
          kind0: getKind.
          synk2s if: kind0 IsPresentDo: [|:r| res: r]
                           IfAbsentPut: [res: (proto copyKind: kind0). res]
                                 AndDo: [].
          res: (res copy tag: getTag).
          res.
        ).

      "^" getTag  = ( getKind. ).
    | ).

  "^" literalTerm = ( |
      "^" sym = ( 
          (symKind2sym: synk2t Proto: mango symbols terminal) 
          isLiteral: true.
        ).

      "^" getKind = ( string core. ).
    | ).

  "^" terminal = ( |
      "^" sym = ( 
          (symKind2sym: synk2t Proto: mango symbols terminal) 
          isLiteral: false.
        ).

      "^" getKind = ( kind token source. ).
    | ).

  "^" nonterminal = ( |
      "^" sym = ( symKind2sym: synk2n Proto: mango symbols nonterminal. ).
      "^" getKind = ( kind token source. ).
    | ).

  "^" terminalT    = ( | "^" getTag = ( tag token source. ). | ).
  "^" nonterminalT = ( | "^" getTag = ( tag token source. ). | ).

  "^" lexPart = ( |
      "^" getPrimaryProductions = (
          "Return productions in a structured grammar equiv. to the lex spec."
          | prods <- list. |
          lexk2t  removeAll.
          lexk2n  removeAll.
          replMap removeAll.
          literals removeAll.
          literalStringProds removeAll.
          setNames.
          optimizeLexGrammar.
          prods: prods copy.
          lexdefs prefix_walk_do: [|:node| node addProductionTo: prods].
          prods.
        ).

      "^" addRestOfProductions: gramLiterals To: lexProds = (
          | kinds <- set. usedKinds <- set. msg <- ''. |
          usedKinds: usedKinds copy.
          lexProds do: [|:p| usedKinds add: p lhs kind].
          gramLiterals do: [|:literalKind|
              (usedKinds includes: literalKind) ifTrue: [
                  '' != msg ifTrue: [msg: msg, ', '].
                  msg: msg, '\'', literalKind, '\''.
              ].
          ].
          '' != msg ifTrue: [
              error: 'Grammar literal kinds conflict with lexer kinds: ', msg.
          ].
          gramLiterals do: [|:kind|
              lexProds addFirst: (stringProdForStr: kind WithLHS: kind).
          ].

          "Now finally add all the 'second level' productions and the start
           production."
          kinds: gramLiterals copy.
          kinds addAll: lexdefs getKinds.
          kinds: kinds asVector.
          kinds do: [|:kind. ls. |
              ls: (lexerSymbol: kind).
              ls isNonterminal ifTrue: [
                  ls dontInline: true.  "Protect from inlining, so that
                                         'acceptOneEarlier' can work."
              ].
              lexProds addFirst: (production copyLHS: lexerNonterm
                                                 RHS: (vector1: ls)).
          ].
          lexProds addFirst: 
            (production copyLHS: (lexerNonterm: 'start', internalNamePrefix)
                            RHS: (vector1: lexerNonterm)).
          self.
        ).

      "_" optimizeLexGrammar = (
          "Optimize away 'stupid' productions like <x> -> <y>."
          "This method is a bit slow."
          "' optimizeLexGrammar.' printLine."
          prefix_walk_do: [|:node| node nullify].
          "replMap  do: [|:v. :k. | k print. '  ==>  ' print. v printLine].
           literals do: [|:v. :k. | k print. '  ==>  ' print. v printLine]."
          "' done optimizeLexGrammar.' printLine."
          self.
        ).

      "^" setNameDefault: defName Names: names = ( setMyNtNameTo: defName ).

      "_" setNames = (
          | ncount <- 100. names <- set. |
          names: names copy.
          suffix_walk_do: [|:node| "Generate names for all subexps"
              node nullified: false.
              node setNameDefault: internalNamePrefix, ncount printString
                            Names: names.
              ncount: 1 + ncount.
          ].
          "'replMap size = ' print. replMap size printLine."
          self.
        ). 
    | ).

  "^" lexPart_proto = ( | ntName <- ''. | ).

  "^" lexdefs = ( |
      "^" getKinds = (
          | kinds <- list. |
          kinds: kinds copy.
          elements do: [|:e| 
              e binder is_external ifTrue: [kinds add: e regExp ntName].
          ].
          kinds.
        ).
    | ).

  "^" lexdef = ( |
      "^" setNameDefault: defName Names: names = ( 
          "For named definitions, push the name down to the 'regExp' 
           and check unique."
           "suffix_walk, i.e. terminal node has already been processed."
          regExp ntName: regExpName ntName.
          (names includes: regExp ntName) ifTrue: [
              error: 'two lex defs with same name: \'', regExp ntName, '\''.
          ].
          names add: regExp ntName.
          self.
        ).
    | ).

  "^" regExp = ( |
      "_" myProdsDo: blk = (
          elements do: [|:e| blk value: (production: e lexerSymbol)].
        ).

      "^" nullify = ( listNullify. ).
      "^" setNameDefault: defName Names: names = ( setMyNtNameTo: defName ).
    | ).

  "^" regExp_proto = ( | ntName <- ''. | ).

  "^" term = ( |
      "_" myProdsDo: blk = (
          blk value: (production copyLHS: lexerNonterm RHS: 
                      (elements asVector copy mapBy: [|:e| e lexerSymbol])).
        ).

      "^" nullify = ( listNullify. ).
      "^" setNameDefault: defName Names: names = ( setMyNtNameTo: defName ).
    | ).

  "^" term_proto = ( | ntName <- ''. | ).

  "^" factor = ( |
      "_" myProdsDo: blk = (
          "There are four cases here:
             1. A  =  B   Productions:  A ::= B.
             2. A  =  B?  Productions:  A ::= B  | <epsilon>.
             3. A  =  B+  Productions:  A ::= AB | B.
             4. A  =  B*  Productions:  A ::= AB | <epsilon>.
           Case 1 is often nullified away.
           IMPORTANT point: since reduce/reduce conflicts are resolved in
           favour of the production that occurs first in the list of
           productions, it is important that the 'recursive' A productions
           occur first. That way we obtain that the lexer goes for the longest
           match possible. E.g. instead of lexing 11 as two separate 
           one digit integers it will be lexed as one single two digit
           integer.
          "
          unaryOpOpt opt_is_present ifFalse: [ "Case 1."
              blk value: (production: base lexerSymbol).
              ^ self.
          ].
          unaryOpOpt unaryOp is_lexoptional ifTrue: [ "Case 2."
              blk value: (production: base lexerSymbol).
              blk value: epsilonProduction.
              ^ self.
          ].
          unaryOpOpt unaryOp is_closure1 ifTrue: [ "Case 3."
              blk value: (production: lexerNonterm With: base lexerSymbol).
              blk value: (production: base lexerSymbol).
              ^ self.
          ].
          unaryOpOpt unaryOp is_closure0 ifTrue: [ "Case 4."
              blk value: (production: lexerNonterm With: base lexerSymbol).
              blk value: epsilonProduction.
              ^ self.
          ].
          error: 'missing case'.
        ).

      "^" nullify = (
          unaryOpOpt opt_is_present ifFalse: [unifyWith: base ntName].
          self.
        ).

      "^" setNameDefault: defName Names: names = ( setMyNtNameTo: defName ).
    | ).

  "^" factor_proto = ( | ntName <- ''. | ).

  "^" regExpName = ( |
      "^" setNameDefault: defName Names: names = ( 
          setMyNtNameTo: terminalNT getKind.
        ).
    | ).

  "^" regExpName_proto = ( | ntName <- ''. | ).
          
  "^" parenExp = ( |
      "_" myProdsDo: blk = ( blk value: (production: regExp lexerSymbol). ).
      "^" nullify = ( unifyWith: regExp ntName. ).
      "^" setNameDefault: defName Names: names = ( setMyNtNameTo: defName ).
    | ).

  "^" parenExp_proto = ( | ntName <- ''. | ).

  "^" string = ( |
      "_" myProdsDo: blk = ( 
          blk value: (stringProdForStr: token source eval WithLHS: ntName).
        ).

      "^" nullify = (
          | str <- ''. |
          str: token source eval.
          1 = str size ifTrue: [unifyWithLiteral: str].
          self.
        ).

      "^" core = ( token source eval. "Use eval to interpret esc sequences." ).
      "^" setNameDefault: defName Names: names = ( setMyNtNameTo: defName ).
    | ).

  "^" string_proto = ( | ntName <- ''. | ).

  "^" charSet = ( |
      "^" setNameDefault: defName Names: names = ( setMyNtNameTo: defName ).

      "_" myProdsDo: blk = ( 
          | n <- 0. |
          chars do: [|:ch| blk value: (production: (terminalOfKind: ch))].
          self.
        ).

      "^" nullify = (
          1 = chars size ifTrue: [unifyWithLiteral: chars first].
          self.
        ).

      "_" chars = (
          | res <- ''. complement <- false. cmpl <- set. |
          nil != myChars ifTrue: [^ myChars].
          myChars: set copy.
          res: (interpretEscSequences: token source).
          res first = '^' ifTrue: [complement: true. res: res copyFrom: 1].
          res: (interpretRanges: res).
          res do: [|:ch| myChars add: ch].
          complement ifTrue: [
              cmpl: cmpl copy.
              mango asciiSize do: [|:i. ch| 
                  ch: i asCharacter. 
                  (myChars includes: ch) ifFalse: [cmpl add: ch].
              ].
              myChars: cmpl.
          ].
          myChars: myChars asString.
          myChars.
        ).

      "_" interpretEscSequences: src = (
          | res <- ''. nob <-''. i <- 0. hasMinus <- false. |
          "Deal with escaped ']' by simple dropping the preceeding '\\'
           Deal with escaped '-' by dropping both the preceeding '\\' and
           the minus, but finishing by adding '-' to the start of res."
          nob: ''.
          i: 0.
          [i < (src size - 1)] whileTrue: [| s2 <- ''. |
              s2: src copyFrom: i UpTo: 2 + i.
              s2 = '\\]' ifTrue: [
                  nob: nob, ']'.
                  i: 2 + i. 
              ] False: [
              s2 = '\\-' ifTrue: [
                  hasMinus: true.
                  i: 2 + i.
              ] False: [
              s2 = '\\\\' ifTrue: [
                  nob: nob, s2.
                  i: 2 + i.
              ] False: [
                  nob: nob, s2 first.
                  i: 1 + i.
              ]]].
          ].
          i < src size ifTrue: [nob: nob, src last].

          "Other escape sequences are interpreted by transforming  from 
           [fisk] to 'fisk' and doing an eval. Internal quotes will be
           escaped before the eval. e.g. [don't] becomes 'don\'t'. Result 
           will not have surrounding quotes."
          res: nob copySize: nob size + (nob occurrencesOf: '\'').
          i: 0.
          nob do: [|:ch. :idx| 
              ch = '\'' ifTrue: [res at: idx + i Put: '\\'. i: 1 + i].
              res at: idx + i Put: ch.
          ].
          res at: 0            Put: '\''.     "Enclose in single quotes."
          res at: res size - 1 Put: '\''.   
          res: res eval.                      "Interpret escape sequences."
          hasMinus && [res first != '-'] ifTrue: [res: '-', res].
          res.
        ).
    
      "_" interpretRanges: body = (
          "Expand all ranges, e.g. 'a-e' becomes 'abcde'. An initial minus
           is left unchanged so if you want to include '-' in a charset
	   you should put it first."
          | noMinus <- ''. i <- 0. |
          i: 1.                                "Now interpret ranges ('-')."
          noMinus: '', body first asString.
          [i < body size] whileTrue: [
              | ch <- 'x'. |
              ch: (body at: i).
              i: 1 + i.
              ('-' = ch) && [i < body size] ifTrue: [
                  noMinus last asByte upTo: 1 + (body at: i) asByte Do: [|:c|
                      noMinus: noMinus, c asCharacter asString.
                  ].
                  i: 1 + i.
              ] False: [
                  noMinus: noMinus, ch asString.
              ].
          ].
          noMinus.
        ).
    | ).

  "^" charSet_proto = ( | ntName <- ''. myChars <- nil. | ).
| )
