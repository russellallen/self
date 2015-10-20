Optimizing Dynamically-Typed Object-Oriented Programming Languages with Polymorphic Inline Caches
=================================================================================================

`Urs Hölzle <http://www.cs.ucsb.edu/~urs>`_, `Craig Chambers <http://www.cs.washington.edu/people/faculty/chambers.html>`_, and David Ungar

**Abstract:**

Polymorphic inline caches (PICs) provide a new way to reduce the
overhead of polymorphic message sends by extending inline caches to
include more than one cached lookup result per call site. For a set of
typical object-oriented SELF programs, PICs achieve a median speedup
of 11%.

As an important side effect, PICs collect type information by
recording all of the receiver types actually used at a given call
site. The compiler can exploit this type infor\-mation to generate
better code when recompiling a method. An experimental version of such
a system achieves a median speedup of 27% for our set of SELF
programs, reducing the number of non-inlined message sends by a factor
of two.

Implementations of dynamically-typed object-oriented languages have
been limited by the paucity of type information available to the
compiler. The abundance of the type information provided by PICs
suggests a new compilation approach for these languages, adaptive
compilation. Such compilers may succeed in generating very efficient
code for the time-critical parts of a program without incurring
distracting compilation pauses.

*ECOOP '91 Conference Proceedings, Geneva, Switzerland, July, 1991.*

*Published as Springer Verlag LNCS 512, 1991.*

 `PDF <_static/pics.pdf>`_

