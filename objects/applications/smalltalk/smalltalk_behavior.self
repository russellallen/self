" $Revision: 30.6 $ "

"Copyright 1995-2006 Sun Microsystems, Inc."
"See the LICENSE file for license information."

"Behavior file for Smalltalk grammar"

"One day I will write comments explaining how this works.  Maybe."

mixins mango _AddSlots: (|
    array_mixin = (|   "elems, className, genElem: defined in children"
      genSelf = (genLit).
      genSelfExpr = (| sz. |
	sz: elems size.
	sz do: [wh: '('].
	wh: '(smalltalkEmulator global: \''.
	wh: className.
	wh: '\') new: '.
	wh: sz printString.
	sz > 0 ifTrue: [
	  elems do: [| :ai. :i |
	    wh: ') '.
	    wh: 'primBasicAt: '.
	    wh: i printString.
	    wh: ' Put: ('.
	    genElem: ai.
	    wh: ')'.
	  ].
	].
      ).
    |).
|).

(|
  parent* = traits oddball.

  shared_behavior = (|
    gen_src_header.
    gen_src_body.
    litCount.
    inHdr.
    inBlock.
    inNonLifoBlock.
    atTopOfNonLifoBlock.
    encScope.
    selfName.
    symTab.
    homeClassName.
    selfSrc = (gen_src_header flatString, gen_src_body flatString).
    reset = (
      gen_src_header:  collector copyFirst: ' '.
      gen_src_body:    collector copyFirst: ' '.
      inHdr: false.
      inNonLifoBlock: false.
      atTopOfNonLifoBlock: false.
      litCount: 0.
    ).
    forBlock: isNonLifo Do: block = (| oldATONLB |
      oldATONLB: atTopOfNonLifoBlock.
      atTopOfNonLifoBlock: isNonLifo.
      block onReturn: [atTopOfNonLifoBlock: oldATONLB].
    ).
    vBarIfNecessary = (
      inHdr ifFalse: [wh: '| '].
      inHdr: true.
    ).
    newLit = (| l |
      l: 'lit_', litCount printString.
      vBarIfNecessary.
      litCount: litCount succ.
      l
    ).
    genLit = (| lit |
      lit: newLit.
      w: lit.
      w: ' '.

      wh: lit.
      wh: ' = '.
      genSelfExpr.
      wh: '. '.
    ).
    w: s = (gen_src_body: gen_src_body & s).
    wh: s = (gen_src_header: gen_src_header & s).
    wbh: s = (atTopOfNonLifoBlock ifTrue: [inHdr: true. wh: s] False: [w: s]).
    genSelf = (w: token source.  w: ' ').
    genSelfExpr = (wh: token source.  wh: ' ').
    newScopeDo: block = (| oldSelfName. old_gen_src_header. old_gen_src_body. oldInHdr. oldLitCount. newSrc. oldINLB. |
      oldSelfName: selfName.
      old_gen_src_header: gen_src_header.
      old_gen_src_body: gen_src_body.
      oldInHdr: inHdr.
      oldLitCount: litCount.
      oldINLB: inNonLifoBlock.
      reset.
      inNonLifoBlock: true.
      selfName: 'my_self'.
      block onReturn: [
	selfName: oldSelfName.
        inHdr ifTrue: [wh: ' |\n'].
	newSrc: selfSrc.
	gen_src_header: old_gen_src_header.
	gen_src_body: old_gen_src_body.
	inHdr: oldInHdr.
	litCount: oldLitCount.
        inNonLifoBlock: oldINLB.
	w: newSrc.
      ].
    ).      
    indent = (self).
    outdent = (self).
    simplify = (self).
    simplifyIgnoreResult = (simplify).
    mapSelector: sel = (
      '/' = sel ifTrue: [^ '/=' ].
      '&' = sel ifTrue: [^ '&&' ].
      '|' = sel ifTrue: [^ '||' ].
      sel
    ).
    genKeywordList: elements = (
      elements do: [| :k. :i. kw. |
        kw: k keyword token source.
        w: (i = 0 ifTrue: kw False: [kw capitalize]).
	w: ' '.
	k binaryExpression genSelf.
      ].
    ).
    symbolCreatorPrefix = '(smalltalkEmulator global: \'Symbol\') intern: '.
    symbolCreatorSuffix = ''.
    genSymbol: s = (
      wh: symbolCreatorPrefix.
      wh: '\''.
      wh: s.
      wh: '\''.
      wh: symbolCreatorSuffix.
    ).
  |).

  argument = (|
    name = (identifier name).
  |).

  literalArray = (|
    p* = mixins mango array_mixin.
    genSelf = (p.genSelf).
    genSelfExpr = (p.genSelfExpr).
  |).

  array = (|
    simplify = (arrayBody: arrayBody arrayItems elements mapBy: [|:e| e simplify]).
    elems = (arrayBody).
    className = 'Array'.
    genElem: ai = (ai genSelfExpr).
  |).
    
  arrayBody = (|
    p* = mixins mango array_mixin.
    genSelf = (p.genSelf).
    genSelfExpr = (p.genSelfExpr).
    simplify = (arrayItems: arrayItems elements mapBy: [|:e| e simplify]).
    elems = (arrayItems).
    className = 'Array'.
    genElem: ai = (ai genSelfExpr).
  |).

  byteArray = (|
    simplify = (byteArrayBody: byteArrayBody posIntegerList elements).
    elems = (byteArrayBody).
    className = 'ByteArray'.
    genElem: ai = (wh: ai token source).  "let at:put: catch out of range elems"
  |).

  assignment_proto = (|
    ignoreResult <- true.
  |).

  assignment = (|
    genSelf = (
      ignoreResult ifTrue: [
        variable
	 ifShared: [|:n| w: n]
	  InstVar: [|:n| inNonLifoBlock ifTrue: [w: selfName. w: ' ']. w: n]
	     Else: [|:n| w: n].
	w: ': '.
	expression genSelf.
      ] False: [
        w: '([| :ass_tmp | '.
        variable
	 ifShared: [|:n| w: n]
	  InstVar: [|:n| inNonLifoBlock ifTrue: [w: selfName. w: ' ']. w: n]
	     Else: [|:n| w: n].
	w: ': ass_tmp.  ass_tmp ] value: ('.
	expression genSelf.
	w: '))'.
      ].	
    ).

    simplify = (
      ignoreResult: false.
      expression: expression simplify.
      self
    ).

    simplifyIgnoreResult = (
      expression: expression simplify.
      self
    ).

  |).

  binaryExpression = (|
    genSelf = (| n |
      n: binaryMessages size.
      n > 1 ifTrue: [
        n - 1 do: [w: '('].
      ].
      unaryExpression genSelf.
      binaryMessages do: [|:b. :i.|
        b binarySelector genSelf.
	b unaryExpression genSelf.
	i < (n - 1) ifTrue: [w: ') '].
      ].
    ).

    simplify = (
      unaryExpression: unaryExpression simplify.
      binaryMessages:  binaryMessages elements mapBy: [|:b| b simplify].
      binaryMessages isEmpty ifTrue: [unaryExpression] False: self.
    ).

    "called after simplification"
    lastMessage = (binaryMessages last).
    receiverForLastMessage = (
      binaryMessages:
        binaryMessages
	  copyFrom: binaryMessages firstKey
      	      UpTo: binaryMessages lastKey.
      self
    ).

  |).

  binaryMessage = (|
    genSelf = (
      binarySelector genSelf.
      unaryExpression genSelf.
    ).
    simplify = (
      unaryExpression: unaryExpression simplify.
      self.
    ).
  |).

  binaryPattern = (|
    selector = (binarySelector token source).
    args = (vector copySize: 1 FillingWith: (argument name)).
  |).

  binarySelector = (|
    genSelf = (
      w: mapSelector: token source.
      w: ' '.
    ).
    genSelfExpr = (genSymbol:  mapSelector: token source).
  |).

  binarySelectorSymbol = (|
    genSelf = (wh: binarySelector token source).
  |).

  block = (|
    subTreeDo: aBlock = (| oldScope. wasInBlock. |
      oldScope: encScope.
      wasInBlock: inBlock.
      inBlock: true.
      encScope: self.
      aBlock onReturn: [      
        encScope: oldScope.
        inBlock: wasInBlock.
      ].
    ).
    genNonLifoBlock = (
      symTab: symTab newScope.
      newScopeDo: [| nArgs. |
	nArgs: blockDeclsAndOrStatements nArgs.
	wh: '( (| my_self. parent* = smalltalkEmulator smalltalk nonLifoBlockTraits. \n'.
        wh: '     self_behavior* = (smalltalkEmulator global: \''.
	wh:	homeClassName.
	wh: '\') instance_methods.\n'.
	nArgs = 0 ifTrue: [
	  wh: 'value'.
	] False: [
	  wh: 'value:'.
	  nArgs pred do: [wh: 'With:'].
	].
	wh: ' = (\n'.
	blockDeclsAndOrStatements genSelf: true.
	w: ') |) _Clone my_self: self) '.
      ].
      symTab: symTab leaveScope.
    ).
    genSelf = (
      symTab: symTab newScope.
      subTreeDo: [
        w: '['.
        blockDeclsAndOrStatements genSelf: false.
        w: '] '.
      ].
      symTab: symTab leaveScope.
    ).
    simplify = (| oldScope |
      subTreeDo: [
        blockDeclsAndOrStatements simplify.
      ].
      self
    ).
  |).

  separateBlockArgsAndTemps = (|
    args = (
      blockArgsOpt opt_is_present ifFalse: vector True: [
        blockArgsOpt blockArgsBar blockArgList elements
      ]
    ).

    temps = (temporariesOpt simplify).
  |).

  joinedBlockArgsAndTemps = (|
    args = (blockArgList elements).
    temps = (temporaryList elements).
  |).	   

  blockArgList = (|
    nArgs = (elements size).
    genSelf: nonLifo = (
      forBlock: nonLifo Do: [
	wbh: '| '.
	elements do: [| :arg. n. |
	  n: arg identifier token source.
	  symTab at: n Put: 'blockArg'.
	  wbh: ':'.
	  wbh: 
	  wbh: '. '].
	wbh: '| nil'.
      ].
    ).
  |).

  blockDeclsAndStatements = (|
    nArgs = (blockArgsAndTemps args size).
    genSelf: nonLifo = (
      forBlock: nonLifo Do: [| a. t. |
	a: blockArgsAndTemps args.
	t: blockArgsAndTemps temps.
	a isEmpty && [t isEmpty] ifFalse: [
	  wbh: '| '.
	  a do: [| :arg. n. |
	    n: arg identifier token source.
	    symTab at: n Put: 'blockArg'.
	    wbh: ':'.
	    wbh: n.
	    wbh: '. '
	  ].
	  t do: [| :tmp. n. |
	    n: tmp identifier name.
	    symTab at: n Put: 'blockTemp'.
	    wbh: n.
	    wbh: ' <- smalltalkNil. '
	  ].
	  nonLifo ifFalse: [wbh: '|\n'].
	].
	indent.
	statementsOpt do: [|:s|
	  s genSelf.
	  w: '.\n'
	].
	statementsOpt isEmpty ifTrue: [
	  w: 'nil'.
	].
	outdent.
      ].
    ).

    simplify = (
      statementsOpt:  statementsOpt simplify: false.
      self.
    ).
  |).

  cascade = (|
    simplify = (message simplify)
  |).

  cascades = (|
    simplify = (elements mapBy: [|:e| e simplify])
  |).

  character = (|
    genSelfExpr = (
      wh: '(smalltalkEmulator global: \'Character\') value: '.
      wh: token source last asByte printString.
    ).
    genSelf = (genLit).
  |).

  float = (|
  |).

  identifier = (|
    name = (token source).
  |).

  "this is really a symbol"
  identifier2 = (|
    genSelfExpr = (genSymbol: identifier token source).
  |).

  negInteger = (|
    genSelf = (
      w: token source.
      w: ' '.
    ).
  |).

  keywordExpression = (|
    genSelf = (| n |
      binaryExpression genSelf.
      keywordMessageOpt genSelf.
    ).

    simplify = (
      binaryExpression: binaryExpression simplify.
      keywordMessageOpt: keywordMessageOpt simplify.
      keywordMessageOpt elements isEmpty
        ifTrue: binaryExpression
	 False: self.
    ).

    "this is after simplification"
    lastMessage = (keywordMessageOpt).    
    receiverForLastMessage = (binaryExpression).

  |).

  keywordMessage = (|
    genSelf = (genKeywordList: elements).

    simplify = (
      elements: elements mapBy: [|:e| e simplify].
      self.
    ).
  |).

  keywordMessageOpt = (|
    genSelf = (genKeywordList: elements).

    simplify = (
      elements: elements mapBy: [|:e| e simplify].
      self.
    ).
  |).

  keywordPart = (|
    simplify = (
      binaryExpression: binaryExpression simplify.
      self.
    ).
  |).

  keywordPattern = (|
    selector = (| s |
      s: elements copyMappedBy: [|:ka| ka keyword token source].
      s
        reduceWith: [|:p. :k.| p , k capitalize]
       IfSingleton: [|:k| k]
    ).
    args = (elements copyMappedBy: [|:ka| ka argument name]).
  |).

  keywordSelector = (|
    genSelfExpr = (genSymbol: token source).
  |).

  keywordSelectorSymbol = (|
    genSelf = (wh: keywordSelector token source).
  |).

  literalArrayItem = (|
    simplify = (literal).
  |).

  messageExpr = (|
    genSelf = (| t = 'cascade_t' |
      w: '([| :'.
      w: t.
      w: ' |\n'.
      indent.
      cascades do: [|:c|
        w: t.
	w: ' '.
	c genSelf.
	w: '.\n'.
      ].
      w: '] value: ('.
      keywordExpression genSelf.
      w: '))'.
    ).

    simplify = (| c. lastMsg |
      keywordExpression: keywordExpression simplify.
      cascades: cascades simplify.
      cascades isEmpty ifTrue: [^keywordExpression].

         (keywordExpression is_keywordExpression)
      || (keywordExpression is_binaryExpression)
      || (keywordExpression is_unaryExpression)
           ifFalse: [error: 'No message before semicolon'].
      lastMsg: keywordExpression lastMessage.
      keywordExpression: keywordExpression receiverForLastMessage.
      c: sequence copyRemoveAll.
      c add: lastMsg.
      cascades do: [|:m| c add: m].
      cascades: c asVector.
      self.
    ).
  |).

  method = (|

    isGetter = (| name. s. e. |
      messagePattern is_unaryPattern ifFalse: [^false].
      name: messagePattern selector.
      "name not an inst var ifTrue: [^false]."
      s: statementsOpt.
      (s size = 1) && [s first is_returnStatement] ifFalse: [^false].
      e: s first expression.
      (e is_variable) && [e name = name]
    ).

    isSetter = (| m. i_name. arg_name. s. s1. |
      m: messagePattern.
      m is_keywordPattern && [m elements size = 1] ifFalse: [^false].
      i_name: m selector copyWithoutLast.
      "i_name not an inst var ifTrue: [^false]."
      arg_name: m elements first argument name.
      s: statementsOpt.
      s size = 1 ifFalse: [^false].
      s1: s first.
          s1 is_assignment
      && [s1 variable name = i_name]
      && [s1 expression is_variable]
      && [s1 expression name = arg_name]
    ).

    genSelf: symtab ClassName: className = (| a. |
      reset.
      homeClassName: className.
      symTab: symtab.
      inBlock: false.
      selfName: 'self'.
      wh: messagePattern selector.
      wh: ' = ('.
      a: messagePattern args.
      a isEmpty && [temporariesOpt isEmpty] ifFalse: [
        inHdr: true.
        wh: '| '.
	a do: [| :arg. |
	  symTab at: arg Put: 'arg'.
	  wh: ':'.
	  wh: arg.
	  wh: '. '.
	].
	temporariesOpt do: [| :t. n. |
	  n: t identifier name.
	  symTab at: n Put: 'temp'.
	  wh: n.
	  wh: ' <- smalltalkNil. '.
        ].
	"don't close - literals yet to come"
      ].
      indent.
      primitiveOpt == nil ifFalse: [
        w: primitiveOpt copyFrom: 1 UpTo: primitiveOpt lastKey.
	w: 'IfFail: [\n'.
      ].
      statementsOpt do: [|:s|
        s genSelf.
	w: '.\n'
      ].
      statementsOpt isEmpty || [statementsOpt last is_returnStatement not] ifTrue: [
        w: 'self\n'.
      ].
      outdent.
      primitiveOpt == nil ifFalse: [
        w: ']'
      ].
      w: ')'.
      inHdr ifTrue: [wh: ' |\n'].
    ).

    simplify = (
      encScope: self.
      temporariesOpt: temporariesOpt simplify.
      primitiveOpt: primitiveOpt simplify.
      statementsOpt:  statementsOpt simplify: true.
      self
    ).

    process = (
      simplify.
"     isGetter || [isSetter] ifTrue: [^self]."
      genSelf.
    ).

  |).

  namedLiteral = (|
    name = (token source).
    simplify = (self). "required because of MI"
  |).

  parenExpr = (|
    genSelf = (
      w: '('.
      expression genSelf.
      w: ') '.
    ).

    simplify = (
      expression: expression simplify.
      self.
    ).
  |).

  posInteger = (|
  |).

  primaryAsRcvr = (|
    simplify = (primary simplify)
  |).

  primitiveOpt = (|
    simplify = (
      opt_is_present ifTrue: [primitive string token source] False: nil
    ).
  |).

  pseudoVariable = (|
    genSelf = (
      is_thisContext ifTrue: [error: 'Can\'t handle thisContext!'].
      w: selfName.  w: ' '.
    ).
    name = (token source).
    simplify = (self).
  |).

  "this is really a symbol"
  pseudoVariable2 = (|
    genSelfExpr = (genSymbol: token source).
  |).

  returnStatement = (|
    genSelf = (
      inBlock ifTrue: [w: '^ '].
      expression genSelf.
    ).

    simplify = (
      expression: expression simplify.
      self.
    ).

    statementVec = (vector copySize: 1 FillingWith: self).

    statementVec: prev = ((prev & self) asVector).
  |).

  statementList = (|
    statementVec = (
      thenStatementsOpt statementVec: (collector copyFirst: expression)
    ).

    statementVec: prev = (| t |
      t: prev & expression.
      thenStatementsOpt statementVec: t
    ).
  |).

  statementsOpt = (|
    simplify: ignoreLast = (| v |
      v: statementVec.
      v mapBy: [|:e. :i|
        ignoreLast not && [i = v lastKey]
	  ifTrue: [e simplify]
	   False: [e simplifyIgnoreResult]]
    ).
    statementVec = (
      opt_is_present ifTrue: [statements statementVec] False: vector.
    ).
    statementVec: prev = (| t |
      opt_is_present ifFalse: [^prev asVector].
      statements statementVec: prev.
    ).
  |).

  string = (|
    stringPart = (| t |
      t: token source.
      (t copyFrom: 1 UpTo: t lastKey) stringName
    ).
    genSelfExpr = (
      wh: '(smalltalkEmulator global: \'String\') fromSelfString: '.
      wh: stringPart.
    ).
    genSelf = (genLit).
  |).

  stringSymbol = (|
    genSelf = (wh: string stringPart).
  |).

  super = (|
    genSelf = (w: 'resend.').
    name = ('super').  "when used as a symbol"
    simplify = (self).
  |).

  symbol = (|
    genSelfExpr = (
      wh: symbolCreatorPrefix.
      symbolText is_stringSymbol ifTrue: [
        symbolText genSelf
      ] False: [
	   (symbolText is_binarySelectorSymbol)
	|| [symbolText is_keywordSelectorSymbol] ifTrue: [
	  wh: '\''.
	  symbolText genSelf.
	  wh: '\''.
	] False: [
	  wh: '\''.
	  wh: symbolText name.
	  wh: '\''.
	].
      ].
      wh: symbolCreatorSuffix.
    ).
    genSelf = (genLit).
    simplify = (self).
  |).

  temporariesOpt = (|
    simplify = (
      opt_is_present ifTrue: [temporaries temporaryList elements] False: vector
    ).
  |).

  temporary = (|
    name = (identifier name).
  |).

  thenStatements = (|
    statementVec: prev = (
      statementsOpt statementVec: prev.
    ).
  |).

  thenStatementsOpt = (|
    statementVec: prev = (
      opt_is_present
        ifFalse: [^prev asVector].
      thenStatements statementVec: prev
    ).
  |).

  unaryExpression = (|
    genSelf = (
         (receiver is_block)
      && [unaryMessages size = 1]
      && [unaryMessages first identifier name = 'asNonLifoBlock']
        ifTrue: [receiver genNonLifoBlock]
	False: [
         receiver genSelf.
         unaryMessages do: [|:u|
	   w: mapSelector: u identifier name.
           w: ' '.
	 ].
        ].
    ).

    simplify = (
      receiver: receiver simplify.
      unaryMessages: unaryMessages elements.
      unaryMessages isEmpty ifTrue: receiver False: self.
    ).

    "called after simplification"
    lastMessage = (unaryMessages last).
    receiverForLastMessage = (
      unaryMessages:
        unaryMessages
	  copyFrom: unaryMessages firstKey
      	      UpTo: unaryMessages lastKey.
      self
    ).
  |).

  unaryMessage = (|
    genSelf = (unarySelector genSelf).
  |).

  unaryPattern = (|
    selector = (unarySelector identifier name).
    args = (vector).
  |).

  unarySelector = (|
    genSelf = (
      w: mapSelector: identifier name.
      w: ' '.
    ).
  |).

  variable = (|
    ifShared: sb InstVar: ivb Else: eb = (| n |
      n: identifier name.
      n isCapitalized ifTrue: [^sb value:  smalltalkEmulator smalltalk map_name: n].
      (symTab at: n) = 'iv' ifTrue: [^ivb value:  smalltalkEmulator mapInstVarName: n].
      eb value: n
    ).
    genSelf = (
      ifShared: [|:n| w: n]
       InstVar: [|:n| inNonLifoBlock ifTrue: [w: selfName. w: ' ']. w: n]
          Else: [|:n| w: n].
      w: ' '.
    ).
    name = (
      ifShared: [|:n|n] InstVar: [|:n|n] Else: [|:n|n]
    ).
    simplify = (self).
  |).

  

|)
