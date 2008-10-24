"Sun-$Revision: 9.1 $"

"Name resolution"


"Objects"

traits cecil_object _AddSlots: ( |
    resolveNames: context = (
	creationTime = 'prototype' ifTrue: [
	    error: 'shouldn\'t be name-resolving the prototype'.
	].
	creationTime: context creationTime.

	parentSpecs resolveNames: context.
	isaSpecs resolveNames: context.
	supertypeSpecs resolveNames: context.

	checkInheritance: context.

	buildTypeLattice: context.
    ).

    checkInheritance: context = (
	"check for duplicate parent/isa/supertype declarations"
	parents size != (parentSpecs size + isaSpecs size) ifTrue: [
	    cecilWarning: 'declaring duplicate parents'.
	].
	supertypes size != (supertypeSpecs size + isaSpecs size) ifTrue: [
	    cecilWarning: 'declaring duplicate supertypes'.
	].
	"check for cycles in the inheritance and subtyping graphs"
	parentsDo: [ | :parent |
	    (parent inheritsFrom: self) ifTrue: [
		cecilErr: 'cannot have cycles in the inheritance graph'.
	    ].
	].
	supertypesDo: [ | :supertype |
	    (supertype isSubtypeOf: type) ifTrue: [
		cecilErr: 'cannot have cycles in the subtyping graph'.
	    ].
	].
    ).

    buildTypeLattice: context = ( | anySupertypes |
	"Add supertype links to type hierarchy"
	anySupertypes: false.
	supertypesDo: [ | :supertype |
	    type addSupertype: supertype In: context.
	    anySupertypes: true.
	].
	anySupertypes ifFalse: [
	    "treat topType as the immediate supertype"
	    type addSupertype: context top_type In: context.
	].
    ).

    merge: extension = (
	parentSpecs addAll: extension parentSpecs.
	isaSpecs addAll: extension isaSpecs.
	supertypeSpecs addAll: extension supertypeSpecs.
	self ).

    removeFromTypeLattice = (
	type removeFromLattice.
    ).
| )

traits cecil_named_object _AddSlots: ( |
    resolveNames: context = (
	resolveParams: context.
	resend.resolveNames: context.
    ).
    resolveParams: context = (
	params defineTypeVariableNames: context.
	"also define any type variables in parameters of parents"
	parentSpecs defineTypeVariableNames: context.
	isaSpecs defineTypeVariableNames: context.
	supertypeSpecs defineTypeVariableNames: context.

	params resolveNames: context.
    ).
| )

traits cecil_instantiated_object _AddSlots: ( |
    resolveParams: context = (
	"parameters already resolved"
	self ).
| )

traits cecil_predicate_object _AddSlots: ( |
    resolveNames: context = (
	resend.resolveNames: context.
	updateParentPredicateChildren.
    ).

    merge: extension = (
	resend.merge: extension.
	updateParentPredicateChildren.
	self ).

    updateParentPredicateChildren = (
	" inform direct parents that they have a new predicate child "
	parentsDo: [ | :parent |
	    (parent predicateChildren includes: self) ifFalse: [
		parent predicateChildrenUsed ifTrue: [
		    error: 'sorry, not implemented: ',
		    	'changing predicate children after they\'ve been used'.
		].
		parent predicateChildren add: self.
	    ].
	].
	self ).
| )

traits cecil_literal_object _AddSlots: ( |
    resolveNames: context = (
	"always resolve literal object's parent's name in the outer context"
	resend.resolveNames: context top_context.
    ).
| )

traits cecil_string_literal _AddSlots: ( |
    resolveNames: context = (
	resend.resolveNames: context.
	(atPrimFieldName: 'length' Of: 'string' InContext: nil)
	    resolveNames: context top_context.
    ).
| )


"Declarations"

"The resolveNames: methods for declarations and bindings are a bit tricky,
 given the 3-step processing of declaration blocks in interpreter.self"

traits cecil_decl_node _AddSlots: ( |
    defineName: context = ( binding defineName: context ).

    resolveNames: context = (
	"fetch the binding that has already been created in the context,
	 and resolve its names"
	(context lookup_binding: binding name) resolveNames: context.
    ).
| )

traits cecil_non_object_binding _AddSlots: ( |
    defineName: context = (
	"mark name as available, but not initialized yet"
	"(this will catch recursive variable references)"
	context addBinding:
	    copyName: name WithValue: cecil_uninitialized_variable.
    ).

    resolveNames: context = (
	typeSpec resolveNames: context.
    ).
| )

traits cecil_object_binding _AddSlots: ( |
    "for object bindings, add object placeholder at define-time,
     to support self-referential links among objects and methods"
    defineName: context = ( | obj |
	"make a copy of the binding"
	obj: value createObject: context.
	context addBinding: copyName: name WithValue: obj.
	obj isType ifTrue: [
	    "add name for the type, too"
	    context addTypeDecl: name Type: obj type.
	].
    ).

    resolveNames: context = (
	context creationTime = 'dynamic' ifTrue: [
	    debugMsg: 'Defining ', name.
	].
	"resolve names for object declaration in nested context,
	 in case of any local type vars introduced as a result of 
	 parameterization"
	nil == resolvedContext ifFalse: [ 
	    error: 'shouldn\'t be name-resolving an object binding twice' ].
	resolvedContext: cecil_nested_context createInContext: context.
	value resolveNames: resolvedContext.
    ).
| )

traits cecil_extension_decl_node _AddSlots: ( |
    defineName: context = ( self ).

    "all the processing of extension-decl-nodes takes place here"
    resolveNames: context = ( | extension. obj. |
	(context isLocalObject: value name) ifFalse: [
	    "must preserve object identity!"
	    cecilErr: 'extensions in nested scopes not implemented yet'.
	].
	"create dummy object representing extension"
	extension: value createObject: context.
	"create local context for name resolution"
	resolvedContext: cecil_nested_context createInContext: context.
	extension resolveNames: resolvedContext.
	"copy over any properties of the new object to the original"
	obj: context lookup_named_object: value name.
	extension needsInstantiation ifTrue: [
	    "the current code extends the original object, even if only an
	     instantiation is being extended"
	    "warning: 'not merging parameterized extension decls right yet'"
	].
	obj merge: extension.
	obj checkInheritance: context.
	obj buildTypeLattice: context.
	extension removeFromTypeLattice.	"forget the extension object"
    ).
| )

traits cecil_field_info_node _AddSlots: ( |
    defineName: context = ( self ).
    resolveNames: context = ( | obj. f. |
	obj: context lookup_binding: objectName.
	f: cecil_field_info copyInfoNode: self.
	obj value compilerStates add: f.
    ).
| )

traits cecil_anon_obj_info_node _AddSlots: ( |
    defineName: context = ( self ).
    resolveNames: context = ( self ).
| )

traits cecil_include_node _AddSlots: ( |
    defineName: context = ( self ).
    resolveNames: context = ( self ).
| )

traits cecil_end_include_node _AddSlots: ( |
    defineName: context = ( self ).
    resolveNames: context = ( self ).
| )

traits cecil_prim_include_node _AddSlots: ( |
    defineName: context = ( self ).
    resolveNames: context = ( self ).
| )

traits cecil_method_node _AddSlots: ( |
    defineName: context = ( self ).

    resolveNames: context = (
	resolvedMethod: method copy.
	resolvedMethod enclosingContext: context.
	resolvedMethod resolvedContext:
	    cecil_home_context createForMethod: resolvedMethod.
	resolvedMethod resolveNames: resolvedMethod resolvedContext.
	context creationTime = 'dynamic' ifTrue: [
	    debugMsg: 'Defining ', resolvedMethod printString.
	].
	resolvedMethod isPrivate &&
	    [resolvedMethod formals hasConstrainedFormal not] ifTrue: [
	    cecilWarning: 'private method ', resolvedMethod printString,
		' has no constrained formals;\n',
		'    treating as unspecified'.
	    resolvedMethod privacy: cecil_unspecified_privacy.
	].
    ).
| )


"Methods and formals"

traits cecil_method _AddSlots: ( |
    resolveNames: context = (
	"introduce new type names first"
	params defineTypeVariableNames: context.
	formals defineTypeVariableNames: context.

	"then resolve names, with the type variables available"
	params resolveNames: context.
	formals resolveNames: context.
	resultTypeSpec resolveNames: context.

	"after formals have been resolved, add linkages between method
	 and constraints"
	formals do: [ | :f. |
	    "After formal names resolved, link them to this method."
	    "Either a constraintName defined by the user or
             it is the top object of the cecil_interpreter."
	    f addConstrainedMethodLink: self.
	].

	"add method to the context's list of methods"
	calculateKey.
	calculateConstrainedPositions.
	context enclosingContext addMethod: self.

	creationTime = 'prototype' ifTrue: [
	    error: 'shouldn\'t be name-resolving the prototype'.
	].
	creationTime: context creationTime.
    ).
| )

traits cecil_formal_list _AddSlots: ( |
    defineTypeVariableNames: context = (
	do: [ | :el | el defineTypeVariableNames: context ].
    ).
    resolveNames: context = (
	do: [ | :el | el resolveNames: context ].
    ).
| )

traits cecil_formal _AddSlots: ( |
    defineTypeVariableNames: context = (
	constraintSpec defineTypeVariableNames: context.
	typeSpec defineTypeVariableNames: context.
    ).
    resolveNames: context = (
	constraintSpec resolveNames: context.
	typeSpec resolveNames: context.
    ).
| )


"Specs"

traits cecil_spec_list _AddSlots: ( |
    defineTypeVariableNames: context = (
	do: [ | :sp | sp defineTypeVariableNames: context ].
    ).
    resolveNames: context = (
	do: [ | :sp | sp resolveNames: context ].
    ).
| )

cecil_unspecified _AddSlots: ( |
    defineTypeVariableNames: context = ( self ).
    resolveNames: context = ( self ).
| )

traits cecil_spec _AddSlots: ( |
    defineTypeVariableNames: context = ( self ).
| )

traits cecil_named_object_spec _AddSlots: ( |
    defineTypeVariableNames: context = ( 
	params defineTypeVariableNames: context.
    ).
    resolveNames: context = ( 
	object: context lookup_named_object: name.
	params resolveNames: context.
	object needsInstantiation ifTrue: [
	    object params size != params size ifTrue: [
		cecilErr: name,
		    ' is not instantiated with right number of parameters'.
	    ].
	    object: object copyInstantiatingWith: params copy
		AtLocation: location.
	] False: [
	    params size > 0 ifTrue: [
		cecilErr: name, ' does not need parameters'.
	    ].
	].
    ).
| )

traits cecil_fixed_spec _AddSlots: ( |
    resolveNames: context = (
	"no extra resolution needed; already resolved to an object"
	self
    ).
| )

traits cecil_unconstrained_spec _AddSlots: ( |
    resolveNames: context = (
	object: context top_object.
    ).
| )

traits cecil_named_type_spec _AddSlots: ( |
    defineTypeVariableNames: context = ( 
	params defineTypeVariableNames: context.
    ).

    resolveNames: context = ( 
	type: resolveType: context.
	params resolveNames: context.
	type needsInstantiation ifTrue: [
	    type params size != params size ifTrue: [
		cecilErr: name,
		    ' is not instantiated with right number of parameters'.
	    ].
	    type: type copyInstantiatingWith: params copy
		In: context AtLocation: location.
	] False: [
	    params size > 0 ifTrue: [
		cecilErr: name, ' does not need parameters'.
	    ].
	].
    ).

    "lookup_type implicitly checks that it is a named type"
    resolveType: context = ( context lookup_type: name ).
| )

traits cecil_internal_named_type_spec _AddSlots: ( |
    "allow references to objects that weren't declared with the 'type'
     keyword, e.g., in '@:name' contexts"
    resolveType: context = ( (context lookup_named_object: name) type ).
| )

traits cecil_undeclared_type_spec _AddSlots: ( |
    resolveNames: context = ( self ).
| )

traits cecil_fixed_type_spec _AddSlots: ( |
    resolveNames: context = ( self ).
| )

traits cecil_closure_type_spec _AddSlots: ( |
    defineTypeVariableNames: context = ( 
	argSpecs defineTypeVariableNames: context.
	resultTypeSpec defineTypeVariableNames: context.
    ).
    resolveNames: context = (
	type == nil ifFalse: [ error: 'shouldn\'t be resolved twice' ].
	type: cecil_closure_type copy.
	argSpecs do: [ | :argSpec |
	    argSpec resolveNames: context.
	    type args add: argSpec type.
	].
	resultTypeSpec resolveNames: context.
	type result: resultTypeSpec type.
    ).
| )

traits cecil_type_expr_spec _AddSlots: ( |
    resolveNames: context = (
	typeSpec1 resolveNames: context.
	typeSpec2 resolveNames: context.
	type: combine: typeSpec1 type And: typeSpec2 type.
    ).
| )

traits cecil_lub_type_spec _AddSlots: ( |
    combine: t1 And: t2 = ( t1 lub: t2 ).
| )

traits cecil_glb_type_spec _AddSlots: ( |
    combine: t1 And: t2 = ( t1 glb: t2 ).
| )

traits cecil_type_var_spec _AddSlots: ( |
    defineTypeVariableNames: context = ( | localName. t |
	type == nil ifFalse: [ error: 'shouldn\'t be resolved twice' ].
	type: cecil_type_var_node copyName: name.
	type fullName: name, type objectID.
	context addTypeDecl: type fullName Type: type.
	(context isLocalType: name) ifTrue: [
	    "binding the same type var twice"
	    t: context lookup_type: name.
	] False: [
	    "first (binding) occurrence of this type var;
	     create another type as the one with this name"
	    t: cecil_type_var_node copyName: name.
	    context addTypeDecl: name Type: t.
	].
	"record that the parameter's type is a subtype of the lub type which
	 all binding occurrences of this name map to"
	type addSupertype: t In: context.
    ).
    resolveNames: context = ( | t |
	(context isLocalType: name) ifFalse: [
	    "should have bound this type var already"
	    error:
		'should not have a binding occurrence of a type variable ',
		'in this context'.
	].
	type == nil ifTrue: [ error: 'should be set by now' ].

	t: context lookup_type: name.

	upperBound resolveNames: context.
	upperBound isSpecified ifTrue: [
	    t addSupertype: upperBound type In: context.
	].

	lowerBound resolveNames: context.
	lowerBound isSpecified ifTrue: [
	    lowerBound type addSupertype: t In: context.
	].
    ).
| )
