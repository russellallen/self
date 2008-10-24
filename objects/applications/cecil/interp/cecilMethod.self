"Sun-$Revision: 9.1 $"


" Formals "

traits cecil_interp _AddSlotsIfAbsent: ( | cecil_formal = () | )
traits cecil_formal _Define: ( |
    parent* = traits clonable.
    errHandlingParent* = mixins cecil_error_handling.

    printString = (
	nameString,
	    (isConstrained ifFalse: '' True: ['@', 
		(typeSpec isInternalNamed ifTrue: [':'] False: ['']),
		constraintSpec printString]),
	    ((typeSpec isUndeclared || typeSpec isInternalNamed)
		ifTrue: '' False: [':', typeSpec printString]) ).
    printStringIn: obj = (
	"for now, just use normal print string"
	"someday, print self-references to obj specially"
	printString ).

    nameString = ( name ).

    copy = ( | newFormal |
	newFormal: clone.
	newFormal typeSpec: typeSpec copy.
	newFormal constraintSpec: constraintSpec copy.
        newFormal.
    ).

    copyWithName: aName = ( | newFormal |
	newFormal: copy.
	newFormal name: aName.
	newFormal.
    ).

    isConstrained = ( constraintSpec isConstrained ).

    isAnonymous = false.

    addConstrainedMethodLink: method = (
	constraintSpec addConstrainedMethodLink: method.
    ).

    constraint = ( constraintSpec object ).
    type = ( typeSpec type ).
| )

globals cecil_interp _AddSlotsIfAbsent: ( | cecil_formal = () | )
cecil_formal _Define: ( |
    _ parent* = traits cecil_formal.
    _ thisObjectPrints = true.
    name <- ''.    
    constraintSpec <- cecil_unconstrained_spec.
    typeSpec <- cecil_undeclared_type_spec.
    compiledName <- ''.
| )


"a cecil_formal might not have a name"
traits cecil_interp _AddSlotsIfAbsent: ( | cecil_anonymous_formal = () | )
traits cecil_anonymous_formal _Define: ( |
    parent* = traits cecil_formal.
    copy = ( | c |
	c: resend.copy.
	"make up a unique name"
	c name: '<anonymous ', c objectIDNumber printString, '>'.
	c ).
    nameString = ''.
    isAnonymous = true.
| )

globals cecil_interp _AddSlotsIfAbsent: ( | cecil_anonymous_formal = () | )
cecil_anonymous_formal _Define: cecil_formal clone _AddSlots: ( |
    _ parent* = traits cecil_anonymous_formal.
| )


traits cecil_interp _AddSlotsIfAbsent: ( | cecil_formal_list = () | )
traits cecil_formal_list _Define: ( |
    parent* = traits list.
    errHandlingParent* = mixins cecil_error_handling.

    ^ copy = ( | fs |
	fs: copyRemoveAll.
	do: [ | :f | fs add: f copy ].
	fs ).

    printString = ( | str |
	str: '('.
	doFirst: [ | :p |
	    str: str, p printString.
	] MiddleLast: [ | :p |
	    str: str, ', ', p printString.
	] IfEmpty: [
	].
	str, ')' ).
    printStringIn: obj = ( | str |
	str: '('.
	doFirst: [ | :p |
	    str: str, (p printStringIn: obj).
	] MiddleLast: [ | :p |
	    str: str, ', ', (p printStringIn: obj).
	] IfEmpty: [
	].
	str, ')' ).

    ^ addNewFormal: newFormal = ( 
	do: [ | :f |
	    f name = newFormal name ifTrue: [
		syntaxErr: 'can not contain duplicate formal name ', f name.
	    ].
	].
	add: newFormal.
    ).

    ^ addClosureFormal: closureObject = (	
        "set the constraint object for the first formal of the 
         optimized eval method"
	addFirst: cecil_formal copy constraintSpec:
	    cecil_fixed_spec copyName: '<closure>' Object: closureObject.
    ).

    ^ hasConstrainedFormal = (
	do: [ | :f | f isConstrained ifTrue: [ ^ true ] ].
	false ).

    ^ constraints = ( | cs |
	cs: cecil_constraint_list copy.
	do: [ | :formal |
	    cs add: formal constraint.
	].
	cs ).

    ^ removeFromConstraints: method = (
	do: [ | :formal |
	    formal constraint detachMethod: method
	].
    ).
| )

globals cecil_interp _AddSlotsIfAbsent: (| cecil_formal_list = () |)
cecil_formal_list _Define: list clone _AddSlots: ( |
    _ parent* = traits cecil_formal_list.
| )


" Parameters "

traits cecil_interp _AddSlotsIfAbsent: ( | cecil_param_list = () | )
traits cecil_param_list _Define: ( |
    parent* = traits cecil_spec_list.

    printString = ( | str |
	isEmpty ifTrue: [ ^ '' ].
	str: '['.
	doFirst: [ | :p |
	    str: str, p printString.
	] MiddleLast: [ | :p |
	    str: str, ',', p printString.
	] IfEmpty: [ error: 'shouldn\'t be here' ].
	str, ']' ).
    cecilShortPrintString = ( printString ).
| )

globals cecil_interp _AddSlotsIfAbsent: (| cecil_param_list = () |)
cecil_param_list _Define: cecil_spec_list clone _AddSlots: ( |
    _ parent* = traits cecil_param_list.
| )


traits cecil_interp _AddSlotsIfAbsent: ( | cecil_formal_param_list = () | )
traits cecil_formal_param_list _Define: ( |
    parent* = traits cecil_param_list.

    ^ addNewFormalParam: newParam = ( 
	do: [ | :p |
	    p name = newParam name ifTrue: [
		syntaxErr:
		    'cannot duplicate formal param name ', p name.
	    ].
	].
	add: newParam.
    ).
| )

globals cecil_interp _AddSlotsIfAbsent: (| cecil_formal_param_list = () |)
cecil_formal_param_list _Define: cecil_param_list clone _AddSlots: ( |
    _ parent* = traits cecil_formal_param_list.
| )


" Privacy "

traits cecil_interp _AddSlotsIfAbsent: ( | cecil_privacy = () | )
traits cecil_privacy _Define: ( |
    _ parent* = traits oddball.
    _ errHandlingParent* = mixins cecil_error_handling.
    ^ isPublic = false.
    ^ isPrivate = false.
    ^ isUnspecified = false.
|)

globals cecil_interp _AddSlotsIfAbsent: ( | cecil_public = () | )
cecil_public _Define: ( |
    _ parent* = traits cecil_privacy.
    _ thisObjectPrints = true.
    ^ printString = 'public'.
    ^ compiledName = 'PublicMethod'.
    ^ isPublic = true.
|)

globals cecil_interp _AddSlotsIfAbsent: ( | cecil_private = () | )
cecil_private _Define: ( |
    _ parent* = traits cecil_privacy.
    _ thisObjectPrints = true.
    ^ printString = 'private'.
    ^ compiledName = 'PrivateMethod'.
    ^ isPrivate = true.
|)

globals cecil_interp _AddSlotsIfAbsent: ( | cecil_unspecified_privacy = () | )
cecil_unspecified_privacy _Define: ( |
    _ parent* = traits cecil_privacy.
    _ thisObjectPrints = true.
    ^ printString = '<unspecified_privacy>'.
    ^ compiledName = 'PublicMethod'.
    ^ isUnspecified = true.
|)

 
" Methods "

traits cecil_interp _AddSlotsIfAbsent: ( | cecil_method = () | )
traits cecil_method _Define: ( |
    parent* = traits clonable.
    errHandlingParent* = mixins cecil_error_handling.

    printString = ( key printString ).

    fullPrintString = ( 
	headerPrintString, body fullPrintString).

    privacyString = (
	privacy isUnspecified ifTrue: '' False: [privacy printString, ' '] ).

    argsPrintString = (
	formals printString, resultTypePrintString ).
    argsPrintStringIn: obj = (
	(formals printStringIn: obj), resultTypePrintString ).

    resultTypePrintString = (
	resultTypeSpec isUndeclared
	    ifTrue: '' False: [':', resultTypeSpec printString] ).

    argsAndBodyPrintString = (
	argsPrintString, body fullPrintString ).

    headerPrintString = ( 
	privacyString, 'method ', name, params printString, argsPrintString).
	

    ^ copy = ( | method |
    	method: clone.
	method params: params copy.
    	method formals: formals copy.
	method resultTypeSpec: resultTypeSpec copy.
	method constrainedPositions: constrainedPositions copy.
	method creationTime: 'unknown'.
    	method ).

    ^ copyForSetAccessor: setAccessorName WithPrivacy: setAccessorPrivacy 
	WithFieldKind: fieldKind WithDefaultValue: defaultValue = (
	| setAccessor |
	setAccessor: copy.
	setAccessor name: setAccessorName.
	setAccessor privacy: setAccessorPrivacy.
	isAbstract ifTrue: [
	    setAccessor createAbstractBody.
	    setAccessor body returnsVoid: true.
	] False: [
	    setAccessor initSetAccessorBody: defaultValue
	            WithFieldKind: fieldKind.
	].
	"create a dummy formal for field value"
	setAccessor addFormal:
	    (cecil_formal copyWithName: '{fieldValue}')
	        typeSpec: setAccessor resultTypeSpec copy.
	setAccessor resultTypeSpec:
	    cecil_named_type_spec createWithName: 'void'.
	setAccessor ).

    ^ addFormal: f = ( formals addNewFormal: f ).
    ^ addStmt: s = ( body addStmt: s ).

    ^ resultExpr: e = ( body resultExpr: e ).

    "miscellaneous access"
    ^ isPublic = ( privacy isPublic ).
    ^ isPrivate = ( privacy isPrivate ).

    ^ isEvalMethod = false.
    ^ isAbstract = ( body isAbstract ).
    ^ isAccessor = ( body isAccessor ).
    ^ isLocalAccessor = ( body isLocalAccessor ).
    ^ isInitSetAccessor = ( body isInitSetAccessor ).
    ^ isSetAccessor = ( body isSetAccessor ).
    ^ isGetAccessor = ( body isGetAccessor ).
    ^ isPrimitive = ( body isPrimitive ).
    ^ isClosure = ( body isClosure ).
    ^ methodTypeString = ( body methodTypeString ).

    ^ constraints = ( formals constraints ).
    ^ removeFromConstraints = ( formals removeFromConstraints: self ).
    ^ calculateConstrainedPositions = ( | i |
	constrainedPositions: constrainedPositions copyRemoveAll.
	i: 0.
	formals do: [ | :formal | 
	    formal isConstrained ifTrue: [
		constrainedPositions add: i.
	    ].
	    i: i succ.
	].
    ).

    "fields and methods will be initialized individually"
    { 'initialize body'
	^ initAccessorBody: defaultValue WithFieldKind: fieldKind = (
	    fieldKind isShared || [fieldKind isReadOnly] ifTrue: [ 
		body: cecil_get_accessor_body copy.
		fieldKind isReadOnly ifTrue: 
		    [body kind: 'read_only '].
		fieldKind isShared ifTrue: 
		    [body kind: 'shared '].
	    ] 
	    False: [ 
		body: cecil_local_get_accessor_body copy.
		fieldKind isInitOnly ifTrue: 
		    [body kind: 'init_only '].
	    ].
	    body setState: defaultValue.
	).

	^ initSetAccessorBody: defaultValue WithFieldKind: fieldKind = (	
	    fieldKind isReadOnly ifTrue: [
		error: 'shouldn\'t have a set accessor for a read only field'.
	    ].
	    fieldKind isShared ifTrue: [ 
		body: cecil_set_accessor_body copy. 
		body kind: 'shared '.
	    ] False: [
		fieldKind isInitOnly ifTrue: [ 
		    body: cecil_init_only_set_accessor_body copy.
		    body kind: 'init_only '.
		] False: [ 
		    body: cecil_local_set_accessor_body copy.
		    body kind: ''.
	    ] ]. 
	    body setState: defaultValue.
	).

	^ createMethodBody = ( body: cecil_method_body copy. ).
	^ createPrimMethodBody: str = (
	    body: cecil_prim_method_body copyString: str. ).
	^ createAbstractBody = ( body: cecil_abstract_body copy. ).

	^ setBodyText: str = ( | end . bodyString |
	    bodyString: str.
	    end: bodyString size - 1.
	    [(bodyString at: end) = '}' ]
		whileFalse: [ 
		  end: end - 1.
		].
	    bodyString: (bodyString copyFrom: 0 UpTo: end + 1).
	    "bodyString: headerPrintString, ' ', bodyString."
	    bodyText: textLines copyLines: bodyString.
	    bodyText detabify.
	  self ).
    }

    ^ calculateKey = (
	key: key copyFromMethod: self.
    ).

    ^ nestedLevel = ( enclosingContext nestedLevel ).

    ^ isPredefined = ( isPredefined_internal ).
    ^ isPredefined: flag = (
	isPredefined_internal: flag.
	resolvedContext == nil ifFalse: [
	    resolvedContext markPredefined.
	].
	self ).

    ^ resultType = ( resultTypeSpec type ).

    "the Cecil UI compares identities of boxes on the screen, so might
     compare a literal to a method"
    isLiteral = false.
| )


globals cecil_interp _AddSlotsIfAbsent: ( | cecil_method_body = () | )
globals cecil_interp _AddSlotsIfAbsent: ( | cecil_method_key = () | )
globals cecil_interp _AddSlotsIfAbsent: ( | token_location = () | )

globals cecil_interp _AddSlotsIfAbsent: ( | cecil_method_skeleton = () | )
cecil_method_skeleton _Define: ( |
    parent* = traits cecil_method.

    formals <- cecil_formal_list.
    resultTypeSpec <- cecil_undeclared_type_spec.

    body <- cecil_method_body.

    enclosingContext <- cecil_nested_context.  
    resolvedContext <- nil. "or cecil_nested_context"

    isPredefined_internal <- false.

    creationTime <- 'prototype'. "or 'static' or 'dynamic'"

    key <- cecil_method_key.
    constrainedPositions <- list.

    location <- token_location.

    "used when compiling"
    methodCName <- 'No C name yet'.
    methodCArgs <- 'No args yet'  " Will be a list ".
    bodyText <- 'no body text yet'.
| )


globals cecil_interp _AddSlotsIfAbsent: ( | cecil_method = () | )
cecil_method _Define: cecil_method_skeleton clone _AddSlots: ( |
    _ parent* = traits cecil_method.
    _ thisObjectPrints = true.    

    name <- ''.
    privacy <- cecil_unspecified_privacy.
    params <- cecil_formal_param_list.
| )


traits cecil_interp _AddSlotsIfAbsent: ( | cecil_eval_method = () | )
traits cecil_eval_method _Define: ( |
    parent* = traits cecil_method.

    printString = ( 'cecil_eval_method: ', resend.printString ).

    ^ copy = ( | method |
    	method: clone.
    	method formals: formals copy.
	method resultTypeSpec: resultTypeSpec copy.
	method constrainedPositions: constrainedPositions copy.

	"need to copy for closures, since parsed differently"
	method body: body copy.

	method creationTime: 'unknown'.
    	method ).

    ^ createEvalMethod: object WithContext: context = ( | newMethod |
	newMethod: copy.
	newMethod formals addClosureFormal: object.
	newMethod enclosingContext: context.
	newMethod resolvedContext:
	    cecil_nested_context createInContext: context.
	newMethod resolveNames: newMethod resolvedContext.
	newMethod ).

    name = 'eval'.
    privacy = cecil_unspecified_privacy. "always public"
    params = cecil_formal_param_list.	 "no parameters"

    isEvalMethod = true.
| )

globals cecil_interp _AddSlotsIfAbsent: ( | cecil_closure_body = () | )

globals cecil_interp _AddSlotsIfAbsent: ( | cecil_eval_method = () | )
cecil_eval_method _Define: cecil_method_skeleton clone _AddSlots: ( |
    _ parent* = traits cecil_eval_method.
    _ thisObjectPrints = true.    
    body <- cecil_closure_body.
| )


traits cecil_interp _AddSlotsIfAbsent: ( | cecil_optimized_eval_method = () | )
traits cecil_optimized_eval_method _Define: ( |
    parent* = traits cecil_eval_method.

    ^ printString = ( 'optimized ', resend.printString ).

    ^ createEvalMethod: object WithContext: context = (
	context creationTime = 'dynamic' ifTrue: [
	    error: 'shouldn\'t be called on an optimized_eval_method'.
	].
	resend.createEvalMethod: object WithContext: context ).

    ^ createOptimizedEvalMethodFrom: method AttachedTo: pseudoClosureParent
		InContext: context = ( | m |
	context creationTime != 'dynamic' ifTrue: [
	    error: 'should only happen in dynamic context'.
	].

	"make new method"
	m: copy.
	m enclosingContext: nil. "don't reference this!"
	m resolvedContext:  nil. "don't reference this!"

	"copy over info from static version of method"
	m formals: method formals copy.
	m resultTypeSpec: method resultTypeSpec copy.
	m body: method body.

	"initialize dynamic data"
	m formals addClosureFormal: pseudoClosureParent.

	m resolveNames: cecil_nested_context createInContext: context.

	m ).
| )

globals cecil_interp _AddSlotsIfAbsent: ( |
    cecil_optimized_eval_method = () | )
cecil_optimized_eval_method _Define: cecil_eval_method clone _AddSlots: ( |
    _ parent* = traits cecil_optimized_eval_method.
| )


" Method & Field Accessor Method Bodies "

traits cecil_interp _AddSlotsIfAbsent: ( | cecil_skeleton_body = () | )
traits cecil_skeleton_body _Define: ( |
    parent* = traits clonable.
    errHandlingParent* = mixins cecil_error_handling.

    isAbstract = false.
    isInitSetAccessor = false.
    isAccessor = false.
    isLocalAccessor = false.
    isSetAccessor = false.
    isGetAccessor = false.
    isPrimitive = false.
    isClosure = false.

    fullPrintString = ( ' ', printString ).

    methodTypeString = 'NormalMethod'.
| )

globals cecil_interp _AddSlotsIfAbsent: ( | cecil_skeleton_body = () | )
cecil_skeleton_body _Define: ( |
    _ parent* = traits cecil_skeleton_body.
| )


traits cecil_interp _AddSlotsIfAbsent: ( | cecil_code_body = () | )
traits cecil_code_body _Define: ( |
    parent* = traits cecil_skeleton_body.

    printString = ( | str. multi_line <- false. |
	str: startDelim, ' '.
	(stmts size +
		(resultExpr expr == cecil_no_result_node ifTrue: 0 False: 1))
	    > 1 ifTrue: [
	    str: str, '\n\t'.
	    multi_line: true.
	].
	stmts do: [ | :stmt |
	    str: str, stmt printString, ';'.
	    multi_line ifTrue: [ str: str, '\n\t' ].
	].
	str, resultExpr printString, ' ', endDelim ).
    startDelim = '{'.
    endDelim = '}'.

    copy = ( (resend.copy stmts: stmts copy) resultExpr: resultExpr copy ).

    addStmt: msg = ( stmts add: msg ).
| )

globals cecil_interp _AddSlotsIfAbsent: ( | cecil_code_body = () | )
cecil_code_body _Define: cecil_skeleton_body clone _AddSlots: ( |
    _ parent* = traits cecil_code_body.
    _ thisObjectPrints = true.
    stmts <- list.
    resultExpr <- cecil_AST_node.
| )

traits cecil_interp _AddSlotsIfAbsent: ( | cecil_method_body = () | )
traits cecil_method_body _Define: ( |
    parent* = traits cecil_code_body.
| )

globals cecil_interp _AddSlotsIfAbsent: ( | cecil_method_body = () | )
cecil_method_body _Define: cecil_code_body clone _AddSlots: ( |
    _ parent* = traits cecil_method_body.
    _ thisObjectPrints = true.
| )

traits cecil_interp _AddSlotsIfAbsent: ( | cecil_closure_body = () | )
traits cecil_closure_body _Define: ( |
    parent* = traits cecil_code_body.
    isClosure = true.
| )

globals cecil_interp _AddSlotsIfAbsent: ( | cecil_closure_body = () | )
cecil_closure_body _Define: cecil_code_body clone _AddSlots: ( |
    _ parent* = traits cecil_closure_body.
    _ thisObjectPrints = true.
| )

traits cecil_interp _AddSlotsIfAbsent: ( | cecil_nested_scope_body = () | )
traits cecil_nested_scope_body _Define: ( |
    parent* = traits cecil_code_body.
    startDelim = '('.
    endDelim = ')'.
| )

globals cecil_interp _AddSlotsIfAbsent: ( | cecil_nested_scope_body = () | )
cecil_nested_scope_body _Define: cecil_code_body clone _AddSlots: ( |
    _ parent* = traits cecil_nested_scope_body.
    _ thisObjectPrints = true.
| )


traits cecil_interp _AddSlotsIfAbsent: ( | cecil_prim_method_body = () | )
traits cecil_prim_method_body _Define: ( |
    parent* = traits cecil_skeleton_body.

    copyString: s = ( copy str: s ).

    printString = ( '{ \"...\" }' ).

    addStmt: msg = ( error: 'cannot add statements in a primitive method' ).
    resultExpr: e = ( error: 'cannot set return expr of a primitive method' ).

    isPrimitive = true.
| )

globals cecil_interp _AddSlotsIfAbsent: (| cecil_prim_method_body = () |)
cecil_prim_method_body _Define: cecil_skeleton_body clone _AddSlots: ( |
    _ parent* = traits cecil_prim_method_body.
    _ thisObjectPrints = true.
    str <- '<body of the primitive>'.
| )


traits cecil_interp _AddSlotsIfAbsent: ( | cecil_abstract_body = () | )
traits cecil_abstract_body _Define: ( |
    parent* = traits cecil_skeleton_body.

    printString = (
	'{ abstract', (returnsVoid ifTrue: ';' False: ''), ' }' ).

    addStmt: msg = ( error: 'cannot add statements in an abstract method' ).
    resultExpr: e = ( error: 'cannot set return expr of an abstract method' ).

    isAbstract = true.
| )

globals cecil_interp _AddSlotsIfAbsent: (| cecil_abstract_body = () |)
cecil_abstract_body _Define: cecil_skeleton_body clone _AddSlots: ( |
    _ parent* = traits cecil_abstract_body.
    _ thisObjectPrints = true.
    returnsVoid <- false.
| )


traits cecil_interp _AddSlotsIfAbsent: ( | cecil_accessor_place_holder = () | )
traits cecil_accessor_place_holder _Define: ( |
    parent* = traits clonable. 
    errHandlingParent* = mixins cecil_error_handling.

    printString = ( 'cecil accessor place holder -- ', name ).

    copy = ( clone constraintSpec: constraintSpec copy ).
    copyName: name Constraint: constraint = ( | newHolder |
	newHolder: copy.
	newHolder name: name.
	newHolder constraintSpec: constraint.
	newHolder value: value copy.
	newHolder ).

    key = ( name, '@', constraintSpec name ).
    cName = ( key ).
| )

globals cecil_interp _AddSlotsIfAbsent: ( |
    cecil_accessor_place_holder = () | )
cecil_accessor_place_holder _Define: ( |
    _ parent* = traits cecil_accessor_place_holder.
    _ thisObjectPrints = true.
    name <- ''. "name of the field"
    constraintSpec <- cecil_spec. "object that the field is attached to"
    value <- cecil_AST_node.
| )


traits cecil_interp _AddSlotsIfAbsent: ( | cecil_skeleton_accessor_body = () | )
traits cecil_skeleton_accessor_body _Define: ( |
    parent* = traits cecil_skeleton_body.
    printString = ( 'accessor_body -- ', key, ' := ', value printString ).
    copy = ( clone contents: contents copy ).
    setState: s = ( contents: s ).
    fieldName = ( contents name ).
    key = ( contents key ).
    value = ( contents value ).
    isAccessor = true.
    addStmt: msg = ( error: 'cannot add statements in a field method' ).
    resultExpr: e = ( error: 'cannot set return expr in a field method' ).
| )

globals cecil_interp _AddSlotsIfAbsent: ( |
    cecil_skeleton_accessor_body = () | )
cecil_skeleton_accessor_body _Define: cecil_skeleton_body clone _AddSlots: ( |
    _ parent* = traits cecil_skeleton_accessor_body.
    contents <- cecil_accessor_place_holder.   	"the initial expression"
    isPrimitive <- false.
    kind <- ''.
    fieldName <- 'No field name yet'.
| )

traits cecil_interp _AddSlotsIfAbsent: ( | cecil_get_accessor_body = () | )
traits cecil_get_accessor_body _Define: ( |
    parent* = traits cecil_skeleton_accessor_body.
    printString = ( 'cecil shared get accessor body' ).
    fullPrintString = (
	value == cecil_uninitialized_field_contents
	    ifTrue: '' False: [' := ', value printString] ).
    isGetAccessor = true.
    methodTypeString = 'SharedGetAccessor'.
| )

globals cecil_interp _AddSlotsIfAbsent: ( | cecil_get_accessor_body = () | )
cecil_get_accessor_body _Define: cecil_skeleton_accessor_body clone _AddSlots: ( |
    _ parent* = traits cecil_get_accessor_body.
| )

traits cecil_interp _AddSlotsIfAbsent: ( |
    cecil_local_get_accessor_body = () | )
traits cecil_local_get_accessor_body _Define: ( |
    parent* = traits cecil_get_accessor_body.
    printString = ( 'cecil local get accessor body' ).
    methodTypeString = 'GetAccessor'.
    isLocalAccessor = true.
| )

globals cecil_interp _AddSlotsIfAbsent: ( |
    cecil_local_get_accessor_body = () | )
cecil_local_get_accessor_body _Define: cecil_get_accessor_body clone _AddSlots: ( |
    _ parent* = traits cecil_local_get_accessor_body.
| )

traits cecil_interp _AddSlotsIfAbsent: ( | cecil_set_accessor_body = () | )
traits cecil_set_accessor_body _Define: ( |
    parent* = traits cecil_skeleton_accessor_body.
    printString = ( 'cecil shared set accessor body' ).
    fullPrintString = ''.
    isSetAccessor = true.
    methodTypeString = 'SharedSetAccessor'.
| )

globals cecil_interp _AddSlotsIfAbsent: ( | cecil_set_accessor_body = () | )
cecil_set_accessor_body _Define: cecil_skeleton_accessor_body clone _AddSlots: ( |
    _ parent* = traits cecil_set_accessor_body.
| )

traits cecil_interp _AddSlotsIfAbsent: ( |
    cecil_local_set_accessor_body = () | )
traits cecil_local_set_accessor_body _Define: ( |
    parent* = traits cecil_set_accessor_body.
    printString = ( 'cecil Local Set accessor body' ).
    methodTypeString = 'SetAccessor'.
    isLocalAccessor = true.
| )

globals cecil_interp _AddSlotsIfAbsent: ( |
    cecil_local_set_accessor_body = () | )
cecil_local_set_accessor_body _Define: cecil_set_accessor_body clone _AddSlots: ( |
    _ parent* = traits cecil_local_set_accessor_body.
| )

traits cecil_interp _AddSlotsIfAbsent: ( |
    cecil_init_only_set_accessor_body = () | )
traits cecil_init_only_set_accessor_body _Define: ( |
    parent* = traits cecil_local_set_accessor_body.
    printString = ( 'cecil init only accessor body' ).
    isInitSetAccessor = true.
| )

globals cecil_interp _AddSlotsIfAbsent: ( |
    cecil_init_only_set_accessor_body = () | )
cecil_init_only_set_accessor_body _Define: cecil_local_set_accessor_body clone _AddSlots: ( |
    _ parent* = traits cecil_init_only_set_accessor_body.

| )

