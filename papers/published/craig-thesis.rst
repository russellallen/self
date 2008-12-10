The Design and Implementation of the Self Compiler, an Optimizing Compiler for Object-Oriented Programming Languages
====================================================================================================================

`Craig Chambers <http://www.cs.washington.edu/people/faculty/chambers.html>`_

**Abstract:**

Object-oriented programming languages promise to improve programmer
productivity by supporting abstract data types, inheritance, and
message passing directly within the language. Unfortunately, traditional
implementations of object-oriented language features, particularly
message passing, have been much slower than traditional
implementations of their non-object-oriented counterparts: the fastest
existing implementation of Smalltalk-80 runs at only a tenth the speed
of an optimizing C implementation. The dearth of suitable
implementation technology has forced most object-oriented languages to
be designed as hybrids with traditional non-object-oriented languages,
complicating the languages and making programs harder to extend and
reuse.

This dissertation describes a collection of implementation techniques
that can improve the run-time performance of object-oriented
languages, in hopes of reducing the need for hybrid languages and
encouraging wider spread of purely object-oriented languages. The
purpose of the new techniques is to identify those messages whose
receiver can only be of a single representation and eliminate the
overhead of message passing by replacing the message with a normal
direct procedure call; these direct procedure calls are then amenable
to traditional inline-expansion. The techniques include a type
analysis component that analyzes the procedures being compiled and
extracts representation-level type information about the receivers of
messages. To enable more messages to be optimized away, the techniques
include a number of transformations which can increase the number of
messages with a single receiver type. Customization transforms a
single source method into several compiled versions, each version
specific to a particular inheriting receiver type; customization
allows all messages to self to be inlined away (or at least replaced
with direct procedure calls). To avoid generating too much compiled
code, the compiler is invoked at run-time, generating customized
versions only for those method/receiver type pairs used by a
particular program. Splitting transforms a single path through a
source method into multiple separate fragments of compiled code, each
fragment specific to a particular combination of run-time types.
Messages to expressions of these discriminated types can then be
optimized away in the split versions. The techniques are designed to
coexist with other requirements of the language and programming
environment, such as generic arithmetic, user-defined control
structures, robust error-checking language primitives, source-level
debugging, and automatic recompilation of out-of-date methods after a
programming change.  These techniques have been implemented as part of
the compiler for the Self language, a purely object-oriented language
designed as a refinement of Smalltalk-80. If only pre-existing
implementation technology were used for Self, programs in Self would
run one to two orders of magnitude slower than their counterparts
written in a traditional non-object-oriented language. However, by
applying the techniques described in this dissertation, the
performance of the Self system is five times better than the fastest
Smalltalk-80 system, better than that of an optimizing Scheme
implementation, and close to half that of an optimizing C
implementation.

These techniques could be applied to other object-oriented languages
to boost their performance or enable a more object-oriented
programming style. They also are applicable to non-object-oriented
languages incorporating generic arithmetic or other generic
operations, including Lisp, Icon, and APL. Finally, they might be
applicable to languages that include multiple representations or
states of a single program structure, such as logic variables in
Prolog and futures in Multilisp.
<hr>

*Ph. D. dissertation, Computer Science Department, Stanford
University, March 1992.*

(Not available online)

