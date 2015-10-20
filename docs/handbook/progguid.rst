****************************
A Guide to Programming Style
****************************

This section discusses some programming idioms and stylistic conventions that have evolved in the
Self group. Rather than simply presenting a set of rules, an attempt has been made to explain the
reasons for each stylistic convention. While these conventions have proven useful to the Self
group, they should be taken as guidelines, not commandments. Self is still a young language, and
it is likely that its users will continue to discover new and better ways to use it effectively.

Behaviorism versus Reflection
=============================

One of the central principles of Self is that an object is completely defined by its behavior: that
is, how it responds to messages. This idea, which is sometimes called *behaviorism*, allows one object
to be substituted for another without ill effect—provided, of course, that the new object’s behavior
is similar enough to the old object’s behavior. For example, a program that plots points in a
plane should not care whether the points being plotted are represented internally in cartesian or polar
coordinates as long as their external behavior is the same. Another example arises in program
animation. One way to animate a sorting algorithm is to replace the collection being sorted with an
object that behaves like the original collection but, as a side effect, updates a picture of itself on the
screen each time two elements are swapped. behaviorism makes it easier to extend and reuse programs,
perhaps even in ways that were not anticipated by the program’s author.

It is possible, however, to write non-behavioral programs in Self. For example, a program that examines
and manipulates the slots of an object *directly*, rather than via messages, is not behavioral
since it is sensitive to the internal representation of the object. Such programs are called *reflective*,
because they are reflecting on the objects and using them as data, rather than using the objects to
represent something else in the world. Reflection is used to talk about an object rather that talking
to it. In Self, this is done with objects called *mirrors*. There are times when reflection is unavoidable.
For example, the Self programming environment is reflective, since its purpose is to let the
programmer examine the structure of objects, an inherently reflective activity. Whenever possible,,
however, reflective techniques should be avoided as a matter of style, since a reflective program
may fail if the internal structure of its objects changes. This places constraints on the situations in
which the reflective program can be reused, limiting opportunities for reuse and making program
evolution more difficult. Furthermore, reflective programs are not as amenable to automatic analysis
tools such as application extractors or type inferencers.

Programs that depend on object *identity* are also reflective, although this may not be entirely obvious.
For example, a program that tests to see if an object is identical to the object ``true`` may not
behave as expected if the system is later extended to include fuzzy logic objects. Thus, like reflection,
it is best to avoid using object identity. One exception to this guideline is worth mentioning.
When testing to see if two collections are equal, observing that the collections are actually the
same object can save a tedious element-by-element comparison. This trick is used in several places
in the Self world. Note, however, that object identity is used only as a hint; the correct result will
still be computed, albeit more slowly, if the collections are equal but not identical.

Sometimes the implementation of a program requires reflection. Suppose one wanted to write a
program to count the number of unique objects in an arbitrary collection. The collection could, in
general, contain objects of different, possibly incomparable, types. In Smalltalk, one would use an
IdentitySet to ensure that each object was counted exactly once. IdentitySets are reflective, since
they use identity comparisons. In Self, the preferred way to solve this problem is to make the reflection
explicit by using mirrors. Rather than adding objects to an IdentitySet, mirrors on the objects
would be added to an ordinary set. This substitution works because two mirrors are equal if
and only if their reflectees are identical.

In short, to maximize the opportunities for code reuse, the programmer should:

    * avoid reflection when possible,
    * avoid depending on object identity except as a hint, and
    * use mirrors to make reflection explicit when it is necessary.

Objects Have Many Roles
=======================

Objects in Self have many roles. Primarily, of course, they are the elements of data and behavior
in programs. But objects are also used to factor out shared behavior, to represent unique objects, to
organize objects and behavior, and to implement elegant control structures. Each of these uses are
described below.

Shared Behavior
---------------

Sometimes a set of objects should have the same behavior for a set of messages. The slots defining
this *shared behavior* could be replicated in each object but this makes it difficult to ensure the objects
continue to share the behavior as the program evolves, since the programmer must remember
to apply the same changes to all the objects sharing the behavior. Factoring out the shared behavior
into a separate object allows the programmer to change the behavior of the entire set of objects simply
by changing the one object that implements the shared behavior. The objects that share the
behavior inherit it via parent slots containing (references to) the shared behavior object.

By convention, two kinds of objects are used to hold shared behavior: *traits* and *mixins*. A traits
object typically has a chain of ancestors rooted in the lobby. A mixin object typically has no parents,
and is meant to be used as an additional parent for some object that already inherits from the
lobby.

One-of-a-kind Objects (Oddballs)
--------------------------------

Some objects, such as the object ``true``, are unique; it is only necessary to have one of them in the
system. (It may even be important that the system contain *exactly* one of some kind of object.) Objects
playing the role of unique objects are called *oddballs*. Because there is no need to share the
behavior of an oddball among many instances, there is no need for an oddball to have separate
traits and prototype objects. Many oddballs inherit a ``copy`` method from ``traits oddball`` that
returns the object itself rather than a new copy, and most oddballs inherit the global namespace and
default behavior from the lobby.

Inline Objects
--------------

An inline object is an object that is nested in the code of a method object. The inline object is usually
intended for localized use within a program. For example, in a finite state machine implementation,
the state of the machine might be encoded in a selector that would be sent to an inline object
to select the behavior for the next state transition::

    state sendTo: (|
            inComment: c = ( c = '"' ifTrue: [state: 'inCode']. self ).
            inCode: c = ( c = '"' ifTrue: [state: 'inComment']
                    False: ... )
        |)
        With: nextChar

In this case, the inline object is playing the role of a case statement.

Another use of inline objects is to return multiple values from a method, as discussed in section
`How to Return Multiple Values`_. Yet another use of inline objects is to parameterize the behavior of some other object. For example,
the predicate used to order objects in a *priorityQueue* can be specified using an inline
object::

    queue: priorityQueue copyRemoveAll.
    queue sorter: (| element: e1 Precedes: e2 = ( e1 > e2 ) |).

(A block cannot be used here because the current implementation of Self does not support non-
LIFO blocks, and the sorter object may outlive the method that creates it). There are undoubtedly
other uses of inline objects. Inline objects do not generally inherit from the lobby.

Naming and Printing
===================

When debugging or exploring in the Self world, one often wants to answer the question: “what is
that object?” The Self environment provides two ways to answer that question. First, many objects
respond to the ``printString`` message with a textual description of themselves. This string
is called the object’s *printString*. An object’s printString can be quite detailed; standard protocol
allows the desired amount of detail to be specified by the requestor. For example, the printString
for a collection might include the printStrings of all elements or just the first few. Not all objects
have printStrings, only those that satisfy the criteria discussed in section `How to make an object print`_ below.

The second way to describe an object is to give its *path name*. A path name is a sequence of unary
selectors that describes a path from the lobby to the object. For example, the full path name of the
prototype list is “globals list.” A path name is also an expression that can be evaluated (in the context
of the lobby) to produce the object. Because “globals” is a parent slots, it can be omitted from
this path name expression. Doing this yields the short path name “list.” Not all objects have path
names, only those that can be reached from the lobby. Such objects are called *well-known*.

How objects are printed
-----------------------

When an expression is typed at the prompt, it is evaluated to produce a result object. The prompt
then creates a mirror on this result object and asks the mirror to produce a name for the object. (A
mirror is used because naming is reflective.) The object’s creator path annotation provides a hint
about the path from the lobby to either the object itself or its prototype. If the object is a clone “a”
or “an” is prepended to its prototype’s creator path. In addition to its path, the mirror also tries to
compute a ``printString`` for the object if it is annotated as ``isComplete``. Then, the two pieces of
information are merged. For example, the name of the prototype list is “list” but the name of ``list copy add: 17``
is “a list(17).” See the naming category in mirror traits for the details of this process.

How to make an object print
---------------------------

The distinction between objects that hold shared behavior (traits and mixin objects) and concrete
objects (prototypes, copies of prototypes, and oddballs) is purely a matter of convention; the Self
language makes no such distinction. While this property (not having special kinds of objects) gives
Self great flexibility and expressive power, it leads to an interesting problem: the inability to distinguish
behavior that is ready for immediate use from that which is defined only for the benefit of
descendant objects. Put another way: Self cannot distinguish those objects playing the role of
classes from those playing the role of instances.

The most prominent manifestation of this problem crops up in object printing. Suppose one wishes
to provide the following printString method for all point objects::

    printString = ( x printString, ’@’, y printString )

Like other behavior that applies to all points, the method should be put in point traits. But what
happens if ``printString`` is sent to the object ``traits point``? The ``printString`` method is
found but it fails when it attempts to send x and y to itself because these slots are only defined in
point objects (not the ``traits point`` object). Of course there are many other messages defined in
``traits point`` that would also fail if they were sent to ``traits point`` rather than to a point
object. The reason printing is a bigger problem is that it is useful to have a general object printing
facility to be used during debugging and system exploration. To be as robust as possible, this printing
facility should not send ``printString`` when it will fail. Unfortunately, it is difficult to tell
when ``printString`` is likely to fail. Using reflection, the facility can avoid sending
``printString`` to objects that do not define ``printString``. But that is not the case with ``traits point``.
The solution taken in this version of the system is to mark printable objects with a special
annotation. The printing facility sends ``printString`` to the object only if the object contains an
annotation ``isComplete``.

The existence of an ``isComplete`` annotation in an object means that the object is prepared to print
itself. The object agrees to provide behavior for a variety of messages; see the programming environment
manual for more details.

How to Return Multiple Values
=============================

Sometimes it is natural to think of a method as returning several values, even though Self only
allows a method to return a single object. There are two ways to simulate methods that return
multiple values. The first way is to use an inlined object. For example, the object::

    (| p* = lobby. lines. words. characters |)

could be used to package the results of a text processing method into a single result object::

    count = (
        | r = (| p* = lobby. lines. words. characters |) ... |
        ...
        r: r copy.
        r lines: lCount. r words: wCount. r characters: cCount.
        r )

.. note::

    that the inline object prototype inherits copy from the lobby. If one omitted its parent slot p, one would have to
    send it the _Clone primitive to copy it. It is considered bad style, however, to send a primitive directly, rather than calling
    the primitive’s wrapper method.

The sender can extract the various return values from the result object by name.

The second way is to pass in one block for each value to be returned. For example::

    countLines:[| :n | lines: n ]
        Words:[| :n | words: n ]
        Characters:[| :n | characters: n ]

Each block simply stores its argument into the a local variable for later use. The
``countLines:Words:Characters:`` method would evaluate each block with the appropriate
value to be returned::

    countLines: lb Words: wb Characters: cb = (
        ...
        lb value: lineCount.
        wb value: wordCount.
        cb value: charCount.
        ...

Substituting Values for Blocks
==============================

The lobby includes behavior for the block evaluation messages. Thus, any object that inherits from
the lobby can be passed as a parameter to a method that expects a block—the object behaves like
a block that evaluates that object. For example, one may write::

    x >= 0 ifTrue: x False: x negate

rather than::

    x >= 0 ifTrue: [ x ] False: [ x negate ]

.. note::

        however, that Self evaluates all arguments before sending a message. Thus, in the first case
        “x negate” will be evaluated regardless of the value of x, even though that argument will not be
        used if x is nonnegative. In this case, it doesn’t matter, but if “x negate” had side effects, or if it
        were very expensive, it would be better to use the second form.

In a similar vein, blocks inherit default behavior that allows one to provide a block taking fewer
arguments than expected. For example, the collection iteration message ``do:`` expects a block taking
two arguments: a collection element and the key at which that element is stored. If one is only
interested in the elements, not the keys, one can provide a block taking only one argument and the
second block argument will simply be ignored. That is, you can write::

    myCollection do: [| :el | el printLine]

instead of::

    myCollection do: [| :el. :key | el printLine]

``nil`` Considered Naughty
==========================

As in Lisp, Self has an object called nil, which denotes an undefined value. The virtual machine
initializes any uninitialized slots to this value. In Lisp, many programs test for nil to find the end
of a list, or an empty slot in a hash table, or any other undefined value. There is a better way in
Self. Instead of testing an object’s identity against ``nil``, define a new object with the appropriate
behavior and simply send messages to this object; Self’s dynamic binding will do the rest. For example,
in a graphical user interface, the following object might be used instead of nil::

    nullGlyph = (|
            display = ( self ).
            boundingBox = (0@0) # (0@0).
            mouseSensitive = false.
    |)

To make it easier to avoid nil, the methods that create new vectors allow you to supply an alternative
to ``nil`` as the initial value for the new vector’s elements (e.g., ``copySize:FillingWith:``).

Hash and \=
===========

Sets and dictionaries are implemented using hash tables. In order for an object to be eligible for inclusion
in a set or used as a key in a dictionary, it must implement both ``=`` and ``hash``. (``hash`` maps
an object to a ``smallInt``.) Further, ``hash`` must be implemented in such a way that for objects ``a`` and
``b``, (``a = b``) implies (``a hash = b hash``). The behavior that sets disallow duplicates and
dictionaries disallow multiple entries with the same key is dependent upon the correct implementation
of hash for their elements and keys. Finally, the implementation of sets (and dictionaries)
will only work if the hash value of the objects in the set do not change while the objects are in the
set (dictionary). This may complicate managing sets of mutable objects, since if the hash value
depends on the mutable state, the objects can not be allowed to mutate while in the set.

Of course, a trivial hash function would simply return a constant regardless of the contents of the
object. However, for good hash table performance, the hash function should map different objects
to different values, ideally distributing possible object values as uniformly as possible across the
range of small integers.

Equality, Identity, and Indistinguishability
============================================

Equality, identity, and indistinguishability are three related concepts that are often confused. Two
objects are ``equal`` if they “mean the same thing”. For example, 3 = 3.0 even though they are different
objects and have different representations. Two objects are ``identical`` if and only if they are
the same object. (Or, more precisely, two references are identical if they refer to the same object.)
The primitive _Eq: tests if two objects are identical. Finally, two objects are ``indistinguishable`` if
they have exactly the same behavior for every possible sequence of non-reflective messages. The
binary operator “==” tests for indistinguishability. Identity implies indistinguishability which implies
equality.

It is actually not possible to guarantee that two different objects are indistinguishable, since reflection
could be used to modify one of the objects to behave differently after the indistinguisability
test was made. Thus, == is defined to mean identity by default. Mirrors, however, override this default
behavior; (``m1 == m2``) if (``m1 reflectee`` _Eq: ``m2 reflectee``). This makes it appear
that there is at most one mirror object for each object in the system. This illusion would break
down, however, if one added mutable state to mirror objects.
