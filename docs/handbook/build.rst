.. _building-the-system:

Building the Self system
========================

   Last updated 23 September 2024 for Self 2024.1

It is relatively easy to build the two key components of Self, the Self World and the Self Virtual Machine. They both start from downloading the Self sources from the GitHub repository by the following git command::

  git clone https://github.com/russellallen/self/

and then follow the instructions below.

Building a VM
-------------

Requirements
~~~~~~~~~~~~

In general, you will generally need the appropriate libraries for Git, CMake, a GCC or Clang toolchain, X and Ncurses. Self is a 32bit program at the moment, so you will need all libraries in 32bit versions.

On Fedora 19 you will need: git cmake gcc gcc-c++ glibc-devel.i686 libstdc++-devel libstdc++-devel.i686 libX11-devel.i686 libXt-devel.i686 libXext-devel.i686 libXrender-devel.i686 libXau-devel.i686 libxcb-devel.i686 ncurses-devel.i686 ncurses-libs.i686

On Ubuntu 16.04 you will need: git cmake g++ gcc-multilib g++-multilib libx11-dev:i386 libxext-dev:i386 libncurses-dev:i386 libtinfo-dev:i386

.. _GitHub repository: https://github.com/russellallen/self
.. _CMake: http://www.cmake.org/
.. _GCC: http://gcc.gnu.org/
.. _Clang: http://clang.llvm.org/
.. _Brew: http://brew.sh

Self builds with `GCC`_ ≥ 4.2 or `Clang`_ ≥ 2.0.

Building
~~~~~~~~

You can do an in-tree build with::

    cmake .
    cmake --build .

or an out-of-tree build with::

    mkdir -p $YOU_BUILD_DIRECTORY; cd $YOU_BUILD_DIRECTORY
    cmake $DIRECTORY_OF_SELF_CHECKOUT
    cmake --build $YOU_BUILD_DIRECTORY

CMake respects your environment variables, so to build Self with Clang, configure it like this::

    CC=clang CXX=clang++ cmake $DIRECTORY_OF_SELF_CHECKOUT

On Mac OS X with Xcode, you can use the Xcode generator of CMake like this::

    cmake -GXcode $DIRECTORY_OF_SELF_CHECKOUT

On 64bit Linux, you may want to explicitly use 32bit compilation::

    CC="gcc -m32" CXX="g++ -m32" cmake $DIRECTORY_OF_SELF_CHECKOUT

The same holds for Clang.

You may wish to use ``ccmake`` or the CMake GUI (``cmake-gui``) to configure available features like Release/Debug/Profiled builds or to enable experimental features.

VM Builder Script
~~~~~~~~~~~~~~~~~

There is a python script for building the VM in various OS instances using QEMU at `https://github.com/russellallen/Self-VM-Builder`  which may provide help on how to build the VM.

How to build the world
----------------------

Should you need to reconstruct a world from the source files, here’s how to do it. This section describes
how to create a default object world by reading in the Self source code distributed through the `GitHub repository`_. You can also do this after writing the world out using the transporter (``transporter fileOut fileOutAll``).

.. _GitHub repository: https://github.com/russellallen/self

From within the main Self tree
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

To create the default object world, change your current working directory to the ``objects`` subdirectory of the Self source release and follow these steps:

1. Start the Self VM::

    % Self
    Self Virtual Machine Version 4.1.13, Sat 04 Jan 14 12:17:37 Mac OS X i386 (4.4-268-g58a0717)
    Copyright 1989-2003: The Self Group (type _Credits for credits)

    VM#

2. (Optional, but recommended.) Start the spy so you can watch the world fill up with objects:

    ::

        VM# _Spy: true

    .. note::

        You must use the primitive to do this because the world is empty.

3. Read in the default world. To do this, ask Self to read expressions from a file:

    ::

        VM# 'worldBuilder.self' _RunScript


From outside the main tree
~~~~~~~~~~~~~~~~~~~~~~~~~~

When developing applications which aren't part of the main Self distribution, it is often convenient to build a Self world from a directory other than the default directory. You can specify on the command line where the main Self distribution is and the options. For example the below builds the world with morphic and also ui1. Use ``-o none`` to build without any graphics.

    ::

        % Self -f /path/to/Self/objects/worldBuilder.self   \
               -b /path/to/Self/objects                     \
               -o morphic,ui1
               

Finishing the build
~~~~~~~~~~~~~~~~~~~


Once you have started the ``worldBuilder.self`` script, you will be given options as to which features you would like in your new world.

1.    Unless you have asked Self not to print script names, you should see something like:

    ::

        Reading worldBuilder.self...
        reading ./core/init.self...
        reading ./core/allCore.self...
        reading ./core/systemStructure.self...
        . . .


2. Unless you have specified the options on the command line, then at various places, you will be asked if you wish to add optional additions to the base system, such as the morphic user interface (UI2) or the earlier UI1 (which requires X11 to run):

    ::

        Load UI2 (Morphic)? (y/N)
        > y

3. After all the files have been read in, Self will start the process scheduler, initialize its module cache, and print:

    ::

        “Self 0”

    That last line is the Self prompt indicating that the system is ready to read and evaluate expressions.

4. If you have loaded Morphic, you may wish to open up a window:

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
