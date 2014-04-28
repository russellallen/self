Constraint-Based Type Inference and Parametric Polymorphism
===========================================================

Ole Agesen

**Abstract:**

Constraint-based analysis is a technique for inferring implementation
types.  Traditionally it has been described using mathematical
formalisms. We explain it in a different and more intuitive way as a
flow problem. The intuition is facilitated by a direct correspondence
between run-time and analysis-time concepts.

Precise analysis of polymorphism is hard; several algorithms have been
developed to cope with it. Focusing on parametric polymorphism and
using the flow perspective, we analyze and compare these algorithms,
for the first time directly characterizing when they succeed and fail.

Our study of the algorithms lead us to two conclusions. First,
designing an algorithm that is either efficient or precise is easy, but
designing an algorithm that is efficient and precise is hard. Second,
to achieve efficiency and precision simultaneously, the analysis effort
must be actively guided towards the areas of the program with the
highest pay-off. We define a general class of algorithms that do this:
the adaptive algorithms. The two most powerful of the five algorithms
we study fall in this class.

*First International Static Analysis Symposium, SAS'94, Namur, Belgium, 
September 1994.*

 `PDF <_static/sas94.pdf>`_
