"$Revision: 8.3 $"

"I hold the grammar-specific lexing stages"
"I an incomplete "

traits     grammarLexer _AddSlotsIfAbsent: ( | stages = () | )
prototypes grammarLexer _AddSlotsIfAbsent: ( | stages = () | )

traits grammarLexer stages _AddSlotsIfAbsent: ( |
   filterMixin           = ().
   main                  = ().
    commentDelimiter     = ().
    selfComment      	 = ().
    grammarComment     	 = ().
    stringLit  	         = ().
    identifier 	 	 = ().
    operator   		 = ().
    keyword		 = ().
    whiteSpace		 = ().
    termOrNonterm	 = ().
    charSet   		 = ().
    selfObject		 = ().
| )

prototypes grammarLexer stages _AddSlotsIfAbsent: ( |
   main                  = ().
    commentDelimiter     = ().
    selfComment      	 = ().
    grammarComment     	 = ().
    stringLit		 = ().
    identifier 	 	 = ().
    operator   		 = ().
    keyword		 = ().
    whiteSpace		 = ().
    terminal		 = ().
    nonterminal		 = ().
    charSet   		 = ().
    selfObject		 = ().
| )

traits grammarLexer stages _AddSlots: ( |
    names* = traits lexer stages.
| )

prototypes grammarLexer stages _AddSlots: ( |
    names* = grammarLexer.
    moreNames** = lexer stages.
| )

traits grammarLexer stages filterMixin _Define: ( |
     names* = grammarLexer stages.
| )

" the main guy, installed right after source"

traits grammarLexer stages main _Define: ( |
  _ parent**        = traits lexer stages main.
  _ mixin*          = traits grammarLexer stages filterMixin.

  " here is how to run grammarLexer: grammarLexer stages main copy readFileNamed:..."

  " build the pipeline, readers and writer added later "

    " reads a file, returns a list (should be cleaner)"

  ^ tokenStages = (
      resend.tokenStages, 
      (
           commentDelimiter
        &  grammarComment
        &  selfComment    "asks next stage before collecting comment"
        &  stringLit
        &  charSet

        &  whiteSpace 

	&  identifier
	&  keyword
        &  operator

	&  whiteFilter

	&  selfObject
        &  terminal
	&  nonterminal
	&  charCatcher
     ) asVector).


  ^ stageName	     = 'self main'.

| )

(grammarLexer stages main _Define: 
  grammarLexer stages filter copy 
  _AddSlots: ( |
  _ parent* = traits grammarLexer stages main.
| ) )



traits grammarLexer stages grammarComment _Define: ( |
  _ parent** = traits lexer stages tokenizer.
  _ mixin*  = traits grammarLexer stages filterMixin.

  ^ putToken         = (reset).
  ^ stageName	     = 'grammar Self comment'.
  ^ reset	     = (resend.reset depth: 0).

  ^ eofWarn = (
        warning: 'unterminated comment in grammar starting at line ',
		  startingLine printString).
  _ init = ( |
        process: t = (
	    t isOperatorToken ifFalse: [^ put: t].
	    t = '(*' ifFalse: [
	      ^ warning: 'unexpected comment delimiter: ', 
		          t printString.
	    ].
	    depth: 0.
	    startingLine: inputLineNumber.
	    >> t.
	    state: inComment).
    | ).
  _ inComment = ( |
        eof = (eofWarn).
	process: t = (
	    >> t.
	    t = '*)' ifTrue: [
	        depth = 0 ifTrue: [^ putToken] False: [depth: depth - 1].
	    ].
	    self).
    | ).
| )

(grammarLexer stages grammarComment _Define: 
    grammarLexer stages tokenizer copy 
 _AddSlots: ( |
  _ parent**         =  traits grammarLexer stages grammarComment.
  _ state*           <- traits grammarLexer stages grammarComment init.
  _ depth	     <- 0.
  _ startingLine     <- 0.
| ) )
      		
traits grammarLexer stages selfComment _Define: ( |
  _ parent** = traits lexer stages quotedToken.
  _ mixin*  = traits grammarLexer stages filterMixin.


  ^ stageName	     = 'grammar Self comment'.
  _ tokenProto       = ( tokens selfComment ).
| )

(grammarLexer stages selfComment _Define: 
    lexer stages quotedToken copy 
 _AddSlots: ( |
  _ parent**         =  traits grammarLexer stages selfComment.
  _ state*           <- traits grammarLexer stages selfComment init.
  _ leftQuote        = '"'.
  _ righttQuote      = '"'.
| ) )
      		
" I tokenizer char consts or string consts "

traits grammarLexer stages stringLit _Define: ( |
  _ parent** = traits lexer stages quotedTokenWithEscapes.
  _ mixin*  = traits grammarLexer stages filterMixin.

  _ escapes = dictionary copyRemoveAll.
  _ escapeString = 'n\n t\t v\v b\b r\r f\f a\a \\\\ ?? \'\' "" 0\0'.

  _ ifOctalEscape:    c Then: tb = ( c = 'o'  ifTrue: tb  False: [self] ).
  _ ifDecimalEscape:  c Then: tb = ( c = 'd'  ifTrue: tb  False: [self] ).
  _ ifHexEscape:      c Then: tb = ( c = 'x'  ifTrue: tb  False: [self] ).

  _ tokenProto       = ( tokens stringLit ).
  ^ stageName	     = 'grammar stringLit'.

| ) initialize

(grammarLexer stages stringLit _Define: 
    lexer stages quotedTokenWithEscapes copy 
 _AddSlots: ( |
  _ parent**         =  traits grammarLexer stages stringLit.
  _ state*           <- traits grammarLexer stages stringLit init.
  _ leftQuote        = '\''.
  _ rightQuote	     = '\''.
| ) )


traits grammarLexer stages charSet _Define: ( |
  _ parent** = traits lexer stages quotedTokenWithEscapes.
  _ mixin*  = traits grammarLexer stages filterMixin.

  _ escapes = dictionary copyRemoveAll.
  _ escapeString = 'n\n t\t v\v b\b r\r f\f a\a \\\\ ?? \'\' "" 0\0 ]]'.

  _ ifOctalEscape:    c Then: tb = ( c = 'o'  ifTrue: tb  False: [self] ).
  _ ifDecimalEscape:  c Then: tb = ( c = 'd'  ifTrue: tb  False: [self] ).
  _ ifHexEscape:      c Then: tb = ( c = 'x'  ifTrue: tb  False: [self] ).

  _ tokenProto       = ( tokens charSet ).
  ^ stageName	     = 'grammar charSet'.

| ) initialize

(grammarLexer stages charSet _Define: 
    lexer stages quotedTokenWithEscapes copy 
 _AddSlots: ( |
  _ parent**         =  traits grammarLexer stages charSet.
  _ state*           <- traits grammarLexer stages charSet init.
  _ leftQuote        = '['.
  _ rightQuote	     = ']'.
| ) )

" collect white space "

traits grammarLexer stages whiteSpace _Define: ( |
  _ parent** = traits lexer stages whiteSpace.
  _ mixin*  = traits grammarLexer stages filterMixin.

  ^ stageName	     = 'C whiteSpace'.

  _ whites = ' \t\n\r\v\b\f'. "includes NEWLINE!!"
| )

(grammarLexer stages whiteSpace _Define: 
    lexer stages whiteSpace copy 
 _AddSlots: ( |
  _ parent** =  traits grammarLexer stages whiteSpace.
  _ state*   <- traits grammarLexer stages whiteSpace init.
| ) )

" identifiers "

traits grammarLexer stages identifier _Define: ( |
  _ parent** = traits lexer stages identifier.
  _ mixin*   = traits grammarLexer stages filterMixin.

  ^ stageName	     = 'grammar identifier'.

  _ isStartOfId: c = (c isLetter).
  _ isInId:      c = (c isLetter || [c isDigit]).
| )

(grammarLexer stages identifier _Define: 
    lexer stages identifier copy
 _AddSlots: ( |
  _ parent** =  traits grammarLexer stages identifier.
  _ state*   <- traits grammarLexer stages identifier init.
| ) )


" I recognize all the operators & punctuation, upto 3 char long.
  singles, doubles, and triples are straight from the C++ book.
  My intialization computes the tables I really need
"

traits grammarLexer stages operator _Define: ( |
  _ parent** = traits lexer stages operator.
  _ mixin*  = traits grammarLexer stages filterMixin.

  _ singles = '( ) | ; * ='.
  _ doubles = '->'.
  _ triples = '::= ::* ::+ ::? ::|'.

  ^ stageName	     = 'grammar operator'.
| )



( grammarLexer stages operator _Define: 
    lexer stages operator copy 
 _AddSlots: ( |
  _ parent** =  traits grammarLexer stages operator.
  _ state*   <- traits grammarLexer stages operator init.
| ) ) initialize    


" I recognize grammarComment delimiters "

traits grammarLexer stages commentDelimiter _Define: ( |
  _ parent** = traits lexer stages operator.
  _ mixin*  = traits grammarLexer stages filterMixin.

  _ singles = ''.
  _ doubles = '(* *)'.
  _ triples = ''.

  ^ stageName	     = 'grammar commentDelimiter'.
| )


( grammarLexer stages commentDelimiter _Define: 
    lexer stages operator copy 
 _AddSlots: ( |
  _ parent** =  traits grammarLexer stages commentDelimiter.
  _ state*   <- traits grammarLexer stages commentDelimiter init.
| ) ) initialize    


traits grammarLexer stages keyword _Define: ( |
  _ parent** = traits grammarLexer stages tokenizer.
  _ mixin*   = traits grammarLexer stages filterMixin.

  _ init = ( |
        process: t = (
	    t isIdentifier ifFalse: [^ put: t].
	    >> t.
	    state: foundID).
    | ).
  _ foundID = ( |
        eof = (eofFlush).
	process: t = (
	    t =':' ifFalse: [ flush.  ^ put: t].
	    >> t.
	    putToken).
    | ).
  ^ stageName	     = 'grammar keyword'.
    tokenProto = (tokens keyword).
| )

(grammarLexer stages keyword _Define: 
    grammarLexer stages tokenizer copy 
 _AddSlots: ( |
  _ parent** =  traits grammarLexer stages keyword.
  _ state*   <- traits grammarLexer stages keyword init.
| ) )

traits grammarLexer stages termOrNonterm _Define: ( |
  _ parent** = traits grammarLexer stages tokenizer.
  _ mixin*   = traits grammarLexer stages filterMixin.

  _ buildToken = ((resend.buildToken kind: kind) tag: tag).

  _ init = ( |
        process: t = (
	    t = left ifFalse: [^ put: t].
	    >> t.
	    tag: ''.
	    state: foundLeft).
    | ).
  _ foundLeft = ( |
        eof = (eofWarn).
	process: t = (
	    t isKeyword ifTrue: [
	        >> t.
		tag: t source copyWithoutLast.
	      ^ state: foundTag
            ].
	    t isIdentifier ifTrue: [
	        >> t.
		tag:  t source.
		kind: t source.
	      ^ state: foundKind.
            ].
	    warning: 'missing kind in ', stageName.
	    reset).
    | ).
  _ foundTag = ( |
        eof = (eofWarn).
        process: t = (
	    t isIdentifier ifFalse: [
	        warning: 'missing kind in ', stageName.
		reset.
	    ] True: [ 
	        >> t.  
		kind: t source.  
		state: foundKind.
	    ]).
    | ).
  _ foundKind = ( |
        eof = (eofWarn).
        process: t = (
	    t = right ifTrue: [ >> t.  ^ putToken ].
	    warning: 'missing ', right, ' or : in ', stageName.
	    reset).
    | ).
| )

(grammarLexer stages terminal _Define: 
    grammarLexer stages tokenizer copy 
 _AddSlots: ( |
  _ parent** =  traits grammarLexer stages termOrNonterm.
  _ state*   <- traits grammarLexer stages termOrNonterm init.
  ^ stageName	     = 'grammar terminal'.
    tokenProto = (tokens terminal).
  _ left  = '{'.
  _ right = '}'.
  _ kind <- ''.
  _ tag <- ''.
| ) )

(grammarLexer stages nonterminal _Define: 
    grammarLexer stages tokenizer copy 
 _AddSlots: ( |
  _ parent** =  traits grammarLexer stages termOrNonterm.
  _ state*   <- traits grammarLexer stages termOrNonterm init.
  ^ stageName	     = 'grammar nonterminal'.
    tokenProto = (tokens nonterminal).
  _ left  = '<'.
  _ right = '>'.
  _ kind <- ''.
  _ tag <- ''.
| ) )


traits grammarLexer stages selfObject _Define: ( |
  _ parent** = traits grammarLexer stages tokenizer.
  _ mixin*   = traits grammarLexer stages filterMixin.

  _ init = ( |
        process: t = (
	    t = '(' ifFalse: [^ put: t].
	    >> t.
	    depth: 0.
	    state: paren).
    | ).
  _ paren = ( |
        eof = (eofFlush).
	process: t = (
	    t = '|' ifFalse: [ flush.  ^ put: t].
	    >> t.
	    state: bar).
    | ).
  _ bar = ( |	    
        eof = (eofWarn).
	process: t = (
	    >> t.
	    t = '(' ifTrue: [depth: depth + 1].
	    t = ')' ifTrue: [
	        depth = 0  ifTrue: [putToken] False: [depth: depth - 1].
	    ]).
    | ).
    tokenProto = (tokens selfObject).
  ^ stageName	     = 'grammar self object'.
| )

(grammarLexer stages selfObject _Define: 
    grammarLexer stages tokenizer copy 
 _AddSlots: ( |
  _ parent** =  traits grammarLexer stages selfObject.
  _ state*   <- traits grammarLexer stages selfObject init.
    depth <- 0.
| ) )
















