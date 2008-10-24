"Sun-$Revision: 9.1 $"


"Code for method lookup and topological traversals of objects"

traits cecil_context _AddSlots: ( |
    ^ method_lookup: msgName Args: args Params: params = (
	"normally, message lookups want to evaluate any predicates"
	method_lookup: msgName Args: args Params: params
	    EvaluatingPredicates: true.
    ).
    ^ method_lookup: msgName Args: args Params: params
	    EvaluatingPredicates: evalPredicates = (
	(args includes: cecil_void) ifTrue: [
	    cecilErr: 
		'cannot use non-value-returning expression as an ',
		'argument to the "', msgName, '" message'.
	].
	"don't bother caching unoptimized blocks; will never hit"
	args isEmpty ||
	[((msgName = 'eval') && [ params isEmpty &&
	    [ args first isUnoptimizedClosureObject &&
		[ args first existsEvalMethodWithArgSize: args size ]]]) ||
	[interp optimizingCecilMethodLookup not ||
	    [interp messagesAffectedByPredicateObjects includes: msgName]]]
	    ifTrue: [
	    "the original, slow method lookup"
	    method_lookup: msgName Args: args Params: params
		EvaluatingPredicates: evalPredicates 
		CheckUnique: true.
	] False: [
	    "super-zippy cached method lookup"
	    cache_method_lookup: msgName Args: args Params: params.
	].
    ).
    

    _ cache_method_lookup: msgName Args: args Params: params = (
	methodCache lookup: msgName Args: args Params: params In: self
	    IfAbsentPut: [
	    "if it is not in the cache, then perform the method look up"
	    method_lookup: msgName Args: args Params: params
		EvaluatingPredicates: false CheckUnique: true.
	] ).
    

    ^ method_lookup: msgName Args: args Params: params
	    EvaluatingPredicates: evalPredicates
	    CheckUnique: checkUnique = ( | foundMethods. |
	foundMethods: cecil_method_set copyRemoveAll.

	args isEmpty ifTrue: [
	    "treat zero-arg lookups specially"
	    [ | :exit. key. method. |
		key: cecil_method_key copyName: msgName Params: params.
		method: zero_arg_method_lookup: key IfAbsent: exit.
		foundMethods add: method.
	    ] exit.
	] False: [ | po |
	    "construct the partial order over matching methods"
	    po: createMergedPartialOrderOfMethods: msgName 
		Args: args Params: params EvaluatingPredicates: evalPredicates.
	    po leastElemInto: foundMethods. "calculate the least element(s)"
	].

	"filter methods of the same method key that are not visible 
	 from this context."
	foundMethods: foundMethods filterFromContext: self.

	checkUnique ifTrue: [ 
	    "check uniqueness of the result"
	    foundMethods checkUnique: msgName Args: args Params: params.
	    "return the single target method"
	    foundMethods first
	] False: [ foundMethods ] "return the whole set of methods"
    ).
    
    
    "The resend_method_lookup is used only for resending exactly the same
     argument list. Check the eval: msg of the cecil_resend_node in 
     interpreter.self for details"
    
    ^ resend_method_lookup: msgName Args: args Params: params = (
	resend_method_lookup: msgName Args: args Params: params
	    EvaluatingPredicates: true CheckUnique: true ).
    
    ^ resend_method_lookup: msgName Args: args Params: params
	    EvaluatingPredicates: evalPredicates CheckUnique: checkUnique = (
	| foundMethods. po. |
	"construct the partial order over matching methods"
	po: createMergedPartialOrderOfMethods: msgName
	    Args: args Params: params EvaluatingPredicates: evalPredicates.

	foundMethods: cecil_method_set copyRemoveAll.
	po leastElemInto: foundMethods. "calculate the least element(s)"
        
	"filter methods of the same method key that are not visible 
	 from this context."
	foundMethods: foundMethods filterFromContext: self.

	"The least element in the foundMethods should be exactly
	 the one and only method that contains the resend statement.
	 No check need to be done here. Asserts: (foundMethods size = 1)."
	(foundMethods size = 1) ifFalse: [
	    error: 'cannot find the enclosing method "', msgName,
		'" for the resend expression'.
	].

	po remove: foundMethods first.

	foundMethods: foundMethods copyRemoveAll.
	po leastElemInto: foundMethods.
	
	"filter methods of the same method key that are not visible 
	 from this context."
	foundMethods: foundMethods filterFromContext: self.

	checkUnique ifTrue: [ 
	    "check uniqueness of the result"
	    foundMethods checkUnique: msgName Args: args Params: params.
	    "return the single target method"
	    foundMethods first
	] False: [ foundMethods ] "return the whole set of methods"
    ).
    

    "no method caching needed for methods without arguments
     since the method_lookup itself is very simple"
    _ zero_arg_method_lookup: key IfAbsent: block = (
	noArgMethods at: key IfAbsent: [
	    enclosingContext zero_arg_method_lookup: key IfAbsent: block
	].
    ).
    

    "create a cecil_partial_order object for all the matching methods"
    _ createMergedPartialOrderOfMethods: msgName Args: args Params: params
		EvaluatingPredicates: evalPredicates = (
	| po. position. lookupArgs. |
	position: 0.
	lookupArgs: set copyRemoveAll.
	args do: [ | :arg. lookupArg. newpo. foundMap. | 
	    newpo: cecil_partial_order copyRemoveAll.
	    
	    "maps objects to method_sets"
	    foundMap: dictionary copyRemoveAll. 
	    
	    lookupArg: arg.
	    (interp messagesAffectedByPredicateObjects includes: msgName)
		ifTrue: [
		arg predicateChildren nonEmpty ifTrue: [
		    " in case arg has predicate children, need to make a 
		     dummy child of arg (lookupArg) that can inherit from 
		     the predicate children "
		    lookupArg: cecil_object copy.
		    lookupArg newParent: 'real obj' AndObject: arg.
		].
		lookupArg calculatePredicateParents.
		lookupArgs add: lookupArg.
	    ].
	    
	    lookupArg ancestorsDo: [ | :ancestor. foundSet. |
		foundSet: ancestor lookup_method: msgName 
		    AtPosition: position 
		    ArgSize: args size ParamSize: params size.
		foundSet nonEmpty ifTrue: [
		    evalPredicates && [(ancestor isVisibleFrom: arg) not]
			ifTrue: [
			" this predicate object not visible; 
			 ignore all attached methods "
			foundSet: foundSet copyRemoveAll.
		    ].
		].
		
		"Based on the fact that each will be evaluted in
		 reverse topological order.
		 If cannot find any matched msg on my own, 
		 then copy from my parents"
		foundSet isEmpty ifTrue: [
		    ancestor immediateParentsDo: [ | :parent | 
			foundSet addAll: foundMap at: parent.
		    ] WithTopObj: top_object.
		] False: [
		    foundSet do: [ | :foundmethod |
			newpo add: foundmethod.
			ancestor immediateParentsDo: [ | :parent |
			    (foundMap at: parent) do: [ | :parentmethod |
				newpo order: foundmethod Before: parentmethod.
			    ].
			] WithTopObj: top_object.
		    ].
		].
		foundMap at: ancestor Put: foundSet.
	    ] WithTopObj: top_object.
	    
	    position = 0 ifTrue: [ po: newpo ] False: [ po combine: newpo ].
	    
	    position: position + 1.
	].
	
	(interp messagesAffectedByPredicateObjects includes: msgName)
	    ifTrue: [
	    lookupArgs do: [ | :lookupArg |
		lookupArg clearPredicateParents.
	    ].
	].
	
	po ).
| )


cecil_empty_context _AddSlots: ( |
    zero_arg_method_lookup: key IfAbsent: block = ( block value ).
| )


traits cecil_object _AddSlots: ( |
    "Upward and downward traversals"

    "invoke block on all immediate parents"
    immediateParentsDo: block WithTopObj: topObj = (
	immediateParentsDo: block.
	isaSpecs isEmpty && [parentSpecs isEmpty &&
		[predicateParents isEmpty && [isTopObject not]]] ifTrue: [
	    "in the absence of any declared parents, visit top"
	    block value: topObj.
	].
    ).
    immediateParentsDo: block = (
	parentsDo: [ | :parent |
	    parent isTopObject ifFalse: [
		block value: parent.
	    ].
	].
	predicateParents do: [ | :parent |
	    block value: parent.
	].
    ).

    "invoke block on all ancestors, in reverse (top-down) topological order"
    ancestorsDo: block WithTopObj: topObj = (
	block value: topObj.
	ancestorsDo: block ).

    ancestorsDo: block = ( | visited |
	visited: set copyRemoveAll.
	ancestorsDo: block WithVisited: visited.
    ).

    ancestorsDo: block WithVisited: visited = (
	(visited includes: self) ifFalse: [
	    visited add: self.
	    immediateParentsDo: [ | :parent |
	        parent ancestorsDo: block WithVisited: visited.
	    ].
	    isTopObject ifFalse: [
		block value: self.
	    ].
	]
    ).


    "Predicate Parents"

    calculatePredicateParents = (
	predicateParentsCalculated ifFalse: [
	    predicateParents: predicateParents copyRemoveAll.
	    predicateParentsCalculated: true.
	    parentsDo: [ | :parent |
		parent calculatePredicateParents.
		addPredicateParentsFrom: parent.
	    ].
	].
    ).
    addPredicateParentsFrom: parent = (
	predicateParents addAll: parent predicateLeaves.
    ).

    clearPredicateParents = (
	predicateParentsCalculated ifTrue: [
	    predicateParents: predicateParents copyRemoveAll.
	    predicateParentsCalculated: false.
	    parentsDo: [ | :parent |
		parent clearPredicateParents.
	    ].
	].
    ).

    predicateLeaves = ( | leaves |
	" limit to leaves, since the parents of the leaves will be 
	  inherited by the leaves (just an optimization) "
	leaves: set copyRemoveAll.
	"record that we've read the predicate children list"
	predicateChildrenUsed: true.
	predicateChildren do: [ | :child. child_leaves. |
	    child_leaves: child predicateLeaves.
	    child_leaves isEmpty ifTrue: [
		leaves add: child.
	    ] False: [
		leaves addAll: child_leaves.
	    ].
	].
	leaves ).

    isVisibleFrom: obj = ( "normal objects always visible" true ).


    "Miscellaneous"

    inheritsFrom: obj = (
	obj isTopObject ifTrue: [ ^ true ].
	isTopObject ifTrue: [ ^ false ].
	ancestorsDo: [ | :ancestor |
	    (ancestor matches: obj) ifTrue: [ ^ true ].
	].
	false ).

    "lookup method based on the object itself"
    lookup_method: msgName AtPosition: pos
	    ArgSize: argSize ParamSize: paramSize = ( | foundSet |
	foundSet: set copyRemoveAll.
	attachedMethodsDo: [ | :m |
	    (m name = msgName) && [
		(argSize = m formals size) && [
		    paramSize = m params size]] ifTrue: [ 
		"check to see if the method is constrained by this
		 object at the requested argument position"
		(m isFormalConstrainedBy: self At: pos) ifTrue: [
		    foundSet add: m.
		].
	    ].
	].
	foundSet ).

    matches: object = ( = object ).
| )


traits cecil_predicate_object _AddSlots: ( |
    isVisibleFrom: obj = ( | context. result. |
	" evaluate the predicate expression on obj "
	defining_context creationTime != 'dynamic' ifTrue: [
	    error: 'defining_context for pred when expr not dynamic'.
	].
	context: cecil_nested_context createInContext: defining_context.
	parentSpecsDo: [ | :parentSpec |
	    context addBinding:
	    	cecil_constant_binding copyName: parentSpec name WithValue: obj.
	].
	context shareEnclosingMethodCache.
	result: when eval: context.
	result = (context lookup_top_context_object: 'true')  ifTrue: [^true].
	result = (context lookup_top_context_object: 'false') ifTrue: [^false].
	cecilErr: 'predicate expression doesn\'t evaluate to true or false'.
	false ).
	
    " predicate objects don't have any predicate parents
      (otherwise would create weird cycles in inheritance graph) "
    addPredicateParentsFrom: parent = ( self ).
| )


traits cecil_instantiated_object _AddSlots: ( |
    "check if receiver is a parameterized object whose instantiating
     parameters are type vars that can be matched against the corresponding
     parameters of the argument object"
    matches: object = (
	== object ifTrue: [ ^ true ].
	object isInstantiated ifFalse: [ ^ false ].
	parameterized_object = object parameterized_object ifFalse: [ ^ false ].
	params with: object params Do: [ | :formal. :actual. |
	    (formal matches: actual) ifFalse: [ ^ false ].
	].
	true ).
| )


traits cecil_type_spec _AddSlots: ( |
    matches: spec = ( = spec ).
| )

traits cecil_type_var_spec _AddSlots: ( |
    matches: spec = (
	upperBound isSpecified ifTrue: [
	    (spec type isSubtypeOf: upperBound type) ifFalse: [
		^ false
	    ].
	].
	lowerBound isSpecified ifTrue: [
	    (lowerBound type isSubtypeOf: spec type) ifFalse: [
		^ false
	    ].
	].
	true ).
| )


traits cecil_method _AddSlots: ( |
    isFormalConstrainedBy: object At: pos = (
	(formals at: pos) constraint matches: object ).
| )


traits cecil_interp _AddSlotsIfAbsent: ( | cecil_method_set = () | )
traits cecil_method_set _Define: ( |
    parent* = traits set.
    errHandlingParent* = mixins cecil_error_handling.

    collectionName = 'cecil_method_set'.

    _ isUnique = ( size = 1 ).
    ^ notUnique = ( isUnique not ).
    ^ checkUnique: msgName Args: args Params: params = (
	isEmpty ifTrue: [
	    ('{init_set_' isPrefixOf: msgName) ifTrue: [
		cecilErr:
		    'field ', (msgName copyFrom: 10) copyWithoutLast,
		    params printString,
		    ' of ', args first cecilShortPrintString,
		    ' does not exist or is shared or read-only'.
	    ] False: [
		cecilErr: 'message ', msgName, params printString,
		    args cecilShortPrintString, ' not understood'.
	    ].
	].
	isUnique ifFalse: [ | str | 
	    first isInitSetAccessor ifTrue: [
		str: 'field ', first body fieldName, params printString,
		    ' of ', args first cecilShortPrintString,
		    ' defined ambigously:'.
	    ] False: [
		str: 'message ', msgName, params printString,
		    args cecilShortPrintString, ' ambiguous:'.
	    ].
	    do: [ | :m | str: str, '\n  ', m printString ].
	    cecilErr: str.
         ].
	debugMsg: 'msg found SUCCESSFULLY --> ', first printString.
    ).

    ^ filterFromContext: context = ( | newSet |
	newSet: cecil_method_set copy. "a new empty copy"
	do: [ | :method | 
	    newSet filterAdd: method InContext: context.
	].
	newSet ).

    ^ filterAdd: method InContext: context = ( 
	isEmpty ifTrue: [ add: method. ^ self ].

	"The nestedLevel of method will always be less than that of the 
         context. Or else it's a bug in the interpreter"
	method nestedLevel <= context nestedLevel ifFalse: [
	    error:
		'nested level of a method is greater than that ',
		'of the current context'.
	].

	do: [ | :previousAddedMethod |
	    "check methods of the same key only"
	    (previousAddedMethod key = method key) ifTrue: [
		(previousAddedMethod nestedLevel < method nestedLevel) 
		    ifTrue: [
		    "block the view of the previousAddedMethod"
		    remove: previousAddedMethod.  
		    add: method.
		    ^ self.
		] False: [
		    "Since duplicate method declaration is an error
		     and it should be taken care of before invoking the 
		     method lookups.  This is the case for 
		     (previousAddedMethod nestedLevel > method nestedLevel)
		     Just discard this method"
		    ^ self ].
	    ].
	].
	"if none of the above then just add in the new method"
	add: method.
    ).
| )

globals cecil_interp _AddSlotsIfAbsent: ( | cecil_method_set = () | )
cecil_method_set _Define: set clone _AddSlots: ( |
    _ parent* = traits cecil_method_set.
    _ thisObjectPrints = true.
| )
