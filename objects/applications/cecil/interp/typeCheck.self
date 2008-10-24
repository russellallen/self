"Sun-$Revision: 9.1 $"

"Cecil type checking routines"


"Main Type-Checking Driver Code"

traits cecil_interpreter _AddSlots: ( |
    typeCheck: asts = (
	debugMsg: '*** Type Checking...'.
	asts checkExpressions: staticContext.
	signaturesNeedTypeChecking ifTrue: [
	    debugMsg: '*** Type-check signature implementations...'.
	    staticContext signatures do: [ | :sset |
		sset do: [ | :sig |
		    sig checkImplementations: staticContext.
		].
	    ].
	    signaturesNeedTypeChecking: false.
	].
	debugMsg: '*** Type Checking DONE!'.
    ).
| )

traits cecil_expr_list _AddSlots: ( |
    checkExpressions: context = ( 
	do: [ | :expr | expr checkExpressions: context ].
    ).
| )

traits cecil_decl_block _AddSlots: ( |
    checkExpressions: context = (
	"first define names"
	context = context interp staticContext ifTrue: [
	    debugMsg: '*** Define new names...'.
	].
	do: [ | :decl | decl defineName: context ].

	"then resolve mutually-recursive name references"
	context = context interp staticContext ifTrue: [
	    debugMsg: '*** Resolve names...'.
	].
	do: [ | :decl | decl resolveNames: context ].

	"then extract signatures"
	context = context interp staticContext ifTrue: [
	    debugMsg: '*** Extract signatures...'.
	].
	do: [ | :decl | decl extractSignatures: context ].

	"then finally type-check any expressions in the decls"
	context = context interp staticContext ifTrue: [
	    debugMsg: '*** Type-check expressions...'.
	].
	do: [ | :decl | decl checkExpressions: context ].
    ).
| )


"Declaration Nodes"

traits cecil_decl_node _AddSlots: ( |
    extractSignatures: context = ( binding extractSignatures: context ).
    checkExpressions: context = ( binding checkExpressions: context ).
| )

traits cecil_non_object_binding _AddSlots: ( |
    extractSignatures: context = (
	(context lookup_binding: name) typeSpec extractSignatures: context ).

    checkExpressions: context = ( | rhsType. lhsType. |
	"Type check the initializer"
	rhsType: value checkExpressions: context.
	lhsType: context lookup_object_type: name.
	(rhsType isSubtypeOf: lhsType) ifFalse: [
	    rhsType = voidType ifTrue: [
		typeErr:
		    'expecting a non-void result for initializing expression'.
	    ] False: [
		typeErr:
		    'type mismatch in declaration initializer for ', name,
		    ':\n    ', rhsType printString, ' !<= ',
		    lhsType printString.
	    ].
	].
    ).

    checkReference: varNode In: context = (
	varNode params nonEmpty ifTrue: [
	    typeErr: name, ' needs no parameters'.
	].
	type ).
| )

traits cecil_object_binding _AddSlots: ( |
    extractSignatures: context = ( self ).

    checkExpressions: context = ( | binding |
	binding: context lookup_binding: name.
	value checkFieldInits: binding resolvedContext Of: binding value.
    ).

    checkReference: varNode In: context = (
	"check for illegal accesses to abstract or template objects"
	value kind isConcrete || value kind isUnspecified ifFalse: [
	    typeErr: name, ' is not a concrete object'
		AtLocation: varNode location.
	    ^ dynamicType.
	].
	value params nonEmpty ifTrue: [ | ps |
	    varNode params isEmpty ifTrue: [
		typeErr: name, ' is parameterized'.
		^ dynamicType.
	    ].
	    value params size != varNode params size ifTrue: [
		typeErr: 'wrong number of parameters to ', name.
		^ dynamicType.
	    ].
	    "resolve parameter list"
	    ps: varNode params copy.
	    ps resolveNames: context.
	    type copyInstantiatingWith: ps In: context
		AtLocation: varNode location
	] False: [
	    varNode params nonEmpty ifTrue: [
		typeErr: name, ' is not parameterized'.
		^ dynamicType.
	    ].
	    type
	] ).
| )

traits cecil_extension_decl_node _AddSlots: ( |
    "all the work for this node is done at resolve-time"
    extractSignatures: context = ( self ).
    checkExpressions: context = ( self ).
| )

traits cecil_field_info_node _AddSlots: ( |
    extractSignatures: context = ( self ).
    checkExpressions: context = ( self ).
| )

traits cecil_anon_obj_info_node _AddSlots: ( |
    extractSignatures: context = ( self ).
    checkExpressions: context = ( self ).
| )

traits cecil_include_node _AddSlots: ( |
    extractSignatures: context = ( self ).
    checkExpressions: context = ( self ).
| )

traits cecil_end_include_node _AddSlots: ( |
    extractSignatures: context = ( self ).
    checkExpressions: context = ( self ).
| )

traits cecil_prim_include_node _AddSlots: ( |
    extractSignatures: context = ( self ).
    checkExpressions: context = ( self ).
| )

traits cecil_method_node _AddSlots: ( |
    extractSignatures: context = (
	resolvedMethod extractSignatures: context.
    ).
    checkExpressions: context = (
	debugMsg: 'checking ', resolvedMethod printString.
	resolvedMethod checkExpressions: context.
    ).
| )


"Methods"

traits cecil_method _AddSlots: ( |
    extractSignatures: context = (
	resolvedContext enclosingContext != context ifTrue: [
	    error: 'broken context relationships'.
	].

	"extract sigs from any closure type specs"
	formals extractSignatures: resolvedContext.
	resultTypeSpec extractSignatures: resolvedContext.

	isInitSetAccessor ifTrue: [
	    "don't create a signature for the internal init set accessor"
	] False: [
	    "create sig for this method"
	    context addSignature:
		cecil_signature createFromMethod: self In: context.
	].
    ).

    checkExpressions: context = ( | lhsType. rhsType. |
	resolvedContext enclosingContext != context ifTrue: [
	    error: 'broken context relationships'.
	].

	resolvedContext interp signaturesNeedTypeChecking: true.

	isPrimitive ifTrue: [ 
	    "don't type-check the body of a primitive method"
	    ^ self.
	].

	"Add declared types of formals"
	formals do: [ | :f |
	    resolvedContext addBinding: 
		(cecil_constant_binding copyName: f name)
		typeSpec: f typeSpec copy.
	].
	
	"Check method body, gathering result type"
	rhsType: body checkExpressions: resolvedContext.

	"Lookup declared return type"
	lhsType: resultType.

	"type correct if rhs a subtype of lhs"
	(rhsType isSubtypeOf: lhsType) ifFalse: [
	    rhsType = voidType ifTrue: [
		typeErr: 'expecting a non-void result from method ', name.
	    ] False: [
		typeErr:
		    'type mismatch in return from method ', name,
		    ':\n    ', rhsType printString, ' !<= ',
		    lhsType printString.
	    ].
	].
	"check for non-void result for method declared to return void"
	(lhsType = voidType) &&
	    [(rhsType != voidType) && [(rhsType != dynamicType) &&
		    [rhsType != bottomType]]] ifTrue: [
	    typeErr:
		'returning a result from body of method ', name,
		' where none is expected'.
	].

	"return type of body, in case we're checking a block eval method
	 and want to infer its result type"
	rhsType ).
| )

traits cecil_optimized_eval_method _AddSlots: ( |
    extractSignatures: context = (
	error: 'shouldn\'t be type-checking an optimized eval method'.
    ).
    checkExpressions: context = ( 
	error: 'shouldn\'t be type-checking an optimized eval method'.
    ).
| )

traits cecil_formal_list _AddSlots: ( |
    extractSignatures: context = (
	do: [ | :f | f extractSignatures: context ].
    ).
| )

traits cecil_formal _AddSlots: ( |
    extractSignatures: context = (
	typeSpec extractSignatures: context.
    ).
| )

traits cecil_type_spec _AddSlots: ( |
    extractSignatures: context = ( self ).
| )

traits cecil_closure_type_spec _AddSlots: ( |
    extractSignatures: context = (
	argSpecs do: [ | :argSpec | argSpec extractSignatures: context ].
	resultTypeSpec extractSignatures: context.
	context top_context addSignature:
	    cecil_signature createFromClosureType: type In: context.
    ).
| )

traits cecil_type_expr_spec _AddSlots: ( |
    extractSignatures: context = (
	typeSpec1 extractSignatures: context.
	typeSpec2 extractSignatures: context.
    ).
| )


"Method Bodies"

traits cecil_code_body _AddSlots: ( |
    checkExpressions: context = (
	stmts do: [ | :stmt | stmt checkExpressions: context ].
	resultExpr checkExpressions: context ).
| )

traits cecil_abstract_body _AddSlots: ( |
    checkExpressions: context = (
	context interp explicitVoid ifTrue: [
	    "allow abstract method to return void or non-void"
	    dynamicType
	] False: [
	    "return result type based on whether ';' was used in definition"
	    returnsVoid ifTrue: voidType False: bottomType
	] ).
| )

traits cecil_get_accessor_body _AddSlots: ( |
    checkExpressions: context = (
	contents value == cecil_uninitialized_field_contents ifTrue: [
	    typeErr: 'field ', fieldName, ' must be initialized'
		AtLocation: token_location.
	].
	contents value checkExpressions: context ).
| )

traits cecil_local_get_accessor_body _AddSlots: ( |
    checkExpressions: context = (
	contents value checkExpressions: context ).
| )

traits cecil_set_accessor_body _AddSlots: ( |
    checkExpressions: context = ( voidType ).
| )

cecil_uninitialized_field_contents _AddSlots: ( |
    checkExpressions: context = (
	"return bottom so an uninitialized field will always type-check"
	bottomType ).
| )


"Expressions and Statements"

traits cecil_var_node _AddSlots: ( |
    checkExpressions: context = ( | binding |
	binding: context lookup_binding: name IfAbsent: [
	    typeErr: 'variable ', name, ' not defined'.
	    ^ dynamicType.
	].
	binding checkReference: self In: context ).
| )


traits cecil_literal_node _AddSlots: ( |
    checkExpressions: context = (
	"use the type of the single parent as the type of the literal"
	(context lookup_top_context_object: value parentName) type ).
| )


traits cecil_assign_node _AddSlots: ( |
    checkExpressions: context = ( | binding. lhsType. rhsType. |
	"Get (and check along the way) type of rhs"
	rhsType: expr checkExpressions: context.

	binding: context lookup_binding: name IfAbsent: [
	    typeErr: 'variable ', name, ' not defined'.
	    ^ self.
	].
	binding isVariableBinding ifFalse: [
	    typeErr: name, ' cannot be assigned'.
	    ^ self.
	].
	lhsType: binding type.
	
	"type correct if rhs a subtype of lhs"
	(rhsType isSubtypeOf: lhsType) ifFalse: [
	    rhsType = voidType ifTrue: [
		typeErr:
		    'expecting a non-void expression on r.h.s. of assignment'.
	    ] False: [
		typeErr:
		    'type mismatch in assignment of ', name,
		    ':\n    ', rhsType printString, ' !<= ',
		    lhsType printString.
	    ].
	    rhsType: dynamicType.
	].

	"in case assignments can be expressions"
	rhsType ).
| )


traits cecil_closure_node _AddSlots: ( |
    checkExpressions: context = ( | m. resultType. extractedType. |
	resolvedClosure: 
	    cecil_closure_object createWithMethod: method InContext: context.
	m: resolvedClosure resolvedMethod.

	"type-check the closure eval method"
	resultType: m checkExpressions: context.

	"return the closure type as the result of the
	 closure constructor expression"
	extractedType: cecil_closure_type copy.
	m formals do: [ | :f |
	    extractedType args addLast: f type.
	].
	extractedType args removeFirst.	"toss the implicit closure argument"
	m resultTypeSpec isUndeclared ifTrue: [
	    "infer result type of closure"
	    extractedType result: resultType.
	] False: [
	    "use declared result type"
	    extractedType result: m resultType.
	].

	context top_context addSignature:
	    cecil_signature createFromClosureType: extractedType In: context.

	"Add closure to global list"
	extractedType object: resolvedClosure.
	resolvedClosure type: extractedType.

	context top_context addClosure: resolvedClosure.

	extractedType ).
| )


traits cecil_array_object_expr_node _AddSlots: ( |
    checkExpressions: context = ( | types. lub. params. |
	"Type check array elements expressions"
	types: list copyRemoveAll.
	elems do: [ | :elem. elemtype. |
	    elemtype: elem checkExpressions: context.
	    elemtype = voidType ifTrue: [
		typeErr:
		    'expecting a non-void value for element of ',
		    'array constructor'.
		elemtype: dynamicType.	"to avoid cascading errors"
	    ].
	    types addLast: elemtype.
	].
	
	lub: types reduceWith: [|:t1.:t2| t1 lub: t2]
	    IfSingleton: [|:t|t] IfEmpty: [bottomType].
	params: cecil_param_list copyRemoveAll addLast:
	    cecil_fixed_type_spec copy: lub.
	(context lookup_top_context_type: 'array')
	    copyInstantiatingWith: params In: context AtLocation: location ).
| )


traits cecil_object_expr_node _AddSlots: ( |
    checkExpressions: context = ( | newObj |
	newObj: createObject: context.
	newObj resolveNames: context.
	checkFieldInits: context Of: newObj.
	newObj type ).

    checkFieldInits: context Of: newObj = ( | inits |
	inits: set copyRemoveAll.
	fieldInitDecls checkExpressions: context Of: newObj Initialized: inits.
	checkUninitializedFields: context Of: newObj Initialized: inits.
    ).

    checkUninitializedFields: context Of: object Initialized: inits = (
	"Only check this for concrete run-time objects."
	object kind isConcrete || object kind isUnspecified ifFalse: [ ^ self ].

	"Search for all inherited fields"
	object ancestorsDo: [ | :ancestor |
	    ancestor attachedMethodsDo: [ | :m |
		m isInitSetAccessor && [m formals first constraint = ancestor]
		    ifTrue: [
		    "found a field"
		    m body contents value isUninitialized &&
			[(inits includes: m) not] ifTrue: [
			typeErr:
			    'field ', m body fieldName, ' in ',
			    ancestor cecilShortPrintString, ' not initialized'.
		    ].
		].
	    ].
	] WithTopObj: context top_object.
    ).
| )

traits cecil_field_init_list _AddSlots: ( |
    checkExpressions: context Of: object Initialized: inits = (
	do: [ | :fieldInitNode |
	    fieldInitNode checkExpressions: context Of: object
		Initialized: inits.
	].
    ).
| )

traits cecil_field_init_node _AddSlots: ( |
    checkExpressions: context Of: object Initialized: inits = (
	| args. methodSet. method. rhsType. lhsType. |

	rhsType: expr checkExpressions: context.

	args: cecil_obj_list copyRemoveAll.
	"compute starting point for search"
	constraintSpec isSpecified ifTrue: [
	    constraintSpec resolveNames: context.
	    (object inheritsFrom: constraint) ifFalse: [
		typeErr:
		    'cannot direct field initialization through ',
		    constraint cecilPrintString.
		^ dynamicType.
	    ].
	    "use specified ancestor as starting point for search"
	    args addLast: constraint.
	] False: [
	    "use newly created object as starting point for search"
	    args addLast: object.
	].
	args addLast: context top_object.	"second arg not constrained"

	"Simulate method lookup to find the right method"
	methodSet: context
	    method_lookup: '{init_set_', fieldName, '}'
	    Args: args
	    Params: cecil_param_list copyRemoveAll
	    EvaluatingPredicates: false
	    CheckUnique: false.

	methodSet isEmpty ifTrue: [
	    typeErr:
		'field ', fieldName, ' not defined or is shared or read-only'.
	    ^ self.
	].

	methodSet notUnique ifTrue: [ | str |
	    str: 'field ', fieldName, ' ambiguously defined:'.
	    methodSet do: [ | :el | str: str, '\n    ', el printString ].
	    typeErr: str.
	    inits addAll: methodSet.
	    ^ self.
	].

	method: methodSet first.

	(inits includes: method) ifTrue: [
	    typeErr: 'field ', fieldName, ' initialized more than once'.
	] False: [
	    inits add: method.
	].

	"check type of field against initial value"
	lhsType: method formals last type.
	(rhsType isSubtypeOf: lhsType) ifFalse: [
	    rhsType = voidType ifTrue: [
		typeErr: 'expecting a non-void result for field initializer'.
	    ] False: [
		typeErr:
		    'type mismatch in field initialization for ', fieldName,
		    ':\n    ', rhsType printString, ' !<= ',
		    lhsType printString.
	    ].
	].
    ).
| )


traits cecil_msg_node _AddSlots: ( |
    checkExpressions: context = (
	| argTypes. paramTypes. resultTypes. sset. matchSet. tossSet.
	resultType. |
	"Type check a message send, return its type"
	
	"Type check explicit parameters"
	paramTypes: params copy.
	paramTypes resolveNames: context.

	"Type check argument expressions"
	argTypes: list copyRemoveAll.
	exprs do: [ | :arg. argtype. |
	    argtype: arg checkExpressions: context.
	    argtype = voidType ifTrue: [
		typeErr:
		    'expecting a non-void value for argument to message ',
		    msgName.
		argtype: dynamicType.	"to avoid cascading errors"
	    ].
	    argTypes addLast: argtype.
	].

	"Find set of possible signatures"
	sset: context lookup_sig: msgName
	    NumArgs: exprs size NumParams: params size.
	
	"Trim this set: toss out any signature whose arguments
         are not supertypes of the arguments to the message send"
	matchSet: set copyRemoveAll. "signatures that match"
	tossSet:  set copyRemoveAll. "signatures that don't match"
	resultTypes: set copyRemoveAll. "instantiated result types of
	 				 matching sigs"
	sset do: [ | :sig |
	    sig appliesTo: argTypes Params: paramTypes IfSo: [ | :resultType |
		matchSet add: sig.
		resultTypes add: resultType.
	    ] IfNot: [
		tossSet add: sig.
	    ].
	].

	"Check for message not understood"
	matchSet isEmpty ifTrue: [ | str |
	    str: 'Message ', msgName, paramTypes printString, '('.
	    argTypes doFirst: [| :arg | str: str, arg printString ]
		MiddleLast: [| :arg | str: str, ',', arg printString ]
		IfEmpty:    [ ].
	    str: str, ') not understood'.
	    ('set_' isPrefixOf: msgName) ifTrue: [
		str: str, '\n    or field ', (msgName copyFrom: 4),
		    ' is read_only or init_only'
	    ].
	    tossSet nonEmpty ifTrue: [
		str: str, ';\n  signatures that did not match include:'.
		tossSet do: [ | :s | str: str, '\n    ', s printString ].
	    ].
	    typeErr: str.
	    ^ dynamicType.
	].

	"Check for encapsulation violations"
	"If any signature is accessible, allow the send"
	"Mixed accessible and inaccessible signatures will be caught when
	 checking signatures"
	[ | :exit. str. |
	    matchSet do: [ | :match |
		match isPrivate ifFalse: exit.
		context hasHomeContext ifTrue: [ | sender. actualConstraints. |
		    sender: context homeMethod.
		    actualConstraints:
			exprs correspondingConstraintsInMethod: sender
			    InContext: context.
		    [ | :continue |
			match constraints
			    typeCheckEncapsulation: actualConstraints
			    InContext: context IfError: continue.
			exit value.
		    ] exit.
		].
	    ].
	    "if we get here, then no signature is accessible"
	    str: 'Message ', msgName, paramTypes printString, '('.
	    argTypes doFirst: [|:arg| str: str, arg printString ]
		MiddleLast: [|:arg| str: str, ',', arg printString ]
		IfEmpty:    [ ].
	    str: str, ')\n    invoking inaccessible private method\n    '.
	    context hasHomeContext ifTrue: [
		str: str, 'from within ', context homeMethod printString.
	    ] False: [
		str: str, 'outside any method'.
	    ].
	    typeErr: str.
	] exit.

	"Return intersection (GLB) of result types of signatures"
	resultType: voidType.
	resultTypes do: [|:type| resultType: resultType glb: type ].

	resultType ).
| )


traits cecil_constraint_list _AddSlots: ( |
    typeCheckEncapsulation: actualConstraints InContext: context
	    IfError: errorBlock = (
	with: actualConstraints Do: [ | :formalConstraint. :actualConstraint. |
	    (formalConstraint != context top_object) && [
		(actualConstraint = context top_object) || [
		    (formalConstraint != actualConstraint) && [
			((actualConstraint inheritsFrom: formalConstraint) ||
			    [formalConstraint inheritsFrom: actualConstraint])
			    not ]]] ifTrue: errorBlock.
	].
    ).
| )


traits cecil_resend_node _AddSlots: ( |
    checkExpressions: context = (
	| argTypes. msgName. searchList. directedResend. methodSet. method. |

	"Type check argument expressions"
	argTypes: list copyRemoveAll.
	qualifiedExprs do: [ | :arg. argtype. |
	    argtype: arg expr checkExpressions: context.
	    argtype = voidType ifTrue: [
		typeErr: 'expecting a non-void value for argument to resend'.
		argtype: dynamicType.	"to avoid cascading errors"
	    ].
	    argTypes addLast: argtype.
	].

	context hasHomeContext ifFalse: [
	    typeErr: 'cannot do a resend when not in a method'.
	    ^ dynamicType.
	].

	msgName: context homeMethod name.

	searchList: cecil_obj_list copyRemoveAll.
	directedResend: false.
	hasArguments ifTrue: [
	    "Check for the same number of args"
	    context homeMethod formals size != qualifiedExprs size ifTrue: [
		typeErr: 'incorrect number of arguments to resend of ', msgName.
		^ dynamicType.
	    ].
	    
	    "Check form of arguments and compute search list"
	    context homeMethod formals with: qualifiedExprs Do: [
		| :formal. :resendArg. |
		formal isConstrained ifTrue: [
		    "constrained formal;
		     actual argument must be simple variable name, perhaps directed"
		    resendArg isVarNode not ||
		    [resendArg expr name != formal name] ifTrue: [
			typeErr:
			    'argument to resend must be same as ',
			    'constrained formal ', formal name.
			^ dynamicType.
		    ].
		    resendArg isDirected ifTrue: [
			resendArg constraintSpec resolveNames: context.
			(formal constraint inheritsFrom: resendArg constraint)
			    ifFalse: [
			    typeErr:
				'cannot direct resend through ',
				resendArg constraint cecilPrintString,
				'\n    which is not an ancestor of ',
				formal constraint cecilPrintString.
			    ^ dynamicType.
			].
			searchList addLast: resendArg constraint.
			directedResend: true.
		    ] False: [
			"use formal's constraint in search list"
			searchList addLast: formal constraint.
		    ].
		] False: [
		    "unconstrained formal;
		     actual can be anything, except directed"
		    resendArg isDirected ifTrue: [
			typeErr:
			    'cannot direct resend through unconstrained formal ',
			    formal name.
			^ dynamicType.
		    ].
		    searchList addLast: context top_object.
		].
	    ].

	] False: [
	    "default all the formal arguments"
	    context homeMethod formals do: [ |:formal|
		searchList addLast: formal constraint.
		argTypes addLast:
		    context homeContext lookup_object_type: formal name.
	    ].
	].

	"simulate method lookup"
	directedResend ifTrue: [
	    "simulate directed resend"
	    methodSet: context method_lookup: msgName
		Args: searchList Params: context homeMethod params
		EvaluatingPredicates: false
		CheckUnique: false.
	] False: [
	    "simulate undirected resend"
	    methodSet: context resend_method_lookup: msgName 
		Args: searchList Params: context homeMethod params
		EvaluatingPredicates: false 
		CheckUnique: false.
	].

	"check for method lookup errors"
	methodSet isEmpty ifTrue: [
	    typeErr: 'resend of ', msgName, ' not understood'.
	    ^ dynamicType.
	].
	methodSet notUnique ifTrue: [ | str |
	    str: 'resend of ', msgName, ' is ambiguous:'.
	    methodSet do: [ | :el | str: str, '\n    ', el printString ].
	    typeErr: str.
	    ^ dynamicType.
	].

	"resend successful"
	method: methodSet first.

	"Check actual types of args against args of signature of method found"
	method formals with: argTypes Do: [ | :formal. :argtype. |
	    (argtype isSubtypeOf: formal type) ifFalse: [
		typeErr:
		    'Resend argument type mismatch:\n    ',
		    argtype printString, ' !<= ', formal type printString.
	    ].
	].
	
	method resultType ).
| )


traits cecil_nested_scope_node _AddSlots: ( |
    checkExpressions: context = ( | mContext |
	"create a new context for the nested scope"
	mContext: cecil_nested_context createInContext: context.
	body checkExpressions: mContext ).
| )


traits cecil_return_node _AddSlots: ( |
    checkExpressions: context = ( expr checkExpressions: context ).
| )

traits cecil_nonlocal_return_node _AddSlots: ( |
    checkExpressions: context = ( | lhsType. rhsType. |
	rhsType: expr checkExpressions: context.

	context hasHomeContext ifFalse: [
	    typeErr: 'cannot do a non-local return when not in a method'.
	    ^ dynamicType.
	].

	"Look up result type in lexically-enclosing method's context"
	lhsType: context homeMethod resultType.

	"type correct if rhs a subtype of lhs"
	(rhsType isSubtypeOf: lhsType) ifFalse: [
	    rhsType = voidType ifTrue: [
		typeErr:
		    'expecting non-void result of non-local return ',
		    'from method ', context homeMethod name.
	    ] False: [
		typeErr:
		    'type mismatch in non-local return from method ',
		    context homeMethod name,
		    ':\n    ', rhsType printString, ' !<= ',
		    lhsType printString.
	    ].
	].
	"also wrong if returning a value where none is expected"
	(lhsType = voidType) &&
	    [(rhsType != voidType) && [(rhsType != dynamicType) &&
		    [rhsType != bottomType]]] ifTrue: [
	    typeErr:
		'non-local returning a result from body of method ',
		context homeMethod name, ' where none is expected'.
	].

	"never returns normally, so return bottom type"
	bottomType ).
| )

cecil_no_result_node _AddSlots: ( |
    checkExpressions: context = ( voidType ).
| )


"Instantiating parameters"

traits cecil_formal_param_list _AddSlots: ( |
    checkInstantiationOf: type With: actuals AtLocation: location = (
	with: actuals Do: [ | :formal. :actual |
	    formal checkInstantiationOf: type With: actual type
		AtLocation: location.
	].
    ).
| )

traits cecil_type_var_spec _AddSlots: ( |
    checkInstantiationOf: type With: actual AtLocation: location = (
	upperBound isSpecified ifTrue: [
	    "check that actual parameter is a subtype of the upperBound"
	    (actual isSubtypeOf: upperBound type) ifFalse: [
		typeErr:
		    'instantiating parameter ', name, ' of ',
		    type printString, ' with type ', actual printString,
		    ', which is not a subtype of ', upperBound type printString
		  AtLocation: location.
	    ].
	].
	lowerBound isSpecified ifTrue: [
	    "check that actual parameter is a supertype of the lowerBound"
	    (lowerBound type isSubtypeOf: actual) ifFalse: [
		typeErr:
		    'instantiating parameter ', name, ' of ',
		    type printString, ' with type ', actual printString,
		    ', which is not a supertype of ',
		    lowerBound type printString
		  AtLocation: location.
	    ].
	].
    ).
| )


"Signatures"

traits cecil_signature _AddSlots: ( |
    checkImplementations: context = ( | argObjects. argPosition. |
	debugMsg: 'Check implementations for ', printString.

	argObjects: sequence copyRemoveAll.	" a sequence of sets "
	
	"For each signature arg, collect conforming objects"
	"#What to do with dynamic?"
	argPosition: 0.
	args do: [ | :argtype. objs. |
	    objs: set copyRemoveAll.

	    "enumerate all objects that conform to the signature's arg type"
	    argtype conformingObjects: context Do: [ | :obj |
		"Add to the list if it's not abstract"
		obj kind isAbstract ifFalse: [ objs add: obj ].
	    ].

	    "now filter these objects to those that actually influence method
	     lookup, either by having an attached method of the right name
	     or by having multiple inheritance (and this last case could be
	     improved further, since not all MI can affect method lookup for
	     a particular object/sig combination)"
	    objs:
		filterObjs: objs At: argPosition In: context Subtyping: argtype.

	    "record the set of objects worth checking"
	    argObjects addLast: objs.
	    argPosition: argPosition successor.
	].

	"For all combinations of these concrete objects,
	 simulate method lookup"
	allCombinationsOf: argObjects Do: [ | :objs. call. |
	    "compute message template string, for error messages"
	    call: name, '('.
	    objs doFirst: [|:obj| call: call, obj cecilPrintString ]
		MiddleLast: [|:obj| call: call, ',', obj cecilPrintString ]
		IfEmpty: [].
	    call: call, ')'.
	    
	    [ | :exit. method. methodSet. |
		"do method lookup"
		methodSet: context
		    method_lookup: name
		    Args: objs Params: params
		    EvaluatingPredicates: false
		    CheckUnique: false.
		
		"check for signature not implemented"
		methodSet isEmpty ifTrue: [ | str |
		    typeErrNoLocation:
			printString, ' not implemented for ', call.
		    exit value.
		].
		
		"check for signature ambiguously implemented"
		methodSet notUnique ifTrue: [ | str |
		    str: printString, ' implemented ambiguously for ', 
			call, ':'.
		    methodSet do: [ | :meth |
			str: str, '\n    ', meth printString.
		    ].
		    typeErrNoLocation: str.
		    exit value.
		].
		
		"found a single method"
		method: methodSet first.
		
		"check for signature not implemented concretely"
		method isAbstract ifTrue: [
		    typeErr:
			call, ' would invoke abstract method\n    ',
			method printString
		      AtLocation: method location.
		    exit value.
		].

		"check declared arg and result types"
		method formals with: objs Do: [ | :formal. :arg. |
		    (arg type isSubtypeOf: formal type) ifFalse: [
			typeErr:
			    call, ' would invoke ',
			    method printString, ' with mismatched ',
			    formal name, ' argument:\n    ',
			    arg type printString, ' !<= ',
			    formal type printString
			  AtLocation: method location.
		    ].
		].
		(method resultType isSubtypeOf: result) ifFalse: [
		    typeErr:
			call, ' would invoke ',
			method printString,
			' with mismatched result type:\n    ',
			method resultType printString, ' !<= ',
			result printString
		      AtLocation: method location.
		].

		"check encapsulation"
		method isPrivate ifTrue: [
		    method formals constraints
			typeCheckEncapsulation: constraints
			InContext: context IfError: [
			typeErr:
			    call, ' would invoke inaccessible private method ',
			    method printString
			  AtLocation: method location.
		    ].
		].
	    ] exit.
	].
    ).


    _ filterObjs: objs At: position In: context Subtyping: type = (
	| filteredObjs |
	filteredObjs: objs copyRemoveAll.
	objs do: [ | :obj |
	    filteredObjs add:
		filterObj: obj At: position In: context Subtyping: type.
	].
	filteredObjs ).

    _ filterObj: obj At: position In: context Subtyping: type = (
	| parents. parent. |

	parents: obj parents.

	"first, check for MI"
	parents size > 1 ifTrue: [
	    "multiple inheritance; consider this object explicitly"
	    ^ obj
	].

	"then, check for defining a plausible implementation of the signature"
	obj attachedMethodsDo: [ | :method |
	    (name = method name) &&
		[(args size = method formals size) &&
		    [(method formals at: position) constraint = obj]]
		ifTrue: [
		"found a method with the right name & number of args
		 that's constrained to the object at the right position;
		 consider this object explicitly"
		^ obj
	    ].
	].

	"this object won't have a different simulated lookup result than its
	 parent, so don't enumerate it"

	parents isEmpty ifTrue: [
	    "use top as single parent"
	    parent: context top_object.
	] False: [
	    "grab its single parent"
	    parent: parents first.
	].

	(parent type isSubtypeOf: type) ifFalse: [
	    "don't filter past the declared arg type of the signature"
	    ^ obj
	].

	parent = context top_object ifTrue: parent False: [
	    "recursively filter the object's parent"
	    filterObj: parent At: position In: context Subtyping: type ] ).


    _ allCombinationsOf: argObjects Do: block = (
	allCombinationsOf: argObjects Partial: sequence copyRemoveAll Do: block
    ).

    _ allCombinationsOf: argObjects Partial: args Do: block = (
	args size = argObjects size ifTrue: [
	    block value: args.
	] False: [
	    "add another argument to the ever-growing list of args"
	    (argObjects at: args size) do: [ | :arg |
		allCombinationsOf: argObjects Partial: (args copy addLast: arg)
		    Do: block.
	    ].
	].
    ).
| )
