Processes and Concurrency
=========================

Self processes are managed by a simple preemptive round-robin scheduler. Processes can be
stepped, suspended, resumed, terminated, or put to sleep for a specified amount of time. Also, the
stack of a suspended process can be examined and the CPU use of a process can be determined. A
process can be created by sending ``fork`` to a ``message``.

Concurrency
-----------

Self includes objects covering the normal primitives for managing concurrency.  These include ``semaphore``, ``barrier`` and ``lock``, which behave mostly as you would expect from their names.

One useful object which is at a slightly higher level is ``channel`, which is essentially wrapping a target object in a lock::

  c: channel copyOn: target.
  i: c waitingInbox.

``i`` will now forward all messages it receives to ``target``, and return the response. The channel will serialize them, so that ``target`` only receives one message from the channel at a time.

There are some varieties of inbox. You can specify a timeout in milliseconds and a block for timeout::

  i2: c waitingInboxTimeIut: 1000
        IfTimedOut: [ log warn: 'Resource unavailable'].

If the message is in the queue for more than 1000 miliseconds, then it will timeout and return the value of the block. Note that this only counts time in queue, and doesn't count time spent running - if the message reaches ``target`` and then halts, it will not timeout. 

You can also specify an inbox which doesn't wait for a response but immdiately returns ``nil``::

  i3: c inbox.

Remember that the current Self VM does not support non-LIFO blocks. So passing blocks into a non-waiting inbox is likely to break when ``target`` attempts to access a block which has already been garbage collected when the sending context was exited::

  i3 do: [ "This will break!" something ]

There is also::

  i4: c inboxTimeOut: ms.

On timeout, it will leave the queue without further processing.

Multiple inboxes on the same channel will work as expected - the channel will serialize their messages - however remember that accessing ``target`` directly, or having more than one ``channel`` on ``target`` is unsafe.

The Prompt
----------

The ``prompt`` object takes input from ``stdin`` and spawns a process to evaluate the message. Input
to the prompt is kept in a history list so that past input can be replayed, similar to the history mechanism
in many Unix shells.

Modules: process, scheduler, semaphore, prompt, histor, channel

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
