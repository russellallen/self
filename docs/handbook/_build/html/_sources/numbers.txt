Numbers and Time
================

The SELF number traits form the hierarchy shown below. (In this and subsequent hierarchy descriptions,
indentation indicates that one traits object is a child of another. The prefix “traits” is
omitted since these hierarchy descriptions always describe the interrelationship between traits objects.
In most cases, leaf traits are concrete and have an associated prototype with the same name.)

	::
	
		orderedOddball
			number
				float
				integer
					smallInt
					bigInt
					
``traits number`` defines behavior common to all numbers, such as ``successor``, ``succ``, ``predecessor``,
``pred``, ``absoluteValue``, ``negate``, ``double``, ``half``, ``max:``, and ``min:``. ``traits number``
inherits from ``traits orderedOddball``, so sending ``copy`` or ``clone`` to a number returns the
number itself. ``traits integer`` defines behavior common to all integers such as ``even``, ``odd``, and
``factorial``. There are four division operators for integers that allow the programmer to control
how the result is truncated or rounded. Integers also include behavior for iterating through a subrange,
including::

	to:Do:
	to:By:Do:
	to:ByNegative:Do:
	upTo:Do:
	upTo:By:Do:
	downTo:Do:
	downTo:By:Do:

Relevant oddballs:

	* infinity IEEE floating-point infinity
	
	* minSmallInt smallest smallInt in this implementation
	
	* maxSmallInt biggest smallInt in this implementation

Modules: number, float, integer, smallInt, bigInt

Random Numbers
--------------

		::
		
			clonable
			random
			randomLC
			prototypes random

``Traits random`` defines the abstract behavior of random number generators. A random number
generator can be used to generate random booleans, integers, floats, characters or strings. ``traits
randomLC`` defines a concrete specialization based on a simple linear congruence algorithm. For
convenience, the prototype for ``randomLC`` is “``random``,” not “``randomLC``”.

Modules: random

Time
----

	::

		clonable
		time

A time object represents a date and time (to the nearest millisecond) since midnight GMT on January
1, 1970. The message ``current`` returns a new time object containing the current time. Two
times can be compared using the standard comparison operators. One time can be subtracted from
another to produce a value in milliseconds. An offset in milliseconds can be added or subtracted
from a time object to produce a new time object. However, it is an error to add two time objects
together.

Modules: time
