# Changes in the Self VM \*.\*.\* #

## *Shortlog* ##

  * Support for **Mac Classic**, and **MetroWerks** compiler  **removed**
  * Build process uses **CMake** now
  
  * Less files: 2022 (Makefiles/Xcode) → 1709 (CMake), that is -313 files
  * Less code: ca. 510,000 (130,000 w/o Self source) SLOC → ca. 499,00 (123,500 w/o Self source) SLOC, 
    that is ca. -11,000 (6,500 w/o Self source) SLOC
  
  * New supported compilers: **GCC** ≥ 4.2, **Clang**
  * Experimental Mac OS X support for Self as double-clickable Application
  
## New Features ##

  * [CLANG] Self can now be built with the Clang C++ compiler
  * [OSX] The experimental Cocoa launcher now supports asking for Snapshots. 
    [0c0c5a1]
  * [OSX] Self can be compiled on Mac OS 10.6, 10.7, and 10.8 [08544b3 et al.]
  * [VM] The VM can now be built with coverage data generation [f6de5d6]
  
## Removed Features ###

  * [VM] Mac OS pre-X, and the MetroWerks Compiler are gone. 
    [ed4495c, 4d476d9]
  * [VM] The ASSEMBLER, MANUFACTURER preprocessor macros have been removed
    [2820d73]
  * [Building] The `bin` directory no longer exists. See _Fate of the tools_ 
    below. This also means no dependency on `lex` anymore. [24c92b7]
  
## Build-Process ##

  * [VM] *The build-process is changed from hand-written Makefiles/
    hand-maintained Xcode projects to CMake.*
    * Centralizes Xcode- and Make-based compilation.
    * Feature-detection can warn early if libraries are missing and provides an
      unified way of finding the right include-directory- and library-flags.
    * Easy management of en/disabled VM features and configurations.
  * [vmDate] The Self VM identification string is now generated using a C++ 
    instead of an assembly file and includes git information, if applicable.
    [fb2b1ff]
  * [Assembler] Renamed all `.s` files to `.S` files, as most of them need 
    preprocessing. GCC then does the right thing™ with them.
  * [Assembler] Unified GNU/Apple `as` handling for i386.
  * [Build] Certain tools used for building have been moved, some have been
    removed. See _Fate of the tools_ below.

## De-Deprecation ##

  * [C++] String literals are now all “const char*”
  * [C++] Friend injection is gone, no “-ffriend-injection” needed. See Blog:
      * “True” friend functions, i.e., those that are accessible globally and 
        not class-bound but have to access private members of other classes, 
        were left as is. However, their implementation has been moved to a 
        respective implementation (i.e., .cpp) file.
      * Friend functions, that were mere shortcuts and so could be used without 
        full qualification have been turned into normal static functions. They 
        now have to be called with their class prefixed.
      * Constructors (like create_objVector) and converters (like as_mapOop) are 
        now static members of their class and also have a static inline 
        non-member function.
    [cdeb93c]
  * [GCC] Self can be built with GCC 4.2.1, GCC 4.5, GCC 4.6, GCC 4.7, 
    and LLVM-GCC 4.2
  * [OSX/Carbon] Some functionality used by certain primitives was deprecated in
    10.5 and removed in 10.7. Theses were replaced using newer functionality. 
    This includes: 
      * Clipboard/pasteboard handling (now done using Pasteboard-API) [4564b38]
      * Window creation/Quartz (now done using HIToolbox) [08544b3]

## Misc ##

  * [LICENSE] Update (nearly) all source-files to 2012 copyright.
  * [CODING] Converted stray tabs to spaces, whenever encountered

## Fate of tools ##

  * Fate of the shellscripts:
      *  **gone**:  
         `ConvertRevisions`, `CreateFileStatus`, `Publish`, 
         `PublishCompare`, `changes`, `check_locks`, `createSourceLinks`, 
         `delete_xlib_symlinks`, `fix4.1.1`, `ftpPublish`, `makeFileLists`, 
         `makeSelfWorkingTree`, `makeVMWorkingTree`, `make_glue`, `make_incs`, 
         `make_vmDate`, `make_xlib_symlinks`, `mf`, `mzap`, `nocompile`, 
         `Publish`, `PublishCompar`, `pushLink`, `remove`, `testPragma`, 
         `undangle`, `verifyChecksum`
      * **moved** to `tools/shell`:  
         `Browse`, `Compare`, `Script`, 
         `expandNames`, `get_arch`, `profile`, `sdiffc`

  * Fate of the compiled tools in `bin`:
      * **gone**:    
        `UpdateFiles.cpp`, `cwdRootedIn.cpp`, `fixTar.cpp`, 
        `ftpshell.cpp`, `getRevision.cpp`, `lock_run.cpp`, `rcsfile.cpp`, 
        `rcsfile.hh`, `removeUnderscore.l`, `resetTime.c`, `skipComments.l`, 
        `table.cpp`, `table.hh`, `testSocket.cpp`
      * **moved** to `vm/build_support`:  
        `makeDeps`, `obj_patch`
      * **moved** to `tools/src`:   
        `AddTrailingNewline.cpp`, `cmprev.c`, 
        `dangling.c`, `isLink.cpp`, `linked.c`, `rself.cpp`, `runBinary.cpp`, 
        `zap.cpp`


## To Be Done ##

  * [OSX] Carbon Text uses a deprecated API. This should be changed. Probably,
    all Carbon stuff should be replaced using Cocoa.
  * [SUN] Testing and compiling on SunOSen, SPARC.
