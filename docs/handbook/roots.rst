The Roots of Behavior
=====================

Default Behavior
----------------

Certain common behavior is shared by nearly all objects in the Self world. This basic behavior is
defined in the ``defaultBehavior`` slot of the lobby and includes:

    * identity comparisons (== and !==)
    * inequality (!=)
    * default behavior for printing (reimplement printString in descendants)
    * mirror creation (reflect:)
    * support for point, and list construction (@ and &)
    * behavior that allows blocks to ignore extra arguments
    * behavior that allows an object to behave like a block that evaluates to that object (this permits a non-block object to be passed to a method that expects a block)
    * behavior that allows an object to be its own key in a collection (key)
    * default behavior for doubly-dispatched messages
    * behavior for printing error messages and stack dumps (error: and halt)

It is important to note that not all objects in the system inherit this default behavior. It is entirely
permissible to construct objects that do not inherit from the lobby, and the Self world contains
quite a few such objects. For example, the objects used to break a namespace into separate categories
typically do not inherit from the lobby. Any program intended to operate on arbitrary objects,
such as a debugger, must therefore assume that the objects it manipulates do not understand even
the messages in ``defaultBehavior``.

Modules: defaultBehavior, errorHandling

The Root Traits: Traits Clonable and Traits Oddball
---------------------------------------------------

Most concrete objects in the Self world are descendants of one of two top-level traits objects:
``traits clonable`` and ``traits oddball``. The distinction between the two is based on whether
or not the object is *unique*. For example, ``true`` is a unique object. There is only one ``true`` object in
the entire system, although there are many references to it. On the other hand, a list object is not
unique. There may be many lists in the system, each containing different elements. A unique object
responds to the message ``copy`` by returning itself and uses identity to test for equality. The general
rule is:

    * unique objects usually inherit from ``traits oddball``
    * non-unique objects usually inherit from ``traits clonable``

Module: rootTraits

Mixins
------

Like traits objects, mixin objects encapsulate a bundle of shared behavior. Unlike traits objects,
however, mixin objects are generally parentless to allow their behavior to be added to an object
without necessarily also adding unwanted behavior (such as access to the lobby namespace). Mixins
are generally used in objects that also have other parents. An example is ``mixins identity``.

The Identity Mixin
------------------

Two objects are usually tested for equality based on whether they have “the same value” within a
common domain. For example, ``3.0 = 3`` within the domain of numbers, even though they are not
the same object or even the same kind of object. In some domains, however, two objects are equal
if and only if they are the exact same object. For example, even two process objects with the same
state are not considered equal unless they are identical. In such cases, identity comparison is used
to implement equality tests, and ``mixins identity`` can be mixed in to get the desired behavior.

Module: rootTraits
