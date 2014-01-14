"Sun-$Revision: 9.1 $"


traits cecil_interp _AddSlotsIfAbsent: ( | cecil_spec_list = () | )
traits cecil_spec_list _Define: ( |
    parent* = traits list.
    errHandlingParent* = mixins cecil_error_handling.

    printString = ( | str |
	str: '('.
	doFirst: [ | :p |
	    str: str, p printString.
	] MiddleLast: [ | :p |
	    str: str, ',', p printString.
	] IfEmpty: [].
	str, ')' ).

    copy = ( | specs |
	specs: copyRemoveAll.
	do: [ | :spec | specs add: spec copy ].
	specs ).

    createTypeBindings: actuals Into: bindings Using: formalBindings
		IfFail: block = (
	with: actuals Do: [ | :formal. :actual. |
	    formal createTypeBindings: actual Into: bindings
		Using: formalBindings IfFail: [^ block value].
	].
    ).

    appliesTo: actuals Bindings: bindings IfNot: block = (
	with: actuals Do: [ | :formal. :actual. |
	    formal appliesTo: actual Bindings: bindings IfNot: [^ block value].
	].
    ).
| )

globals cecil_interp _AddSlotsIfAbsent: (| cecil_spec_list = () |)
cecil_spec_list _Define: list clone _AddSlots: ( |
    _ parent* = traits cecil_spec_list.
| )


globals cecil_interp _AddSlotsIfAbsent: (| cecil_unspecified = () |)
cecil_unspecified _Define: ( |
    _ parent* = traits oddball.
    _ errHandlingParent* = mixins cecil_error_handling.
    _ thisObjectPrints = true.
    printString = '<unspecified>'.
    isSpecified = false.
| )


"abstract parent of object and type specs"
traits cecil_interp _AddSlotsIfAbsent: ( | cecil_spec = () | )
traits cecil_spec _Define: ( |
    _ parent* = traits clonable.
    _ errHandlingParent* = mixins cecil_error_handling.
    isSpecified = true.
| )


globals cecil_interp _AddSlotsIfAbsent: (| cecil_spec = () |)
cecil_spec _Define: ( |
    _ parent* = traits cecil_spec.
    location <- token_location.
| )


"abstract parent of object specs"
traits cecil_interp _AddSlotsIfAbsent: ( | cecil_object_spec = () | )
traits cecil_object_spec _Define: ( |
    _ parent* = traits cecil_spec.

    compilerPrintString = ( printString ).

    addConstrainedMethodLink: method = (
	object attachMethod: method.
    ).

    type = ( object type ).

    isConstrained = true.
| )

globals cecil_interp _AddSlotsIfAbsent: (| cecil_object_spec = () |)
cecil_object_spec _Define: cecil_spec clone _AddSlots: ( |
    _ parent* = traits cecil_object_spec.
    object <- cecil_object.
| )


"the spec for a reference to a named object
 (argument constraints, parents, etc.)"
traits cecil_interp _AddSlotsIfAbsent: ( | cecil_named_object_spec = () | )
traits cecil_named_object_spec _Define: ( |
    _ parent* = traits cecil_object_spec.

    printString = ( name, params cecilShortPrintString ).
    compilerPrintString = (
	name, (params isEmpty ifTrue: ''
			       False: [ ';', params size printString ]) ).

    createWithName: name = ( copy name: name. ).
    createWithName: name Params: params = ( (copy name: name) params: params. ).

    copy = ( resend.copy params: params copy ).

    "used as part of @: style declarations"
    asTypeSpec = (
	cecil_internal_named_type_spec
	    createWithName: name Params: params copy ).
| )

globals cecil_interp _AddSlotsIfAbsent: (| cecil_named_object_spec = () |)
cecil_named_object_spec _Define: cecil_object_spec clone _AddSlots: ( |
    _ parent* = traits cecil_named_object_spec.
    _ thisObjectPrints = true.
    name <- '<prototype>'.
    params <- cecil_param_list.
| )


"cecil_fixed_spec used for the implicit first arg to a closure eval method"
traits cecil_interp _AddSlotsIfAbsent: ( | cecil_fixed_spec = () | )
traits cecil_fixed_spec _Define: ( |
    _ parent* = traits cecil_named_object_spec.
    printString = ( object cecilShortPrintString ).
    copyName: name Object: obj = ( (copy name: name) object: obj ).
| )

globals cecil_interp _AddSlotsIfAbsent: (| cecil_fixed_spec = () |)
cecil_fixed_spec _Define: cecil_named_object_spec clone _AddSlots: ( |
    _ parent* = traits cecil_fixed_spec.
| )


"the spec for an unconstrained formal"
traits cecil_interp _AddSlotsIfAbsent: ( | cecil_unconstrained_spec = () | )
traits cecil_unconstrained_spec _Define: ( |
    _ parent* = traits cecil_object_spec.
    printString = '{top}'.
    isConstrained = false.
| )

globals cecil_interp _AddSlotsIfAbsent: (| cecil_unconstrained_spec = () |)
cecil_unconstrained_spec _Define: cecil_object_spec clone _AddSlots: ( |
    _ parent* = traits cecil_unconstrained_spec.
    _ thisObjectPrints = true.
| )


"abstract spec for a type"
traits cecil_interp _AddSlotsIfAbsent: ( | cecil_type_spec = () | )
traits cecil_type_spec _Define: ( |
    _ parent* = traits cecil_spec.

    = spec = ( type = spec type ).
    hash = ( type hash ).

    isUndeclared = false.
    isInternalNamed = false.
| )

globals cecil_interp _AddSlotsIfAbsent: (| cecil_type_spec = () |)
cecil_type_spec _Define: cecil_spec clone _AddSlots: ( |
    _ parent* = traits cecil_type_spec.
| )


"the spec for a named type"
traits cecil_interp _AddSlotsIfAbsent: ( | cecil_named_type_spec = () | )
traits cecil_named_type_spec _Define: ( |
    _ parent* = traits cecil_type_spec.

    printString = ( name, params cecilShortPrintString ).

    copy = ( resend.copy params: params copy ).
    createWithName: name = ( copy name: name. ).
    createWithName: name Params: params = ( (copy name: name) params: params. ).

    appliesTo: actual Bindings: bindings FormalBindings: typeBindings
		IfNot: block = (
	error: 'implement this'
    ).
| )

globals cecil_interp _AddSlotsIfAbsent: (| cecil_named_type_spec = () |)
cecil_named_type_spec _Define: cecil_type_spec clone _AddSlots: ( |
    _ parent* = traits cecil_named_type_spec.
    _ thisObjectPrints = true.
    name <- '<prototype>'.
    params <- cecil_param_list.
    type <- cecil_named_type.
| )


"the type half of a @: constraint; allows internal types to be mentioned,
 as well as accessing the private interface of the type"
traits cecil_interp _AddSlotsIfAbsent: ( |
	cecil_internal_named_type_spec = () | )
traits cecil_internal_named_type_spec _Define: ( |
    _ parent* = traits cecil_named_type_spec.
| )

globals cecil_interp _AddSlotsIfAbsent: (|
	cecil_internal_named_type_spec = () |)
cecil_internal_named_type_spec _Define: cecil_named_type_spec clone _AddSlots: ( |
    _ parent* = traits cecil_internal_named_type_spec.

    isInternalNamed = true.
| )


"the type spec for an undeclared variable"
traits cecil_interp _AddSlotsIfAbsent: ( | cecil_undeclared_type_spec = () | )
traits cecil_undeclared_type_spec _Define: ( |
    _ parent* = traits cecil_type_spec.
    printString = '<dynamic>'.
    type = dynamicType.
    isUndeclared = true.

    appliesTo: actual Bindings: bindings FormalBindings: typeBindings
		IfNot: block = (
	"always applies"
	self ).
| )

globals cecil_interp _AddSlotsIfAbsent: (| cecil_undeclared_type_spec = () |)
cecil_undeclared_type_spec _Define: cecil_type_spec clone _AddSlots: ( |
    _ parent* = traits cecil_undeclared_type_spec.
    _ thisObjectPrints = true.
| )


"a specific type, wrapped up as a type spec"
traits cecil_interp _AddSlotsIfAbsent: ( | cecil_fixed_type_spec = () | )
traits cecil_fixed_type_spec _Define: ( |
    _ parent* = traits cecil_type_spec.
    printString = ( type printString ).
    copy: t = ( resend.copy type: t ).

    appliesTo: actual Bindings: bindings FormalBindings: typeBindings
		IfNot: block = (
	error: 'implement this'
    ).
| )

globals cecil_interp _AddSlotsIfAbsent: (| cecil_fixed_type_spec = () |)
cecil_fixed_type_spec _Define: cecil_type_spec clone _AddSlots: ( |
    _ parent* = traits cecil_fixed_type_spec.
    _ thisObjectPrints = true.
    type <- cecil_type.
| )


"a closure type"
traits cecil_interp _AddSlotsIfAbsent: ( | cecil_closure_type_spec = () | )
traits cecil_closure_type_spec _Define: ( |
    _ parent* = traits cecil_type_spec.

    printString = (
	'&', argSpecs printString,
	    (resultTypeSpec isUndeclared
		ifTrue: '' False: [':', resultTypeSpec printString]) ).

    copy = (
	(clone argSpecs: argSpecs copy) resultTypeSpec: resultTypeSpec copy ).

    appliesTo: actual Bindings: bindings FormalBindings: typeBindings
		IfNot: block = (
	error: 'implement this'
    ).
| )

globals cecil_interp _AddSlotsIfAbsent: (| cecil_closure_type_spec = () |)
cecil_closure_type_spec _Define: cecil_type_spec clone _AddSlots: ( |
    _ parent* = traits cecil_closure_type_spec.
    _ thisObjectPrints = true.
    argSpecs <- cecil_spec_list. "A list of type spec's."
    resultTypeSpec <- cecil_undeclared_type_spec.
    type <- nil. "or cecil_closure_type"
| )


"LUB and GLB type specs"
traits cecil_interp _AddSlotsIfAbsent: ( | cecil_type_expr_spec = () | )
traits cecil_type_expr_spec _Define: ( |
    _ parent* = traits cecil_type_spec.
    printString = (
	'(', typeSpec1 printString, separator, typeSpec2 printString, ')' ).
    createFrom: t1 And: t2 = ( (copy typeSpec1: t1) typeSpec2: t2 ).

    appliesTo: actual Bindings: bindings FormalBindings: typeBindings
		IfNot: block = (
	error: 'implement this'
    ).
| )

globals cecil_interp _AddSlotsIfAbsent: (| cecil_type_expr_spec = () |)
cecil_type_expr_spec _Define: cecil_type_spec clone _AddSlots: ( |
    _ parent* = traits cecil_type_expr_spec.
    typeSpec1 <- cecil_type_spec.
    typeSpec2 <- cecil_type_spec.
    type <- nil.
| )


"a LUB type spec"
traits cecil_interp _AddSlotsIfAbsent: ( | cecil_lub_type_spec = () | )
traits cecil_lub_type_spec _Define: ( |
    _ parent* = traits cecil_type_expr_spec.
    separator = '|'.
| )

globals cecil_interp _AddSlotsIfAbsent: (| cecil_lub_type_spec = () |)
cecil_lub_type_spec _Define: cecil_type_expr_spec clone _AddSlots: ( |
    _ parent* = traits cecil_lub_type_spec.
    _ thisObjectPrints = true.
| )


"a GLB type spec"
traits cecil_interp _AddSlotsIfAbsent: ( | cecil_glb_type_spec = () | )
traits cecil_glb_type_spec _Define: ( |
    _ parent* = traits cecil_type_expr_spec.
    separator = '&'.
| )

globals cecil_interp _AddSlotsIfAbsent: (| cecil_glb_type_spec = () |)
cecil_glb_type_spec _Define: cecil_type_expr_spec clone _AddSlots: ( |
    _ parent* = traits cecil_glb_type_spec.
    _ thisObjectPrints = true.
| )


"a binding occurrence of a type variable (e.g., `T)"
traits cecil_interp _AddSlotsIfAbsent: ( | cecil_type_var_spec = () | )
traits cecil_type_var_spec _Define: ( |
    _ parent* = traits cecil_type_spec.
    printString = ( '`', name,
	    (upperBound isSpecified ifFalse: ''
		True: [ ' <= ', upperBound printString ]),
	    (lowerBound isSpecified ifFalse: ''
		True: [ ' >= ', lowerBound printString ]) ).
    copy = ( (clone lowerBound: lowerBound copy) upperBound: upperBound copy ).
    createWithName: n = ( copy name: n ).

    appliesTo: actual Bindings: bindings FormalBindings: formalBindings
		IfNot: block = (
	bindings size < formalBindings size ifTrue: [
	    "this is the first pass through the types"
	    bindings if: type
		IsPresentPut: [ | :t | t lub: actual type ] AndDo: []
		IfAbsentPut: [ actual type ] AndDo: [].
	] False: [
	    error: 'implement this'
	].
    ).
| )

globals cecil_interp _AddSlotsIfAbsent: (| cecil_type_var_spec = () |)
cecil_type_var_spec _Define: cecil_type_spec clone _AddSlots: ( |
    _ parent* = traits cecil_type_var_spec.
    _ thisObjectPrints = true.
    name <- ''.  "type var's name"
    lowerBound <- cecil_unspecified.
    upperBound <- cecil_unspecified.
    type <- nil. "or cecil_type_node"
| )
