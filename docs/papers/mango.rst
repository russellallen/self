Mango - A Parser Generator for Self
===================================

Ole Agesen

**Abstract:**

Mango is a parser generator that is included in Release 4.0 of the Self
system.  Mango goes beyond LEX/YACC in several respects.  First, Mango
grammars are structured, thus easier to read and map onto parse trees.
Second, Mango parsers automatically build parse trees rather than
merely provide hooks for calling low-level reduce actions during
parsing.  Third, Mango automatically maintains invariance of the
structure of parse trees, even while grammars are transformed to enable
LR parsing.  Fourth, Mango and the parsers it generates are completely
integrated in the Self object world.  In particular, a parser is an
object.  Unike YACC, several independent parsers can co-exist in a
single program.

We show how to generate a Mango parser and how to use it by means of an
example: a simple expression language.  Furthermore, we show how to add
semantic properties to the parse trees that the Mango parser produces.

Mango is a realistic tool.  A parser for full ANSI C was built with
Mango.

*Sun Microsystems Laboratories Technical Report, SMLI-TR-94-27.*

*For a hardcopy, write to: 
Editor, Technical Reports, 2550 Garcia Ave, M/S UMTV29-01,
Mountain View, CA 94043-1100, U.S.A.*


 `PDF <_static/mango.pdf>`_

