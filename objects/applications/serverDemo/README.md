The code in this directory demonstrates implementing and loading a shared library in a running Self system. The `Makefile` provided is setup for a Linux system and will need to be modified to work on other operating systems.

## Build

    $ make

## Run

In a running Self system do the following:

    Self> 'applications/serverDemo/server.self' runScript
    Self> serverDemo server start

This will block inside the C `accept` function implemented in the shared library. In another terminal window you can send Self commands to this instance with:

    $ cd applications/serverDemo
    $ ./toself "'hello' print"
    $ ./toself _Quit

