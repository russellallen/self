Foreign Objects
===============

::

    clonable
        proxy
            fctProxy
                foreignFct
        foreignCode

The low level aspects of interfacing with code written in other languages (via C or C++ glue code)
are described in :doc:`vmref` (:doc:`chapter <vmref>` :ref:`pp-vmref`). A number of objects in the Self
world are used to interface to foreign data objects and functions. These objects are found in the name spaces
``traits`` ``foreign``, and ``globals foreign``.

One difficulty in interfacing between Self and external data and functions is that references to foreign
data and functions from within Self can become obsolete when the Self world is saved as
a snapshot and then read in later, possibly on some other workstation. Using an obsolete reference
(i.e., memory address) would be disastrous. Thus, Self encapsulates such references within the
special objects ``proxy`` (for data references) and ``fctProxy`` (for function references). Such objects
are known collectively as *proxies*. A proxy object bundles some extra information along with the
memory address of the referenced object and uses this extra information to detect (with high probability)
any attempt to use an obsolete proxy. An obsolete proxy is called a *dead proxy*.

To make it possible to rapidly develop foreign code, the virtual machine supports dynamic linking
of this code. This makes it unnecessary to rebuild the virtual machine each time a small change is
made to the foreign code. Dynamic linking facilities vary from platform to platform, but the Self
interface to the linking facilities is largely system independent. The SunOS/Solaris dynamic link
interface is defined in the ``sunLinker`` object. However, clients should always refer to the dynamic
linking facilities by the name ``linker``, which will be initialized to point to the dynamic linker interface
appropriate for the current platform.

The ``linker``, ``proxy`` and ``fctProxy`` objects are rather low level and have only limited functionality.
For example, a fctProxy does not know which code file it is dependent on. The objects
``foreignFct`` and ``foreignCode`` establish a higher level and easier to use interface. ``A foreign-Code``
object represents an “object file” (a file with executable code). It defines methods for loading
and unloading the object file it represents. A ``foreignFct`` object represents a foreign routine. It
understands messages for calling the foreign routine and has associated with it a ``foreignCode``
object. The ``foreignFct`` and ``foreignCode`` objects cooperate with the linker, to ensure that
object files are transparently loaded when necessary and that ``fctProxies`` depending on an object
file are killed when the object file is unloaded, etc.

The ``foreignCodeDB`` object ensures that ``foreignCode`` objects are unique, given a path. It also
allows for specifying initializers and finalizers on ``foreignCode`` objects. An initializer is a foreign
routine that is called whenever the object file is loaded. Initializers take no arguments and do not
return values. Typically, they initialize global data structures. Finalizers are called when an object
file is unloaded. When debugging foreign routines, ``foreignCodeDB printStatus`` outputs a
useful overview.

Normal use of a foreign routine simply involves cloning a ``foreignFct`` object to represent the foreign
routine. When cloning it, the name of the function and the path of the object file is specified.
It is then not necessary to worry about ``proxy``, ``fctProxy`` and ``linker`` objects, etc. In fact, it is
recommended *not* to send messages directly to these objects, since this may break the higher level
invariants that ``foreignFct`` objects rely on.

Relevant oddballs:

  +----------------+----------------------------------------------------+
  | linker         | Dynamic linker for current platform.               |
  +----------------+----------------------------------------------------+
  | sunLinker      | Dynamic linker implementation for SunOS/Solaris.   |
  +----------------+----------------------------------------------------+
  | foreignCodeDB  | Registry for foreignCode objects.                  |
  +----------------+----------------------------------------------------+

Modules: foreign
