"$Revision: 1.1 $"

"Lexer for C (and C++)"

((reflect: prototypes applications) includesName: 'lexer') ifFalse: [
    'lexer' _RunScript
]

prototypes applications _AddSlotsIfAbsent: ( | cLexer = () | )
traits	   applications _AddSlotsIfAbsent: ( | cLexer = () | )

cLexer _AddSlots: ( |
    names* = lexer.
| )

'cTokens'   _RunScript
'cStages'   _RunScript


