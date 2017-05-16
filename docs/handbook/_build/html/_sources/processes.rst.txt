Processes and the Prompt
========================

Self processes are managed by a simple preemptive round-robin scheduler. Processes can be
stepped, suspended, resumed, terminated, or put to sleep for a specified amount of time. Also, the
stack of a suspended process can be examined and the CPU use of a process can be determined. A
process can be created by sending ``fork`` to a ``message``.

The ``prompt`` object takes input from ``stdin`` and spawns a process to evaluate the message. Input
to the prompt is kept in a history list so that past input can be replayed, similar to the history mechanism
in many Unix shells.

Modules: process, scheduler, semaphore, prompt, history

.. index::
   single:  proxy

.. index::
   single:  fctProxy

.. index::
   single:  foreignCode

.. index::
   single:  foreignFct

.. index::
   single:  foreignCodeDB
