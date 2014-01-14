"$Revision: 8.2 $"

"I hold the CPP-specific lexing stages"

traits     cpp _AddSlotsIfAbsent: ( | stages = () | )
prototypes cpp _AddSlotsIfAbsent: ( | stages = () | )

traits cpp stages _AddSlotsIfAbsent: ( |
    filterMixin = ().

    main = ().
    fileReader = ().
    nextFileReader = ().
    macroExpander = ().
    macroExpanderWithArgs = ().
    unexpandablizer = ().
    constExprMunger = ().
    constOpParser = ().
    constExpr = ().
    directiveName = ().
    define	  = ().
    undef = ().
    macroInvocation	  = ().
    include = ().
    stringMerger = ().
    line = ().
    miscDirs = ().
    ifdefs = ().
    defined = ().
| )

prototypes cpp stages _AddSlotsIfAbsent: ( |
    main = ().
    fileReader = ().
    nextFileReader = ().
    macroExpander = ().
    macroExpanderWithArgs = ().
    unexpandablizer = ().
    constExprMunger = ().
    constOpParser = ().
    constExpr = ().
    directiveName = ().
    define	  = ().
    undef = ().
    macroInvocation	  = ().
    include = ().
    stringMerger = ().
    line = ().
    miscDirs = ().
    ifdefs = ().
    defined = ().
| )

traits cpp stages _AddSlots: ( |
    names* = traits cLexer stages.
| )

prototypes cpp stages _AddSlots: ( |
    names* = cpp.
    moreNames** = cLexer stages.
| )

traits cpp stages filterMixin _Define: ( |
     names* = cpp stages.
| )

" the main guy, installed right after source"

traits cpp stages main _Define: ( |
  _ parent**        = traits cLexer stages main.
  _ mixin*          = traits cpp stages filterMixin.

    preprocess: f = (
          makePipe.
	  processArgs: f.
	  finish).

  _ preprocessFrom: f To: t = (
          ('preprocessing ', f, ' ' ) print.
          -> (fileReader copy inputFileName: f).
          addWriter: fileWriter copy open: t.
          run.
          eof.
	  '\n' print.
	  self).

"  _ standardMacros = '-Dunix=1 -Dsparc=1 -Dsun=1 -D__STDC__=1'.xxx"	
  _ standardMacros = '-Dunix=1 -Dsparc=1 -Dsun=1'.

  _ processArgs: s = ( | in. from <- ''.  to <- ''. |
	in: (standardMacros, ' ', s) asList.
        [ | :exit.  a <- '' |
            [ 
                in isEmpty ifTrue: exit.
	        ' \t' includes: in first
            ] whileTrue: [ in removeFirst ].
            [ in isEmpty || [' \t' includes: in first] ] whileFalse: 
	        [ a: a, in removeFirst ].
	    a: a asString.
            a first = '-' ifTrue: [ processSwitch:  a copyWithoutFirst ]
                           False: [
	        from isEmpty ifTrue: [from: a] False: [
	        to   isEmpty ifTrue: [to:   a] False: [
                    warning: 'extra file name: ', a, ' discarded'.
                ]].
            ].
        ] loopExit.
        from isEmpty ifTrue: [^ warning: 'no input  file'].
        to   isEmpty ifTrue: [to: from copyWithoutLast, 'i'].
        preprocessFrom: from To: to.
	self).

  _ processSwitch: x = ( "-something"
	x       = 'undef' ifTrue: [^ undefineAll                          ].
        x first = 'D'     ifTrue: [^ processDefineArg: x copyWithoutFirst ].
        x first = 'I'     ifTrue: [^ addDir:           x copyWithoutFirst ].
        x first = 'U'     ifTrue: [^ undef:            x copyWithoutFirst ].
        x first = 'Y'     ifTrue: [^ replaceStdDirs:   x copyWithoutFirst ].
	warning: 'unrecognized switch -', x).

  _ processDefineArg: x = ( | n <- ''.  v <- '' |     "-D"
	x findFirst: [|:c| c = '='] 
          IfPresent: [|:c. :i. |
	    n: x copySize: i.
	    v: x copyFrom: i + 1.
        ] IfAbsent: [ n: x.  v: '1' ].
        '#define ', n, ' ', v, '\n' do: [|:c| put: c].
	eof.
	self).

  _ undefineAll       = ( macros removeAll.                     self). "-undef"
  _ addDir:         d = ( usrIncludePath addLast: d.            self). "-I"
  _ undef:          x = ( macros removeKey: x IfAbsent: [].     self). "-undef"
  _ replaceStdDirs: x = ( stdIncludePath removeAll addLast: x.  self). "-Ydir"

  ^ dirPartOfInputFileName = ''. "for first fileReader to use"

  ^ includePath = ( | r |
        r: usrIncludePath copy.
	stdIncludePath do: [|:d| r addLast: d].
	r).

    copy = (((
	resend.copy   macros:          macros      copy)
		   usrIncludePath:  usrIncludePath copy)
		   stdIncludePath:  stdIncludePath copy).

  " build the pipeline, readers and writer added later "

  _  pipeStages = ( resend.pipeStages, cppStages ).

    cppStages = (
        (
	      directiveName
            & miscDirs
            & ifdefs
	    & define
	    & undef
	    & include
            & macroInvocation
	    & stringMerger
	    & line
        ) asVector).

  _ fileWriter = (sourceFileWriter).

  ^ stageName	     = 'cpp main'.
| )

(cpp stages main _Define: 
  cLexer stages main  copy 
  _AddSlots: ( |
  _ parent* = traits cpp stages main.
    macros         <- dictionary copyRemoveAll.
    usrIncludePath <- list copyRemoveAll.
    stdIncludePath <- list copyRemoveAll addLast: '/usr/include'.
| ) )

traits cpp stages fileReader _Define: ( |
  _ parent**         = traits cLexer stages fileReader.
  _ filterMixin* = traits cpp stages filterMixin.

  ^ inputFileName    = (inputFileFullName).

  ^ inputFileName: f = (
	inputFileBaseName: f.
	inputFileFullName: f).

  ^ dirPartOfInputFileName = ( | r <- list copy |
	r: inputFileBaseName asList.
	[r isEmpty] whileFalse: [
	    r removeLast = '/' ifTrue: [ ^ r asString ].
	].
	'').

  _ openIfFail: fail = ( | err <- ''. p. |
	inputFileBaseName first = '/' ifTrue: [
	  ^ tryIn: '' IfOK: [|:f| f] Fail: [|:e| fail value: e].
        ].
	p: includePathForMe.
	p isEmpty ifTrue: [ ^ fail value: 'empty path' ].
	p do: [|:d|
	    tryIn: d IfOK: [|:f| ^ f] Fail: [ |:e| err: e].
        ].
	fail value: err).

  ^ includePathForMe = ( | p |
	searchHere ifFalse: [includePath] True: [
	    includePath copy addFirst: input dirPartOfInputFileName.
        ]).

  _ readFile = (
	input isFileReader ifTrue: [emitLineNumberEntering: true ]
	                    False: [emitLineNumber].
        resend.readFile).


  _ tryIn: d IfOK: okb Fail: failBlock = (
	directoryUsed: d.
	inputFileFullName: 
	    (d isEmpty ifTrue: '' False: [d, '/']), inputFileBaseName.
	okb value: 
	    unixFile openForReading: inputFileFullName 
		     IfFail: [|:e| ^ failBlock value: e]).

  ^ run = ( 
	resend.run.
	input isFileReader ifTrue: [emitLineNumberEntering: false].
	self).

  ^ stageName	     = 'cpp fileReader'.

  ^ wasIncludedWithQuotes = (searchHere).
| )
 
cpp stages fileReader _Define: cpp stages filter copy _AddSlots: ( |
  _ parent* = traits cpp stages fileReader.
  _ file <- unixFile.
  ^ inputLineNumber <- 1.
  ^ inputFileFullName <- ''.
 ^_ inputFileBaseName <- ''.
  ^ searchHere <- true.
 ^_ directoryUsed <- ''.
| )

" I open the next file in the search sequence (gnu compat)"

traits cpp stages nextFileReader _Define: ( |
  _ parent*         = traits cpp stages fileReader.

  _ openIfFail: fail = ( | err <- ''. p. |
	inputFileBaseName first = '/' ifTrue: [
	  ^ warning: 'cannot use include_next with an absolute path name: ',
	             inputFileBaseName.
        ].
	resend.openIfFail: fail).

  ^ includePathForMe = ( | p |
	p: input includePathForMe copy.
	inputFileBaseName = input inputFileBaseName ifFalse: [^ p].
        [p isEmpty  ||  [p removeFirst = input directoryUsed]] whileFalse.
	p).

  ^ stageName	     = 'cpp nextFileReader'.

  ^ inputFileBaseName = (input inputFileBaseName).
| )
 
cpp stages nextFileReader _Define: cpp stages fileReader copy _AddSlots: ( |
  _ parent* = traits cpp stages nextFileReader.
| )

" just recognize \n # name and build a token"

traits cpp stages directiveName _Define: ( |
    parent** = traits cpp stages tokenizer.
  _ filterMixin* = traits cpp stages filterMixin.
    

    reset      = (resend.reset result: tokens directiveName copy).
    buildToken = (result source: storedTokensString).
    stageName  = 'directiveName'.

    init = ( |
	process: c = (
            c isNewline ifTrue: [^ put: c].
            c = '#'     ifTrue: [>> c.  ^ state: pound].
	    state: midLine.
	    put: c).
    | ).
    midLine = ( |
        eof = (eofFlush).
        process: c = (put: c.  c isNewline ifTrue: [state: init].  self).
    | ).
    pound = ( |
        eof = (eofFlush).
	process: c = (
	    >> c.
	    c isIntegerToken ifTrue: [
	        result name: 'oldLine'.
		removeLast.
                putToken.
	      ^ put: c.
            ].
	    c isNewline ifTrue: [   
	        result name: ''.
                removeLast.
	        putToken.
	      ^ put: c.
            ].
	    result name: c source.
	    putToken).
    | ).
| )

cpp stages directiveName _Define: cpp stages tokenizer  copy _AddSlots: ( |
    parent** =  traits cpp stages directiveName.
    state* <-  traits cpp stages directiveName init.
    result   <- cpp tokens directiveName.
| )


traits cpp stages undef _Define: ( |
    parent** = traits cpp stages tokenizer.
  _ filterMixin* = traits cpp stages filterMixin.

    stageName = 'undef'.

    init = ( |
        process: c = (
	    c isDirectiveName && [c name = 'undef']  ifFalse: [^put: c].
	    >> c.
	    state: dir).
    | ).
    dir = ( |
        eof = (eofWarn).
	process: c = (
	    >> c.
	    c isIdentifier ifFalse: [
	        warning: 'missing identifer after #define'.
	      ^ reset
            ].
	    macros removeKey: c source IfAbsent: [].
	    reset).
    | ).
| )

( cpp stages undef
) _Define: cpp stages tokenizer copy _AddSlots: ( |
    parent** = traits cpp stages undef.
| )

" parses define directive, creates macroDefinition*, enters in macros"

traits cpp stages define _Define: ( |
    parent** = traits cpp stages tokenizer.
  _ filterMixin* = traits cpp stages filterMixin.

    stageName = 'define'.

    putToken = (macros at: macroName Put: buildToken.  reset).

    buildToken = ((((
        macroDef source:            storedTokensString)
	         inputFileFullName: inputFileFullName)
	         inputLineNumber:   inputLineNumber)
	         name:		    macroName).

    init = ( |
        process: c = (
	    c isDirectiveName && [c name = 'define']  ifFalse: [^put: c].
	    >> c.
	    state: dir).
    | ).
    dir = ( |
        eof = (eofWarn).
	process: c = (
	    >> c.
	    c isIdentifier ifFalse: [
	        warning: 'missing identifer after #define'.
	      ^ reset
            ].
	    c source = 'defined' ifTrue: [
	        warning: 'cannot #define defined'.
	      ^ reset
            ].
	    macroName:       c source.
	    macroDef: tokens macroDefinition copy.
	    state: mname).
    | ).
    mname = ( |
        eof = (eofToken).
	process: c = (
	    c isNewline ifTrue: [putToken.  ^ put: c copy priorWhiteSpace: ''].
	    >> c.
	    ( c source = '(' )  &&  [ c priorWhiteSpace isEmpty]  ifTrue: [
	        macroDef: tokens macroDefinitionWithArgs copy.
	      ^ state: left.
            ].
	    state: endOfArgs.
	    reprocess: removeLast).
    | ).
    left = ( |
        eof = (eofWarn).
	process: c = (
	    state:  c = ')' ifTrue: [argName] False: [comma].
	    reprocess: c).
    | ).
    comma = ( |
        eof = (eofWarn).
	process: c = (
	    c isIdentifier ifFalse: [warning: 'missing formal'.  ^ reset].
	    >> c.
	    macroDef formals addLast: c.
	    state: argName).
    | ).
    argName = ( |
        eof = (eofWarn).
	process: c = (
	   >> c.
	   c = ',' ifTrue: [^ state: comma     ].
	   c = ')' ifTrue: [^ state: endOfArgs ].
	   warning: 'missing comma or right paren in define argument list'.
	   reset).
    | ).
    endOfArgs = ( |
        eof = (eofToken).
	process: c = (
	    c isNewline ifFalse: [ 
                >> c.  
	        macroDef bodyTokens addLast: c copyReplaceTabs.
             ^ self
            ].
            macroDef bodyTokens isEmpty ifFalse: [
	        macroDef bodyTokens first = '##'  ifTrue: [
		    warning: '## at start of macro'.
		   ^reset
                ].
	        macroDef bodyTokens last = '##'  ifTrue: [
		    warning: '## at end of macro'.
		   ^reset
                ].
            ].
	    macroDef removeFirstWhite.
	    macroDef postWhiteSpace: c priorWhiteSpace.
	    putToken.
	    put: c copy priorWhiteSpace: '').
    | ).
| )

( cpp stages define 
) _Define: cpp stages tokenizer copy _AddSlots: ( |
    parent** = traits cpp stages define.
    macroName <- ''.
    macroDef <- cpp tokens token.
| )


" I parse macro invocations, create the invocation tokens, add an expander
  to the pipe, and pass the invocation to the expander.
  Separating parsing from expanding makes things easier to understand"

traits cpp stages macroInvocation _Define: ( |
    parent** = traits cpp stages tokenizer.
  _ filterMixin* = traits cpp stages filterMixin.

    stageName = 'macroInvocation'.

    buildToken = (
	macroInv source: storedTokensString.
	macroInv makeDicts).

    copy = (resend.copy ignoreSet: ignoreSet copy).

    put: c = ( | w |
	w: extraWhite.
	extraWhite: ''.
	resend.put: c copyPrependWhite: w).

    reset = (
        resend.reset.
	nesting:  0).

    init = ( |
        process: c = ( | m. |
	    c isExpandable ifFalse:          [^put: c].
	    m: macros at: c source IfAbsent: [
	        builtInMacrosAt: c source IfAbsent: [^put: c]].
	    (ignoreSet includes: m name) ifTrue: [^put: c].
            >> c.

	    macroInv: 
	      m hasParens ifTrue: [tokens macroInvocationWithArgs]
		           False: [tokens macroInvocation].
	    macroInv: macroInv copy.
	    macroInv definition: m.
	    macroInv priorWhiteSpace: c priorWhiteSpace.
	    m hasParens ifTrue: [
	        state: nameOfArgMacro.
            ] False: [
	        -> macroExpander copy. 
	        putToken.
	        output bypass.
            ]).

    | ).
    nameOfArgMacro = ( |
        eof = (eofWarn).
	process: c = (
	    >> c.
	    c = '('  ifFalse: [
	      ^ flush.
            ].
	    state: left).
    | ).
    left = ( |
        eof = (eofWarn).
        process: c = (
	    c = ')' ifFalse: [ macroInv startingActual].
	    state: collecting.
	    reprocess: c).
    | ).
    collecting = ( |
        eof = (eofWarn).
	process: c = (
	    >> c.
            assert: [nesting >= 0].
	    c = '('  ifTrue: [nesting: nesting + 1].
	    (c = ',') && [nesting = 0]  ifTrue: [
	        macroInv addWhiteAfterActual: c priorWhiteSpace.
	        macroInv startingActual.
	      ^ self.
	    ].
	    c = ')'  ifTrue: [
		nesting = 0  ifFalse: [nesting: nesting - 1] 
			        True: [
	            macroInv actuals size = macroInv definition formals size  
		      ifFalse: [
	                warning: 
			         'macro ', macroInv definition name, ' needs ',
			         macroInv definition formals size printString, 
			         ' arguments, but ',
			         'invoked with ', 
			         macroInv actuals size printString.
                      ^ reset
	            ].
	            macroInv addWhiteAfterActual: c priorWhiteSpace.
	            -> macroExpanderWithArgs copy.
	            putToken.
	          ^ output bypass.
	        ].
            ].
	    macroInv addActualToken: c.
	    self).
    | ).

    builtInMacrosAt: n IfAbsent: ab = ( | s |
        ('_' = n first) && ['_' = n last] ifFalse: [^ab value]. "an opt"

	'__LINE__' = n ifTrue: [  ^  builtInMacro: n Int: inputLineNumber ].
	'__FILE__' = n ifTrue: [  ^  builtInMacro: n String: inputFileFullName ].
	'__TIME__' = n ifTrue: [  ^  builtInMacro: n String: timeString ].
	'__DATE__' = n ifTrue: [  ^  builtInMacro: n String: dateString ].

	ab value).

  _ timeString = ( | t |
	    t: time current.
	   (t hour   printStringLength: 2 Filler: 0), ':',
	   (t minute printStringLength: 2 Filler: 0), ':',
	   (t second printStringLength: 2 Filler: 0) ).

  _ dateString = ( | t |
            t: time current.
	   (t monthName copySize: 3), ' ',
	   (t date printStringLength: 2 Filler: ' '), ' ',
	    t year printString).

  _ builtInMacro: n String: s = ( | d |
        d: tokens macroDefinition  copy name: n.
	d bodyTokens addLast: 
	    ( tokens stringLit copy value: s )
	                            source: '"', s, '"'.
        d isBuiltIn: true.
	d).

  _ builtInMacro: n Int: i = ( | d |
        d: tokens macroDefinition  copy name: n.
	d bodyTokens addLast: (  tokens integer copy beDecimal value: i)
	                                             source: i printString.
        d isBuiltIn: true.
	d).
| )

( cpp stages macroInvocation 
) _Define: cpp stages tokenizer copy _AddSlots: ( |
    parent**   =  traits cpp stages macroInvocation.
    ignoreSet  <- set        copyRemoveAll.
    macroInv   <- cpp tokens macroInvocation.

    nesting    <- 0.
    extraWhite <- ''.
| )



" I expand the simple (no parens) macro invocations "
" To do that, I must handle the ## operator, which concatenates tokens,
  and also rescan the rest of the tokens for
  more macro invocations, avoiding recursion.
  I rescan by pushing another macro invocation parser on the pipe after me
  and telling him not to recognize the macros I don't recognize plus the macro
  I'm expanding.
  When he is done, I have to gather and dangling white space at the end and
  give it to the invocation parser before me, so he can tack it onto
  the front of the next token through.
"

traits cpp stages macroExpander _Define: ( |
    parent** = traits cpp stages filter.
  _ filterMixin* = traits cpp stages filterMixin.

    stageName = 'macroExpander'.

    process: t = (
	macroInv: t.
	expand).

    copy = (resend.copy expansion: expansion copy).

    assert = (assert: [t isMacroInvocation && [t hasParens not]]).

    expand = ( | oldOut |
	oldOut: output.
        -> macroInvocation copy.
	output ignoreSet: ignoreSet copy add: macroInv definition name.
        injectTokens.
	addFinalWhite: output extraWhite.
	macroInv definition isBuiltIn ifFalse: [
	    addFinalWhite: macroInv definition nonEmptyPostWhiteSpace
        ].
        oldOut input: self.
	output: oldOut).

     addFinalWhite: w = (
         input extraWhite: input extraWhite, w.  
	 self).

   _ injectTokens = (
        expansion: expansion copyRemoveAll.
	addWhite: macroInv priorWhiteSpace Into: expansion.
	macroInv definition bodyTokens do: [|:t| expansion addLast: t].
        mungeTokens.
 	expansion do: [|:bt| put: bt].
	self).

    printTokens: i = ( "for debugging"
        inputLineNumber = -1 ifTrue: [
	    i print. ' ' 
	    print.  
	    expansion printLine.
	].
        self).

    mungeTokens = (
        reintegrateWhite. 
	printTokens: 5.
	concatenateTokens. 
	printTokens: 6.
	reintegrateWhite.
	printTokens: 7.
	self).

    " useful control structure for token munching.
      Invokes a block with current token, in-list, (out list is expansion )
      and block to continue with next token."

    expansionDo: aBlock = ( | in. |
        in: expansion copy.
	expansion: expansion removeAll.
	[ in isEmpty ] whileFalse: [
	    [ |:continue| 
	        aBlock value: in removeFirst With: in With: continue
            ] exit.
        ].
	self).

    " control struct for the ## operator. "

    expansionCatFirst: firstBlock 
               Cat: catBlock
        MiddleLast: middleLastBlock
	      Post: postBlock
	      Else: elseBlock = (

        expansionDo: [|:t. :in. :continue. ahead |

            in isEmpty ifTrue: [elseBlock value: t.  continue value ].

	    ahead: in removeFirst.
	    ( ahead = '##' ) &&  [in isEmpty not]  ifFalse: [
	        in addFirst: ahead.
	        elseBlock value: t.
		continue value.
            ].
	    firstBlock value: t.
	    [|:exit|
	        catBlock value: ahead.
	        middleLastBlock value: in removeFirst.
	        in isEmpty ifTrue: exit.
	        ahead: in removeFirst.
	        ( ahead = '##' ) && [in isEmpty not]  ifFalse: [
	            in addFirst: ahead.
		    exit value.
                ].
            ] loopExit.
	    postBlock value.
	].
	self).
	    
    concatenateTokens = ( | p. |
	assert: [ expansion findFirst: [|:t| t isWhiteSpace] 
		         IfPresent: false 
			 IfAbsent:  true].

        p: main copy macros: macros.
	p input: self. "for error msgs"
	p ->  unexpandablizer copy
	  -> (addLaster copy destination: expansion )
	  ->  sink copy.
	p appendStages: p tokenStages.

	expansionCatFirst:  [|:t| t sourceForCPPOutput do: [|:c| p process: c]]
	           Cat:	 []
	    MiddleLast:  [|:t| t source do: [|:c| p process: c]]
	          Post:  [ p eof.  addWhite: p retrieveSavedWhite Into: expansion]
	          Else:  [|:t| expansion addLast: t]).

    reintegrateWhite = ( | p. |
        p: main copy macros: macros.
	p input: self. "for error msgs"
	p -> whiteFilter copy -> (addLaster copy destination: expansion) 
	  -> sink copy.
    
        expansionDo: [ | :t. :in |  p process: t].
	p eof.
	addFinalWhite: p retrieveSavedWhite.
	self).

    addWhite: w Into: out = (
	w isEmpty ifFalse: [
	    out addLast:  tokens whiteSpace copy priorWhiteSpace: w.
        ].
	self).
| )

cpp stages macroExpander _Define: cpp stages filter copy _AddSlots: ( |
    parent* = traits cpp stages macroExpander.
    macroInv <- cpp tokens macroInvocation.
    expansion <- list copyRemoveAll.
| )


" I expand macros with parens.
  First, I create quoted strings for any occurences of # formal.
  Then, I substitute in the rest of the formals, rescanning each actual
  for more macro invocations (which can be the same macro as me--foo(foo()).
  formals next to ##'s are not rescanned.
"
  
traits cpp stages macroExpanderWithArgs _Define: ( |
    parent* = traits cpp stages macroExpander.

    stageName = 'macroExpanderWithArgs'.

    assert = (assert: [t isMacroInvocation && [t hasParens]]).

    mungeTokens = (
	printTokens: 1.
        quoteEm.
	printTokens: 2.
	reintegrateWhite.
	printTokens: 3.
	substituteEm.
	printTokens: 4.
	resend.mungeTokens).

    quoteEm = (
        expansionDo: [| :t. :in. |
	    ( t = '#' )
        &&  [ in isEmpty not  
        &&  [ macroInv actualsDict includesKey: in first source ]]
              ifFalse: [expansion addLast: t. ]
	         True: [
	             addWhite: t priorWhiteSpace Into: expansion.
		     expansion addLast: 
		       tokens stringLit copy 
		         quote:
		           macroInv actualsDict at: in removeFirst source.
           ].
        ].
	self.).

    substituteEm = ( 
	expansionCatFirst:  [|:t| substituteFormal: t ExpandIf: false]
	           Cat:	 [|:t| expansion addLast: t]
	    MiddleLast:  [|:t| substituteFormal: t ExpandIf: false]
	          Post:  []
	          Else:  [|:t| substituteFormal: t ExpandIf: true ].
        self).

    substituteFormal: f ExpandIf: e = ( | ts |
        ts: macroInv actualsDict at: f source IfAbsent: [ 
            expansion addLast: f.  
	  ^ self.
        ].
        addWhite: f priorWhiteSpace Into: expansion.
	e ifFalse: [
	    ts do: [|:t| expansion addLast: t].
	  ^ self
        ].
        expand: ts Into: expansion).

    expand: in Into: out = ( | p |
        p: main copy macros: macros.
	p input: self. "for error msgs"
        p -> macroInvocation copy
	  -> (addLaster copy destination: out )
	  ->  sink copy.
	in do: [|:t| p process: t. ].
	p eof.
	addWhite: p output extraWhite Into: out.
	self).
| )

cpp stages macroExpanderWithArgs _Define: cpp stages macroExpander copy _AddSlots: ( |
    parent* = traits cpp stages macroExpanderWithArgs.
| )


" If the 2nd thru last tokens resulting from a concatenation happen
  to match a macro name, the match must be ignored, cause the book
  considers the ## op to produce ONE token, although we keep things
  tokenized as per C in order to do constant expressions.
  So this extra stage sets the unexpandable bit in such tokens.
"

traits cpp stages unexpandablizer _Define: ( |
    parent** = traits cpp stages filter.
  _ filterMixin* = traits cpp stages filterMixin.

    init = ( |
        process: t = (state: unIt.  put: t).
    | ).
    unIt = ( |
        eof = (state: init.  eof).
	process: t = (put: t copy isExpandable: false).
    | ).
| )

(cpp stages unexpandablizer _Define: cpp stages filter copy 
) _AddSlots: ( |
    parent** = traits cpp stages unexpandablizer.
    state*  <- traits cpp stages unexpandablizer init.
| )


"I support normal includes and also include_next for g++ emulation"

traits cpp stages include _Define: ( |
  _ parent** = traits cpp stages tokenizer.
  _ filterMixin* = traits cpp stages filterMixin.

  ^ stageName = 'include'.

  _ init = ( |
	process: t = (
	    t isDirectiveName ifFalse: [^ put: t].
	    t name = 'include'       
		ifTrue: [>> t.  kind: normal. ^ state: dir].
	    t name = 'include_next'  
		ifTrue: [>> t.  kind: next.   ^ state: dir].
	    put: t).
    | ).
  _ dir = ( |
	eof = (eofWarn).
	process: t = (
	    t isStringLit ifTrue: [
	        >> t.
	        fileName: t value.
	        searchHere: true.
              ^ state: foundName.
            ].
	    t source isEmpty not  && [t source first = '<']  ifTrue: [
	        >> t.
	        state: left.
	        fileName: ''.
	        searchHere: false.
	        reprocess: t copy source: t source copyWithoutFirst.
	      ^ self.
	    ].
	    tokensToExpand: list copyRemoveAll.
	    state: gathering.
	    reprocess: t).
    | ).
  _ left = ( |
	eof = (eofWarn).
	process: t = (
	    >> t.
	    t isNewline ifTrue: [warning: 'missing include file name'. ^reset].
	    t source do: [|:c|  fileName: fileName, c ].
	    fileName isEmpty not  && [fileName last = '>']  ifTrue: [
	        fileName: fileName copyWithoutLast.
	      ^ state: foundName.
	    ].
	    self).
    | ).
  _ gathering = ( |
        eof = (eofWarn).
        process: t = ( | p. out |
	    alreadyExpanded ifTrue: [
	        warning: '#include must have string or <fileName>'.
	        alreadyExpanded: false.
	      ^ reset.
            ].
	    t isNewline ifFalse: [ >> t.  tokensToExpand addLast: t.  ^ self].

            p: main copy macros: macros.
	    out: list copyRemoveAll.
	    p input: self. "for error msgs"
            p -> macroInvocation copy
	      -> whiteFilter copy
	      -> (addLaster copy destination: out )
	      ->  sink copy.
	    tokensToExpand do: [|:t| p process: t. ].
	    p eof.

	    state: dir.
	    alreadyExpanded: true.
	    out do: [|:t| reprocess: t].
	    reprocess: t.
	    alreadyExpanded: false).
    | ).
  _ foundName = ( |
	eof = (eofWarn).
	process: t = (
	    >> t.
	    t isNewline ifFalse: [
	        warning:  'extra baggage: ', t printString,
			   ' found after include file name'.
            ].
	    insertFileReader: makeReader.
	    reset).
    | ).
  _ normal = ( | _ myReader = (     fileReader ) | ).
  _ next   = ( | _ myReader = ( nextFileReader ) | ).

  _ makeReader = (
	(myReader copy inputFileName:  fileName   ) 
		          searchHere:  searchHere ).

| )

(cpp stages include _Define: cpp stages tokenizer copy 
) _AddSlots: ( |
  _ parent** = traits cpp stages include.
  _ state*  <- traits cpp stages include init.
  _ kind*   <- traits cpp stages include normal.
 "_" fileName <- ''.
 "_" searchHere <- false.
 "_" tokensToExpand <- list copyRemoveAll.
     alreadyExpanded <- false.
| )


" I merge adjacent string constants "

traits cpp stages stringMerger _Define: ( |
  _ parent** = traits cpp stages tokenizer.
  _ filterMixin* = traits cpp stages filterMixin.

  ^ stageName = 'stringMerger'.

  _ tokenProto = ( tokens stringLit).

 "_" storedTokensString = ( | r <- '"' |
        storedTokens do: [|:t| 
	    r: r, t source copyWithoutFirst copyWithoutLast.
	].
	r, '"').

  _ buildToken = ((
        resend.buildToken priorWhiteSpace: storedTokens first priorWhiteSpace)
	                            value: mergedValue ).

  _ init = ( |
	process: t = (
	    t isStringLit ifFalse: [ ^ put: t ].
	    >> t.
	    mergedValue: t value.
	    state: string).
    | ).
  _ string = ( |
	eof = (eofToken).
	process: t = (
	    t isStringLit ifTrue: [ 
	        mergedValue: mergedValue, t value.
		>> t.
	    ] False: [
	        putToken.  
		put: t.
	    ]).
    | ).
| )

(cpp stages stringMerger _Define: cpp stages tokenizer copy 
) _AddSlots: ( |
 _  parent** = traits cpp stages stringMerger.
 _  state*  <- traits cpp stages stringMerger init.
"_" mergedValue <- ''.
| )


" I represent line number directives emitted by the preprocessor for
  the compiler "

traits cpp stages line _Define: ( |
  _ parent** = traits cpp stages tokenizer.
  _ filterMixin* = traits cpp stages filterMixin.

  ^ stageName = 'line'.

  ^ emitLineNumberEntering: isEntering  = (
	put:
	  (((tokens lineNumberIncl copy fileName: inputFileFullName) 
	                              lineNumber: inputLineNumber)
				      isEntering: isEntering)
                           wasIncludedWithQuotes: wasIncludedWithQuotes).
  ^ emitLineNumber = (
	put:
	   ((tokens lineNumber copy fileName: inputFileFullName) 
	                              lineNumber: inputLineNumber)
                           wasIncludedWithQuotes: wasIncludedWithQuotes).

  ^ emitLineNumberSucc = (
	put:
	   ((tokens lineNumber copy fileName: inputFileFullName) 
	                              lineNumber: inputLineNumber succ)
                           wasIncludedWithQuotes: wasIncludedWithQuotes).

  _ init = ( |
	process: t = (
	    >> t.
	    t isDirectiveName && [t name = 'line'   ] ifTrue: [^state: line].
	    t isDirectiveName && [t name = 'oldLine'] ifTrue: [^state: line].
            flush).
    | ).
  _ line = ( |
	eof = (eofWarn).
	process: t = (
	    >> t.
	    t isIntegerToken ifFalse: [
		warning: 'missing line number in #line'.
	      ^ flush.
	    ].
	    "pred cause inputFile reader is about to increment counter 
	     for \n at end of #line line"
	    inputLineNumber: t value pred.
	    state: ln).
    | ).
  _ ln = ( |
	eof = (eofWarn).
	process: t = (
	    t isNewline   ifTrue: [state: fn.  ^ reprocess: t].
	    >> t.
	    t isStringLit ifTrue: [inputFileFullName: t value.  ^ state: fn].
	    warning:  'unexpected token: ', t printString, 
		       ' found instead of file name in #line directive'.
	    flush).
    | ).
  _ fn = ( |
	eof = (eofWarn).
	process: t = (
	    >> t.
	    t isNewline ifFalse: [
	        ^ warning:  'extra baggage: ', t printString,
		           ' found after line file name'.
            ].
            reset.
	    emitLineNumberSucc). "+1 cause fileReader hasn't incrd number yet"
    | ).
| )

(cpp stages line _Define: cpp stages tokenizer copy 
) _AddSlots: ( |
  _ parent** = traits cpp stages line.
  _ state*  <- traits cpp stages line init.
| )


traits cpp tokens pragma _Define: ( |
    parent** = traits cpp tokens token.
  _ filterMixin* = traits cpp stages filterMixin.

    tokenType = 'pragma'.
| )

cpp tokens pragma _Define: cpp tokens token copy _AddSlots: ( |
    parent* = traits cpp tokens pragma.
    body <- list copyRemoveAll.
| )

traits cpp stages miscDirs _Define: ( |
  _ parent** = traits cpp stages tokenizer.
  _ filterMixin* = traits cpp stages filterMixin.

  ^ stageName = 'miscDirs'.

  _ init = ( |
	process: t = (
            | names = ((set copyRemoveAll add: 'error') add: 'pragma') add: ''.
	    |
	    t isDirectiveName && [names includes: t name] ifFalse: [^put: t].
	    >> t.
	    state: dn).
    | ).
  _ dn = ( |
	eof = (eofWarn).
	process: t = ( | n |
	    >> t.
	    t isNewline ifFalse: [^ self].
	    n: storedTokens first name.
	    ''        = n ifTrue: [ put: t.  ^ reset ].
	    'pragma'  = n ifTrue: [ pragma.  ^ reset ].
	    'error'   = n ifTrue: [ errorD.  ^ reset ].
	    error: 'something is rotten in Denmark').

	pragma = (
	    storedTokens addFirst: 
	        storedTokens removeFirst copy source: '#pragma'.
	    put: (tokens pragma copy source: storedTokensString) 
	                               body: storedTokens copy).
	errorD = (storedTokens removeLast.  warning: storedTokensString). 
    | ).
| )

(cpp stages miscDirs _Define: cpp stages tokenizer copy 
) _AddSlots: ( |
  _ parent** = traits cpp stages miscDirs.
  _ state*  <- traits cpp stages miscDirs init.
| )

traits cpp stages ifdefs _Define: ( |
    parent** = traits cpp stages tokenizer.
  _ filterMixin* = traits cpp stages filterMixin.

    stageName = 'ifdefs'.

    copy = (((resend.copy isProcessing: isProcessing copy)
		          isInElsePart: isInElsePart copy)
	                  ifExpr: ifExpr copy).

    eof = (
	emitNLs.
        resend.eof).

    init = ( |
        process: c = (| n |
	    c isDirectiveName ifTrue: [
	        n: c name.
	        >> c.
	        'ifdef'  = n ifTrue: [expandIfDefined: true.  ^ state: ifdef ].
	        'ifndef' = n ifTrue: [expandIfDefined: false. ^ state: ifdef ].
	        'else'   = n ifTrue: [ ^ state: else  ].
	        'endif'  = n ifTrue: [ ^ state: endif ].
	        'if'     = n ifTrue: [ifExpr removeAll.  ^ state: if    ].
	        'elif'   = n ifTrue: [ifExpr removeAll.  ^ state: elif  ].
	        reset.
            ].
	    isProcessing first  ifTrue: [emitNLs.  put: c] False: [
	    c isNewline	        ifTrue: [tallyNL]].
	    self).
    | ).
    tallyNL = ( nlCount: nlCount succ ).
    emitNLs = ( "whacky, but mimics gnu cpp"
	nlCount > 8 ifTrue: [ emitLineNumber]
	             False: [nlCount do: [put: tokens newline]].
	nlCount: 0).
    ifdef = ( |
        eof = (eofWarn).
	
	process: c = (
	    >> c.
	    isDefined: macros includesKey: c source.
	    state: id).
    | ).
    else = ( |
	eof = (eofWarn).
	process: c = (
	    >> c.
	    c isNewline ifFalse: [^ self].
            tallyNL.
	    doElse.
            reset).
    | ).
    endif = ( |
	eof = (eofWarn).
	process: c = (
	    >> c.
	    c isNewline ifFalse: [^ self].
	    tallyNL.
	    doEndif.
            reset).
    | ).
    id = ( |
	eof = (eofWarn).
	process: c = (
	    >> c.
	    c isNewline ifFalse: [
		warning:  'extra baggage after identifer in ', 
			   storedTokensString.
              ^ self
            ].
            tallyNL.
            doIf: isDefined = expandIfDefined.
	    reset).
    | ).
    if = ( |
	eof = (eofWarn).
	process: c = (
	    >> c.
	    c isNewline ifFalse: [ifExpr addLast: c.  ^ self].
	    tallyNL.
	    doIf: [expand: ifExpr].
	    reset).
    | ).
    elif = ( |
	eof = (eofWarn).
	process: c = (
	    >> c.
	    c isNewline ifFalse: [ifExpr addLast: c.  ^ self].
	    tallyNL.
	    doElif: [expand: ifExpr].
	    reset).
    | ).

    expand: in = ( "macro-expand and evaluate for if expr"    
        | p. out |
	out: in copyRemoveAll.
        p: main copy macros: macros.
	p input: self. "for error msgs"
        p -> defined copy
	  -> macroInvocation copy
	  -> constExprMunger copy
	  -> constOpParser copy
	  -> constExpr copy
	  -> (addLaster copy destination: out )
	  ->  sink copy.
	in do: [|:t| p process: t. ].
	p eof.
	p finish.
        assert: [(out size = 1) && [out first isIntegerToken]].
        out first value != 0).

    doIf: expandB = (
	isProcessing addFirst: isProcessing first && expandB.
	isInElsePart addFirst: false.
        self).

    doElif: expandB = (
	isInElsePart first ifTrue: [
	    warning: '#elif without matching #if'.
	  ^ reset.
        ].
        isProcessing addFirst: 
            isProcessing removeFirst not && [isProcessing first && expandB].
        self).

    doElse = (
	isInElsePart removeFirst ifTrue: [
	    warning: '#else without matching #if'.
	    isInElsePart addFirst: true.
	  ^ reset.
        ].
	isInElsePart addFirst: true.
        "stop eating if this level eating, but next level not eating"
        isProcessing addFirst:
            isProcessing removeFirst not && [isProcessing first].
        self).

    doEndif = (
	isInElsePart removeFirst.
	isInElsePart isEmpty ifTrue: [
	    isInElsePart addFirst: true.
	    warning: 'unmatched #endif'.
        ].
	isProcessing removeFirst.
	self).
| )

( cpp stages ifdefs
) _Define: cpp stages tokenizer copy _AddSlots: ( |
    parent** = traits cpp stages ifdefs.
    state* <- traits cpp stages ifdefs init.
    expandIfDefined <- false.
    isDefined       <- false.
    isProcessing    <- list copyRemoveAll addFirst: true.
    isInElsePart    <- list copyRemoveAll addFirst: true.
    ifExpr          <- list copyRemoveAll.
    nlCount         <- 0.
| )


" handles defined keyword for #if"

traits cpp stages defined _Define: ( |
    parent** = traits cpp stages tokenizer.
  _ filterMixin* = traits cpp stages filterMixin.

    stageName = 'defined'.

    tokenProto = (tokens integer copy beDecimal beLong).  

    buildToken = (
	resend.buildToken value: 
	  (macros includesKey: id) ifTrue: 1 False: 0).

    init = ( |
	process: t = (
	    t = 'defined' ifFalse: [^put: t].
	    >> t.
	    state: def).
    | ).
    def = ( |
	eof = (eofWarn).
        process: t = (
            >> t.
            t = '(' ifTrue: [^ state: left].
            t isIdentifier ifTrue: [id: t source. ^ putToken].
	    warning: 'bad "defined" operator'.
	    flush).
    | ).
    left = ( |
	eof = (eofWarn).
	process: t = (
	    >> t.
            t isIdentifier ifTrue: [id: t source. ^ state: sawID].
	    warning: 'bad "defined(" operator'.
	    flush).
    | ).
    sawID = ( |
	eof = (eofWarn).
	process: t = (
	    >> t.
            t = ')' ifTrue: [^ putToken].
	    warning: 'no right paren found in "defined(" operator'.
	    flush).
    | ).
| )

cpp stages defined _Define: cpp stages tokenizer copy _AddSlots: ( |
    parent** = traits cpp stages defined.
    state*   <- traits cpp stages defined init.
    id <- ''.
| )


" replaces identifiers with 0L and longifies all ints for #if exprs"

traits cpp stages constExprMunger _Define: ( |
    parent** = traits cpp stages filter.
  _ filterMixin* = traits cpp stages filterMixin.

    stageName = 'constExprMunger'.

    process: t = (
        t isIdentifier ifTrue: [ 
          ^ put: tokens integer copy beDecimal beLong value: 0
        ].
        t isIntegerToken  ifTrue: [ ^ put: t copy beLong ].
	put: t).
| )

cpp stages constExprMunger _Define: cpp stages filter copy _AddSlots: ( |
    parent* = traits cpp stages constExprMunger.
| )

" catches illegal ops, sets the isUnary, isLtoR and precedence fields "

traits cpp stages constOpParser _Define: ( |
    parent** = traits cpp stages filter.
  _ filterMixin* = traits cpp stages filterMixin.

    stageName = 'constOpParser'.


    init = ( |
        process: t = (
	    t isOperatorToken not || [t = ')'] ifTrue: [ 
	        state: operand. 
              ^ put: t
            ].
            putOp: t IsU: true).
    | ).
    operand = ( |
        eof = (state: init.  output eof).
        process: t = (
            t = ')'  ifTrue: [ ^ put: t. ].
           (t = '(')  || [t isOperatorToken not]  ifTrue: [
	       ^ warning: 'missing operator in constant expression'
            ].
            state: init.
            putOp: t IsU: false).
    | ).
    putOp: op IsU: isU = ( | t |
        op = '(' ifTrue: [^ put: op].
        t: op copy isUnary: isU.
        isU ifTrue: [
            t isLtoR: false.
            t = '+' ifTrue: [ ^ put: t precedence: 15 ].
            t = '-' ifTrue: [ ^ put: t precedence: 15 ].
            t = '!' ifTrue: [ ^ put: t precedence: 15 ].
            t = '~' ifTrue: [ ^ put: t precedence: 15 ].
	  ^ warning:  'illegal unary operator: ', t source, 
		       ' in constant expression'.
        ].
        t isLtoR: true.
        t = '*' ifTrue: [ ^ put: t precedence: 14 ].
        t = '/' ifTrue: [ ^ put: t precedence: 14 ].
        t = '%' ifTrue: [ ^ put: t precedence: 14 ].

        t = '+' ifTrue: [ ^ put: t precedence: 13 ].
        t = '-' ifTrue: [ ^ put: t precedence: 13 ].

        t = '<<' ifTrue: [ ^ put: t precedence: 12 ].
        t = '>>' ifTrue: [ ^ put: t precedence: 12 ].

        t = '<'  ifTrue: [ ^ put: t precedence: 11 ].
        t = '>'  ifTrue: [ ^ put: t precedence: 11 ].
        t = '<=' ifTrue: [ ^ put: t precedence: 11 ].
        t = '>=' ifTrue: [ ^ put: t precedence: 11 ].

        t = '==' ifTrue: [ ^ put: t precedence: 10 ].
        t = '!=' ifTrue: [ ^ put: t precedence: 10 ].

        t = '&' ifTrue: [ ^ put: t precedence: 9. ].
        t = '^' ifTrue: [ ^ put: t precedence: 8. ].
        t = '|' ifTrue: [ ^ put: t precedence: 7. ].
        t = '&&' ifTrue: [ ^ put: t precedence: 6. ].
        t = '||' ifTrue: [ ^ put: t precedence: 5. ].
        t = '?' ifTrue: [ t isLtoR: false. ^ put: t precedence: 4. ].
        t = ':' ifTrue: [ t isLtoR: false. ^ put: t precedence: 4. ].
        t = ',' ifTrue: [ ^ put: t precedence: 3 ].
        warning: 'bad constant operator: ', t source).
| )

cpp stages constOpParser _Define: cpp stages filter copy _AddSlots: ( |
    parent** = traits cpp stages constOpParser.
    state* <- traits cpp stages constOpParser init.
| )


" a precedence parser and evaluator for const exprs"

traits cpp stages constExpr _Define: ( |
    parent** = traits cpp stages filter.
  _ filterMixin* = traits cpp stages filterMixin.

    stageName = 'constExpr'.

        finish = (
	    [operators isEmpty] whileFalse: [reduce].
            operands isEmpty ifTrue: [
	        warning: 'empty constant expression'.
	        operands addLast: tokens integer copy value: 0.
            ].
	    put: operands removeLast.
            operands isEmpty ifFalse: [
	        warning: 'extra operands in constant expression'
            ].
	    self).

        process: t = (
            t isOperatorToken not ifTrue: [
	        operands addLast: 
	            t isIntegerToken ifTrue: [t] False: [
	                warning: 'illegal operand: ', t printString, 
		                 ' in constant expression'.
                        tokens integer copy value: 0.
                    ].
		  ^ self.
            ].
            t = '(' ifTrue: [
	        operators addLast: t.
	      ^ self.
            ].
	    t = ')' ifTrue: [
                [|:exit|
	            operators isEmpty ifTrue: [
		        warning: 'unmatched ")" in constant expression'.
	              ^ self
                    ].
	            operators last = '(' ifTrue: exit.
	            reduce.
                ] loopExit.
	        operators removeLast.
              ^ self.
            ].
            [|:exit|
	        operators isEmpty                         ifTrue: exit.
		(operators last = '?') && [t != ':']	  ifTrue: exit.
	        operators last precedence < t precedence  ifTrue: exit.
               (operators last precedence = t precedence)
            && [t isLtoR not]                             ifTrue: exit.
                reduce.
            ] loopExit.
            operators addLast: t.
	    self).

    reduce = (
        operands addLast:
            operators last isUnary ifTrue: [reduceUnary] False: [reduceBinary].
	self).

    reduceUnary = ( | t. x. r. xIsUns |
	t: operators removeLast.
        operands isEmpty ifTrue: [
	    warning: 'missing operand in constant expression'.
	  ^ tokens integer copy].
        xIsUns: operands last isUnsigned.
	x: operands  removeLast value.
        r:
            t = '+' ifTrue: [ x                        ]  False: [
            t = '-' ifTrue: [ x negate                 ]  False: [
            t = '!' ifTrue: [ x = 0 ifTrue: 1 False: 0 ]  False: [
            t = '~' ifTrue: [ x negate - 1             ]  False: [ 
            t = '(' ifTrue: [ warning: 'unmatched "(" in constant expression'.
                              x                        ]  False: [ 
                      error: 'bad unary op']]]]].

        r: tokens integer copy beLong value: r.
	xIsUns ifTrue: [r beUnsigned].
	r fixupValue).

    reduceBinary = ( 
        | t. x1. x2. r. x1IsUns. x2IsUns. isUns. 
          x1u. x1h. x1l. x2u. x2h. x2l.
	  two16 = 2 power: 16.
        |
        t: operators removeLast.
        operands size < 2 ifTrue: [
	    warning: 'missing operand in constant expression'.
	  ^ 0].
        t = ',' ifTrue: [r: operands removeLast. operands removeLast. ^ r].

        x2IsUns: operands last isUnsigned.
        x1IsUns: operands last isUnsigned.
        isUns: x1IsUns || x2IsUns.

	x2u:	 operands last copy beUnsigned fixupValue value.
        x2:      isUns ifTrue: [x2u] False: [operands last value].
        x2h:     x2u / two16.
        x2l:     x2u % two16.
	operands removeLast.

	x1u:	 operands last copy beUnsigned fixupValue value.
        x1:      isUns ifTrue: [x1u] False: [operands last value].
        x1h:     x1u / two16.
        x1l:     x1u % two16.
	operands removeLast.

        r:
            t = '*'  ifTrue: [ x1 * x2 ]  False: [
            t = '/'  ifTrue: [ x1 / x2 ]  False: [
            t = '%'  ifTrue: [ x1 % x2 ]  False: [

            t = '+'  ifTrue: [ x1 + x2 ]  False: [
            t = '-'  ifTrue: [ x1 - x2 ]  False: [

            t = '<<' ifTrue: [ x1 * (2 power: x2) ]  False: [
            t = '>>' ifTrue: [ x1 / (2 power: x2) ]  False: [

            t = '<'  ifTrue: [ x1 <  x2 ]  False: [
            t = '>'  ifTrue: [ x1 >  x2 ]  False: [
            t = '<=' ifTrue: [ x1 <= x2 ]  False: [
            t = '>=' ifTrue: [ x1 >= x2 ]  False: [

            t = '==' ifTrue: [ x1  = x2 ]  False: [
            t = '!=' ifTrue: [ x1 != x2 ]  False: [

            t = '&'  ifTrue: [ ((x1h && x2h) * two16      ) 
                             + ((x1l && x2l) && two16 pred)]  False: [
            t = '^'  ifTrue: [ ((x1h ^^ x2h) * two16      ) 
                             + ((x1l ^^ x2l) && two16 pred)]  False: [
            t = '|'  ifTrue: [ ((x1h || x2h) * two16      ) 
                             + ((x1l || x2l) && two16 pred)]  False: [


            t = '&&' ifTrue: [ (x1 != 0) && [x2 != 0] ] False: [
            t = '||' ifTrue: [ (x1 != 0) || [x2 != 0] ] False: [
            t = ':'  ifTrue: [ reduceIfThen: x1 Else: x2 ] False: [

            error:  'bad binary op: ', t printString. ]]]]]]]]]]]]]]]]]]].

        r: r asInteger.
        r: tokens integer copy beDecimal beLong value: r.
        isUns ifTrue: [r beUnsigned].
        r fixupValue). 

    reduceIfThen: then Else: else = (
        operators removeLast = '?' ifFalse: [
	    warning: '":" without "?" in constant expression'.
	  ^ 0.
        ].
        operands isEmpty ifTrue: [
	    warning: 'missing operand for ?: in constant expression'.
	  ^ 0.
        ].
	operands removeLast value != 0 ifTrue: [then] False: [else]).

    copy = ((resend.copy operators: operators copy) operands: operands copy).
| )

cpp stages constExpr _Define: cpp stages filter copy _AddSlots: ( |
    parent** = traits cpp stages constExpr.

    operators <- list copyRemoveAll.
    operands <- list copyRemoveAll.
| )
