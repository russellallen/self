**********
Appendices
**********

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

* Messages that do not have an explicit receiver are known as *implicit-receiver messages*. The receiver is bound to self.

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

* *Nil* is the object used to initialize slots without explicit initializers. It is intended to indicate “not a useful object.” This object is provided by the Self implementation.


Lexical overview
================

+-------------------------+---------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------+
|  small-letter           |    →    |       ‘a’ \| ‘b’ \| ... \| ‘z’                                                                                                                                       |
+-------------------------+---------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------+
|  cap-letter             |    →    |       ‘A’ \| ‘B’ \| ... \| ‘Z’                                                                                                                                       |
+-------------------------+---------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------+
|  letter                 |    →    |       small-letter \| cap-letter                                                                                                                                     |
+-------------------------+---------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------+
|  identifier             |    →    |       (small-letter \| ‘_’) {letter \| digit \| ‘_’}                                                                                                                 |
+-------------------------+---------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------+
|  small-keyword          |    →    |       identifier ‘:’                                                                                                                                                 |
+-------------------------+---------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------+
|  cap-keyword            |    →    |       cap-letter {letter \| digit \| ‘_’} ‘:’                                                                                                                        |
+-------------------------+---------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------+
|  argument-name          |    →    |       ‘:’ identifier                                                                                                                                                 |
+-------------------------+---------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------+
|  op-char                |    →    |       ‘!’ \| ‘@’ \| ‘\#’ \| ‘$’ \| ‘%’ \| ‘^’ \| ‘&’ \| ‘*’ \| ‘-’ \| ‘+’ \| ‘=’ \| ‘~’ \| ‘/’ \| ‘?’ \| ‘<’ \| ‘>’ \| ‘,’ \| ‘;’ \| ‘\|’ \| ‘‘’ \| ‘\\’             |
+-------------------------+---------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------+
|  operator               |    →    |       op-char {op-char}                                                                                                                                              |
+-------------------------+---------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------+
|  number                 |    →    |       [ ‘-’ ] (integer \| real)                                                                                                                                      |
+-------------------------+---------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------+
|  integer                |    →    |       [base] general-digit {general-digit}                                                                                                                           |
+-------------------------+---------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------+
|  real                   |    →    |       fixed-point \| float                                                                                                                                           |
+-------------------------+---------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------+
|  fixed-point            |    →    |       decimal ‘.’ decimal                                                                                                                                            |
+-------------------------+---------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------+
|  float                  |    →    |       decimal [ ‘.’ decimal ] (‘e’ \| ‘E’) [ ‘+’ \| ‘-’ ] decimal                                                                                                    |
+-------------------------+---------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------+
|  general-digit          |    →    |       digit \| letter                                                                                                                                                |
+-------------------------+---------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------+
|  decimal                |    →    |       digit {digit}                                                                                                                                                  |
+-------------------------+---------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------+
|  base                   |    →    |       decimal (‘r’ \| ‘R’)                                                                                                                                           |
+-------------------------+---------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------+
|  string                 |    →    |       ‘’’ { normal-char \| escape-char } ‘’’                                                                                                                         |
+-------------------------+---------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------+
|  normal-char            |    →    |       any character except ‘\\’ and ‘’’                                                                                                                              |
+-------------------------+---------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------+
|  escape-char            |    →    |       ‘\\t’ \| ‘\\b’ \| ‘\\n’ \| ‘\\f’ \| ‘\\r’ \| ‘\\v’ \| ‘\\a’ \| ‘\\0’ \| ‘\\\\’ \| ‘\\’’ \| ‘\\"’ \| ‘\\?’ \| numeric-escape                                    |
+-------------------------+---------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------+
|  numeric-escape         |    →    |       ‘\\x’ general-digit general-digit \| ( ‘\\d’ \| ‘\\o’ ) digit digit digit                                                                                      |
+-------------------------+---------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------+
|  comment                |    →    |       ‘"’ { comment-char } ‘"’                                                                                                                                       |
+-------------------------+---------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------+
|  comment-char           |    →    |       any character but ‘"’                                                                                                                                          |
+-------------------------+---------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------+


Syntax overview
===============

+-------------------------+---------+----------------------------------------------------------------------------------------------------------------------------------+
| expression              |    →    |      constant \| unary-message \| binary-message \| keyword-message \| ‘(’ expression ‘)’                                        |  
+-------------------------+---------+----------------------------------------------------------------------------------------------------------------------------------+
| constant                |    →    |      self \| number \| string \| object                                                                                          |
+-------------------------+---------+----------------------------------------------------------------------------------------------------------------------------------+
| unary-message           |    →    |      receiver unary-send \| resend ‘.’ unary-send                                                                                |
+-------------------------+---------+----------------------------------------------------------------------------------------------------------------------------------+
| unary-send              |    →    |      identifier                                                                                                                  |
+-------------------------+---------+----------------------------------------------------------------------------------------------------------------------------------+
| binary-message          |    →    |      receiver binary-send \| resend ‘.’ binary-send                                                                              |
+-------------------------+---------+----------------------------------------------------------------------------------------------------------------------------------+
| binary-send             |    →    |      operator expression                                                                                                         |
+-------------------------+---------+----------------------------------------------------------------------------------------------------------------------------------+
| keyword-message         |    →    |      receiver keyword-send \| resend ‘.’ keyword-send                                                                            |
+-------------------------+---------+----------------------------------------------------------------------------------------------------------------------------------+
| keyword-send            |    →    |      small-keyword expression { cap-keyword expression }                                                                         |
+-------------------------+---------+----------------------------------------------------------------------------------------------------------------------------------+
| receiver                |    →    |      [ expression ]                                                                                                              |
+-------------------------+---------+----------------------------------------------------------------------------------------------------------------------------------+
| resend                  |    →    |      resend \| identifier                                                                                                        |
+-------------------------+---------+----------------------------------------------------------------------------------------------------------------------------------+
| object                  |    →    |      regular-object \| block                                                                                                     |
+-------------------------+---------+----------------------------------------------------------------------------------------------------------------------------------+
| regular-object          |    →    |      ‘(’ [ ‘\|’ [ ‘{’ ‘}’ ‘=’ string ] slot-list ‘\|’ ] [ code ] ‘)’                                                             |
+-------------------------+---------+----------------------------------------------------------------------------------------------------------------------------------+
| block                   |    →    |      ‘[’ [ ‘\|’ slot-list    ‘\|’ ] [ code ] ‘]’                                                                                 |
+-------------------------+---------+----------------------------------------------------------------------------------------------------------------------------------+
| slot-list               |    →    |      { unannotated-slot-list \| annotated-slot-list }                                                                            |
+-------------------------+---------+----------------------------------------------------------------------------------------------------------------------------------+
| annotated-slot-list     |    →    |      ‘{’ string slot-list ‘}’                                                                                                    |
+-------------------------+---------+----------------------------------------------------------------------------------------------------------------------------------+
| unannotated-slot-list   |    →    |      { slot ‘.’} slot [ ‘.’ ]                                                                                                    |
+-------------------------+---------+----------------------------------------------------------------------------------------------------------------------------------+
| code                    |    →    |      { expression ‘.’} [ ‘^’ ] expression [ ‘.’ ]                                                                                |
+-------------------------+---------+----------------------------------------------------------------------------------------------------------------------------------+
| slot                    |    →    |      arg-slot \| data-slot \| binary-slot \| keyword-slot                                                                        |
+-------------------------+---------+----------------------------------------------------------------------------------------------------------------------------------+
| arg-slot                |    →    |      argument-name                                                                                                               |
+-------------------------+---------+----------------------------------------------------------------------------------------------------------------------------------+
| data-slot               |    →    |      slot-name \| slot-name ‘<-’ expression \| slot-name ‘=’ expression                                                          |
+-------------------------+---------+----------------------------------------------------------------------------------------------------------------------------------+
| unary-slot              |    →    |      slot-name ‘=’ regular-object                                                                                                |
+-------------------------+---------+----------------------------------------------------------------------------------------------------------------------------------+
| binary-slot             |    →    |      operator ‘=’ regular-object \| operator [identifier] ‘=’ regular-object                                                     |
+-------------------------+---------+----------------------------------------------------------------------------------------------------------------------------------+
| keyword-slot            |    →    |      small-keyword {cap-keyword} ‘=’ regular-object \| small-keyword identifier {cap-keyword identifier} ‘=’ regular-object      |
+-------------------------+---------+----------------------------------------------------------------------------------------------------------------------------------+
| slot-name               |    →    |      identifier \| parent-name                                                                                                   |
+-------------------------+---------+----------------------------------------------------------------------------------------------------------------------------------+
| parent-name             |    →    |      identifier ‘*’                                                                                                              |
+-------------------------+---------+----------------------------------------------------------------------------------------------------------------------------------+

Built-in types
==============

There are a small number of built-in types that are directly supported through primitives and syntax:

	*Integers* and *floats* are provided with primitives for performing arithmetic operations, comparisons etc.

	*Strings* have a *byte vector* part for storing the characters. Special string primitives are provided.

	*Blocks* are objects which combine code with an environment link. Used for control structures, they are described in section [2.1.7].

In addition, there are a number of VM-supported types described in the sections on the Self World
and the VM reference manual, such as *mirrors*, *processes*, *vectors*, *proxies* and *profilers*.

Glossary of Useful Selectors
============================

This glossary lists some useful selectors. It is by no means exhaustive.

**Copying**

	+--------+--------------------------------------------------------------------+
	| clone  | shallow copy (for use within an object; clients should use copy)   |
	+--------+--------------------------------------------------------------------+
	|  copy  | copy the receiver, possibly with embedded copies or initialization |
	+--------+--------------------------------------------------------------------+

**Comparing**

	*Equality*

	+-----------------+----------------------------------------------------------------------------+
	| =               |      equal                                                                 |
	+-----------------+----------------------------------------------------------------------------+
	| !=              |      not equal                                                             | 
	+-----------------+----------------------------------------------------------------------------+
	| hash            |      hash value                                                            | 
	+-----------------+----------------------------------------------------------------------------+
	| ==              |      identical (the same object; this is reflective and should be avoided) |
	+-----------------+----------------------------------------------------------------------------+
	| !==             |      not identical                                                         | 
	+-----------------+----------------------------------------------------------------------------+

	*Ordered*

	+---------------------------------------------+------------------------------------------+
	| <                                           |     less than                            |
	+---------------------------------------------+------------------------------------------+
	| >                                           |     greater than                         |
	+---------------------------------------------+------------------------------------------+
	| <=                                          |     less than or equal                   |
	+---------------------------------------------+------------------------------------------+
	| >=                                          |     greater than or equal                |
	+---------------------------------------------+------------------------------------------+
	| compare:IfLess:Equal:Greater:               |     three way comparison                 |
	+---------------------------------------------+------------------------------------------+
	| compare:IfLess:Equal:Greater:Incomparable:  |     three way comparison with failure    |
	+---------------------------------------------+------------------------------------------+

**Numeric operations**

	+-----------------+-----------------------------------------------------------------+
	| \+              |    add                                                          |    
	+-----------------+-----------------------------------------------------------------+
	| \-              |    subtract                                                     |    
	+-----------------+-----------------------------------------------------------------+
	| \*              |    multiply                                                     |    
	+-----------------+-----------------------------------------------------------------+
	| /               |    divide                                                       |    
	+-----------------+-----------------------------------------------------------------+
	| /=              |    divide exactly (returns float)                               |    
	+-----------------+-----------------------------------------------------------------+
	| /~              |    divide and round to integer (tends to round up)              |    
	+-----------------+-----------------------------------------------------------------+
	| /+              |    divide and round up to integer                               |    
	+-----------------+-----------------------------------------------------------------+
	| /-%             |    divide and round down to integer modulus                     |    
	+-----------------+-----------------------------------------------------------------+
	| absoluteValue   |    absolute value                                               |    
	+-----------------+-----------------------------------------------------------------+
	| inverse         |    multiplicative inverse                                       |    
	+-----------------+-----------------------------------------------------------------+
	| negate          |    additive inverse                                             |    
	+-----------------+-----------------------------------------------------------------+
	| ceil            |    round towards positive infinity                              |    
	+-----------------+-----------------------------------------------------------------+
	| floor           |    round towards negative infinity                              |    
	+-----------------+-----------------------------------------------------------------+
	| truncate        |    truncate towards zero                                        |    
	+-----------------+-----------------------------------------------------------------+
	| round           |    round                                                        |    
	+-----------------+-----------------------------------------------------------------+
	| asFloat         |    coerce to float                                              |    
	+-----------------+-----------------------------------------------------------------+
	| asInteger       |    coerce to integer                                            |    
	+-----------------+-----------------------------------------------------------------+
	| double          |    multiply by two                                              |    
	+-----------------+-----------------------------------------------------------------+
	| quadruple       |    multiply by four                                             |    
	+-----------------+-----------------------------------------------------------------+
	| half            |    divide by two                                                |    
	+-----------------+-----------------------------------------------------------------+
	| quarter         |    divide by four                                               |    
	+-----------------+-----------------------------------------------------------------+
	| min:            |    minimum of receiver and argument                             |    
	+-----------------+-----------------------------------------------------------------+
	| max:            |    maximum of receiver and argument                             |    
	+-----------------+-----------------------------------------------------------------+
	| mean:           |    mean of receiver and argument                                |    
	+-----------------+-----------------------------------------------------------------+
	| pred            |    predecessor                                                  |    
	+-----------------+-----------------------------------------------------------------+
	| predecessor     |    predecessor                                                  |    
	+-----------------+-----------------------------------------------------------------+
	| succ            |    successor                                                    |    
	+-----------------+-----------------------------------------------------------------+
	| successor       |    successor                                                    |    
	+-----------------+-----------------------------------------------------------------+
	| power:          |    raise receiver to integer power                              |    
	+-----------------+-----------------------------------------------------------------+
	| log:            |    logarithm of argument base receiver, rounded down to integer |    
	+-----------------+-----------------------------------------------------------------+
	| square          |    square                                                       |    
	+-----------------+-----------------------------------------------------------------+
	| squareRoot      |    square root                                                  |    
	+-----------------+-----------------------------------------------------------------+
	| factorial       |    factorial                                                    |    
	+-----------------+-----------------------------------------------------------------+
	| fibonacci       |    fibonacci                                                    |    
	+-----------------+-----------------------------------------------------------------+
	| sign            |    signum (-1, 0, 1)                                            |    
	+-----------------+-----------------------------------------------------------------+
	| even            |    true if receiver is even                                     |    
	+-----------------+-----------------------------------------------------------------+
	| odd             |    true if receiver is odd                                      |    
	+-----------------+-----------------------------------------------------------------+

**Bitwise operations (integers)**	

	+-----------+---------------------------+
	| &&  	    |     and                   |
	+-----------+---------------------------+
	| \|\|      |    or                     |
	+-----------+---------------------------+
	| ^^  	    |    xor                    |
	+-----------+---------------------------+
	| complement|    bitwise complement     |
	+-----------+---------------------------+
	| <<        |    logical left shift     |
	+-----------+---------------------------+
	| >>        |    logical right shift    |
	+-----------+---------------------------+
	| <+  	    |    arithmetic left shift  |
	+-----------+---------------------------+
	| +>  	    |    arithmetic right shift |
	+-----------+---------------------------+

**Logical operations (booleans)**

	+--------------------------+-----------------------------------------------------------------------+
	| &&                       |    and                                                                |  
	+--------------------------+-----------------------------------------------------------------------+
	| \|\|                     |    or                                                                 |  
	+--------------------------+-----------------------------------------------------------------------+
	| ^^                       |    xor                                                                |  
	+--------------------------+-----------------------------------------------------------------------+
	| not                      |    logical complement                                                 |  
	+--------------------------+-----------------------------------------------------------------------+

**Constructing**

	+-----------------+------------------------------------------------------------------------+
	| \@              |    point construction (receiver and argument are integers)             |  
	+-----------------+------------------------------------------------------------------------+
	| \#              |    rectangle construction (receiver and argument are points)           |  
	+-----------------+------------------------------------------------------------------------+
	| \#\#            |    rectangle construction (receiver is a point, argument is an extent) |
	+-----------------+------------------------------------------------------------------------+
	| &               |    collection construction (result can be converted into collection)   |  
	+-----------------+------------------------------------------------------------------------+
	| ,               |    concatenation                                                       |  
	+-----------------+------------------------------------------------------------------------+

**Printing**

	+------------------------+--------------------------------------------------------------------------+
	| print                  |       print object on stdout                                             |      
	+------------------------+--------------------------------------------------------------------------+
	| printLine              |       print object on stdout with trailing newline                       |    
	+------------------------+--------------------------------------------------------------------------+
	| printString            |       return a string label                                              |    
	+------------------------+--------------------------------------------------------------------------+
	| printStringDepth:      |       return a string label with depth limitation request                |    
	+------------------------+--------------------------------------------------------------------------+
	| printStringSize:       |       return a string label with number of characters limitation request |
	+------------------------+--------------------------------------------------------------------------+
	| printStringSize:Depth: |     return a string label with depth and size limitation request         |   
	+------------------------+--------------------------------------------------------------------------+

**Control**

	*Block evaluation*

	+--------------------+---------------------------------------------------------------------------------------+
	| value[:{With:}]    |      evaluate a block, passing arguments                                              |     
	+--------------------+---------------------------------------------------------------------------------------+
	
	*Selection*
	                                                                                                               
	+--------------------+---------------------------------------------------------------------------------------+
	| ifTrue:            |      evaluate argument if receiver is true                                            |      
	+--------------------+---------------------------------------------------------------------------------------+
	| ifFalse:           |      evaluate argument if receiver is false                                           |      
	+--------------------+---------------------------------------------------------------------------------------+
	| ifTrue:False:      |      evaluate first arg if true, second arg if false                                  |      
	+--------------------+---------------------------------------------------------------------------------------+
	| ifFalse:True:      |      evaluate first arg if false, second arg if true                                  |      
	+--------------------+---------------------------------------------------------------------------------------+
	
	*Local exiting*
	                                                                                                               
	+--------------------+---------------------------------------------------------------------------------------+
	| exit               |      exit block and return nil if block’s argument is evaluated                       |      
	+--------------------+---------------------------------------------------------------------------------------+
	| exitValue          |      exit block and return a value if block’s argument is evaluated                   |      
	+--------------------+---------------------------------------------------------------------------------------+
	
	*Basic looping*
	                                                                                                               
	+--------------------+---------------------------------------------------------------------------------------+
	| loop               |      repeat the block forever                                                         |      
	+--------------------+---------------------------------------------------------------------------------------+
	| loopExit           |      repeat the block until argument is evaluated; then exit and return nil           |      
	+--------------------+---------------------------------------------------------------------------------------+
	| loopExitValue      |      repeat the block until argument is evaluated; then exit and return a value       |      
	+--------------------+---------------------------------------------------------------------------------------+
	
	*Pre-test looping*
	                                                                                                               
	+--------------------+---------------------------------------------------------------------------------------+
	| whileTrue          |      repeat the receiver until it evaluates to true                                   |      
	+--------------------+---------------------------------------------------------------------------------------+
	| whileFalse         |      repeat the receiver until it evaluates to false                                  |      
	+--------------------+---------------------------------------------------------------------------------------+
	| whileTrue:         |      repeat the receiver and argument until receiver evaluates to true                |      
	+--------------------+---------------------------------------------------------------------------------------+
	| whileFalse:        |      repeat the receiver and argument until receiver evaluates to false               |      
	+--------------------+---------------------------------------------------------------------------------------+
	
	*Post-test looping*
	                                                                                                               
	+--------------------+---------------------------------------------------------------------------------------+
	| untilTrue:         |      repeat the receiver and argument until argument evaluates to true                |      
	+--------------------+---------------------------------------------------------------------------------------+
	| untilFalse:        |      repeat the receiver and argument until argument evaluates to false               |      
	+--------------------+---------------------------------------------------------------------------------------+
	
	*Iterators*
	                                                                                                               
	+--------------------+---------------------------------------------------------------------------------------+
	| do:                |      iterate, passing each element to the argument block                              |      
	+--------------------+---------------------------------------------------------------------------------------+
	| to:By:Do:          |      iterate, with stepping                                                           |      
	+--------------------+---------------------------------------------------------------------------------------+
	| to:Do:             |      iterate forward                                                                  |      
	+--------------------+---------------------------------------------------------------------------------------+
	| upTo:By:Do:        |      iterate forward, without last element, with stepping                             |      
	+--------------------+---------------------------------------------------------------------------------------+
	| upTo:Do:           |      iterate forward, without last element                                            |      
	+--------------------+---------------------------------------------------------------------------------------+
	| downTo:By:Do:      |      reverse iterate, with stepping                                                   |      
	+--------------------+---------------------------------------------------------------------------------------+
	| downTo:Do:         |      reverse iterate                                                                  |      
	+--------------------+---------------------------------------------------------------------------------------+

**Collections**

  *Sizing*
  
  +---------------------------------------------------+------------------------------------------------------------------------------------------------------------------+
  | isEmpty test                                      |          if collection is empty                                                                                  | 
  +---------------------------------------------------+------------------------------------------------------------------------------------------------------------------+
  | size                                              |         return number of elements in collection                                                                  |  
  +---------------------------------------------------+------------------------------------------------------------------------------------------------------------------+
  
  *Adding*                                                                                                                                           
                                                                                                                                                     
  +---------------------------------+------------------------------------------------------------------------------------------------------------------+
  | add:                            |         add argument element to collection receiver                                                              |  
  +---------------------------------+------------------------------------------------------------------------------------------------------------------+
  | addAll:                         |         add all elements of argument to receiver                                                                 |  
  +---------------------------------+------------------------------------------------------------------------------------------------------------------+
  | at:Put:                         |         add key-value pair                                                                                       |  
  +---------------------------------+------------------------------------------------------------------------------------------------------------------+
  | at:Put:IfAbsent:                |         add key-value pair, evaluating block if key is absent                                                    |  
  +---------------------------------+------------------------------------------------------------------------------------------------------------------+
  | addFirst:                       |         add element to head of list                                                                              | 
  +---------------------------------+------------------------------------------------------------------------------------------------------------------+
  | addLast:                        |         add element to tail of list                                                                              | 
  +---------------------------------+------------------------------------------------------------------------------------------------------------------+
  | copyAddAll:                     |         return a copy containing the elements of both receiver and argument                                      |  
  +---------------------------------+------------------------------------------------------------------------------------------------------------------+
  | copyContaining:                 |         return a copy containing only the elements of the argument                                               |  
  +---------------------------------+------------------------------------------------------------------------------------------------------------------+
  
                                                                                                                                                     
  *Removing*                                                                                                                                         
                                                                                                                                                     
  +---------------------------------+------------------------------------------------------------------------------------------------------------------+
  | remove:                         |         remove the given element                                                                                 |  
  +---------------------------------+------------------------------------------------------------------------------------------------------------------+
  | remove:IfAbsent:                |         remove the given element, evaluating block if absent                                                     |  
  +---------------------------------+------------------------------------------------------------------------------------------------------------------+
  | removeAll                       |         remove all elements                                                                                      |  
  +---------------------------------+------------------------------------------------------------------------------------------------------------------+
  | removeFirst                     |         remove first element from list                                                                           |  
  +---------------------------------+------------------------------------------------------------------------------------------------------------------+
  | removeLast                      |         remove last element from list                                                                            |  
  +---------------------------------+------------------------------------------------------------------------------------------------------------------+
  | removeAllOccurences:            |        remove all occurrences of this element from list                                                          | 
  +---------------------------------+------------------------------------------------------------------------------------------------------------------+
  | removeKey:                      |        remove element at the given key                                                                           | 
  +---------------------------------+------------------------------------------------------------------------------------------------------------------+
  | removeKey:IfAbsent:             |        remove element at the given key, evaluating block if absent                                               | 
  +---------------------------------+------------------------------------------------------------------------------------------------------------------+
  | copyRemoveAll                   |         return an empty copy                                                                                     |   
  +---------------------------------+------------------------------------------------------------------------------------------------------------------+
  
  
  *Accessing*
                                                                                                                                                     
  +---------------------------------+------------------------------------------------------------------------------------------------------------------+
  | first                           |        return the first element                                                                                  | 
  +---------------------------------+------------------------------------------------------------------------------------------------------------------+
  | last                            |        return the last element                                                                                   | 
  +---------------------------------+------------------------------------------------------------------------------------------------------------------+
  | includes:                       |        test if element is member of the collection                                                               | 
  +---------------------------------+------------------------------------------------------------------------------------------------------------------+
  | occurrencesOf:                  |        return number of occurences of element in collection                                                      | 
  +---------------------------------+------------------------------------------------------------------------------------------------------------------+
  | findFirst:IfPresent:IfAbsent:   |        evaluate present block on first element found satisfying criteria, absent block if no such element        | 
  +---------------------------------+------------------------------------------------------------------------------------------------------------------+
  | at:                             |         return element at the given key                                                                          |  
  +---------------------------------+------------------------------------------------------------------------------------------------------------------+
  | at:IfAbsent:                    |         return element at the given key, evaluating block if absent                                              |  
  +---------------------------------+------------------------------------------------------------------------------------------------------------------+
  | includesKey:                    |         test if collection contains a given key                                                                  |   
  +---------------------------------+------------------------------------------------------------------------------------------------------------------+
  
  *Iterating*                                                                                                                                        
                                                                                                                                                     
  +---------------------------------+------------------------------------------------------------------------------------------------------------------+
  | do:                             |         iterate, passing each element to argument block                                                          |   
  +---------------------------------+------------------------------------------------------------------------------------------------------------------+
  | doFirst:Middle:Last:IfEmpty:    |         iterate, with special behavior for first and last                                                        |   
  +---------------------------------+------------------------------------------------------------------------------------------------------------------+
  | doFirst:MiddleLast:IfEmpty:     |         iterate, with special behavior for first                                                                 | 
  +---------------------------------+------------------------------------------------------------------------------------------------------------------+
  | doFirstLast:Middle:IfEmpty:     |         iterate, with special behavior for ends                                                                  |   
  +---------------------------------+------------------------------------------------------------------------------------------------------------------+
  | doFirstMiddle:Last:IfEmpty:     |         iterate, with special behavior for last                                                                  |   
  +---------------------------------+------------------------------------------------------------------------------------------------------------------+
  | reverseDo:                      |         iterate backwards through list                                                                           | 
  +---------------------------------+------------------------------------------------------------------------------------------------------------------+
  | with:Do:                        |         co-iterate, passing corresponding elements to block                                                      |   
  +---------------------------------+------------------------------------------------------------------------------------------------------------------+
  
  *Reducing*                                                                                                                                         
                                                                                                                                                     
  +---------------------------------+------------------------------------------------------------------------------------------------------------------+
  | max                             |         return maximum element                                                                                   |  
  +---------------------------------+------------------------------------------------------------------------------------------------------------------+
  | mean                            |         return mean of elements                                                                                  |  
  +---------------------------------+------------------------------------------------------------------------------------------------------------------+
  | min                             |         return minimum element                                                                                   |  
  +---------------------------------+------------------------------------------------------------------------------------------------------------------+
  | sum                             |         return sum of elements                                                                                   |  
  +---------------------------------+------------------------------------------------------------------------------------------------------------------+
  | product                         |         return product of elements                                                                               |  
  +---------------------------------+------------------------------------------------------------------------------------------------------------------+
  | reduceWith:                     |         evaluate reduction block with elements                                                                   |  
  +---------------------------------+------------------------------------------------------------------------------------------------------------------+
  | reduceWith:IfEmpty:             |         evaluate reduction block with elements, evaluating block if empty                                        |  
  +---------------------------------+------------------------------------------------------------------------------------------------------------------+
  
  *Transforming*                                                                                                                                     
                                                                                                                                                     
  +---------------------------------+------------------------------------------------------------------------------------------------------------------+
  | asByteVector                    |         return a byte vector with same elements                                                                  |  
  +---------------------------------+------------------------------------------------------------------------------------------------------------------+
  | asString                        |         return a string with same elements                                                                       |  
  +---------------------------------+------------------------------------------------------------------------------------------------------------------+
  | asVector                        |         return a vector with same elements                                                                       |  
  +---------------------------------+------------------------------------------------------------------------------------------------------------------+
  | asList                          |         return a list with the same elements                                                                     |  
  +---------------------------------+------------------------------------------------------------------------------------------------------------------+
  | filterBy:Into:                  |         add elements that satisfy filter block to a collection                                                   |  
  +---------------------------------+------------------------------------------------------------------------------------------------------------------+
  | mapBy:                          |         add result of evaluating map block with each element to this collection                                  |  
  +---------------------------------+------------------------------------------------------------------------------------------------------------------+
  | mapBy:Into:                     |         add result of evaluating map block with each element to a collection                                     |  
  +---------------------------------+------------------------------------------------------------------------------------------------------------------+
  
  *Sorting*                                                                                                                                          
                                                                                                                                                     
  +---------------------------------+------------------------------------------------------------------------------------------------------------------+
  | sort                            |         sort receiver in place                                                                                   |  
  +---------------------------------+------------------------------------------------------------------------------------------------------------------+
  | copySorted                      |         copy sorted in ascending order                                                                           |  
  +---------------------------------+------------------------------------------------------------------------------------------------------------------+
  | copyReverseSorted               |         copy sorted in descending order                                                                          |  
  +---------------------------------+------------------------------------------------------------------------------------------------------------------+
  | copySortedBy:                   |         copy sorted by custom sort criteria                                                                      |  
  +---------------------------------+------------------------------------------------------------------------------------------------------------------+
  | sortedDo:                       |         iterate in ascending order                                                                               |  
  +---------------------------------+------------------------------------------------------------------------------------------------------------------+
  | reverseSortedDo:                |         iterate in descending order                                                                              |  
  +---------------------------------+------------------------------------------------------------------------------------------------------------------+
  | sortedBy:Do:                    |         iterate in order of custom sort criteria                                                                 |  
  +---------------------------------+------------------------------------------------------------------------------------------------------------------+
  
  *Indexable-specific*                                                                                                                               
                                                                                                                                                     
  +---------------------------------+------------------------------------------------------------------------------------------------------------------+
  | firstKey                        |         return the first key                                                                                     |  
  +---------------------------------+------------------------------------------------------------------------------------------------------------------+
  | lastKey                         |         return the last key                                                                                      |  
  +---------------------------------+------------------------------------------------------------------------------------------------------------------+
  | loopFrom:Do:                    |         circularly iterate, starting from element n                                                              |  
  +---------------------------------+------------------------------------------------------------------------------------------------------------------+
  | copyAddFirst:                   |         return a copy of this collection with element added to beginning                                         |  
  +---------------------------------+------------------------------------------------------------------------------------------------------------------+
  | copyAddLast:                    |         return a copy of this collection with element added to end                                               |  
  +---------------------------------+------------------------------------------------------------------------------------------------------------------+
  | copyFrom:                       |         return a copy of this collection from element n                                                          |  
  +---------------------------------+------------------------------------------------------------------------------------------------------------------+
  | copyFrom:UpTo:                  |         return a copy of this collection from element n up to element m                                          |  
  +---------------------------------+------------------------------------------------------------------------------------------------------------------+
  | copyWithoutLast                 |         return a copy of this collection without the last element                                                |  
  +---------------------------------+------------------------------------------------------------------------------------------------------------------+
  | copySize:                       |         copy with size n                                                                                         |  
  +---------------------------------+------------------------------------------------------------------------------------------------------------------+
  | copySize:FillingWith:           |         copy with size n, filling in any extra elements with second arg                                          |  
  +---------------------------------+------------------------------------------------------------------------------------------------------------------+

**Timing**

	+-----------------------------------------------------------+----------------------------------------------------------------------------------------------------------------------------------------------------+
	| realTime                                                  |    elapsed real time to execute a block                                                                                                            | 
	+-----------------------------------------------------------+----------------------------------------------------------------------------------------------------------------------------------------------------+
	| cpuTime                                                   |    CPU time to execute a block                                                                                                                     |   
	+-----------------------------------------------------------+----------------------------------------------------------------------------------------------------------------------------------------------------+
	| userTime                                                  |    CPU time in user process to execute a block                                                                                                     |   
	+-----------------------------------------------------------+----------------------------------------------------------------------------------------------------------------------------------------------------+
	| systemTime                                                |    CPU time in system kernel to execute a block                                                                                                    |   
	+-----------------------------------------------------------+----------------------------------------------------------------------------------------------------------------------------------------------------+
	| totalTime                                                 |    system + user time to execute a block                                                                                                           |   
	+-----------------------------------------------------------+----------------------------------------------------------------------------------------------------------------------------------------------------+

**Message Sending**
                                                                                                                                                                                                                
	*Sending* (like Small talk ``perform``; receiver is a string)                                                                                                                                               
	                                                                                                                                                                                                                
	+-----------------------------------------------------------+----------------------------------------------------------------------------------------------------------------------------------------------------+
	| sendTo:{With:}                                            |    send receiver string as a message                                                                                                               |   
	+-----------------------------------------------------------+----------------------------------------------------------------------------------------------------------------------------------------------------+
	| sendTo:WithArguments:                                     |    indirect send with arguments in a vector                                                                                                        |   
	+-----------------------------------------------------------+----------------------------------------------------------------------------------------------------------------------------------------------------+
	| sendTo:DelegatingTo:{With:}                               |    indirect delegated send                                                                                                                         |   
	+-----------------------------------------------------------+----------------------------------------------------------------------------------------------------------------------------------------------------+
	| sendTo:DelegatingTo:WithArguments:                        |    indirect delegated send with arg vector                                                                                                         |   
	+-----------------------------------------------------------+----------------------------------------------------------------------------------------------------------------------------------------------------+
	| resendTo:{With:}                                          |    indirect resend                                                                                                                                 |   
	+-----------------------------------------------------------+----------------------------------------------------------------------------------------------------------------------------------------------------+
	| resendTo:WithArguments:                                   |    indirect resend with arguments in a vector                                                                                                      |   
	+-----------------------------------------------------------+----------------------------------------------------------------------------------------------------------------------------------------------------+

	*Message object protocol*
	                                                                                                                                                                                                                
	+-----------------------------------------------------------+----------------------------------------------------------------------------------------------------------------------------------------------------+
	| send                                                      |    perform the send described by a message object                                                                                                  |   
	+-----------------------------------------------------------+----------------------------------------------------------------------------------------------------------------------------------------------------+
	| fork                                                      |    start a new process; the new process performs the message                                                                                       |   
	+-----------------------------------------------------------+----------------------------------------------------------------------------------------------------------------------------------------------------+
	| receiver:                                                 |    set receiver                                                                                                                                    |   
	+-----------------------------------------------------------+----------------------------------------------------------------------------------------------------------------------------------------------------+
	| selector:                                                 |    set selector                                                                                                                                    |   
	+-----------------------------------------------------------+----------------------------------------------------------------------------------------------------------------------------------------------------+
	| methodHolder:                                             |    set method holder                                                                                                                               |   
	+-----------------------------------------------------------+----------------------------------------------------------------------------------------------------------------------------------------------------+
	| delegatee:                                                |    set delegatee of the message object                                                                                                             |   
	+-----------------------------------------------------------+----------------------------------------------------------------------------------------------------------------------------------------------------+
	| arguments:                                                |    set arguments (packaged in a vector)                                                                                                            |   
	+-----------------------------------------------------------+----------------------------------------------------------------------------------------------------------------------------------------------------+
	| receiver:Selector:                                        |    set receiver and selector                                                                                                                       |   
	+-----------------------------------------------------------+----------------------------------------------------------------------------------------------------------------------------------------------------+
	| receiver:Selector:Arguments:                              |    set receiver, selector, and arguments                                                                                                           |   
	+-----------------------------------------------------------+----------------------------------------------------------------------------------------------------------------------------------------------------+
	| receiver:Selector:Type:Delegatee:MethodHolder:Arguments:  |    set all components                                                                                                                              |   
	+-----------------------------------------------------------+----------------------------------------------------------------------------------------------------------------------------------------------------+

**Reflection (mirrors)**
                                                                                                                                                                                                                
	+-----------------------------------------------------------+----------------------------------------------------------------------------------------------------------------------------------------------------+
	| reflect:                                                  |    returns a mirror on the argument                                                                                                                |   
	+-----------------------------------------------------------+----------------------------------------------------------------------------------------------------------------------------------------------------+
	| reflectee                                                 |    returns the object the mirror receiver reflects                                                                                                 |   
	+-----------------------------------------------------------+----------------------------------------------------------------------------------------------------------------------------------------------------+
	| contentsAt:                                               |    returns a mirror on the contents of slot n                                                                                                      |   
	+-----------------------------------------------------------+----------------------------------------------------------------------------------------------------------------------------------------------------+
	| isAssignableAt:                                           |    tests if slot n is an assignable slot                                                                                                           |   
	+-----------------------------------------------------------+----------------------------------------------------------------------------------------------------------------------------------------------------+
	| isParentAt:                                               |    tests if slot n is a parent slot                                                                                                                |   
	+-----------------------------------------------------------+----------------------------------------------------------------------------------------------------------------------------------------------------+
	| isArgumentAt:                                             |    tests if slot n is an argument slot                                                                                                             |   
	+-----------------------------------------------------------+----------------------------------------------------------------------------------------------------------------------------------------------------+
	| parentPriorityAt:                                         |    returns the parent priority of slot n                                                                                                           |   
	+-----------------------------------------------------------+----------------------------------------------------------------------------------------------------------------------------------------------------+
	| slotAt:                                                   |    returns a slot object representing slot n                                                                                                       |   
	+-----------------------------------------------------------+----------------------------------------------------------------------------------------------------------------------------------------------------+
	| contentsAt:                                               |    returns the contents of the slot named n                                                                                                        |   
	+-----------------------------------------------------------+----------------------------------------------------------------------------------------------------------------------------------------------------+
	| visibilityAt:                                             |    returns a visibility object representing visibility of slot n                                                                                   |   
	+-----------------------------------------------------------+----------------------------------------------------------------------------------------------------------------------------------------------------+
	
**System-wide Enumerations (messages sent to the oddball object browse)**
	                                                                                                                                                                                                                
	+-----------------------------------------------------------+----------------------------------------------------------------------------------------------------------------------------------------------------+
	| all[Limit:]                                               |    returns a vector of mirrors on all objects in the system (up to the limit)                                                                      |   
	+-----------------------------------------------------------+----------------------------------------------------------------------------------------------------------------------------------------------------+
	| referencesOf:[Limit:]                                     |    returns a vector of mirrors on all objects referring to arg (up to the limit)                                                                   |   
	+-----------------------------------------------------------+----------------------------------------------------------------------------------------------------------------------------------------------------+
	| referencesOfReflectee:[Limit:]                            |    returns a vector of mirrors on all objects referring to argument’s reflectee (up to the limit); allows one to find references to a method       |   
	+-----------------------------------------------------------+----------------------------------------------------------------------------------------------------------------------------------------------------+
	| childrenOf:[Limit:]                                       |    returns a vector of mirrors on all objects with a parent slot referring to the given object (up to the limit)                                   |   
	+-----------------------------------------------------------+----------------------------------------------------------------------------------------------------------------------------------------------------+
	| implementorsOf:[Limit:]                                   |    returns a vector of mirrors on objects with slots whose names match the given selector (up to the limit)                                        |   
	+-----------------------------------------------------------+----------------------------------------------------------------------------------------------------------------------------------------------------+
	| sendersOf:[Limit:]                                        |    returns a vector of mirrors on methods whose selectors match the given selector (up to the limit)                                               |   
	+-----------------------------------------------------------+----------------------------------------------------------------------------------------------------------------------------------------------------+
	
**Debugging**
	
	+-----------------------------------------------------------+----------------------------------------------------------------------------------------------------------------------------------------------------+
	| halt                                                      |    halt the current process                                                                                                                        |   
	+-----------------------------------------------------------+----------------------------------------------------------------------------------------------------------------------------------------------------+
	| halt:                                                     |    halt and print a message string                                                                                                                 |   
	+-----------------------------------------------------------+----------------------------------------------------------------------------------------------------------------------------------------------------+
	| error:                                                    |    halt, print an error message, and display the stack                                                                                             |   
	+-----------------------------------------------------------+----------------------------------------------------------------------------------------------------------------------------------------------------+
	| warning:                                                  |    beep, print a warning message, and continue                                                                                                     |   
	+-----------------------------------------------------------+----------------------------------------------------------------------------------------------------------------------------------------------------+

**Virtual Machine-Generated**                                                                                                                                                                                   

	*Errors*
	
	+---------------------------------------------------------------------------+-----------------------------------------------------------------------------+
	| undefinedSelector:Type:Delegatee:MethodHolder:Arguments:                  |       lookup found no matching slot                                         |
	+---------------------------------------------------------------------------+-----------------------------------------------------------------------------+
	| ambiguousSelector:Type:Delegatee:MethodHolder:Arguments:                  |       lookup found more than one matching slot                              |
	+---------------------------------------------------------------------------+-----------------------------------------------------------------------------+
	| missingParentSelector:Type:Delegatee:MethodHolder:Arguments:              |       parent slot through which resend was delegated was not found          |
	+---------------------------------------------------------------------------+-----------------------------------------------------------------------------+
	| performTypeErrorSelector:Type:Delegatee:MethodHolder:Arguments:           |       first argument to the _Perform primitive was not a canonical string   |
	+---------------------------------------------------------------------------+-----------------------------------------------------------------------------+
	| mismatchedArgumentCountSelector:Type:Delegatee:MethodHolder:Arguments:    |       number of args supplied to _Perform primitive does not match selector |
	+---------------------------------------------------------------------------+-----------------------------------------------------------------------------+
	| primitiveFailedError:Name:                                                |       the named primitive failed with given error string                    |
	+---------------------------------------------------------------------------+-----------------------------------------------------------------------------+
	
	*Other system-triggered messages*
	
	+-------------------------------------------------+----------------------------------------------+
	| postRead                                        |    slot to evaluate after reading a snapshot |
	+-------------------------------------------------+----------------------------------------------+
	
	
Every Menu Item in the Programming Environment
==============================================

This table only covers the middle-button menus, the right-button (morph) menu is described elsewhere.
It merges items from several menus: the background menu, the outliner whole-object
menu, the outliner category menu, the outliner slot menu, the text editor menu, the debugger stack
menu, the iterator object menus, and the changed module morph menu.

	**Table 7: Menu Items**
	
  +---------------------------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
  |   Label                               |    Function                                                                                                                                                                                                                                                                                                                            |     
  +=======================================+========================================================================================================================================================================================================================================================================================================================================+
  |   Add Category                        |    Adds a category to an object or category.                                                                                                                                                                                                                                                                                           |     
  +---------------------------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
  |   Add Slot                            |    Adds a slot to an object or category.                                                                                                                                                                                                                                                                                               |     
  +---------------------------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
  |   Added or Changed Slots              |    On a module morph, enumerates slots added/changed since last save.                                                                                                                                                                                                                                                                  |     
  +---------------------------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
  |   All Modules                         |    Summons a hierarchical list of all modules from the changed modules morph.                                                                                                                                                                                                                                                          |     
  +---------------------------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
  |   All Slots                           |    On a module morph, enumerates its slots.                                                                                                                                                                                                                                                                                            |     
  +---------------------------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
  |   Changed Modules                     |    Summons a list of changed modules.                                                                                                                                                                                                                                                                                                  |     
  +---------------------------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
  |   Children                            |    Enumerate an object’s children.                                                                                                                                                                                                                                                                                                     |     
  +---------------------------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
  |   Clean Up                            |    Clean up the screen: collapse outliners and stack them on the left of the window.                                                                                                                                                                                                                                                   |     
  +---------------------------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
  |   Clean Up Memory                     |    Manually initiate a garbage collection. Can help when you know you have just freed up a bunch of space. Self also does this automatically.                                                                                                                                                                                          |     
  +---------------------------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
  |   Collapse All                        |    Collapses all outliners, or all categories within an outliner or category.                                                                                                                                                                                                                                                          |     
  +---------------------------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
  |   Copy Down Children                  |    Enumerate an object’s copy-down children.                                                                                                                                                                                                                                                                                           |     
  +---------------------------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
  |   Copy Down Parent                    |    Show an object’s copy-down parent.                                                                                                                                                                                                                                                                                                  |     
  +---------------------------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
  |   Copy                                |    Copies slots, categories or text.                                                                                                                                                                                                                                                                                                   |     
  +---------------------------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
  |   Core Sampler                        |    Summons an object for manipulating morphs.                                                                                                                                                                                                                                                                                          |     
  +---------------------------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
  |   Create Button                       |    For a slot, create a button to send the message to the object. The receiver may be set by carrying the button on top of the receiver and using the middle-button on the button. (The button is grabbed with either the car-pet-morph or with the grab right-menu item. Bug: buttons do not mani-fest their results.)                |     
  +---------------------------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
  |   Cut                                 |    Copies text to the text buffer.                                                                                                                                                                                                                                                                                                     |     
  +---------------------------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
  |   Do Selection                        |    Evaluate the selected text, do not show the result.                                                                                                                                                                                                                                                                                 |     
  +---------------------------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
  |   Do it                               |    Evaluate the text in the editor, do not show the result.                                                                                                                                                                                                                                                                            |     
  +---------------------------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
  |   Edit                                |    On a slot, open an editor to change its name, slot type, or contents.                                                                                                                                                                                                                                                               |     
  +---------------------------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
  |   Evaluator                           |    Adds an evaluator window to an object outliner.                                                                                                                                                                                                                                                                                     |     
  +---------------------------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
  |   Expand All                          |    Expand all subcategories.                                                                                                                                                                                                                                                                                                           |     
  +---------------------------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
  |   Expatriate Slots                    |    On the changed module morph; shows a list of slots not included in any module.                                                                                                                                                                                                                                                      |     
  +---------------------------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
  |   (Don’t) Filter Frames               |    On a debugger stack, enable (or disable) filtering.                                                                                                                                                                                                                                                                                 |     
  +---------------------------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
  |   Find Slot                           |    Searches an object and its ancestors for slot names matching a pattern.                                                                                                                                                                                                                                                             |     
  +---------------------------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
  |   Find Slot of :                      |    For an assignable slot x, show all slots named x: in the object and its ancestors.                                                                                                                                                                                                                                                  |     
  +---------------------------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
  |   Flush                               |    Discards cached state, e.g. the result of an enumeration.                                                                                                                                                                                                                                                                           |     
  +---------------------------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
  |   Forget I was changed                |    On a module morph, removes it from the list of changed modules and clears out its record of added, changed & removed slots.                                                                                                                                                                                                         |     
  +---------------------------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
  |   Get Module Object                   |    On a module morph summons the object outliner for the module. Useful for editing its postFileIn method, or its revision.                                                                                                                                                                                                            |     
  +---------------------------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
  |   Get Selection                       |    Evaluate the selected text & show the result.                                                                                                                                                                                                                                                                                       |     
  +---------------------------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
  |   Get it                              |    Evaluate the text in the editor, show the result.                                                                                                                                                                                                                                                                                   |     
  +---------------------------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
  |   Hide Annotation                     |    Hides the object or slot annotation.                                                                                                                                                                                                                                                                                                |     
  +---------------------------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
  |   Hide Comment                        |    Hides the object or slot comment.                                                                                                                                                                                                                                                                                                   |     
  +---------------------------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
  |   Implementors                        |    Searches for slots of a given name.                                                                                                                                                                                                                                                                                                 |     
  +---------------------------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
  |   Implementors of :                   |    For an assignable slot x, show all implementors of x:.                                                                                                                                                                                                                                                                              |     
  +---------------------------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
  |   Load Morph From File                |    Reads in a file created with the right-menu item “Save Morph to File”                                                                                                                                                                                                                                                               |     
  +---------------------------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
  |   Make Creator                        |    On a slot, set the creator annotation of its contents to be the slot.                                                                                                                                                                                                                                                               |     
  +---------------------------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
  |   Make Private                        |    Change the style of the slot to show that it is intended to be private (not enforced).                                                                                                                                                                                                                                              |     
  +---------------------------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
  |   Make Public                         |    Change the style of the slot to show that it is intended to be public (not enforced). Adds a comment for posterity.                                                                                                                                                                                                                 |     
  +---------------------------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
  |   Make Undeclared                     |    Change the style of the slot to show that no clear intention exists as to its visibility. (A Self exclusive!)                                                                                                                                                                                                                       |     
  +---------------------------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
  |   Methods Containing                  |    Searches for all methods containing a string.                                                                                                                                                                                                                                                                                       |     
  +---------------------------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
  |   Move                                |    Moves slots or categories.                                                                                                                                                                                                                                                                                                          |     
  +---------------------------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
  |   New Shell                           |    Summon a new shell object.                                                                                                                                                                                                                                                                                                          |     
  +---------------------------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
  |   Open Factory Win-dow                |    Open a new window containing handy morphs (such as a radar-view) you can tear-off and drag to other Self windows.                                                                                                                                                                                                                   |     
  +---------------------------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
  |   Palette                             |    Summons an object for obtaining morphs for building.                                                                                                                                                                                                                                                                                |     
  +---------------------------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
  |   Paste                               |    Pastes text from the buffer.                                                                                                                                                                                                                                                                                                        |     
  +---------------------------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
  |   Quit                                |    Leave job and ride boxcars.                                                                                                                                                                                                                                                                                                         |     
  +---------------------------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
  |   Radar View                          |    Summons an object for moving the current viewport around in space.                                                                                                                                                                                                                                                                  |     
  +---------------------------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
  |   Read Module                         |    On a module morph, rereads the source file.                                                                                                                                                                                                                                                                                         |     
  +---------------------------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
  |   References                          |    Enumerate references to an object.                                                                                                                                                                                                                                                                                                  |     
  +---------------------------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
  |   Removed Slots                       |    On a module morph, lists removed slot paths.                                                                                                                                                                                                                                                                                        |     
  +---------------------------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
  |   Restore Window State                |    Restores the saved state of the screen.                                                                                                                                                                                                                                                                                             |     
  +---------------------------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
  |   Save snapshot                       |    Saves an image of all objects in a snapshot file. Overwrites the snapshot file that was opened originally. Saves the previous version with a ".old" suffix.                                                                                                                                                                         |     
  +---------------------------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
  |   Save snapshot as ...                |    Lets you set the file name and other parameters of the saved snapshot. For example, if you have a lot of memory, you can increase the code cache size.                                                                                                                                                                              |     
  +---------------------------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
  |   Save Window State                   |    Saves the state of the screen.                                                                                                                                                                                                                                                                                                      |     
  +---------------------------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
  |   Send                                |    For a method in a concrete object, send the message to the object.                                                                                                                                                                                                                                                                  |     
  +---------------------------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
  |   Senders                             |    Searches for methods sending a given message.                                                                                                                                                                                                                                                                                       |     
  +---------------------------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
  |   Senders of :                        |    For an assignable slot x, show all senders of x:, i.e. methods that might assign to x.                                                                                                                                                                                                                                              |     
  +---------------------------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
  |   Senders in family                   |    Searches for methods sending a given message in the selected object, its ancestors, and it descendants.                                                                                                                                                                                                                             |     
  +---------------------------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
  |   Senders of : in family              |    For an assignable slot x, show all senders of x:, i.e. methods that might assign to x in the selected object, its ancestors, and it descendants.                                                                                                                                                                                    |     
  +---------------------------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
  |   Set Module                          |    Sets the module of a slot or group of slots.                                                                                                                                                                                                                                                                                        |     
  +---------------------------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
  |   Shell                               |    Summons an outliner on the shell. Used for evaluating expressions.                                                                                                                                                                                                                                                                  |     
  +---------------------------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
  |   Show All Frame                      |    On a debugger stack, disable filtering.                                                                                                                                                                                                                                                                                             |     
  +---------------------------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
  |   Show Annotation                     |    Shows the object or slot annotation.                                                                                                                                                                                                                                                                                                |     
  +---------------------------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
  |   Show Comment                        |    Shows the object or slot comment.                                                                                                                                                                                                                                                                                                   |     
  +---------------------------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
  |   Show Morph                          |    For morph object outliners, summons the morph that the object imple-ments.                                                                                                                                                                                                                                                          |     
  +---------------------------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
  |   “Subclass” Me                       |    Appears on the object menu. Automates several steps equivalent to sub-classing in Smalltalk: Creates a copy-down child of the selected object and makes a new parent object for the new child that inherits from the selected object’s parents. It also sets some of the annotations for transport.                                 |     
  +---------------------------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
  |   The box at the top.                 |    Pins up the menu.                                                                                                                                                                                                                                                                                                                   |     
  +---------------------------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
  |   Toggle Spy                          |    Toggles an X Window spying on the Virtual Machine. A nice source of reassurance.                                                                                                                                                                                                                                                    |     
  +---------------------------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
  |   Traits Family                       |    Show an inheritance hierarchy textually. Only works on certain objects on alternate Thursdays.                                                                                                                                                                                                                                      |     
  +---------------------------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
  |   Write Snapshot                      |    Saves all the objects in the Self world to a (fairly large) file.                                                                                                                                                                                                                                                                   |     
  +---------------------------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+

The system monitor
==================

The Self system contains a system monitor to display information about the internal workings of
the system such as memory management and compilation. It is invoked with ``_Spy:`` ``true`` (there
is are shortcuts in the shell, ``spyOn`` and ``spyOff``). When it is active, the system monitor takes over
a portion of your screen with a window that looks like this:

..  figure:: images/Chapter_5_Figure_7.*
    :height: 138 px
    :width: 680 px
    :scale: 100
    :align: left


The indicators in the left part of the display correspond to various internal activities and events. On
the very left are the CPU bars which show how much CPU is used in various parts of the system.
The following table lists the individual indicators:

**Table 5 The system monitor display: indicators**

===============   ====================================================================================================
CPU               Bar What It Means
===============   ====================================================================================================
VM                CPU time spent executing in the VM, i.e. for primitives, garbage collection etc.
Lkup              CPU time used by compile-time and run-time lookups.
Comp              CPU time spent by the Self compilers. The black part stands for time consumed by the non-inling 
                  compiler (NIC), the gray part for the simple inlining compiler (SIC).
Self              CPU time spent executing compiled Self code. The black part stands for time consumed by 
                  unoptimized (NIC) code, the gray part for optimized (SIC) code.
CPU               This bar displays the percentage of the CPU that the Self process is getting (a completely filled 
                  bar equals 100% CPU utilization by Self). Black stands for user time, gray for system time.
Dot               Below the CPU bar is a small dot which moves whenever a process switch takes place.   
===============   ====================================================================================================

\ 

===============  ===================================================================================================
Indicator        What It Means
===============  ===================================================================================================
X-compiling Y    The X compiler (where X is either “nic” or “sic”) is compiling the method named Y into machine
                 code.
scavenge         The Self object memory is being scavenged. A scavenge is a fast, partial garbage collection (see
                 :ref:`[Ung84] <citations>` , :ref:`[Ung86] <citations>` , :ref:`[Lee88] <citations>` ).
GC               The Self object memory is being fully garbage-collected.
flushing         Self is flushing the code cache.
compacting       Self is compacting the code cache.
reclaiming       Self is reclaiming space in the code cache to make room for a new method.
sec reclaim      Self is flushing some methods in the code cache because there is not enough room in one of the
                 secondary caches (the caches holding the debugging and dependency information).
ic flush         Self is flushing all inline caches.
LRU sweep        Self is examining methods in the code cache to determine whether they have been used recently.
page N N         page faults occurred during the last time interval (N is not displayed if N=1). The time interval
                 currently is 1/25 of a second.
read             Self is blocked reading from a “slow” device, e.g., the keyboard or mouse.
write            Self is blocked writing to a “slow” device, e.g., the screen.
disk in/out      Self is doing disk I/O.
UNIX             Self is blocked in some UNIX system call other than read or write.
idle             Self has nothing to do. (shows up only when using processes.)
===============  ===================================================================================================

The middle part of the display contains some information on VM memory usage displayed in textual
form, as described below:

**Table 6 VM memory status information**

===============  ===================================================================================================
Name             Description
===============  ===================================================================================================
RSRC             Size and utilization of the resource area (an area of memory used for temporary storage by the 
                 compiler and by primitives).
C-Heap           Number of bytes allocated on the C heap by Self (excluding the memory and code spaces and the 
                 resource area).
===============  ===================================================================================================

The memory status portion of the system monitor consists of bars representing memory spaces and
their utilization; all bars are drawn to scale relative to one another, their areas being proportional
to the actual sizes of the memory spaces. The next table explains the details of this part of the system
monitor’s display.

**Table 7 The system monitor display: memory status**

===============  =============================================================================================================
Space            Description
===============  =============================================================================================================
object memory    The four (or more) bars represent (from top to bottom) eden, the two survivor spaces, and subsequent
                 bars are segments of old space. The left and right parts of each bar represent the space used
                 by “plain” objects and byte vectors, respectively.† The above picture shows a situation in which
                 about half of old space is filled with plain objects and about 25% is filled with byte vectors. A fraction
                 of old space’s used portions is currently paged out (gray areas).
                 Below the old space is a ruler, marked in 1Mb intervals, showing the total allocated in old space
                 (extending line at the left). To the right is a red bar representing how much of old space is reserved
                 for use by the Virtual Machine, and a yellow bar representing the low space threshold (when
                 crossed, the scheduler is notified and a garbage colelction may take place).
code cache       These four bars represent the cache holding compiled methods with their associated debugging and
                 dependency information. The bar labelled ‘code’ represents the cache containing the actual
                 machine code for methods (including some headers and relocation information); it is divided into
                 code generated by the primary (non-inlining) compiler, or NIC, and code generated by the
                 secondary, smarter compiler (SIC). The cache represented by the bar labelled ‘deps’ contains
                 dependency information for the compiled methods, and the cache represented by the bar labelled
                 ‘debug’ contains the debugging information. The three-way split reduces the working set size of the
                 code cache. The cache represented by the bar labelled ‘PICs’ contains polymorphic inline caches.
===============  =============================================================================================================       

\ 

=====  ==========================================
Color  Meaning
=====  ==========================================
black  Allocated, residing in real memory.
gray   Allocated, paged out.†
white  Unallocated memory.
=====  ==========================================

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
				0 		The primitive returns the result of evaluating the failure block.
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



**Table 8 Primitive failures**
	+-----------------------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------+
	|Prefix                       |    Description                                                                                                                                              |
	+-----------------------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------+
	|primitiveNotDefinedError     |    Primitive not defined.                                                                                                                                   |
	+-----------------------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------+
	|primitiveFailedError         |    General primitive failure (for example, an argument has an invalid value).                                                                               |
	+-----------------------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------+
	|badTypeError                 |    The receiver or an argument has the wrong type.                                                                                                          |
	+-----------------------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------+
	|badTypeSealError             |    Proxy’s type seal did not match expected type seal.                                                                                                      |
	+-----------------------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------+
	|divisionByZeroError          |    Division by zero.                                                                                                                                        |
	+-----------------------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------+
	|overflowError                |    Integer overflow. This can occur in integer arithmetic primitives or in UNIX (when the result is too large to be represented as an integer).             |
	+-----------------------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------+
	|badSignError                 |    Integer receiver or argument has wrong sign.                                                                                                             |
	+-----------------------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------+
	|alignmentError               |    Bad word alignment in memory.                                                                                                                            |
	+-----------------------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------+
	|badIndexError                |    The vector index (e.g. in _At:) is out of bounds (too large or negative).                                                                                |
	+-----------------------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------+
	|badSizeError                 |    An invalid size of a vector was specified, e.g. attempting to clone a vector with a negative size (see _Clone:Filler:and _CloneBytes:Filler: below).     |
	+-----------------------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------+
	|reflectTypeError             |    A mirror primitive was applied to the wrong kind of slot, e.g. _MirrorParentGroupAt: to a slot that isn’t a parent slot.                                 |
	+-----------------------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------+
	|outOfMemoryError             |    A primitive could not complete because its results would not fit in the existing                                                                         |
	|                             |    space                                                                                                                                                    |
	+-----------------------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------+
	|stackOverflowError           |    The stack overflowed during execution of the primitive or program.                                                                                       |
	+-----------------------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------+
	|slotNameError                |    Illegal slot name.                                                                                                                                       |
	+-----------------------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------+
	|argumentCountError           |    Wrong number of arguments.                                                                                                                               |
	+-----------------------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------+
	|unassignableSlotError        |    This slot is not assignable.                                                                                                                             |
	+-----------------------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------+
	|lonelyAssignmentSlotError    |    Assignment slot must have a corresponding data slot.                                                                                                     |
	+-----------------------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------+
	|parallelTWAINSError          |    Can not invoke TWAINS primitive (another process is already using it).                                                                                   |
	+-----------------------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------+
	|noProcessError               |    This process does not exist.                                                                                                                             |
	+-----------------------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------+
	|noActivationError            |    This method activation does not exist.                                                                                                                   |
	+-----------------------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------+
	|noReceiverError              |    This activation has no receiver.                                                                                                                         |
	+-----------------------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------+
	|noParentSlot                 |    This activation has no lexical parent.                                                                                                                   |
	+-----------------------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------+
	|noSenderSlot                 |    This activation has no sender slot.                                                                                                                      |
	+-----------------------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------+
	|deadProxyError               |    This proxy is dead and can not be used.                                                                                                                  |
	+-----------------------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------+
	|liveProxyError               |    This proxy is live and can not be used to hold a proxy result.                                                                                           |
	+-----------------------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------+
	|wrongNoOfArgsError           |    Wrong number of arguments was supplied with call of foreign function.                                                                                    |
	+-----------------------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------+
	|nullPointerError             |    Foreign function returned null pointer.                                                                                                                  |
	+-----------------------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------+
	|nullCharError                |    Can not pass byte vector containing null char to foreign function expecting a string.                                                                    |
	+-----------------------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------+
	|prematureEndOfInputError     |    Premature end of input during parsing.                                                                                                                   |
	+-----------------------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------+
	|noDynamicLinkerError         |    Primitive depends on dynamic linker which is not available in this system.                                                                               |
	+-----------------------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------+
	|EPERM, ENOENT, ...           |    These errors are returned by a UNIX primitive if a UNIX system call executed by the                                                                      |
	|                             |    primitive fails. The UNIX error codes are defined in /usr/include/sys/ errno.h;                                                                          |
	|                             |    see this file for details on the roughly 90 different UNIX error codes.                                                                                  |
	+-----------------------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------+

.. index::
   single:  _ErrorMessage

The ``_ErrorMessage`` primitive, sent to an error string returned by any primitive, returns a more
descriptive version of the error message; this is especially useful for UNIX errors.          

Available primitives
--------------------

A complete list of primitives can be obtained by sending ``primitiveList`` to ``primitives``. Documentation
for a primitive (such as ``_Clone``), can be obtained using at:, thus:

		::

				primitives at: ’_Clone’

A list of primitive names matching a pattern can be obtained thus:

		::

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


