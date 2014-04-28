Iterative Type Analysis and Extended Message Splitting: Optimizing Dynamically-Typed Object-Oriented Programs
=============================================================================================================

`Craig Chambers <http://www.cs.washington.edu/people/faculty/chambers.html>`_ and David Ungar

**Abstract:**

Object-oriented languages have suffered from poor performance caused
by frequent and slow dynamically-bound procedure calls. The best way
to speed up a procedure call is to compile it out, but dynamic binding
of object-oriented procedure calls without static receiver type
information precludes inlining. Iterative type analysis and extended
message splitting are new compilation techniques that extract much of
the necessary type information and make it possible to hoist run-time
type tests out of loops.

Our system compiles code on-the-fly that is customized to the actual
data types used by a running program. The compiler constructs a
control flow graph annotated with type information by simultaneously
performing type analysis and inlining. Extended message splitting
preserves type information that would otherwise be lost by a
control-flow merge by duplicating all the code between the merge and
the place that uses the information. Iterative type analysis computes
the types of variables used in a loop by repeatedly recompiling the
loop until the computed types reach a fix-point.  Together these two
techniques enable our SELF compiler to split off a copy of an entire
loop, optimized for the common-case types.

By the time our SELF compiler generates code for the graph, it has
eliminated many dynamically- dispatched procedure calls and type
tests. The resulting machine code is twice as fast as that generated
by the previous SELF compiler, four times faster than ParcPlace
Systems Smalltalk-80, the fastest commercially available
dynamically-typed object-oriented language implementation, and nearly
half the speed of optimized C. Iterative type analysis and extended
message splitting have cut the performance penalty for
dynamically-typed object-oriented languages in half.

*Proceedings of the SIGPLAN '90 Conference
on Programming Language Design and Implementation, pp. 150-164, White
Plains, NY, June, 1990.*

*Published as SIGPLAN Notices 25(6), June, 1990.
Also published in Lisp and Symbolic Computation 4(3), Kluwer
Academic Publishers, June, 1991.*


 `PDF <_static/iterative-type-analysis.pdf>`_

