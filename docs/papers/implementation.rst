An Efficient Implementation of Self, a Dynamically-Typed Object-Oriented Language Based on Prototypes
=====================================================================================================

`Craig Chambers <http://www.cs.washington.edu/people/faculty/chambers.html>`_, David Ungar, and Elgin Lee

**Abstract:**

We have developed and implemented techniques that double
the performance of dynamically-typed object-oriented languages. Our
SELF implementation runs twice as fast as the fastest Smalltalk
implementation, despite SELF's lack of classes and explicit variables.

To compensate for the absence of classes, our system uses
implementation-level maps to transparently group objects cloned from
the same prototype, providing data type information and eliminating
the apparent space overhead for prototype-based systems. To compensate
for dynamic typing, user-defined control structures, and the lack of
explicit variables, our system dynamically compiles multiple versions
of a source method, each customized according to its receiver's map.
Within each version the type of the receiver is fixed, and thus the
compiler can statically bind and inline all messages sent to
self. Message splitting and type prediction extract and preserve even
more static type information, allowing the compiler to inline many
other messages. Inlining dramatically improves performance and
eliminates the need to hard-wire low-level methods such as +, =\x12=,
and ifTrue:.

Despite inlining and other optimizations, our system
still supports interactive programming environments. The system
traverses internal dependency lists to invalidate all compiled methods
affected by a programming change. The debugger reconstructs inlined
stack frames from compiler- generated debugging information, making
inlining invisible to the SELF programmer.

*OOPSLA '89 Conference Proceedings, pp. 49-70, New Orleans, LA,
October, 1989.*

*Published as SIGPLAN Notices 24(10), October, 1989.
Also published in Lisp and Symbolic Computation 4(3), Kluwer Academic
Publishers, June, 1991.*

 `PDF <_static/implementation.pdf>`_

