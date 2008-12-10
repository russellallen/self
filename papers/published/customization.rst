Customization: Optimizing Compiler Technology for Self, a Dynamically-Typed Object-Oriented Programming Language
================================================================================================================

`Craig Chambers <http://www.cs.washington.edu/people/faculty/chambers.html>`_ and David Ungar

**Abstract:**

Dynamically-typed object-oriented languages please programmers, but
their lack of static type information penalizes performance. Our new
implementation techniques extract static type information from
declaration-free programs. Our system compiles several copies of a
given procedure, each customized for one receiver type, so that the
type of the receiver is bound at compile time. The compiler predicts
types that are statically unknown but likely, and inserts run-time
type tests to verify its predictions. It splits calls, compiling a
copy on each control path, optimized to the specific types on that
path. Coupling these new techniques with compile-time message lookup,
aggressive procedure inlining, and traditional optimizations has
doubled the performance of dynamically-typed object-oriented
languages. 

*Proceedings of the SIGPLAN '89 Conference on
Programming Language Design and Implementation, pp. 146-160, Portland,
OR, June, 1989.*

*Published as SIGPLAN Notices 24(7), July, 1989.*

