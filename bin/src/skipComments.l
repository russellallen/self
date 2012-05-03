%{
  /* Sun-$Revision: 30.6 $ */

  /* Copyright 1992-2012 AUTHORS.
     See the LICENSE file for license information. */

  /* this lex filter skips comments in c and c++ programs */
%}
  int in_comment = 0;
%%
\"[^"]*\" { if (yytext[yyleng-1] == '\\') yymore(); else printf("%s",yytext); }
"/*"      { if (!in_comment) in_comment = 1; }
"*/"      { if (in_comment)  in_comment = 0; else ECHO;}
"//".*    ;
\n        { if (!in_comment) ECHO; }
.         { if (!in_comment) ECHO; }

