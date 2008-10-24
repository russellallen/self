"$Revision: 8.5 $"

" this file contains the language-indep. stages for the lexer.
  It uses a pipeline of stages, where each stage recognizes one
  kind of token.  DI is used to implement state machines
  dmu -- 7/92
"

" things to do: "
"angled file name not used?"

prototypes  applications lexer _AddSlotsIfAbsent: ( | 
    stages     = ().
| )
traits      applications lexer _AddSlotsIfAbsent: ( | 
    stages     = ().
| )

" simple pipeline stages:"

traits lexer stages _AddSlotsIfAbsent: ( |
         stage                 = ().
         abstractSource        = ().
         source                = ().
         abstractSink          = ().
         sink                  = ().
         filter                = ().
         statesProbe           = ().
	 probe		       = ().
	 formattedProbe	       = ().
         fileReader            = ().
         tokenFileWriter       = ().
         sourceFileWriter      = ().
         main                  = ().
         charsToTokens         = ().
         charCatcher	       = ().
	 whiteSpace	       = ().
	 whiteFilter	       = ().
	 terminalizer          = ().
	 addLaster             = ().

  tokenizer = ().
    tokenProbe   = ().
    newline      = ().
    quotedToken	 = ().
    quotedTokenWithEscapes	 = ().
    identifier			 = ().
    operator   		 = ().
| )

prototypes lexer  stages _AddSlotsIfAbsent: ( |
         endCap		       = ().
         source		       = ().
         sink		       = ().
         filter		       = ().
         statesProbe           = ().
         probe                 = ().
	 formattedProbe	       = ().
         fileReader	       = ().
         tokenFileWriter       = ().
         sourceFileWriter      = ().
         main                  = ().
         charsToTokens         = ().
         charCatcher	       = ().
	 whiteSpace	       = ().
	 whiteFilter	       = ().
	 terminalizer          = ().
	 addLaster             = ().
  tokenizer = ().
    tokenProbe     = ().
    newline        = ().
    quotedToken	 = ().
    quotedTokenWithEscapes	 = ().
    identifier			 = ().
    operator   		 = ().
| )

lexer stages _AddSlots: ( |
    names* = lexer.
| )


" the stages are doubly linked, and this dummy is what the ends
  are initialized to--a special sort of nil"

lexer stages endCap _Define: ( |
  _ parent* = traits oddball.
  ^ input     = (self).
  ^ output    = (self).
  ^ input:  i = (self).
  ^ output: o = (self).
  ^ printString = ('an endCap').
  _ thisObjectPrints = true.
| )


" the general pipeline stage "

"   stage protocol:

    run                --  run me.  
    process: c         --  process an incoming char or token.
    put: c             --  send c on to my output
    eof                --  the current source file has ended. 
				(tokens cant straddle files)
    finish             --  the end of the whole magilla.
    bypass             --  remove me from the pipe
    -> x               --  splice in x after me in the pipe
"
traits lexer stages stage _Define: ( |
  "secondary priority to avoid conflict over 'comment'"
  _ parent**     = traits clonable.

  _ stageNames*  = lexer stages.

  ^ printString = ('a lexer ', stageName, ' stage').
  ^ stageName	= '?'. " different for each kind of stage "
  ^ isEater     = false.
  ^ isOKToStartCommentOrString = true.
  ^ isOKToStartNumberOrIdentifier = true.

  " a variety of probes for debugging "

  ^ probeMe           = (                probe copy stage: self).
  ^ formattedProbeMe  = (       formattedProbe copy stage: self).
  ^ probeMyTokens     = (           tokenProbe copy stage: self).
  ^ probeMyStates     = (          statesProbe copy stage: self).

    " to be used by stages: "

"_" reprocess: t = (process: t). "used to ask myself to process something"

    " clever assertion-checking utilities (move higher in hier?) "

  _ checkAsserts = true.
"_" assert: b = (
        checkAsserts && [b value not] ifTrue: [ | vmm |
	    vmm: (reflect: b) valueSlot contents.
	    error: 
	        warningPrefix,
                ' assertion failed: ', 
		vmm file reflectee, ':', vmm line reflectee printString, ' ',
		'[ ', vmm source reflectee, ' ] ' .
        ].
	self).

    " was in abstractSource but conflicted w/ global run"
  ^ run              = (output run.  self).
| )

" inherited by any stage that outputs to another stage "

traits lexer stages abstractSource _Define: ( |
  _ parent* = traits lexer stages stage.

  " default implementations of rightward ops:"

  ^ eof                = (output eof.		      self).
  ^ finish             = (output finish.              self).
  ^ addWriter: w       = (output addWriter: w.  self).
  ^ grammar: g	       = (output grammar: w.  self).

  ^ retrieveSavedWhite = (output retrieveSavedWhite). "for cpp"
  ^ emitLineNumberEntering: isE   = (
	output emitLineNumberEntering: isE  ).
  ^ emitLineNumber              = (output emitLineNumber).



  " dummy implementations of ops that use output"

  ^ process: c         = (put: c.                     self). 


  " real impls of ops using output:"

  ^ -> f               = (f insertAfter: self Before: output).

"_" put:  c            = ( output process: c.          self).
"_" putc: c            = (put: c first). "convert to char so isDigit works"

    checkPipe = ( | x | "used for debugging"
        x: self. 
	[x stageName = 'source' ifTrue: [^self]. x: x input.] loop).
| )

" the stage at the start of the pipe. "

traits lexer stages source _Define: ( |
  _ parent*          = traits lexer stages abstractSource.

  ^ stageName	     = 'source'.
  ^ warningPrefix    = ''.
  ^ inputLineNumber  = 0.
  ^ inputLineNumber: n = (self).
  ^ inputFileFullName    = ''.
  ^ inputFileFullName: n = (self).
  ^ wasIncludedWithQuotes = true.
| )
        
lexer stages source _Define: ( |
  _ parent* = traits lexer stages source.
  ^ output <- lexer stages endCap.

  _ thisObjectPrints = true.
| )

" traits for stages that have an input "

traits lexer stages abstractSink _Define: ( |
  _ parent* = traits lexer stages stage.

  " default implementations:"

  ^ inputFileFullName      = (input inputFileFullName).
  ^ inputFileFullName: n   = (input inputFileFullName: n).
  ^ inputLineNumber    = (input inputLineNumber).
  ^ inputLineNumber: n = (input inputLineNumber: n).
  ^ warningPrefix      = (input warningPrefix).

  ^ macros		= (input macros). "for cpp"
  ^ ignoreSet		= (input ignoreSet). "for cpp"
  ^ includePath	        = (input includePath).
  ^ insertFileReader: fr = (input insertFileReader: fr. self).
  ^ isFileReader        = false.
  ^ wasIncludedWithQuotes = (input wasIncludedWithQuotes).
| )

" the stage at the end of the pipe "

traits lexer stages sink _Define: ( |
  _ parent*            = traits lexer stages abstractSink.

  ^ run                = (self).
  ^ eof		       = (self).
  ^ finish             = (self).

  " only called ->, splice me in. 
    Specialized here cause I dont have an output.
    This one is only used by the sink at the end of the pipe"

  ^ insertAfter: i Before: o = ( 
	i output: self.
	input: i).

  ^ stageName	     = 'sink'.

  ^ process: c = (self). 

  ^ addWriter: w = (input -> w.  self).
| )
        
lexer stages sink  _Define: ( |
  _ parent* = traits lexer stages sink.
  ^ input <- lexer stages endCap.

  _ thisObjectPrints = true.
  ^ emitLineNumberEntering: e  = (self).
  ^ emitLineNumber = (self).
| )

" a stage with both input and outputs "

traits lexer stages filter _Define: ( |
  _ sourcing*  = traits lexer  stages abstractSource.
  _ sinking*   = traits lexer  stages abstractSink.

  ^ insertAfter: i Before: o = (
           input: i.
          output: o.
        i output: self.
        o  input: self.
        self).

"_" bypass = (
         input  output: output.
        output   input:  input.
        self).

    " this should be in abstractSink, but would give ambig error "

  ^ warning: msg = ( 
        resend.warning: warningPrefix, msg.
	halt "xxx" ).

  ^ error: msg = ( resend.error: warningPrefix, msg).

  ^  stageName	     = 'filter'.
| )


lexer stages filter _Define: ( |
  _ parent* = traits lexer stages filter.            
  
  ^ input  <- lexer stages endCap.
  ^ output <- lexer stages endCap.

  _ thisObjectPrints = true.
| )


" a high-priority mixing for printing out state transitions "

traits lexer stages statesProbe _Define: ( |
  _ parent* = traits clonable.

  ^ printString = ('states probe on ', stage printString).

  ^ state: s = (
        ('new state is ', (reflect: s) name) printLine.  
	resend.state: s).

    copy = (clone stage: stage copy).| )

lexer stages statesProbe _Define: ( |
  _ parent** = traits lexer stages statesProbe.
  ^ stage*** <- lexer stages filter.
| )

" a hi-pri mixin for printing out inputs and outputs "

traits lexer stages probe _Define: ( |
  _ parent* = traits clonable.

  ^ printString = ('probe on ', stage printString).

  ^ process: c = (
        (c printString, '  received\n') print.	
	resend.process: c).

"_" put: c = (
        (c printString, '  sent\n') print.
	resend.put: c).

    copy = (clone stage: stage copy).
| )

lexer stages probe _Define: ( |
  _ parent** = traits lexer stages probe.
  ^ stage*** <- lexer stages filter.

  " avoid printing incoming tokens twice "
"_" reprocess: c = (stage.process: c). "must be down here for resend to work"
| )


" a probe that tries to format nicely "

traits lexer stages formattedProbe _Define: ( |
  _ parent* = traits clonable.

  ^ printString = ('formattedProbe on ', stage printString).

  ^ process: c = (
        printIncoming: c.
	resend.process: c).

  _ printIncoming: c = (| s <- ''.  tokWidth = 40.  |
        s: c printString copySize: tokWidth.
	s: s, ' -> ', stageName, ' stage '.
        width: s size.
	havePrintedInput ifTrue: ['\n' print] False: [havePrintedInput: true].
	s print.
	self).

"_" put: c = (
        havePrintedInput ifFalse: [('' copySize: width) print] 
	                    True: [havePrintedInput: false].
	(' -> ', c printString, '\n') print.
	resend.put: c).

    copy = (clone stage: stage copy).| )

lexer stages formattedProbe _Define: ( |
  _ parent** = traits lexer stages formattedProbe.
  ^ stage*** <- lexer stages filter.

"_" reprocess: c = (stage.process: c). "must be down here for resend to work"

  _ havePrintedInput <- false.
  _ width <- 0.
| )


" I read a file, count its lines, and send out chars down the pipe.
  To do an #include, just splice one of me in
"

traits lexer stages fileReader _Define: ( |
  _ parent* = traits lexer stages filter.

  ^ isFileReader = true.

  ^ warningPrefix = ( 
        inputFileName, ' ', inputLineNumber printString, ': ').

  ^ process: inc = ( run.  put: inc).
  ^ eof          = ( run.  output eof).

  _ openIfFail: fail = ( | err <- ''. p |
	unixFile openForReading: inputFileName IfFail: [|:e| fail value: e]).

  ^ run = ( | i |
	output eof.
        file: openIfFail: [|:e|
	    input  "send to input to get right warningPrefix"
	        warning: 'could not open file: ', inputFileFullName, 
			 ' error: ', e.
	    bypass.
	  ^ self
        ].
	readFile).
	
  _ readFile = (
        [file atEOF] whileFalse: [ | s |
            s: file read.
	    s do: [|:c|
                put: c.
        	c = '\n' ifTrue: [
		    inputLineNumber: inputLineNumber + 1.
		    (inputLineNumber % 7) = 0 ifTrue: ['.' print]. "xxx"
		].
            ].
        ].
        file close.
	output eof.
        bypass.
        self).

  ^ stageName	     = 'fileReader'.

  ^ insertFileReader: fr = (-> fr.  self).
| )

lexer stages fileReader _Define: lexer stages filter copy _AddSlots: ( |
  _ parent*    =  traits lexer stages fileReader.
  ^ inputLineNumber <- 1.
  ^ inputFileName <- ''.
  _ file <- unixFile.
| )

" currently writes out the tokens for debugging "

traits lexer stages tokenFileWriter _Define: ( |
  _ parent* = traits lexer stages filter.

  ^ fileName     = ( file name).

  ^ open: fn     = ( file: unixFile openForWriting: fn. self).

  ^ process: c = ( 
        file write: (whatToWriteFor: c).
	self).

  _ whatToWriteFor: c = (c printString, '\n').

  ^ finish     = ( file close.  resend.finish.  self).

  ^ stageName	     = 'tokenFileWriter'.
| )

lexer stages tokenFileWriter _Define: lexer stages filter copy _AddSlots: ( |
  _ parent* = traits lexer stages tokenFileWriter.

  _ file       <- unixFile.
| )

" writes out the source "

traits lexer stages sourceFileWriter _Define: ( |
  _ parent* = traits lexer stages tokenFileWriter.

  _ whatToWriteFor: c = (c sourceForCPPOutput).
  ^ stageName	     = 'sourceFileWriter'.
| )

(lexer stages sourceFileWriter 
) _Define: lexer stages tokenFileWriter copy _AddSlots: ( |
  _ parent* = traits lexer stages sourceFileWriter.
| )


" maps to structured grammar tokens (Ole's grammar)"

traits lexer stages terminalizer _Define: ( |
  _ parent* = traits lexer stages filter.

  ^ stageName	     = 'terminalizer'.
  ^ copy = ((
        resend.copy    literals:    literals copy) 
		    nonliterals: nonliterals copy).
  ^ grammar: g = (
        g terminalsDo: [|:t|
	    (t isLiteral ifTrue: literals False: nonliterals)	
	        at: t kind Put: t
        ].
	self).
  ^ process: t = (
      put:
        ((
	       literals at: t source    IfAbsent: [
	    nonliterals at: t tokenType IfAbsent: [
	        error: 'cannot find match for: ', t printString.
            ]]
         )  copy
	 )  lexerInfo: t).
| )

(lexer stages terminalizer
) _Define: lexer stages filter copy _AddSlots: ( |
  _ parent* = traits lexer stages terminalizer.
  _    literals <- dictionary copyRemoveAll.
  _ nonliterals <- dictionary copyRemoveAll.
| )


" collects da tokens for cpp"

traits lexer stages addLaster _Define: ( |
  _ parent* = traits lexer stages filter.

  ^ stageName	     = 'addLaster'.
  ^ process: t = (destination addLast: t).
| )

(lexer stages addLaster
) _Define: lexer stages filter copy _AddSlots: ( |
  _ parent* = traits lexer stages addLaster.
  ^ destination <- list copyRemoveAll.
| )


" the main guy, installed right after source"

traits lexer stages main _Define: ( |
  _ parent**        = traits lexer stages filter.

  " here is how to run lexer: lexer stages main copy readFileNamed:..."

  ^ processFrom: sourceStage To: sinkStage = (
        makePipe.
        -> sourceStage.
        addWriter: sinkStage.
        run.
	finish).

  ^ readFileNamed: rn WriteFileNamed: wn = (
        processFrom: (fileReader copy inputFileName: rn) 
               To:    fileWriter copy open: wn).

  ^ readFileNamed: rn = ( | r |
	r: list copyRemoveAll.
        processFrom: (fileReader copy inputFileName: rn) 
               To:    addLaster copy destination: r.
        r).

"REFACTOR xxx"

  ^ readFileNamed: rn Grammar: g = ( | r |
        makePipe.
	-> fileReader copy inputFileName: rn.
	addWriter: terminalizer copy grammar: g.
	r: list copyRemoveAll.
	addWriter: addLaster copy destination: r.
	run.	  
	finish.
        r).

  " build the pipeline, readers and writer added later "

  _ makePipe = (
       source copy -> self.
       appendStages: pipeStages asList addLast: sink).

  ^ appendStages: x = (
        x reverseDo: [|:y| -> y copy].
	self).

  _  pipeStages = (  prelexerStages, tokenStages).

  _ prelexerStages = vector.
  _ tokenStages    = (vector copyAddFirst: charsToTokens).

  _ fileWriter = (tokenFileWriter).

  ^ stageName	     = 'main'.
| )

lexer stages main _Define: lexer stages filter copy _AddSlots: ( |
  _ parent* = traits lexer stages main.
| )


" wrap each char in a token, so later stages always deal with tokens "

traits lexer stages charsToTokens _Define: ( |
  _ parent*     = traits lexer stages filter.
  ^ stageName   = 'charsToTokens'.
  ^ process: c  = ( put: tokens char copy source: c).
| )

lexer stages charsToTokens _Define: lexer stages filter copy _AddSlots: ( |
  _ parent* =  traits lexer stages charsToTokens.
| )


" after the tokenizers, catch any remaining raw token chars "

traits lexer stages charCatcher _Define: ( |
  _ parent* = traits lexer stages filter.

  ^ process: c = (
	c isCharToken ifFalse: [put: c] True: [
            warning: 'illegal character <', c source, '>']).

  ^ stageName	     = 'charCatcher'.
| )

lexer stages charCatcher _Define: lexer stages filter copy _AddSlots: ( |
  _ parent* =  traits lexer stages charCatcher.
| )

"filter out white space tokens, not interesting anymore"

traits lexer stages whiteFilter _Define: ( |
  _ parent*           = traits lexer stages filter.
  ^ stageName	      = 'whiteFilter'.
  ^ process: c   = (
        c isWhiteSpace ifTrue: [ | w |
	    w: c sourceForCPPOutput.
	    savedWhite: savedWhite, w.
        ] False: [| w |
	    savedWhite isEmpty ifTrue: [put: c] False: [
	        w: savedWhite.
		savedWhite: ''.
                put: c copyPrependWhite: w asString.
            ].
        ]).

  ^ retrieveSavedWhite = ( | r |
        r: savedWhite asString.
	savedWhite: ''.
	r).
| )

lexer stages whiteFilter _Define: lexer stages filter copy _AddSlots: ( |
  _ parent* =  traits lexer stages whiteFilter.
 ^_ savedWhite <- ''.
| )

"========================================================="

" a tokenizer is a fancy stage that collects incoming tokens in
  a list called storedTokens, and may emit a different kind of token.
"
"
  major protocol:

    init	always the name of the initial state
    flush	flush out my stored tokens, and return to init stage
    buildToken  build output token from storedTokens
    putToken    build token, output, reset
    reset       empty stored token list and goto init state
    >> t        concatenate a token into storedTokens list
    removeLast  undoes last >>, & returns it
    tokenProto	prototype of token I emit
    stageName   what kind of stage am I


    each stage has to decide what to do on eof (if not just pass
	it on), typically by relaying eof to one of:

    eofFlush	flush on eof
    eofToken    putToken on eof
    eofWarn     kvetch on eof
"

traits lexer stages tokenizer _Define: ( |
  _ parent*    = traits lexer stages filter.

    "to be used"

  ^ copy     = ((resend.copy storedTokens: storedTokens copy) reset).

"_" reset       = ( storedTokens removeAll.  state: init   ).
  _ >> t        = ( storedTokens addLast: t.        self   ).
"_" removeLast  = ( storedTokens removeLast                ).

  _ flush       = (  | st |
        st: storedTokens copy.
	reset.
	st do: [|:t| put: t].
	self).


  _ buildToken     = (tokenProto copy source: storedTokensString).

  _ storedTokensString = ( | r <- ''. | "concat strings of stored toks"
        storedTokens do: [|:t| r: r, t sourceForCPPOutput].
	r asString).

"_" putToken     = ( | t |
        t: buildToken.
	" reset before put, because put may cause me to get an incoming token
	  because macro expansion results in cycles "
	reset. 
	put: t).


  _ eofFlush = ( flush.     output eof ).
  _ eofToken = ( putToken.  output eof ).
  _ eofWarn  = ( 
            warning: 'file ends in the midst of a ', 
		       tokenProto tokenType,  ' token'.
            flush.
	    output eof).


  " next two are different for each tokenizer: "

  _ tokenProto = ( tokens token).
  ^ stageName	     = 'tokenizer'.
  _ init = ().
| )

lexer stages tokenizer _Define: lexer stages filter copy _AddSlots: ( |
  _ parent** =  traits lexer stages tokenizer.
  _ storedTokens     <- list copyRemoveAll.
  _ state* <- ().
| )


" I probe tokenizers and only print inputs and outputs when
  the tokenizer actually does something interesting.
  Beware: I don't print input till the output is emitted!
"

traits lexer stages tokenProbe _Define: ( |
  _ parent* = traits clonable.

  ^  printString = ('tokenProbe on ', stage printString).

  _  buildToken = (| r |
        storedTokens do: [|:t| t print. ' ' print.].
	' -> ' print.
	r: resend.buildToken.
	r printLine.
	r).
| )

lexer stages tokenProbe _Define: ( |
  _ parent* = traits lexer stages tokenProbe.
  ^  stage** <- lexer stages filter.
| )


" I create newline tokens"

traits lexer stages newline _Define: ( |
  _ parent* = traits lexer stages tokenizer.

  _ tokenProto = ( tokens newline).
  ^ process: t = (t = '\n' ifTrue: [>> t.  putToken] False: [put: t]).
  _ init = ().
| )

(lexer stages newline 
) _Define: lexer stages tokenizer copy _AddSlots: ( |
  _ parent* = traits lexer stages newline.
| )
		



" I tokenize quoted thingies "

traits lexer stages quotedToken _Define: ( |
  _ parent** = traits lexer stages tokenizer.

  ^ isOKToStartCommentOrString = false.

  _ ifEscape: c StateIs: sb = (self). "no escape!"

  ^ stageName	     = 'quotedToken'.
  _ tokenProto       = ( tokens stringLit).

  _ init = ( |
     ^ isOKToStartCommentOrString = (output isOKToStartCommentOrString).
     ^ process: c = (
	    (c = leftQuote) && [output isOKToStartCommentOrString]
	      ifFalse:  [put: c]   True:  [
		>> c.
		value: ''.
		state: quote]).
    | ).
  _ quote = ( |
      ^ eof = (eofWarn).
      ^ process: c = (
            >> c.
 	    c = rightQuote  ifTrue: [^putToken].
            ifEscape: c  StateIs: [|:s| ^ state: s].
	    value: value, c source.
	    self).
    | ).

    "I don't care about values--but my children might."
  _ value: x = (self).
  _ value    = ''.
| )

(lexer stages quotedToken _Define: 
    lexer stages tokenizer copy 
 _AddSlots: ( |
  _ parent**         = traits lexer stages quotedToken.
  _ state*          <- traits lexer stages quotedToken init.
  _ leftQuote        = '"'.
  _ rightQuote       = '"'.
| ) )
      		

" I tokenize quoted thingies with backslash-oidal escapes "

traits lexer stages quotedTokenWithEscapes _Define: ( |
  _ parent** = traits lexer stages quotedToken.

 _  buildToken = (resend.buildToken value: value asString).

  _ ifEscape: c StateIs: sb = (
        c = '\\'  ifTrue: [sb value: backSl] False: [self]).

  _ backSl = ( |
      ^ eof = (eofWarn).
      ^ process: c = ( 
	    >> c.  
	    digitCount: 0.
	    nval:       0.
	    ifOctalEscape:   c  Then: [^ state: octal   ].
	    ifDecimalEscape: c  Then: [^ state: decimal ].
	    ifHexEscape:     c  Then: [^ state: hex     ].
	    value: value, (escapes at: c source IfAbsent: [c source]).
            state: quote).
    | ).

  _ ifTooManyDigits: tooManyBlock = ( 
	digitCount = digitLimit ifTrue: [tooManyBlock value].
        digitCount: digitCount succ.
	self).

  _ finishNumericEscape: c = (
        value: value, (nval && 255) asCharacter.
	state: quote.
	reprocess: c).

  _ hex = ( |
        ^ eof = (eofWarn).
          digitLimit = 2.
	^ process: c = (
              ifTooManyDigits: [^ finishNumericEscape: c].
	      c ifHexDigit: [|:n| nval: (nval * 16) + n.  ^ >> c] Else: [].
              finishNumericEscape: c).
    | ).
  _ decimal = ( |
        ^ eof = (eofWarn).
          digitLimit = 3.
	^ process: c = (
              ifTooManyDigits: [^ finishNumericEscape: c].
	      c ifDecimalDigit: [|:n| nval: (nval * 10) + n.  ^ >> c] Else: [].
              finishNumericEscape: c).
    | ).
  _ octal = ( |
        ^ eof = (eofWarn).
          digitLimit = 3.
	^ process: c = (
              ifTooManyDigits: [^ finishNumericEscape: c].
	      c ifOctalDigit: [|:n| nval: (nval * 8) + n.  ^ >> c] Else: [].
              finishNumericEscape: c).
    | ).
	
  _ ifOctalEscape:   c  Then: tb  = (self).
  _ ifDecimalEscape: c  Then: tb  = (self).
  _ ifHexEscape:     c  Then: tb  = (self).

  _ escapes = dictionary copyRemoveAll. "need one if these in each refinement"

    "string of pairs, separated by blanks. First is char after backsl, 2nd is
     value of escape sequence"

  _ tokenProto       = ( tokens stringLit).

  _ escapeString = '\\\\ ""'. 

    initialize = (
        | i <- 0. |
	[ | k. v |
	    k: escapeString at: i.
	    v: escapeString at: i + 1.
	    assert: [k != ' '].
	    assert: [v != ' '].
	    escapes at: i Put: v.
	    (i + 2) = escapeString size ifTrue: [^self].
	    assert: [(escapeString at: i + 2) = ' '].
	    i: i + 3.
	] loop).
| ) initialize

(lexer stages quotedTokenWithEscapes _Define: 
    lexer stages quotedToken copy 
 _AddSlots: ( |
  _ parent**         = traits lexer stages quotedTokenWithEscapes.
  _ state*          <- traits lexer stages quotedTokenWithEscapes init.
  _ leftQuote        = '"'.
  _ rightQuote       = '"'.
  ^ stageName	     = 'quotedTokenWithEscapes'.
  _ value 	     <- ''.
  _ nval	     <- 0.
  _ digitCount       <- 0.
| ) )
      		

" collect white space "

traits lexer stages whiteSpace _Define: ( |
  _ parent** = traits lexer stages tokenizer.

    buildToken = (tokenProto copy priorWhiteSpace: storedTokensString).

  _ tokenProto = ( tokens whiteSpace).

  _ whites = ' \t'.

  ^ process: c = (
         (whites includes: c) ifTrue: [  processWhite: c] 
                               False: [  processBlack: c]).
  _ processWhite: c = ( 
        >> c.
	state: white).

  _ init = ( |
       _ processBlack: c = ( put: c).
    | ).
  _ white = ( |
      ^ eof = (eofToken).
      _ processBlack: c = (putToken.  reprocess: c).
    | ).

  ^ stageName	     = 'whiteSpace'.
| )

(lexer stages whiteSpace _Define: 
    lexer stages tokenizer copy 
 _AddSlots: ( |
  _ parent** =  traits lexer stages whiteSpace.
  _ state*   <- traits lexer stages whiteSpace init.
| ) )


" identifiers and keywords "

traits lexer stages identifier _Define: ( |
  _ parent** = traits lexer stages tokenizer.

  _ tokenProto = ( tokens identifier).

  _ init = ( |
      ^ process: c = (
            (isStartOfId: c)  ifFalse: [ put: c]  True: [
	        >> c.  
	        state: letterOrDig]).
    | ).
    letterOrDig = ( |
      ^ isOKToStartNumberOrIdentifier = false.
      ^ eof = (eofToken).
      ^ process: c = (
            (isInId: c) ifTrue:  [ >> c]  
		         False:  [putToken.  reprocess: c]).
    | ).

    "next 2 methods are samples:"
  _ isStartOfId: c = (c isLetter).
  _ isInId:      c = ((isStartOfId: c) || [c isDigit]).

  ^ stageName	     = 'identifier'.
| )

(lexer stages identifier _Define: 
    lexer stages tokenizer copy
 _AddSlots: ( |
  _ parent** =  traits lexer stages identifier.
  _ state*   <- traits lexer stages identifier init.
| ) )



" I recognize all the operators & punctuation, upto 3 char long.
  singles, doubles, and triples are straight from the C++ book.
  My intialization computes the tables I really need
"

traits lexer stages operator _Define: ( |
  _ parent** = traits lexer stages tokenizer.

  _ tokenProto = ( tokens operator).

    " The following must be overriden in refinements: "

  _ singles = '! % ^ & * ( ) - + = { } | ~ [ ] \\ ; : " < > ? , . / #'.
  _ doubles = '-> ++ -- .* << >> <= >= == != && || *= /= %= += -= &= ^= |= :: ##'.
  _ triples = '->* <<= >>='.

  " tables I need: "

  _ tablesProto = ( | "need new tables slot in each refinement"
      _ parent* = traits clonable.
	
    "_" singleSet <- set copyRemoveAll.
    "_" doubleSet <- set copyRemoveAll.
    "_" tripleSet <- set copyRemoveAll.

    "_" maybe2Or3 <- set copyRemoveAll. "first char of 2s and 3s"
    "_" maybe3    <- set copyRemoveAll. "first 2 chars of 3s"

      ^ copy = (((((
	  resend.copy
            singleSet: singleSet copyRemoveAll)
            doubleSet: doubleSet copyRemoveAll)	
            tripleSet: tripleSet copyRemoveAll)

            maybe2Or3: maybe2Or3 copyRemoveAll)
            maybe3:    maybe3    copyRemoveAll).
    | ).

    "The following can just be inherited: "

    "general iterator: iterate over a string of ops, separated by blank"
  _ do: b String: s By: len = (| i <- 0 |
	[(i + len)  <=  s size] whileTrue: [| op <- '' |
	    len do: [|:j| op: op, (s at: i + j)].
	    b value: op asString.
	    i: i + len succ.
        ].
	self).

  " specific iterators "

  _ doSingles: b = (do: b String: singles By: 1).
  _ doDoubles: b = (do: b String: doubles By: 2).
  _ doTriples: b = (do: b String: triples By: 3).

  
  _ initialize = (
	tables: tablesProto copy.
	doSingles: [|:op| singleSet add: op].
	doDoubles: [|:op| doubleSet add: op.  maybe2Or3 add: op first.].
	doTriples: [|:op| tripleSet add: op.  maybe2Or3 add: op first.
		          		      maybe3    add: op copyWithoutLast].
    ).

  ^ stageName	     = 'operator'.

  _ init = ( |
      ^ process: c = ( | src |
            >> c.
	    src: storedTokensString.
	    (maybe2Or3 includes: src) ifTrue: [  ^ state: one ].
	    (singleSet includes: src) ifTrue: [  ^ putToken ].
	    removeLast.
            put: c).
    | ).
  _ one = ( |
      ^ eof = (eofToken).

      ^ process: c = ( | src <- '' |
	    >> c.
	    src: storedTokensString.

	    (maybe3    includes: src) ifTrue: [ ^ state: two ].
	    (doubleSet includes: src) ifTrue: [ ^ putToken ].

	    removeLast.
            (singleSet includes: storedTokensString)
		ifTrue: [putToken] False: [flush].
	    reprocess: c).
    | ).
  _ two = ( |
      ^ eof = (eofToken).

      ^ process: c = ( | src <- ''. b |
	    >> c.
	    src: storedTokensString.

 	    (tripleSet includes: src) ifTrue: [ ^ putToken ].
	    removeLast.
	    (doubleSet includes: storedTokensString)  ifTrue: [
	        putToken.
	      ^ reprocess: c.
            ].
	    b: removeLast.
	    (singleSet includes: storedTokensString) ifTrue: [
		putToken.
	        reprocess: b.
	      ^ reprocess: c.
            ].
	    flush).
    | ).
| )

( lexer stages operator _Define: 
    lexer stages tokenizer copy 
 _AddSlots: ( |
  _ parent**  =  traits lexer stages operator.
  _ state*    <- traits lexer stages operator init.
  _ tables*** <- ()
| ) ) initialize
