Parents are Shared Parts: Inheritance and Encapsulation in Self
===============================================================

`Craig Chambers <http://www.cs.washington.edu/people/faculty/chambers.html>`_, David Ungar, Bay-Wei Chang, and `Urs Hölzle <http://www.cs.ucsb.edu/~urs>`_

**Abstract:**

The design of inheritance and encapsulation in Self, an
object-oriented language based on prototypes, results from
understanding that inheritance allows parents to be shared parts of
their children. The programmer resolves ambiguities arising from
multiple inheritance by prioritizing an object's parents. Unifying
unordered and ordered multiple inheritance supports differential
programming of abstractions and methods, combination of unrelated
abstractions, unequal combination of abstractions, and mixins. In
Self, a private slot may be accessed if the sending method is a shared
part of the receiver, allowing privileged communication between
related objects.  Thus, classless Self enjoys the benefits of
class-based encapsulation.

*Lisp and Symbolic Computation 4(3), Kluwer Academic
Publishers, June, 1991.*

 `PDF <_static/parents-shared-parts.pdf>`_
