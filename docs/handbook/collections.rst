Collections
===========

::

    clonable
        collection
            ... collection hierarchy ...

Collections are containers that hold zero or more other objects. In Self, collections behave as if
they have a key associated with each value in the collection. Collections without an obvious key,
such as lists, use each element as both key and value. Iterations over collections always pass both
the value and the key of each element (in that order) to the iteration block. Since Self blocks ignore
extra arguments, this allows applications that don’t care about keys to simply provide a block
that takes only one argument.

Collections have a rich protocol. Additions are made with ``at:Put:``, or with ``add:`` or ``addAll:`` for
implicitly keyed collections. Iteration can be done with do: or with variations that allow the programmer
to specify special handling of the first and/or last element. ``with:Do:`` allows pairwise iteration
through two collections. The ``includes:``, ``occurrencesOf:``, and ``findFirst:``
``IfPresent:IfAbsent:`` messages test for the presence of particular values in the collection.
``filterBy:Into:`` creates a new collection including only those elements that satisfy a predicate
block, while ``mapBy:Into:`` creates a new collection whose elements are the result of applying the
argument block to each element of the original collection.

Abstract collection behavior is defined in traits collection. Only a small handful of operations need
be implemented to create a new type of collection; the rest can be inherited from ``traits collection``.
(See the ``descendantResponsibility`` slot of ``traits collection``.) The following
sections discuss various kinds of collection in more detail.

Modules: collection (abstract collection behavior)

Indexable Collections
---------------------

::

    collection
        indexable
            mutableIndexable
                byteVector
                    ...the string hierarchy
                sequence
                    sortedSequence
                vector

Indexable collections allow random access to their elements via keys that are integers. All sequences
and vectors are indexable. The message ``at:`` is used to retrieve an element of an indexable collection
while ``at:Put:`` is used to update an element of a ``mutableIndexable`` collection (other
than a ``sortedSequence``).

Modules: indexable, abstractString, vector, sequence, sortedSequence

Strings, Characters, and Paragraphs
-----------------------------------

::

    collection
        ...
        byteVector
            string
                mutableString
                immutableString
                    canonicalString

A string is a vector whose elements are character objects. There are three kinds of concrete string:
immutable strings, mutable strings and canonical strings. ``traits string`` defines the behavior
shared by all strings. A character is a string of length one that references itself in its sole indexable
slot.

Mutable strings can be changed using the message ``at:Put:``, which takes a character argument, or
``at:PutByte:``, which takes an integer argument. An immutable string cannot be modified, but
sending it the ``copyMutable`` message returns a mutable string containing the same characters.

Canonical strings are registered in an table inside the virtual machine, like Symbol objects in
Smalltalk or atoms in LISP. The VM guarantees that there is at most one canonical string for any
given sequence of bytes, so two canonical strings are equal (have the same contents) if and only if
they are identical (are the same object). This allows efficient equality checks between canonical
strings. All message selectors and string literals are canonical strings, and some primitives require
canonical strings as arguments. Sending ``canonicalize`` to any string returns the corresponding
canonical string.

Character objects behave like immutable strings of length one. There are 256 well-known character
objects in the Self universe. They are stored in a 256-element vector named ``ascii``, with each
character stored at the location corresponding to its ASCII value. Characters respond to the message
``asByte`` by returning their ASCII value (that is, their index in ``ascii``). The inverse of ``asByte``,
``asCharacter``, can be sent to an integer between 0 and 255 to obtain the corresponding
character object.

Module: string

Unordered Sets and Dictionaries
-------------------------------

::

    collection
        setOrDictionary
            set
                sharedSet
            dictionary
                sharedDictionary

There are two implementations of sets and dictionaries in the system. The one described in this
section is based on hash tables. The one discussed in the following section is based on sorted binary
trees. The hash table implementation has better performance over a wide range of conditions.
(An unfortunate ordering of element addtions can cause the unbalanced trees used in the tree version
to degenerate into an ordered lists, resulting in linear access times.)

A set behaves like a mathematical set. It contains elements without duplication in no particular order.
A dictionary implements a mapping from keys to values, where both keys and values are arbitrary
objects. Dictionaries implement the usual collection behavior plus keyed access using ``at:``
and ``at:Put:`` and the dictionary-specific operations ``includesKey:`` and ``removeKey:``. In order
to store an object in a set or use it as a dictionary key, the object must understand the messages
``hash`` and ``=``, the latter applying to any pair of items in the collection. This is because sets and dictionaries
are implemented as hash tables.

Derived from set and dictionary are ``sharedSet`` and ``sharedDictionary``. These provide locking
to maintain internal consistency in the presence of concurrency.

Modules: setAndDictionary, sharedSetAndDictionary

Tree-Based Sets and Dictionaries
--------------------------------

::

    collection
        tree
            treeNodes abstract
                treeNodes bag
                treeNodes set
            emptyTrees abstract
                emptyTrees bag
                emptyTrees set

``treeSet`` and ``treeBag`` implement sorted collections using binary trees. The set variant ignores
duplicates, while the bag variant does not. Tree sets and bags allow both explicit and implicit keys
(that is, adding elements can be done with either ``at:Put:`` or ``add:``), where a tree set that uses
explicit keys behaves like a dictionary. Sorting is done on explicit keys if present, values otherwise,
and the objects sorted must be mutually comparable. Comparisons between keys are made using
``compare:IfLess:Equal:Greater:``.

The implementation of trees uses dynamic inheritance to distinguish the differing behavior of empty
and non-empty subtrees. The prototype ``treeSet`` represents an empty (sub)tree; when an element
is added to it, its parent is switched from ``traits emptyTrees set``, which holds behavior
for empty (sub)trees, to a new copy of ``treeSetNode``, which represents a tree node holding an element.
Thus, the ``treeSet`` object now behaves as a ``treeSetNode`` object, with right and left subtrees
(initially copies of the empty subtree ``treeSet``). Dynamic inheritance allows one object to
behave modally without using clumsy if-tests throughout every method.

One caveat: since these trees are not balanced, they can degenerate into lists if their elements are
added in sorted order. However, a more complex tree data structure might obscure the main point
of this implementation: to provide a canonical example of the use of dynamic inheritance.

Modules: tree

Lists and PriorityQueues
------------------------

::

    collection
        list
        priorityQueue

A list is an unkeyed, circular, doubly-linked list of objects. Additions and removals at either end
are efficient, but removing an object in the middle is less so, as a linear search is involved.

A priorityQueue is an unkeyed, unordered collection with the property that the element with the
highest priority is always at the front of the queue. Priority queues are useful for sorting (heapsort)
and scheduling. The default comparison uses <, but this can be changed.

Modules: list. priorityQueue

Constructing and Concatenating Collections
------------------------------------------

::

    clonable
        collector

Two kinds of objects play supporting roles for collections. A ``collector`` object is created using
the & operator (inherited from ``defaultBehavior``), and represents a collection under construction.
The & operator provides a concise syntax for constructing small collections. For example::

    (1 & ’abc’ & x) asList

constructs a list containing an integer, a string, and the object x. A ``collector`` object is not itself
a collection; it is converted into one using a conversion message such as ``asList``, ``asVector``, or
``asString``.

Modules: collector
