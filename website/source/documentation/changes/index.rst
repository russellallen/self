Changes
=======

.. toctree::
   :maxdepth: 1
   
   detailed/index

What’s Changed Since Self 4.2.1
-------------------------------

Following is a list of the major changes since the previous release of Self. This release also includes numerous small bug fixes and enhancement.

*UI1 Revival*

Dave has revived the original Self user interface ("UI1"), which was built to show how cartoon animation techniques could enhance the user's experience. These cartoon animation techniques have not yet been integrated into the default Morphic user interface ("UI2"), but you can see UI1 if you have X11 installed on your computer. On a Macintosh, you will need to start up the X server, go into X's Preferences, change it to 256 color mode, and then restart the X server. Then start Self, and type the expression ui startOn: ‘:0’ to start up UI1.

*Salience-Based Highlighting*

Self now implements David Ungar and Kristen McIntyre’s patented (U.S. patent #6842182) salience-based highlighting. When selecting text, the selected text will be highlighted in a brighter color if the selected region is small (to make it easier to notice), but in a dimmer color if the selected region is large (to avoid being too intense). 

*Graphical Profiler*

We have created an outliner to graphically display the results of running the performance profiler. (Call profileSlice on a block to invoke it.) It includes a pruning algorithm which attempts to eliminate uninteresting nodes from the profile tree. (You can fiddle with the settings by pressing the Controls button on the profile morph.) Both the user interface and the pruning algorithm are still very rough; we haven't had a lot of time to spend on them.

