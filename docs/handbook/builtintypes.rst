Built-in types
==============

There are a small number of built-in types that are directly supported through primitives and syntax:

    *Integers* and *floats* are provided with primitives for performing arithmetic operations, comparisons etc.

    *Strings* have a *byte vector* part for storing the characters. Special string primitives are provided.

    *Blocks* are objects which combine code with an environment link. Used for control structures, they are described in section :ref:`langref-blocks`.

In addition, there are a number of VM-supported types described in the sections on the Self World
and the VM reference manual, such as *mirrors*, *processes*, *vectors*, *proxies* and *profilers*.
