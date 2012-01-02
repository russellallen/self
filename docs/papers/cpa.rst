The Cartesian Product Algorithm
===============================

Ole Agesen

**Abstract:**

Concrete types and abstract types are different and serve different
purposes. Concrete types, the focus of this paper, are essential to
support compilation, application delivery, and debugging in
object-oriented environments. Concrete types should not be obtained
from explicit type declarations because their presence limits
polymorphism unacceptably. This leaves us with type inference.
Unfortunately, while polymorphism demands the use of type inference, it
has also been the hardest challenge for type inference.

We review previous type inference algorithms that analyze code with
parametric polymorphism and then present a new one: the cartesian
product algorithm. It improves precision and efficiency over previous
algorithms and deals directly with inheritance, rather than relying on
a preprocessor to expand it away. Last, but not least, it is
conceptually simple.

The cartesian product algorithm has been used in the Self system 
since late 1993. We present measurements to document its performance 
and compare it against several previous algorithms.

*ECOOP'95 Conference Proceedings, Århus, Denmark, August 1995.*

`PDF <cpa.pdf>`_
