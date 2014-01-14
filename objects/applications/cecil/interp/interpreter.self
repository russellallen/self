"Sun-$Revision: 9.1 $"

"evaluate Cecil AST, in context"


"*************************
 *                       *
 *      Declarations     *
 *                       *
 *************************"

traits cecil_decl_block _AddSlots: ( |
    eval: context = ( | decls. result. |
	"first define names"
	do: [ | :decl | decl defineName: context ].

	"then resolve mutually-recursive name references"
	do: [ | :decl | decl resolveNames: context ].

	"then finally evaluate any expressions in the decls, in order"
	do: [ | :decl | decl eval: context ].

	cecil_void ).
| )

traits cecil_decl_node _AddSlots: ( |
    eval: context = ( binding eval: context ).
| )

traits cecil_non_object_binding _AddSlots: ( |
    eval: context = ( | obj |
	"evaluate the initializer and create the binding"
	obj: value eval: context.
	(context lookup_binding: name) setValue: obj.
    ).
| )

cecil_uninitialized_variable _AddSlots: ( |
    eval: context = (
	cecilErr: 'accessing variable before it\'s been initialized' ).
| )

traits cecil_object_binding _AddSlots: ( |
    eval: context = ( | binding |
	"finish evaluation of created object, in local context created earlier"
	binding: context lookup_binding: name. 
	(binding resolvedContext == nil) ||
	[binding resolvedContext creationTime != 'dynamic'] ifTrue: [
	    error: 'resolvedContext not right' ].
	value evalFieldInitsFor: binding value In: binding resolvedContext.
    ).
| )


traits cecil_extension_decl_node _AddSlots: ( |
    "all the work is done in resolveNames:"
    eval: context = ( self ).
| )


traits cecil_field_info_node _AddSlots: ( |
    "all the work is done in resolveNames:"
    eval: context = ( self ).
| )

traits cecil_anon_obj_info_node _AddSlots: ( |
    "shouldn't see these in the interpreter, but just in case, do nothing "
    eval: context = ( self ).
| )

traits cecil_include_node _AddSlots: ( |
    eval: context = ( self ).
| )

traits cecil_end_include_node _AddSlots: ( |
    eval: context = ( self ).
| )

traits cecil_prim_include_node _AddSlots: ( |
    eval: context = ( self ).
| )

traits cecil_method_node _AddSlots: ( |
    eval: context = (
	method isPrimitive ifTrue: [ | slotList. codePrefix. fullCode. |
	    "construct Self code for body of eval:WithArgs: method
	     for this primitive"
	    slotList: '| :context. :args. '.
	    codePrefix: 'context shareEnclosingMethodCache.\n'.
	    method formals size do: [ | :i. f. |
		f: method formals at: i.
		slotList: slotList, f name, '. '.
		codePrefix: codePrefix,
		    f name, ': args at: ', i printString, '.\n'.
	    ].
	    fullCode: slotList, ' |\n', codePrefix, method body str.
	    "create and install new Self eval:WithArgs: method"
	    (reflect: method body) at: 'eval:WithArgs:' Put: fullCode asObject.
	].
    ).
| )


"**********************
 *                    *
 *       Objects      *
 *                    *
 **********************"

traits cecil_object _AddSlots: ( |
    eval: context = ( "already evaluated" self ).
| )

cecil_void _AddSlots: ( |
    eval: context = ( 
	error: 'not expecting to evaluate cecil_void'.
    ).
| )

traits cecil_object_expr_node _AddSlots: ( |
    createObject: context = ( | newObj |
	newObj: evalIntoObject: context.

	newObj kind: kind.
	newObj isType: isType.
	newObj parentSpecs: parentSpecs copy.
	newObj isaSpecs: isaSpecs copy.
	newObj supertypeSpecs: supertypeSpecs copy.
	newObj location: location.

	newObj ).

    evalFieldInitsFor: obj In: context = (
	fieldInitDecls eval: context For: obj.
    ).

    eval: context = ( | newObj |
	newObj: createObject: context.
	newObj resolveNames: context.
	evalFieldInitsFor: newObj In: context.
	newObj ).

    evalIntoObject: context = ( cecil_object copy ).
| )

traits cecil_object_decl_node _AddSlots: ( |
    evalIntoObject: context = (
	cecil_named_object copyName: name Params: params In: context ).
| )

traits cecil_predicate_decl_node _AddSlots: ( |
    evalIntoObject: context = (
	cecil_predicate_object
	    copyName: name Params: params In: context When: when ).
| )

traits cecil_extension_decl_node _AddSlots: ( |
    evalIntoObject: context = (
	cecil_extension_object copyName: name Params: params In: context ).
| )

traits cecil_field_init_list _AddSlots: ( |
    eval: context For: newObject = (
	do: [ | :fieldInitNode |
	    fieldInitNode eval: context For: newObject.
	].
    ).
| )

traits cecil_field_init_node _AddSlots: ( |
    eval: context For: newObject = (
	| args. lookupArgs. msgName. value. method. |

	msgName: '{init_set_', fieldName, '}'.

	args: cecil_obj_list copyRemoveAll.
	lookupArgs: cecil_obj_list copyRemoveAll.

	args add: newObject.
	constraintSpec isSpecified ifTrue: [
	    "initializing a field at a particular location in the hierarchy"
	    newObject calculatePredicateParents.
	    constraintSpec resolveNames: context.
	    (newObject inheritsFrom: constraint) ifFalse: [
		cecilErr:
		    'directing through an object ',
		    'that is not an ancestor of the newly created object'.
	    ].
	    newObject clearPredicateParents.
	    lookupArgs add: constraint.
	] False: [
	    "undirected field initializer"
	    lookupArgs add: newObject.
	].

	value: expr eval: context.
	args add: value.
	lookupArgs add: value.

	" lookup the corresponding method in the newObject 
          the fields to be initialized will become set_fieldName to denote a 
          modifiable field name "
	method: context method_lookup: msgName Args: lookupArgs
	    Params: cecil_param_list copyRemoveAll
	    EvaluatingPredicates: false.

	method eval: context WithArgs: args ).
| )


"*************************
 *                       *
 *     Cecil Methods     *
 *                       *
 *************************"

traits cecil_method _AddSlots: ( |
    eval: context WithArgs: args = ( | c |
	"switch to lexical context"
	creationTime != 'dynamic' ifTrue: [
	    error: 'shouldn\'t be calling a non-dynamic method'.
	].
	resolvedContext creationTime != 'dynamic' ifTrue: [
	    error:
		'dynamic method shouldn\'t have a non-dynamic ',
		'lexical context'.
	].
	evalWithArgs: args InContext: resolvedContext copy ).
    
    evalWithArgs: args InContext: context = (
	formals with: args Do: [ | :formal. :arg. | 
	    context addBinding:
		cecil_constant_binding copyName: formal name WithValue: arg.
	].
	body eval: context WithArgs: args ).

    includesFormalName: fm = ( formals includesName: fm ).
    getFormal: formalName = ( formals getFormal: formalName ).

    checkEncapsulation: context With: exprs = (
	"checking for encapsulation of an invocation of a method"
	isPrivate ifTrue: [ | actualConstraints. sender. |
	    context hasHomeContext ifFalse: [
		cecilErr: 'invoking private method ', printString,
		    ' from outside any method'.
	    ].
	    sender: context homeMethod.
	    actualConstraints:
	        exprs correspondingConstraintsInMethod: sender
	    				     InContext: context.
	    actualConstraints isEmpty ifTrue: [
		error: 'shouldn\'t have any private methods without arguments'
	    ].
	    formals constraints checkEncapsulation: actualConstraints
		InContext: context CalledMethod: self SendingMethod: sender.
	].
    ).
| )


traits cecil_optimized_eval_method _AddSlots: ( |
    eval: context WithArgs: args = ( | c. closure. |
	"switch to lexical context"
	creationTime != 'dynamic' ifTrue: [
	    error: 'shouldn\'t be calling a non-dynamic eval method'.
	].
        closure: args first.
	closure lexicalContext creationTime != 'dynamic' ifTrue: [
	    error: 'closure shouldn\'t have a non-dynamic enclosing context'.
	].
	c: cecil_nested_context createInContext: closure lexicalContext.
	evalWithArgs: args InContext: c ).
| )


traits cecil_formal_list _AddSlots: ( |    
    includesName: fm = (
	do: [ | :formal |
	    formal name = fm ifTrue: [ ^ true ].
	].
	false ).

    getFormal: fm = (
	do: [ | :formal |
	    formal name = fm ifTrue: [ ^formal ].
	].
	nil ).
| )
	
traits cecil_expr_list _AddSlots: ( |
    "evaluate expressions as a list of top-level things; return the last one"
    eval: context = ( | result |
	result: cecil_void.
	do: [ | :expr |
	    result: expr eval: context.
	].
	result ).

    correspondingConstraintsInMethod: method InContext: context = (
	| constraints |
	constraints: cecil_constraint_list copy.
	do: [ | :astNode | 
	    astNode isVarNode &&
		[(method includesFormalName: astNode name) &&
		    [(context lookup_binding: astNode name) ==
			(context homeContext lookup_binding: astNode name)]]
	    ifTrue: [ 
		"actual argument is a formal parameter; use formal's constraint"
		constraints add:
		    (method getFormal: astNode name) constraint.
	    ] False: [
		"not a reference to one of the method's formals;
		 no privileged access"
		constraints add: context top_object.
	    ].
	].
	constraints ).
| )


traits cecil_constraint_list _AddSlots: ( |
    checkEncapsulation: actualConstraints InContext: context 
	        CalledMethod: callee SendingMethod: caller = (
	with: actualConstraints Do: [ | :formalConstraint. :actualConstraint. |
	    formalConstraint = context top_object ifFalse: [
		" have to check for potential access violations "
		(actualConstraint = context top_object) ||
		[(formalConstraint != actualConstraint) && [
			| handlePreds.
			  checkFormalConstraint. checkActualConstraint.
			  allowed. |
			handlePreds:
			    (context interp
				messagesAffectedByPredicateObjects
		    		includes: callee name) || 
		        [context interp
				messagesAffectedByPredicateObjects
		    		includes: caller name].
			checkFormalConstraint: formalConstraint.
			checkActualConstraint: actualConstraint.
			handlePreds ifTrue: [
			    formalConstraint predicateChildren nonEmpty
			      ifTrue: [
				checkFormalConstraint: cecil_object copy.
				checkFormalConstraint creationTime: 'dynamic'.
				checkFormalConstraint newParent: 'real obj'
				    AndObject: formalConstraint.
			    ].
			    checkFormalConstraint calculatePredicateParents.
			    actualConstraint predicateChildren nonEmpty
			      ifTrue: [
				checkActualConstraint: cecil_object copy.
				checkActualConstraint creationTime: 'dynamic'.
				checkActualConstraint newParent: 'real obj'
				    AndObject: actualConstraint.
			    ].
			    checkActualConstraint calculatePredicateParents.
			].
			allowed:
			    (checkActualConstraint inheritsFrom:
				checkFormalConstraint) ||
		            [checkFormalConstraint inheritsFrom:
				checkActualConstraint].
			handlePreds ifTrue: [
			    checkFormalConstraint clearPredicateParents.
			    checkActualConstraint clearPredicatesParents.
			].
			allowed not ]] ifTrue: [
		    cecilErr:
			'invoking inaccessible private method ',
			callee printString,
			' from within ', caller printString.
		].
	    ].
	].
    ).
| )


"*************************
 *                       *
 *     Cecil  Body       *
 *                       *
 *************************"


traits cecil_skeleton_body _AddSlots: ( |
    eval: context WithArgs: args = ( 
	error: 'cannot evaluate the body of the cecil skeleton object'.
    ).
| )

traits cecil_code_body _AddSlots: ( |
    eval: context WithArgs: args = (
	context shareEnclosingMethodCache.
	[   stmts do: [ | :stmt | stmt eval: context. ].
	    resultExpr eval: context
	] onReturn: [
	    "throw away any local methods"
	    context removeMethods.
	] ).
| )

traits cecil_method_body _AddSlots: ( |
    eval: context WithArgs: args = (
	"use a Self non-local return to implement a Cecil non-local return"
	context nonLocalReturnBlk: [| :r | ^r ].
	[
	    resend.eval: context WithArgs: args
	] onReturn: [
	    "don't allow any more non-local returns"
	    context nonLocalReturnBlk: nil.
	] ).
| )

traits cecil_abstract_body _AddSlots: ( |
    eval: context WithArgs: args = ( 
	cecilErr: 'shouldn\'t be invoking an abstract method'.
    ).
| )


traits cecil_get_accessor_body _AddSlots: ( |
    eval: context WithArgs: args = ( value eval: context ).  
| )

traits cecil_local_get_accessor_body _AddSlots: ( |
    eval: context WithArgs: args = (
	args first atFieldName: key IfAbsent: [ value eval: context ] ).
| )

traits cecil_set_accessor_body _AddSlots: ( |
    eval: context WithArgs: args = ( 
	contents value: args last.
	cecil_void ).  
| )

traits cecil_local_set_accessor_body _AddSlots: ( |
    eval: context WithArgs: args = (  
	args first atFieldName: key Put: args last.
	cecil_void ).
| )

traits cecil_init_only_set_accessor_body _AddSlots: ( |
    eval: context WithArgs: args = ( | obj |
	obj: args first.
	(obj fieldIsDefined: key) ifTrue: [
	    error:
		'shouldn\'t be assigning to an init-only accessor ',
		'more than once'.
	].
	obj atFieldName: key Put: args last.	"init field"
	cecil_void ).
| )

cecil_uninitialized_field_contents _AddSlots: ( |
    eval: context = ( cecilErr: 'accessing uninitialized field' ).
| )

traits cecil_accessor_place_holder _AddSlots: ( |
    eval: context = (
	error: 'should never evaluate accessor place holder'.
    ).
| )


"*************************
 *                       *
 *      AST Nodes        *
 *                       *
 *************************"

traits cecil_AST_node _AddSlots: ( |
    eval: context = ( 
	error: 'cannot evaluate cecil AST node'.
    ).
| )


"Simple expressions"

traits cecil_literal_node _AddSlots: ( |
    eval: context = ( 
	dynamicValue == nil ifTrue: [
	    "create dynamic value and cache for future evaluations of this
	     AST node"
	    dynamicValue: value copy.
	    dynamicValue resolveNames: context.
	].
	dynamicValue ).
| )


traits cecil_var_node _AddSlots: ( |
    eval: context = ( | obj |
	obj: context lookup_object: name.
	obj creationTime != 'dynamic' ifTrue: [
	    error: 'accessing an object not created dynamically'.
	].
	obj kind isConcrete || obj kind isUnspecified ifFalse: [
	    cecilErr: name, ' is not a concrete object'.
	].
	params size > 0 ifTrue: [ | ps |
	    obj needsInstantiation ifFalse: [
		cecilErr: name, ' does not need parameters'.
	    ].
	    obj params size != params size ifTrue: [
		cecilErr: name,
		    ' is not instantiated with right number of parameters'.
	    ].
	    "resolve parameters"
	    ps: params copy.
	    ps resolveNames: context.
	    obj copyInstantiatingWith: ps AtLocation: location
	] False: [
	    obj needsInstantiation && [context interp doInstantiation] ifTrue: [
		cecilErr: name, ' is parameterized and needs instantiation'.
	    ].
	    obj
	] ).
| )


"Object constructor expressions"

traits cecil_array_object_expr_node _AddSlots: ( |
    eval: context = ( | newObj. params. parent. |
	newObj: cecil_object copy.

	"what should the real instantiating type be?
	 lub of actual dynamic types?"
	params: cecil_param_list copyRemoveAll add:
	    cecil_fixed_type_spec copy: dynamicType.
	parent: (context lookup_top_context_object: 'array')
	    copyInstantiatingWith: params AtLocation: location.
	newObj newParent: 'array' AndObject: parent.

	newObj setArrayLength: elems size InContext: context.

	elems size do: [ | :index | 
	    newObj arrayElem: index Put: ((elems at: index) eval: context)
		InContext: context.
	].

	newObj creationTime: 'dynamic'.
	"newObj resolveNames: context should be unnecessary"

	newObj ).
| )


traits cecil_closure_node _AddSlots: ( |
    eval: context = ( 
	cecil_closure_object createWithMethod: method InContext: context ).
| )

traits cecil_optimized_closure_node _AddSlots: ( |
    eval: context = (
	context hasHomeContext ifFalse: [
	    "don't optimize if not nested in a method"
	    ^ resend.eval: context
	].
	optimizedClosureParent == nil ifTrue: [ | c |
	    "create dynamic pseudo-parent and pseudo-method,
	     and cache them for future evaluation of this closure_node"
	    optimizedClosureParent: cecil_object copy.
	    optimizedClosureParent newParent: 'closure' AndObject: 
		context lookup_top_context_object: 'closure'.
	    optimizedClosureParent creationTime: 'dynamic'.
	    c: calculateEnclosingContext: context.
	    optimizedEvalMethod: optimizedEvalMethod
	        createOptimizedEvalMethodFrom: method
	    			   AttachedTo: optimizedClosureParent
	    	    		    InContext: c.
	    "this predefined stuff is pretty ugly"
	    optimizedClosureParent type isPredefined:
		context homeMethod isPredefined.
	    optimizedEvalMethod isPredefined:
		context homeMethod isPredefined.
	].
	cecil_optimized_closure_object
	    createWithParent: optimizedClosureParent InContext: context ).

    _ calculateEnclosingContext: context = ( | c |
	context homeContext = context ifTrue: [
	    c: context top_context.
	] False: [
	    c: calculateEnclosingContext: context enclosingContext.
	].
	context typeBindings nonEmpty ifTrue: [
	    "need to make any types introduced by the enclosing method
	     be available to the current closure"
	    c: cecil_nested_context createInContext: c.
	    c typeBindings addAll: context typeBindings.
	].
	c ).
| )



"Messages"

traits cecil_msg_node _AddSlots: ( |
    eval: context = ( | args. method. |
	args: cecil_obj_list copyRemoveAll.
	exprs do: [ | :e | args add: e eval: context ].

	method: context method_lookup: msgName Args: args Params: params.
	method checkEncapsulation: context With: exprs.

	method eval: context WithArgs: args ).
| )


traits cecil_resend_node _AddSlots: ( |
    eval: context = ( | args. lookupArgs. msgName. method. |
	context hasHomeContext ifFalse: [
	    cecilErr: 'cannot resend when not in a method'.
	].

	msgName: context homeMethod name.

	args: cecil_obj_list copyRemoveAll. 
	lookupArgs: cecil_obj_list copyRemoveAll. 
	hasArguments ifTrue: [
	    qualifiedExprs eval: context 
		WithFormals: context homeMethod formals
		IntoArgs: args
		IntoLookupArgs: lookupArgs.
	] False: [
	    "default all the arguments to resend"
	    context homeMethod formals do: [ |:formal|
		lookupArgs add: formal constraint.
		args add: context homeContext lookup_binding: formal name.
	    ].
	].

	qualifiedExprs isDirectedResend ifTrue: [
	    method: context method_lookup: msgName Args: lookupArgs
		Params: context homeMethod params.
	] False: [
	    method: context resend_method_lookup: msgName Args: lookupArgs
		Params: context homeMethod params.
	].

	method eval: context WithArgs: args ).
| )

traits cecil_qualified_expr_list _AddSlots: ( |
    eval: context WithFormals: formals 
            IntoArgs: args IntoLookupArgs: lookupArgs = (
	size != formals size ifTrue: [
	    cecilErr: 'wrong number of arguments to resend'.
	].
	with: formals Do: [ | :qe. :f. |
	    qe isDirected ifTrue: [
		qe   directedActualWithFormal: f IntoLookupArgs: lookupArgs 
		    InContext: context.
	    ] False: [
		qe undirectedActualWithFormal: f IntoLookupArgs: lookupArgs 
		    InContext: context.
	    ].
	    args add: qe eval: context.
	].
    ).

    isDirectedResend = (
	do: [ | :qe | qe isDirected ifTrue: [ ^true ] ].
	false ).
| )

traits cecil_qualified_expr _AddSlots: ( |
    eval: context = ( expr eval: context ).
    isVarNode = ( expr isVarNode ).

    undirectedActualWithFormal: formal IntoLookupArgs: lookupArgs
            InContext: context = (
	formal constraint = context top_object ifTrue: [ 
	    lookupArgs add: context top_object.
	] False: [
	    isVarNode && [expr name = formal name] ifFalse: [
		cecilErr:
		    'not resending with the same constrained formal as ',
		    formal name.
	    ].
	    lookupArgs add: formal constraint.
	].
    ).

    directedActualWithFormal: formal IntoLookupArgs: lookupArgs
	    InContext: context = (
	formal constraint = context top_object ifTrue: [
	    cecilErr: 'cannot direct through unconstrained formal ',
	         formal name.
	].
	isVarNode && [expr name = formal name] ifFalse: [
	    cecilErr:
		'not resending with the same constrained formal as ',
		formal name.
	].
	formal constraint calculatePredicateParents.
	constraintSpec resolveNames: context.
	(formal constraint inheritsFrom: constraint) ifFalse: [
	    cecilErr:
		'directing through an object ',
		'that is not an ancestor of ',
		formal constraint cecilShortPrintString.
	].
	formal constraint clearPredicateParents.
	lookupArgs add: constraint.
    ).
| )


traits cecil_nested_scope_node _AddSlots: ( |
    eval: context = ( | c |
	"evaluate the body with context as its 
         lexically enclosing context"	
	c: cecil_nested_context createInContext: context.
	body eval: c WithArgs: cecil_obj_list copyRemoveAll ).
| )


"Statements"

traits cecil_assign_node _AddSlots: ( |
    eval: context = ( | value |
	value: expr eval: context.
	(context lookup_binding: name) assignValue: value.
	context interp assignAsExpr ifTrue: value False: cecil_void ).
| )


"Result Expressions"

traits cecil_return_node _AddSlots: ( |
    eval: context = ( expr eval: context ).
| )

traits cecil_nonlocal_return_node _AddSlots: ( |
    eval: context = ( | result. blk. |
	result: expr eval: context.
	context hasHomeContext ifFalse: [
	    cecilErr: 'cannot do a non-local return when not in a method'.
	].
	blk: context homeContext nonLocalReturnBlk.
	blk == nil ifTrue: [
	    cecilErr: 'non-LIFO non-local return not supported'.
	].
	"need to clean up contexts that are being non-local-returned through"
	blk value: result ).
| )

cecil_no_result_node _AddSlots: ( |
    eval: context = ( cecil_void ).
| )
