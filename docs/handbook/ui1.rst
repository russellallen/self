********************
The Original Self UI
********************

    Last updated 4 February 2014 for Self 4.5.0

Before Self used the current `morphic` user interface (also known as `UI2`) it used another, nameless, user interface framework which has been retrospectively dubbed `ui1`.

-------------------
X11 with 256 Colors
-------------------

UI1 only runs on 8 bit X11 systems. There are a number of suggested ways to get a 8 bit X11 window on modern systems detailed at `WineHQ`_.

On OS X systems, you will need to install XQuartz if you are running Mountain Lion (10.8) or later.  You will need to set the color depth to 256 colors in the Preferences, then restart XQuartz.

.. _WineHQ: http://wiki.winehq.org/256ColorMode
.. _XQuartz: http://xquartz.macosforge.org

-------------------
VM with X11 support
-------------------

The standard Linux VM already has X11 primitives. However the standard Mac VM doesn't, so that users can run Self on Macs without requiring X11 to be installed. You can either build a OS X VM which includes X11 support yourself as described :doc:`the section on building the VM <buildvm>` or download one from the Self fileserver.

--------------------
Preparing a snapshot
--------------------

The first step in using UI1 is to build a new World including it. Assuming you are in the `objects` directory in the Self source tree, and that the Self vm is in your path, do::

  Self -f worldBuilder.self

and when it asks you::

  Load UI1 (X11 only)? (y/N)
  >

answer `y`. When the World has built, save it at the prompt by doing::

  save
  quitNoSave

This will save a snapshot of the world in the file 'Snapshot'.

---------------
Starting the UI
---------------

Once you have a 256 colour X11 desktop running, you can start your Self world and start using UI1 by::

  preferences xDisplay: ':1'  "Only if necessary"
  ui demo


