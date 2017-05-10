.. _glossary:

Glossary
========

* A *slot* is a name-value pair. The value of a slot is often called its *contents*.

* An *object* is composed of a (possibly empty) set of slots and, optionally, a series of expressions called *code*. The Self implementation provides objects with indexable slots (vectors) via a set of primitives.

* A *data object* is an object without code.

* A *data slot* is a slot holding a data object. An *assignment slot* is a slot containing the *assignment primitive*. An *assignable data slot* is a data slot for which there is a corresponding assignment slot whose name consists of the data slot’s name followed by a colon. When an assignment slot is evaluated its argument is stored in the corresponding data slot.

* An *ordinary method* (or simply *method*) is an object with code and is stored as the contents of a slot. The method’s name (also called its *selector*) is the name of the slot in which it is stored.

* A *block* is an object representing a lexically-scoped closure (similar to a Smalltalk block).

* A *block method* is the method that is executed when a block is evaluated by sending it ``value``, ``value:``, ``value:With:``, etc. A block method is a special kind of method that is evaluated within the scope of its method and any lexically enclosing blocks.

* An ``activation object`` records the state of an executing method or block method. It is a clone of the method prototype used to store the method’s arguments and local slots during execution. There are two kinds of activation objects: ``ordinary method activation`` objects (or simply ``method activation`` objects) and ``block method activation`` objects.

* A ``non-lifo block`` is a block that is evaluated after the activation of its lexically enclosing block or method has returned. This results in an error in the current implementation.

* A ``non-local return`` is a return from a method activation resulting from performing a return (i.e., evaluating an expression preceded by the ‘^’ operator) from within a lexically enclosed block. A non-local return forces returns from all activations between the method activation and the activation of the block performing the return.

* The ``method holder`` of a method is the object containing the slot holding that method.

* The ``sending method holder`` of a message is the method holder of the method that sent it.

* A ``message`` is a request to an object to perform some operation. The object to which the request is sent is called the ``receiver``. A ``message send`` is the action of sending a message to a receiver.

* A *primitive send* is a message handled by invoking a *primitive*, a predefined function provided by the Self implementation.

* Messages that do not have an explicit receiver are known as *implicit-receiver messages*. The receiver is bound to ``self``.

* A *unary message* is a message consisting of a single identifier sent to a receiver. A *binary message* is a message consisting of an operator and a single argument sent to a receiver. A *keyword message* is a message consisting of one or more identifiers with trailing colons, each followed by an argument, sent to a receiver.

* *Unary*, *binary*, and *keyword slots* are slots with selectors that match unary, binary, and keyword messages, respectively.

* An *argument slot* is a slot in a method filled in with a value when the method is invoked.

* *Message lookup* is the process by which objects determine how to respond to a message (which slot to evaluate), by searching objects for slots matching the message.

* *Inheritance* is the mechanism by which message lookup searches objects for slots when the receiver’s slots are exhausted. An object’s *parent slots* contain objects that it inherits from.

* *Dynamic inheritance* is the modification of object behavior by setting an assignable parent slot.

* A *resend* allows a method to invoke the method that the first method (the one that invokes the resend) is overriding. A *directed resend* constrains the lookup to search a single parent slot.

* *Cloning* is the primitive operation returning an exact shallow copy (a *clone*) of an object, i.e. a new object containing exactly the same slots and code as the original object.

* A *prototype* is an object that is used as a template from which new objects are cloned.

* A *traits object* is a parent object containing shared behavior, playing a role somewhat similar to a class in a class-based system. Any Self implementation is required to provide traits objects for integers, floats, strings, and blocks (i.e. one object which is the parent of all integers, another object for floats, etc.).

* The *root context* is the object that provides the context (i.e., set of bindings) in which slot initializers are evaluated. This object is known as the *lobby*. During slot initialization, self is bound to the lobby. The lobby is also the sending method holder for any sends in the initializing expression.

* *nil* is the object used to initialize slots without explicit initializers. It is intended to indicate “not a useful object.” This object is provided by the Self implementation.
