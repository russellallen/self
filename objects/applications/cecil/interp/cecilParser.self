"Sun-$Revision: 9.1 $"

"parsing the tokens into cecil objects"

traits cecil_interp _AddSlotsIfAbsent: ( | cecil_parser = () | )
traits cecil_parser _Define: ( |
    parent* = traits clonable.
    errHandlingParent* = mixins cecil_error_handling.
    printString = 'cecil_parser'.

    copy = ( | newParser. |
	newParser: clone.
    	newParser pastTokens: pastTokens copy.
    	newParser futureTokens: futureTokens copy.
	newParser anonList: anonList copyRemoveAll.
    	newParser ).

    createOn: scanner Interpreter: interp = (  | newParser |
    	newParser: copy.
	newParser scanner: scanner.
	newParser interp: interp.
    	newParser advance.
    	newParser ).

    "*******************************
     *	   Top-Level Parsing       *
     *******************************"

    parseDecls = ( | decls |
	" text files can contain only decls "
	decls: declBlock.
	isEOF ifFalse: [
	    syntaxErr: 'expecting only declarations'
	].
	decls ).

    parseDeclsStmtsAndExprs = ( | asts |
	" the read-eval-print loop can handle decls, stmts, and exprs "
	asts: cecil_expr_list copyRemoveAll.
	[ | :exit. decls. expr. |
	    decls: declBlock. " try to parse a declaration block "
	    decls nonEmpty ifTrue: [ asts add: decls ].
	    isEOF ifTrue: exit.
	    expr: getExpr.
	    isEOF not && [getDelimiter: ':='] ifTrue: [
		"assigment statements are allowed in readEvalPrint loop"
		expr: getRestOfAssignStmt: expr.
	    ].
	    isEOF ifFalse: [ getRequiredDelimiter: ';' ].
	    asts add: expr.
	] loopExit.
	asts ).

    declBlock = ( | decls |
	"parse a sequence of declarations"
	decls: cecil_decl_block copyRemoveAll.
	[ declInto: decls ] whileTrue.
	decls ).

    declInto: decls = (
        isVarDecl ifTrue: [
	    varDeclInto: decls.
	    ^ true ].
	isObjectDecl ifTrue: [
	    objectDeclInto: decls.
	    ^ true ].
	isObjectExtensionDecl ifTrue: [
	    objectExtensionDeclInto: decls.
	    ^ true ].
	isPredicateObjectDecl ifTrue: [
	    predicateObjectDeclInto: decls.
	    ^ true ].
	isMethodDecl ifTrue: [
	    nestedLevel: nestedLevel succ.
	    fastParse ifTrue: [
		cecilWarning: 'Shouldn\'t have a method in a fast parse file'.
		methodDeclInto: decls.
	    ] False: [
		methodDeclInto: decls.
	    ].
	    nestedLevel: nestedLevel pred.
	    (nestedLevel = 0) && (fastParse not) ifTrue: [
		decls addAll: anonList.
		anonList: anonList copyRemoveAll.
	    ].
	    ^ true ].
	isFieldDecl ifTrue: [
	    fieldDeclInto: decls.
	    ^ true ].
	isIncludeDecl ifTrue: [
	    includeDeclInto: decls.
	    ^ true ].
	isAnonObjectDecl ifTrue: [
	    anonObjectDeclInto: decls.
	    ^ true ].
	"no decls"
	false ).


    "*******************************
     *	     INCLUDE  DECLS        *
     *******************************"

    isIncludeDecl = (
	saveExcursion: [
	    (isReservedWord: 'include') ||
	    [(getReservedWord: 'prim') && [isReservedWord: 'include']]] ).

    includeDeclInto: decls = ( | isPrim. fileName. includeNode. |
	isPrim: getReservedWord: 'prim'.
	getRequiredReservedWord: 'include'.
	isString ifFalse: [ 
	    syntaxErr: 'a string is expected for include file name'.
	].
	fileName: getLiteralObj basic_value.
	getRequiredDelimiter: ';'.
	isPrim ifTrue: [
	    decls add: cecil_prim_include_node copyName: fileName.
	] False: [
	    decls addAll: interp parseFile: fileName.
	].
    ).

    isAnonObjectDecl = ( isReservedWord: 'anon_obj_info' ).
    anonObjectDeclInto: decls = ( | obj.  savedFake |
	getRequiredReservedWord: 'anon_obj_info'.
	savedFake: fakeTypeParams.
	fakeTypeParams: true.
	obj: objectExpr: false.
	fakeTypeParams: savedFake.
	decls add: cecil_anon_obj_info_node copyWithExpr: obj.
	getRequiredDelimiter: ';'.
    ).


    "*******************************
     *	     VARIABLE DECLS        *
     *******************************"

    isVarDecl = ( isReservedWord: 'var' ).

    varDeclInto: decls = ( | name. params. typeSpec. binding. |
	getRequiredReservedWord: 'var'.

	isName ifFalse: [ syntaxErr: 'expecting an identifier' ].
	name: getName.
	typeSpec: getOptionalTypeSpec.

	binding:
	    (getDelimiter: '=') ifTrue: [ 
	        cecil_constant_binding copyName: name.
	    ] False: [
	        (getDelimiter: ':=') ifTrue: [
		    cecil_var_binding copyName: name.
	        ] False: [
		    ^syntaxErr: 'expecting an initializer'.
	        ].
	    ].

	binding location: currentLocation.
	binding file: interp rootFileName.
	binding fullFile: interp fullFileName.

	binding typeSpec: typeSpec.
	binding value: getExpr.

	getRequiredDelimiter: ';'.

	decls add: cecil_decl_node copyWithBinding: binding.
    ).


    "******************************
     *     OBJECT DECL & EXPR     *
     ******************************"

    isObjectDeclOrExpr = ( | which. |
	saveExcursion: [ | :return |	"could use unwind-protect here"
	    isObjectKind ifTrue: [
		advance.
		isObjectOrType ifFalse: [
		    syntaxErr: '"object" or "type" is expected'.
		].
	    ] False: [
		isObjectOrType ifFalse: [
		    return value: 'neither'
		].
	    ].
	    advance.
	    isName ifTrue: 'decl' False: 'expr' ] ).

    isObjectDecl = ( isObjectDeclOrExpr = 'decl' ).
    isObjectExpr = ( isObjectDeclOrExpr = 'expr' ).

    isObjectKind = (
	( isReservedWord: 'concrete') ||
	[(isReservedWord: 'template') ||
	[ isReservedWord: 'abstract']]).

    isObjectOrType = (
	(isReservedWord: 'object') || [isReservedWord: 'type'] ).

    objectDeclInto: decls = ( | obj. binding. where. |
	where: currentLocation.
	obj: cecil_object_decl_node copy.
	obj location: where.
	isObjectKind ifTrue: [
	    obj setKind: getName.
	].
	(getReservedWord: 'object') ifTrue: [
	    " an object "
	    " nothing to do (the default) "
	] False: [
	    (getReservedWord: 'type') ifTrue: [
		" an object and a type "
		obj setType.
	    ] False: [
		syntaxErr: '"object" or "type" is expected'.
	    ].
	].
	isName ifFalse: [
	    syntaxErr: 'expecting an object name'.
	].
	obj name: getName.
	obj params: getFormalParams.
	ancestry: obj.	
	getRequiredDelimiter: ';'.

	binding: cecil_object_binding copyName: obj name WithValue: obj.
	binding location: where.
	binding file: interp rootFileName.
	binding fullFile: interp fullFileName.

	decls add: cecil_decl_node copyWithBinding: binding.
    ).

    objectExpr: addToAnonList = ( | obj |
	obj: cecil_object_expr_node copy.
	obj location: currentLocation.
	isObjectKind ifTrue: [
	    obj setKind: getName.
	].
	(getReservedWord: 'object') ifTrue: [
	    " an object "
	    " nothing to do (the default) "
	] False: [
	    (getReservedWord: 'type') ifTrue: [
		" an object and a type "
		obj setType.
	    ] False: [
		syntaxErr: '"object" or "type" is expected'.
	    ].
	].
	ancestry: obj.
	(nestedLevel > 0) && addToAnonList ifTrue: [
	    " Only add objectExprs nested within methods "
	    anonList add: cecil_anon_obj_info_node copyWithExpr: obj.
	].
	obj ).

    ancestry: obj = ( 
	[(isaDecl: obj) || [inheritsDecl: obj] || [subtypesDecl: obj]]
	    whileTrue.
	getFieldInitDecls: obj.
    ).

    isaDecl: obj = (
    	(getReservedWord: 'isa') ifFalse: [ ^false ].
    	[ obj isaSpecs add: getFormalConstraint ]
	    untilFalse: [ getDelimiter: ',' ].
        true ).

    inheritsDecl: obj = (
    	(getReservedWord: 'inherits') ifFalse: [ ^false ].
    	[ obj parentSpecs add: getFormalConstraint ]
	    untilFalse: [ getDelimiter: ',' ].
        true ).

    subtypesDecl: obj = (
    	(getReservedWord: 'subtypes') ifFalse: [ ^false ].
	[ obj supertypeSpecs add: getFormalTypeSpec ]
	    untilFalse: [ getDelimiter: ',' ].
        true ).

    getFieldInitDecls: obj = (	
	(getDelimiter: '{') ifTrue: [
	    [ obj fieldInitDecls add: getFieldInit ]
		untilFalse: [ getDelimiter: ',' ].
	    getRequiredDelimiter: '}'.
	].	    
    ).
   
    getFieldInit = ( | name. location. proto. fnode. where. |
	where: currentLocation.
    	isName ifFalse: [ 
	    syntaxErr: 'expecting an identifier for field initializations'.
	].
	name: getName.
	(getDelimiter: '@') ifTrue: [ 
	    location: getConstraint.
	] False: [
	    location: cecil_unspecified.
	].
	(getDelimiter: ':=') ifTrue: [ 
	    proto: cecil_field_init_assign_node.
	] False: [ 
	    (getDelimiter: '=') ifTrue: [
		proto: cecil_field_init_constant_node.
	    ] False: [
		syntaxErr: 'expecting a ":=" or "="'.
	    ].
	].
	fnode: proto copyName: name Constraint: location WithExpr: getExpr.
	fnode location: where.
	fnode ).


    "******************************
     *   Object Extension Decl    *
     ******************************"

    isObjectExtensionDecl = (
	saveExcursion: [ | :return |
	    isName ifFalse: [ return value: false ].
	    advance.
	    getDeclParams.
	    (isReservedWord: 'isa') || 
	    [(isReservedWord: 'inherits') || 
		[isReservedWord: 'subtypes']]] ).

    objectExtensionDeclInto: decls = ( | obj |
	obj: cecil_object_extension_decl_node copy.
	isName ifFalse: [
	    syntaxErr: 'expecting an object name'.
	].
	obj name: getName.
	obj params: getDeclParams.
	ancestry: obj.
	getRequiredDelimiter: ';'.
	decls add: cecil_extension_decl_node copyWithValue: obj.
    ).


    "******************************
     *     Predicate Objects      *
     ******************************"

    isPredicateObjectDecl = ( isReservedWord: 'pred' ).

    predicateObjectDeclInto: decls = ( | obj. binding. where. |
	obj: cecil_predicate_decl_node copy.
	(getReservedWord: 'pred') ifFalse: [
	    syntaxErr: '"pred" is expected'.
	].
	where: currentLocation.
	isName ifFalse: [
	    syntaxErr: 'expecting an object name'.
	].
	obj name: getName.
	ancestry: obj.
	(getReservedWord: 'when') ifTrue: [
	    obj when: getExpr.
	].
	getRequiredDelimiter: ';'.
	binding: cecil_object_binding copyName: obj name WithValue: obj.
	binding location: where.
	binding file: interp rootFileName.
	binding fullFile: interp fullFileName.

	decls add: cecil_decl_node copyWithBinding: binding.
    ).


    "*******************************
     *	        FIELD              *
     *******************************"

    isFieldDecl = (
	saveExcursion: [
	    (isReservedWord: 'field') ||
	    [isFieldKind ||
		[(getFieldPrivacyDecl || [getReservedWord: 'prim']) &&
			[isFieldDecl]]]] ).

    isFieldKind = (
	(isReservedWord: 'shared') || 
	[(isReservedWord: 'read_only') || [isReservedWord: 'init_only']] ).

    isPrivacyDecl = (
	(isReservedWord: 'private') || [isReservedWord: 'public'] ).

    getPrivacyDecl = (
	(getReservedWord: 'private') || [getReservedWord: 'public'] ).

    getFieldPrivacyDecl = ( getPrivacyDecl && [getGetOrPut. true] ).

    isGetOrPut = (
	(isReservedWord: 'get') || [isReservedWord: 'put'] ).

    getGetOrPut = (
	(getReservedWord: 'get') || [getReservedWord: 'put'] ).


    fieldDeclInto: decls = ( | privacy. fieldKind. accessor. defaultValue. |
	getReservedWord: 'prim'.	"ignore this for now"
	privacy: getFieldPrivacy.
	fieldKind: getFieldKind.
	getRequiredReservedWord: 'field'.
	accessor: fieldHeader.
	defaultValue: fieldBody: accessor FieldKind: fieldKind.
	createAccessors: accessor WithPrivacy: privacy 
	    WithFieldKind: fieldKind WithDefaultValue: defaultValue Into: decls.
    ).


    getFieldPrivacy = ( | privacy |
	privacy: cecil_field_privacy_holder copy.
	getFieldPrivacy: privacy. 
	privacy ).

    getFieldPrivacy: privacy = ( | mode |
	(getReservedWord: 'private') ifTrue: [ 
	    mode: cecil_private.
	] False: [
	    (getReservedWord: 'public') ifTrue: [ 
		mode: cecil_public.
	    ] False: [
		^ self.
	    ].
	].
	(getReservedWord: 'get') ifTrue: [ 
	    privacy setGetPrivacy: mode.
	] False: [
	    (getReservedWord: 'put') ifTrue: [
		privacy setPutPrivacy: mode.
	    ] False: [
		"set them both"
		privacy setGetPrivacy: mode.
		privacy setPutPrivacy: mode.
		^ self.
	    ].
	].
	"if just for get or put, try getting privacy of other accessor"
	isPrivacyDecl ifTrue: [
	    getFieldPrivacy: privacy.
	].
    ).

    getFieldKind = ( | fieldKind |
	fieldKind: cecil_field_kind copy.
	(getReservedWord: 'shared') ifTrue: [
	    fieldKind setShared.
	    ^ fieldKind.
	].
	(getReservedWord: 'read_only') ifTrue: [
	    fieldKind setReadOnly.
	    ^ fieldKind.
	].
	(getReservedWord: 'init_only') ifTrue: [
	    fieldKind setInitOnly.
	    ^ fieldKind.
	].
	fieldKind ).


    fieldHeader = ( | accessor |
	accessor: methodHeader.
	accessor formals size != 1 ifTrue: [
	    syntaxErr: 'A field must have exactly one argument'. 
	].
	accessor formals first isConstrained ifFalse: [
	    syntaxErr: 'The argument of a field must be constrained'.
	].
	accessor ).


    fieldBody: accessor FieldKind: fieldKind = (
	(getDelimiter: '{') ifTrue: [
	    getRequiredReservedWord: 'abstract'.
	    accessor createAbstractBody.
	    getRequiredDelimiter: '}'.
	    getDelimiter: ';'. "optional"
	    nil
	] False: [ | defaultValue |
	    defaultValue: cecil_accessor_place_holder copyName: accessor name
		Constraint: accessor formals first constraintSpec.
	    "field initialization"    	    
	    (getDelimiter: '=') || [getDelimiter: ':='] ifTrue: [ 
		defaultValue value: getExpr.
	    ] False: [
		defaultValue value: cecil_uninitialized_field_contents.
	    ].
	    getRequiredDelimiter: ';'.
	    accessor initAccessorBody: defaultValue WithFieldKind: fieldKind.
	    defaultValue
	] ).


    createAccessors: accessor WithPrivacy: privacy WithFieldKind: fieldKind
		WithDefaultValue: defaultValue Into: decls = ( 
	| accessors.  cName. |
	accessors: list copyRemoveAll.
	cName: accessor name, '@', accessor formals first constraintSpec name.

	"add the get accessor"
	accessor privacy: privacy getGetPrivacy.
	accessor isAccessor ifTrue: [
	    accessor body fieldName: cName.
	].
	accessors add: accessor.

	fieldKind isReadOnly not ifTrue: [
	    accessor isAbstract || [fieldKind isShared] ifFalse: [ | a. |
		"create the internal init set accessor"
		
		a: accessor
		    copyForSetAccessor: '{init_set_', accessor name, '}'
		    WithPrivacy: privacy getPutPrivacy 
		    WithFieldKind: cecil_field_kind copy setInitOnly
		    WithDefaultValue: defaultValue.
		accessor isAccessor ifTrue: [
		    a body fieldName: cName.
		].
		accessors add: a.
	    ].

	    fieldKind isInitOnly not ifTrue: [ | a. |
		"create the normal set accessor"
		a: accessor
		    copyForSetAccessor: 'set_', accessor name
		    WithPrivacy: privacy getPutPrivacy 
		    WithFieldKind: fieldKind
		    WithDefaultValue: defaultValue.
		accessor isAccessor ifTrue: [
		    a body fieldName: cName.
		].
		accessors add: a.
	    ].
	].

	decls add:
	    cecil_field_info_node copyWithName: accessor name 
	    Kind: fieldKind Object: (accessor formals first constraintSpec).

	"convert the methods into method declarations"
	accessors do: [ | :a |
	    decls add: cecil_method_node copyWithMethod: a.
	].
    ).


    "*******************************
     *	       METHOD              *
     *******************************"

    isMethodDecl = (
	saveExcursion: [
	    (isReservedWord: 'method') ||
	    [(getPrivacyDecl || [getReservedWord: 'prim']) && [isMethodDecl]]]).

    methodDeclInto: decls = (
	| isPrim. privacy. method. mnode. where. begin. end. |
	isPrim: getReservedWord: 'prim'.
	privacy: getMethodPrivacy.
	getRequiredReservedWord: 'method'.
	where: currentLocation.
	method: methodHeader.
	method privacy: privacy.
	begin: scanner inputPosition - 1.
	isPrim ifTrue: [
	    primMethodBody: method.
	] False: [
	    methodBody: method.
	].
	end: scanner inputPosition.
	method setBodyText: scanner input copyFrom: begin UpTo: end. 
	getDelimiter: ';'. "optional"
	mnode: cecil_method_node copyWithMethod: method.
	mnode location: where.
	decls add: mnode.
    ).

    getMethodPrivacy = (
	(getReservedWord: 'private') ifTrue: [ cecil_private ] False: [
	    (getReservedWord: 'public') ifTrue: [ cecil_public ] False: [
		cecil_unspecified_privacy ] ] ).

    skipMethodDecl = ( | cnt |
	[ thisToken name != '{' ] whileTrue: [
	    isEOF ifTrue: [ 
		^ syntaxErr: 'EOF encountered while skipping method'
	    ].
	    advance.
	].
	getRequiredDelimiter: '{'.
	cnt: 1.
	[ cnt != 0 ] whileTrue: [
	    thisToken name = '{' ifTrue: [ cnt: cnt succ ] False: [
		thisToken name = '}' ifTrue: [ cnt: cnt pred ]
	    ].
	    advance
	].
	getDelimiter: ';'. "optional"
    ).

    methodBody: method = ( | begin . end . bodyString |
	getRequiredDelimiter: '{'.
	(getReservedWord: 'abstract') ifTrue: [
	    "abstract methods"
	    method createAbstractBody.
	    interp explicitVoid ifTrue: [
		getDelimiter: ';'. "optional"
	    ] False: [
		(getDelimiter: ';') ifTrue: [
		    "marks the method as not returning a value"
		    method body returnsVoid: true.
		].
	    ].
	    getRequiredDelimiter: '}'.
	] False: [
	    "normal methods with code"
	    method createMethodBody.
	    getStatements: method EndsWith: '}'.
	].
    ).

    primMethodBody: method = ( | self_code. c_code. |
	getRequiredDelimiter: '{'.
	isString ifFalse: [ 
	    syntaxErr: 'a string is expected for primitive body'.
	].
	self_code: getLiteralObj basic_value.
	isString ifFalse: [ 
	    syntaxErr: 'two strings are expected for primitive body'.
	].
	c_code: getLiteralObj basic_value.
	getRequiredDelimiter: '}'.
	
	method createPrimMethodBody: 
	    interp doCompile ifTrue: c_code False: self_code.
    ).


    "*******************************
     *	   Decls and formals       *
     *******************************"

    methodHeader = ( | method. isB. |
	method: cecil_method copy.
	method creationTime: 'parser'.

	isName || [isBinary] ifFalse: [
	    syntaxErr: 'expecting the name of a method or field'.
	].

	isB: isBinary.

	method location: currentLocation.
	method name: getName.
	method params: getFormalParams.
	method formals: getFormals.
	method resultTypeSpec: getOptionalResultTypeSpec.

	isB ifTrue: [
	    method formals size != 2 ifTrue: [
		syntaxErr: 'An infix operator requires exactly 2 arguments'. 
	    ].
	].

	method ).

    getFormals = ( | formals |
	getRequiredDelimiter: '('.
	formals: getFormalDecls.
    	getRequiredDelimiter: ')'.
	formals ).

    getFormalDecls = ( | formals |
	formals: cecil_formal_list copyRemoveAll.
	(isDelimiter: ')') ifFalse: [ 
    	    [ formals add: formalDecl ] untilFalse: [ getDelimiter: ',' ].
	].
	formals ).

    formalDecl = ( | newFormal |
    	isName ifTrue: [
	    newFormal: cecil_formal copyWithName: getName.
	] False: [
	    "anonymous formal argument -- a formal without a name"
	    newFormal: cecil_anonymous_formal copy.
	].
	(getDelimiter: '@') ifTrue: [
	    (getDelimiter: ':') ifTrue: [ | constraintSpec |
		"constrained and type-declared by the same thing"
		constraintSpec: getFormalConstraint.
		newFormal constraintSpec: constraintSpec.
		newFormal typeSpec: constraintSpec asTypeSpec.
	    ] False: [ 
		"constrained; may have a separate type declaration, too"
		newFormal constraintSpec: getFormalConstraint.
		newFormal typeSpec: getOptionalFormalTypeSpec.
	    ].
	] False: [
	    "unconstrained; may have a type declaration, though"
	    newFormal typeSpec: getOptionalFormalTypeSpec.
	].
	newFormal ).

    getFormalConstraint = ( getConstraint: true ).
    getConstraint = ( getConstraint: false ).
    getConstraint: isFormal = ( | name. params. spec. |
    	isName ifFalse: [
	    syntaxErr: 'expecting an object name'.
	].
	name: getName.
	params: getParams: isFormal.
	spec: cecil_named_object_spec createWithName: name Params: params.
	spec location: currentLocation.
	spec ).


    "*******************************
     *	        TYPE SPECS         *
     *******************************"

    " parse type decls "
    getOptionalFormalTypeSpec = ( getOptionalTypeSpec: true ).
    getOptionalTypeSpec = ( getOptionalTypeSpec: false ).
    getOptionalTypeSpec: isFormal = (
	(getDelimiter: ':')
	    ifTrue: [ getTypeSpec: isFormal ]
	     False: [ cecil_undeclared_type_spec ]
    ).
    getOptionalResultTypeSpec = ( getOptionalResultTypeSpec: false ).
    getOptionalResultTypeSpec: isFormal = (
	(getDelimiter: ':')
	    ifTrue: [ getResultTypeSpec: isFormal ]
	     False: [ cecil_undeclared_type_spec ]
    ).

    getResultTypeSpec: isFormal = (
	(getReservedWord: 'void') ifTrue: [ | ts |
	    ts: cecil_named_type_spec createWithName: 'void'.
	    ts location: currentLocation.
	    ^ ts
	].
	getTypeSpec: isFormal ).

    getFormalTypeSpec = ( getTypeSpec: true ).
    getTypeSpec = ( getTypeSpec: false ).
    getTypeSpec: isFormal = ( getDisjunctionTypeSpec: isFormal ).

    getDisjunctionTypeSpec: isFormal = ( | ts |
	ts: getConjunctionTypeSpec: isFormal.
	[ getDelimiter: '|' ] whileTrue: [ | ts2 |
	    ts2: getConjunctionTypeSpec: isFormal.
	    ts: cecil_lub_type_spec createFrom: ts And: ts2.
	].
	ts ).

    getConjunctionTypeSpec: isFormal = ( | ts |
	ts: getSimpleTypeSpec: isFormal.
	[ getDelimiter: '&' ] whileTrue: [ | ts2 |
	    ts2: getSimpleTypeSpec: isFormal.
	    ts: cecil_glb_type_spec createFrom: ts And: ts2.
	].
	ts ).

    getSimpleTypeSpec: isFormal = ( | ts |
	(getDelimiter: '&') ifTrue: [
	    ts: cecil_closure_type_spec copy.
	    getRequiredDelimiter: '('.
	    (getDelimiter: ')') ifFalse: [
		[ ts argSpecs add: getTypeSpec: isFormal
		] untilFalse: [ getDelimiter: ',' ].
		getRequiredDelimiter: ')'.
	    ].
	    ts resultTypeSpec: getOptionalResultTypeSpec: isFormal.
	    ^ ts
	].
	isName ifTrue: [
	    ts: cecil_named_type_spec createWithName: getName.
	    fakeTypeParams ifTrue: [
		ts name: 'any'
	    ].
	    ts params: getParams: isFormal.
	    ts location: currentLocation.
	    ^ ts
	].
	(getDelimiter: '`') ifTrue: [
	    isName ifFalse: [ syntaxErr: 'expecting an identifier' ].
	    isFormal ifFalse: [
		syntaxErr: 'cannot use a binding type spec in this context' ].
	    ts: cecil_type_var_spec createWithName: getName.
	    getSubtypeConstraint ifTrue: [
		ts upperBound: getTypeSpec: isFormal.
	    ] False: [
		getSupertypeConstraint ifTrue: [
		    ts lowerBound: getTypeSpec: isFormal.
		].
	    ].
	    ^ ts
	].
	(getDelimiter: '(') ifTrue: [
	    ts: getTypeSpec: isFormal.
	    getRequiredDelimiter: ')'.
	    ^ ts
	].
	syntaxErr: 'expecting a type'.
    ).


    " parse parameter lists "

    getDeclParams   = ( getParams: true ).
    getActualParams = ( getParams: false ).
    getParams: isFormal = ( | params |
	params: cecil_param_list copyRemoveAll.
	(getDelimiter: '[') ifTrue: [
	    [ params add: getTypeSpec: isFormal ] untilFalse: [
	      getDelimiter: ',' ].
	    getRequiredDelimiter: ']'.
	].
	params ).
	    
    getFormalParams = ( | params |
	params: cecil_formal_param_list copyRemoveAll.
	(getDelimiter: '[') ifTrue: [
	    [ params addNewFormalParam: getFormalParam ]
	        untilFalse: [ getDelimiter: ',' ].
	    getRequiredDelimiter: ']'.
	].
	params ).

    getFormalParam = ( | ts |
	getDelimiter: '`'.	" optional "
	isName ifFalse: [ syntaxErr: 'expecting an identifier' ].
	ts: cecil_type_var_spec createWithName: getName.
	getSubtypeConstraint ifTrue: [
	    ts upperBound: getTypeSpec.
	] False: [
	    getSupertypeConstraint ifTrue: [
		ts lowerBound: getTypeSpec.
	    ].
	].
	ts ).


     "******************************
      *	       Code Bodies         *
      ******************************"

    getStatements: method EndsWith: terminator = (
	(getDelimiter: terminator) ifTrue: [
	    " empty body; 'returns' void "
	    method resultExpr:
		cecil_return_node copyWithExpr: cecil_no_result_node.
	] False: [
	    " parse statements, final return expr (if present), and terminator "
	    [ getStatementOrReturn: method EndsWith: terminator ] whileFalse.
	].
	method ).

    getStatementOrReturn: method EndsWith: terminator = ( | decls |
	(getDelimiter: '^') ifTrue: [ | expr. where. noResult. |
	    where: currentLocation.
	    (interp explicitVoid && [getReservedWord: 'void']) ||
	    [(isDelimiter: ';') || [isDelimiter: terminator]] ifTrue: [
		" no return value "
		expr: cecil_no_result_node.
		getDelimiter: ';'.	"optional"
	    ] False: [
		" must be returning a value "
		expr: getExpr.
		interp explicitVoid ifTrue: [
		    getDelimiter: ';'.	"optional"
		].
	    ].
	    getRequiredDelimiter: terminator.
	    method resultExpr: cecil_nonlocal_return_node copyWithExpr: expr.
	    method body resultExpr location: where.
	    ^ true.
	].

	"check for some decls"
	decls: declBlock.
	decls nonEmpty ifTrue: [
	    "found some decls (and ate the ';')"
	    "add the decl block to the method as a single statement"
	    method addStmt: decls.

	] False: [ | astNode |
	    interp explicitVoid ifTrue: [
		(getReservedWord: 'void') ifTrue: [
		    getDelimiter: ';'.  "optional"
		    getRequiredDelimiter: terminator.
		    method resultExpr:
			cecil_return_node copyWithExpr: cecil_no_result_node.
		    ^ true
		].
	    ].

	    "hard to tell difference between assignment and expr;
	     both can start out the same "

	    "trick: assignments start out with what looks like an expression,
	     so read an expression, then see if it's followed by a :=, and 
	     figure things out from there "

	    astNode: getExpr.

	    (getDelimiter: ':=') ifTrue: [
		interp assignAsExpr ifTrue: [
		    error: 'shouldn\'t be here'.
		].
		astNode: getRestOfAssignStmt: astNode.
		getRequiredDelimiter: ';'.
	    ] False: [
	        "an expression;
		 check if this is a statement or the final return expr "
		interp explicitVoid ifTrue: [ | hasSemi |
		    "new syntax for result expressions"
		    hasSemi: getDelimiter: ';'. "optional, if followed by '}'"
		    (getDelimiter: terminator) ifTrue: [
			"last statement; returns result of last statement"
			method resultExpr:
			    cecil_return_node copyWithExpr: astNode.
			^ true
		    ].
		    "must be an interior statement"
		    hasSemi ifFalse: [
			syntaxErr: 'unexpected token'.
		    ].
		    astNode isEffectExpression ifFalse: [
			syntaxErr: 'simple expression used as a statement'.
		    ].
		] False: [
		    "old syntax"
		    (getDelimiter: ';') ifTrue: [
			" a statement "
			astNode isEffectExpression ifFalse: [
			    syntaxErr: 'simple expression used as a statement'.
			].
		    ] False: [
			" the normal return "
			getRequiredDelimiter: terminator.
			method resultExpr: 
			    cecil_return_node copyWithExpr: astNode.
			^ true
		    ].
		].
	    ].

	    method addStmt: astNode.
	].

	(getDelimiter: terminator) ifTrue: [
	    " last statement isn't an expression; return void "
	    method resultExpr:
		cecil_return_node copyWithExpr: cecil_no_result_node.
	    ^ true
	].

	"more statements to go"
	false ).

    getRestOfAssignStmt: lhsAstNode = ( | astNode. where. |
	where: currentLocation.
	lhsAstNode isVarNode ifTrue: [
	    " a normal assignment to a variable "
	    astNode: cecil_assign_node copyName: lhsAstNode name.
	] False: [
	    " syntactic sugar for a message send "
	    lhsAstNode isSugarMsg ifTrue: [
	        "sugar_assign -- 
		 t1.name := t2 translates into
		 set_name(t1, t2) "
		astNode: cecil_sugar_assign_msg_node 
		    copyName: 'set_', lhsAstNode msgName 
		    WithExprs: lhsAstNode exprs.
	    ] False: [
		lhsAstNode isBinaryMsg ifTrue: [
		    "sugar_assign -- 
		     t1 binary t2 := t3 translates into
		     set_binary(t1, t2, t3) "
		    astNode: cecil_sugar_binary_assign_msg_node 
			copyName: 'set_', lhsAstNode msgName 
			WithExprs: lhsAstNode exprs.
		] False: [
		    syntaxErr: 'cannot assign to that kind of expression'.
		].
	    ].
	].
	" now read the rhs "
	astNode add_expr: getExpr.
	astNode location: where.
	astNode ).


     "******************************
      *	        Expression         *
      ******************************"

    getExpr = ( | expr |
	expr: realGetExpr.
	interp assignAsExpr ifTrue: [
	    "assignments are expressions in this alternative language"
	    "assignment is a right-associative operator"
	    [ getDelimiter: ':=' ] whileTrue: [
		expr: getRestOfAssignStmt: expr.
	    ].
	].
	expr ).
	
    realGetExpr = ( | operandStack. operatorStack. |
	operatorStack: list copyRemoveAll.
	operandStack:  list copyRemoveAll.

	[ | :exit1 |
	    operandStack addFirst: getSimpleExpr.

	    isBinary ifFalse: exit1.	"done parsing binary operator"

	    "reduce all stacked binary operators with higher precedence than
	     the current binary operator"
	    [ | :exit2. topOperator. left. right. |
		operatorStack isEmpty ifTrue: exit2. "nothing to reduce"

		" compare precedences and associativities of this operator
		 and previous binary op "

		topOperator: operatorStack first.

		"check for errors, if need to explicitly parenthesize"
		thisToken definedPrecedence && 
		    [topOperator definedPrecedence] ifFalse: [
		    syntaxErr: 'must explicitly parenthesize operators ',
			'with unknown precedence'
		].
		(thisToken samePrecedenceAs: topOperator) &&
		    [thisToken definedAssociativity not ||
		    [thisToken nonAssociative]] ifTrue: [
		    syntaxErr: 'must explicitly parenthesize ',
			'operators without associativity'.
		].

		(thisToken higherPrecedenceThan: topOperator) ||
		[(thisToken samePrecedenceAs: topOperator) &&
			[thisToken rightAssociative]] ifTrue:
		    "don't reduce stacked operator; new operator binds tighter"
		    exit2.

		"reduce topmost stacked binary operator"
		       operatorStack removeFirst.
		right: operandStack  removeFirst.
		left:  operandStack  removeFirst.
		operandStack addFirst:
		    cecil_bin_msg_node copyName: topOperator name
		        With: left With: right.

		"check for more reductions"
	    ] loopExit.

	    "push binary operator on stack"
	    operatorStack addFirst: thisToken.
	    advance.

	    "loop, grabbing argument to binary operator"
	] loopExit.

	"reduce stacked binary operators"
	[operatorStack isEmpty] whileFalse: [
	    | operator. left. right. |
	    operator: operatorStack removeFirst.
	    right:    operandStack  removeFirst.
	    left:     operandStack  removeFirst.
	    operandStack addFirst:
	        cecil_bin_msg_node copyName: operator name
		    With: left With: right.
	].

	operandStack size = 1 ifFalse: [ 
	    error: 'didn\'t collapse operand stack to a single result'
	].

	operandStack first ).

    getSimpleExpr = ( | astNode |
	astNode: getBasicExpr.
	[ getDelimiter: '.' ] whileTrue: [
	    " dot notation sugar "
    	    isName ifFalse: [
		syntaxErr: 'expecting an identifier after the period'
	    ].
	    astNode: cecil_sugar_msg_node copyName: getName WithExpr: astNode.
	    (getDelimiter: '(') ifTrue: [
		" check for this here, to make better error messages "
		syntaxErr: 'dot-notation function calls not allowed'.
	    ].
	].
	astNode ).

    getBasicExpr = ( 
        isLiteral		   ifTrue: [ ^ literalExpr ].
	isName			   ifTrue: [ ^ nameExpr ].
    	(isReservedWord: 'resend') ifTrue: [ ^ resendMsg ].
        (isDelimiter: '{')	   ifTrue: [ ^ closureNoFormalExpr ].
        (isDelimiter: '&')	   ifTrue: [ ^ closureExpr ].
        (isDelimiter: '[')	   ifTrue: [ ^ arrayExpr ].
        (isDelimiter: '(')	   ifTrue: [ ^ nestedScope ].
	isObjectExpr		   ifTrue: [ ^ objectExpr: true ].
	syntaxErr: 'expecting an expression'.
    ).

    literalExpr = (
	isLiteral ifFalse: [ syntaxErr: 'expecting a literal' ].
	cecil_literal_node copyWithValue: getLiteralObj ).

    nameExpr = ( | name. params. where. |
	isName ifFalse: [ syntaxErr: 'expecting an identifier' ].
	where: currentLocation.
	name: getName.
	params: getActualParams.
        (getDelimiter: '(') ifTrue: [ 
	    " a prefix message "
	    | msg |
	    msg: cecil_msg_node copy.
	    msg location: where.
	    msg msgName: name.
	    msg params: params.
	    (isDelimiter: ')') ifFalse: [
		" read the arguments "
		[ msg add_expr: getExpr ] untilFalse: [ getDelimiter: ',' ].
	    ].
	    getRequiredDelimiter: ')'.
	    msg
	] False: [
	    | vnode |
	    " a simple variable access "
	    vnode: cecil_var_node copyWithName: name Params: params.
	    vnode location: where.
	    vnode
	] ).

    resendMsg = ( | msg |
	getRequiredReservedWord: 'resend'.
    	msg: cecil_resend_node copy.
	msg location: currentLocation.
	(getDelimiter: '(') ifTrue: [
	    qualifiedExprs: msg.
	    getRequiredDelimiter: ')'.
	].
    	msg ).

    qualifiedExprs: msg = (
	[ | expr. constraint. |
	    expr: getExpr.
	    (getDelimiter: '@') ifTrue: [
		expr isVarNode ifFalse: [
		    syntaxErr: 'may only direct the resend through a variable'.
		].
		constraint: getConstraint.
	    ] False: [
		constraint: cecil_unspecified.
	    ].
	    msg addQualifiedExpr:
	        cecil_qualified_expr
		    copyWithExpr: expr Constraint: constraint.
	] untilFalse: [ getDelimiter: ',' ].
    ).

    arrayExpr = ( | obj |
	obj: cecil_array_object_expr_node copy.
	getRequiredDelimiter: '['.
	(getDelimiter: ']') ifFalse: [
	    [ obj addElement: getExpr ] untilFalse: [ getDelimiter: ',' ].
	    getRequiredDelimiter: ']'.
	].
	obj ).

    closureExpr = ( | formals. resultTypeSpec. closure. where. |
	where: currentLocation.
	getRequiredDelimiter: '&'.
	formals: getFormals.
	resultTypeSpec: getOptionalTypeSpec.

	"don't do closure optimization if some formal is constrained,
	 since it might be constrained to something in the local scope of the
	 closure, and the optimization implemented here wouldn't be legal"
	interp optimizingCecilClosure &&
	    [formals hasConstrainedFormal not] ifTrue: [
	    closure: cecil_optimized_closure_node copy.
	] False: [
	    closure: cecil_closure_node copy.
	].

	closure method location: where.
	closure method formals: formals.
	closure method resultTypeSpec: resultTypeSpec.

	closureBody: closure ).

    closureNoFormalExpr = ( | closure |
	interp optimizingCecilClosure ifTrue: [
	    closure: cecil_optimized_closure_node copy.
	] False: [
	    closure: cecil_closure_node copy.
	].
	closureBody: closure ).

    closureBody: closure = (
	getRequiredDelimiter: '{'.
	getStatements: closure method EndsWith: '}'.
	closure ).

    nestedScope = ( | newScope. |
	getRequiredDelimiter: '('.
        newScope: cecil_nested_scope_node copy.
	getStatements: newScope EndsWith: ')'.
	newScope ).


    "********************************
     *	       Miscellaneous        *
     ********************************"

    advance = (
	nil != pastTokens ifTrue: [
	    "saving tokens onto a stack-like list"
	    pastTokens addFirst: thisToken.
	].
	futureTokens nonEmpty ifTrue: [
	    " take token from lookahead list "
	    thisToken: futureTokens removeFirst.
	] False: [
	    " read a token from the scanner "
	    thisToken: scanner getNextToken.
	].
    ).

    "remember all tokens advanced during execution of 'block' and restore
     them when done; returns result of 'block'"
    saveExcursion: block = ( | prevPastTokens. result. |
	prevPastTokens: pastTokens.
	pastTokens: list copyRemoveAll.
	result: block exitValue.
	pastTokens do: [ |:token|
	    futureTokens addFirst: thisToken.
	    thisToken: token.
	].
	pastTokens: prevPastTokens.
	result ).

    "the following tests will check the current token name only"

    isEOF = ( thisToken id = 'eof' ).

    isDelimiter:  delimiter = ( thisToken name = delimiter ).
    isReservedWord: keyword = ( thisToken name = keyword ).

    isName    = ( thisToken id = 'identifier' ).
    isBinary  = ( thisToken id = 'binary' ).
    isLiteral = ( thisToken name = 'literal' ).
    isString  = ( isLiteral && [ thisToken isString ] ).

    isSubtypeConstraint   = ( isBinary && [thisToken name = '<='] ).
    isSupertypeConstraint = ( isBinary && [thisToken name = '>='] ).

    "the following tests will advance the input token list"

    getDelimiter: delimiter = (
    	(isDelimiter: delimiter) ifTrue: [ advance. true ] False: false ).
    getRequiredDelimiter: delimiter = (
    	(getDelimiter: delimiter) ifFalse: [
	    syntaxErr: 'expecting "', delimiter, '"' ] ).

    getReservedWord: keyword = (
	(isReservedWord: keyword) ifTrue: [ advance. true ] False: false ).
    getRequiredReservedWord: keyword = (
    	(getReservedWord: keyword) ifFalse: [
	    syntaxErr: 'expecting "', keyword, '" keyword' ] ).

    getSubtypeConstraint = (
	isSubtypeConstraint ifTrue: [ advance. true ] False: false ).
    getSupertypeConstraint = (
	isSupertypeConstraint ifTrue: [ advance. true ] False: false ).

    " extract identifier or literal obj from token, and eat it "
    getName       = ( | name | name: thisToken name.      advance. name ).
    getLiteralObj = ( | obj  | obj:  thisToken cecil_obj. advance. obj  ).

    currentLocation = ( thisToken location ).

    "some printing messages"
    syntaxErr: s = (
	syntaxErr: s With: [ 
	    isEOF ifTrue: [
		'  unexpected end of file' printLine.
	    ] False: [
		('  current token: ', thisToken printString) printLine.
	    ].
	    ('  [', currentLocation printString, ']') printLine.
	].
    ).
| )


globals cecil_interp _AddSlotsIfAbsent: ( | cecil_interpreter = () | )

globals cecil_interp _AddSlotsIfAbsent: ( | cecil_parser = () | )
cecil_parser _Define: ( |
    _ parent* = traits cecil_parser.
    _ thisObjectPrints = true.
    scanner <- cecil_scanner.
    pastTokens <- nil. "or list"
    thisToken <- token.
    futureTokens <- list.
    interp <- cecil_interpreter. 
    fastParse <- false.
    anonList <- cecil_decl_block.
    nestedLevel <- 0.
    fakeTypeParams <- false.
| )


traits cecil_interp _AddSlotsIfAbsent: ( | cecil_field_privacy_holder = () | )
traits cecil_field_privacy_holder _Define: ( |
    _ parent* = traits clonable.
    _ errHandlingParent* = mixins cecil_error_handling.

    ^ printString = (
	'<get: ', get printString, '; put: ', put printString, '>' ).

    ^ setGetPrivacy: pv = ( 
	get = cecil_unspecified_privacy ifFalse: [
	    syntaxErr: 'duplicate field accessor privacy specification'.
	].
	get: pv.
    ).
    ^ getGetPrivacy = ( get ). 

    ^ setPutPrivacy: pv = ( 
	put = cecil_unspecified_privacy ifFalse: [
	    syntaxErr: 'duplicate field accessor privacy specification'.
	].
	put: pv.
    ).
    ^ getPutPrivacy = ( put ).
| )

globals cecil_interp _AddSlotsIfAbsent: (| cecil_field_privacy_holder = () |)
cecil_field_privacy_holder _Define: ( |
    _ parent* = traits cecil_field_privacy_holder.
    _ thisObjectPrints = true.
    _ get <- cecil_unspecified_privacy. "or cecil_public, cecil_private"
    _ put <- cecil_unspecified_privacy.
| )


traits cecil_interp _AddSlotsIfAbsent: ( | cecil_field_kind = () | )
traits cecil_field_kind _Define: ( |
    _ parent* = traits clonable.
    _ errHandlingParent* = mixins cecil_error_handling.

    ^ printString = ( kind ).

    ^ setShared = (
	kind != 'normal' ifTrue: [
	    syntaxErr: 'duplicate field annotation'.
	].
	kind: 'shared'.
	self ).
    ^ isShared = ( kind = 'shared' ).

    ^ setReadOnly = (
	kind != 'normal' ifTrue: [
	    syntaxErr: 'duplicate field annotation'.
	].
	kind: 'read_only'.
	self ).
    ^ isReadOnly = ( kind = 'read_only' ).

    ^ setInitOnly = (
	kind != 'normal' ifTrue: [
	    syntaxErr: 'duplicate field annotation'.
	].
	kind: 'init_only'.
	self ).
    ^ isInitOnly = ( kind = 'init_only' ).
| )

globals cecil_interp _AddSlotsIfAbsent: ( | cecil_field_kind = () | )
cecil_field_kind _Define: ( |
    _ parent* = traits cecil_field_kind.
    _ thisObjectPrints = true.
    _ kind <- 'normal'.
| )
