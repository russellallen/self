********************
The Original Self UI
********************

    Last updated 24 August 2024 for 2024.1

Before Self used the current `morphic` user interface (also known as `UI2`) it used another, nameless, user interface framework which has been retrospectively dubbed `ui1`.

-------------------
X11 with 256 Colors
-------------------

UI1 only runs on 8 bit X11 systems. There are a number of suggested ways to get a 8 bit X11 window on modern systems detailed at `WineHQ`_.

.. _WineHQ: http://wiki.winehq.org/256ColorMode


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

This will save a snapshot of the world in the file '``Snapshot.snap``'.

---------------
Starting the UI
---------------

Once you have a 256 colour X11 desktop running, you can start your Self world and start using UI1 by::

  preferences xDisplay: ':1'  "Only if necessary"
  ui demo
