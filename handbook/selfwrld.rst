**************
The Self World
**************

The default Self world is a set of useful objects, including objects that can be used in application
programs (e.g., integers, strings, and collections), objects that support the programming environment
(e.g., the debugger), and objects that simply are used to organize the other objects. This document
describes how this world is organized, focusing primarily on those objects meant for use in
Self programs. It does not discuss the objects used to implement system facilities—for example,
there is no discussion of the objects used to implement the graphical user interface—nor does it
discuss how to use programming support objects such as the command history object; such tools
are described in The Self User’s Manual.

The reader is assumed to be acquainted with the Self language, the use of multiple inheritance,
the use of traits objects and prototype objects, and the organizing principles of the Self world as
discussed in :ref:`[UCC91] <citations>`.

.. toctree::

   worldorg.rst
   roots.rst
   blocks.rst
   numbers.rst
   collections.rst
   pairs.rst
   mirrors.rst
   messages.rst
   processes.rst
   foreign.rst
   unix.rst
   oddball.rst
   buildworld.rst
   lowlevel.rst
   textdebug.rst


