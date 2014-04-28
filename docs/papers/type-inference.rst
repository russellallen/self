Type Inference of Self: Analysis of Objects with Dynamic and Multiple Inheritance
=================================================================================

Ole Agesen, Jens Palsberg, and Michael I. Schwartzbach

**Abstract:**

We have designed and implemented a type inference algorithm 
for the full Self language.
The algorithm can guarantee the safety and disambiguity of message sends,
and provide useful information for browsers and optimizing compilers.

Self features objects with dynamic inheritance.
This construct has until now been considered incompatible with type inference
because it allows the inheritance graph to change dynamically.
Our algorithm handles this by deriving and solving type constraints that
simultaneously define supersets of both the possible values of expressions
and of the possible inheritance graphs.
The apparent circularity is resolved by computing a global fixed-point,
in polynomial time.

The algorithm has been implemented and can successfully handle the 
Self benchmark programs, which exist in the "standard Self
world" of more than 40,000 lines of code.

*ECOOP '93 Conference Proceedings, Kaiserslautern, Germany, July, 1993.*

 `PDF <_static/type-inference.pdf>`_

