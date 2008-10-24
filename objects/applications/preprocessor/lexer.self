"$Revision: 1.1 $"


" lexer framework "

prototypes  applications _AddSlotsIfAbsent: ( | lexer = () | )
traits      applications _AddSlotsIfAbsent: ( | lexer = () | )

lexer _AddSlots: ( |
"  _ parent* = lobby." "so debugger will work xxx" "uncomment for vm bug"

   lex: f            = (stages main copy readFileNamed: f ).
   lex: f Grammar: g = (stages main copy readFileNamed: f Grammar: g).

| )

'tokens' _RunScript
'stages' _RunScript

