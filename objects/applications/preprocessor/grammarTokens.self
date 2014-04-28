"$Revision: 8.1 $"

"I hold grammar-specific tokens"

traits grammarLexer      _AddSlotsIfAbsent: ( |
    tokens = ().
| )
prototypes  grammarLexer _AddSlotsIfAbsent: ( |
    tokens = ().
| )

traits grammarLexer tokens _AddSlotsIfAbsent: ( |
    token = ().
    keyword = ().
    termOrNonterm = ().
    charSet = ().
    selfObject = ().
    selfComment = ().
| )

prototypes grammarLexer tokens _AddSlotsIfAbsent: ( |
    token = ().
    keyword = ().
    terminal = ().
    nonterminal = ().
    charSet = ().
    selfObject = ().
    selfComment = ().
| )

traits grammarLexer tokens _AddSlots: ( |
    names*     = traits lexer tokens.
    sourceForPrinting = (source).
| )

prototypes grammarLexer tokens _AddSlots: ( |
    names*     = grammarLexer.
    moreNames** = lexer tokens.
| )

traits grammarLexer tokens token _Define: ( |
    parent** = traits lexer tokens token.
    names*   = grammarLexer tokens.
| )

grammarLexer tokens token _Define: lexer tokens token copy _AddSlots: ( |
    parent* = traits grammarLexer tokens token.
| )

traits grammarLexer tokens termOrNonterm _Define: ( |
    parent* = traits grammarLexer tokens token.
    sourceForPrinting = (tag, ':', kind).
| )

grammarLexer tokens terminal _Define: grammarLexer tokens token copy _AddSlots: ( |
    parent* = traits grammarLexer tokens termOrNonterm.
    tag <- ''.
    kind <- ''.
    tokenType = 'terminal'.
    isTerminal = true.
| )

grammarLexer tokens nonterminal _Define: grammarLexer tokens token copy _AddSlots: ( |
    parent* = traits grammarLexer tokens termOrNonterm.
    tag <- ''.
    kind <- ''.
    tokenType = 'nonterminal'.
    isNonterminal = true.
| )
   
traits grammarLexer tokens keyword _Define: ( |
    parent* = traits grammarLexer tokens token.
    isKeyword = true.
    tokenType = 'keyword'.
| )

grammarLexer tokens keyword _Define: grammarLexer tokens token copy _AddSlots: ( |
    parent* = traits grammarLexer tokens keyword.
| )

traits grammarLexer tokens charSet _Define: ( |
    parent* = traits grammarLexer tokens token.
    tokenType = 'charSet'.
    isCharSet = true.
| )

grammarLexer tokens charSet _Define: grammarLexer tokens token copy _AddSlots: ( |
    parent* = traits grammarLexer tokens charSet.
  ^ value <- ''.
| )

traits grammarLexer tokens selfObject _Define: ( |
    parent* = traits grammarLexer tokens token.
    tokenType = 'object'.
    isSelfObject = true.
| )

grammarLexer tokens selfObject _Define: grammarLexer tokens token copy _AddSlots: ( |
    parent* = traits grammarLexer tokens selfObject.
| )

traits grammarLexer tokens selfComment _Define: ( |
    parent* = traits grammarLexer tokens token.
    tokenType = 'selfComment'.
| )

grammarLexer tokens selfComment _Define: grammarLexer tokens token copy _AddSlots: ( |
    parent* = traits grammarLexer tokens selfComment.
| )


