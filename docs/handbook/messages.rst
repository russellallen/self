Messages
========

Self allows messages to be manipulated as objects when convenient. For example, if an object
fails to understand a message, the object is notified of the problem via a message whose arguments
include the selector of the message that was not understood. While most objects inherit default
behavior for handling this situation (by halting with an error), it is sometimes convenient for an object
to handle the situation itself, perhaps by resending the message to some other object. Objects
that do this are called transparent forwarders. An example is given in ``interceptor``.

A string has the basic ability to use itself as a message selector using the messages ``sendTo``: (normal
message sends), ``resendTo``: (resends), or ``sendTo:DelegatingTo:`` (delegated sends).
Each of these messages has a number of variations based on the number of arguments the message
has. For example, one would used ``sendTo:With:With:`` to send a message with ``at:Put:`` as the
selector and two arguments::

    'at:Put:' sendTo: aDict With: k With: v

.. note::

    Primitives such as ``_Print`` cannot be sent in the current system.

A selector, receiver, delegatee, methodHolder, and arguments can be bundled together in a ``message``
object. The message gets ``sent`` when the message object receives the send message. Message
objects are used to describe delayed actions, such as the actions that should occur just before or after
a snapshot is read. They are also used as an argument to new process creation (you can create a
new process to execute the message by sending it ``fork``).

Modules: sending, message, selector, interceptor

