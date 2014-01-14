"$Revision: 1.1 $"

"Lexer for Ole's grammar "

((reflect: prototypes applications) includesName: 'lexer') ifFalse: [
    'lexer' _RunScript
]

prototypes applications _AddSlotsIfAbsent: ( | grammarLexer = () | )
traits	   applications _AddSlotsIfAbsent: ( | grammarLexer = () | )

grammarLexer _AddSlots: ( |
    names* = lexer.
| )

'grammarTokens'   _RunScript
'grammarStages'   _RunScript


