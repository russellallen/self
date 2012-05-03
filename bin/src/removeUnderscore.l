%{
  /* Sun-$Revision: 30.6 $ */

  /* Copyright 1992-2012 AUTHORS.
     See the LICENSE file for license information. */

  /* Remove "_" in front of all identifiers. */
%}
%%
\"[^"]*\" { if (yytext[yyleng-1] == '\\') yymore(); else printf("%s",yytext); }
_[A-Za-z0-9_\.]+	{ printf("%s",yytext + 1); }
[A-Za-z0-9_\.]+		{ printf("%s",yytext); }

.         	ECHO;
\n		ECHO;
