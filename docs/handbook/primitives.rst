.. raw:: latex

  \newpage

.. _pp-primitives:
.. _primitives:

Primitives
==========

Primitives are Self methods implemented by the virtual machine. The first character of a primitive’s
selector is an underscore (‘_’). You cannot define primitives yourself (unless you modify the
Virtual Machine), nor can you define slots beginning with an underscore.

Primitive failures
------------------

Every primitive call can take an optional argument defining how errors should be handled for this
call. To do this, the primitive is extended with an ``IfFail``: argument. For example, ``_AsObject``
becomes ``_AsObjectIfFail``:, and ``_IntAdd``: becomes ``_IntAdd:IfFail:``.

::

  > *3 _IntAdd: ’a’ IfFail: [ | :error. :name |
  (name, ’ failed with ’, error, ’.’) printLine. 0 ]*
  _IntAdd: failed with badTypeError.
  0        The primitive returns the result of evaluating the failure block.
  >

When a primitive fails, if the primitive call has an ``IfFail``: part, the message ``value:With:`` is
sent to the ``IfFail:`` argument, passing two strings: the name of the primitive and an error string
indicating the reason for failure. If the failing primitive call *does not* have an ``IfFail:`` part, the
message ``primitive:FailedWith:`` is sent to the receiver of the primitive call with the same two
strings as arguments.

The result returned by the error handler becomes the result of the primitive operation (0 in our example);
execution then continues normally. If you want the program to be aborted, you have to do
this explicitly within the error handler, for example by calling the standard ``error:`` method defined
in the default world.

The following table lists the error string prefixes passed by the VM to indicate the reason of the
primitive failure. If the error string consists of more than the prefix it will reveal more details about
the error.

.. index::
   single:  alignmentError

.. index::
   single:  argumentCountError

.. index::
   single:  primitive failure codes

.. index::
   single:  unassignableSlotError

.. index::
   single:  wrongNoOfArgsError

.. index::
   single:  Unix error codes

.. index::
   single:  stackOverflowError

.. index::
   single:  slotNameError

.. index::
   single:  reflectTypeError

.. index::
   single:  lonelyAssignmentSlotError

.. index::
   single:  liveProxyError

.. index::
   single:  deadProxyError

.. index::
   single:  noActivationError

.. index::
   single:  noDynamicLinkerError

.. index::
   single:  noParentSlot

.. index::
   single:  noProcessError

.. index::
   single:  noReceiverError

.. index::
   single:  noSenderSlot

.. index::
   single:  nullCharError

.. index::
   single:  nullPointerError

.. index::
   single:  overflowError

.. index::
   single:  outOfMemoryError

.. index::
   single:  parallelTWAINSError

.. index::
   single:  prematureEndOfInputError

.. index::
   single:  primitive failures

.. index::
   single:  primitive:FailedWith:

.. index::
   single:  primitiveFailedError

.. index::
   single:  primitiveNotDefinedError

.. index::
   single:  primitives

.. index::
   single:  divisionByZeroError



.. tabularcolumns:: p{5cm} p{10cm}
.. table:: Primitive failures

.. tabularcolumns:: p{4cm} p{13cm}
.. list-table:: Primitive failures
    :widths: 10 100
    :header-rows: 1

    *   - Prefix
        - Description
    *   - primitiveNotDefinedError 
        - Primitive not defined.
    *   - primitiveFailedError     
        - General primitive failure (for example, an argument has an invalid value).
    *   - badTypeError             
        - The receiver or an argument has the wrong type.
    *   - badTypeSealError         
        - Proxy’s type seal did not match expected type seal.
    *   - divisionByZeroError      
        - Division by zero.
    *   - overflowError            
        - Integer overflow. This can occur in integer arithmetic primitives or in UNIX (when the result is too large to be represented as an integer).
    *   - badSignError             
        - Integer receiver or argument has wrong sign.
    *   - alignmentError           
        - Bad word alignment in memory.
    *   - badIndexError            
        - The vector index (e.g. in ``_At:``) is out of bounds (too large or negative).
    *   - badSizeError             
        - An invalid size of a vector was specified, e.g. attempting to clone a vector with a negative size (see ``_Clone:Filler:`` and ``_CloneBytes:Filler:`` below).
    *   - reflectTypeError         
        - A mirror primitive was applied to the wrong kind of slot, e.g. ``_MirrorParentGroupAt:`` to a slot that isn’t a parent slot.
    *   - outOfMemoryError         
        - A primitive could not complete because its results would not fit in the existing space.
    *   - stackOverflowError       
        - The stack overflowed during execution of the primitive or program.
    *   - slotNameError            
        - Illegal slot name.
    *   - argumentCountError       
        - Wrong number of arguments.
    *   - unassignableSlotError    
        - This slot is not assignable.
    *   - lonelyAssignmentSlotError
        - Assignment slot must have a corresponding data slot.
    *   - parallelTWAINSError      
        - Can not invoke TWAINS primitive (another process is already using it).
    *   - noProcessError           
        - This process does not exist.
    *   - noActivationError        
        - This method activation does not exist.
    *   - noReceiverError          
        - This activation has no receiver.
    *   - noParentSlot             
        - This activation has no lexical parent.
    *   - noSenderSlot             
        - This activation has no sender slot.
    *   - deadProxyError           
        - This proxy is dead and can not be used.
    *   - liveProxyError           
        - This proxy is live and can not be used to hold a proxy result.
    *   - wrongNoOfArgsError       
        - Wrong number of arguments was supplied with call of foreign function.
    *   - nullPointerError         
        - Foreign function returned null pointer.
    *   - nullCharError            
        - Can not pass byte vector containing null char to foreign function expecting a string.
    *   - prematureEndOfInputError 
        - Premature end of input during parsing.
    *   - noDynamicLinkerError     
        - Primitive depends on dynamic linker which is not available in this system.
    *   - EPERM, ENOENT, ...       
        - These errors are returned by a UNIX primitive if a UNIX system call executed by the primitive fails. The UNIX error codes are defined in ``/usr/include/sys/errno.h``; see this file for details on the roughly 90 different UNIX error codes.


.. index::
   single:  _ErrorMessage

The ``_ErrorMessage`` primitive, sent to an error string returned by any primitive, returns a more
descriptive version of the error message; this is especially useful for UNIX errors.

Available primitives
--------------------

A complete list of primitives can be obtained by sending ``primitiveList`` to ``primitives``. Documentation
for a primitive (such as ``_Clone``), can be obtained using at:, thus::

    primitives at: ’_Clone’

A list of primitive names matching a pattern can be obtained thus::

    primitives match: ’_Memory*’

Some points to note when browsing primitives:

  * Since strings are special kinds of byte vectors, primitives taking byte vectors as arguments
    can usually take strings. The exception is that canonical strings cannot be passed to primitives
    that modify the object.

  * Integer arithmetic primitives take integer receivers and arguments; floating-point arithmetic
    primitives take floating-point receivers and arguments.

  * All comparison primitives return either true or false. Integer comparison primitives take integer
    receivers and arguments; floating-point comparison primitives take floating-point receivers
    and arguments.

  * The receiver of a mirror primitive must be a mirror (unless otherwise noted)


