"Sun-$Revision: 9.1 $"

"tokenize cecil prorgams"

traits cecil_interp _AddSlotsIfAbsent: ( | cecil_scanner = () | )
traits cecil_scanner _Define: ( |
    parent* = traits clonable.
    errHandlingParent* = mixins cecil_error_handling.

    printString = ( 
	fileName = '' ifTrue: 'cecil_scanner' 
	    False: 'cecil_scanner: ', fileName.
    ).

    ^ createOnString: in_string = ( | s. |
	s: copy.
	s fileName: '<prompt>'.
	s input: in_string.
	s initialize.
	s ).

    ^ createOnFile: fileName = ( | s. |
	s: copy.
	"this cecil_scanner will locate the full path name for the file"
	s locateFile: fileName.
	s readFile.
	s initialize.
	s ).

    locateFile: fileName = ( 
	fileName: 
	    unixFile locate: fileName IfFail: [ | :str | ^ cecilErr: str ].
    ).

    readFile = ( | i |
	i: cecil_interface createOnRead: fileName.
	input: i readFile.
	i ).

    writeFile: tokens = ( | i |
	i: cecil_interface createOnWrite: fileName, '.token'.
	i writeFile: tokens.
	i ).

    " returns a long list of all tokens "
    scan = ( | tokens |
	tokens: list copy.
	[ | :exit. t. |
	    t: getNextToken.
	    tokens add: t.
	    t isEOF ifTrue: exit.
	] loopExit.
	"writeFile: tokens."
	tokens ).

    getNextToken = ( | nt |
	nt: getNextTokenHelper.
	nt location fileName: fileName.
	nt ).

    getNextTokenHelper = (
	[
	    isEOF ifTrue: [ ^ eof ] False: [
	    isWhite ifTrue: [ white ] False: [
	    isComment ifTrue: [ comment ] False: [
	    isNestedComment ifTrue: [ nestedComment ] False: [
	    setUndeclaredMode.
	    isLetter ifTrue: [ ^ identifier ] False: [
	    isDigit || [isSign] ifTrue: [ ^ number ] False: [
	    isString ifTrue: [ ^ string ] False: [
	    isChar ifTrue: [ ^ char ] False: [
	    isBinary ifTrue: [ ^ binary ] False: [
	    isUnderBar ifTrue: [ ^ underBarBinary ] False: [
	    isSeparator ifTrue: [ ^ separator ] False: [ 
	    syntaxErr: 'unrecognized input' ] ] ] ] ] ] ] ] ] ] ].
	] loop.
    ).


    eof = ( createToken: 'eof' IdType: 'eof' ).


    identifier = ( | i. word. |
	i: inputPosition.
	[ | :exit |
	    getSegment.
	    isEOF || [ isUnderBar not ] ifTrue: exit.
	] loopExit.
	word: input copyFrom: i UpTo: inputPosition.
	createToken: word IdType:  
	    (isReservedWord: word) ifTrue: 'reserved' False: 'identifier'
    ).


    number = ( | i. word. num. |           
	i: inputPosition.
	[ advance ] untilTrue: [ isEOF || [isDigit not] ].
	isDot && [ (inputPosition < input lastKey) &&
		[(input at: inputPosition+1) isDigit] ] ifTrue: [
	    | word2. len. newi. |            "float number"
	    word2: input copyFrom: i UpTo: inputPosition.
	    advance.
	    newi: inputPosition.
	    [ advance ] untilTrue: [ isEOF || [isDigit not] ].
	    word: input copyFrom: newi UpTo: inputPosition.
	    len: word size.
	    word: word2, word.
	    num: word asInteger asFloat.
	    len do: [ num: num / 10 ].
	    word: input copyFrom: i UpTo: inputPosition.
	    ^ createLiteralToken: num IdType: 'float'.
        ].	
        word: input copyFrom: i UpTo: inputPosition.
        createLiteralToken: word asInteger IdType: 'integer' ).
    
    string = ( | word |
	advance. "skip the double quote"
	word: ''.
	[ | :exit |
	    isEOF ifTrue: [ syntaxErr: 'missing double quote before eof' ].
	    isString ifTrue: [
		advance. "skip the double quote"
		exit value ].
	    isEscape ifTrue: [ word: word, escape ] 
		False: [ word: word, thisChar. advance ].
	] loopExit.
        createLiteralToken: word IdType: 'string' ).

    char = ( | letter |
	advance.    "skip the single quote"
    	isEOF ifTrue: [ syntaxErr: 'premature end of character literal' ].
	isEscape ifTrue: [ letter: escape. ] 
	    False: [ letter: thisChar. advance. ].
    	isEOF ifTrue: [ syntaxErr: 'missing single quote before eof' ].
    	isChar ifFalse: [
	    syntaxErr: 'multi-character character literals not allowed' ].
    	advance.  "skip the single quote"
        createLiteralToken: letter IdType: 'char' ).

    escape = (
	| single_char_escapes = '\'\"\\abfnrtv?0'.
	  matching_meanings   = '\'\"\\\a\b\f\n\r\t\v\?\0'. |
	advance. "eat the backslash"
    	isEOF ifTrue: [ syntaxErr: 'premature file end in escape sequence' ].
	(single_char_escapes includes: thisChar) ifTrue: [ | letter |
	    letter: matching_meanings at: (single_char_escapes keyAt: thisChar).
	    advance.
	    ^ letter ].
	('xdo' includes: thisChar) ifTrue: [ ^ numericEscape ].
	syntaxErr: 'unexpected escape'.
    ).

    numericEscape = ( cecilErr: 'sorry, numeric escapes not implemented yet' ).

    underBarBinary = ( | i. word. |
	i: inputPosition.
	getSegment. "get the underBar"
	isUndeclaredMode ifTrue: [
	    ^syntaxErr: 'unrecognized binary operator "', 
	        (input copyFrom: i UpTo: inputPosition), '"'.
	].
	[ | :exit |
	    (isEOF || [ isUnderBar not ]) ifTrue: exit.
	    getSegment.
	] loopExit.
        word: input copyFrom: i UpTo: inputPosition.
        createToken: word IdType: 'binary' ).

    getSegment = (
	isUnderBar ifTrue: [
	    "allow several underbars connected together"
	    [ advance ] untilFalse: [ isUnderBar ].
	].
	(isLetter || isDigit) ifTrue: [ setNonBinaryMode.
	] False: [
	    isBinary ifTrue: [ setBinaryMode.
	    ] ].	
	isBinaryMode ifTrue: [
	    [ isEOF not && [isBinary] ]
		whileTrue: [ advance ].
	] False: [
	    isNonBinaryMode ifTrue: [
		[ isEOF not && [isLetter || [isDigit]]]
		    whileTrue: [ advance ].
	    ].
	].
    ).

    binary = ( | i. word. |
	i: inputPosition.
	[ | :exit |
	    getSegment.
	    isEOF || [ isUnderBar not ] ifTrue: exit.
	] loopExit.
        word: input copyFrom: i UpTo: inputPosition.
        createToken: word IdType: 'binary' ).

    separator = ( | word. start. |
	start: inputPosition.
	isColon ifTrue: [
	    "might be ':' or ':='"
	    advance.
	    isEqual ifTrue: [ 
		advance. 
	    ].
	] False: [
	    "some separator not beginning with a colon"
	    advance.
	].
        word: input copyFrom: start UpTo: inputPosition.
   	createToken: word IdType: 'separator' ).

    white = (
	[ isEOF not && [isWhite] ] whileTrue: [ advance ].
    ).

    comment = (
    	advance: 2.   "skip the -- part"
    	[ isEOF not && [ isEOL not ] ] whileTrue: [ advance ].
    ).

    nestedComment = (
    	advance: 3.   "skip the (-- part"
	[ | :exit. :continue. |
	    isEOF ifTrue: [ syntaxErr: 'missing the corresponding "--)"' ].
	    isEndingNestedComment ifTrue: [ 
		advance: 3.  "skip the --) part"
		exit value.  "done with loop"
	    ].
	    isNestedComment ifTrue: [
		"enter a new nested comment"
		nestedComment.
		continue value.	"start loop over"
	    ].
	    "something in the comment; skip over it"
	    advance.
	] loopExitContinue.
    ).

    initialize = (
    	lineNum: 1.
	inputPosition: input firstKey.
	setThisChar.
	self).

    createToken: word IdType: id = ( | t. |
	t: token createOn: id Name: word.
    	t location lineNum: lineNum.
	t ).
 
    createLiteralToken: v IdType: id = ( | t.  obj. |
	t: literal_token createOn: id Value: v.  
    	t location lineNum: lineNum.
	t ).

    setThisChar = (
	thisChar: isEOF ifTrue: [' ' first] False: [input at: inputPosition].
    	isEOL ifTrue: [ lineNum: lineNum + 1 ].
	self ).

    advance = (
	isEOF ifTrue: [ errPrint: 'Scanner Err: advancing past end'. ].
	inputPosition: inputPosition successor.
	setThisChar.
	self).

    advance: i = ( i do: [ advance ] ).

    retreat = ( 
	inputPosition = input firstKey ifTrue: [ 
	    errPrint: 'Scanner Err: retreating past beginning' ].
	inputPosition: inputPosition predecessor.
	setThisChar.
	self).

    isEOF = ( inputPosition > input lastKey ).
    isEOL = ( thisChar = '\n' ).

    isComment = ( 
    	thisChar = '-' ifTrue: [ 
	    "reach end of file"
	    ((inputPosition+1) > input lastKey ) ifTrue: [ ^ false ].
	    ^(input at: inputPosition+1) = '-' ].
	false.
    ).

    isNestedComment = (
	thisChar = '('  ifTrue: [
	    ((inputPosition+2) > input lastKey ) ifTrue: [ ^ false ].
	    ^((input at: inputPosition+1) = '-') && [
		(input at: inputPosition+2) = '-' ]
	].
	false.
    ).

    isEndingNestedComment = (
	thisChar = '-'  ifTrue: [
	    ((inputPosition+2) > input lastKey ) ifTrue: [ ^ false ].
	    ((input at: inputPosition+1) = '-') && [
		(input at: inputPosition+2) = ')' ]
        ] False: [ false ].
    ).

    isReservedWord: word = (
	(word = 'var') || [ word = 'method' ] || [ word = 'field' ] ||
	[ word = 'object' ] || [ word = 'type' ] || 
	[ word = 'inherits' ] || [ word = 'isa' ] || [ word = 'subtypes' ] || 
	[ word = 'prim' ] || [ word = 'resend' ] || 
	[ word = 'abstract' ] || [ word = 'template' ] ||
	[ word = 'concrete' ] || [ word = 'shared' ] ||
	[ word = 'read_only' ] || [ word = 'init_only' ] || 
	[ word = 'public' ] || [ word = 'private' ] ||
	[ word = 'get' ] || [ word = 'put' ] ||
	[ word = 'pred' ] || [ word = 'when' ] ||
	[ word = 'include' ] || [ word = 'void' ] ).

    isWhite = (' \t\n' includes: thisChar).
    isLetter = ( thisChar isLowerCase || [ thisChar isUpperCase ] ).
    isChar = ( thisChar = '\'' ).
    isString = ( thisChar = '\"' ).
    isEscape = ( thisChar = '\\' ).
    isDigit = ( thisChar isDigit ).
    isSign = (
	(thisChar = '-') && [ | t | 
	    advance. t: isEOF not && [isDigit]. retreat. t ] ).
    isUnderBar = ( thisChar = '_' ).
    isDot = ( thisChar = '.' ).
    isEqual = ( thisChar = '=' ).
    isColon = ( thisChar = ':' ).
    isSeparator = ( '@()[]{}.:;,`' includes: thisChar ).
    isBinary = ( '!#$%^&*-+=\\~<>/?|' includes: thisChar ).

    setUndeclaredMode = ( mode: 0 ).
    setNonBinaryMode = ( mode: 1 ).
    setBinaryMode = ( mode: 2 ).
    isUndeclaredMode = ( mode = 0 ).
    isNonBinaryMode = ( mode = 1 ).
    isBinaryMode = ( mode = 2 ).
|)

globals cecil_interp _AddSlotsIfAbsent: ( | cecil_scanner = () | )
cecil_scanner _Define: ( |
    _ parent* = traits cecil_scanner.
    _ thisObjectPrints = true.
    input.
    inputPosition.
    thisChar.
    fileName <- ''.
    lineNum <- 0.
    mode <- 0.
| )

