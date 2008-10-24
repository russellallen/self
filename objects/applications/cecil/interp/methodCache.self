"Sun-$Revision: 9.1 $"

"The method cache maps a message name and its argument number
 to a corresponding constraint_mapping_table"
traits cecil_interp _AddSlotsIfAbsent: ( | cecil_method_cache = () | )
traits cecil_method_cache _Define: ( |
    _ parent* = traits dictionary.
    _ errHandlingParent* = mixins cecil_error_handling.

    copy = ( error: 'cannot copy me' ).
    copyRemoveAll = (
	resend.copyRemoveAll
	    constrainedPositions: constrainedPositions copyRemoveAll ).

    _ keyFor: msgName ArgCount: argc ParamCount: paramc = (
	"prolog-like naming, with argcount & param count in msg name"
	msgName, '/', argc printString, '/', paramc printString ).
    _ keyFor: aMethod = (
	keyFor: aMethod name
	    ArgCount: aMethod formals size
	    ParamCount: aMethod params size ).

    ^ lookup: msgName Args: args Params: params In: context
	    IfAbsentPut: block = (
	| constrainedArgs. cacheKey. method. |
	constrainedArgs:
	    constrainedPositions filter: msgName Args: args Params: params
	    In: context.
	cacheKey: constrainedArgs cacheKey.
	if: (keyFor: msgName ArgCount: args size ParamCount: params size)
	IsPresentDo: [ | :table |
	    method: table lookupArgs: cacheKey IfAbsentPut: block.
	] IfAbsentPut: [
	    method: block value.
	    createEntryFor: method Args: cacheKey
	] AndDo: [].
	method ).

    ^ createEntryFor: aMethod Args: args = (
	createEntryFor: aMethod Args: args At: 0 ).
    ^ createEntryFor: aMethod Args: args At: position = (
	| entry |
	args size = position ifTrue: [
	    entry: mapping_table_leaf copy.
	    entry method: aMethod.
	] False: [
	    entry: constraint_mapping_table copy.
	    entry at: (args at: position) Put:
		createEntryFor: aMethod Args: args At: position+1.
	].
	entry ).

    "a new method has been added; update tables to handle it"
    ^ addMethod: aMethod = (
	removeKey: (keyFor: aMethod) IfAbsent: [].
	constrainedPositions addMethod: aMethod.
    ).

    ^ reset = ( copyRemoveAll ).
| )

globals cecil_interp _AddSlotsIfAbsent: (| constrained_positions_table = ()|)

globals cecil_interp _AddSlotsIfAbsent: ( | cecil_method_cache = () | )
cecil_method_cache _Define: dictionary clone _AddSlots: ( |
    _ parent* = traits cecil_method_cache.
    constrainedPositions <- constrained_positions_table.
| )


"constraint_mapping_table is a trie-like data structure, where each level
 dispatches on one arg position and maps to another trie with one fewer args
 to test.  The leaves of this tree are mapping_table_leaf objects"
traits cecil_interp _AddSlotsIfAbsent: ( | constraint_mapping_table = () | )
traits constraint_mapping_table _Define: ( |
    parent* = traits dictionary.
    errHandlingParent* = mixins cecil_error_handling.

    ^ lookupArgs: args IfAbsentPut: block = ( 
	lookupArgs: args At: 0 IfAbsentPut: block ).
    ^ lookupArgs: args At: position IfAbsentPut: block = ( | method |
	if: (args at: position) IsPresentDo: [ | :entry |
	    method:
		entry lookupArgs: args At: position+1 IfAbsentPut: block.
	] IfAbsentPut: [
	    method: block value.
	    cecil_method_cache
		createEntryFor: method Args: args At: position+1
	] AndDo: [].
	method ).
| )

globals cecil_interp _AddSlotsIfAbsent: ( | constraint_mapping_table = () | )
constraint_mapping_table _Define: dictionary clone _AddSlots: ( |
    _ parent* = traits constraint_mapping_table.
| )


traits cecil_interp _AddSlotsIfAbsent: ( | mapping_table_leaf = () | )
traits mapping_table_leaf _Define: ( |
    parent* = traits clonable.
    errHandlingParent* = mixins cecil_error_handling.

    printString = ( method printString ).

    ^ lookupArgs: args IfAbsentPut: block = ( 
	lookupArgs: args At: 0 IfAbsentPut: block ).
    ^ lookupArgs: args At: position IfAbsentPut: block = (
	args size = position ifFalse: [ error: 'shouldn\'t be at a leaf' ].
	debugMsg: 'cache hit on ', method printString.
	method ).
| )

globals cecil_interp _AddSlotsIfAbsent: ( | mapping_table_leaf = () | )
mapping_table_leaf _Define: ( |
    _ parent* = traits mapping_table_leaf.
    _ thisObjectPrints = true.
    method <- cecil_method.
| )


traits cecil_interp _AddSlotsIfAbsent: ( | constrained_positions_table = () | )
traits constrained_positions_table _Define: ( |
    _ parent* = traits dictionary.
    _ errHandlingParent* = mixins cecil_error_handling.

    ^ keyFor: msgName ArgCount: argc ParamCount: paramc = (
	"prolog-like naming, with argcount & paramcount in msg name"
	msgName, '/', argc printString, '/', paramc printString ).
    _ keyFor: aMethod = (
	keyFor: aMethod name
	    ArgCount: aMethod formals size
	    ParamCount: aMethod params size ).

    ^ constrainedPositionsFor: msgName ArgCount: argc ParamCount: paramc
		In: context = ( | ps |
	if: (keyFor: msgName ArgCount: argc ParamCount: paramc)
	IsPresentDo: [ | :ps1 |
	    ps: ps1.
	] IfAbsentPut: [
	    ps: context calculateConstrainedPositionsFor: msgName
		    ArgCount: argc.
	    ps
	] AndDo: [].
	ps ).

    ^ filter: msgName Args: args Params: params In: context = (
	| argc. paramc. constrainedPositions. argKey. |

	"lookup/compute&cache constrained positions for this message"
	argc: args size.
	paramc: params size.
	constrainedPositions:
	    constrainedPositionsFor: msgName ArgCount: argc ParamCount: paramc
	    In: context.

	"now filter actual arguments to include only the constrained positions"
	argKey: cecil_obj_list copyRemoveAll.
	constrainedPositions do: [ |:pos|
	    argKey add: args at: pos.
	].
	argKey ).

    ^ addMethod: aMethod = ( | constrainedPositions |
	constrainedPositions: at: (keyFor: aMethod) IfAbsent: [ ^ self ].
	constrainedPositions addAll: aMethod constrainedPositions.
    ).
 
    "returns whether there was a change to the database"
    ^ insertMethod: aMethod = ( | mps |
	mps: aMethod constrainedPositions.
	if: (keyFor: aMethod)
	IsPresentDo: [ | :ps. |
	    (ps includesAll: mps) ifTrue: false	False: [ ps addAll: mps. true ]
	] IfAbsentPut: [ set copyRemoveAll addAll: mps ] AndDo: true ).
| )

globals cecil_interp _AddSlotsIfAbsent: (| constrained_positions_table = ()|)
constrained_positions_table _Define: dictionary clone _AddSlots: ( |
    _ parent* = traits constrained_positions_table.
| )


"Extensions of other data structures"

traits cecil_context _AddSlots: ( |
    ^ calculateConstrainedPositionsFor: msg ArgCount: argc = (
	| constrainedPositions |
	constrainedPositions: treeSet copyRemoveAll.
	argc > 0 ifTrue: [
	    calculateConstrainedPositions: constrainedPositions
		For: msg ArgCount: argc.
	].
	constrainedPositions ).

    _ calculateConstrainedPositions: constrainedPositions
	For: msg ArgCount: argc = (
	methods do: [ | :method |
	    (method name = msg) && [method formals size = argc] ifTrue: [
		constrainedPositions addAll: method constrainedPositions.
		constrainedPositions size = argc ifTrue: [
		    "all arguments are constrained;
		     no more searching needed"
		    ^ self
		].
	    ].
	].
	enclosingContext calculateConstrainedPositions: constrainedPositions
	    For: msg ArgCount: argc.
    ).
| )


cecil_empty_context _AddSlots: ( |
    "_" calculateConstrainedPositions: constrainedPositions
	For: msg ArgCount: argc = ( self ).
| )


traits cecil_obj_list _AddSlots: ( |
    ^ cacheKey = ( | args |
	args: copyRemoveAll.
	do: [ | :arg | args add: arg cacheKey ].
	args ).
| )


traits cecil_object _AddSlots: ( |
    cacheKey = ( | ps |
	"compute which ancestor up a single inheritance chain holds the
	 first method, and use that as the cache index"
	hasAttachedMethods not && [ps: parents. ps size = 1]
	    ifTrue: [ ps first cacheKey ]
	    False: self ).
| )
