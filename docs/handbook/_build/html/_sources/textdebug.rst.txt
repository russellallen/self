Using the textual debugger
==========================

If you are modifying the core of the programming environment or working without the environment
you may need to use the textual debugger. After attaching the aborted process to the debugger
using the shell command attach, these commands are available:

	+-----------------+----------------------------------------------------------------+
	|  Command        | Description                                                    |
	+-----------------+----------------------------------------------------------------+
	|  attach: n      | attach the process with object reference number n              |
	+-----------------+----------------------------------------------------------------+
	|  detach         | detach the debugged process                                    |
	+-----------------+----------------------------------------------------------------+
	|  step[:n]       | execute (n) non trivial bytecodes :sup:`*`                     |
	+-----------------+----------------------------------------------------------------+
	|  stepi[:n]      | execute (n) bytecodes                                          |
	+-----------------+----------------------------------------------------------------+
	|  next[:n]       | execute (n) non trivial bytecodes in the current activation    |
	+-----------------+----------------------------------------------------------------+
	|  nexti[:n]      | execute (n) bytecodes in the current activation                |
	+-----------------+----------------------------------------------------------------+
	|  finish         | finish executing the current activation                        |
	+-----------------+----------------------------------------------------------------+
	|  cont           | continue execution                                             |
	+-----------------+----------------------------------------------------------------+
	|  trace          | print out a stack trace of the process                         |
	+-----------------+----------------------------------------------------------------+
	|  show           | display the current activation                                 |
	+-----------------+----------------------------------------------------------------+
	|  show: n        | go to and display the nth activation on the stack              |
	+-----------------+----------------------------------------------------------------+
	|  status         | display the status of the debugged process                     |
	+-----------------+----------------------------------------------------------------+
	|  up[: n]        | go up (n) activation(s)                                        |
	+-----------------+----------------------------------------------------------------+
	|  upLex          | go up to the lexical enclosing scope of this activation        |
	+-----------------+----------------------------------------------------------------+
	|  down[: n]      | go down (n) activation(s)                                      |
	+-----------------+----------------------------------------------------------------+
	|  lookup: <name> | lookup the given name in the context of the current activation |
	+-----------------+----------------------------------------------------------------+

	\* A bytecode is trivial if it is a push of a literal or a send to a slot residing in
	the lexical scope of the current activation.
