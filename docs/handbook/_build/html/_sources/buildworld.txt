How to build the world
======================

Should you need to reconstruct a world from the source files, here’s how to do it. This section describes
how to create a default object world by reading in the Self source code provided with your
distribution (in ``Optional.SelfSource.tar.Z``). You can also do this after writing the world out
using the transporter (``transporter fileOut fileOutAll``).

To create the default object world:

	1. Start the Self VM:

		::

			% Self
			Self Virtual Machine Version 4.0.2, Thu 09 Feb 95 19:41:30
			Copyright 1989-95: The Self Group (type _Credits for credits)
		
			VM#
	
	2. (Optional, but recommended.) Start the spy so you can watch the world fill up with objects:

		::
	
			VM# _Spy: true
		
		.. note::
			
			that because the world is empty, you must use the primitive to do this.

	3. Read in the default world. To do this, ask Self to read expressions from a file:
	
		::

			VM# 'all2.self' _RunScript
		
		Various configurations are possible: ``all2`` is the released system; ``smallUI2`` is the same but
		without the various example applications; and all contains the old (release 3.0) experimental
		user interface.
		
		Unless you have asked Self not to print script names, you should see something like:

		::
		
			reading all2.self
			reading init.self
			. . .

	4. After all the files have been read in, Self will start the process scheduler, initialize its module cache, and print:

		::

			“Self 0”
		
		That last line is the Self prompt indicating that the system is ready to read and evaluate expressions.
