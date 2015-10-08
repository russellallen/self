.. _building-a-world:

How to build the world
======================

    Last updated 5 January 2014 for Self 4.5.0

Should you need to reconstruct a world from the source files, here’s how to do it. This section describes
how to create a default object world by reading in the Self source code distributed through the `GitHub repository`_. You can also do this after writing the world out using the transporter (``transporter fileOut fileOutAll``).

.. _GitHub repository: https://github.com/russellallen/self

To create the default object world, change your current working directory to the ``objects`` subdirectory of the Self source release and follow these steps:

1. Start the Self VM:

    ::

        % Self
        Self Virtual Machine Version 4.1.13, Sat 04 Jan 14 12:17:37 Mac OS X i386 (4.4-268-g58a0717)
        Copyright 1989-2003: The Self Group (type _Credits for credits)

        VM#

2. (Optional, but recommended.) Start the spy so you can watch the world fill up with objects:

    ::

        VM# _Spy: true

    .. note::

        you must use the primitive to do this because the world is empty

3. Read in the default world. To do this, ask Self to read expressions from a file:

    ::

        VM# 'worldBuilder.self' _RunScript

    Unless you have asked Self not to print script names, you should see something like:

    ::

        Reading worldBuilder.self...
        reading ./core/init.self...
        reading ./core/allCore.self...
        reading ./core/systemStructure.self...
        . . .

4. At various places, you will be asked if you wish to add optional additions to the base system, such as the morphic user interface (UI2) or the earlier UI1 (which requires X11 to run):

    ::

        Load UI2 (Morphic)? (y/N)
        > y

5. After all the files have been read in, Self will start the process scheduler, initialize its module cache, and print:

    ::

        “Self 0”

    That last line is the Self prompt indicating that the system is ready to read and evaluate expressions.

6. If you have loaded Morphic, you may wish to open up a window:

    ::

        "Self 0" desktop open
        Adjusting VM for better UI2 performance:
        _MaxPICSize: 25
        _Flush

        The ui2 desktop is now running. Type:
        "desktop stop"  to suspend it,
        "desktop go"    to resume it after stopping, and
        "desktop close" to close it.

        desktop
        "Self 1"

