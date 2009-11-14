I/O and Unix
============

		::
		
				oddball
					unix
				clonable
					proxy
						unixFile (mixes in traits unixFile currentOsVariant)

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
