Object, Message, and Performance: How They Coexist in Self
==========================================================

David Ungar, `Randall B. Smith <http://www.sun.com/research/people/randall.smith>`_, `Craig Chambers <http://www.cs.washington.edu/people/faculty/chambers.html>`_, and `Urs Hölzle <http://www.cs.ucsb.edu/~urs>`_

**Abstract:**

Applying object-oriented techniques to the art of computer programming
confers many benefits, and like an older discipline, structured
programming, is most effective when applied uniformly throughout a pro
gram. For example, the SELF programming language distills
object-oriented computation down to a simple story based on copying
prototypes to create objects, inheriting from objects to share their
contents, and pass ing messages to invoke methods. SELF programs even
send messages to alter the flow of control, access vari ables, and
perform arithmetic. As a result, methods are oblivious to the
representations of objects and are therefore easier to reuse.

For example, last year you might have written a routine to sort an
array of numbers. It was a method defined for arrays that works by
sending the less-than (<) message to the numbers. Today, you might
need to sort an array of strings. In a pure object-oriented language,
you could just call the same sort method. The old sort method would
still work, because the objects in the array (now strings) respond to
the < message.  The code run for < is decided at runtime according to
the type of the receiver, so the sort method works for any object that
implements a < method. When the same code can be used for different
types of objects, it is said to be polymorphic. With this kind of
polymorphism, you do not have to explicitly parameterize the sort
routine when you write it--it just works! This quality of
unanticipated reusability may be one of the reasons programmers feel
empowered by pure object-oriented languages.

However, unlike structured programming, pure object-oriented
programming cannot be implemented efficiently with traditional
compilation techniques because traditional optimizations rely on
static declarations of representation types. In this paper, we will
present the novel implementation techniques that recapture much of the
efficiency that would seem to be lost in a pure object-oriented
language. For many of the bench marks we have measured, these
techniques have provided a fivefold speedup, enabling SELF programs to
come within a factor of two or three of optimized C.

*Computer, 25(10), October, 1992, pp. 53-64.*


 `PDF <_static/object-msg-perf.pdf>`_

