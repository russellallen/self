"Sun-$Revision: 9.1 $"

traits cecil_interp _AddSlotsIfAbsent: ( | compile_stream = () | )
traits compile_stream _Define: ( |
    parent* = traits clonable.
    errHandlingParent* = mixins cecil_error_handling.

    copy = ( resend.copy clearBuffer ).
    clearBuffer = (
	buffer: collector copyFirst: ''.
	isEmpty: true.
	endsLine: true.
	indent: 0.
	self ).

    closeStream = (
	isEmpty ifFalse: [ error: 'stream not flushed'. ].
    ).

    addCode: s = ( | s1 |
	s isEmpty ifTrue: [ ^ self ].
	endsLine ifTrue: [ | l |
	    "need to indent new code"
	    l: s asTextLines.
	    l indent: indent * 2.
	    s1: l asCollector.
	] False: [
	    s1: s.
	].
	buffer: buffer & s1.
	isEmpty: false.
	endsLine: s last = '\n'.
    ).
    prependCode: s = ( | b. el. |
	s isEmpty ifTrue: [ ^ self ].
	buffer: s & buffer.
	isEmpty: false.
	"endsLine stays the same"
    ).

    appendFromStream: s = (
	s isEmpty ifTrue: [ ^ self ].
	buffer: buffer & s buffer.
	isEmpty: false.
	endsLine: s endsLine.
	s clearBuffer.
    ).
    prependFromStream: s = (
	s isEmpty ifTrue: [ ^ self ].
	buffer: s buffer & buffer.
	isEmpty: false.
	"endsLine stays the same"
	s clearBuffer.
    ).

    indentRight = ( indent: indent successor. ).
    indentLeft = ( 
	indent > 0 ifFalse: [ error: 'moving indent below 0' ].
	indent: indent predecessor. 
    ).
| )

globals cecil_interp _AddSlotsIfAbsent: ( | compile_stream = () | )
globals compile_stream _Define: ( |
    parent* = traits compile_stream.
    buffer <- collector copyFirst: ''.
    isEmpty <- true.
    endsLine <- true.
    indent <- 0.
| )


traits cecil_interp _AddSlotsIfAbsent: ( | compile_stream_file = () | )
traits compile_stream_file _Define: ( |
    parent* = traits compile_stream.

    openStream: name = (
	file: file openForWriting: name. 
    ).
    closeStream = (
	resend.closeStream.
	file isOpen ifFalse: [ error: 'file not open' ].
	file close.
    ).

    emit = (
	file write: buffer flatString.
	clearBuffer.
    ).
| )

globals cecil_interp _AddSlotsIfAbsent: ( | compile_stream_file = () | )
globals compile_stream_file _Define: compile_stream clone _AddSlots: ( |
    parent* = traits compile_stream_file.
    file <- unixFile.
| )


traits cecil_interp _AddSlotsIfAbsent: ( | cecil_compiler = () | )
traits cecil_compiler _Define: ( |
    parent* = traits clonable.
    errHandlingParent* = mixins cecil_error_handling.

    copyWithName: s Interp: i = ( | c |
	debugMsg: 'Initializing compiler...'.
	c: resend.copy.
	c interp: i.
	c fileToCompile: s.
	c initStream: initStream copy.
	c mainStream: mainStream copy.
	c funcStream: funcStream copy.
	c typeStream: typeStream copy.
	c appInitStream: appInitStream copy.
	c appStructStream: appStructStream copy.
	c globalInitStream: globalInitStream copy.
	c selectorStream: selectorStream copy.
	c methodTableStream: methodTableStream copy.
	c currentStream: funcStream.
	c initializeSelectorTable.
	c initializeConstrainedPositionsTable.
	c setupManglingTable.
	c includeSet: includeSet copyRemoveAll.
	c fileSet: fileSet copyRemoveAll.
	c staleFiles: staleFiles copyRemoveAll.
	c includeStack: includeStack copyRemoveAll.
	c streamStack: streamStack copyRemoveAll.
	c closureNum: 0.
	c mapNum: 0.
	c contextNum: 0.
	c ).

    newMapNum = (
	mapNum: mapNum succ.
	mapNum ).
    newContextNum = (
	contextNum: contextNum succ.
	contextNum ).
    newClosureNum = (
	closureNum: closureNum succ.
	closureNum ).

    getFileTime: fileName = (
	(system unix stat: (unixFile expand: fileName) IfFail: [ ^ 0 ])
	    st_mtimeIfFail: 0 ).

    compactFileName: fileName = ( fileName, '.data' ).

    outOfDate: fileName = ( 
	| cecilName. sourceTime. objTime. headerTime. localHeadTime. dataTime |
	" Returns true if C code is older than .cecil file, or if the C
	 files don't exist "
	cecilName: unixFile locate: fileName IfFail: [ ^ true ].
	sourceTime: getFileTime: cecilName.
	objTime: getFileTime: fileName, '.c'.
	headerTime: getFileTime: fileName, '.h'.
	localHeadTime: getFileTime: fileName, '.local.h'.
	dataTime: getFileTime: compactFileName: fileName.
	objTime: objTime min: headerTime min: dataTime min: localHeadTime.
	sourceTime >= objTime ).

    saveCompact: fileName ASTs: astNodes Anons: anonList = (
	| f. newRep. fName. |
	fName: compactFileName: fileName.
	newRep: '-- Saved representation\n',  " Avoids 0 length files "
	    astNodes savedRepresentation, 
	    anonList savedRepresentation.
	fullBuild not && generateAppInit not ifTrue: [ 
	    "Test if the compact representation has changed.  If so,
	     we need to generate the application specific init code, since
	     field layouts may have changed."
	    [ | :exit. rep. |
		f: unixFile copy openForReading: fName
		    IfFail: [ generateAppInit: true. exit value. ].
		f size != newRep size ifTrue: [
		    " Optimization: don't read if they're not the same size "
		    generateAppInit: true.
		] False: [
		    rep: f readCount: f size.
		    rep != newRep ifTrue: [
			generateAppInit: true.
		    ].
		].
		f close.
	    ] exit.
	].
	f: unixFile copy openForWriting: fName.
	f write: newRep.
	f close.
    ).

    openStreams: fileName RealMain: realMain Context: context = ( 
	| baseName. funcName. |
	debugMsg: ('' padOnLeft: nestedDepth), 
	    'Outputting to ', fileName, '.[ch]'.
	nestedDepth: nestedDepth succ.
	baseName: outputDir, fileName.
	funcName: asCName: interp rootFileName.
	funcStream openStream: baseName, '.c'.
	typeStream openStream: baseName, '.h'.
	selectorStream openStream: baseName, '.local.h'.
	funcStream addCode: '#include "cecil.h"\n'.
	funcStream addCode: '#include "', fileName, '.h"\n'.
	funcStream addCode: '#include "', fileName, '.local.h"\n\n'.
	funcStream emit.
	typeStream addCode: '#ifndef ', (asCName: interp rootFileName), '_h\n'.
	typeStream addCode: '#define ', (asCName: interp rootFileName), '_h\n'.
	realMain ifTrue: [
	    methodTableStream addCode: '\nvoid init_methods() {\n'.
	    mainStream addCode: '\nOOP cecil_main() {\n'.
	] False: [
	    methodTableStream addCode: 
		'\nvoid ', funcName,'_init_methods() {\n'.
	    mainStream addCode: '\nOOP ',funcName,'_main() {\n'.
	    typeStream addCode: '\nOOP ',funcName,'_main();\n'.
	    typeStream addCode: 'void ', funcName,'_init();\n'.
	    typeStream addCode: 'void ', funcName,'_init_methods();\n\n'.
	].
	methodTableStream indentRight.
	mainStream indentRight.
	realMain ifTrue: [
	    initStream addCode: 
		'\nextern void cecil_environment_init();\n'.
	    initStream addCode: 'void init_cecil() {\n'.
	] False: [
	    initStream addCode: 'void ', funcName, '_init() {\n'.
	].
	initStream indentRight.
	initStream addCode: 'CecilMap* lastMap;\n'.
	realMain ifTrue: [
	    initStream addCode: 'cecil_environment_init();\n'.
	].
	switchToFunc.  " Switch to func stream by default "
	context closureList: list copyRemoveAll.
	context fieldVarList: list copyRemoveAll.
    ).
    closeStreams: context RealMain: realMain = ( | env |
	debugMsg: ('' padOnLeft: nestedDepth),
	    '** Generating method table and main'.
	nestedDepth: nestedDepth pred.
	methodTableStream indentLeft.
	methodTableStream addCode: '}\n'.
	realMain ifFalse: [
	    mainStream addCode: 'return UNINITIALIZED_OOP;\n'.
	].
	mainStream indentLeft.
	mainStream addCode: '}\n\n'.
	currentStream appendFromStream: methodTableStream.
	currentStream appendFromStream: mainStream.
	emit.
	env: context generateEnvironment: self ForFile: interp rootFileName.
	switchToType.
	addCode: '// Global environment\n', env, '\n\n'.
	includeSet do: [ | :f |
	    (f != 'base') && [ f != interp fullFileName ] ifTrue: [
		addCode: '#include "', f, '.h"\n'
	    ]
	].
	addCode: '#endif\n'.
	emit.
	generateLocalSelectorNames.
	initStream closeStream.
	mainStream closeStream.
	funcStream closeStream.
	typeStream closeStream.
	selectorStream closeStream.
	methodTableStream closeStream.
    ).

    saveIncludeInfo: context NewFile: fileName = ( | l |
	l: list copyRemoveAll.
	l add: processingFile.
	l add: interp fullFileName.
	l add: mapNum.
	mapNum: 0.
	interp setCurrentFile: fileName.
	includeStack addFirst: l.
    ).
    restoreIncludeInfo: context OldFile: fileName = ( | l |
	includeStack isEmpty ifTrue: [ error: 'includeStack is empty' ].
	l: includeStack removeFirst.
	processingFile: l removeFirst.
	interp setCurrentFile: l removeFirst.
	mapNum: l removeFirst.
	l isEmpty ifFalse: [ error: 'didn\'t match saveIncludeInfo' ].
    ).

    saveStreams: context = ( | l |
	" Bundle streams up into a list, and create new streams "
	" Pretty gross code here "
	l: list copyRemoveAll.
	l add: initStream.
	l add: mainStream.
	l add: funcStream.
	l add: typeStream.
	l add: selectorStream.
	l add: methodTableStream.
	l add: currentStream.
	l add: includeSet.
	l add: context closureList.
	l add: context fieldVarList.
	l add: localSelectors.
	l add: closureNum.
	initStream: compile_stream copy.
	mainStream: compile_stream copy.
	funcStream: compile_stream_file copy.
	typeStream: compile_stream_file copy.
	selectorStream: compile_stream_file copy.
	methodTableStream: compile_stream copy.
	currentStream: funcStream.  " Special, because we don't copy it "
	includeSet: set copyRemoveAll.
	localSelectors: localSelectors copyRemoveAll.
	closureNum: 0.
	streamStack addFirst: l.
    ).
    restoreStreams: context = ( | l |
	" Assumes closeStreams has already been called "
	streamStack isEmpty ifTrue: [ error: 'stream stack is empty' ].
	l: streamStack removeFirst.
	initStream: l removeFirst.
	mainStream: l removeFirst.
	funcStream: l removeFirst.
	typeStream: l removeFirst.
	selectorStream: l removeFirst.
	methodTableStream: l removeFirst.
	currentStream: l removeFirst.
	includeSet: l removeFirst.
	context closureList: l removeFirst.
	context fieldVarList: l removeFirst.
	localSelectors: l removeFirst.
	closureNum: l removeFirst.
	l isEmpty ifFalse: [ error: 'didn\'t match saveStreams' ].
    ).
    makeEnvVar: s = (  (asCName: s), '_env'  ).
    globalRef: var With: fileStr = (  " Takes two strings "
	'GLOBAL(', fileStr, ',', var, ')' ).
    globalRef: var In: context = (  " Takes a string and a context "
	globalRef: var With: asCName: interp rootFileName ).

    compile: asts Context: context FileName: fileName = ( 
	| initName. |
	debugMsg: 'Starting ', 
	    (fullBuild ifTrue: [ 'build...' ] False: [ 'compile...' ]).
	initName: outputDir, fileName, '.init.c'.
	globalInitStream indentRight.
	generateAppInit: generateAppInit || fullBuild.
	generateAppInit ifFalse: [
	    unixFile locate: initName IfFail: [
		debugMsg: 'Cannot locate ', initName, 
		    '.  Will recreate from scratch.'.
		generateAppInit: true.
	    ]
	].
	generateAppInit ifTrue: [
	    appInitStream openStream: initName.
	].
	context typeName: 'CecilGlobalEnv'.
	"Compile the body of the program here"
	asts first isIncludeNode ifFalse: [
	    error: 'First AST should be an include_node'
	].
	asts computeConstrainedPositions: self.
	asts codeGen: context Compiler: self. 
	generateSelectorTable.
	writeConstraintTable.
	generateAppInit ifTrue: [
	    generateAppInitCode: context
	] False: [
	    debugMsg: 
             'Skipping generation of application init code (not out of date)'.
	].
	writeMakefile.
	debugMsg: 'Done with compile.'.
    ).

    "stream operations"
    switchToFunc = ( currentStream: funcStream ).
    switchToInit = ( currentStream: initStream ).
    switchToMain = ( currentStream: mainStream ).
    switchToType = ( currentStream: typeStream ).
    switchToAppInit = ( currentStream: appInitStream ).
    switchToAppStruct = ( currentStream: appStructStream ).
    switchToGlobalInitStream = ( currentStream: globalInitStream ).
    switchToSelector = ( currentStream: selectorStream ).
    switchToTable = ( currentStream: methodTableStream ).
    switchToStream: s = ( currentStream: s ).

    addCode: s = ( currentStream addCode: s ).

    emit = ( currentStream emit ).

    indentRight = ( currentStream indentRight ).
    indentLeft = ( currentStream indentLeft ).

    "name mangling operations"
    setupManglingTable = (
	nameManglingTable: nameManglingTable copyRemoveAll.
	nameManglingTable at: '_' Put: '__'.
	nameManglingTable at: '@' Put: '_'.  " Hack.  Generate @, get a _ "
	nameManglingTable at: ';' Put: '_'.  " Hack.  Generate ;, get a _ "
	nameManglingTable at: '.' Put: '_'.  " Hack.  Generate ., get a _ "
	nameManglingTable at: '{' Put: ''.  " Hack.  Generate {, get nothing "
	nameManglingTable at: '}' Put: ''.  " Hack.  Generate }, get nothing "
	nameManglingTable at: '!' Put: '_Bang'.
	nameManglingTable at: '+' Put: '_Plus'.
	nameManglingTable at: '-' Put: '_Minus'.
	nameManglingTable at: '*' Put: '_Times'.
	nameManglingTable at: '#' Put: '_Pound'.
	nameManglingTable at: '^' Put: '_Up'.
	nameManglingTable at: '/' Put: '_Div'.
	nameManglingTable at: '>' Put: '_Gt'.
	nameManglingTable at: '<' Put: '_Lt'.
	nameManglingTable at: '=' Put: '_Eq'.
	nameManglingTable at: '|' Put: '_Or'.
	nameManglingTable at: '&' Put: '_And'.
	nameManglingTable at: '~' Put: '_Not'.
	nameManglingTable at: '`' Put: '_BackQuote'.
	nameManglingTable at: '\\' Put: '_BackSlash'.
	nameManglingTable at: '%' Put: '_Pct'.
	nameManglingTable at: ' ' Put: 'SpaceInName?!'.
    ).
    asCName: s = ( | newName. |
	newName: ''.
	s do: [ | :c. s | 
	    newName:
		newName, (nameManglingTable at: c IfAbsent: [ | :ch | ch ]). 
	].
	newName ).
    asCEscape: s = ( | newS |
	newS: ''.
	s do: [ | :c | 
	    newS: newS, ( '\n' = c ifTrue: '\\n' False: 
			[ '\t' = c ifTrue: '\\t' False: 
 		        [ '"'  = c ifTrue: '\\"' False: c ]]).
	].
	newS ).

    "functions handling mapping between Cecil msg names and id #'s"
    initializeSelectorTable = (
	selectors: selectors copyRemoveAll.
	localSelectors: localSelectors copyRemoveAll.
	selectorsChanged: false.
	unixFile locate: outputDir, 'selectors.c' IfFail: [
	    "no existing selector database"
	    "create it from scratch"
	    debugMsg: 'No selectors database; performing a full build'.
	    fullBuild: true.
	    ^ self.
	].
	"there is an existing database of selectors"
	"read it in to initialize the selector database"
	readSelectors.
    ).
    readSelectors = ( | s. t. |
	debugMsg: 'Reading selector table'.
	s: cecil_scanner createOnFile: outputDir, 'selectors.c'.
	"first parse 'char* MsgNames[] = {'"
	t: s getNextToken.
	t name = 'char' ifFalse: [
	    cecilErr: 'selector table has unexpected format'.
	].
	t: s getNextToken.
	t name = '*' ifFalse: [
	    cecilErr: 'selector table has unexpected format'.
	].
	t: s getNextToken.
	t name = 'MsgNames' ifFalse: [
	    cecilErr: 'selector table has unexpected format'.
	].
	t: s getNextToken.
	t name = '[' ifFalse: [
	    cecilErr: 'selector table has unexpected format'.
	].
	t: s getNextToken.
	t name = ']' ifFalse: [
	    cecilErr: 'selector table has unexpected format'.
	].
	t: s getNextToken.
	t name = '=' ifFalse: [
	    cecilErr: 'selector table has unexpected format'.
	].
	t: s getNextToken.
	t name = '{' ifFalse: [
	    cecilErr: 'selector table has unexpected format'.
	].
	"now parse selector names"
	[ | :exit |
	    t: s getNextToken.
	    t id = 'string' ifFalse: [
		cecilErr: 'selector table has unexpected format'.
	    ].
	    addSelector: t cecil_obj basic_value.
	    t: s getNextToken.
	    t name = ',' ifFalse: exit.
	] loopExit.
	"check for proper finish: '};'"
	t name = '}' ifFalse: [
	    cecilErr: 'selector table has unexpected format'.
	].
	t: s getNextToken.
	t name = ';' ifFalse: [
	    cecilErr: 'selector table has unexpected format'.
	].
	t: s getNextToken.
	t id = 'eof' ifFalse: [
	    cecilErr: 'selector table has unexpected format'.
	].
    ).
    addSelector: msgName = (
	selectors at: msgName Put: selectors size.
    ).
    selectorID: msgName = (
	"make sure msgName exists in global table"
	selectors if: msgName IsPresentDo: []
	    IfAbsentPut: [ selectorsChanged: true. selectors size ] AndDo: [].
	"record the fact that this file uses this selector"
	localSelectors add: msgName.
	"return the mangled selector name"
	'msg_', (asCName: msgName) ).
    generateLocalSelectorNames = ( | f |
	localSelectors do: [ | :msgName |
	    selectorStream addCode: 'const int ', (selectorID: msgName), ' = ',
		(selectors at: msgName) printString, ';\n'.
	].
	selectorStream emit.
    ).
    generateSelectorTable = ( | inverse. f. |
	selectorsChanged ifFalse: [
	    debugMsg: 'Skipping generation of selector table (not out of date)'.
	    ^ self
	].
	debugMsg: 'Writing selector table...'.
	"first compute id -> selector inverse mapping"
	inverse: dictionary copyRemoveAll.
	selectors do: [ | :id. :msgName. | inverse at: id Put: msgName ].
	inverse size = selectors size ifFalse: [
	    error: 'inverse mapping not same as forward mapping'.
	].
	"now write out file, in proper order"
	f: unixFile copy openForWriting: outputDir, 'selectors.c'.
	f write: 'char* MsgNames[] = {\n'.
	inverse size do: [ | :i. msgName. |
	    msgName: inverse at: i.
	    i > 0 ifTrue: [ f write: ',\n' ].
	    f write: '  "', msgName, '"'.
	].
	f write: '\n};\n'.
	f close.
    ).

    "computing which arguments are constrained"
    constrainedArgsMask: msgName ArgCount: argc ParamCount: paramc
		In: context = ( | ps. mask. |
	ps: msgName = 'eval' ifTrue: argc False: [ | key |
	    key: constrainedPositions
		keyFor: msgName ArgCount: argc ParamCount: paramc.
	    constrainedPositions at: key IfAbsent: [ set copyRemoveAll ] ].
	mask: 0.
	ps do: [ | :i | mask: mask || (1 << i) ].
	mask printString ).
    initializeConstrainedPositionsTable = ( | f |
	constrainedPositions: constrainedPositions copyRemoveAll.
	unixFile locate: outputDir, 'constraints.data' IfFail: [
	    "no existing constraint database"
	    fullBuild ifFalse: [
		debugMsg: 
		  'No constrained positions database; performing a full build'.
		fullBuild: true.
	    ].
	    ^ self.
	].
	"there is an existing database of selectors"
	readConstraintTable.
    ).
    readConstraintTable = ( | f. l. key. tl. constraints. |
	debugMsg: 'Reading constrained positions table'.
	f: unixFile openForReading: outputDir, 'constraints.data'.
	[ f atEOF ] whileFalse: [
	    l: f readLine.
	    l size do: [ | :i | 
		',' = (l at: i) ifTrue: [
		    l at: i Put: '\n'
		]
	    ].
	    tl: l asTextLines.
	    key: tl firstLine.
	    constraints: treeSet copyRemoveAll.
	    1 to: tl numberOfLines pred Do: [ | :i |
		constraints add: (tl lines at: i) asInteger.
	    ].
	    constrainedPositions at: key Put: constraints.
	].
    ).
    writeConstraintTable = ( | f. |
	constraintsChanged ifFalse: [
	    debugMsg:
		'Skipping generation of constraint table (not out of date)'.
	    ^ self
	].
	debugMsg: 'Writing constraint table...'.
	f: unixFile openForWriting: outputDir, 'constraints.data'.
	constrainedPositions do: [ | :v. :k. |
	    f write: k.
	    v do: [ | :elem |
		f write: ',', elem printString.
	    ].
	    f write: '\n'.
	].
    ).

    generateAppInitCode: context = ( | s |
	debugMsg: 'Writing application init code...'.
	context generateInitCode: self RealMain: true.
	appInitStream prependFromStream: appStructStream.
	s: '// Include files needed to access global environments\n',
	    '#include "cecil.h"\n'.
	fileSet do: [ | :fileName |
	    s: s, '#include "', fileName, '.h"\n'.
	].
	s: s, '\n'.
	appInitStream prependCode: s.
	appInitStream emit.
	appInitStream closeStream.
    ).

    writeMakefile = ( | f. t. |
	debugMsg: 'Writing CecilMakeInfo...'.
	f: unixFile copy openForWriting: outputDir, 'CecilMakeInfo'. 
	t: interp withoutExtension: fileToCompile.
	f write: 'TARGET_ROOT = ', t, '\n'.
	f write: 'CECIL_ROOT_NAMES = \\\n'.
	fileSet do: [ | :fileName |
	    f write: '\t', fileName, ' \\\n'.
	].
	f write: '\t', fileToCompile, '.init \\\n'.
	f write: '\tselectors\n'.
	f close.
    ).

    "helper function"
    makeList: l = ( | s <- ''.  first <- true. |
	l do: [ | :e |
	    first ifFalse: [ s: s, ', ' ].
	    s: s, e.
	    first: false.
	].
	s ).
| )

globals cecil_interp _AddSlotsIfAbsent: ( | cecil_compiler = () | )
cecil_compiler _Define: ( |
    parent* = traits cecil_compiler.

    interp <- cecil_interpreter.

    initStream <- compile_stream.
    mainStream <- compile_stream.
    funcStream <- compile_stream_file.
    typeStream <- compile_stream_file.
    appInitStream <- compile_stream_file.
    appStructStream <- compile_stream.
    globalInitStream <- compile_stream.
    selectorStream <- compile_stream_file.
    methodTableStream <- compile_stream.
    currentStream <- compile_stream.

    outputDir <- ''.	"change this if not writing output to cwd"
    fileToCompile <- ''.

    generateAppInit <- false.

    "used to convert Cecil names to C++ names"
    nameManglingTable <- dictionary.

    "tracks which arg positions of a message influence method lookup"
    constrainedPositions <- constrained_positions_table.
    constraintsChanged <- false.

    "set of msg names used in program"
    selectors <- dictionary copyRemoveAll.
    localSelectors <- set copyRemoveAll.
    selectorsChanged <- false.

    specialMessageHandling <- true.	"optimize msgs like if and +?"

    includeSet <- set.
    fileSet <- list.	"use a list to preserve order in application"
    staleFiles <- set.
    fullBuild <- false.

    includeStack <- list copyRemoveAll.
    streamStack <- list copyRemoveAll.

    processingFile <- false.  " false to avoid writing before streams open "

    nestedDepth <- 0.

    contextNum <- 0.
    closureNum <- 0.
    mapNum <- 0.
| )


"***************************************************************************
 *                                                                         *
 *      codeGen:Compiler routines for AST_nodes                            *
 *                                                                         *
 ***************************************************************************"

traits cecil_object _AddSlots: ( |
    addField: pf = ( | found <- false. |
	compilerStates do: [ | :f |
	    (f name = pf name) && 
		[f objectName = pf objectName] ifTrue: [
		" Names should be unique "
		found: true.
	    ].
	].
	found ifFalse: [
	    compilerStates addFirst: pf copy.
	].
    ).
    findNonPredicateParents = ( | s |
	s: set copyRemoveAll.
	s add: self.
	s
    ).
    copyUpPredicateFields = ( | temp |
	predicateChildren do: [ | :pc. predChildList |
	    predChildList: pc copyUpPredicateFields.
	    predChildList do: [ | :pf |
		addField: pf.
	    ].
	].
	"
	 temp: compilerStates.
	kind isPredicate ifTrue: [
	    compilerStates: list copyRemoveAll.
	].
	temp"
	compilerStates
    ).
    copyParentFields = (
	compilerProcessed ifFalse: [
	    parentsDo: [ | :e. parentList. |
		parentList: e copyParentFields.
		parentList reverseDo: [ | :pf. |
		    addField: pf.
		].
	    ].
	].
	compilerProcessed: true.
	compilerStates
    ).
    allocateMapAndObj: context Compiler: comp MapName: mapName = (
	compilerProcessed ifFalse: [ | fileName |
	    "first make sure all parents are allocated"
	    parentsDo: [ | :e |
		e allocateMapAndObj: context Compiler: comp 
		    MapName: e name.
	    ].
	    fileName: context lookup_file: name.
	    allocateMap: context Compiler: comp MapName: mapName 
		FileName: fileName.
	    allocateObj: context Compiler: comp FileName: fileName.
	    comp addCode: '\n'.
	    compilerProcessed: true
	].
    ).
    assignNamesAndOffsets: context Compiler: comp = ( | cnt. |
	compilerProcessed ifFalse: [ error: 'Should have been processed'. ].
	cnt: 0.
	compilerStates do: [ | :f. b. |
	    b: context lookup_binding: f objectName.
	    f obj: b value.
	    f cName: comp asCName: f name, ';', f objectName.
	    f kind isShared ifTrue: [
		f offset: -2.
	    ] False: [
		f offset: cnt.
		cnt: cnt succ.
	    ].
	].
    ).
    generateStructDecl: context Compiler: comp UseName: oName = ( 
	| savedStream.  structName. |
	savedStream: comp currentStream.
	structName: (comp asCName: comp interp rootFileName), 
	    '_Obj_', (comp asCName: oName).
	comp switchToType.
	comp typeStream addCode: 'struct ', structName, ';\n'.
	comp typeStream addCode: 'extern ', structName, '* new_', structName, 
	    '(CecilMap* m);\n\n'.
	comp switchToStream: savedStream.
	'GLOBAL(base,_void)'
    ).
    generateStruct: context Compiler: comp UseName: oName 
	FileName: fileName = ( 
	| savedStream. structName. |
	savedStream: comp currentStream.
	structName: (comp asCName: fileName), 
	    '_Obj_', (comp asCName: oName).
	comp switchToAppStruct.
	comp addCode: 'struct ', structName, ': CecilMemoryObject {\n'.
	comp indentRight.
	compilerStates do: [ | :f. b. |
	    f kind isShared ifFalse: [
		comp addCode: ('OOP ', f cName, ';    ' padOnRight: 26), 
			'// Offset ', f offset printString, '\n'.
	    ] True: [
		comp addCode: 
		    ('' padOnRight: 26), '// Shared variable ', f cName,'\n'.
	    ]
	].
	comp addCode: structName, 
	    '(CecilMap* m): CecilMemoryObject(m,', (maxOffset printString),
	    ') { }\n'.
	comp indentLeft.
	comp addCode: '};\n'.
	comp addCode: structName, '* new_', structName, '(CecilMap* m) {\n'.
	comp addCode: '  return new ', structName, '(m);\n'.
	comp addCode: '}\n\n'.
	comp switchToStream: savedStream.
	'GLOBAL(base,_void)'
    ).
    allocateMap: context Compiler: comp MapName: mName FileName: fileName = ( 
	| mapName. oopList. |
	mapName: 'cecilMap_', (comp asCName: mName).
	comp addCode: 'lastMap = ', 
	    (comp globalRef: mapName With: (comp asCName: fileName)),
	    ' = new CecilMap("', (comp asCName: mName), '", newOOPList('.
	oopList: list copyRemoveAll.
	parentsDo: [ | :p. s. |
	    oopList add: 
		context generateVariableReference: p name Compiler: comp.
	].
	oopList isEmpty ifTrue: [ " No parents;  make top object a parent "
	    oopList add: 'GLOBAL(base,_any)'.
	].
	comp addCode: comp makeList: oopList.
	comp addCode: ')'.
	kind isPredicate ifTrue: [
	    comp addCode: ',\n'.
	    comp addCode: '  &', (comp asCName: mName), '_predicate_test'
	].
        comp addCode: ');\n'.
	" Now generate field table "
	compilerStates do: [ | :f. s. | 
	    f kind isShared ifFalse: [
		comp addCode: 'lastMap->addField(new FieldEntry("',
		    f cName, '", ' , f offset printString, '));\n'.
	    ]
	].
    ).
    extendMap: context Compiler: comp MapName: mName = ( | ps |
	ps: parents.
	ps nonEmpty ifTrue: [ | oopList. mapName. |
	    "a predefined object was extended by the program; 
	     extend the corresponding CecilMap object"
	    mapName: 'cecilMap_', (comp asCName: mName).
	    comp addCode: 'GLOBAL(base,', mapName, ')', 
		'->setParents(newOOPList('.
	    oopList: list copyRemoveAll.
	    ps do: [ | :p. s. |
		oopList add: 
		    context generateVariableReference: p name Compiler: comp.
	    ].
	    comp addCode: comp makeList: oopList.
	    comp addCode: '));\n\n'.
	].
    ).
    maxOffset = ( | m. |
	m: -1.
	compilerStates do: [ | :f | 
	    f offset > m ifTrue: [
		m: f offset.
	    ].
	].
	m + 1 ).
    allocateObj: context Compiler: comp FileName: fileName = ( | s. cStr. |
	cStr: comp asCName: name.
	s: context generateVariableReference: name Compiler: comp.
	comp addCode: s, ' =\n  asTaggedPointer(new_',
	    (comp asCName: fileName), '_Obj_', cStr,
	    '(',
	    (comp globalRef: ('cecilMap_',cStr) With: (comp asCName: fileName)),
	    '));\n'.
    ).
| )

traits cecil_predicate_object _AddSlots: ( |
    findNonPredicateParents = ( | s |
	s: set copyRemoveAll.
	parentsDo: [ | :e. newSet |
	    newSet: e findNonPredicateParents.
	    s addAll: newSet
	].
	s isEmpty ifTrue: [
	    error: 'should have some non-predicate parents'
	].
	s ).
    generatePredicateMethod: context Compiler: comp = ( 
	| result. newContext. n. methDecl. |
	newContext: cecil_nested_context createInContext: context.
	newContext isCFuncContext: true.
	parentsDo: [ | :e. binding. |
	    binding: cecil_binding copyName: e name.
	    newContext addBinding: binding.
	].
	newContext generateEnvironmentName.
	comp addCode: newContext generateEnvironment: comp.
	methDecl: 'bool ', (comp asCName: name), 
	    '_predicate_test(OOP _pred_obj)'.
	comp typeStream addCode: methDecl, ';\n'.
	comp addCode: methDecl, ' {\n'.
	comp indentRight.
	comp addCode: newContext typeName, ' ', newContext envName, 
	    '(currentEnv, NULL);\n'.
	comp addCode: 'currentEnv = (CecilEnv*)&', newContext envName, ';\n'.
	" Now copy _pred_obj to all the names in the newContext "
	parentsDo: [ | :e. s |
	    s: newContext generateVariableReference: e name Compiler: comp.
	    comp addCode: s, ' = _pred_obj;\n'.
	].
	comp addCode: 'OOP pred_result;\n'.
	comp addCode: 
	    'OOP* _result = NULL;  // Just makes NLR testing code happy\n'.
	result: when codeGen: newContext Compiler: comp.
	comp addCode: 'pred_result = ', result, ';\n'.
	comp addCode: 
	    'assert(pred_result == GLOBAL(base,_true) ||\n',
	    '       pred_result == GLOBAL(base,_false),\n',
	    '       "predicate result is neither true nor false\\n");\n'.
	comp addCode: 'currentEnv = ', newContext callerEnvName, ';\n'.
	comp addCode: 'return (pred_result == GLOBAL(base,_true));\n'.
	comp indentLeft.
	comp addCode: '}\n\n'.
    ).
| )
	
"***************************************************************************
 *                                                                         *
 *      codeGen:Compiler routines for AST_nodes                            *
 *                                                                         *
 ***************************************************************************"

traits cecil_AST_node _AddSlots: ( |
    realCodeGen: context Compiler: comp = (
	error: 'compilation routine not implemented!'.
    ).
    codeGenIncludes: context Compiler: comp = ( self ).
    codeGen: context Compiler: comp = (
	comp processingFile ifTrue: [
	    realCodeGen: context Compiler: comp
	] False: [
	    codeGenIncludes: context Compiler: comp
	]
    ).
    computeConstrainedPositions: comp = ( self ).
    savedRepresentation = ''.
| )

traits cecil_var_node _AddSlots: ( |
    realCodeGen: context Compiler: comp = (
	context generateVariableReference: name Compiler: comp ).
| )

traits cecil_assign_node _AddSlots: ( |
    realCodeGen: context Compiler: comp = ( | lhs. rhs. |
	rhs: expr codeGen: context Compiler: comp.
	lhs: context generateVariableReference: name Compiler: comp.
	comp addCode: lhs, ' = ', rhs, ';\n'.
	lhs  " In case Cecil allows x := y := z; "
    ).
| )

traits cecil_context _AddSlots: ( |
    shouldOutput: binding FileName: fileName = (
	isTopContext not ||
	[ binding isPredefined not && [ binding file = fileName ]] ).
    lookup_file: name = ( (lookup_binding: name) file ).
    generateEnvironment: comp = (
	generateEnvironment: comp ForFile: ''.
    ).
    generateEnvironment: comp ForFile: fileName = ( | s. s2. cnt. structName |
	varBindings isEmpty ifTrue: [
	    s: '#define ', typeName, ' CecilEnv\n'.
	] False: [
	    cnt: 0.
	    isTopContext ifTrue: [
		structName: comp makeEnvVar: fileName.
		s: 'struct ', structName, 'Struct: CecilEnv {\n'
	    ] False: [
		structName: typeName.
		s: 'struct ', structName, ': CecilEnv {\n'
	    ].
	    varBindings do: [ | :k. | 
		(shouldOutput: k FileName: fileName) ifTrue: [
		    s: s, '  OOP \t_', (comp asCName: k name), ';\n'.
		    cnt: cnt succ.
		].
	    ].
	    isTopContext ifTrue: [
		s: s, '  // Map declarations\n'.
		varBindings do: [ | :v |
		    v isObjectBinding && 
   		    [ shouldOutput: v FileName: fileName ] ifTrue: [
			s: s, '  CecilMap* cecilMap_', 
			    (comp asCName: v name), ';\n'.
			cnt: cnt succ.
		    ]
		].
		s: s, '  // Maps for anonymous objects\n'.
		anonymousBindings do: [ | :v |
		    v isObjectBinding ifTrue: [
			( shouldOutput: v FileName: fileName ) ifTrue: [
			    s: s, '  CecilMap* cecilMap_', 
				(comp asCName: v name), ';\n'.
			    cnt: cnt succ.
			].
		    ] False: [
			error: 'Anonymous bindings should only be for objects'.
		    ].
		].
		closureList nonEmpty ifTrue: [
		    s: s, '  // Maps and objects for closures\n'.
		    closureList do: [ | :cl. f. c. |
			s: s, '  CecilMap* cecilMap_', cl, ';\n'.
			s: s, '  OOP _', cl, ';\n'.
			cnt: cnt + 2.
		    ].
		].
		fieldVarList nonEmpty ifTrue: [
		    s: s, '  // OOPs for field initial values\n'.
		    fieldVarList do: [ | :fieldName |
			s: s, '  OOP ', fieldName, ';\n'.
			cnt: cnt succ.
		    ].
		].
		s: s, '  ', structName, 
		    'Struct(CecilEnv* d, CecilEnv* s): CecilEnv(d,s,',
		    cnt printString, ') { };\n};\n\n',
		    'extern ', structName, 'Struct* ', structName, ';\n'.
		comp funcStream addCode: '\n', structName, 'Struct* ',
		    structName, ' = NULL;\n'.
		comp funcStream emit.
	    ] False: [  " Different constructor for global environment "
		s: s, '  ', structName, 
		    '(CecilEnv* d, CecilEnv* s): CecilEnv(d,s,',
		    cnt printString, ') { };\n'.
		s: s, '};\n'.
	    ].
	].
	s 
    ).
    generateVariableReference: name Compiler: comp = ( | s. c. obj |
	c: lookup_binding_context: name.
	obj: lookup_binding: name.
	c isTopContext ifTrue: [ 
	    s: comp globalRef: '_', (comp asCName: name)
		With: comp asCName: obj file.
	    comp includeSet add: obj fullFile.
	] False: [
	    s: 'currentEnv'.
	    nestedLevel - c nestedLevel do: [ s: s, '->staticEnv'. ].
	    s: '((', c typeName, '*)', s, ')'.
	    s: s, '->_', (comp asCName: name).
	].
	s
    ).
    generateEnvironmentName = (
	typeName = '' ifTrue: [
	    typeName: 'CecilContext', interp compiler newContextNum printString.
	].
	envName: 'envVar', newTempNum printString.
	nestedLevel > 1 ifTrue: [ 
	    envName: envName, '_', nestedLevel printString.
	].
    ).
    callerEnvName = ( envName, '.dynamicEnv' ).
    calculateObjectFields: comp = ( | stopIt <- false |
	varBindings do: [ | :v | 
	    v isObjectBinding && [ v value kind isPredicate not ] ifTrue: [ 
		v value copyUpPredicateFields 
	    ].
	].
	varBindings do: [ | :v | 
	    v isObjectBinding ifTrue: [ v value copyParentFields ].
	].
	varBindings do: [ | :v | 
	    v isObjectBinding ifTrue: [
		v value assignNamesAndOffsets: self Compiler: comp.
	    ].
	].
    ).
    allocateClosureMapAndObj: closureName Compiler: comp = (
	comp addCode: 'lastMap = ',
	    (comp globalRef: 'cecilMap_', closureName In: self),
	   ' =\n',
	    '  new CecilMap("', closureName, 
	    '", newOOPList(cParent));\n'.
	comp addCode: (comp globalRef: '_', closureName In: self), ' =\n'.
	comp addCode: '  asTaggedPointer(new CecilClosureObject(',
	    'lastMap,NULL));\n'.
    ).

    generatePredicateCode: comp ForFile: fileName = (
	varBindings do: [ | :v | 
	    v isObjectBinding && [ v value kind isPredicate ] && 
		[ shouldOutput: v FileName: interp rootFileName ] ifTrue: [ 
		v value generatePredicateMethod: self Compiler: comp.
	    ].
	].
    ).
    generateClosureInit: comp = ( | savedStream |
	savedStream: comp currentStream.
	comp switchToInit.
	comp addCode: '// Closure objects and maps\n'.
	comp addCode: 'OOP cParent = GLOBAL(base,_closure);\n'.
	closureList do: [ | :c |
	    allocateClosureMapAndObj: c Compiler: comp.
	].
	comp indentLeft.
	comp addCode: '}\n'.
	savedStream appendFromStream: comp currentStream.
	comp switchToStream: savedStream.
	comp emit.
    ).
    generateInitCode: comp RealMain: realMain = ( 
	| savedStream. globSize. savedName. |
	savedStream: comp currentStream.
	comp switchToAppInit.
	comp addCode: 'void cecil_environment_init() {\n'.
	comp indentRight.
	"first allocate all the environments"
	savedName: comp interp fullFileName.
	comp addCode: 'CecilMap* lastMap;\n'.
	comp addCode: '// Allocate global environments\n'.
	comp fileSet do: [ | :fileName. envName. |
	    envName: (comp asCName: interp withoutExtension: fileName), '_env'.
	    comp addCode: envName, ' = new ', envName, 'Struct(NULL,NULL);\n'.
	].
	comp addCode: '\n'.
	"first set up for processing all non-predefined objects"
	varBindings do: [ | :v |
	    v isObjectBinding ifTrue: [
		v value compilerProcessed: v isPredefined.
	    ].
	].
	varBindings do: [ | :v |
	    v isObjectBinding && [ v isPredefined not ] ifTrue: [
		v value generateStruct: self Compiler: comp UseName: v name
		    FileName: v file.
		v value allocateMapAndObj: self Compiler: comp MapName: v name.
	    ].
	].
	"then process predefined objects specially"
	realMain ifTrue: [
	    comp addCode: '// Extending predefined objects\n'.
	    varBindings do: [ | :v |
		v isObjectBinding && [v isPredefined] ifTrue: [
		    v value extendMap: self Compiler: comp MapName: v name.
		].
	    ].
	].
	comp addCode: '// Anonymous objects and maps\n'.
	anonymousBindings do: [ | :v |
	    v isObjectBinding ifTrue: [
		v value generateStruct: self Compiler: comp UseName: v name
		    FileName: v file.
		v value allocateMap: self Compiler: comp MapName: v name
		    FileName: v file.
		comp addCode: '\n'.
	    ] False: [
		error: 'should be an object binding'.
	    ].
	].
	comp addCode: '// Global variable initialization\n'.
	comp currentStream appendFromStream: comp globalInitStream.
	comp indentLeft.
	comp addCode: '}\n'.
	comp switchToStream: savedStream.
    ).
    generateNLRTest: comp ReturnVar: v ResultVar: result = (
	hasHomeContext ifTrue: [ | cf. macroName. |
	    cf: cFuncContext.
	    macroName: cf isHomeContext ifTrue: [
		"NLR might stop here"
		'TEST_NLR'
	    ] False: [
		"in a block; NLR won't stop here"
		'PROP_NLR'
	    ].
	    comp addCode:
		macroName, '(', v, ',', result, ',&', cf envName, ');\n'.
	] False: [
	    comp addCode:
		'assert(', v, ' == NORMAL_RETURN,\n',
		'       "should be a local return in top-level expr");\n'.
	].
    ).
| )

traits cecil_decl_block _AddSlots: ( |
    setupContext: context Compiler: comp = (
	"first define names"
	do: [ | :decl | decl defineName: context ].
	do: [ | :decl | decl resolveNames: context ].
	context calculateObjectFields: comp.
    ).
    codeGen: context Compiler: comp = ( | obj. env. |
	setupContext: context Compiler: comp.
	do: [ | :decl | decl codeGen: context Compiler: comp ].
	'GLOBAL(base,_void)' "In case there is no main "
    ).
    computeConstrainedPositions: comp = ( 
	do: [ | :decl | decl computeConstrainedPositions: comp ].
    ).
    savedRepresentation = ( | str.  newStr. includeCnt. |
	str: ''.
	includeCnt: 0.
	do: [ |:d| 
	    includeCnt = 0 ifTrue: [
		newStr: d savedRepresentation.
		newStr size > 0 ifTrue: [
		    str: str, newStr, ';\n'
		]
	    ].
	    d isIncludeNode ifTrue: [
		includeCnt: includeCnt succ.
	    ] False: [
		d isEndIncludeNode ifTrue: [
		    includeCnt: includeCnt pred.
		]
	    ]
	].
	str ).
| )

traits cecil_decl_node _AddSlots: ( |
    realCodeGen: context Compiler: comp = (
	binding codeGen: context Compiler: comp.
	self ).
    savedRepresentation = ( printString ).
| )

traits cecil_non_object_binding _AddSlots: ( |
   codeGen: context Compiler: comp = ( | lhs. rhs. savedStream. |
	savedStream: comp currentStream.
	context nestedLevel = 0 ifTrue: [
	    "initializing a global variable"
	    comp switchToGlobalInitStream.
	].
	rhs: value codeGen: context Compiler: comp.
	lhs: context generateVariableReference: name Compiler: comp.
	comp addCode: lhs, ' = ', rhs, ';\n'.
	comp switchToStream: savedStream.
	self ).
| )
	
traits cecil_object_binding _AddSlots: ( |
    codeGen: context Compiler: comp = ( | lhs. rhs. binding. |
	binding: context lookup_binding: name.
	binding value generateStructDecl: context Compiler: comp UseName: name.
	self ).
| )

traits cecil_field_init_node _AddSlots: ( |
    codeGen: context Compiler: comp ObjectName: objName = ( 
	| rhsValue. msgName. constrainedArgsMask. argList.
	  resultVar. returnVar. |
	rhsValue: expr codeGen: context Compiler: comp.
	msgName: '{init_set_', fieldName, '}'.
	resultVar: context newTempName.
	comp addCode: 'OOP ', resultVar, ';\n'.
	returnVar: 'returnVal', context newTempNum printString.
	constrainedArgsMask:
	    comp constrainedArgsMask: msgName ArgCount: 2 ParamCount: 0
	    In: context.
	argList: context newTempName.
	comp addCode: 'OOPList2 ', argList, '(', objName, ',', rhsValue, ');\n'.
	constraintSpec isSpecified ifFalse: [
	    comp addCode: 'ReturnCode ', returnVar, ' = send(', 
		(comp selectorID: msgName),
		', &', resultVar, ', ', constrainedArgsMask, ', ',
		argList, ', ', argList, ', false);\n'.
	] True: [ | directeeList |
	    directeeList: context newTempName.
	    comp addCode: 'OOPList2 ', directeeList, '(', 
		(context top_context generateVariableReference:
		    constraintSpec name Compiler: comp),
		', GLOBAL(base,_any));\n'.
	    comp addCode: 'ReturnCode ', returnVar, ' = resend(',
		(comp selectorID: msgName), 
		', &', resultVar, ', ', constrainedArgsMask,
		', ', argList, ', ', directeeList, ', ', argList,
		', NULL, false);\n'.
	].
	comp addCode: 'assert(', returnVar, 
	    ' == NORMAL_RETURN, "should be normal return");\n'.
	self ).
| )

traits cecil_extension_decl_node _AddSlots: ( |
    realCodeGen: context Compiler: comp = (
	"a no-op; already handled separately"
	self ).
    savedRepresentation = ( printString ).
| )

traits cecil_field_info_node _AddSlots: ( |
    realCodeGen: context Compiler: comp = (
	"a no-op; work done during resolveNames:"
	self ).
    savedRepresentation = ( printString ).
| )

traits cecil_anon_obj_info_node _AddSlots: ( |
    realCodeGen: context Compiler: comp = (
	" Do nothing.  Should already be done by the existing declarations "
	'' ).
    codeGenIncludes: context Compiler: comp = ( | newBinding |
	" This will create the appropriate bindings in the context "
	newBinding: obj_expr createBinding: context Compiler: comp 
	    AddDecl: false.
	'' ).
    savedRepresentation = ( printString ).
| )

traits cecil_object_expr_node _AddSlots: ( |
    createBinding: context Compiler: comp AddDecl: doDecl = ( | newBinding |
	newBinding: cecil_object_binding copy.
	newBinding value: createObject: context.
	newBinding value resolveNames: context.
	newBinding value copyParentFields.
	newBinding value assignNamesAndOffsets: context Compiler: comp.
	newBinding name: comp interp rootFileName,
	    ';anon', comp newMapNum printString.
	newBinding file: comp interp rootFileName.
	newBinding fullFile: comp interp fullFileName.
	context top_context anonymousBindings 
	    at: newBinding name Put: newBinding.
	doDecl ifTrue: [
	    newBinding value generateStructDecl: context Compiler: comp 
		UseName: newBinding name.
	].
	newBinding
    ).
    realCodeGen: context Compiler: comp = ( | s. newBinding. |
	s: context newTempName.  " Variable to hold ptr to object "
	newBinding: createBinding: context Compiler: comp AddDecl: true.
	comp addCode: 'OOP ', s, ' = asTaggedPointer(new_',
	    (comp asCName: newBinding file), '_Obj_',
	    (comp asCName: newBinding name), 
	    '(',
	    (comp globalRef: 'cecilMap_', (comp asCName: newBinding name) 
		In: context),
	    '));\n'.
	    
	fieldInitDecls do: [ | :f |
	    f codeGen: context Compiler: comp ObjectName: s.
	].

	s ).
| )

globals cecil_no_result_node _AddSlots: ( |
    realCodeGen: context Compiler: comp = (
	comp addCode: '// void return\n'.
	'GLOBAL(base,_void)' 
    ).
| )

traits cecil_return_node _AddSlots: ( |
    realCodeGen: context Compiler: comp = (
	expr codeGen: context Compiler: comp ).
| )

traits cecil_nonlocal_return_node _AddSlots: ( |
    realCodeGen: context Compiler: comp = ( | s. homeContext. cFuncContext. |
	homeContext: context homeContext.
	cFuncContext: context cFuncContext.
	s: expr codeGen: context Compiler: comp.
	comp addCode: '// Non local return code\n'.
	comp addCode: '*_result = ', s, ';\n'.
	s: context newTempName.
	comp addCode: 'CecilEnv* ', s, ' = '.
	cFuncContext isHomeContext ifTrue: [
	    comp addCode: 'NORMAL_RETURN; /* NLR from method context */\n'
	] False: [ | s1 |
	    s1: 'currentEnv'.
	    context nestedLevel - homeContext nestedLevel do: [ 
		s1: s1, '->staticEnv'.
	    ].
	    comp addCode: s1, ';\n'.
	].
	comp addCode: 'currentEnv = ', cFuncContext callerEnvName, ';\n'.
	comp addCode: 'return ', s, ';\n'.
	'GLOBAL(base,_void)' ).
| )

traits cecil_array_object_expr_node _AddSlots: ( |
    realCodeGen: context Compiler: comp = ( | s. s2. i. |
	s: context newTempName. " Name of array "
	comp addCode: 'CecilArrayObject* ', s, ' = newCecilArrayObject(',
	    elems size printString, ', UNINITIALIZED_OOP);\n'.
	i: 0.
	elems do: [ | :e |
	    comp addCode: s, '->setElement(', i printString, ', ',
		(e codeGen: context Compiler: comp), ');\n'.
	    i: i succ.
	].
	s2: context newTempName.
	comp addCode: 'OOP ', s2, ' = asTaggedPointer(', s, ');\n'.
	s2 ).
| )

traits cecil_msg_node _AddSlots: ( |
    realCodeGen: context Compiler: comp = ( 
	| args. resultVar. special. |
	comp addCode: ( '/* Message send ', printString, ' */\n' ).
	args: list copyRemoveAll.
	resultVar: context newTempName.
	(specialIfCase: context Compiler: comp 
		Args: args ResultVar: resultVar) ifFalse: [
	    exprs do: [ | :expr | 
		args add: expr codeGen: context Compiler: comp
	    ].
	    comp addCode: 'OOP ', resultVar, ';\n'.
	    special: testForSpecialCase: context Compiler: comp 
		ArgList: args
		Result: resultVar.
	    generateSend: 
		context Compiler: comp Args: args ResultVar: resultVar.
	    special ifTrue: [
		comp indentLeft.
		comp addCode: '}\n'.
	    ].
	].
	resultVar ).
    generateSend: context Compiler: comp Args: args ResultVar: resultVar = (
	| returnVar. constrainedArgsMask. argList. privilegeList. |
	returnVar: 'returnVal', context newTempNum printString.
	constrainedArgsMask:
	    comp constrainedArgsMask: msgName ArgCount: args size
	    ParamCount: params size In: context.
	argList: context newTempName.
	comp addCode: 'OOPList', args size printString, ' ', argList.
	args nonEmpty ifTrue: [ | privilegeRefs. |
	    comp addCode: '(', (comp makeList: args), ');\n'.
	    privilegeRefs: list copyRemoveAll.
	    context hasHomeContext ifFalse: [
		"a send not in any method; no privileges"
		args do: [
		    privilegeRefs add: 'GLOBAL(base,_any)'.
		].
	    ] True: [ | homeContext. privileges. |
		homeContext: context homeContext.
		privileges: exprs correspondingConstraintsInMethod:
		    homeContext method InContext: context.
		privileges do: [ | :obj. ref. |
		    ref: context generateVariableReference: obj name
						  Compiler: comp.
		    privilegeRefs add: ref.
		].
	    ].
	    privilegeList: context newTempName.
	    comp addCode:
		'OOPList', args size printString, ' ', privilegeList,
		'(', (comp makeList: privilegeRefs), ');\n'.
	] False: [
	    "C++ compiler has a bug if generate
	     'OOPList tmp();' rather than
	     'OOPList tmp;'"
	    comp addCode: ';\n'.
	    privilegeList: argList.
	].
	comp addCode:
	    'ReturnCode ', returnVar, ' = send(', 
	    (comp selectorID: msgName), 
	    ', &', resultVar, ', ', constrainedArgsMask, ', ',
	    argList, ', ', privilegeList, ');\n'.
	context generateNLRTest: comp ReturnVar: returnVar ResultVar: resultVar.
	resultVar ).
    specialIfCase: context Compiler: comp Args: args ResultVar: resultVar = ( 
	| s.  needElse <- false. |
	comp specialMessageHandling ifFalse: [ ^ false ].
	(msgName = 'if') && [ (exprs size = 2) || [exprs size = 3] ] ifTrue: [
	    args add: exprs first codeGen: context Compiler: comp.
	    comp addCode: 'OOP ', resultVar, ';\n'.
	    (exprs at: 1) isClosureNode ifTrue: [
		comp addCode: 'if (', (args first), 
		    ' == GLOBAL(base,_true)) {\n'.
		comp indentRight.
		s: (exprs at: 1) method body codeGen: context Compiler: comp.
		comp addCode: resultVar, ' = ', s, ';\n'.
		comp indentLeft.
		comp addCode: '}'.
		needElse: true.
	    ].
	    (exprs size = 2) || 
	    [ (exprs size = 3) && [(exprs at: 2) isClosureNode] ] ifTrue: [
		needElse ifTrue: [ comp addCode: ' else ' ].
		comp addCode: 'if (', (args first), 
		    ' == GLOBAL(base,_false)) {\n'.
		comp indentRight.
		exprs size = 2 ifTrue: [
		    comp addCode: resultVar, 
			' = GLOBAL(base,_void); // Single-way if\n'.
		] False: [
		    s: (exprs at: 2) 
		    method body codeGen: context Compiler: comp.
		    comp addCode: resultVar, ' = ', s, ';\n'.
		].
		comp indentLeft.
		comp addCode: '}'.
		needElse: true.
	    ].
	    needElse ifTrue: [ 
		comp addCode: ' else {\n'. 
		comp indentRight.
	    ].
	    " First arg is already generated.  Just generate the rest "
	    1 to: exprs size - 1 Do: [ | :i |
		args add: (exprs at: i) codeGen: context Compiler: comp.
	    ].
	    generateSend: context Compiler: comp Args: args 
		ResultVar: resultVar.
	    needElse ifTrue: [
		comp indentLeft.
		comp addCode: '}\n'
	    ].
	    ^ true
	].
	false
    ).
    testForSpecialCase: context Compiler: comp ArgList: args Result: rVar = (
	| numArgs |
	numArgs: args size.
	comp specialMessageHandling ifFalse: [ ^ false ].
	numArgs = 2 ifTrue: [
	    (msgName = '+') || [(msgName = '-') || [msgName = '%']] ifTrue: [
		comp addCode: 'if (', args first, '->isInt() && ',
		    (args at: 1), '->isInt()) {\n'.
		comp indentRight.
		comp addCode:
		    rVar, ' = (OOP)(((int)', args first, ') ', 
		    msgName, ' ((int)', (args at: 1), '));\n'.
		comp indentLeft.
		comp addCode: '} else {\n'.
		comp indentRight.
		^ true
	    ].
	    (msgName = '*') || [ msgName = '/' ] ifTrue: [
		comp addCode: 'if (', args first, '->isInt() && ',
		    (args at: 1), '->isInt()) {\n'.
		comp indentRight.
		msgName = '*' ifTrue: [
		    comp addCode:
			rVar, ' = (OOP)(((int)', args first, ') ', 
			msgName, ' unBoxInteger(', (args at: 1), '));\n'.
		] False: [
		    comp addCode:
			rVar, ' = asTaggedInteger(((int)', args first, ') ', 
			msgName, ' ((int)', (args at: 1), '));\n'.
		].
		comp indentLeft.
		comp addCode: '} else {\n'.
		comp indentRight.
		^ true
	    ].
	     (msgName = '<') || [(msgName = '<=') ||
	    [(msgName = '>') || [(msgName = '>=') || 
	    [(msgName = '=') || [(msgName = '!=')]]]]] ifTrue: [
		comp addCode: 'if (', args first, '->isInt() && ',
		    (args at: 1), '->isInt()) {\n'.
		comp indentRight.
		comp addCode:
		    rVar, ' = (((int)', args first, ') ', 
		    (msgName = '=' ifTrue: '==' False: msgName),
		    ' ((int)', (args at: 1), '))',
		    ' ? GLOBAL(base,_true) : GLOBAL(base,_false);\n'.
		comp indentLeft.
		comp addCode: '} else {\n'.
		comp indentRight.
		^ true
	    ].
	].
	false ).
| )

traits cecil_resend_node _AddSlots: ( |
    realCodeGen: context Compiler: comp = ( 
	| args. directions. privileges.
	  argList. directeeList. privilegeList.
	  resultVar. returnVar. constrainedArgsMask.
	  homeContext. homeMethod. i. 
	|
	comp addCode: '/* Message resend: ', printString, ' */\n'.
	args: list copyRemoveAll.
	directions: list copyRemoveAll.
	homeContext: context homeContext.
	homeMethod: homeContext method.
	i: 0.
	hasArguments ifTrue: [
	    qualifiedExprs do: [ | :e. s. | 
		args add: e expr codeGen: context Compiler: comp.
		e constraintSpec isSpecified ifTrue: [
		    s: context generateVariableReference: 
			e constraintSpec name Compiler: comp.
		] False: [ | f |
		    " Use formal specified in method header "
		    f: homeMethod formals at: i.
		    s: context generateVariableReference:
			f constraintSpec name Compiler: comp.
		].
		directions add: s.
		i: i succ.
	    ].
	    "this assumes that the resend is legal"
	    privileges: list copyRemoveAll.
	    homeMethod formals do: [ | :f |
		privileges add:
		    context generateVariableReference: f constraintSpec name
		    Compiler: comp.
	    ].
	] False: [
	    homeMethod formals do: [ | :f |
		args add: context generateVariableReference: f compiledName
		    Compiler: comp.
		directions add:
		    context generateVariableReference: f constraintSpec name
		    			     Compiler: comp.
	    ].
	].
	resultVar: context newTempName.
	comp addCode: 'OOP ', resultVar, ';\n'.
	returnVar: 'returnVal', context newTempNum printString.
	constrainedArgsMask:
	    comp constrainedArgsMask: homeContext methodAST name
	    ArgCount: args size ParamCount: homeMethod params size
	    In: context.
	args nonEmpty ifFalse: [ error: 'not expected resend w/o args' ].
	argList: context newTempName.
	comp addCode: 'OOPList', args size printString, ' ', argList, '('.
	comp addCode: comp makeList: args.
	comp addCode: ');\n'.
	directeeList: context newTempName.
	comp addCode: 'OOPList', directions size printString, ' ',
	    directeeList, '('.
	comp addCode: comp makeList: directions.
	comp addCode: ');\n'.
	hasArguments ifTrue: [
	    privilegeList: context newTempName.
	    comp addCode: 'OOPList', privileges size printString, ' ',
		privilegeList, '('.
	    comp addCode: comp makeList: privileges.
	    comp addCode: ');\n'.
	] False: [
	    "privileges same as directees"
	    privilegeList: directeeList.
	].
	comp addCode:
	    'ReturnCode ', returnVar, ' = resend(',
	    (comp selectorID: homeContext methodAST name), 
	    ', &', resultVar, ', ', constrainedArgsMask,
	    ', ', argList, ', ', directeeList, ', ', privilegeList, ', &',
	    homeContext methodAST methodCName, ');\n'.
	context generateNLRTest: comp ReturnVar: returnVar ResultVar: resultVar.
	resultVar ).
| )
	
traits cecil_literal_node _AddSlots: ( |
    realCodeGen: context Compiler: comp = ( | resultVar. |
	value codeGen: context Compiler: comp ).
| )
	
traits cecil_literal_object _AddSlots: ( |
    codeGen: context Compiler: comp = (
	error: 'literal not implemented!'.
    ).
| )

traits cecil_integer_literal _AddSlots: ( |
    codeGen: context Compiler: comp = (
	'asTaggedInteger(', basic_value printString, ')' ).
| )

traits cecil_float_literal _AddSlots: ( |
    codeGen: context Compiler: comp = ( | s |
	s: context newTempName.
	comp addCode:
	    'OOP ', s, ' = asTaggedPointer(new CecilFloatObject(',
	    basic_value printString, '));\n'.
	s ).
| )

traits cecil_char_literal _AddSlots: ( |
    codeGen: context Compiler: comp = ( | s |
	s: context newTempName.
	comp addCode:
	    'OOP ', s, ' = asTaggedPointer(new CecilCharObject(',
	    (comp asCEscape: basic_value printString), '));\n'.
	s ).
| )

traits cecil_string_literal _AddSlots: ( |
    codeGen: context Compiler: comp = ( | s |
	s: context newTempName.
	comp addCode:
	    'OOP ', s, ' = asTaggedPointer(newCecilImmutableStringObject("',
	    (comp asCEscape: basic_value), '"));\n'.
	s ).
| )

traits cecil_closure_node _AddSlots: ( |
    realCodeGen: context Compiler: comp = ( | savedStream. closureObj. cName. |
	savedStream: comp currentStream.
	comp currentStream: compile_stream copy.
	cName: method codeGen: context Compiler: comp.
	context top_context closureList add: cName.
	savedStream prependFromStream: comp currentStream.
	comp currentStream: savedStream.
	closureObj: context newTempName.
	comp addCode: 'OOP ', closureObj, 
	    ' = asTaggedPointer(new CecilClosureObject(',
	    (comp globalRef: ('cecilMap_', cName) In: context),
	    ',currentEnv));\n'.
	closureObj ).
| )
	
traits cecil_method_node _AddSlots: ( |
    computeConstrainedPositions: comp = ( 
	"calling this before the method has been name-resolved; be careful"
	method calculateConstrainedPositions.
	comp constraintsChanged:
	    (comp constrainedPositions insertMethod: method) ||
	    [comp constraintsChanged].
    ).
    realCodeGen: context Compiler: comp = (  
	context isTopContext ifFalse: [
	    error: 'Nested methods not supported in bootstrap compiler'.
	].
	resolvedMethod codeGen: context Compiler: comp.
	self ).
| )

traits cecil_method _AddSlots: ( |
    codeGen: context Compiler: comp = ( | mName. env. result. |
	resolvedContext enclosingContext != context ifTrue: [
	    error: 'broken context relationships'.
	].
	isEvalMethod ifFalse: [
	    debugMsg:
		('' padOnLeft: comp nestedDepth),
		'** compiling ', printString, '...' ].
	resolvedContext isCFuncContext: true.
	methodCName: generateHeader: context Compiler: comp.
	resolvedContext methodAST: self.
	generateTableEntry: context Compiler: comp MethodName: methodCName.
	comp indentRight.
	isPrimitive ifTrue: [ | i |
	    i: 0.
	    formals do: [ | :f. s. |
		f isAnonymous not ifTrue: [
		    comp addCode:
			'OOP ', f name, ' = _args[', i printString, '];\n'.
		].
		i: i succ.
	    ].
	    comp addCode: '// Body of primitive\n'.
	    comp addCode: body str.
	] False: [
	    setupEnvironment: resolvedContext Compiler: comp.
	    isAccessor ifTrue: [
		result: body codeGen: resolvedContext Compiler: comp
		    Formals: formals.
	    ] False: [
		result: body codeGen: resolvedContext Compiler: comp.
	    ].
	    comp addCode: '*_result = ', result, ';\n'.
	    comp addCode: 'currentEnv = ', resolvedContext callerEnvName, ';\n'.
	    env: resolvedContext generateEnvironment: comp.
	    comp currentStream prependCode: env.
	].
	comp addCode: 'return NORMAL_RETURN;\n'.
	comp indentLeft.
	comp addCode: '}\n\n'.
	isClosure ifFalse: [ comp emit. ].
	methodCName ).
    constructMethodName: context Compiler: comp = (
	isClosure ifTrue: [
	    comp asCName: comp interp rootFileName,
		';cecilClosure', comp newClosureNum printString.
	] False: [ | mName |
	    mName: comp asCName: name.
	    params nonEmpty ifTrue: [
		mName: mName, '_', params size printString.
	    ].
	    formals do: [ | :f | 
		mName: mName, '_', 
		    (comp asCName: f constraintSpec compilerPrintString).
	    ].
	    mName
	] ).
    addAnonBindings = ( isClosure not ).
    generateHeader: context Compiler: comp = (
	" Returns a list.  First element is the method name, rest of list
	 contains the names of the arguments "
	| mName. s. args. |
	mName: constructMethodName: context Compiler: comp.
	comp addCode: 'ReturnCode ', mName, 
	    '(OOP* _result'.
	isLocalAccessor ifTrue: [
	    comp addCode: ', int _offset'.
	].
	comp addCode: ', OOPList& _args) {\n'.
	mName ).
    realGenerateEntry: context Compiler: comp MethodName: mName 
		OopList: oopList ParentSets: s Pos: pos 
		HasPredicates: hasPredicates = (
	(pos >= s size) || [ hasPredicates not ] ifTrue: [ | selector |
	    selector: comp selectorID: isClosure ifTrue: 'eval' False: name.
	    comp addCode: isLocalAccessor ifTrue: 'addAccessorMethod('
					   False: 'addMethod('.
	    comp addCode: selector, ', &', mName, ', '.
	    isLocalAccessor ifTrue: [
		comp addCode: '"', (comp asCName: body fieldName), '", '.
	    ].
	    isInitSetAccessor ifTrue: [
		"mark these as public, so don't worry about caching access
		 privileges"
		comp addCode: 'PublicMethod,\n'.
	    ] False: [
		comp addCode: privacy compiledName, ',\n'.
	    ].
	    hasPredicates ifTrue: [ | newList |
		newList: list copyRemoveAll.
		comp addCode: '\tnewOOPList('.
		s do: [ | :argSet |
		    argSet size = 1 ifFalse: [
			error: 'argSet should have a single element'.
		    ].
		    argSet do: [ | :o |  "  only one element "
			newList add:
			    context top_context generateVariableReference:
			        o name Compiler: comp
		    ].
		].
		comp addCode: (comp makeList: newList), '),\n'.
	    ].
	    comp addCode: '\tnewOOPList(', (comp makeList: oopList), '));\n'.
	] False: [ 
	    (s at: pos) size = 1 ifTrue: [
		realGenerateEntry: context Compiler: comp MethodName: mName
		    OopList: oopList ParentSets: s Pos: pos + 1
		    HasPredicates: hasPredicates.
	    ] False: [ | savedSet |
		savedSet: (s at: pos) copy.
		savedSet do: [ | :e |
		    (s at: pos) removeAll.
		    (s at: pos) add: e.
		    realGenerateEntry: context Compiler: comp MethodName: mName
			OopList: oopList ParentSets: s Pos: pos + 1
			HasPredicates: hasPredicates.
		]
	    ]
	].
    ).
    generateTableEntry: context Compiler: comp MethodName: mName = ( 
	| savedStream. s. oopList.  
	  pSets.
	  hasPredicates <- false.
	|
	savedStream: comp currentStream.
	comp switchToTable.
	oopList: list copyRemoveAll.
	pSets: list copyRemoveAll.
	isClosure ifTrue: [
	    oopList add: comp globalRef: '_', mName In: context.
	].
	formals do: [ | :f. obj. newSet |
	    f isConstrained ifFalse: [
		oopList add: 'GLOBAL(base,_any)'.
		newSet: set copyRemoveAll.
		newSet add: (context lookup_binding: 'any') value.
		pSets add: newSet.
	    ] True: [
		obj: context lookup_binding: f constraintSpec object name.
		oopList add: 
		    context generateVariableReference: 
		        f constraintSpec object name Compiler: comp.
		newSet: obj value findNonPredicateParents.
		(newSet size > 1) || 
		[ (newSet includes: obj value) not ] ifTrue: [
		    hasPredicates: true.
		].
		pSets add: newSet.
	    ].
	].
	realGenerateEntry: context Compiler: comp MethodName: mName
	    OopList: oopList
	    ParentSets: pSets Pos: 0 HasPredicates: hasPredicates.
	comp switchToStream: savedStream.
    ).
    setupEnvironment: context Compiler: comp = ( 
	| n. varN. i. |
	" Creates a new environment, linked into the proper static and
	   dynamic chains, copies the parameters into the environment, and
	   initializes the local variables appropriately "
	context generateEnvironmentName.
	comp addCode: context typeName, ' ', context envName, 
	    '(currentEnv, ',
	    (isClosure 
		ifTrue: [ i: 1. '_args[0]->asClosureObj()->environment' ] 
		False: [ i: 0. 'GLOBAL_ENV' ]),
	    ');\n'.
	comp addCode: 'currentEnv = (CecilEnv*)&', context envName, ';\n'.
	formals do: [ | :f. s. |
	    f isAnonymous not || [addAnonBindings] ifTrue: [
		"Only add anonymous bindings to environment if we might have a
		 resend that needs them; this can only happen if it's not a
		 closure and it's not an accessor (i.e. a normal method)."
		f isAnonymous ifTrue: [
		    f compiledName: 'anon', i printString.
		] False: [
		    f compiledName: f name.
		].
		context addBinding:
		    cecil_constant_binding copyName: f compiledName
		        WithValue: cecil_uninitialized_variable.
		s: context generateVariableReference: f compiledName
		      Compiler: comp.
		comp addCode: s, ' = _args[', i printString, '];\n'.
	    ].
	    i: i succ.
	].
	n ).
| )

traits cecil_eval_method _AddSlots: ( |
    codeGen: context Compiler: comp = (
	resolvedContext: cecil_nested_context createInContext: context.
	resend.codeGen: context Compiler: comp ).
| )

traits cecil_nested_scope_node _AddSlots: ( |
    realCodeGen: context Compiler: comp = ( 
	| resultCode. scopeResult. mContext. env. |
	mContext: cecil_nested_context createInContext: context.
	mContext isCFuncContext: false.
	scopeResult: context newTempName.
	comp addCode: 'OOP ', scopeResult, ';\n'.
	comp addCode: '{  // Begin nested scope\n'.
	comp indentRight.
	mContext generateEnvironmentName.
	comp addCode: mContext typeName, ' ', mContext envName, 
	    '(currentEnv, currentEnv);\n'.
	comp addCode: 'currentEnv = &', mContext envName, ';\n'.
	resultCode: body codeGen: mContext Compiler: comp.
	comp addCode: scopeResult, ' = ', resultCode, ';\n'.
	comp addCode: 'currentEnv = ', mContext envName, '.dynamicEnv;\n'.
	comp indentLeft.
	env: mContext generateEnvironment: comp.
	comp currentStream prependCode: env.
	comp addCode: '}  // End nested scope\n'.
	scopeResult ).
| )

traits cecil_skeleton_body _AddSlots: ( |
    codeGen: context Compiler: comp = (
	error: 'child responsibility'.
    ).
| )

traits cecil_prim_method_body _AddSlots: ( |
    codeGen: context Compiler: comp = (
	error: 'shouldn\'t be compiling a primitive'.
    ).
| )

traits cecil_code_body _AddSlots: ( |
    codeGen: context Compiler: comp = (
	stmts nonEmpty ifTrue: [
	    comp addCode: '// Method statements\n'.
	    stmts do: [ | :stmt | stmt codeGen: context Compiler: comp. ].
	].
	comp addCode: '// Result expr\n'.
	resultExpr codeGen: context Compiler: comp ).
| )
    
traits cecil_abstract_body _AddSlots: ( |
    codeGen: context Compiler: comp = (
	comp addCode: '// Abstract method\n'.
	comp addCode: 'fatal(\"Calling abstract method\");\n'.
	'GLOBAL(base,_void)' 
    ).
| )

traits cecil_skeleton_accessor_body _AddSlots: ( |
    codeGen: context Compiler: comp = (
	error: 'child responsibility'.
    ).
    globalVarName = ( contents cName, ';init' ).
| )
traits cecil_get_accessor_body _AddSlots: ( |
    generateInitCode: context Compiler: comp VarName: globVar = ( | globRef |
	globRef: comp globalRef: globVar In: context.
	comp addCode: 'if (', globRef, ' == UNINITIALIZED_OOP) {\n'.
	comp indentRight.
	contents value == cecil_uninitialized_field_contents ifTrue: [
	    comp addCode: 'fatal("accessing uninitialized field\\n");\n'.
	] False: [ | exprStr. |
	    exprStr: contents value codeGen: context Compiler: comp.
	    comp addCode: globRef, ' = ', exprStr, ';\n'.
	].
	comp indentLeft.
	comp addCode: '}\n'.
	globRef ).
    declareVariable: context Compiler: comp = ( | globVar |
	globVar: comp asCName: globalVarName.
	context top_context fieldVarList add: globVar.
	globVar ).
    codeGen: context Compiler: comp Formals: formals = ( | globVar |
	comp addCode: '// Get shared variable accessor\n'.
	globVar: declareVariable: context Compiler: comp.
	generateInitCode: context Compiler: comp VarName: globVar ).
| )

traits cecil_local_get_accessor_body _AddSlots: ( |
    codeGen: context Compiler: comp Formals: formals = ( 
	| globVar. objRef. fieldRef. globRef. |
	comp addCode: '// Get local accessor\n'.
	globVar: declareVariable: context Compiler: comp.
	objRef: context generateVariableReference: formals first compiledName 
	    Compiler: comp.
	fieldRef: 'ACCESS(', objRef, ',_offset)'.
	comp addCode: 'if (', fieldRef, ' == UNINITIALIZED_OOP) {\n'.
	comp indentRight.
	globRef: generateInitCode: context Compiler: comp VarName: globVar.
	comp addCode: fieldRef, ' = ', globRef, ';\n'.
	comp indentLeft.
	comp addCode: '}\n'.
	fieldRef ).
| )

traits cecil_set_accessor_body _AddSlots: ( |
    codeGen: context Compiler: comp Formals: formals = (
	| globVar. globRef. newValueRef. |
	comp addCode: '// Set shared accessor\n'.
	globVar: comp asCName: globalVarName.
	globRef: comp globalRef: globVar In: context.
	newValueRef: 
	    context generateVariableReference: (formals at: 1) compiledName
	    Compiler: comp.
	comp addCode: globRef, ' = ', newValueRef, ';\n'.
	'GLOBAL(base,_void)' ).
| )

traits cecil_local_set_accessor_body _AddSlots: ( |
    codeGen: context Compiler: comp Formals: formals = ( 
	| objRef. fieldRef. newValueRef. |
	comp addCode: '// Set local accessor\n'.
	objRef: context generateVariableReference: formals first compiledName
	    Compiler: comp.
	fieldRef: 'ACCESS(', objRef, ',_offset)'.
	newValueRef: 
	    context generateVariableReference: (formals at: 1) compiledName
	    Compiler: comp.
	comp addCode: fieldRef, ' = ', newValueRef, ';\n'.
	'GLOBAL(base,_void)' ).
| )

traits cecil_include_node _AddSlots: ( |
    realCodeGen: context Compiler: comp = ( 
	| savedStreamState.  savedName. shortName. 
	  sMap.
	|
	comp saveIncludeInfo: context NewFile: fileName.
	(comp fullBuild) || 
	(comp staleFiles includes: fileName) ifTrue: [
	    comp processingFile: true.
	    comp saveStreams: context.
	    comp openStreams: fileName RealMain: topLevel Context: context.

	] False: [
	    " Just process include nodes within this file "
	    comp processingFile: false.
	    debugMsg: ('' padOnLeft: comp nestedDepth),
		'Skipping ', fileName, ' (not out of date)'.
	].
	'Should not use this result'
    ).
    codeGenIncludes: context Compiler: comp = (
	realCodeGen: context Compiler: comp
    ).
    savedRepresentation = ( printString ).
| )

traits cecil_end_include_node _AddSlots: ( |
    realCodeGen: context Compiler: comp = ( | shortName |
	comp processingFile ifTrue: [
	    context generatePredicateCode: comp
		ForFile: comp interp rootFileName.
	    context generateClosureInit: comp.
	    comp closeStreams: context RealMain: topLevel.
	    comp restoreStreams: context.
	].
	shortName: comp interp rootFileName.
	comp restoreIncludeInfo: context OldFile: fileName.
	comp includeSet add: fileName.
	comp processingFile ifTrue: [
	    comp methodTableStream addCode: (comp asCName: shortName), 
		'_init_methods();\n'.
	    comp initStream addCode: (comp asCName: shortName), 
		'_init();\n'.
	    comp mainStream addCode: (comp asCName: shortName), '_main();\n'.
	].
	'Should not use this result'
    ).
    codeGenIncludes: context Compiler: comp = (
	realCodeGen: context Compiler: comp
    ).
| )

traits cecil_prim_include_node _AddSlots: ( |
    realCodeGen: context Compiler: comp = ( 
	"generate a #include needed by some later primitive method"
	comp addCode: '#include ',
	    (fileName first = '<' ifTrue: fileName False: ['"', fileName, '"']),
	    '\n'.
	'Should not use this result'
    ).
| )

traits cecil_field_init_list _AddSlots: ( |
    codeGen: context Compiler: comp = (
	do: [ | :fieldInitNode |
	    fieldInitNode codeGen: context Compiler: comp.
	].
	self ).
| )

traits cecil_expr_list _AddSlots: ( |
    "evaluate expressions as a list of top-level things; return the last one"
    codeGen: context Compiler: comp = ( | s. |
	s: 'GLOBAL(base,_void)'.
	do: [ | :expr. savedStream. didSave <- false. |
	    context isTopContext &&
		"these tests are incredibly GROSS!!!!!!"
		[expr parent != traits cecil_decl_block] &&
		[expr parent != traits cecil_include_node] &&
		[expr parent != traits cecil_end_include_node] ifTrue: [
		didSave: true.
		savedStream: comp currentStream.
		comp currentStream: comp mainStream
	    ].
	    (expr = last) && [ context isTopContext ] ifTrue: [
		expr isEndIncludeNode ifFalse: [
		    error: 'should be an end_include node'
		].
		comp mainStream addCode: 'return ', s, ';\n'.
	    ].
            s: expr codeGen: context Compiler: comp.
	    didSave ifTrue: [
		comp switchToStream: savedStream.
	    ].
	].
	s ).
    computeConstrainedPositions: comp = ( 
	do: [ | :expr | expr computeConstrainedPositions: comp ].
    ).
    savedRepresentation = ( | s |
	s: ''.
	do: [ | :expr | s: s, expr savedRepresentation. ].
	s ).
| )


traits cecil_interp _AddSlotsIfAbsent: ( | cecil_field_info = () | )
traits cecil_field_info _Define: ( |
    parent* = traits clonable.
    copyInfoNode: node = ( | c |
	c: resend.copy.
	c name: node name.
	c kind: node kind.
	c objectName: node objectName.
	c offset: -1.
	c obj: 'Object not assigned yet'.
    ).
    printString = (
	kind printString, ' ', name, '(@', objectName, ')'
    ).
| )

globals cecil_interp _AddSlotsIfAbsent: ( | cecil_field_kind = () | )

globals cecil_interp _AddSlotsIfAbsent: ( | cecil_field_info = () | )
globals cecil_field_info _Define: ( |
    parent* = traits cecil_field_info.
    name <- 'No name yet'.
    cName <- 'No C name yet'.
    kind <- 'No type'    " cecil_field_kind ".
    objectName <- 'No objectName yet'.
    obj <- cecil_object.
    offset <- -1.  " Offset into C struct "
| )

traits cecil_interp _AddSlotsIfAbsent: ( | cecil_field_info_list = () | )
traits cecil_field_info_list _Define: ( |
    parent* = traits list.
    errHandlingParent* = mixins cecil_error_handling.

    printString = ( | str |
	str: 'Cecil field info list (', size printString, ' items)\n'.
	do: [ |:e| str: str, '   ', e printString, '\n'. ].
	str 
    ).
| )

globals cecil_interp _AddSlotsIfAbsent: (| cecil_field_info_list = () |)
cecil_field_info_list _Define: list clone _AddSlots: ( |
    _ parent* = traits cecil_field_info_list.
| )
