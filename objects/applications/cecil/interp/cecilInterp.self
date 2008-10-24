"Sun-$Revision: 9.1 $"

"cecilInterp.self"
"Cecil Interpreter"

"Defines the top-level interpreter object and methods for it."
traits cecil_interp _AddSlotsIfAbsent: ( | cecil_interpreter = () | )
traits cecil_interp _AddSlotsIfAbsent: ( | cecil_compiler = () | )

traits cecil_interpreter _Define: ( |
    parent* = traits clonable.
    errHandlingParent* = mixins cecil_error_handling.

    printString = 'cecil_interpreter'.

    copyQuietly: quietly TypeChecking: tc = ( | ci |
	ci: resend.copy.
	ci beQuiet: quietly.
	ci doTypeCheck: tc.
	ci staticContext:  staticContext  copyWithInterp: ci Time: 'static'.
	ci dynamicContext: dynamicContext copyWithInterp: ci Time: 'dynamic'.
	"this is just a hack, and doesn't really work properly in all cases"
	ci messagesAffectedByPredicateObjects:
	    messagesAffectedByPredicateObjects copy.
	ci ).
    copyQuietly: quietly = ( copyQuietly: quietly TypeChecking: false ).
    copyQuiet = ( copyQuietly: true  ).
    copyNoisy = ( copyQuietly: false ).
    copy = ( copyQuiet ).

    "prelude -- read in the defaults for cecil and create the top context"
    prelude = ( | tmp. asts. |
	'Reading standard prelude...' print.
	beQuiet ifFalse: [ '' printLine ].

	"read in the file of all predefined code"
	process: 'predefined.cecil'.

	"mark all these methods as predefined, and ignored by reset"
	staticContext markPredefined.
	dynamicContext markPredefined.
	'done.' printLine.
    ).

    "compile a file"
    compile: fileName = (
	compiler:
	    cecil_compiler copyWithName: (withExtension: fileName) Interp: self.
	doCompile: true.
	process: compiler fileToCompile AllowExpressions: true.
	doCompile: false.
    ).

    "throw away all but predefined bindings"
    reset = (
	staticContext reset.
	dynamicContext reset.
    ).

    "parse into a fresh context"
    resetAndProcess: fileName = ( | topObj |
	reset.
	process: fileName.
    ).

    "continue parsing another file in the current context"
    process: fileName = ( process: fileName AllowExpressions: false ).
    process: fileName AllowExpressions: allowExprs = (
	catchingAbortsDo: [ | asts. extendedName. |
	    extendedName: withExtension: fileName.
	    asts: parseFile: extendedName AllowExpressions: allowExprs.
	    doTypeCheck ifTrue: [ typeCheck: asts ].
	    doCompile ifTrue: [ 
		compiler compile: asts Context: staticContext 
		    FileName: extendedName.
	    ] False: [
		asts eval: dynamicContext.
	    ].
	].
    ).

    "parse a file in the current context, without breaking the decl block"
    parseFile: fileName = ( parseFile: fileName AllowExpressions: false ).
    parseFile: fileName AllowExpressions: allowExprs = ( 
	| s. p. incNode. endIncNode. asts. extendedName. prevName. parseName.
	  fastParse. |
	"If allowExprs is true, expressions are allowed.  Otherwise, the
	 current decl block is extended with the decls from the named file"
	prevName: fullFileName.
	extendedName: withExtension: fileName.
	setCurrentFile: extendedName.
	fastParse: false.
	parseName: extendedName.
	doCompile ifTrue: [ 
	    compiler fileSet add: extendedName.
	    (compiler outOfDate: extendedName) ifTrue: [
		compiler staleFiles add: extendedName.
	    ] False: [
		compiler fullBuild ifFalse: [
		    fastParse: true.
		    parseName: compiler compactFileName: extendedName.
		].
	    ].
	].
	s: cecil_scanner createOnFile: parseName.
	p: cecil_parser createOn: s Interpreter: self.
	p fastParse: fastParse.
	debugMsg: 
	    (p fastParse ifTrue: ['Skimming '] False: ['Parsing ']), 
	    extendedName.
	doCompile && [ allowExprs ] ifTrue: [
	    asts: p parseDeclsStmtsAndExprs.
	] False: [ | returnVal |
	    asts: p parseDecls.
	].
	doCompile && [ fastParse not ] ifTrue: [
	    compiler saveCompact: extendedName ASTs: asts Anons: p anonList.
	].
	incNode: cecil_include_node copyName: extendedName.
	endIncNode: cecil_end_include_node copyName: extendedName.
	incNode topLevel: allowExprs.
	incNode fastParse: fastParse.
	incNode companion: endIncNode.
	endIncNode topLevel: allowExprs.
	asts addFirst: incNode.
	asts add: endIncNode.
	setCurrentFile: prevName.
	asts ).

    eval: aString = (
	catchingAbortsDo: [ | s. p. asts. |
	    s: cecil_scanner createOnString: aString.
	    p: cecil_parser createOn: s Interpreter: self.
	    asts: p parseDeclsStmtsAndExprs.
	    doTypeCheck ifTrue: [ typeCheck: asts ].
	    doCompile ifTrue: [
		compiler compile: asts Context: staticContext 
	    ] False: [
		asts eval: dynamicContext 
	    ] 
	]
    ).

    _ catchingAbortsDo: block = ( | prev_error_abort_block. result. |
	prev_error_abort_block: error_abort_block.
	error_abort_block: [
	    error_abort_block: prev_error_abort_block.
	    ^ cecil_void ].
	result: block value.
	error_abort_block: prev_error_abort_block.
	result ).	

    readEvalPrintLoop = (
	[ | :exit. input. |
	    input: read.
	    input isEmpty ifTrue: exit.
	    [ | :exit2. result. |
		exitBlock: exit2.
		result: eval: input.
		result !== cecil_void ifTrue: [
		    result cecilPrintString printLine.
		    addResultsToUI ifTrue: [
			ui add: result.
		    ].
		    showInCecilUI ifTrue: [
			cecilUI addObj: result.
		    ].
		].
	    ] exit.
	] loopExit.
	stdin reset.
	self.
    ).

    read = ( | input <- ''. result <- ''. |	
	stdin reset.
	[   
	    result = '' ifTrue: [ printPrompt ] False: [ printContiPrompt ].
	    input: stdin readLine.
	    result = '' ifTrue: [ 
		result: input.
	    ] False: [
		"adding the newline character then the error message 
                 will print out the exact line number for tokens"
		result: result, '\n', input.
	    ].
	    (endOfExpression: result) ifTrue: [ 
		input: ''.
	    ] False: [ 
		(stdin atEOF) ifFalse: [ input: 'not yet' ].
	    ].
	] untilTrue: [ input = '' ].
	result.
    ).

    endOfExpression: aString = ( | depth |
	depth: 0.
	aString do: [ | :char |
	    (char = '(') || [char = '{'] ifTrue: [ depth: depth + 1 ].
	    (char = ')') || [char = '}'] ifTrue: [ depth: depth - 1 ].
	    (char = ';') && [depth <= 0] ifTrue: [ ^ true ].
	].
	false ).

    printPrompt = ( 'Cecil> ' print ).
    printContiPrompt = ( '     > ' print ).

    setCurrentFile: name = ( | s |
	fullFileName: name.
	rootFileName: withoutExtension: name.
    ).

    "helper functions that add/remove the .cecil suffix"
    withExtension: name = ( | suffix = '.cecil'. prefixSize. |
	prefixSize: name size - suffix size.
	(prefixSize > 0) && [ (name copyFrom: prefixSize) = suffix ]
	    ifTrue: name False: [ name, '.cecil' ] ).
    withoutExtension: name = ( | suffix = '.cecil'. prefixSize. |
	prefixSize: name size - suffix size.
	(prefixSize > 0) && [ (name copyFrom: prefixSize) = suffix ]
	    ifTrue: [ name copySize: prefixSize ] False: name ).
| )

globals cecil_interp _AddSlotsIfAbsent: ( | cecil_interpreter = () | )
cecil_interpreter _Define: ( |
    parent* = traits cecil_interpreter.
    thisObjectPrints = true.

    "top-level contexts"
    staticContext <- cecil_top_context.
    dynamicContext <- cecil_top_context.
    
    "block called within exit() primitive to quit evaluating expression"
    exitBlock <- nil.

    "set of messages that can't be cached because of predicate objects
     interactions (not completely accurate, but good enough for us for now) "
    messagesAffectedByPredicateObjects <- set.

    "cache method lookups"
    optimizingCecilMethodLookup <- true.

    "introduce shared parent for each closure created from a particular
     closure ast node, attach shared eval method to that shared parent; closure
     object contains lexical scope"
    optimizingCecilClosure <- true.

    "add results to the Self UI (assumes the UI is running)"
    addResultsToUI <- false.
    showInCecilUI <- false.

    "do type checking?"
    doTypeCheck <- false.
    signaturesNeedTypeChecking <- false.

    "do instantiation?"
    doInstantiation <- false.

    " Compiler variables "
    doCompile <- false.
    compiler <- nil. "or cecil_compiler."

    fullFileName <- 'base'.
    rootFileName <- 'base'.	"file presently being processed"

    "require explicit void?"
    explicitVoid <- true.

    "assignments are expressions?"
    assignAsExpr <- false.
| )

"really should be added to a methods name space"
globals cecil_interp _AddSlots: (|
    cecil = ( | ci |
	ci: cecil_interpreter copy.
	ci prelude.
	ci readEvalPrintLoop.
    ).
    noisyCecil = ( | ci |
	ci: cecil_interpreter copyNoisy.
	ci prelude.
	ci readEvalPrintLoop.
    ).
    typeCheckingCecil = ( | ci |
	ci: cecil_interpreter copyQuietly: true TypeChecking: true.
	ci prelude.
	ci readEvalPrintLoop.
    ).
    noisyTypeCheckingCecil = ( | ci |
	ci: cecil_interpreter copyQuietly: false TypeChecking: true.
	ci prelude.
	ci readEvalPrintLoop.
    ).
    compilingCecil: fileName = ( | ci |
	ci: cecil_interpreter copyQuietly: false TypeChecking: false.
	ci compile: fileName.
	'Compile finished' ).
|)
