A Fast Write Barrier for Generational Garbage Collectors
========================================================

`Urs Hölzle <http://www.cs.ucsb.edu/~urs>`_

**Abstract:**

Generational garbage collectors need to keep track of references from
older to younger generations so that younger generations can be
garbage-collected without inspecting every object in the older
generation(s). The set of locations potentially
containing pointers to newer objects is often called the remembered
set. At every store, the system must ensure that the updated
location is added to the remembered set if the store creates a
reference from an older to a newer object. This mechanism is usually
referred to as a write barrier or store check.

For some stores, the
compiler can know statically that no store check is necessary, for
example, when storing an integer (assuming that integers are
implemented as immediates rather than as real heap-allocated objects).
However, in the general case, a store check must be executed for every
store operation. Since stores are fairly frequent in non-functional
languages, an efficient write barrier implementation is essential. The
write barrier implementation described here reduces the write barrier
overhead in the mutator to only two extra instructions per checked
store.

*OOPSLA'93 Workshop on Garbage Collection, Washington, D.C., October 1993*


 `PDF <_static/write-barrier.pdf>`_

