"Sun-$Revision: 9.1 $"


"Data structures for partial orders"


"cecil_relation is a set of ordered pairs"

traits cecil_interp _AddSlotsIfAbsent: ( | cecil_relation = () | )
traits cecil_relation _Define: ( |
    _ parent* = traits clonable.
    _ errHandlingParent* = mixins cecil_error_handling.

    printString = ( 'relation: ', pair printString ).

    copy = ( clone pairs: pairs copy ).
    copyRemoveAll = ( clone pairs: pairs copyRemoveAll ).

    "add a new relation from node1 to node2"
    ^ relate: node1 To: node2 = (
	pairs add: cecil_ordered_pair copyFrom: node1 To: node2.
    ).

    "union of two cecil_relations w.r.t. the intersection of their nodes"
    ^ union: r2 WRT: nodes = ( | newPairs |
	newPairs: pairs copyRemoveAll.
	pairs do: [ | :pair |
	    (nodes includes: pair from) && [nodes includes: pair to] ifTrue: [
		newPairs add: pair.
	    ].
	].
	r2 pairs do: [ | :pair |
	    (nodes includes: pair from) && [nodes includes: pair to] ifTrue: [
		newPairs add: pair.
	    ].
	].
	pairs: newPairs.
    ).

    ^ remove: node = ( | deletedPairs |
	deletedPairs: list copyRemoveAll.
	pairs do: [ | :pair |
	    (pair from = node) || [pair to = node] ifTrue: [
		deletedPairs add: pair.
	    ].
	].
	deletedPairs do: [ | :pair |
	    pairs remove: pair.
	].
    ).

    ^ is: node1 TransitivelyRelatedTo: node2 = (
	is: node1 TransitivelyRelatedTo: node2 Closure: set copyRemoveAll ).
    _ is: node1 TransitivelyRelatedTo: node2 Closure: closure = (
	pairs do: [ | :pair |
	    pair from = node1 ifTrue: [
		pair to = node2 ifTrue: [ ^ true ].
		(closure includes: pair to) ifFalse: [
		    closure add: pair to.
		    (is: pair to TransitivelyRelatedTo: node2 Closure: closure)
			ifTrue: [ ^ true ].
		].
	    ].
	].
	false ).

    ^ includesAsTarget: node = (
	pairs do: [ | :pair |
	    pair to = node ifTrue: [ ^ true ].
	].
	false ).
| )

globals cecil_interp _AddSlotsIfAbsent: ( | cecil_relation = () | )
cecil_relation _Define: ( |
    _ parent* = traits cecil_relation.
    _ thisObjectPrints = true.
    pairs <- set.
| )


traits cecil_interp _AddSlotsIfAbsent: ( | cecil_ordered_pair = () | )
traits cecil_ordered_pair _Define: ( |
    _ parent* = traits clonable.
    _ errHandlingParent* = mixins cecil_error_handling.

    printString = ( from printString, '=>', to printString ).

    copyFrom: f To: t = ( (copy from: f) to: t ).

    = pair = ( (from = pair from) && [to = pair to] ).
    hash = ( from hash && to hash ).
| )

globals cecil_interp _AddSlotsIfAbsent: ( | cecil_ordered_pair = () | )
cecil_ordered_pair _Define: ( |
    _ parent* = traits cecil_ordered_pair.
    _ thisObjectPrints = true.
    from.
    to.
| )


traits cecil_interp _AddSlotsIfAbsent: ( | cecil_partial_order = () | )
traits cecil_partial_order _Define: ( |
    parent* = traits clonable.
    errHandlingParent* = mixins cecil_error_handling.

    printString = (
	'nodes: ', nodes printString, ';\n', orderings printString  ). 

    ^ copy = ( error: 'cannot copy a partial order object' ).
    ^ copyRemoveAll = (
	(clone nodes: nodes copyRemoveAll) orderings: orderings copyRemoveAll ).

    ^ add: node = ( 
	nodes add: node.
    ).

    ^ order: node1 Before: node2 = (
	orderings relate: node1 To: node2.
    ).

    ^ combine: pOrder = (
	"intersection of the nodes and union of the orderings"
	nodes: nodes intersect: pOrder nodes.
	orderings union: pOrder orderings WRT: nodes.
    ).

    ^ leastElemInto: le = (
	nodes do: [ | :node |
	    (orderings includesAsTarget: node) ifFalse: [
		"no one is less than node"
		le add: node.
	    ].
	].
	le isEmpty ifTrue: [
	    nodes nonEmpty ifTrue: [
		"must have a cycle among the least elements; treat specially"

		"algorithm for finding least cycle:
		 for all nodes N:
		    if exists some other node N2 that is less than N,
		    and N is not less than N2, then N is not in least cycle.
		 least cycle are nodes not otherwise excluded"
		nodes do: [ | :node |
		    [ |:exit|
			nodes do: [ | :node2 |
			    (orderings is: node2 TransitivelyRelatedTo: node) &&
				[(orderings is: node
					TransitivelyRelatedTo: node2) not]
				ifTrue:
				"found a node that is strictly less than"
				exit.
			].
			"didn't find any node that is strictly less than this
			 one, so it must be a least element"
			le add: node.
		    ] exit.
		].
		le size > 1 ifFalse: [
		    error: 'expected multiple least elements'.
		].
	    ].
	].
    ).

    ^ remove: node = (
	nodes remove: node.
	orderings remove: node.
    ).

| )

globals cecil_interp _AddSlotsIfAbsent: ( | cecil_partial_order = () | )
cecil_partial_order _Define: ( |
    _ parent* = traits cecil_partial_order.
    _ thisObjectPrints = true.
    nodes <- set. 
    orderings <- cecil_relation. 
| )
