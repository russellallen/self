Mirrors
=======

	::
	
		collection
			mirror
				mirrors smallInt
				mirrors float
				mirrors vectorish
					mirrors vector
					mirrors byteVector
						mirrors canonicalString
						mirrors mirror
				mirrors block
				mirrors method
				mirrors blockMethod
					mirrors activation liveOnes
						mirrors activation
							mirrors deadActivation
							mirrors methodActivation
							mirrors blockMethodActivation
				mirrors process
				mirrors assignment
				mirrors slots
				mirrors profiler

Mirrors allow programs to examine and manipulate objects. (Mirrors get their name from the fact
that a program can use a mirror to examine—that is, reflect upon—itself.) A mirror on an object x
is obtained by sending the message ``reflect:`` x to any object that inherits ``defaultBehavior``.
The object x is called the mirror’s *reflectee*. A mirror behaves like a keyed collection whose keys
are slot names and whose values are mirrors on the contents of slots of the reflectee. A mirror can
be queried to discover the number and names of the slots in its reflectee, and which slots are parent
slots. A mirror can be used to add and remove slots of its reflectee. Iterating through a mirror enumerates
objects representing slots of the reflected object (such facets are called “fake” slots). For
example, a method mirror includes fake slots for the method’s byte code and literal vectors and elements
of vectors and byteVectors.

There is one kind of mirror for each kind of object known to the virtual machine: small integers,
floats, canonical strings, object and byte vectors, mirrors, blocks, ordinary and block methods, ordinary
and block method activations, processes, profilers, the assignment primitive, and ordinary
objects (called “slots” because an ordinary object is just a set of slots). The prototypes for these
mirrors are part of the initial Self world that exists before reading in any script files. The file
``init.self`` moves these prototypes to the ``mirrors`` subcategory of the ``prototypes`` category of
the ``lobby`` namespace. Because ``mirrors`` is not a parent slot, the names of the mirror prototypes
always include the ``“mirrors”`` prefix.

Modules: mirror, slot, init
