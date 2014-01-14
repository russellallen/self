"Sun-$Revision: 9.1 $"

"Cecil type nodes"

traits cecil_interp _AddSlotsIfAbsent: ( | cecil_type = () | )
traits cecil_type _Define: ( |
    _ parent* = traits clonable.
    _ errHandlingParent* = mixins cecil_error_handling.

    isTop = false.
    isClosure = false.

    isLUB = false.
    isGLB = false.

    "Operations defined on all types"

    isSubtypeOf: t2 HandlingDynamic: handleDynamic = (
	(= t2) || [ strictSubtype: t2 HandlingDynamic: handleDynamic ] ).
    isSubtypeOf: t2 = ( isSubtypeOf: t2 HandlingDynamic: true ).

    strictSubtype: t2 HandlingDynamic: handleDynamic = (
	error: 'subclass responsibility' ).
    strictSubtype: t2 = ( strictSubtype: t2 HandlingDynamic: true ).

    lub: t2 = (
	error: 'subclass responsibility' ).
    glb: t2 = (
	error: 'subclass responsibility' ).

    subtypesDo: block = ( error: 'subclass responsibility' ).
    conformingObjects: context Do: block = ( error: 'subclass responsibility' ).

    needsInstantiation = false.
    isInstantiated = false.
| )

globals cecil_interp _AddSlotsIfAbsent: ( | cecil_type = () | )
cecil_type _Define: ( |
    _ parent* = traits cecil_type.
| )


"A type node in the lattice, with explicit supertype and subtype links"

traits cecil_interp _AddSlotsIfAbsent: ( | cecil_type_node = () | )
traits cecil_type_node _Define: ( |
    _ parent* = traits cecil_type.

    copy = ( | tn |
	tn: clone.
	tn supertypes: supertypes copy.
	tn subtypes: subtypes copy.
	tn ).

    addSupertype: type In: context = (
	(supertypes includes: type) ifFalse: [
	    supertypes add: type.
	    addAsSubtypeOf: type In: context.
	].
    ).

    _ addAsSubtypeOf: type In: context = (
	context creationTime = 'static' ifTrue: [
	    type subtypes add: self.
	    context interp signaturesNeedTypeChecking: true.
	].
    ).

    removeFromLattice = (
	supertypes do: [ | :type |
	    type subtypes remove: self IfAbsent: [].
	].
	subtypes do: [ | :type |
	    type supertypes remove: self IfAbsent: [].
	].
    ).

    strictSubtype: t2 HandlingDynamic: handleDynamic = (
	t2 = voidType ifTrue: [ ^ true ].
	t2 isTop ifTrue: [ ^ true ].
	t2 = dynamicType ifTrue: [ ^ handleDynamic ].
	t2 isLUB ifTrue: [
	    "True iff t1 is a subtype of any of the t2 types"
	    ^ t2 types findFirst: [ | :type | isSubtypeOf: type ]
		IfPresent: true IfAbsent: false.
	].
	t2 isGLB ifTrue: [
	    "True iff t1 is a subtype of all t2 types"
	    ^ t2 types findFirst: [ | :type | (isSubtypeOf: type) not ]
		IfPresent: false IfAbsent: true.
	].
	"another type node; traverse explicit subtyping links"
	supertypes findFirst: [ | :st |
	    st isSubtypeOf: t2 HandlingDynamic: handleDynamic
	] IfPresent: true IfAbsent: false ).

    lub: t2 = (
	t2 = voidType ifTrue: [ error: 'cannot take lub of void type' ].
	t2 = dynamicType ifTrue: [ ^ t2 ].
	(isSubtypeOf: t2) ifTrue: [ ^ t2 ].  "if t1 <= t2, lub is t2"
	(t2 isSubtypeOf: self) ifTrue: [ ^ self ]. "if t2 <= t1, lub is t1"
	cecil_lub_type_node copyWith: self And: t2 ).

    glb: t2 = (
	t2 = dynamicType ifTrue: [ ^ t2 ].
	(isSubtypeOf: t2) ifTrue: [ ^ self ].  "if t1 <= t2, glb is t1"
	(t2 isSubtypeOf: self) ifTrue: [ ^ t2 ]. "if t2 <= t1, glb is t2"
	cecil_glb_type_node copyWith: self And: t2 ).

    subtypesDo: block = (
	subtypes do: [ | :type | type subtypesDo: block ].
	block value: self.
    ).

    "no objects conform to a random type node; only declared types (below)
     have that"
    conformingObjects: context Do: block = ( self ).
| )

globals cecil_interp _AddSlotsIfAbsent: ( | cecil_type_node = () | )
cecil_type_node _Define: ( |
    _ parent* = traits cecil_type_node.
    supertypes <- set. "parents in type hierarchy"
    subtypes <- set. "inverse of supertypes"
    isPredefined <- false.
| )


traits cecil_interp _AddSlotsIfAbsent: ( | cecil_named_type = () | )
traits cecil_named_type _Define: ( |
    _ parent* = traits cecil_type_node.

    printString = ( object cecilPrintString ).

    copy = ( resend.copy instantiations: instantiations copy ).
    copyObject: obj = ( copy object: obj ).

    addSupertype: type In: context = (
	resend.addSupertype: type In: context.
	instantiations do: [ |:type| error: 'need to write this' ].
    ).

    removeFromLattice = (
	resend.removeFromLattice.
	instantiations do: [ |:type| type removeFromLattice ].
    ).

    subtypesDo: block = (
	subtypes do: [ | :type | type subtypesDo: block ].
	instantiations do: [ | :type | type subtypesDo: block ].
	block value: self.
    ).

    conformingObjects: context Do: block = (
	block value: object.
	subtypes do: [ | :subtype |
	    subtype conformingObjects: context Do: block.
	].
	instantiations do: [ | :type |
	    type conformingObjects: context Do: block.
	].
    ).

    copyInstantiatingWith: params In: context AtLocation: location = ( | type |
	context interp doInstantiation ifFalse: [ ^ self ].
	type: instantiations at: params IfAbsent: [
	    instantiations at: params Put: nil.
	    type: cecil_instantiated_type
		copyInstantiating: self With: params
		    In: context AtLocation: location.
	    instantiations at: params Put: type.
	    ^ type ].
	type == nil ifTrue: [
	    cecilErr: 'illegal cyclic subtyping for ', printString.
	].
	type ).

    checkInstantiation: actuals AtLocation: location = (
	params checkInstantiationOf: self With: actuals AtLocation: location.
    ).

    needsInstantiation = ( object needsInstantiation ).
    params = ( object params ).
| )

globals cecil_interp _AddSlotsIfAbsent: ( | cecil_object = () | )

globals cecil_interp _AddSlotsIfAbsent: ( | cecil_named_type = () | )
cecil_named_type _Define: cecil_type_node clone _AddSlots: ( |
    _ parent* = traits cecil_named_type.
    _ thisObjectPrints = true.
    object <- cecil_object.
    instantiations <- dictionary. "cecil_param_list->cecil_instantiated_type"
| )


traits cecil_interp _AddSlotsIfAbsent: ( | cecil_instantiated_type = () | )
traits cecil_instantiated_type _Define: ( |
    parent* = traits cecil_type_node.

    printString = ( parameterized_type object name, params printString ).

    copyInstantiating: type With: params In: context AtLocation: location = (
	| c |
	c: copy.
	c parameterized_type: type.
	c params: params.
	c context: context.
	c location: location.
	c completeInstantiation.
	c ).

    completeInstantiation = (
	"first check that instantiations obey constraints"
	context creationTime = 'static' ifTrue: [
	    parameterized_type checkInstantiation: params AtLocation: location.
	].

	"create instantiated supertype links"
	parameterized_type supertypes do: [ | :s. supertype. |
	    supertype: s.
	    supertype isInstantiated ifTrue: [ | supertypeActuals. changed. |
		"re-instantiate ancestor type using my instantiation"
		supertypeActuals: cecil_param_list copyRemoveAll.
		changed: false.
		supertype params do: [ | :param |
		    [ | :exit |
			parameterized_type params with: params Do: [
			    | :formal. :actual. |
			    formal type = param type ifTrue: [
				"supertype was instantiated with a parameter,
				 not a real type"
				"use my instantiating type instead"
				supertypeActuals add: actual.
				changed: true.
				exit value.
			    ].
			].
			supertypeActuals add: param.
		    ] exit.
		].
		changed ifTrue: [
		    "re-instantiate the supertype with my instantiating types"
		    supertype:
			supertype parameterized_type
			    copyInstantiatingWith: supertypeActuals copy
			    In: context AtLocation: location.
		] False: [
		    "no change; supertype was instantiated with real types;
		     just add supertype directly"
		].
	    ] False: [
		"not instantiated; just add it directly"
	    ].
	    addSupertype: supertype In: context.
	].
    ).

    conformingObjects: context Do: block = (
	subtypes do: [ | :subtype |
	    subtype conformingObjects: context Do: block
	].
    ).

    object = (
	parameterized_type object
	    copyInstantiatingWith: params
	    AtLocation: location ).

    isInstantiated = true.
| )

globals cecil_interp _AddSlotsIfAbsent: (| cecil_param_list = () |)
globals cecil_interp _AddSlotsIfAbsent: (| cecil_context = () |)

globals cecil_interp _AddSlotsIfAbsent: (| cecil_instantiated_type = () |)
cecil_instantiated_type _Define: cecil_type_node clone _AddSlots: ( |
    _ parent* = traits cecil_instantiated_type.
    _ thisObjectPrints = true.
    parameterized_type <- cecil_named_type.
    params <- cecil_param_list.
    context <- cecil_context.
    location <- token_location.
| )


traits cecil_interp _AddSlotsIfAbsent: ( | cecil_type_var_node = () | )
traits cecil_type_var_node _Define: ( |
    _ parent* = traits cecil_type_node.

    copyName: n = ( (copy name: n) fullName: n ).

    printString = ( '`', name ).

    _ addAsSubtypeOf: type In: context = (
	"don't maintain back links for type variables"
	self ).
| )

globals cecil_interp _AddSlotsIfAbsent: ( | cecil_type_var_node = () | )
cecil_type_var_node _Define: cecil_type_node clone _AddSlots: ( |
    _ parent* = traits cecil_type_var_node.
    _ thisObjectPrints = true.
    name <- ''.
    fullName <- ''.
| )


"Special types"

"Void is the top of the type lattice"
"Top is the top of the non-void type lattice; it is a subtype only of void,
 and all types other than void are subtypes of top"
"Bottom is the bottom of the type lattice"

"Dynamic can represent any other type, and so is either a subtype or a supertype
 of all types, depending on context"


"Top is treated much like any other named type node, except that it should
 never get any supertypes and closure types are implicitly subtypes of top"
"Top remembers its list of immediate named subtypes"

traits cecil_interp _AddSlotsIfAbsent: ( | topType = () | )
traits topType _Define: ( |
    _ parent* = traits cecil_named_type.

    isTop = true.

    addSupertype: type In: context = (
	cecilErr: 'cannot add a supertype to type "any"' ).

    "optimizations for top of type lattice"
    strictSubtype: t2 HandlingDynamic: handleDynamic = (
	"top is a strict subtype only of void"
	t2 = voidType ifTrue: [ ^ true ].
	t2 = dynamicType ifTrue: [ ^ handleDynamic ].
	false ).
    lub: t2 = (
	"LUB of top and anything is top"
	t2 = voidType ifTrue: [ error: 'cannot take lub of void type' ].
	self ).
    glb: t2 = (
	"GLB of top and anything non-void is the anything"
	t2 = voidType ifTrue: [ ^ self ].
	t2 ).

    conformingObjects: context Do: block = (
	resend.conformingObjects: context Do: block.
	context closures do: block.
    ).

    reset = (
	subtypesDo: [ | :type |
	    type isPredefined ifFalse: [
		type removeFromLattice.
	    ].
	].
    ).
| )

globals cecil_interp _AddSlotsIfAbsent: ( | topType = () | )
topType _Define: cecil_named_type clone _AddSlots: ( |
    _ parent* = traits topType.
| )


"Special stateless one-of-a-kind types"

traits cecil_interp _AddSlotsIfAbsent: ( | special_type = () | )
traits special_type _Define: ( |
    _ parent* = traits cecil_type.

    isPredefined = true.
    isPredefined: flag = ( self ).
| )

globals cecil_interp _AddSlotsIfAbsent: ( | bottomType = () | )
bottomType _Define: ( |
    _ parent* = traits special_type.

    _ thisObjectPrints = true.
    printString = 'no_return'.

    strictSubtype: t2 HandlingDynamic: handleDynamic = (
	"Bottom is a strict subtype of anything but itself"
	t2 != bottomType ).

    lub: t2 = (
	"LUB of bottom and anything is the anything"
	t2 = voidType ifTrue: [ error: 'cannot take lub of void type' ].
	t2).
    glb: t2 = (
	"GLB of bottom and anything is bottom"
	self ).

    conformingObjects: context Do: block = (
	"no objects conform to bottom"
	self ).
| )

globals cecil_interp _AddSlotsIfAbsent: ( | voidType = () | )
voidType _Define: ( |
    _ parent* = traits special_type.

    _ thisObjectPrints = true.
    printString = 'void'.

    strictSubtype: t2 HandlingDynamic: handleDynamic = (
	"voidType not a strict subtype of anything"
	handleDynamic && [t2 = dynamicType] ).

    lub: t2 = ( error: 'cannot take lub of void type' ).
    glb: t2 = (
	"GLB of void and anything is that anything"
	t2 ).

    conformingObjects: context Do: block = (
	error: 'shouldn\'t be iterating over conforming types of void' ).
| )

globals cecil_interp _AddSlotsIfAbsent: ( | dynamicType = () | )
dynamicType _Define: ( |
    _ parent* = traits special_type.

    _ thisObjectPrints = true.
    printString = 'dynamic'.

    strictSubtype: t2 HandlingDynamic: handleDynamic = (
	"dynamic can be a subtype of anything (even bottom?)"
	handleDynamic ).

    lub: t2 = (
	"LUB of dynamic and anything is dynamic"
	t2 = voidType ifTrue: [ error: 'cannot take lub of void type' ].
	self).
    glb: t2 = (
	"GLB of dynamic and anything non-bottom is dynamic"
	t2 = bottomType ifTrue: [ ^ t2 ].
	self ).

    "checking implementations of signatures whose arg type is dynamic is hard;
     skip for now"
    conformingObjects: context Do: block = ( self ).
| )


"Closure type constructor expressions"

"Closures are subtypes of top and supertypes of bottom, plus named types may
 declare themselves to be subtypes of a closure type.  Normal contravariant
 rules provide an implicit subtype relation among closure types, as well."

traits cecil_interp _AddSlotsIfAbsent: ( | cecil_closure_type = () | )
traits cecil_closure_type _Define: ( |
    _ parent* = traits cecil_type.

    printString = ( | str |
	str: '&('.
	args doFirst:    [ | :el | str: str, el printString. ]
             MiddleLast: [ | :el | str: str, ',', el printString. ]
	     IfEmpty:    [ ].
	str: str, '):', result printString.
	str ).

    isClosure = true.

    copy = ( clone args: args copy. ).

    = t2 = (
	t2 isClosure && [(result = t2 result) && [args = t2 args]] ).

    isSubtypeOf: t2 HandlingDynamic: handleDynamic = (
	"check the easy cases first"
	t2 = voidType ifTrue: [ ^ true ].
	t2 isTop ifTrue: [ ^ true ].
	t2 = dynamicType ifTrue: [ ^ handleDynamic ].

	t2 isLUB ifTrue: [
	    "True iff t1 is a subtype of any of the t2 types"
	    ^ t2 types findFirst: [ | :type | isSubtypeOf: type ]
		IfPresent: true IfAbsent: false.
	].

	t2 isClosure && [args size = t2 args size] ifFalse: [ ^ false ].

	"contravariant subtyping rules in force:
	 t1 <= t2 iff t1.result <= t2.result && all t1.arg[i] >= t2.arg[i]"
	(result isSubtypeOf: t2 result HandlingDynamic: handleDynamic)
	    ifFalse: [ ^ false ].
	args with: t2 args Do: [ | :t1arg. :t2arg |
	    (t2arg isSubtypeOf: t1arg HandlingDynamic: handleDynamic)
		ifFalse: [ ^ false ].
	].
	true ).

    "it's easier to write subtype than strictSubtype for closures"
    strictSubtype: t2 HandlingDynamic: handleDynamic = (
	(isSubtypeOf: t2) && [!= t2] ).

    lub: t2 = ( error: 'need to implement' ).
    glb: t2 = ( error: 'need to implement' ).

    conformingObjects: context Do: block = (
	"Iterate over all the closures objects in the world."
	context closures do: [ | :cl |
	    "If the closure's type is a subtype of this type, value: it."
	    (cl type isSubtypeOf: self) ifTrue: [ block value: cl ]
	].
    ).
| )

globals cecil_interp _AddSlotsIfAbsent: ( | cecil_closure_type = () | )
cecil_closure_type _Define: ( |
    _ parent* = traits cecil_closure_type.
    _ thisObjectPrints = true.
    args <- list.
    result.
    object <- cecil_object.
    isPredefined <- false.
| )


"LUB and GLB types"

traits cecil_interp _AddSlotsIfAbsent: ( | cecil_type_expression_node = () | )
traits cecil_type_expression_node _Define: ( |
    _ parent* = traits cecil_type.

    copy = ( resend.copy types: types copy ).

    printString = ( | str |
	str: '('.
	types doFirst: [ | :t | str: str, t printString ]
	   MiddleLast: [ | :t | str: str, separator, t printString ]
	    IfEmpty: [ error: 'shouldn\'t be empty' ].
	str: str, ')'.
	str ).

    hash = ( | h |
	types doFirst: [ | :t | h: t hash ]
	   MiddleLast: [ | :t | h: h && t hash ]
	    IfEmpty: [ error: 'shouldn\'t be empty' ].
	h && separator hash ).
| )

globals cecil_interp _AddSlotsIfAbsent: ( | cecil_type_expression_node = () | )
cecil_type_expression_node _Define: ( |
    _ parent* = traits cecil_type_expression_node.
    types <- set.
    isPredefined <- false.
| )


traits cecil_interp _AddSlotsIfAbsent: ( | cecil_lub_type_node = () | )
traits cecil_lub_type_node _Define: ( |
    _ parent* = cecil_type_expression_node.

    isLUB = true.
    separator = '|'.

    copyWith: t1 And: t2 = ( | t |
	t: copy.
	t types add: t1.
	t lub: t2 ).

    lub: t2 = ( | t |
	t: copy.
	t2 isLUB ifTrue: [
	    t types add: t2 types.
	] False: [
	    t types add: t2.
	].
	t ).

    = type = ( type isLUB && [types = type types] ).
    
    strictSubtype: t2 HandlingDynamic: handleDynamic = (
	t2 = voidType ifTrue: [ ^ true ].
	t2 isTop ifTrue: [ ^ true ].
	t2 = dynamicType ifTrue: [ ^ handleDynamic ].
	"True iff all component types are subtypes of t2"
	types findFirst: [ | :type |
	    (type isSubtypeOf: t2 HandlingDynamic: handleDynamic) not.
	] IfPresent: false IfAbsent: true ).
| )

globals cecil_interp _AddSlotsIfAbsent: ( | cecil_lub_type_node = () | )
cecil_lub_type_node _Define: cecil_type_expression_node clone _AddSlots: ( |
    _ parent* = traits cecil_lub_type_node.
    _ thisObjectPrints = true.
| )


traits cecil_interp _AddSlotsIfAbsent: ( | cecil_glb_type_node = () | )
traits cecil_glb_type_node _Define: ( |
    _ parent* = cecil_type_expression_node.

    isGLB = true.
    separator = '&'.

    copyWith: t1 And: t2 = ( | t |
	t: copy.
	t types add: t1.
	t glb: t2 ).

    glb: t2 = ( | t |
	t2 isLUB ifTrue: [
	    "The following distributive law holds for LUB & GLB types:
	     (t1|t2)&t3 = (t1&t3)|(t2&t3)"
	    "store mixed lubs/glbs in CNF: (a&b)|(c&d)"
	    "This canonical form makes comparing lubs and glbs much easier"
	    ^ t2 glb: self.
	].
	t: copy.
	t2 isGLB ifTrue: [
	    t types add: t2 types.
	] False: [
	    t types add: t2.
	].
	t ).

    = type = ( type isGLB && [types = type types] ).
    
    strictSubtype: t2 HandlingDynamic: handleDynamic = (
	t2 = voidType ifTrue: [ ^ true ].
	t2 isTop ifTrue: [ ^ true ].
	t2 = dynamicType ifTrue: [ ^ handleDynamic ].
	t2 isLUB ifTrue: [
	    "True iff t1 is a subtype of any of the t2 types"
	    ^ t2 types findFirst: [ | :type | isSubtypeOf: type ]
		IfPresent: true IfAbsent: false.
	].
	t2 isGLB ifTrue: [
	    "True iff component types are a subset of component types of t2"
	    ^ t2 types includesAll: types.
	].
	"True iff any component types are subtypes of t2"
	types findFirst: [ | :type |
	    type isSubtypeOf: t2 HandlingDynamic: handleDynamic
	] IfPresent: true IfAbsent: false ).
| )

globals cecil_interp _AddSlotsIfAbsent: ( | cecil_glb_type_node = () | )
cecil_glb_type_node _Define: cecil_type_expression_node clone _AddSlots: ( |
    _ parent* = traits cecil_glb_type_node.
    _ thisObjectPrints = true.
| )
