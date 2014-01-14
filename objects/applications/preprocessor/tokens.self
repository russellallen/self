"$Revision: 8.2 $"


" lang-indep tokens for lexer  "

prototypes  applications _AddSlotsIfAbsent: ( | lexer = () | )
traits      applications _AddSlotsIfAbsent: ( | lexer = () | )

prototypes  applications lexer _AddSlotsIfAbsent: ( | 
    tokens     = ().
| )
traits      applications lexer _AddSlotsIfAbsent: ( | 
    tokens     = ().
| )

traits lexer tokens _AddSlotsIfAbsent: ( |
   token           = ().
    char           = ().
    comment        = ().
    charConst      = ().
    stringLit      = ().
    whiteSpace     = ().
    identifier     = ().
    operator       = ().
    newline        = ().
    integer        = ().
    float          = ().
| )

lexer tokens _AddSlots: ( |
  names* = lexer.
| )

lexer tokens _AddSlotsIfAbsent: ( |
  token            = ().
    char           = ().
    comment        = ().
    charConst      = ().
    stringLit      = ().
    whiteSpace     = ().
    identifier     = ().
    operator       = ().
    newline        = ().
    integer        = ().
    float          = ().
| )


traits lexer tokens token _Define: ( |
  _ parent*    = traits clonable.
  _ names**    = lexer tokens.

    " implemented for all tokens "

  ^ printString = (tokenType, '(', sourceForPrinting, ')').
  ^ sourceForPrinting  = (priorWhiteSpace, source).
  ^ sourceForCPPOutput = (priorWhiteSpace, source).

  ^ copyPrependWhite: s = (
        copy priorWhiteSpace: s, priorWhiteSpace).

  ^ copyRemoveFirstWhite = (
	priorWhiteSpace isEmpty	  ifTrue: [copy] False: [
	    copy priorWhiteSpace: priorWhiteSpace copyWithoutFirst]).

  ^ copyReplaceTabs = (
	copy priorWhiteSpace: (priorWhiteSpace asList mapBy: [' ']) asString).

  ^ isWhiteSpace = false.
  ^ isCharToken = false.
  ^ isNewline   = false.
  ^ isIntegerToken  = false.
  ^ isIdentifier = false.
  ^ isStringLit = false.
  ^ isOperatorToken = false.
  ^ isComment = false.

  ^ isUndef = false.
  ^ isEndOfExpansion = false.
  ^ isMacroInvocation = false.
  ^ isDirectiveName = false.

  ^ isKeyword = false.
  ^ isTerminal = false.
  ^ isNonTerminal = false.
  ^ isCharSet = false.
  ^ isSelfObject = false.


    " identity according to source (which may be a string)"

  ^ = x      = (asString = x asString).
  ^ hash     = (asString hash).
  ^ asString = (source).


    " intended to be overridden by each token:"

  ^ tokenType = 'token'.

    " by implementing these, the lexer stages don't have to check
      first if this is a charToken, then ask charToken if this is a letter"

  _ notAChar* = ( |
      ^ isLetter = false.
      ^ isLowerCase = false.
      ^ isUpperCase = false.
      ^ isDigit  = false.

      ^ ifOctalDigit:   digitBlock  Else: elseBlock = (elseBlock value).
      ^ ifDecimalDigit: digitBlock  Else: elseBlock = (elseBlock value).
      ^ ifHexDigit:     digitBlock  Else: elseBlock = (elseBlock value).

      _ if: c  IsDigit: digitBlock  Else: elseBlock = (elseBlock value).

      ^ capitalize   = ''.
      ^ uncapitalize = ''.
    | ).

    " see identifier "
    ^ isExpandable: x = (self).
    ^ isExpandable = false.
| )

lexer tokens token _Define: ( |
  _ parent* = traits lexer tokens token.
  ^ source <- ''.
    priorWhiteSpace <- ''.  "only used after the lexer"
  _ thisObjectPrints = true.
| )


" char tokens represent raw, unlexed characters"

traits lexer tokens char _Define: ( |
  _ parent** = traits lexer tokens token.

  ^ tokenType = 'char'.
  ^ isCharToken = true. 

  _ lexing* = ( |

      ^ asByte      = ( source asByte      ).
      ^ isDigit     = ( source isDigit     ).
      ^ isLetter    = ( source isLetter    ).
      ^ isLowerCase = ( source isLowerCase ).
      ^ isUpperCase = ( source isUpperCase ).

      " if it's the right kind of digit, invoke the digitBlock with
	appropriate numeric value, else invoke the else block "

      ^ ifOctalDigit: digitBlock Else: elseBlock = (
            ('0' <= source)  &&  [source <= '7']  ifFalse: elseBlock  
	                                             True: [
	        digitBlock value: asByte - '0' asByte]).

      ^ ifDecimalDigit: digitBlock Else: elseBlock = (
            source isDigit  ifFalse: elseBlock  
	                       True: [
	        digitBlock value: asByte - '0' asByte]).

      ^ ifHexDigit: digitBlock Else: elseBlock = (
            source isDigit ifTrue: [ 
	        ^ digitBlock value: asByte - '0' asByte.
            ].
            ('a' <= source)  &&  [source <= 'f']  ifTrue: [
	        ^digitBlock value: (asByte - 'a' asByte)  +  10
            ].
            ('A' <= source)  &&  [source <= 'F']  ifTrue: [
	        ^digitBlock value: (asByte - 'F' asByte)  +  10
            ].
	    elseBlock value).

      ^ uncapitalize = (source uncapitalize).
      ^ compare: x IfLess: lt Equal: e Greater: g Incomparable: i = (
            source compare: x IfLess: lt Equal: e Greater: g Incomparable: i).
    | ).
| )

lexer tokens char _Define: lexer tokens token copy _AddSlots: ( |
  _ parent* = traits lexer tokens char.
| )


traits lexer tokens comment _Define: ( |
  _ parent* = traits lexer tokens token.
  ^ tokenType = 'comment'.
  ^ sourceForCPPOutput = ' '.
  ^ isWhiteSpace = true.
  ^ isComment = true.
| )

lexer tokens comment _Define: lexer tokens token copy _AddSlots: ( |
  _ parent* = traits lexer tokens comment.
| )


" for character constants "

traits lexer tokens charConst _Define: ( |
  _ parent* = traits lexer tokens token.
  ^ tokenType = 'charConst'.
| )

lexer tokens charConst _Define: lexer tokens token copy _AddSlots: ( |
  _ parent* = traits lexer tokens charConst.
  ^ value <- ''.
| )

" string literals "

traits lexer tokens stringLit _Define: ( |
  _ parent* = traits lexer tokens token.
  ^ tokenType = 'string'.
  ^ isStringLit = true.

  ^ quote: toks = ( "implements the cpp # operator "
	toks do: [|:t|
	    t sourceForCPPOutput do: [|:c|
	        (c = '\\')  || [c = '"']  ifTrue: [source: source, '//'].
	        source: source, c.
	    ].
	].
	source: '"', source, '"').
| )

lexer tokens stringLit _Define: lexer tokens token copy _AddSlots: ( |
  _ parent* = traits lexer tokens stringLit.
  ^ value <- ''.
| )


traits lexer tokens whiteSpace _Define: ( |
  _ parent* = traits lexer tokens token.
  ^ tokenType = 'whiteSpace'.
  ^ isWhiteSpace = true.
| )

lexer tokens whiteSpace _Define: lexer tokens token copy _AddSlots: ( |
  _ parent* = traits lexer tokens whiteSpace.
| )

traits lexer tokens identifier _Define: ( |
  _ parent* = traits lexer tokens token.
  ^ tokenType = 'identifier'.
  ^ isIdentifier = true.
| )

lexer tokens identifier _Define: lexer tokens token copy _AddSlots: ( |
  _ parent* = traits lexer tokens identifier.
    "set to false if part of another token as a result of ##"
    isExpandable <- true. 
| )


" any punctuation "

traits lexer tokens operator _Define: ( |
  _ parent* = traits lexer tokens token.	
  ^ tokenType = 'operator'.
  ^ isOperatorToken = true.
| )

lexer tokens operator _Define: lexer tokens token copy _AddSlots: ( |
  ^ parent* = traits lexer tokens operator.

   "for parsing #if exprs"
  ^ precedence <- 0.
  ^ isLtoR     <- true.
  ^ isUnary    <- false.
| )

traits lexer tokens newline _Define: ( |
  _ parent* = traits lexer tokens token.
  ^ tokenType = 'newline'.
  ^ printString = ('newline()').
  ^ isNewline = true.
  ^ source: x = (self).
| )

lexer tokens newline _Define: lexer tokens token copy _AddSlots: ( |
  _ parent* = traits lexer tokens newline.
  ^ source = '\n'. "cause source <- is in token"
| )


" uses DI to mix in radix-specific behavior "

traits lexer tokens integer _Define: ( |
  _ parent* = traits lexer tokens token.

  ^ isUnsigned = (isSigned not).

  ^ sourceForPrinting = (
         resend.sourceForPrinting, '=', (value printStringBase: base),
	(isLong   ifTrue: 'l' False: ''), 
	(isSigned ifTrue: ''  False: 'u') ).

  _ octal = ( |
      ^ tokenType = ('octal').
      ^ base = 8.
      _ if: t      IsDigit: digitBlock Else: elseBlock = (
            t ifOctalDigit: digitBlock Else: elseBlock).
    | ).
  _ decimal = ( |
      ^ tokenType = ('decimal').
      ^ base = 10.
      _ if: t        IsDigit: digitBlock Else: elseBlock = (
            t ifDecimalDigit: digitBlock Else: elseBlock).
    | ).
  _ hex = ( |
      ^ tokenType = ('hex').
      ^ base = 16.
      _ if: t    IsDigit: digitBlock Else: elseBlock = (
            t ifHexDigit: digitBlock Else: elseBlock).
    | ).

  ^ isIntegerToken = true.

  ^ beOctal   = ( baseP: octal   ).
  ^ beDecimal = ( baseP: decimal ).
  ^ beHex     = ( baseP: hex     ).

  " l and u suffixes "
  ^ beLong      = ( isLong:   true  ).
  ^ beUnsigned  = ( isSigned: false ).

  " used by tokenizer to build up an int "

  ^ append: t IfDigit: tb Else: fb = (
       if: t IsDigit: [|:i| value: (value * base) + i.  tb value]
                Else: fb).

  ^ fixupValue = ( "confine to right part of int space"
        isSigned ifTrue: [fixupSignedValue] False: [fixupUnsignedValue]).

  _ two32 = 2 power: 32.
  _ two31 = 2 power: 31.

  ^ fixupUnsignedValue = (
	value:   value < 0  ifTrue: [fixupSignedValue.  value + two32 ]
	                     False: [                   value % two32 ]).

  ^ fixupSignedValue = (
        value: 
	    value < 0 ifTrue: [ | r |
	        r: value negate % two31.
	        (r = 0) && [((value negate / two31) % 2) = 1] 
	            ifTrue: [two31 negate] 
                     False: [r     negate].
          ] False: [ | r |
	        r: value % two32.
	        r < two31 ifTrue: [r] False: [r - two32].	      
          ]).
| )


lexer tokens integer _Define: lexer tokens token copy _AddSlots: ( |
  _ parent** = traits lexer tokens integer. 
  _ baseP* <- ().
  ^ value <- 0.
  ^ isLong <- false.
  ^ isSigned <- true.
| ) beDecimal

traits lexer tokens float _Define: ( |
  _ parent* = traits lexer tokens token.

  ^ sourceForPrinting = (
        resend.sourceForPrinting, '=', value printString,
	(isLong   ifTrue: 'l'  False: ''), 
	(isSingle ifTrue: 'f'  False: '')).

  ^ beLong = (isLong: true).
  ^ beSingle = (isSingle: true).
  ^ tokenType = 'float'.
| )

lexer tokens float _Define: lexer tokens token copy _AddSlots: ( |
  _ parent* = traits lexer tokens float.

  ^ value <- 0.0.
  _ isSingle <- false.
  _ isLong  <- false.
| )


