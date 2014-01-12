Changes
=======

.. toctree::
   :maxdepth: 1
   
   detailed/index

What's Changed in Self Mallard (4.5.0)
--------------------------------------

* Build system redone by Tobias Pape. Now based on cmake, with a single modern build process for both Linux and OS X. The VM can be built on both GCC and Clang on the latest vesions of both operating systems. 

* New Self Control.app on OS X to manage your running worlds as a more robust and featured replacement for the older 'Self Droplet'. Use of this app is optional and you can still access the Self VM through the command line.

* New look for standard world, with better fonts, colours and greater use of space.

* Various fixes to the standard world, including a new build script 'worldBuilder.self' replacing several ad hoc build scripts.

* Updated Self Handbook at docs.selflanguage.org

What’s Changed in Self 4.4
--------------------------

* Self now builds and runs on standard x86 Linux
* Rebuilt OS X VM 
* Rewritten Self droplet for OS X VM

What’s Changed in Self 4.3
--------------------------

Following is a list of the major changes since the previous release of Self. This release also includes numerous small bug fixes and enhancement.

*UI1 Revival*

Dave has revived the original Self user interface ("UI1"), which was built to show how cartoon animation techniques could enhance the user's experience. These cartoon animation techniques have not yet been integrated into the default Morphic user interface ("UI2"), but you can see UI1 if you have X11 installed on your computer. On a Macintosh, you will need to start up the X server, go into X's Preferences, change it to 256 color mode, and then restart the X server. Then start Self, and type the expression ui startOn: ‘:0’ to start up UI1.

*Salience-Based Highlighting*

Self now implements David Ungar and Kristen McIntyre’s patented (U.S. patent #6842182) salience-based highlighting. When selecting text, the selected text will be highlighted in a brighter color if the selected region is small (to make it easier to notice), but in a dimmer color if the selected region is large (to avoid being too intense). 

*Graphical Profiler*

We have created an outliner to graphically display the results of running the performance profiler. (Call profileSlice on a block to invoke it.) It includes a pruning algorithm which attempts to eliminate uninteresting nodes from the profile tree. (You can fiddle with the settings by pressing the Controls button on the profile morph.) Both the user interface and the pruning algorithm are still very rough; we haven't had a lot of time to spend on them.

