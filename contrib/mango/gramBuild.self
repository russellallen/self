"Sun-$Revision: 1.1.1.1 $"
 
"Copyright 1992-9 Sun Microsystems, Inc. and Stanford University.
 See the LICENSE file for license information."

"                                                Ole Agesen, September 1992."


traits mango parsers grammarLexer _Define: ( |
  "_" parent*       = traits mango parsers initialParser.
  "^" copy          = ( resend.copy init. ).
  "^" printString   = 'grammarLexer'.
  "^" outputTypes   = ( kind2token_id. ).
  "_" takeNewInput  = ( skipCh. resend.takeNewInput. ).
  "_" getMyState    = ( output @ pos. ).
  "_" setMyState: s = ( output: s x. pos: s y. self. ).
  "_" blank         = ' \n\t'.

  "^" endMarker = ( 
      mango tokens endMarker copy 
        token_id: (kind2token_id at: endMarkerKind).
    ).

  "^" skipOutput = ( 
       output: (hasMoreInput ifTrue: [nextToken] False: [endMarker]).
    ).

  "^" token_kinds* = ( |  "Public so that simpleStGrammarParser can access it."
      "^" stringKind          = 'string'.       "'horse'"
      "^" charSetKind         = 'charSet'.      "[fisk]"
      "^" whitespaceKind      = 'whitespace'.   "         "
      "^" identifierKind      = 'identifier'.   "goat"
 
      "^" endMarkerKind       = mango tokens endMarker token_kind.

      "^" conArrowKind        = '::='.   "Literal kinds for structured grammars."
      "^" altArrowKind        = '::|'.
      "^" lst0ArrowKind       = '::*'.
      "^" lst1ArrowKind       = '::+'.
      "^" optArrowKind        = '::?'.
      "^" semicolonKind       = ';'.
      "^" colonKind           = ':'.
      "^" arrowKind           = '->'.
      "^" equalsKind          = '='.
      "^" starKind            = '*'.
      "^" plusKind            = '+'.
      "^" vBarKind            = '|'.
      "^" commaKind           = ','.
      "^" qmarkKind           = '?'.
      "^" lessKind            = '<'.
      "^" greaterKind         = '>'.
      "^" beginParenKind      = '('.
      "^" endParenKind        = ')'.
      "^" beginBraceKind      = '{'.
      "^" endBraceKind        = '}'.
      "^" nameKind            = 'Name:'.
      "^" optionsKind         = 'Options:'.
      "^" syntaxKind          = 'Syntax:'.
      "^" transformationsKind = 'Transformations:'.
      "^" lexKind             = 'Lex:'.
      "^" behaviorKind        = 'Behavior:'.
      "^" slrKind             = 'SLR(1)'.
      "^" lalrKind            = 'LALR(1)'.
      "^" lrKind              = 'LR(1)'.

      "^" nonliteralKindsDo: blk = (
          "Iterate 'blk' over all kinds of tokens this lexer can produce 
           on its output."
          blk value: stringKind.
          blk value: charSetKind.
          blk value: whitespaceKind.
          blk value: identifierKind.
          blk value: endMarkerKind.
          self.
        ).

      "^" literalKindsDo: blk = (
          blk value: conArrowKind.
          blk value: altArrowKind.
          blk value: lst0ArrowKind.
          blk value: lst1ArrowKind.
          blk value: optArrowKind.
          blk value: semicolonKind.
          blk value: colonKind.
          blk value: arrowKind.
          blk value: equalsKind.
          blk value: starKind.
          blk value: plusKind.
          blk value: vBarKind.
          blk value: commaKind.
          blk value: qmarkKind.
          blk value: lessKind.
          blk value: greaterKind.
          blk value: beginParenKind.
          blk value: endParenKind.
          blk value: beginBraceKind.
          blk value: endBraceKind.
          blk value: nameKind.
          blk value: optionsKind.
          blk value: syntaxKind.
          blk value: transformationsKind.
          blk value: lexKind.
          blk value: behaviorKind.
          blk value: slrKind.
          blk value: lalrKind.
          blk value: lrKind.
          self.
        ).
    | ).

  "_" init = (
      | lit <- list. token_id <- 0. |
      lit: lit copy.
      kind2token_id: kind2token_id copyRemoveAll.
      literalKindsDo:    [|:kind| 
          kind2token_id at: kind Put: token_id. 
          lit add: kind.
          token_id: 1 + token_id.
      ].
      nonliteralKindsDo: [|:kind| 
          kind2token_id at: kind Put: token_id.
          token_id: 1 + token_id.
      ].
      literals: lit asVector.
      "Sort by length to match against longest literal first."
      literals: (literals copySortBy: (| 
        "^" element: x Precedes: y = ( x size > y size ).
      |) ).
      resend.init.
    ).

  "_" tokenOfKind: k Src: src = (
      (((mango tokens token copy) token_kind: k) 
	token_id: (kind2token_id at: k)) set_source: src.
    ).

  "_" symbolToken: endCh Kind: kind = (
      tokenOfKind: kind Src: (getUpTo: [|:ch| ch = endCh]).
    ).

  "_" charSetToken = (
      "This lexer doesn't have to interpret the body of a charSet, but it
       must be able to correctly delimit it (and set the source field of 
       the generated token)."
      | esc <- true. raw <- ''. |
      tokenOfKind: charSetKind Src: (getUpTo: [|:ch| 
          esc ifTrue: [esc: false. false]
               False: [esc: ch = '\\'. ch = ']'].
      ]).
    ).

  "_" stringToken = (
      | esc <- true. raw <- ''. |
      "'stringstart: ' print. (posAsTextAt: pos) printLine."
      raw: (getUpTo: [|:ch| 
          esc ifTrue: [esc: false. false.]
               False: [esc: ch = '\\'. ch = '\''].
      ]).
      "'stringend: ' print. (posAsTextAt: pos) printLine."
      tokenOfKind: stringKind Src: raw.
    ).

  "_" identifierToken = (
       tokenOfKind: identifierKind Src: (getUpTo: [| s2 <- 'fx'. |
           s2: (firstN: 2).
           s2 last isLetter not && s2 last isDigit not.
       ]).
     ).

  "_" nextToken = (
      | i <- 0. |
      i: pos.    "Can't use the mark here - skipBlanks messes with it."   
      skipBlanks.
      i != pos ifTrue: [
          ^ tokenOfKind: whitespaceKind Src: (str copyFrom: i UpTo: pos).
      ].
      markStartPos.
      literals do: [|:lit|
          lit = (firstN: lit size) ifTrue: [
              lit size do: [skipCh].
              ^ tokenOfKind: lit Src: lit.
          ].
      ].
      '\''   = firstCh ifTrue: [^ stringToken].
      '['    = firstCh ifTrue: [^ charSetToken].
      firstCh isLetter ifTrue: [^ identifierToken].
      error: 'gramLexer: unexpected symbol: \'', firstCh, '\' ', 
             (posAsTextAt: pos).
    ).

  "_" getUpTo: blk = (
      | n <- 0. |
      n: pos.
      [blk value: firstCh] whileFalse: [skipCh].
      skipCh.
      str copyFrom: n UpTo: pos.
    ).

  "_" skipBlanks = ( 
      | n <- 0. |
      [hasMoreInput && [blank includes: firstCh]] whileTrue: [skipCh].
      markStartPos.
      '(*' = (firstN: 2) ifTrue: [
          getUpTo: [
              pos >= (str size - 2) ifTrue: [
                  error: 'unterminated comment ', (posAsTextAt: mark).
                         
              ].
              '(*' = (firstN: 2) ifTrue: [n: n + 1].
              '*)' = (firstN: 2) ifTrue: [n: n - 1].
              0 = n.
          ].
          skipCh.    "Skip comment's final ')'."
          skipBlanks.
      ].
      self.
    ).

  "_" skipCh = ( 
      trace && [0 <= pos] ifTrue: [firstCh print].
      pos: 1 + pos.
      self.
    ).

  "_" expected: ch = ( 
      error: 'lexer: expected ', ch, '; found ', firstCh printString, ' ',
             (posAsTextAt: pos).
    ).

  "_" firstN: n = ( 
      pos >= (str size - n) ifTrue: [^ ''].
      str copyFrom: pos UpTo: pos + n.
    ).

  "_" firstCh = ( 
      str at: pos IfAbsent: [
          error: 'unexpected end of input; token started at ', 
                 (posAsTextAt: mark).
      ]. 
    ).
| )

(mango parsers grammarLexer _Define: 
 (mango parsers initialParser clone _AddSlots: ( |
  "_" parent* = traits mango parsers grammarLexer.
  "^" trace   = false.  "Set true to have lexer print what it is lexing."
  "_" kind2token_id  <- dictionary.
  "_" literals       <- vector.     "Literally matching terminals."
| )) copy)     "Send copy to make sure prototype is initialized."


traits mango parsers simpleStGrammarParser _Define: ( |
  "_" parent*      = traits mango parsers parser.
  "_" token_kinds* = traits mango parsers grammarLexer token_kinds.
  "^" endMarker    = ( prevParser endMarker. ).
  "^" inputTypes   = ( prevParser outputTypes. ).               "To shut it up!"
  "^" printString  = 'simpleStGrammarParser'.

  "^" skipOutput = (
      | name <- ''. behaviorFile <- ''. behav. syntaxParseTableKind <- ''. 
        prods <- list. res <- mango grammars stGrammar. objP. objT. 
        transforms <- list. |
      prods: prods copy.
      kind2term:    kind2term    copyRemoveAll.  
      kind2nonterm: kind2nonterm copyRemoveAll.  
      name:         (getStringValueOfKind: nameKind).
      behaviorFile: (getStringValueOfKind: behaviorKind).
      currentInput token_kind = optionsKind ifTrue: [
          flagError: 'bootstrapping parser does not support options ',
                     posOfInput.
      ].
      assertKind:   syntaxKind.
      skipInput.
      syntaxParseTableKind: getParseTableKind.
      behav: (behaviorFile _RunScriptIfFail: [
          'Warning: could not load behavior' printLine.
          ().   "Use empty object as behavior."
      ]).
      transforms: parseTransformations.
      [currentInput token_kind = lessKind] whileTrue: [
          prods addLast: nextProduction.
      ].
      assertKind: lexKind.   "Verify that it is there, but don't process it."
      [myParserPipeline hasMoreInput] whileTrue: [skipInput].
      res: (res copyName: name, '-syntax'
             Productions: prods 
         Transformations: transforms
                Behavior: behav).
      res grammar computeParseTable: syntaxParseTableKind.
      output: ( | 
        "_" parent* = traits clonable.
        "^" isErrorMarker = false.
        "^" stGrammar.
      | ) copy.
      output stGrammar: res.
      self.
    ).

  "_" parseTransformations = (
      | transforms <- list. |
      transforms: transforms copy.
      currentInput token_kind = transformationsKind ifFalse: [^ transforms].
      skipInput.
      assertKind: stringKind.
      transforms add: currentInput source eval.
      skipInput.
      [currentInput token_kind = commaKind] whileTrue: [
          skipInput.
          transforms add: currentInput source eval.
          skipInput.
      ].
      assertKind: semicolonKind. skipInput.
      transforms.
    ).

  "_" getStringValueOfKind: kind = (
      | res <- ''. |
      assertKind: kind. 
      skipInput.
      assertKind: stringKind.
      res: currentInput source eval.
      skipInput.
      res.
    ).

  "_" getParseTableKind = (
      | ck <- ''. |
      ck: currentInput token_kind.
      skipInput.
      (ck = slrKind) || [ck = lalrKind] || [ck = lrKind] ifTrue: [^ ck].
      expected: 'one of ', slrKind, ', ', lalrKind, ', and ', lrKind.
    ).

  "_" nextProduction = (
      | lhs <- mango symbols nonterminal. fi. |
      lhs: getNonterminal.
      fi: currentInput token_kind.
      skipInput.
      fi = conArrowKind  ifTrue: [^ conProdLHS: lhs].
      fi = altArrowKind  ifTrue: [^ altProdLHS: lhs].
      fi = lst0ArrowKind ifTrue: [
          ^ lstProd: mango productions lst0Production LHS: lhs
      ].
      fi = lst1ArrowKind ifTrue: [
          ^ lstProd: mango productions lst1Production LHS: lhs
      ].
      fi = optArrowKind  ifTrue: [^ optProdLHS: lhs].
      expected: 'one of \'::=  ::|  ::*  ::+  ::?\''.
    ).
     
  "_" conProdLHS: lhs = (
      | rhs <- list. |
      rhs: getSymbols.
      mango productions conProduction copyLHS: lhs RHS: rhs asVector.
    ).

  "_" altProdLHS: lhs = (
      | alt <- list. |
      alt: getSymbols.
      mango productions altProduction copyLHS: lhs Alternatives: alt asVector.
    ).

  "_" lstProd: proto LHS: lhs = (
      | elm <- mango symbols symbol. sep <- nil. |
      elm: getSymbol.
      currentInput token_kind != semicolonKind ifTrue: [sep: getSymbol].
      assertKind: semicolonKind. skipInput.
      proto copyLHS: lhs Element: elm Separator: sep.
    ).

  "_" optProdLHS: lhs = (
      | elm <- mango symbols symbol. |
      elm: getSymbol.
      assertKind: semicolonKind. skipInput.
      mango productions optProduction copyLHS: lhs Element: elm.
    ).

  "_" getKind: kblk Tag: tblk = (
      | tag <- ''. kind <- ''. |
      skipInput.
      currentInput token_kind = identifierKind ifTrue: [
          tag: currentInput source.
          skipInput.
          currentInput token_kind = colonKind ifTrue: [
              skipInput.
              assertKind: identifierKind.
              kind: currentInput source.
              skipInput.
          ] False: [
              kind: tag.
          ].
          kblk value: kind.
          tblk value: tag.
      ] False: [
          expected: identifierKind.
      ].
      self.
    ).
       
  "_" getSymbol = (
      | sym. kind <- ''. tag <- ''. k2s. proto. isLiteral <- false. |
      currentInput token_kind = lessKind ifTrue: [
          k2s: kind2nonterm.
          proto: mango symbols nonterminal.
          getKind: [|:k| kind: k] Tag: [|:t| tag: t].
          assertKind: greaterKind. skipInput.
      ] False: [
      currentInput token_kind = beginBraceKind ifTrue: [
          proto: mango symbols terminal.
          k2s: kind2term.
          getKind: [|:k| kind: k] Tag: [|:t| tag: t].
          assertKind: endBraceKind. skipInput.
      ] False: [
      currentInput token_kind = stringKind ifTrue: [
          proto: mango symbols terminal.
          k2s: kind2term.
          kind: currentInput source eval.
          tag:  currentInput source eval.
          skipInput.
          isLiteral: true. 
      ] False: [
          expected: 'nonterminal, terminal or string'.
      ]]].
      k2s if: kind IsPresentDo: [|:s| sym: s] 
                   IfAbsentPut: [sym: (proto copyKind: kind). sym]
                         AndDo: [].
      sym: sym copy.
      sym tag: tag.
      sym isTerminal ifTrue: [sym isLiteral: isLiteral].
      sym.
    ).

  "_" getNonterminal = (
      | res <- mango symbols nonterminal. |
      res: getSymbol.
      res isNonterminal ifFalse: [expected: 'a nonterminal'].
      res.
    ).

  "_" getTerminal = (
      | res <- mango symbols terminal. |
      res: getSymbol.
      res isTerminal ifFalse: [expected: 'a terminal'].
      res.
    ).

  "_" getSymbols = (
      "Parse a semicolon terminated list of symbols."
      | syms <- list. |
      syms: syms copy.
      [myParserPipeline hasMoreInput && 
       [currentInput token_kind != semicolonKind]] whileTrue: [
          syms addLast: getSymbol.
      ].
      assertKind: semicolonKind. skipInput.
      syms.
    ).

  "_" expected: t = ( 
      error: 'expected ', t, '; found ', currentInput printString, posOfInput.
    ).

  "_" skipInput = ( 
      trace ifTrue: [currentInput printLine]. 
      prevParser skipOutput. 
      self.
    ).

  "_" assertKind: k = ( 
      k != currentInput token_kind ifTrue: [expected: k printString]. 
      self.
    ).
| )

(mango parsers simpleStGrammarParser _Define: 
 (mango parsers parser clone _AddSlots: ( |
  "_" parent* = traits mango parsers simpleStGrammarParser.
  "^" trace   = false.       "If true, print symbols being parsed."
  "_" kind2term    <- dictionary.
  "_" kind2nonterm <- dictionary.
| )) copy)   "Send copy to ensure that prototype is initialized."


mango parsers stGrammarParser: [ 
  | parsersNameSpace*   = mango parsers.
    stGrammarFile = 'applications/mango/stGrammar.grm'.
    whitespaceToken_kind = 'whitespace'.   "Hardwired!"
    boot1      <- mango parsers parserPipeline.
    boot2      <- mango parsers parserPipeline.
    final      <- mango parsers parserPipeline.
    whitespace <- mango parsers whitespaceFilter.
    gg         <- mango grammars stGrammar.
    stgP       <- mango parsers lrParser.
    parseTree.
  |
  boot1: boot1 copy.
  boot2: boot2 copy.
  final: final copy.

  boot1 -> grammarLexer copy 
        -> (whitespace copyEatingKind: whitespaceToken_kind)
        -> simpleStGrammarParser copy.
  'Parsing ' print. stGrammarFile print. ' with ad-hoc parser...' printLine.
  boot1 parseFile: stGrammarFile.
  boot1 hasMoreInput ifTrue: [error: 'should be at end of input'].
  gg: boot1 output stGrammar.           "gg is an stGrammar for stGrammars, 
                                         the result of parsing the given file."
  stgP: (stgP copyGrammar: gg grammar).
  boot2 -> grammarLexer copy 
        -> (whitespace copyEatingKind: whitespaceToken_kind)
        -> stgP.
  '' printLine.
  'Parsing ' print. stGrammarFile print. ' with generated parser...' printLine.
  boot2 parseFile: stGrammarFile.
  boot2 hasMoreInput ifTrue: [error: 'should be at end of input'].
  parseTree: boot2 output.            "parse tree obtained using ad-hoc lexer."
  final: parseTree makeParser.        "this parser doesn't use ad-hoc lexer."
  '\nMango successfully bootstrapped.' printLine.
  final.

  "Note the differences between the three parsers boot1, boot2 and final:

      boot1 is a pipe consisting of an ad-hoc lexer and an ad-hoc parser;
            its output is a 'stGrammar' object.
      boot2 is a pipe consisting of an ad-hoc lexer and a generated 
            lrParser; its output is a parse tree.
      final is a pipe consisting of a generated lexer and a a generated
            lrParser; its output is a parse tree.

   Here is a summary:
     +---------+--------------+---------------+------------+
     |         | lexing stage | parsing stage | output     |
     +---------+--------------+---------------+------------+
     | boot1   | ad-hoc       | ad-hoc        | stGrammar  |
     | boot2   | ad-hoc       | generated     | parse tree |
     | final   | generated    | generated     | parse tree |
     +---------+--------------+---------------+------------+
  "
] value
