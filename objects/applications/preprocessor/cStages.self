"$Revision: 8.1 $"

"I hold the C-specific lexing stages"

traits     cLexer _AddSlotsIfAbsent: ( | stages = () | )
prototypes cLexer _AddSlotsIfAbsent: ( | stages = () | )

traits cLexer stages _AddSlotsIfAbsent: ( |
   filterMixin           = ().
   main                  = ().
   trigraphExpander      = ().
   escapedNewlineDeleter = ().
    comment      	 = ().
    charOrString  	 = ().
    whiteSpace	 	 = ().
    identifier 	 	 = ().
    operator   		 = ().
    integer    		 = ().
    float      		 = ().
| )

prototypes cLexer stages _AddSlotsIfAbsent: ( |
         main                  = ().
         trigraphExpander      = ().
         escapedNewlineDeleter = ().
    comment        = ().
    charConst      = ().
    stringLit      = ().
    angledFileName = ().
    whiteSpace	   = ().
    identifier     = ().
    operator       = ().
    integer        = ().
    float          = ().
| )

traits cLexer stages _AddSlots: ( |
    names* = traits lexer stages.
| )

prototypes cLexer stages _AddSlots: ( |
    names* = cLexer.
    moreNames** = lexer stages.
| )

traits cLexer stages filterMixin _Define: ( |
     names* = cLexer stages.
| )

" the main guy, installed right after source"

traits cLexer stages main _Define: ( |
  _ parent**        = traits lexer stages main.
  _ mixin*          = traits cLexer stages filterMixin.

  " here is how to run cLexer: cLexer stages main copy readFileNamed:..."

  " build the pipeline, readers and writer added later "

  _ prelexerStages = ((
       trigraphExpander & escapedNewlineDeleter) asVector).

  ^ tokenStages = (
       resend.tokenStages, 
       (
           comment "asks next 2 stages before collecting comment"
        &  charConst "asks next stage"
        &  stringLit
 
        &  integer "asks next 2 stages before collecting an int"
        &  float "asks next stage"
        &  identifier

       " these don't move:"

        &  whiteSpace 
        &  newline
        &  operator
        &  charCatcher
	&  whiteFilter
     ) asVector).


  ^ stageName	     = 'c main'.
| )

(cLexer stages main _Define: 
  cLexer stages filter copy 
  _AddSlots: ( |
  _ parent* = traits cLexer stages main.
| ) )


traits cLexer stages trigraphExpander _Define: ( |
  _ parent** = traits cLexer stages filter.
    mixin*   = traits cLexer stages filterMixin.

  _ noQ = ( |
      ^ process: c = ( state:  c = '?'  ifTrue: [oneQ] False: [put: c.  noQ]).
    | ).
  _ oneQ = ( |
      ^ eof  = (putc: '?'.  state: noQ.  eof).
      ^ process: c = (
           state:  c = '?'  ifTrue: [twoQ] False: [putc: '?'.  put: c.  noQ]).
    | ).
  _ twoQ = ( |
      ^ eof =  (putc: '?'.  state: oneQ.  eof).
      ^ process: c = (
            (trigraphs includesKey: c) ifTrue: [
                putc: trigraphs at: c.
                state: noQ.
            ] False: [
                putc: '?'.  " dump first '?'"
                state: oneQ.        " c might be a '?'"
                reprocess: c.
            ]).
    | ).
                 
  _ trigraphs = ((((((((( dictionary copyRemoveAll 
                   at: '='  Put: '#' )
                   at: '/'  Put: '\\')
                   at: '\'' Put: '^' )
                   at: '('  Put: '[' )
                   at: ')'  Put: ']' )
                   at: '!'  Put: '|' )
                   at: '<'  Put: '{' )
                   at: '>'  Put: '}' )
                   at: '-'  Put: '~' ).

  ^ stageName	     = 'trigraphExpander'.
| )

( cLexer stages trigraphExpander _Define: 
  cLexer stages filter copy 
  _AddSlots: ( |
  _ parent** =  traits cLexer stages trigraphExpander.
  _ state*   <- traits cLexer stages trigraphExpander noQ.
| ) )

traits cLexer stages escapedNewlineDeleter _Define: ( |
  _ parent** = traits cLexer stages filter.
    mixin*   = traits cLexer stages filterMixin.

    " I am the last stage skipped when reinjecting chars to retokenize
      for the ## operator.
      The deletedNLs mimics the gnu way to keep line counts in sync "

  _ noB = ( |
    ^ process: c = (
	  c = '\n'  ifTrue: [
	      deletedNls do: [put: c].  
	      deletedNls: 0.
          ].
          state:  c = '\\'  ifTrue: [b] False: [put: c.  noB]).
    | ).
  _ b = ( |
    ^ eof = (putc: '\\'.   state: noB.  eof).
    ^ process: c = (
          c = '\n' ifTrue: [
	      deletedNls: deletedNls succ.  
	      state: noB.
	  ] False: [
              putc: '\\'.  
	      state: noB.
	      reprocess: c]).
    | ).

  ^ stageName	     = 'escapedNewlineDeleter'.
| )

( cLexer stages escapedNewlineDeleter  _Define: 
      cLexer stages filter copy 
  _AddSlots: ( |
  _ parent** =  traits cLexer stages escapedNewlineDeleter.
  _ state*   <- traits cLexer stages escapedNewlineDeleter noB.
  _ deletedNls <- 0.
| ) )

" I handle both kinds of comments "

traits cLexer stages comment _Define: ( |
  _ parent** = traits cLexer stages tokenizer.
  _ mixin*  = traits cLexer stages filterMixin.

  _ init = ( |
      ^ process: c = (
	    (c = '/')  && [output isOKToStartCommentOrString]  
	      ifFalse:  [put: c]  True:  [
                >> c.
		state:  slash]).
    | ).
  _ slash = ( |
      ^ eof = (eofFlush).
      ^ process: c = (
	    c = '*' ifTrue: [>> c.  nlCount: 0.  state: slashStar ]  False: [
            c = '/' ifTrue: [>> c.               state: slashSlash]  False: [
	                     flush.  reprocess: c]]).
    | ).
  _ slashStar = ( |
      ^ eof = (eofWarn).
      ^ process: c = ( 
          >> c.  
	  c = '*'   ifTrue: [^ state: star2].  
	  c = '\n'  ifTrue: [nlCount: nlCount succ].
	  self).
    | ).
  _ slashSlash = ( |
      ^ eof = (eofToken).
      _ tokenProto = ( tokens comment ).
      ^ process: c = (c = '\n'  ifFalse: [>> c] True: [putToken.  put: c]).
    | ).
  _ star2 = ( |
      ^ eof = (eofWarn).
      _ tokenProto = ( tokens comment).

      ^ process: c = ( 
	    c = '/'  ifFalse: [ state: slashStar.  reprocess: c] 
                        True: [ 
	        >> c.  
	        putToken. 
	        nlCount do: [put: tokens newline].
	        self  ]).
    | ).

  ^ stageName	     = 'comment'.
| )

(cLexer stages comment _Define: 
  cLexer stages tokenizer copy 
 _AddSlots: ( |
  _ parent** =  traits cLexer stages comment.
  _ state*   <- traits cLexer stages comment init.
    nlCount  <- 0.
| ) )

      		
(cLexer stages angledFileName _Define: 
    lexer stages quotedToken copy 
 _AddSlots: ( |
  _ leftQuote        = '<'.
  _ rightQuote       = '>'.
  _ tokenProto       = ( tokens angledFileName).
  ^ stageName	     = 'angledFileName'.
| ) )
      		

" I tokenizer char consts or string consts "

traits cLexer stages charOrString _Define: ( |
  _ parent** = traits lexer stages quotedTokenWithEscapes.
  _ mixin*  = traits cLexer stages filterMixin.

  _ escapes = dictionary copyRemoveAll.
  _ escapeString = 'n\n t\t v\v b\b r\r f\f a\a \\\\ ?? \'\' ""'.

  _ ifOctalEscape: c  Then: tb = (
        c ifOctalDigit: [|:n| nval: n.  digitCount: 1.  tb value] 
                  Else: [self]).

  _ ifHexEscape:   c Then: tb = ( c = 'x'  ifTrue: tb  False: [self] ).

| ) initialize

(cLexer stages charConst _Define: 
    lexer stages quotedTokenWithEscapes copy 
 _AddSlots: ( |
  _ parent**         =  traits cLexer stages charOrString.
  _ state*           <- traits cLexer stages charOrString init.
  _ leftQuote        = '\''.
  _ rightQuote	     = '\''.
  _ tokenProto       = ( tokens charConst).
  ^ stageName	     = 'charConst'.
| ) )
      		
(cLexer stages stringLit _Define: 
    cLexer stages charConst copy 
  _AddSlots: ( |
  _ leftQuote        = '"'.
  _ rightQuote       = '"'.
  _ tokenProto       = ( tokens stringLit).
  ^ stageName	     = 'stringLit'.
| ) )

" collect white space "

traits cLexer stages whiteSpace _Define: ( |
  _ parent** = traits lexer stages whiteSpace.
  _ mixin*  = traits cLexer stages filterMixin.

  ^ stageName	     = 'C whiteSpace'.

  _ whites = ' \t\v\f'.
| )

(cLexer stages whiteSpace _Define: 
    lexer stages whiteSpace copy 
 _AddSlots: ( |
  _ parent** =  traits cLexer stages whiteSpace.
  _ state*   <- traits cLexer stages whiteSpace init.
| ) )

" octal, decimal, hex ints. Unlike most other tokenizers, I keep a result
  token as I build it up, so I can store the suffix info there, too.
  Maybe they all should work that way?
  I deal with ambiguity: a string of digits may be a float if it ends with
  a period or an E.
 "

traits cLexer stages integer _Define: ( |
  _ parent** = traits cLexer stages tokenizer.
  _ mixin*  = traits cLexer stages filterMixin.

  _ buildToken = (result fixupValue source: storedTokensString).

  ^ copy = ( resend.copy digits: digits copy ).

  _ init = ( |
      ^ process: c = (
            c isDigit && [output isOKToStartNumberOrIdentifier]  
	        ifFalse: [ ^put: c ].

	    result: tokens integer copy.
	    c = '0'    ifTrue:  [ 
	        >> c.
		state: leadingZero.
            ] False: [ 
                digits removeAll.
	        state: digit.
                reprocess: c]).
    | ).
  _ leadingZero = ( |
      ^ eof = (eofToken).

      ^ process: c = (
	    c uncapitalize = 'x' ifTrue: [ 
	        >> c.  
		result beHex.
	      ^ state: hexDigit].
       
	    c isDigit ifFalse: [ putToken. ^ put: c].

	    result beOctal.
            digits removeAll.
	    state: digit.
	    c ifOctalDigit: [
	        reprocess: c
	    ] Else: [
	        warning: 'bad digit "', c source, '" in octal number'.
		>> c.
            ]).
    | ).
  _ digit = ( |
      ^ eof = (eofToken).

      ^ process: c = (
            c isDigit ifTrue: [>> c.  digits addLast: c. ^ self ].
            "is float ?"
            (c = '.') || [c uncapitalize = 'e'] ifTrue: [ flush. ^ put: c ].
            digits do: [|:c|
                result append: c IfDigit: []
	                            Else: [warning: '8 or 9 in octal number'].
            ].
            state: noSuffix.  
            reprocess: c).
    | ).
  _ hexDigit = ( |
      ^ eof = (eofToken).

      ^ process: c = (
            result append: c IfDigit: [ >> c ] 
	                        Else: [ state: noSuffix.  reprocess: c]).
    | ).
  _ noSuffix = ( |
      ^ eof = (eofToken).

      ^ process: c = (
            c uncapitalize = 'l' ifTrue: [ >> c. result beLong. ^state: long].
            c uncapitalize = 'u' ifTrue: [ >> c. result beUnsigned.  ^state: uns ].
	    putToken.
	    put: c).
    | ).
   _ long = ( |
      ^ eof = (eofToken).
      ^ process: c = (
            c uncapitalize = 'u'  ifTrue: [ >> c.  result beUnsigned.  putToken]
			           False: [ putToken.   put: c ]).
    | ).
   _ uns = ( |
      ^ eof = (eofToken).
      ^ process: c = (
            c uncapitalize = 'l'  ifTrue: [ >> c.  result beLong.  putToken]
			           False: [ putToken.   put: c ]).
    | ).

  ^ stageName	     = 'integer'.
| )

(cLexer stages integer _Define: 
    cLexer stages tokenizer copy 
 _AddSlots: ( |
  _ parent** =  traits cLexer stages integer.
  _ state*     <- traits cLexer stages integer init.
  _ result     <- cLexer tokens integer.
  _ digits     <- list copy removeAll.
| ) )

" I work like integer above, but do floats "

traits cLexer stages float _Define: ( |
  _ parent** = traits cLexer stages tokenizer.
  _ mixin*  = traits cLexer stages filterMixin.

  _ buildToken = (result source: storedTokensString).

  ^  isOKToStartNumberOrIdentifier = false.

  _ init = ( |
      ^  isOKToStartNumberOrIdentifier = (
	     output isOKToStartNumberOrIdentifier).

      ^ process: c = (
	    (c = '.') && [output isOKToStartNumberOrIdentifier]  ifTrue: [
	        result: tokens float copy value: 0.0.
	        >> c.
	      ^ state: nakedPoint.
            ].
            c isDigit && [output isOKToStartNumberOrIdentifier] 
	        ifFalse: [^put: c].
	    result: tokens float copy value: 0.0.
	    state: intPartDigit.
	    reprocess: c).
    | ).
  _ intPartDigit = ( |
      ^ eof = (eofFlush).
      ^ process: t = (
          t isDigit ifTrue: [
              >> t.
	      result value: (10 * result value) + (t asByte - '0' asByte).
	    ^ self.
          ].
          state: intPart.
	  reprocess: t).
    | ).
  _ intPart = ( |
      ^ eof = (eofFlush).

      ^ process: c = (
            >> c.
            c              = '.'  ifTrue: [ ^ state: decimalPoint].
	    c uncapitalize = 'e'  ifTrue: [ ^ state: e].
            flush).
    | ).
  _ nakedPoint = ( |
      ^ eof = (eofFlush).

      ^ process: c = (
            c isDigit  ifFalse: [ flush.  ^ reprocess: c].
	    state: decimalPoint.
            reprocess: c).
    | ).
  _ decimalPoint = ( |
      ^ eof = (eofToken).

      ^ process: c = (	| f <- 0.0 |
	    c uncapitalize = 'e'  ifTrue: [  >> c.    ^ state: e].
	    c isDigit ifFalse: [putToken.  ^ reprocess: c].
            placeValue: 0.1.
            state: fractDigit.
	    reprocess: c).
    | ).
  _ fractDigit = ( |
      ^ eof = (eofToken).
      ^ process: c = (
            c isDigit ifTrue: [
	        result value: result value 
                           + (placeValue * (c asByte - '0' asByte)).
                placeValue: placeValue /= 10.0.
		>> c.
	      ^ self.
            ].
            state: fract.
	    reprocess: c).
    | ).
  _ fract = ( |
      ^ eof = (eofToken).

      ^ process: c = (
	    c uncapitalize = 'e'  ifFalse: [state: exp.  ^ reprocess: c].
	    >> c.
	    state: e).
    | ).
   _ e = ( |
      ^ eof = (eofToken).

      ^ process: c = (
	    c = '-'   ifTrue: [signOfExp: -1.  >> c.  ^ state: eSign].
	    c = '+'   ifTrue: [signOfExp:  1.  >> c.  ^ state: eSign].
	    c isDigit ifTrue: [signOfExp:  1.  state: eSign.   reprocess: c]
                       False: [                state: exp.     reprocess: c]).
    | ).
   _ eSign = ( |
      ^ eof = (eofWarn).
      ^ process: c = (
            c isDigit ifFalse: [
		warning: 'no exponent after "e" or "E"'.
	        putToken.
	      ^ reprocess: c.
            ].
            exponent: 0.
            state: expDigit.
	    reprocess: c).
    | ).
  _ expDigit = ( |
      ^ eof = (eofToken).
      ^ process: c = (
            c isDigit ifTrue: [
                >> c.
	      ^ exponent: (10 * exponent) + (c asByte - '0' asByte).
            ].
	    result value: result value * (10 power: (signOfExp * exponent)).
            state: exp.
            reprocess: c).
    | ).
  _ exp = ( |
      ^ eof = (eofToken).

      ^ process: c = (
            c uncapitalize = 'l' ifTrue: [ >> c. result beLong.   ^ putToken].
            c uncapitalize = 'f' ifTrue: [ >> c. result beSingle. ^ putToken].
	    putToken.
	    reprocess: c).
    | ).

  ^ stageName	     = 'float'.
| )

(cLexer stages float _Define: 
    cLexer stages tokenizer copy
 _AddSlots: ( |
  _ parent** =  traits cLexer stages float.
  _ state*     <- traits cLexer stages float init.
  _ result     <- cLexer tokens float.
  _ signOfExp  <- 1.
  _ exponent   <- 0.
  _ placeValue <- 1.0.
| ) )

" identifiers and keywords "

traits cLexer stages identifier _Define: ( |
  _ parent** = traits lexer stages identifier.
  _ mixin*  = traits cLexer stages filterMixin.

  ^ stageName	     = 'C identifier'.

  _ isStartOfId: c = (c isLetter || [c = '_']).
  _ isInId:      c = ((isStartOfId: c) || [c isDigit]).
| )

(cLexer stages identifier _Define: 
    lexer stages identifier copy
 _AddSlots: ( |
  _ parent** =  traits cLexer stages identifier.
  _ state*   <- traits cLexer stages identifier init.
| ) )


" I recognize all the operators & punctuation, upto 3 char long.
  singles, doubles, and triples are straight from the C++ book.
  My intialization computes the tables I really need
"

traits cLexer stages operator _Define: ( |
  _ parent** = traits lexer stages operator.
  _ mixin*  = traits cLexer stages filterMixin.

    " from the book: "
  _ singles = '! % ^ & * ( ) - + = { } | ~ [ ] \\ ; : " < > ? , . / #'.
  _ doubles = '-> ++ -- .* << >> <= >= == != && || *= /= %= += -= &= ^= |= :: ##'.
  _ triples = '->* <<= >>='.

  " tables I need: "


  ^ stageName	     = 'C++ operator'.
| )



( cLexer stages operator _Define: 
    lexer stages operator copy 
 _AddSlots: ( |
  _ parent** =  traits cLexer stages operator.
  _ state*   <- traits cLexer stages operator init.
  _ tables*** <- ().
| ) ) initialize
