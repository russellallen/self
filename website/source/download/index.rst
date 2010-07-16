Download
========

The current version is Self 4.4.  

To use Self you will need two parts - the Self virtual machine and a snapshot of a Self world.  The Self virtual machine is available for Mac OS X and for Linux.


(1) Virtual Machine
-------------------


Linux - `Self-4.4.tar.gz <http://selflanguage.org/files/releases/4.4/Self-4.4.tar.gz>`_

On Linux run the INSTALL.sh shell script.  This will install the VM in /usr/share/self/0/ and add a symbolic link to it at /usr/bin/Self.

Mac OS X - `Self-4.4.pkg <http://selflanguage.org/files/releases/4.4/Self-4.4.pkg>`_

On Mac OS X run the 'Self.pgk' installer.  This will install the VM and Droplet in /Library/Self/0/ and add a small shell script at /usr/bin/Self.


(2) Snapshots
-------------


Self worlds are self-contained sets of objects that implement GUIs, web servers, command lines etc. Each world can be saved in a 'snapshot', which is like a Smalltalk image and can be interacted with by opening the snapshot with the VM.  Self worlds can be built from scratch from the sources - see below for download instructions.  For convenience, we provide here two different snapshots:

`Clean.snap <http://selflanguage.org/files/releases/4.4/Clean-4.4.snap>`_

The 'Clean' snapshot contains a clean base set of objects suitable for investigating the Morphic GUI and for developing on.

`Demo.snap <http://selflanguage.org/files/releases/4.4/Demo-4.4.snap>`_

The 'Demo' snapshot starts from the Clean snapshot and adds the Smalltalk subsystem and an interactive tutorial to familiarise yourself with the Morphic user interface.


How to Run Self
---------------


On Mac OS X you can:

- double click a snapshot to run it (if this does not work you may need to press ⌘-i and change 'Opens with...' field. The snapshots included with this release have their file type and creator code set correctly, while older snapshots may not. If you create new snapshots, these two properties are set correctly under Mac OS X. Note that unlike previous versions of Self, double clicking a snapshot will run it directly and not through Terminal.app - if you want access to Self from the command line, start the vm from Terminal.app as described below (or open up telnet access to the running snapshot and telnet to localhost)
- run 'Self' in Terminal.app ("Self -s Clean.snap" to open a snapshot)
- drag a snapshot to /Library/Self/0/SelfDroplet.app
- make a snapshot executable and run it in Terminal.app 

On Linux you can:

- Run 'Self' on the command line ("Self -s Clean.snap" to open a snapshot)
- make a snapshot executable and run it on the command line

You may also be able to: 

- double click a snapshot to run it 


Source
------

There is a `Git repository <http://github.com/russellallen/self/tree/master>`_ containing sources for version 4.4 releases (including tarballs).

The official source repository for 4.3 and earlier is the `Sourceforge CVS tree <http://sourceforge.net/cvs/?group_id=178862>`_, which can be `browsed here <http://self.cvs.sourceforge.net/self/>`_.

Older Versions
--------------

Alpha and Beta versions of 4.4 are `available for download <http://selflanguage.org/files/>`_ .

The previous version of Self was 4.3.  You can download Self 4.3 for Mac OS X and for Sparc Solaris.

`Download <http://sourceforge.net/project/showfiles.php?group_id=178862&package_id=206387&release_id=599764>`_

