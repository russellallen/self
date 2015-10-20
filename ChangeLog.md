Changes in Self 4.5.0
---------------------

## *Shortlog* ##

  * Support for **Mac Classic**, and **MetroWerks** compiler  **removed**
  * Build process uses **CMake** now
  
  * Less files: 2022 (Makefiles/Xcode) → 1709 (CMake), that is -313 files
  * Less code: ca. 510,000 (130,000 w/o Self source) SLOC → ca. 499,00 (123,500 w/o Self source) SLOC, 
    that is ca. -11,000 (6,500 w/o Self source) SLOC
  
  * New supported compilers: **GCC** ≥ 4.2, **Clang**
  * Experimental Mac OS X support for Self as double-clickable Application
  
  * New Self Control.app on OS X to manage your running worlds as a more robust 
    and featured replacement for the older 'Self Droplet'. Use of this app is 
    optional and the Self VM can still be accessed through the command line.

  * New look for standard world, with better fonts, colours and greater use of space.

  * Various fixes to the standard world, including a new build script 'worldBuilder.self' 
    replacing several ad hoc build scripts.

  * Updated Self Handbook at handbook.selflanguage.org
  
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
  
Changes in Self 4.4
-------------------

* Self now builds and runs on standard x86 Linux
* Rebuilt OS X VM 
* Rewritten Self droplet for OS X VM

Changes in Self 4.3
-------------------

Following is a list of the major changes since the previous release of Self. This release also includes numerous small bug fixes and enhancement.

*UI1 Revival*

Dave has revived the original Self user interface ("UI1"), which was built to show how cartoon animation techniques could enhance the user's experience. These cartoon animation techniques have not yet been integrated into the default Morphic user interface ("UI2"), but you can see UI1 if you have X11 installed on your computer. On a Macintosh, you will need to start up the X server, go into X's Preferences, change it to 256 color mode, and then restart the X server. Then start Self, and type the expression ui startOn: ‘:0’ to start up UI1.

*Salience-Based Highlighting*

Self now implements David Ungar and Kristen McIntyre’s patented (U.S. patent #6842182) salience-based highlighting. When selecting text, the selected text will be highlighted in a brighter color if the selected region is small (to make it easier to notice), but in a dimmer color if the selected region is large (to avoid being too intense). 

*Graphical Profiler*

We have created an outliner to graphically display the results of running the performance profiler. (Call profileSlice on a block to invoke it.) It includes a pruning algorithm which attempts to eliminate uninteresting nodes from the profile tree. (You can fiddle with the settings by pressing the Controls button on the profile morph.) Both the user interface and the pruning algorithm are still very rough; we haven't had a lot of time to spend on them.



Changes in Self 4.2.1
---------------------

*Platform-independent changes & bug fixes:*

* Revived the original Self user interface ("UI1"), which was built to show how cartoon animation techniques could enhance the user's experience. These cartoon animation techniques have not yet been integrated into the default Morphic user interface ("UI2"), but you can see UI1 if you have an X server. On a Macintosh, you will need to start up the X server, go into X's Preferences, change it to 256 color mode, and then restart the X server. Then start Self, and type the expression ui startOn: ‘:0’ to start up UI1.
* Implemented David Ungar and Kristen McIntyre’s patented (U.S. patent #6842182) salience-based highlighting.
* Created a morph to graphically display the results of running the performance profiler. (Call profileSlice on a block to invoke it.) It includes a pruning algorithm which attempts to eliminate uninteresting nodes from the profile tree. (You can fiddle with the settings by pressing the Controls button on the profile morph.) Both the user interface and the pruning algorithm are still very rough; we haven't had a lot of time to spend on them.
* Added a Find Missing Slots menu item to object outliners. This displays a list of messages that the object (or any of its parents) sends to itself, but which are not yet implemented. Thanks to the guys who did the Traits work in Smalltalk (Nathanael Schärli, Stéphane Ducasse, Oscar Nierstrasz, and Andrew P. Black) - we got the idea from seeing their implementation in Squeak.
* Added an asSmallIntegerIfPossible method to traits bigInt, traits int32or64, and traits number. Changed bigInteger arithmetic to coerce the result to a smallInteger if it fits.
* Added a findFirst:IfPresent:IfAbsent: method to traits integer.
* Added the constant e (2.71828) to globals.
* Added an asFloat method to strings.
* Added percentile: and median methods to collections.
* Added an occurrencesOfEachElement method to collections.
* Changed findFirst:IfPresent: to return self in the absent case, rather than being an error.
* Added insertion methods to traits list (insert:AfterElementSatisfying:IfAbsent:, insert:BeforeElementSatisfying:IfAbsent:, insertAll:AfterElementSatisfying:IfAbsent:, insertAll:BeforeElementSatisfying:IfAbsent:).
* Added removeFirstIfAbsent: and removeLastIfAbsent: methods to traits list.
* Added copyWithoutPrefix: and copyWithoutSuffix: methods to traits indexable.
* Created new kinds of collections: universalSet and universalDictionary. (Ordinary sets and dictionaries use an emptyMarker and a removedMarker to indicate the absence of a key. This means that those markers cannot be used as keys in an ordinary set or dictionary. A universalSet or universalDictionary is capable of holding those markers, though it's a bit slower than an ordinary set or dictionary.)
* Created new kinds of collections: customizableSet and customizableDictionary, which can use any test (not just = like regular sets and dictionaries) to determine equality of elements.
* Added an isReflecteeEmptyBlock method to mirrors.
* Added 'IfFail:' blocks to various methods in the reflection system (like moduleInfoIfFail:), to allow the UI to be more robust.
* Added a lexicalParent fake slot to block method mirrors.
* Factored the mirror system so that all calls to primitives (e.g. _MirrorNames) go through a reflectionPrimitives object.
* Added an allTimes method to traits block, which runs the block and returns an object containing four different kinds of timing information (cpuTime, realTime, systemTime, userTime).
* Created localAccessFinder, a bytecodeInterpreter to find all local-variable-access bytecodes.
* Increased defaultProcessSize.
* In userQueryMorph, added support for nested showEverybody:While: calls.
* In defaultBehavior's error: method, trim the error string if it is too long, because otherwise the system crashes trying to draw the morphs.
* Limited the debugger's status string's length, as well.
* Fixed a bug that was causing the More Stack button in the debugger to keep appearing even when there was no more stack.
* Made the lines of the list of slots (when displaying a method) wrap if they get too long.
* Fixed a bug that was making fontStruct-caching not work.
* In traits mirrors method, made doLexicalScopes:IfFail: do a better job of respecting the failblock.
* Made the reflection system do a better job of respecting multiple bytecode sets.
* Added a few methods to the traits object for module objects: allSubparts, sourceLineCount, sourceLineCountInMeAndAllSubparts, and slotsInMeAndAllSubparts.
* Improved the performance of searching for senders.
* Updated the VM so that it compiles under GCC 4.
* Changed the VM to use a larger new generation, and to better manage the heap when using a larger new generation.
* Fixed the VM so that defining FAST_FLOATS works again to get floats with more range.
* Fixed a bug that would cause the VM to crash in the scavenger after garbage-collection.
* Fixed a bug related to running out of space when scavenging.
* Fixed a bug with integer division.
* Added various endian primitives for byteVectors to integers.
* Fixed a few bugs in the performance profiler.
* Added a cutoff argument to the _ProfileCopyGraph primitive.
* Silenced VM complaints about bytecode position table parser errors.

*Mac changes:*

* Ported the Self VM to the Intel platform. Self now runs on Intel-based Macintoshes (though not yet on Windows or Linux).
* Updated the VM so that it compiles under Mac OS 10.4, a.k.a. Tiger.
* Added experimental pixel-retrieval primitives to the Carbon interface.
* Attempted to make the Mach timer more robust.



Changes Self 4.2
----------------

*Platform-independent changes & bug fixes:*

* The VM has been changed to work with gcc 3.3. One side-effect is that it will read old snapshots, but will save them in a format that requires the new VM.
* A bug that could cause snapshots to be unrunnable (because of specious memory exhaustion) has been fixed.
* A bug that could cause specious memory exhaustion when allocating a large array has been fixed.
* The Self-level profiler (i.e. “[10 factorial] profile”) has been ported and revived. This is a hierarchical, source-level profiler.
* Keyboard handling has been made more uniform across platforms. (In particular, there were many keyboard commands that did not work in X on the Mac, and now they do.)
* New functionality has been added to the text editor: Ctrl-arrow or Option-arrow for moving by words, Shift for extending the selection. New keyboard shortcuts have been added for senders, implementors, find slot, methods containing, and “get it.” The factory window has a list of all the keyboard commands.
* The mechanism for dealing with invalid slot objects has been made more robust, and now works with fake slots as well.
* Two new kinds of collections have been added: reflectiveIdentityDictionary and reflectiveIdentitySet, which compare objects using their reflective identity (rather than using their = method, as ordinary dictionaries and sets do).
* orderedSet has been made more efficient.
* The “fast accessing” methods for sets (if:IsPresentDo:IfAbsentPut:AndDo: and kin) now work even if the value being Put is not equal to the key (albeit at the cost of another hash lookup).
* The “methods containing” operation now uses a new-style slice outliner by default.
* Added support for applying a userDefinedOperation to category names as well as slots.
* Arrows between outliners now get updates. Previously, if the value of a slot changed, the arrow coming from that slot would still point to the old value.
* userProfile has been changed to use the display’s host name as the user’s name. (Previously, it was attempting to use the “finger” command to figure out the real name of the user, but it was not parsing the finger output correctly. The finger code is still there, but is not being called anymore.) 
* When reopening a world, Self will attempt to use the same display that the world was saved on. (So, for example, on the Mac, if you save an image in X and then quit and restart Self, the world will reopen in X, not in Carbon.)
* New core methods:
   * defaultBehavior - isNil, isNotNil, ifNil:, ifNotNil:, ifNil:IfNotNil:, ifNotNil:IfNil:
   * traits collection - allSatisfy:, anySatisfy:, noneSatisfy:, soleElement, ifNone:IfOne:IfMany:, gather:, do:SeparatedBy:
   * traits indexable - replaceFrom:UpTo:With:
   * traits string - isWordSeparator, asTokensSeparatedByCharactersSatisfying:, asWords. Also, asTokens has been renamed to asTokensSeparatedByWhiteSpace, and asTokensSeparators: has been renamed to asTokensSeparatedByCharactersIn:
   * traits abstractSetOrDictionary - at:IfAbsentPut:
   * traits pair - distanceTo:
   * browse - methods for browsing lists of the descendants of an object (not just children, but also grandchildren, great-grandchildren, and so on)
   * traits mirrors abstractMirror - everyMessageReflecteeUnderstands
   * abstract_OS - outputOfCommand:Delay:IfFail:, withTempFileDo:
   * traits random - pointInBoundingBox:

*Mac changes & bugs:*

* Several bugs that caused crashes (especially under Panther) have been fixed.
* Senders, implementors, etc. have been optimized with AltiVec™ instructions.
* The VM is now built under Apple's Xcode™.
* A Mach facility (task_info and thread_info) is now used to obtain process times.
* The facilities for running the Self VM under gprof have been ported to the Mac.
* The Self droplet no longer requires the SELF_WORKING_DIR environment variable to be set. However, the droplet must now be located in the same directory as the VM and the snapshot.

*X bugs:*

* We have fixed a bug that occasionally caused the xFillPolygon:GC:Xs:Ys:Shape:Mode: primitive to fail.
* We have fixed a bug that often caused copy-and-paste in X to be four bytes off (four gibberish characters at the beginning of the pasted string, and four missing characters at the end).



Changes in Self 4.1.6
---------------------

*Platform-independent changes & bugs:*

* We have further refactored the optimizing compiler, during the PowerPC SIC-porting effort. This should make it simpler for others to port the optimizing compiler to new architectures.
* For SIC development and/or testing, we have added _CompileWithSICNames primitive. If you set _CompileWithSICNames to be a vector, then only methods whose selector matches a selector in CompileWithSICNames will be compiled with the SIC.

*Mac OS X changes:*

* The biggest change, of course, is the availability of the SIC on PowerPC. We have noticed a substantial speedup in the Self system. Its performance is now on-par with Self on Solaris.
* The signal handling code on Mac OS X has been improved. In particular, a bug in Mac OS X causes the whole operating system to crash if a process receives a timer signal during core dump. Our workaround is to disable timer signals before core dumping.
* The build process has slightly changed. See section 5 for details.



Changes in Self 4.1.5
---------------------

*Platform-independent bugs:*

* We have fixed a virtual machine bug that caused crashes on Solaris and infinite CPU and memory consumption on the Mac. This bug would occur most frequently when accepting a change to a method in the debugger.

*Mac OS X changes:*

* Polymorphic inline caches (PIC) are available on the PowerPC now! This leads to a performance increase of anywhere from a factor of 0 to 3, depending on the nature of the program. We have felt the system to be more responsive. (Thank you, Michael! --Dave).
* The Self Droplet now correctly handles filenames in multiple volumes.
* Many Mac and Solaris key bindings have been implemented. In particular, command+s saves a snapshot, the arrow keys now work, and escape now does a cancel. A full list of key bindings is available in the Programmer’s Environment manual.



Changes in Self 4.1.4
---------------------

*Platform-independent changes:*

* The demo snapshot has been recreated. It now reflects the most recent Self system.
* The Self debugger has been generalized to be retargetable to debug other things (for example, machine-level debugging).
* The transporter has been enhanced to handle object vectors that aren’t copies of the prototypical object vector.
* We have implemented an experimental model for slots that hold methods. Under the traditional semantics, a method may only be stored in a constant slot, and the method is invoked whenever the slot is accessed. By executing _NakedMethods: true, the user can now select a relaxed model, which permits a method to be stored in an assignable slot. Accessing such a slot merely returns a reference to the method object.
* Added an argument count bytecode. A new instruction set has been defined and there is backward compatibility with the old instruction set. 
* bigInt now uses a binary base rather than a decimal base, so we can do bitwise operations.
* Support for handling 32 bit binary integers has been increased (see the int32 and int64 objects).
* Variations for transparent forwarding (useful for debugging) have been added (see loggingSender).
* traits smallInt has two extra methods: numberOfOnes and roundUpTo:.
* Fixed some memory leak bugs that would cause the system to slowly get bigger and bigger. (As a side effect, we have increased the time required to do a thorough memory cleanup.)
* Added support for the ptrace system call.
* Added a “Yank Out Outliner” menu item which lets the user create smaller views of the same object. (Warning: there are still some rough edges here.)
* Fixed bugs for frame buffers without color maps.

*Solaris/SPARC™ changes:*

* We wrote a new section explaining how to build the Self VM on the Solaris environment. Please see section 5.
* An inlining bug in SIC has been fixed.

*Mac OS X changes:*

* The Self VM is now an Apple Project Builder (PB) project. We provide the PB project, under vm/mac_osx/vm_project. Please see section 5 for instructions on building and running Self on Mac OS X.
* An AppleScript droplet has been included that facilitates starting up Self. Now, Self snapshots can be double-clicked to launch Self or they can be dropped on this droplet. Please see section 4 for information on how to start up Self on Mac OS X.
* The creator type and file type of snapshots are now set correctly (to Self and Snap, respectively).
* Minor performance enhancements.
* Aligned memory allocation doesn’t use mmap anymore. We use malloc instead.
* Fixed a semaphore bug that caused the system to freeze during garbage collection.
* Added support for cursor teleportation. Thanks to Kristen McIntyre.



Changes in Self 4.1.3
---------------------

* The slice outliner now provides more flexible senders, implementors, etc. views of your objects.
* Several memory leaks and Macintosh performance bugs have been fixed.
* The abstract syntax module had been deleted.
* The outliner has been refactored into a pluggable outliner hierarchy and a model hierarchy. This change would facilitate supporting other languages with the Self programming environment.
* When changing a method in the debugger, if the method is present in more than one object, the debugger will ask what you want to do rather than changing it everywhere as before.
* Activation mirror objects now also contain a reference to the relevant process, simplifying their usage.
* Browsing implementors, senders, etc. is now more versatile: slice outliners have been added. These can browse hierarchically, restricting the search to an object’s ancestors, descendants, or both (its family). When used in such a fashion, the results are displayed in a visual containment hierarchy corresponding to the objects’ inheritance relationships.
* Some of the methods that were in outliner objects, but were specific to modifying Self objects have been relocated to mirror and slot objects.
* Outliners how have a “yank” menu button. This operation allows you to extract a view on just a single method or category, like “spawn” in Smalltalk-80.
* I have written a general parsing framework, and written a Java and Self parser in it. (As of this writing (8/5/2001), I’m not sure whether the parser will make it out the door.)
* A slot in the prototype module object, “comment”, has been renamed to “myComment” in order to support robust interactive editing of the comment. (The module outliner has been revamped and now supports comment display and editing.) If you have any Self source files of your own, you should use a text editor to rename the “comment” slot in the module before reading them in.
* In order to recategorize a slot in a given object, you should now “copy” the slot and drop the copy into the new category. The system will notice that the slot is merely being recategorize and not ask for confirmation.
* A cache is now maintained of those modules that are not contained in any other modules, that is the “top-level” modules.
* Several bugs have been fixed, including one that made it impossible to single-step a thread under certain circumstances.
* OS X saves moderately-sized snapshots so quickly that I have removed the garbage collection operation before a snapshot. You can always select “clean up memory” from the background menu.The virtual machine file name suffixes have been changed to be more compatible with modern C++ compilers.
* Some of the icons have been replaced with much nicer ones (thanks to Kristen McIntyre).



Changes in Self 4.1.2
---------------------

* Self now runs on OS X.
* A bug in the SPARC spy has been fixed.

