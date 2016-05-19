Blocks, Booleans, and Control Structures
========================================

A *block* is a special kind of object containing a sequence of statements. When a block is evaluated
by being sent an acceptable ``value`` message, its statements are executed in the context of the current
activation of the method in which the block is declared. This allows the statements in the block
to access variables local to the block’s enclosing method and any enclosing blocks in that method.
(This set of variables comprises the lexical scope of the block.) It also means that within the block,
``self`` refers to the receiver of the message that activated the method, not to the block object itself.
A return statement in a block causes a return from the block’s enclosing method. (See chapter :ref:`pp-langref`
- :doc:`Language Reference <langref>` for a more thorough discussion of block semantics.)

A block can take an arbitrary number of arguments and can have its own local variables, as well as
having access to the local variables of its enclosing method. The statements in the block are executed
when the block is sent a message of the form ``“value[:{With:}]”``, where the number of colons
in the message is at least the same as the number of arguments the block takes (extra
arguments are ignored, but it is an error to provide too few). For example, the following block takes
two arguments::

    [| :arg1. :arg2 | arg1 + arg2 ]

and can be evaluated by sending it the message ``value:With:`` to produce the sum of its arguments.
Blocks are used to implement all control structures in Self and allow the programmer to
easily extend the system with customized control structures. In fact, all control stuctures in Self
except message sends, returns, and VM error handling are implemented using blocks.

Booleans and Conditionals
-------------------------

The fundamental control structure is the conditional. In Self, the behavior of conditionals is defined
by two unique boolean objects, ``true`` and ``false``. Boolean objects respond to the messages
``ifTrue:``, ``ifFalse:``, ``ifTrue:False:``, and ``ifFalse:True:`` by evaluating the appropriate argument
block. For example, ``true`` implements ``ifTrue:False:`` as::

    ifTrue: b1 False: b2 = ( b1 value )

That is, when ``true`` is sent ``ifTrue:False:``, it evaluates the first block and ignores the second.
For example, the following expression evaluates to the absolute value of x::

    x < 0 ifTrue: [ x negate ] False: [ x ]

The booleans also define behavior for the logical operations ``AND (&&), OR (||), EXCLUSIVE-OR
(^^)``, and ``NOT (not)``. Because the binary boolean operators all send value to their argument when
necessary, they can also be used for “short-circuit” evaluation by supplying a block, e.g.::

    (0 <= i) && [i < maxByte pred] ifTrue: [...

Module: boolean

Loops
-----

The various idioms for constructing loops in Self are best illustrated by example.
Here is an endless loop::

    [ ... ] loop

Here are two loops that test for their termination condition at the beginning of the loop::

    [ proceed ] whileTrue: [ ... ]
    [ quit ] whileFalse: [ ... ]

In each case, the block that receives the message repeatedly evaluates itself and, if the termination
condition is not yet met, evaluates the argument block. The value returned by both loop expressions
is ``nil``.

It is also possible to put the termination test at the end of the loop, ensuring that the loop body is
executed at least once::

    [ ... ] untilTrue: [ quit ]
    [ ... ] untilFalse: [ proceed ]

Here is a loop that exits from the middle when quit becomes true::

    [| :exit | ... quit ifTrue: exit ... ] loopExit

For the incurably curious: the parameter to the user’s block, supplied by the ``loopExit`` method, is simply a block that
does a return from the ``loopExit`` method. Thus, the loop terminates when ``exit value`` is evaluated. The constructs
``loopExitValue``, ``exit``, and ``exitValue`` are implemented in a similar manner.

The value returned by the overall ``[...] loopExit`` expression is ``nil``. Here is a loop expression
that exits and evaluates to a value determined by the programmer when quit becomes true::

    [| :exit | ... quit ifTrue: [ exit value: expr ] ] loopExitValue

Module: block

Block Exits
-----------

It is sometimes convenient to exit a block early, without executing its remaining statements. The
following constructs support this behavior::

    [| :exit | ... quit ifTrue: exit ... ] exit
    [| :exit | ... quit ifTrue: [ exit value: expr ] ... ] exitValue

The first expression evaluates to nil if the block exits early; the second allows the programmer to
define the expression’s value when the block exits early. Note: These constructs should not be confused
with their looping counterparts ``loopExit`` and ``loopExitValue``.

Module: block

Other Block Behavior
--------------------

Blocks have some other useful behavior:

    * One can determine the time in milliseconds required to execute a block using various ways of measuring time using the messages ``userTime``, ``systemTime``, ``cpuTime``, and ``real-Time``.

    * One can profile the execution of a block using the messages ``profile`` and ``flatProfile``. ``profile`` prints out the source level call graph annotated with call site and timing information	whereas ``flatProfile`` prints out a flat profile sorted by module.

    * The message ``countSends`` will collect lookup statistics during a block execution.

Any object that inherits from the lobby can be passed to a method that expects a block; behavior in ``defaultBehavior`` makes the object behave like a block that evaluates to that object.

Module: block


..  rubric:: Footnotes

.. [#f1]