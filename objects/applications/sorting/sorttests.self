" Sun-$Revision: 30.6 $ "
 
"Copyright 1992-2012 AUTHORS.
 See the LICENSE file for license information."

shell _AddSlots: (|
  sorter = (|
    element: e1 Precedes: e2 = ( count: count succ. e1 < e2 ).
    element: e1 Equals:   e2 = ( count: count succ. e1 = e2 ).
    count <- 0.
  |).

  t1 = ( 20000 asVector					).
  t2 = ( 20000 asVector reverse				).
  t3 = ( 20000 asVector mapBy: [1]			).
  t4 = ( 20000 asVector mapBy: [random integer: 100]	).
  t5 = ( 20000 asVector mapBy: [random integer: 100000] ).
  t6 = (  2000 asVector mapBy: [random string:  30]	).

  heapsort: x By: cmp = (
    | result. i <- 0 |
    result: x copy.
    x sortedBy: cmp Do: [| :el | result at: i Put: el. i: i succ].
    result ).

  hsort: x = (| t |
    sorter count: 0.
    t: [ heapsort: x By: sorter ] cpuTime.
    'heapsort:\t', sorter count printString, '\t', t printString ).

  qsort: x = (| t |
    sorter count: 0.
    t: [ x quicksortBy: sorter ] cpuTime.
    'quicksort:\t', sorter count printString, '\t', t printString ).

  msort: x = (| t |
    sorter count: 0.
    t: [ x sortBy: sorter ] cpuTime.
    'mergesort:\t', sorter count printString, '\t', t printString ).

  doTest: label Data: data = (
    ('\n', label) printLine.
    _Scavenge.
    (hsort: data copy) printLine.
    _Scavenge.
    (hsort: data copy) printLine.
    _Scavenge.
    (hsort: data copy) printLine.
    _Scavenge.
    (msort: data copy) printLine.
    _Scavenge.
    (msort: data copy) printLine.
    _Scavenge.
    (msort: data copy) printLine.
    _Scavenge.
    (qsort: data copy) printLine.
    _Scavenge.
    (qsort: data copy) printLine.
    _Scavenge.
    (qsort: data copy) printLine.
    'done' ).

  doAll = (
    doTest: '*** t1 ***' Data: t1.
    doTest: '*** t2 ***' Data: t2.
    doTest: '*** t3 ***' Data: t3.
    doTest: '*** t4 ***' Data: t4.
    doTest: '*** t5 ***' Data: t5.
    doTest: '*** t6 ***' Data: t6.
    'done' ).

|)


