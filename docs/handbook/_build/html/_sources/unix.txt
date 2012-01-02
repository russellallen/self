I/O and Unix
============

		::
		
				oddball
					unix
				clonable
					proxy
						unixFile (mixes in traits unixFile currentOsVariant)
						
						

.. warning::
   This page is out of date for Self 4.5.
   
   Start looking at the object ``os`` instead of ``unix``.
   
.. note::
   If reading from ``stdin``, the ``prompt`` object may interfere with your
   code by stealing input from you.  To avoid this, wrap calls in
   ``prompt suspendWhile: [ ]``, for example:
   
   ``prompt suspendWhile: [ stdin readLine printLine ]``
   
   which will read a line from the stdin and echo it to stdout.


The oddball object ``unix`` provides access to selected Unix system calls. The most common calls
are the file operations: ``creat()``, ``open()``, ``close()``, ``read()``, ``write()``, ``lseek()`` and ``unlink()``.
``tcpConnectToHost:Port:IfFail:`` opens a TCP connection. The ``select()`` call
and the indirect system call are also supported (taking a variable number of integer, float or byte
vector arguments, the latter being passed as C pointers). ``unixFile`` provides a higher level interface
to the Unix file operations. The oddball object ``tty`` implements terminal control facilities such
as cursor positioning and highlighting.

Relevant oddballs:

  +------------------------+-------------------------------------+
  | stdin, stdout, stderr  |   standard Unix streams             |
  +------------------------+-------------------------------------+
  | tty                    |   console terminal capabilities     |
  +------------------------+-------------------------------------+

Modules: unix, stdin, tty, ttySupport, termcap
