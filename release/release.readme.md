Welcome to Self
===============

You have just downloaded either a .dmg file (for MacOS) or a .zip file (for Linux).

This file contains three .snap files, which are snapshots of already built Self worlds. It also contains the Self virtual machine for running Self code.

The three .snap files are:

core.snap - this file contains a headless, command line only Self world.
morphic.snap - this is the most used standard snapshot with the morphic development/gui framework.
kitchensink.snap - this has the morphic framework together with some extra applications.

Installation
------------

On MacOS, drag the Self Control app to the Applications folder. When the app is running, look under the application menu to install the vm for use on the command line.

On Linux, put the vm binary somewhere on your path. The binary is a 32 bit app so you will need to be on a 32 bit distro or to have the core 32 bit compatibility libraries installed.

Running
-------

On MacOS, double click the Self Control app, or start a .snap file from the command line as for Linux.

On Linux, you can start a snapshot by:

> Self -s /path/to/the.snap

Help
----

Try the website: www.selflanguage.org. This will also have pointers to the Self mailing list where we can give you some help :)

- Russell 2017.05.04
