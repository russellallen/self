World Organization
==================

The Lobby
---------

The lobby object is thus named because it is where objects enter the Self world. For example,
when a script that creates a new object is read into the system, all expressions in that script are evaluated
in the context of the lobby. That is, the lobby is the receiver of all messages sent to “self” by
expressions in the script. To refer to some existing object in a script, the object must be accessible
by sending a message to the lobby. For example, the expression::

					_AddSlots: ( | newObject = ( | entries <- list copy ... | ) | )

requires that the message ``list`` be understood by the lobby (the implicit receiver of the message)
so that the ``entries`` slot of the new object can be initialized. The lobby slots ``traits``, ``globals``,
and ``mixins`` are the roots of the object namespaces accessible from the lobby. The organization of
these namespaces is described in the next section. The slot ``lobby`` allows the lobby itself to be referred
by name.

The lobby also has a number of other functions: it is the location of the default behavior inherited
by most objects in the system (slot ``defaultBehavior``).

Names and Paths
---------------

For convenience, the lobby’s namespace is broken into three pieces, implemented as separate objects
rooted at the lobby:

	traits
		objects that encapsulate shared behavior. Typically, each prototype object has an associated traits object of the same name that describes the shared part of its behavior.

	globals
		prototypical objects and one-of-a-kind objects (“oddballs”)

	mixins
		small, parentless bundles of behavior designed to be “mixed into” some other object

Each of these namespace objects is categorized to aid navigation.

For example, to find the parent of the prototype list object, one could start with the ``globals`` slot
of the lobby, then get the ``list`` slot of that object, and then the ``parent`` slot of the list. The sequence
of slot names, ``globals list parent`` is called a *path* and constitutes the list parent’s
*full name*. Parent slots can be omitted from an object’s full name, since the slots in a parent are visible
in the child via inheritance. A path with parent slots omitted forms the *short name* for an object.
For example, the short name for the list parent is simply ``list parent``.

Non-parent slots are used when it is desirable to keep a part of the name space distinct. For example,
the ``traits`` slot of the lobby is not a parent slot. This allows a convention that gives prototypes
and their associated traits objects similar names: a prototype and its associated traits object have
the same local name, but the prototype is placed in a slot in the ``globals`` object, whereas the traits
of the prototype is placed in a slot in the ``traits`` object. Since the ``traits`` slot of the lobby is not
a parent slot, the name of the traits object must start with the prefix ``traits``. The ``globals`` slot,
on the other hand, is a parent slot, so the name of a prototype object needs no prefix. Thus, ``list``
refers to the prototype list while ``traits list`` refers to its traits object for lists.

As a matter of style, programs should refer to objects by the shortest possible name. This makes it
easier to re-organize the global namespace as the system evolves. (If programs used full path
names, then many more names would have to be updated to reflect changes to the namespace organization,
a tedious chore.)
