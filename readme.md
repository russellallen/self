Self
====

This is the main repository for the Self programming language and environment.

The Self homepage is at http://selflanguage.org

Please go there for prebuilt binaries for Mac OS X and Linux, documentation,
blogs and forums.

Building a Self VM
------------------

To build a Self VM, you need [CMake][1] in at least version 2.8.

  * You can do an in-tree build with

        cmake .
        cmake --build . 

    or an out-of-tree build with

        mkdir -p $YOUR_BUILD_DIRECTORY; cd $YOUR_BUILD_DIRECTORY
        cmake $DIRECTORY_OF_SELF_CHECKOUT
        cmake --build $YOUR_BUILD_DIRECTORY

  * Self builds with [GCC][2] ≥ 4.2 or [Clang][3] ≥ 2.0. CMake respects
    your environment variables, so to build Self with Clang, configure it 
    like this:

        CC=clang CXX=clang++ cmake $DIRECTORY_OF_SELF_CHECKOUT

  * On Mac OS X with Xcode, you can use the Xcode generator of CMake like this:

        cmake -GXcode $DIRECTORY_OF_SELF_CHECKOUT

  * On 64bit Linux, you may want to explicitly use 32bit compilation:

        CC="gcc -m32" CXX="g++ -m32" cmake $DIRECTORY_OF_SELF_CHECKOUT

    The same holds for Clang.
  * You may whish to use `ccmake` or the CMake GUI (`cmake-gui` or the 
    CMake .app on OS X) to configure available features like
    Release/Debug/Profiled builds or to enable experimental features.

[1]: http://www.cmake.org/ (CMake, the cross-platform, open-source build system)
[2]: http://gcc.gnu.org/ (GCC, the GNU Compiler Collection)
[3]: http://clang.llvm.org/ (clang: a C language family frontend for LLVM)
