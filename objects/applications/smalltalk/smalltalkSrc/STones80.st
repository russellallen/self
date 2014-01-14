"These have been modified from the originals due to some problems with
 some of the benchmarks."

"       NAME            STones80
        AUTHOR          bruce@utafll.uta.edu (Bruce Samuelson)
        FUNCTION        low and medium level benchmarks for ST80 and ST/V
        ST-VERSIONS     all versions of ST80; portable to ST/V
        PREREQUISITES   need floating point hardware or emulation
        CONFLICTS       none
        DISTRIBUTION    world
        VERSION         1.0
        DATE            April 16, 1993

SUMMARY The filein includes two classes: Slopstones (Smalltalk Low level
OPeration Stones) and Smopstones (Smalltalk Medium level OPeration Stones).
Each includes seven cpu intensive benchmarks. They work equally well with
16-bit and 32-bit implementations and are designed to be portable to all
Smalltalk versions from ParcPlace and Digitalk. They are normalized to the
author's 486/33 Windows 3.1 machine running ParcPlace VisualWorks 1.0.
Results have been posted to the Usenet group comp.lang.smalltalk and form the
basis of an article that is scheduled to be published in the June issue of The
Smalltalk Report.

The only difference between the ST80 (STones80) and ST/V (STonesV) filein is
in the messages that define the classes in the first few lines of code. The
ST80 messages specify the class category and message protocol, which are not
used in ST/V.

Bruce Samuelson"!

"$Revision: 30.1 $"

'From VisualWorks(TM), Release 1.0 of 8 October 1992 on 22 January 1993 at 9:26:32 am'!

Object subclass: #SlopstoneBenchmark
   instanceVariableNames: 'testParams testBlocks '
   classVariableNames: ''
   poolDictionaries: ''
   category: 'Public Domain-Benchmarks'!

!SlopstoneBenchmark methodsFor: 'benchmarking'!

execute

| n nTests iters times speeds stones scale printA printB printC param
count speed0 expln block time iter speed stone geoMean gm power |

n := 16000. "Number of times each test block will be evaluated."
n > 16383 ifTrue: [self halt: 'Count exceeded max small int for ST/V-DOS.'].

Transcript cr; cr; show: 'Starting benchmarks with repetition count = '
           , n printString asSmalltalkString , '.'.

nTests := testParams size.
nTests  = testBlocks size ifFalse: [self halt: 'Inconsistent test count.'].

iters  := OrderedCollection new.
times  := OrderedCollection new.
speeds := OrderedCollection new.
stones := OrderedCollection new.
scale  := 1000. "So iterations can be reported as 1000s of iterations"

"The following blocks are restricted to two args by ST/V-DOS."

printA :=
  [:iter1 :time1 |
  Transcript cr.
  Transcript nextPutAll: (iter1 / scale) rounded printString.
  Transcript nextPutAll: '     '.
  Transcript nextPutAll: time1 printString.
  Transcript nextPutAll: '     '].
printB :=
  [:speed1 :slop1 |
  Transcript nextPutAll: (speed1 / scale) rounded printString.
  Transcript nextPutAll: '     '.
  Transcript nextPutAll: slop1 printString.
  Transcript nextPutAll: '     '].
printC :=
  [:expln1 |
  Transcript show: expln1].

Transcript show: '

1000s    time    1000s of
itera-   sec-    iterations   slop-
tions    onds    per sec      stones   explanation
'.

1 to: nTests do:
  [:i |
  param  := testParams at: i.
  count  := param at: 1.           "repetitions of a test inside its block"
  speed0 := (param at: 2) * scale. "iters/sec for a one-slopstone machine"
  expln  := param at: 3.
  block  := testBlocks at: i.
  time   := Time millisecondsToRun: [n timesRepeat: block].
  time   := (time max: 1) / 1000.0. "time is now in seconds"
  iter   := count * n.
  speed  := iter / time.
  stone  := speed / speed0.
  iters  add: iter.
  times  add: time.
  speeds add: speed.
  stones add: stone.
  printA value: iter value: time.
  printB value: speed value: stone.
  printC value: expln.].

geoMean :=
  [:numbers |
  gm := 1.
  power := 1 / nTests.
  numbers do: [:number | gm := gm * (number raisedTo: power)].
  gm].
Transcript cr.
printA value: (geoMean value: iters) value: (geoMean value: times).
printB value: (geoMean value: speeds) value: (geoMean value: stones).
printC value: 'geometric mean'.

Transcript cr; cr; show: 'Benchmarks complete.'; cr!

readme

"INTRODUCTION

Slopstone: Smalltalk Low level OPeration Stones
Portable Low Level Benchmarks for ST80 and ST/V (using 16-bit SmallIntegers)
Placed in public domain January 1993  (c) Bruce Samuelson
Permission is given to place this in public Smalltalk archives

Use monospaced fonts if possible to view the methods in this class.

(1) Collect garbage if supported (2) do 'SlopstoneBenchmark new runBenchmark'.
Results are printed in the Transcript window.
Post results for your machines to comp.lang.smalltalk or
mail them to bruce@ling.uta.edu or bruce@utafll.uta.edu.

DISCUSSION
   
This readme method would normally be in the class comment for ST80. ST/V-DOS
doesn't support class comments.
 
The benchmarks test strictly low level operations. They do not test higher
level operations such as forming sets, sorting, or streaming, nor do they test
applications. They also do not test user interface operations because of the
non-portability of this area of Smalltalk and its sensitivity to the
performance of the video subsystem. The tests are cpu bound. They do not
access files and should not cause disk paging.

The benchmarks use loop counts of 16000 because SmallIntegers cannot exceed
16383 for ST/V-DOS. 16-bit implementions would perform worse with large loop
counts. The benchmarks are also suitable for testing 32-bit versions of
Smalltalk.

DEFINITION OF REFERENCE MACHINE (ONE SLOPSTONE)

The following machine is the one on which I developed these benchmarks. By
convention it is defined to operate at one slopstone. It's a mid range
performer for current ParcPlace versions of Smalltalk.

Hardware: Amax 486DX/33 (includes internal floating point processor and
internal 8K cache), 256K external cache, 16MB RAM.

Software: ParcPlace VisualWorks 1.0, Windows 3.1, DOS 5.0 (plain vanilla
setup).

COMPARISON TO XEROX DORADO

For reference, the machine runs at 649% of a Dorado on ParcPlace benchmarks
for ST80 4.1. Its fast video card helps on these PPS benchmarks. I didn't run
them for VisualWorks 1.0. It would be somewhat slower because there are vastly
more classes.

EXAMPLE RESULTS FOR REFERENCE MACHINE

1000s    time    1000s of
itera-   sec-    iterations   slop-
tions    onds    per sec      stones   explanation

3808     0.577   6600         1.0      add integers
 544     2.262    240         1.0      add floats
 960     1.088    882         1.0      access strings
 320     0.908    352         1.0      create objects
 160     1.49     107         1.0      copy objects
 480     1.129    425         1.0      perform selectors
 896     1.237    724         1.0      evaluate blocks

 640     1.151    555         1.0      geometric mean"!

runBenchmark
       "SlopstoneBenchmark new runBenchmark"

        self setup.
        self execute!

setup
 
"Numbers in testParams represent the following:
 
Column 1   number of internal repetitions for each test inside its block
Column 2   thousands of iterations per second for a one-slopstone machine."
 
testParams := OrderedCollection new.
 
testParams
  add: #(238 6600 'add integers');
  add: #( 34  240 'add floats');
  add: #( 60  882 'access strings');
  add: #( 20  352 'create objects');
  add: #( 10  107 'copy objects');
  add: #( 30  425 'perform selectors');
  add: #( 56  724 'evaluate blocks').
 
testBlocks := OrderedCollection new.
 
"In the integer addition test, I originally had 340 internal repetitions.
This caused the Digitalk compiler to blow up. The ParcPlace compiler compiled
it ok but interestingly addition performed at slightly more than 50% of the
performance with an internal count of 238. Perhaps something magical happens
at 256."

testBlocks
  add: [1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+
        1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+
        1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+
        1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+
        1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+
        1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+
        1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1] asNonLifoBlock;
 
  add: [1.0+1.0+1.0+1.0+1.0+1.0+1.0+1.0+1.0+1.0+1.0+1.0+1.0+1.0+1.0+1.0+1.0+
        1.0+1.0+1.0+1.0+1.0+1.0+1.0+1.0+1.0+1.0+1.0+1.0+1.0+1.0+1.0+1.0+1.0] asNonLifoBlock;
 
  add: ['a' at: 1. 'a' at: 1. 'a' at: 1. 'a' at: 1. 'a' at: 1. 'a' at: 1.
        'a' at: 1. 'a' at: 1. 'a' at: 1. 'a' at: 1. 'a' at: 1. 'a' at: 1.
        'a' at: 1. 'a' at: 1. 'a' at: 1. 'a' at: 1. 'a' at: 1. 'a' at: 1.
        'a' at: 1. 'a' at: 1. 'a' at: 1. 'a' at: 1. 'a' at: 1. 'a' at: 1.
        'a' at: 1. 'a' at: 1. 'a' at: 1. 'a' at: 1. 'a' at: 1. 'a' at: 1.
        'a' at: 1. 'a' at: 1. 'a' at: 1. 'a' at: 1. 'a' at: 1. 'a' at: 1.
        'a' at: 1. 'a' at: 1. 'a' at: 1. 'a' at: 1. 'a' at: 1. 'a' at: 1.
        'a' at: 1. 'a' at: 1. 'a' at: 1. 'a' at: 1. 'a' at: 1. 'a' at: 1.
        'a' at: 1. 'a' at: 1. 'a' at: 1. 'a' at: 1. 'a' at: 1. 'a' at: 1.
        'a' at: 1. 'a' at: 1. 'a' at: 1. 'a' at: 1. 'a' at: 1. 'a' at: 1] asNonLifoBlock;
 
  add: [Object new. Object new. Object new. Object new. Object new.
        Object new. Object new. Object new. Object new. Object new.
        Object new. Object new. Object new. Object new. Object new.
        Object new. Object new. Object new. Object new. Object new] asNonLifoBlock;
 
  add: [Object new copy copy copy copy copy copy copy copy copy copy] asNonLifoBlock;
 
  add: [$0 perform: #yourself. $0 perform: #yourself. $0 perform: #yourself.
        $0 perform: #yourself. $0 perform: #yourself. $0 perform: #yourself.
        $0 perform: #yourself. $0 perform: #yourself. $0 perform: #yourself.
        $0 perform: #yourself. $0 perform: #yourself. $0 perform: #yourself.
        $0 perform: #yourself. $0 perform: #yourself. $0 perform: #yourself.
        $0 perform: #yourself. $0 perform: #yourself. $0 perform: #yourself.
        $0 perform: #yourself. $0 perform: #yourself. $0 perform: #yourself.
        $0 perform: #yourself. $0 perform: #yourself. $0 perform: #yourself.
        $0 perform: #yourself. $0 perform: #yourself. $0 perform: #yourself.
        $0 perform: #yourself. $0 perform: #yourself. $0 perform: #yourself] asNonLifoBlock;
 
  add: [[1] value. [1] value. [1] value. [1] value. [1] value. [1] value. [1] value.
        [1] value. [1] value. [1] value. [1] value. [1] value. [1] value. [1] value.
        [1] value. [1] value. [1] value. [1] value. [1] value. [1] value. [1] value.
        [1] value. [1] value. [1] value. [1] value. [1] value. [1] value. [1] value.
        [1] value. [1] value. [1] value. [1] value. [1] value. [1] value. [1] value.
        [1] value. [1] value. [1] value. [1] value. [1] value. [1] value. [1] value.
        [1] value. [1] value. [1] value. [1] value. [1] value. [1] value. [1] value.
        [1] value. [1] value. [1] value. [1] value. [1] value. [1] value. [1] value] asNonLifoBlock! !

'From VisualWorks(TM), Release 1.0 of 8 October 1992 on 22 January 1993 at 9:26:45 am'!

Object subclass: #SmopstoneBenchmark
   instanceVariableNames: 'testParams testBlocks primes aSet strings'
   classVariableNames: ''
   poolDictionaries: ''
   category: 'Public Domain-Benchmarks'!

!SmopstoneBenchmark methodsFor: 'benchmarking'!

execute

| n nTests times stones printA printC param
time0 expln block time stone geoMean gm power |

n := 1. "Each test is repeated this many times. The smopstone times in
         the test parameters are normalized to a value of one. You may
         set it to a higher number if your machine is really blazing."

Transcript cr; cr; show: 'Starting benchmarks with repetition count = '
           , n printString asSmalltalkString, '.'.

nTests := testParams size.
nTests  = testBlocks size ifFalse: [self halt: 'Inconsistent test count.'].

times  := OrderedCollection new.
stones := OrderedCollection new.

"The following blocks are restricted to two args by ST/V-DOS."

printA :=
  [:time1 :smop1 |
  Transcript cr.
  Transcript nextPutAll: time1 printString.
  Transcript nextPutAll: '     '.
  Transcript nextPutAll: smop1 printString.
  Transcript nextPutAll: '     '].
printC :=
  [:expln1 |
  Transcript show: expln1].

Transcript show: '

time in    smop-
seconds    stones    explanation
'.

1 to: nTests do:
  [:i |
  param  := testParams at: i.
  time0  := param at: 1.            "seconds for one-smopstone machine"
  expln  := param at: 2.
  block  := testBlocks at: i.
  time   := Time millisecondsToRun: [n timesRepeat: block].
  time   := (time max: 1) / 1000.0. "time is now in seconds"
  stone  := n  * time0 / time.
  times  add: time.
  stones add: stone.
  printA value: time value: stone.
  printC value: expln.].

geoMean :=
  [:numbers |
  gm := 1.
  power := 1 / nTests.
  numbers do: [:number | gm := gm * (number raisedTo: power)].
  gm].
Transcript cr.
printA value: (geoMean value: times) value: (geoMean value: stones).
printC value: 'geometric mean'.

Transcript cr; cr; show: 'Benchmarks complete.'; cr!

fractonacci: n 
  "Return something like the fibonacci function of n but
  using fractional numbers rather than whole ones. The
  reason for this variation is to run long enough to get
  a decent time measurement without exceeding 16383, the
  limit of small integers for ST/V-DOS. Choosing n = 13/2
  takes enough time and computes to 13581.

  Fibonacci uses n-1 and n-2 instead of n-(1/2) and n-(1/3).
  However, I couldn't get it to run in the above constraints.

  This benchmark tests the efficiency of recursively calling
  a method that does a little fractional arithmetic internally."

  ^n > 1
    ifTrue: [(self fractonacci: n - (1/2)) + (self fractonacci: n - (1/3))]
    ifFalse: [1]!

primesUpTo: n
  "Return the prime numbers between 2 and n.

  This method tests the efficiency of recursively calling a block
  that does some collection enumeration based on integer arithmetic."

  | nSqrt lowPrimes highPrimes genNext first |
  n < 5 | (n > 16363) ifTrue: [self halt: 'Prime limit(s) out of range.'].
  nSqrt := n squareRoot rounded.
  lowPrimes := OrderedCollection with: 2.
  highPrimes := 5 to: n by: 2.
  genNext :=
    [:nextPrime |
    lowPrimes add: nextPrime.
    highPrimes := highPrimes select: [:k | k \\ nextPrime ~= 0].
    (first := highPrimes first) <= nSqrt ifTrue: [genNext value: first]].
  genNext value: 3.
  ^lowPrimes , highPrimes!

readme

"INTRODUCTION

Smopstone: Smalltalk Medium level OPeration Stones
Portable Medium level Benchmarks for ST80 and ST/V (using 16-bit SmallInts)
Placed in public domain January 1993  (c) Bruce Samuelson
Permission is given to place this in public Smalltalk archives

Use monospaced fonts if possible to view the methods in this class.

(1) Collect garbage if supported (2) do 'SmopstoneBenchmark new runBenchmark'.
Results are printed in the Transcript window.
Post results for your machines to comp.lang.smalltalk or
mail them to bruce@ling.uta.edu or bruce@utafll.uta.edu.

DISCUSSION
   
This readme method would normally be in the class comment for ST80. ST/V-DOS
doesn't support class comments.

These benchmarks are a companion to the SlopstoneBenchmark class posted to
comp.lang.smalltalk this month. Slopstones tested low level operations.
 
Smopstones test medium level operations that exercise recursive block and 
method calls, collection building and enumeration, streaming, and sorting. The
lower level operations contained in them exercise arithmetic (mostly integer,
with some fractions and floats) string manipulation, and low level streaming.

The benchmarks do not test applications. They also do not test user interface
performance because of the non-portability of this area of Smalltalk and its 
sensitivity to the speed of the video subsystem. The tests are cpu bound. They
do not access files and should not cause disk paging.

The main weaknesses of the benchmarks are (1) they are not high enough level
to test actual applications, and (2) they concentrate in too few areas of
Smalltalk, omitting many of the diverse capabilities of its class library. My
excuse is that one can only devote limited time writing public domain
benchmarks.

The tests avoid generating integers larger than 16383, the maximum
SmallInteger in ST/V-DOS. 16-bit implementions would perform worse with larger
integers. The benchmarks are also suitable for testing 32-bit versions of
Smalltalk. They try to avoid other pitfalls that would skew the results such
as the lack of an adequate hash function for a class. Someone warned of this
in comp.lang.smalltalk (I forget who).

DEFINITION OF REFERENCE MACHINE (ONE SMOPSTONE)

The following machine is the one on which I developed these benchmarks. By
convention it is defined to operate at one smopstone. It's a mid range
performer for current ParcPlace versions of Smalltalk.

Hardware: Amax 486DX/33 (includes internal floating point processor and
internal 8K cache), 256K external cache, 16MB RAM.

Software: ParcPlace VisualWorks 1.0, Windows 3.1, DOS 5.0 (plain vanilla
setup).

COMPARISON TO XEROX DORADO

For reference, the machine runs at 649% of a Dorado on ParcPlace benchmarks
for ST80 4.1. Its fast video card helps on these PPS benchmarks. I didn't run
them for VisualWorks 1.0. It would be somewhat slower because there are vastly
more classes.

EXAMPLE RESULTS FOR REFERENCE MACHINE

time in    smop-
seconds    stones    explanation


3.157      1.0       generating fractonaccis
1.123      1.0       generating primes
1.091      1.0       generating and parsing streams
3.091      1.0       generating strings
1.167      1.0       forming sets
5.139      1.0       sorting strings
5.601      1.0       sorcerer's apprentice

2.355      1.0       geometric mean"!

runBenchmark
       "SmopstoneBenchmark new runBenchmark"

        self setup.
        self execute!

setFrom: collection
  "Form a set from collection and return it.

  This method tests the efficiency of building a fairly large set
  from strings. It indirectly tests the effectiveness of the string
  hash function. Strings are used often enough as dictionary keys
  that this may be worth including in the benchmark suite.  ST/V-DOS
  has a primitive hash for strings, and ST80 has an elaborate one
  written in Smalltalk."

  ^collection asSet!

setup
  "Numbers in testParams represent the approximate number of seconds it
  takes to run the tests for a one-smopstone machine.

  Numbers in testBlocks are parameters tuned for each test. Do not
  change them. The times for several tests depend on them non-linearly."

  "| primes strings set | these are instance variables because
   of the incomplete implementation of non-lifo blocks"

  testParams := OrderedCollection new.
 
  testParams
    add: #(3.157 'generating fractonaccis');
    add: #(1.123 'generating primes');
    add: #(1.091 'generating and parsing streams');
    add: #(3.091 'generating strings');
    add: #(1.167 'forming sets');
    add: #(5.139 'sorting strings').
    "add: #(5.601 'sorcerer''s apprentice')."

  testBlocks := OrderedCollection new.

  testBlocks
    add: [self fractonacci: 13/2] asNonLifoBlock;
    add: [primes := self primesUpTo: 9000] asNonLifoBlock;
    add: [self streamTestsOn: primes] asNonLifoBlock;
    add: [strings := self stringsUpTo: 8000] asNonLifoBlock;
    add: [aSet := self setFrom: strings] asNonLifoBlock;
    add: [self sort: aSet] asNonLifoBlock.
    "Can't do this one -- no Rectangle class"
    "add: [self sorcerersApprentice] asNonLifoBlock"!

sorcerersApprentice

" FORMATTED FOR MONOSPACED FONT

  Perform various operations on rectangles.

  This method tests the efficiency of recursively calling a block that
  includes lots of integer arithmetic, collection building, and collection
  enumeration. The method:

  (1) Creates a collection of pseudo random rectangles 
  (2) Forms a new collection of all their intersections 
  (3) Recursively continues until there are no more intersections 
  (4) Returns a collection with the counts of rectangles in each generation.

  Because the intersections are forming progressively smaller rectangles
  (we exclude intersections of a rectangle with itself), the algorithm will
  eventually converge. Depending on the choice of numeric parameters, it may
  converge very quickly or very slowly. The parameters used below make it
  converge in a reasonable amount of time (a few seconds on a one-smopstone
  machine). It took some experimentation with different combinations to
  achieve this.

  The pseudo random number generator isn't very good, but it's adequate
  for this benchmark. I had intended the number '87' it uses to be a prime,
  but 87 = 29 * 3. The numbers may have been a bit more random otherwise.

  One could write an algorithm that would converge much more quickly and in
  a more predictable amount of time by sorting the intermediate rectangles
  in two dimensions and not bothering to test for intersections those
  rectangles that are contained in mutually exclusive regions. We have
  chosen algorithmic simplicity over performance optimization. We simply
  perform intersections of each rectangle with every possible partner in
  each generation. The time consumed is quadratic in the number of rectangles.

  The algorithm originally stored rectangles in sets to eliminate duplicates.
  Unfortunately, ST/V-DOS uses the hash function inherited from Object for
  Rectangle, which will allow duplicates to be stored. So we were forced to
  store rectangles in ordered collections and eliminate duplicates by brute
  force. The brutality was heightened because we could not use the test
  collection>>includes: to decide whether to add a rectangle to the ordered
  collections, since ST/V-DOS does not define equality (=) for rectangles
  either. The remaining warts in the code are not worth explaining.

  In an actual application, these shortcomings of ST/V-DOS would have been
  overcome by adding subclasses and methods rather than writing kludgy code."

  | m n firstGen intersection isIncluded counts r random
  a b c d e f g h generate nextGen |
  m := 80.
  n := 20 * m.
  firstGen := OrderedCollection new.
  counts := OrderedCollection new.
  r := 50.
  random := [r := r + 1 * 87 \\ n. r].
  m timesRepeat: [
    a := random value.
    b := random value.
    c := random value.
    d := random value.
    e := a min: b.
    f := c min: d.
    g := a max: b.
    h := c max: d.
    firstGen add: (Rectangle origin: e @ f corner: g @ h)].
  generate := 
    [:lastGen |
    counts add: lastGen size.
    nextGen := OrderedCollection new.
    lastGen do:
      [:r1 |
      lastGen do: 
        [:r2 | 
        (r1 origin ~= r2 origin or: [r1 corner ~= r2 corner])
        "In ST80 this test would have simply been r1 ~= r2"
          ifTrue:
            [(r1 intersects: r2)
              ifTrue:
                [intersection := r1 intersect: r2.
                isIncluded := false.                     "All these lines"
                nextGen do:                              "would have been"
                  [:rec |                                "avoided if we"
                  (rec origin = intersection origin and: "could have used"
                  [rec corner = intersection corner])    "a set for"
                    ifTrue: [isIncluded := true]].       "nextGen. See"
                isIncluded                               "explanation"
                  ifFalse:                               "above."
                    [nextGen size > 500
                      ifTrue: [self halt: 'Converges too slowly.']
                      ifFalse: [nextGen add: intersection]]]]]].
    nextGen size > 0 ifTrue: [generate value: nextGen]].
  generate value: firstGen.
  ^counts!

sort: collection
  "Form a sorted collection from collection and return it.

  This method tests the efficiency of sorting a fairly large
  collection of strings. It indirectly measures the efficiency
  of the sorting algorithm and of string comparison operations."

  ^collection asSortedCollection!

streamTestsOn: integers
  "Test steaming operations on the collection of integers.

  This method measures the efficiency of integer-to-float conversion, of
  printing numbers to a write stream, of parsing tokens in a read stream,
  and of converting the tokens from strings to numbers. The technique for
  converting tokens into floats is constrained by portability between
  ST80 and ST/V.

  To validate the logic, the original integers are compared with the final
  floats. There should be no roundoff errors."

  | delim space s floats float string |

  "The following line accounts for the different implementations of
  Float>>printString for some versions of Smalltalk. USA versions use
  the decimal character, while some European versions use the comma char.
  Thanks to Marten Feldtmann for pointing this out."

  delim := 1.0 printString asSmalltalkString at: 2. "$. for USA, $, for some Europe."

  space := Character value: 32. "Can't use Character space in ST/V-DOS"
  s := ReadWriteStream on: String new.
  integers do: [:i | i asFloat printString asSmalltalkString printOn: s. s space].
  "Now make sure the underlying string size is < 16383, a 16-bit small int."
  s contents size > 8191 ifTrue: [self halt: 'String too big.'].
  s reset.
  floats := OrderedCollection new: integers size.
  [s atEnd] whileFalse:
    [float := 0.
    string := s upTo: delim.
    s upTo: space.
    "In the following, digitValue is portable between ST80 and ST/V-DOS."
    string do: [:char | float := float * 10.0 + char digitValue].
    floats add: float].
  integers = floats ifFalse: [self halt: 'Numbers do not compare.']!

stringsUpTo: n
  "Return a collection of strings representing the integers from 1
  to n with their digits reversed.

  This method tests the efficiency of creating small streams, performing
  string operations, and building collections. It includes a gross kludge
  to coerce portability between ST80 and ST/V. They vary slightly in the
  selector used to reverse collections. Subsequent to freezing this code,
  someone pointed out that it could have been written more simply without
  using perform:. It could also have been simplified using select:. It
  was too late to change. The techniques are left as an exercise for the
  reader."

  | selector |
  "(Array with: #reverse with: #reversed) do:
    [:symbol |
    (String canUnderstand: symbol) ifTrue: [selector := symbol]]."
  selector := #reverse.
  ^(1 to: n) collect: [:m | m printString asSmalltalkString perform: selector]! !
