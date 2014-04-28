Adaptive optimization for Self: Reconciling High Performance with Exploratory Programming
=========================================================================================

`Urs Hölzle <http://www.cs.ucsb.edu/~urs>`_

**Abstract:**

Crossing abstraction boundaries often incurs a substantial run-time
overhead in the form of frequent procedure calls.  Thus, pervasive use
of abstraction, while desirable from a design standpoint, may lead to
very inefficient programs.  Aggressively optimizing compilers can
reduce this overhead but conflict with interactive programming
environments because they introduce long compilation pauses and often
preclude source-level debugging. Thus, programmers are caught on the
horns of two dilemmas: they have to choose between abstraction and
efficiency, and between responsive programming environments and
efficiency. This dissertation shows how to reconcile these seemingly
contradictory goals by performing optimizations lazily.

Four new techniques work together to achieve this:

-   *Type feedback* achieves high performance by allowing the
    compiler to inline message sends based on information extracted from
    the runtime system. On average, programs run 1.5 times faster than the
    previous SELF system; compared to a commercial Smalltalk
    implementation, two medium-sized benchmarks run about three times
    faster.  This level of performance is obtained with a compiler that is
    both simpler and faster than previous SELF compilers.  
    
-   *Adaptive optimization* achieves high responsiveness
    without sacrificing performance by using a fast compiler to generate
    initial code while automatically recompiling heavily used program
    parts with an optimizing compiler. On a previous-generation
    workstation like the SPARCstation-2, fewer than 200 pauses exceeded
    200 ms during a 50- minute interaction, and 21 pauses exceeded one
    second. On a current-generation workstation, only 13 pauses exceed 400
    ms.  
    
-   *Dynamic deoptimization* shields the programmer from the
    complexity of debugging optimized code by transparently recreating
    non-optimized code as needed. No matter whether a program is optimized
    or not, it can always be stopped, inspected, and single-stepped.
    Compared to previous approaches, deoptimization allows more debugging
    while placing fewer restrictions on the optimizations allowed.  
    
-   *Polymorphic inline caching* generates type-case sequences
    on-the-fly to speed up messages sent from the same call site to
    several different types of objects. More significantly, they collect
    concrete type information for the compiler.

With better performance yet good interactive behavior, these
techniques reconcile exploratory programming, ubiquitous abstraction,
and high performance.

*Ph.D. thesis, Computer Science Department, Stanford University.*

*To appear as a Stanford CSD technical report STAN-CS-TR-94-1520
and as a Sun Microsystems Laboratories technical report.*


 `PDF <_static/urs-thesis.pdf>`_


