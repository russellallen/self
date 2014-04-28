Native
======

    Last updated 4 January 2014

Introduced in Self 4.5, the ``native`` module allows you to generate and run native machine code for your platform from within a Self World. It is inspired by the work of Igor Stasenko on NativeBoost for Pharo.

Underlying Primitives
---------------------

The core functionality of the ``native`` system is the primitive ``_RunNativePassing:With:With:With:With:With:With:With:``, which when run on a byteVector containing the machine code for a standard C function using the "cdecl" calling convention, and passing eight other byteVectors (from the machine code side seen as "char*") will run the machine code in byteVector.

byteVectors inherit from ``traits byteVector`` the helper methods ``runNative``, ``runNativePassing:``, ``runNativePassing:With:`` etc.

Marshalling
-----------

The running machine code does not understand any of the Self World. It cannot access the virtual machine or Self objects. It can only see up to eight pointers to char arrays passed to it. It is the responsiblity of the calling Self code to marshal any objects into appropriate byteVectors to pass to the native code, and to unmarshal those byteVectors after the native code has run.

The native code should be careful not to overflow the passed byteVector buffers. It goes without saying that any native code run through the ``runNative`` primitive can blow up the virtual machine in a number of exciting and profitable ways.

There are a number of useful methods in ``traits byteVector`` to help with marshalling and unmarshalling, including ``cIntSize: bitSize Signed: bool At: index Put: anInt``, ``cIntSize: bitSize Signed: bool At: index`` etc in the "C Types" category.

Coding
------

Pharo's NativeBoost implements a x86 and x64 assembler in Smalltalk. As yet Self doesn't have this, but there is a helper object ``native support nasm`` which covers calling out to the Nasm_ assembler if it is installed.

.. _Nasm: http://www.nasm.us

Native Modules
--------------

The customary way to package native code is to create a object which delegates to ``native support nativeModuleParent``, and which has at least a single assignable slot ``currentPlatform``, and a single method ``adjustToPlatform``, which the VM will call at startup, and has the responsibility of ensuring that currentPlatform points to an appropriate platform specific object. It is also customary to put a wrapper object around this ensemble, with publicly accessible methods. See ``native example``.

FFI
---

It is possible to use ``native`` in conjunction with a ``fctProxy`` to dynamically call external C functions. In general, the method is to use ``foreignCodeDB at: pathToLib IfFail: failBlock`` to load the external library, ``lib lookupFunction: functionName`` to get the address of the function, ``fctProxy _PointerInByteVector: byteVectorSize4`` to get the C pointer, then pass that byteVector as a parameter to your native code. See ``native exampleBinding``.

Limitations
-----------

Callbacks aren't (yet) supported. Unlike NativeBoost, the machine code has no access to the virtual machine or to Self objects.

Hints
-----

If you wish to file out generated machine code stored in byteVectors, you will need to view the annotation of the byteVector and set the ``isComplete`` flag to ``Yes``, otherwise the ``transporter`` will complain.
