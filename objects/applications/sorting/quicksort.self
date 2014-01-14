" Sun-$Revision: 30.6 $ "
 
"Copyright 1992-2012 AUTHORS.
 See the LICENSE file for license information."

traits indexable _AddSlots: (|
    quicksorting* = (|
	_ qsortThreshold = 60.	"use insertion sort below this limit"

	_ ascendingOrder = (|
	    element: e1 Precedes: e2 = ( e1 < e2 ).
	    element: e1 Equals:   e2 = ( e1 = e2 ).
	|).

	^ quicksort = ( sortFrom: 0 To: size pred By: ascendingOrder ).

	^ quicksortBy: cmp = ( sortFrom: 0 To: size pred By: cmp ).

	^ sortFrom: start To: stop By: cmp = (
	    "Sort the given subrange of the receiver in place."
	    "Details: quicksort elements into rough order, then insertion
	     sort. qsortThreshold, which is approximately the point at which
	     insertion sort becomes faster than quicksort, was determined
	     empirically (while running only the new compiler)."

	    (stop - start) > qsortThreshold ifTrue:
		[ quicksortFrom: start To: stop By: cmp ].
	    insertionSortFrom: start To: stop By: cmp.
	    self ).

	_ quicksortFrom: start To: stop By: cmp = (
	    | splitIndex |
	    splitIndex: partitionFrom: start To: stop By: cmp.
	    (splitIndex - start) > qsortThreshold ifTrue:
		[ quicksortFrom: start To: splitIndex By: cmp ].
	    (stop - splitIndex succ) > qsortThreshold ifTrue:
		[ quicksortFrom: splitIndex succ To: stop By: cmp ].
	    self ).

	_ partitionFrom: start To: stop By: cmp = (
	    "Partition the subrange of receiver from start to stop using
	     the given pivot. No elements greater than the pivot will be
	     to the left of the index returned and no elements less than
	     the pivot will be to the right of the index returned."

	    | pIndex. pivot. left. right |
	    pIndex: start + (random integer: (stop - start)).
	    pivot:  (at: pIndex).
	    left:   start.
	    right:  stop.
	    [
		"invariant: start <= left <= right <= stop"
		"invariant: some element = pivot is located in [left...right]"
		"scan left and right, stopping at a pivot if not before"
		[ cmp element: (at: left) Precedes: pivot ] whileTrue: [
		    left: left succ.
		].
		[ cmp element: pivot Precedes: (at: right) ] whileTrue: [
		    right: right pred.
		].

		(left = right) ifTrue: [ ^left ].

		(cmp element: (at: left)  Equals: pivot) &&
		[cmp element: (at: right) Equals: pivot] ifTrue: [
		"try to keep left and right partitions balanced"
		"Warning: omitting this balancing code leads to deep
		 stacks when sorting arrays of equal-valued elements"
		(left - start) < (stop - right)
		    ifTrue: [  left:  left succ ]
		     False: [ right: right pred ].

		] False: [ swap: left With: right ].
	    ] loop ).

	^ insertionSort = (
	    insertionSortFrom: 0 To: size pred By: ascendingOrder ).

	^ insertionSortFrom: start To: stop By: cmp = (
	    start succ to: stop Do: [| :j. el. dest |
		el: (at: j).
		dest: j.
		[(dest > start) &&
		 [cmp element: el Precedes: (at: dest pred)]] whileTrue: [
		    at: dest Put: (at: dest pred).
		    dest: dest pred.
		].
		at: dest Put: el.
	    ].
	    self ).

	^ swap: i With: j = (
	    | t |
	    t:	       (at: i).
	    at: i Put: (at: j).
	    at: j Put: t.
	    self ).
    |).
|)
