Download
========

Summary for the impatient
-------------------------

* `Linux <http://selflanguage.org/files/releases/4.5/Self-4.5.0.tar.gz>`_
* `Mac OS X <http://selflanguage.org/files/releases/4.5/Self-4.5.0.dmg>`_

Explanations
------------

The most recent version is Self 4.5.0.  

To use Self you will need two parts - the Self virtual machine and a snapshot of a Self world.  The Self virtual machine is available for Mac OS X and for Linux.


Snapshots
---------

Self worlds are self-contained sets of objects that implement GUIs, web servers, command lines etc. Each world can be saved in a 'snapshot', which is like a Smalltalk image and can be interacted with by opening the snapshot with the VM.  Self worlds can be built from scratch from the sources - see below for download instructions.  

How to Run Self
---------------

On Mac OS X you can:

- double click a snapshot to run it (if this does not work you may need to press ⌘-i and change 'Opens with...' field. The snapshots included with this release have their file type and creator code set correctly, while older snapshots may not. If you create new snapshots, these two properties are set correctly under Mac OS X. Note that unlike previous versions of Self, double clicking a snapshot will run it directly and not through Terminal.app - if you want access to Self from the command line, start the vm from Terminal.app as described below (or open up telnet access to the running snapshot and telnet to localhost)
- run 'Self' in Terminal.app ("Self -s Clean.snap" to open a snapshot)
- make a snapshot executable and run it in Terminal.app 

On Linux you can:

- Run 'Self' on the command line ("Self -s Clean.snap" to open a snapshot)
- make a snapshot executable and run it on the command line

You may also be able to: 

- double click a snapshot to run it 

Source
------

There is a `Git repository <http://github.com/russellallen/self>`_ containing sources for the VM and for building a standard Self world.

The official source repository for 4.3 and earlier is the `Sourceforge CVS tree <http://sourceforge.net/cvs/?group_id=178862>`_, which can be `browsed here <http://self.cvs.sourceforge.net/self/>`_.

Older Versions
--------------

Version 4.4 is `available for download <http://selflanguage.org/files/>`_ .

The previous version of Self was 4.3.  You can download Self 4.3 for Mac OS X and for Sparc Solaris.

`Download <http://sourceforge.net/project/showfiles.php?group_id=178862&package_id=206387&release_id=599764>`_

