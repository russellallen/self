***************
Getting Started
***************

    Last updated 5 January 2014 for Self 4.5.0

Downloading Prebuilt VM and snapshot
------------------------------------

The easiest way to get started with Self is to download a prebuild VM and a snapshot of the default Self world from the _`Self website`.

.. _Self website: http://www.selflanguage.org

For OS X, this means a DMG file which will mount when double clicked. On Linux this means a ``.tar.gz`` file.

Running on OS X
---------------

Once the DMG has been mounted, find it in Finder and drag the '``Self Control.app``' to your Applications folder, and the '``Clean.snap``' file somewhere convenient. This file is a snapshot of the default Self world.

Running on Linux
----------------

Untar the downloaded ``.tar.gz`` file::

  tar zxvf Self.tar.gz

This should give you at least two files, a binary '``Self``' which is the VM, and the file '``Clean.snap``' which is a snapshot of the default Self world. Make sure the VM is executable::

  chmod u+x Self

and run the VM, passing the snapshot as an argument::

  Self -s Clean.snap

Building your own system
------------------------

It is relatively easy to biuld the two key components of Self, the Self World and the Self Virtual Machine. They both start from downloading the Self sources from the GitHub repository by the following git command::

  git clone https://github.com/russellallen/self/

and then follow chapters :ref:`building-a-vm` :doc:`Instructions on how to build the VM <buildvm>` and :ref:`building-a-world` :doc:`Instructions on how to build a Self World <buildworld>`.
