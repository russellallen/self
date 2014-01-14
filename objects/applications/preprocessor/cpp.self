"$Revision: 8.1 $"
"Lexer for C (and C++)"

((reflect: prototypes applications) includesName: 'cLexer') ifFalse: [
    'cLexer' _RunScript
]

prototypes applications _AddSlotsIfAbsent: ( | cpp = () | )
traits	   applications _AddSlotsIfAbsent: ( | cpp = () | )

cpp _AddSlots: ( |
    names* = cLexer.

      preprocess: f = (stages main copy preprocess: f).

      test = (
          preprocess: 
       '-DASSERT -DSTATS -DPIXRECTS -DXLIB -DNEW_COMPILER ',
       '-Dsun4   -Dsparc -Dunix ',
       '-DHOST_ARCH=sun4  -DHOST_MACH=sparc ',
       '-DTARGET_ARCH=sun4 -DTARGET_MACH=sparc ',
       '-I/home/kahuna/self/self/altered ',
       '-I/home/super/local/lib/g++-include ',
       '-I/home/super/local/lib/gcc-lib/sparc-sun-sunos4.1/2.2.2/include ',
       ' glue.c'
       ).
| )

'cppTokens' _RunScript
'cppStages' _RunScript


