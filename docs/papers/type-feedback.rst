Optimizing Dynamically-Dispatched Calls with Run-Time Type Feedback
===================================================================

`Urs Hölzle <http://www.cs.ucsb.edu/~urs>`_ and David Ungar

**Abstract:**

Object-oriented programs are difficult to optimize because they
execute many dynamically-dispatched calls. These calls cannot easily
be eliminated because the compiler does not know which callee will be
invoked at runtime. We have developed a simple technique that feeds
back type information from the runtime system to the compiler. With
this type feedback, the compiler can inline any dynamically-dispatched
call. Our compiler drastically reduces the call frequency of a suite
of large SELF applications (by a factor of 3.6) and improves
performance by a factor of 1.7. We believe that type feedback could
significantly reduce call frequencies and improve performance for most
other object-oriented languages (statically-typed or not) as well as
for languages with type-dependent operations such as generic
arithmetic.

*Proceedings of the ACM
SIGPLAN `94 Conference on Programming Language Design and
Implementation.*


 `PDF <_static/type-feedback.pdf>`_

