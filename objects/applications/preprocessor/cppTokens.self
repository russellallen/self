"$Revision: 8.1 $"

"I hold cpp-specific tokens"

traits cpp      _AddSlotsIfAbsent: ( |
    tokens = ().
| )
prototypes  cpp _AddSlotsIfAbsent: ( |
    tokens = ().
| )

traits cpp tokens _AddSlotsIfAbsent: ( |
    token = ().
    directiveName = ().
    macroDefinition = ().
    macroDefinitionWithArgs = ().
    macroInvocation = ().
    macroInvocationWithArgs = ().
    pragma = ().
    lineNumber = ().
    lineNumberIncl = ().
| )

prototypes cpp tokens _AddSlotsIfAbsent: ( |
    directiveName = ().
    macroDefinition = ().
    macroDefinitionWithArgs = ().
    macroInvocation = ().
    macroInvocationWithArgs = ().
    pragma = ().
    lineNumber = ().
    lineNumberIncl = ().
| )

traits cpp tokens _AddSlots: ( |
    names*     = traits cLexer tokens.
| )

prototypes cpp tokens _AddSlots: ( |
    names*     = cpp.
    moreNames** = cLexer tokens.
| )

traits cpp tokens token _Define: ( |
    parent** = traits cLexer tokens token.
    names*   = cpp tokens.
| )

traits cpp tokens directiveName _Define: ( |
    parent* = traits cpp tokens token.
    isDirectiveName = true.
    tokenType = 'directiveName'.
| )

cpp tokens directiveName _Define: cpp tokens token copy _AddSlots: ( |
    parent* = traits cpp tokens directiveName.
    name <- ''.
| )


" I represent a simple #define line"

traits cpp tokens macroDefinition _Define: ( |
    parent* = traits cpp tokens token.

    tokenType = 'macroDefinition'.

    copy = ( resend.copy bodyTokens: bodyTokens copy).

    removeFirstWhite = (
        bodyTokens isEmpty ifTrue: [^ self].
	bodyTokens addFirst: bodyTokens removeFirst copyRemoveFirstWhite.
        self).

    sourceForPrinting = (
	   inputFileFullName, ' ', inputLineNumber printString, ': ', 
	   resend.sourceForPrinting
	).

    hasParens = false.
    formals = vector.

    nonEmptyPostWhiteSpace = (
        postWhiteSpace isEmpty ifTrue: ' ' False: [postWhiteSpace]).
| )

cpp tokens macroDefinition _Define: cpp tokens token copy _AddSlots: ( |
    parent*            = traits cpp tokens macroDefinition.
    name              <- ''.
    bodyTokens        <- list copyRemoveAll.
    isBuiltIn         <- false. "to get white right vs. g++"
    " for debugging: "
    inputFileFullName <- ''.
    inputLineNumber   <- 0.
    postWhiteSpace    <- ''.
| )


traits cpp tokens macroDefinitionWithArgs _Define: ( |
    parent* = traits cpp tokens macroDefinition.

    tokenType = 'macroDefinitionWithArgs'.
    copy      = ( resend.copy formals: formals copy).
    hasParens = true.
| )

(cpp tokens macroDefinitionWithArgs _Define: 
  cpp tokens macroDefinition copy _AddSlots: ( |
    parent* = traits cpp tokens macroDefinitionWithArgs.
    formals  <- list copyRemoveAll.
| ) )


" I represent the parsed use of a simple macro"

traits cpp tokens macroInvocation _Define: ( |
    parent*           = traits cpp tokens token.
    isMacroInvocation = true.
    actuals 	      = vector.
    whiteAfterActuals = vector.
    tokenType         = 'macroInvocation'.
    makeDicts 	      = (self).
| )

cpp tokens macroInvocation _Define: cpp tokens token copy _AddSlots: ( |
    parent* = traits cpp tokens macroInvocation.

    definition <- cpp tokens macroDefinition.
| )


traits cpp tokens macroInvocationWithArgs _Define: ( |
    parent* = traits cpp tokens macroInvocation.

    copy = ((
	       resend.copy  actuals: 	           actuals copy) 
			    actualsDict: 	   actualsDict copy).

    "called to start adding a new actual"
    startingActual    = (actuals addLast: list copyRemoveAll).
 
    addActualToken: t = (actuals last addLast: t.  self).


    tokenType = 'macroInvocationWithArgs'.
    makeDicts = (
	definition formals with: actuals           
	                   Do: [|:f. :a| actualsDict  at: f source Put: a].
	self).

    addWhiteAfterActual: s = ( 
	"records white space after the last actual, before a , or )"
        actuals isEmpty ifTrue: [^self].
        actuals last addLast: cpp tokens whiteSpace copy priorWhiteSpace: s.
        self).
| )

( cpp tokens macroInvocationWithArgs  _Define: 
  cpp tokens macroInvocation copy _AddSlots: ( |
    parent* = traits cpp tokens macroInvocationWithArgs.

    actuals               <- list copyRemoveAll.
    actualsDict	          <- dictionary copyRemoveAll.
| ) )


" used only to output line numbers, reified for C  parser in a weird way: "

traits cpp tokens lineNumber _Define: ( |
  _ parent*   = traits cpp tokens token.
  ^ tokenType = 'lineNumber'.

  _ fudgedLineNumber  = ( lineNumber pred max: 1).
  _ enteringOrExiting = ''.
  _ includeType       = ( wasIncludedWithQuotes ifTrue: ''  False: ' 3').
  _ fudgedNL          = ( lineNumber = 1 ifTrue: '' False: '\n').

    sourceForCPPOutput = (
        '# ', 
        fudgedLineNumber printString,  
        ' "', fileName, '"',
        enteringOrExiting, 
        includeType,
	fudgedNL,
        '\n'
      ).

    sourceForPrinting = (fileName, ': ', lineNumber printString).
| )

cpp tokens lineNumber _Define: cpp tokens token copy _AddSlots: ( |
  _ parent* = traits cpp tokens lineNumber.
    fileName   <- ''.
    lineNumber <- 0.
    wasIncludedWithQuotes <- false. "<> vs quotes"
| )
" used in a weird way: "

" compat w/ gnu "

traits cpp tokens lineNumberIncl _Define: ( |
  _ parent*   = traits cpp tokens lineNumber.
  ^ tokenType = 'lineNumberIncl'.

  _ fudgedLineNumber  = (lineNumber - (isEntering ifTrue: 0 False: 1)).
  _ enteringOrExiting = (isEntering ifTrue: ' 1'  False: ' 2' ).
  _ fudgedNL          = (isEntering ifTrue: '' False: '\n').
| )

cpp tokens lineNumberIncl _Define: cpp tokens lineNumber copy _AddSlots: ( |
  _ parent* = traits cpp tokens lineNumberIncl.
    isEntering <- true.
| )
