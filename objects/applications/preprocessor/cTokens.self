"$Revision: 1.1 $"

"I hold C lexer-specific tokens"

traits cLexer      _AddSlotsIfAbsent: ( |
    tokens = ().
| )
prototypes  cLexer _AddSlotsIfAbsent: ( |
    tokens = ().
| )

traits cLexer tokens _AddSlotsIfAbsent: ( |
    angledFileName = ().
| )

prototypes cLexer tokens _AddSlotsIfAbsent: ( |
    angledFileName = ().
| )

traits cLexer tokens _AddSlots: ( |
    names*     = traits lexer tokens.
| )

prototypes cLexer tokens _AddSlots: ( |
    names*     = cLexer.
    moreNames** = lexer tokens.

    isAngledFileName = false.
| )


traits cLexer tokens angledFileName _Define: ( |
  _ parent* = traits cLexer tokens token.
  ^ tokenType = 'angledFileName'.
  ^ value = (source copyWithoutFirst copyWithoutLast).
    isAngledFileName = true.
| )

cLexer tokens angledFileName _Define: cLexer tokens token copy _AddSlots: ( |
  _ parent* = traits cLexer tokens angledFileName.
| )

