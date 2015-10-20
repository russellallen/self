A Third-Generation Self Implementation: Reconciling Responsiveness with Performance
===================================================================================

`Urs Hölzle <http://www.cs.ucsb.edu/~urs>`_ and David Ungar

**Abstract:**

Programming systems should be both responsive (to support rapid
development) and efficient (to complete computations quickly). Pure
object-oriented languages are harder to implement efficiently since
they need optimization to achieve good performance. Unfortunately,
optimization conflicts with in teractive responsiveness because it
tends to produce long compilation pauses, leading to unresponsive
programming environments. Therefore, to achieve good responsiveness,
existing exploratory programming environments such as the Smalltalk-80
environment rely on interpretation or non-optimizing dynamic
compilation. But such systems pay a price for their interactive ness,
since they may execute programs several times slower than an
optimizing system.

SELF-93 reconciles high performance with responsive ness by combining
a fast, non-optimizing compiler with a slower, optimizing compiler.
The resulting system achieves both excellent performance (two or three
times faster than existing Smalltalk systems) and good responsiveness.
Except for situations requiring large applications to be (re)compiled
from scratch, the system allows for pleasant interactive use with few
perceptible compilation pauses. To our knowledge, SELF- 93 is the
first implementation of a pure object-oriented language achieving both
good performance and good responsiveness.

When measuring interactive pauses, it is imperative to treat multiple
short pauses as one longer pause if the pauses occur in short
succession, since they are perceived as one pause by the user. We
propose a definition of pause clustering and show that clustering can
make an order-of-magnitude difference in the pause time distribution.

*Proceedings of the ACM OOPSLA `94 Conference, Portland, OR, October 1994.*

 `PDF <_static/third-generation.pdf>`_

