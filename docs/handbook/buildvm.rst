.. _building-a-vm:

Building a VM
=============

    Last updated 3 February 2014 for Self 4.5.0

The sources for the Self VM are on the `GitHub repository`_.

Requirements
------------

On Mac OS X you will need XCode, version 4 or higher, with the command line tools installed and `CMake`_ in at least version 2.8. `CMake`_ can be easily installed using the `Brew`_ package manager.

On Linux you will generally need the appropriate libraries for Git, CMake, a GCC or Clang toolchain, X and Ncurses. For example, on Fedora 19 you will need: git cmake gcc gcc-c++ glibc-devel.i686 libstdc++-devel libstdc++-devel.i686 libX11-devel.i686 libXt-devel.i686 libXext-devel.i686 libXrender-devel.i686 libXau-devel.i686 libxcb-devel.i686 ncurses-devel.i686 ncurses-libs.i686

.. _GitHub repository: https://github.com/russellallen/self
.. _CMake: http://www.cmake.org/
.. _GCC: http://gcc.gnu.org/
.. _Clang: http://clang.llvm.org/
.. _Brew: http://brew.sh

Self builds with `GCC`_ ≥ 4.2 or `Clang`_ ≥ 2.0.

Building
--------

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

You may wish to use ``ccmake`` or the CMake GUI (``cmake-gui`` or the CMake.app on OS X) to configure available features like Release/Debug/Profiled builds or to enable experimental features.

