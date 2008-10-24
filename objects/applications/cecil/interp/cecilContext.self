"Sun-$Revision: 9.1 $"

"context object in cecil interpreter"

"abstract parent of both cecil_top_context and cecil_nested_context"

traits cecil_interp _AddSlotsIfAbsent: ( | cecil_context = () | )
traits cecil_context _Define: ( |
    parent* = traits clonable.
    errHandlingParent* = mixins cecil_error_handling.

    printString = 'cecil_context'.

    ^ copy = ( | c |
	c: clone.
	c methods: methods copy.
	c noArgMethods: noArgMethods copy.
	c varBindings: varBindings copy.
	c typeBindings: typeBindings copy.
	c signatures: signatures copy.
	c closures: closures copy.
	c methodCache: methodCache copyRemoveAll.
	c typeName: ''.
	c envName: ''.
	c tempNum: 0.
	c ).

    _ accessing_var_bindings* = ( |
        ^ addBinding: binding = (
            binding name = cecil_anonymous_formal name ifTrue: [ ^self ].
            (varBindings includesKey: binding name) ifTrue: [
                cecilErr: 'Redeclaring ', binding name.
            ].
	    varBindings at: binding name Put: binding.
	). 
            
        "search through its lexical contexts for a var binding"
        ^ lookup_binding: name = (
	    lookup_binding: name IfAbsent: [
		cecilErr: 'no "', name, '" defined' ] ).
        ^ lookup_binding: name IfAbsent: block = ( 
	    varBindings at: name IfAbsent: [
		enclosingContext lookup_binding: name IfAbsent: block ]
	).

        ^ lookup_binding_context: name = (
	    lookup_binding_context: name IfAbsent: [
		cecilErr: 'no "', name, '" defined' ] ).
        ^ lookup_binding_context: name IfAbsent: block = (
	    (varBindings includesKey: name) ifTrue: self False: 
		[enclosingContext lookup_binding_context: name IfAbsent: block].
	).

        ^ lookup_object: name = ( (lookup_binding: name) value ).
        ^ lookup_object: name IfAbsent: block = ( 
            (lookup_binding: name IfAbsent: [^ block value: name]) value.
        ).

	^ lookup_named_object: name = ( | binding |
	    binding: lookup_binding: name.
	    binding isObjectBinding ifFalse: [
		cecilErr: 'should be a named object'.
	    ].
	    binding value ).

        ^ lookup_object_type: name = ( (lookup_binding: name) type ).
        ^ lookup_object_type: name IfAbsent: block = ( 
            (lookup_binding: name IfAbsent: [^ block value: name]) type.
        ).

	^ lookup_top_context_object: name = (
	    top_context lookup_named_object: name ).
	^ top_object = ( lookup_top_context_object: 'any' ).

	" used only for object_extension_decl_node "
        ^ isLocalObject: name = (varBindings includesKey: name).
    | ).

    _ accessing_type_bindings* = ( |
        ^ addTypeDecl: name Type: type = (
            (typeBindings includesKey: name) ifTrue: [	    
                cecilErr: 'Redeclaring type ', name.
            ].
	    typeBindings at: name Put: type.
	). 
            
        "search through its lexical contexts for a type binding"
        ^ lookup_type: name = (
	    lookup_type: name IfAbsent: [
		cecilErr: 'no "', name, '" type defined' ] ).
        ^ lookup_type: name IfAbsent: block = ( 
	    typeBindings at: name IfAbsent: [
		enclosingContext lookup_type: name IfAbsent: block ] ).

	^ lookup_top_context_type: name = ( top_context lookup_type: name ).
	^ top_type = ( lookup_top_context_type: 'any' ).

	" used while parameterized types don't quite work"
        ^ isLocalType: name = (typeBindings includesKey: name).
    | ).

    _ accessing_type_signature* = ( |
	^ addSignature: sig = (
	    signatures addSignature: sig InContext: self.
	).

        ^ lookup_sig: name NumArgs: argc NumParams: paramc = (
	    lookup_sig: name NumArgs: argc NumParams: paramc
		IfAbsent: [ set copyRemoveAll ] ).
        ^ lookup_sig: name NumArgs: argc NumParams: paramc IfAbsent: block = (
            signatures atName: name NumArgs: argc NumParams: paramc IfAbsent: [
		enclosingContext lookup_sig: name
		    NumArgs: argc NumParams: paramc IfAbsent: block
	    ] ).
    | ).

    _ accessing_closures* = ( |
	^ addClosure: cl = ( closures add: cl ).
    | ).

    _ accessing_method_dictionary* = ( |
	^ addMethod: method = ( | methodDic |
	    methodDic:
		method formals nonEmpty ifTrue: methods False: noArgMethods.
	    (methodDic includesKey: method key) ifTrue: [
		cecilErr: 'Redeclaring ', method printString.
	    ].
	    methodDic at: method key Put: method. 
	    updateCache: method.
	).
	
	^ removeMethods = (
	    allMethodsDo: [ | :method |
		method removeFromConstraints.
	    ].
	).

	^ allMethodsDo: block = (
	    noArgMethods do: [ | :method |
		block value: method.
	    ].
	    methods do: [ | :method |
		block value: method.
	    ].
	).
    | ).

    _ accessing_method_cache* = ( |
	"added a new method to this context; update the method cache"
	^ updateCache: aMethod = (
	    methodCache == enclosingContext methodCache ifTrue: [
		"stop sharing enclosing context's method cache"
		methodCache: methodCache reset.
	    ] False: [
		"record that a new method has been added to the scope"
		methodCache addMethod: aMethod.
	    ].
	).
     | ).

    ^ markPredefined = (
	varBindings markPredefined.
	typeBindings markPredefined.
	methods markPredefined.
        noArgMethods markPredefined.
	signatures markPredefined.
	closures markPredefined.
    ).

    "compiler functions"
    compiler = ( interp compiler ).
    ^ cFuncContext = (
	isCFuncContext ifTrue: [ ^ self ].
	enclosingContext cFuncContext ).

    ^ newTempNum = (
	tempNum: tempNum successor.
	tempNum ).
    ^ newTempName = ( | s |
	s: 't', newTempNum printString.
	nestedLevel > 1 ifTrue: [ s: s, '_', nestedLevel printString ].
	s ).
| )

globals cecil_interp _AddSlotsIfAbsent: (| cecil_var_bindings = () |)
globals cecil_interp _AddSlotsIfAbsent: (| cecil_type_bindings = () |)
globals cecil_interp _AddSlotsIfAbsent: (| cecil_method_dictionary = () |)
globals cecil_interp _AddSlotsIfAbsent: (| cecil_signature_dictionary = () |)
globals cecil_interp _AddSlotsIfAbsent: (| cecil_closure_list = () |)
globals cecil_interp _AddSlotsIfAbsent: (| cecil_method_cache = () |)

"used as a template for creating cecil_nested_contexts"
globals cecil_interp _AddSlotsIfAbsent: ( | cecil_context = () | )
cecil_context _Define: ( |
    _ parent* = traits cecil_context.
    _ thisObjectPrints = true.
    varBindings <- cecil_var_bindings.
    typeBindings <- cecil_type_bindings.
    methods <- cecil_method_dictionary.
    noArgMethods <- cecil_method_dictionary.
    signatures <- cecil_signature_dictionary.
    closures <- cecil_closure_list.
    methodCache <- cecil_method_cache.
    creationTime <- 'prototype'.

    "used by the compiler"
    typeName <- 'No typeName given yet'.
    envName <- 'No envName given yet'.
    methodAST <- 'No method assigned yet'.
    isCFuncContext <- false.
    tempNum <- 0.  " Used for assigning temporary variable numbers "
| )


traits cecil_interp _AddSlotsIfAbsent: ( | cecil_nested_context = () | )
traits cecil_nested_context _Define: ( |
    parent* = traits cecil_context.
    printString = 'cecil_nested_context'.

    ^ createInContext: context = ( | c |
	"for nested scopes and closures"
	c: copy.
	c enclosingContext: context.
	c nestedLevel: context nestedLevel successor.
	c creationTime: context creationTime.
	c ).

    ^ createForMethod: method = ( | c |
	"when calling a method"
	method isEvalMethod ifTrue: [
	    "an eval method is just another nested scope"
	    createInContext: method enclosingContext
	] False: [
	    "a normal method's context is the home context; requires special
	     treatment for resends, nlr's, encapsulation, etc."
	    cecil_home_context createForMethod: method
	] ).

    ^ homeContext = ( enclosingContext homeContext ).
    ^ hasHomeContext = ( enclosingContext hasHomeContext ).
    ^ homeMethod = ( homeContext method ).
    ^ isHomeContext = false.

    ^ top_context = ( enclosingContext top_context ).
    ^ isTopContext = false.

    ^ interp = ( top_context interp ).

    "sharing the method cache with its enclosing context"
    ^ shareEnclosingMethodCache = (
	methodCache: enclosingContext methodCache.
    ).
| )


globals cecil_interp _AddSlotsIfAbsent: ( | cecil_top_context = () | )

globals cecil_interp _AddSlotsIfAbsent: ( | cecil_nested_context = () | )
cecil_nested_context _Define: cecil_context clone _AddSlots: ( |
    _ parent* = traits cecil_nested_context.
    _ thisObjectPrints = true.
    ^ enclosingContext <- cecil_top_context. "the lexically enclosing context"
    ^ nestedLevel <- 0.
|)


"this context for normal method scopes"
traits cecil_interp _AddSlotsIfAbsent: ( | cecil_home_context = () | )
traits cecil_home_context _Define: ( |
    parent* = traits cecil_nested_context.
    printString = 'cecil_home_context'.

    ^ createForMethod: method = (
	(createInContext: method enclosingContext) method: method ).

    ^ homeContext = ( self ).
    ^ hasHomeContext = true.
    ^ isHomeContext = true.
|)

globals cecil_interp _AddSlotsIfAbsent: ( | cecil_home_context = () | )
cecil_home_context _Define: cecil_nested_context clone _AddSlots: ( |
    _ parent* = traits cecil_home_context.
    _ method <- cecil_method.
    ^ nonLocalReturnBlk. " will be a block if defined, nil if context is dead "
| )


"top_context is the first real context, outside of all methods"

traits cecil_interp _AddSlotsIfAbsent: ( | ^ cecil_top_context = () | )
traits cecil_top_context _Define: ( |
    parent* = traits cecil_context.
    printString = 'cecil_top_context'.

    ^ copyWithInterp: interpreter Time: time = ( | c | 
	c: copy.
	c interp: interpreter.
	c creationTime: time.
	c anonymousBindings: anonymousBindings copy.
	c closureList: list copyRemoveAll.
	c fieldVarList: list copyRemoveAll.
	c createInitialObjects.
	c markPredefined.
	c ).

    _ createInitialObjects = ( | binding |
	"create the initial predefined objects"
	createTopObject: 'any'.

	createType: 'no_return' Type: bottomType.
	createType: 'void'      Type: voidType.
	createType: 'dynamic'   Type: dynamicType.

	createType: 'integer' Kind: cecil_template.
	createType: 'float'   Kind: cecil_template.
	createType: 'char'    Kind: cecil_template.
	createType: 'string'  Kind: cecil_template.
	createType: 'mutable_string' Kind: cecil_template.

	createObject: 'true'  Kind: cecil_concrete.
	createObject: 'false' Kind: cecil_concrete.

	"array is the only parameterized predefined object"
	createType: 'array'   Kind: cecil_template Params:
	    cecil_formal_param_list copyRemoveAll add:
	        cecil_type_var_spec createWithName: 'T'.
	binding: lookup_binding: 'array'.
	binding resolvedContext: cecil_nested_context createInContext: self.
	binding value resolveParams: binding resolvedContext.

	"closure is kinda weird, since it really should be parameterized"
	createBaseObject: 'closure' Kind: cecil_abstract.
	(lookup_top_context_object: 'closure') type: dynamicType.
    ).

    _ createTopObject: name = ( | top. binding. |
	top: cecil_top_object copyName: name In: self.
	top kind: cecil_abstract.
	top creationTime: creationTime.
	binding: cecil_object_binding copyName: name WithValue: top.
	binding file: 'base'.
	binding fullFile: 'base'.
	addBinding: binding.
	top setType.
	top type: topType copyObject: top.
	addTypeDecl: name Type: top type.
    ).

    _ createType: name Type: type = ( | obj |
	obj: createBaseObject: name Kind: cecil_abstract.
	obj setType.
	obj type: type.
	addTypeDecl: name Type: type.
    ).

    _ createType: name Kind: kind = (
	createType: name Kind: kind
	    Params: cecil_formal_param_list copyRemoveAll ).
    _ createType: name Kind: kind Params: ps = ( | obj |
	obj: createObject: name Kind: kind Params: ps.
	obj setType.
	addTypeDecl: name Type: obj type.
    ).

    _ createObject: name Kind: kind = (
	createObject: name Kind: kind
	    Params: cecil_formal_param_list copyRemoveAll ).
    _ createObject: name Kind: kind Params: ps = ( | obj |
	obj: createBaseObject: name Kind: kind Params: ps.
	obj buildTypeLattice: self.
	obj ).

    _ createBaseObject: name Kind: kind = (
	createBaseObject: name Kind: kind
	    Params: cecil_formal_param_list copyRemoveAll ).
    _ createBaseObject: name Kind: kind Params: ps = ( | obj |
	obj: cecil_named_object copyName: name Params: ps In: self.
	obj kind: kind.
	obj creationTime: creationTime.
	(name = 'no_return') || [name = 'dynamic'] ifFalse: [ | binding |
	    binding: cecil_object_binding copyName: name WithValue: obj.
	    binding file: 'base'.
	    binding fullFile: 'base'.
	    addBinding: binding.
	].
	obj ).

    ^ reset = (
	varBindings: varBindings reset.
	typeBindings: typeBindings reset.
	methods: methods reset.
        noArgMethods: noArgMethods reset.
	signatures: signatures reset.
	closures: closures reset.
	methodCache: methodCache reset.
	anonymousBindings: anonymousBindings copyRemoveAll.
	closureList: list copyRemoveAll.
	fieldVarList: list copyRemoveAll.
	top_type reset.
    ).

    ^ top_context = ( self ).
    ^ isTopContext = true.

    ^ enclosingContext = ( cecil_empty_context ).
    ^ homeContext = ( cecilErr: 'not nested in a method' ).
    ^ homeMethod  = ( cecilErr: 'not nested in a method' ).
    ^ hasHomeContext = false.
    ^ isHomeContext = false.
    ^ nestedLevel = 0.
| )

globals cecil_interp _AddSlotsIfAbsent: ( | cecil_interpreter = () | )

globals cecil_interp _AddSlotsIfAbsent: ( | cecil_top_context = () | )
cecil_top_context _Define: cecil_context clone _AddSlots: ( |
    _ parent* = traits cecil_top_context.
    _ thisObjectPrints = true.
    ^ interp <- cecil_interpreter.
    ^ anonymousBindings <- dictionary.
    ^ closureList <- list.
    ^ fieldVarList <- list.
| )


"empty_context is the enclosing context of top_context;
 no bindings; ends recursions up the enclosingContext chain"

globals cecil_interp _AddSlotsIfAbsent: ( | ^ cecil_empty_context = () | )
cecil_empty_context _Define: ( |
    _ parent* = traits oddball.
    _ errHandlingParent* = mixins cecil_error_handling.

    lookup_binding: name IfAbsent: block = ( block value: name ).
    lookup_binding_context: name IfAbsent: block = ( block value: name ).
    lookup_type: name IfAbsent: block = ( block value: name ).
    lookup_sig: name NumArgs: argc NumParams: paramc IfAbsent: block = (
	block value: key ).

    methodCache = cecil_method_cache.
| )


" this is a pseudo-method for expressions in the top_context "

globals cecil_interp _AddSlotsIfAbsent: ( | ^ cecil_top_method = () | )
cecil_top_method _Define: ( |
    _ parent* = traits oddball.
    _ errHandlingParent* = mixins cecil_error_handling.
    _ thisObjectPrints = true.
    printString = 'cecil_top_method'.
    isEvalMethod = false.
    includesFormalName: fm = ( false ).
|)


traits cecil_interp _AddSlotsIfAbsent: ( | cecil_method_dictionary = () | )
traits cecil_method_dictionary _Define: ( |
    _ parent* = traits dictionary.
    _ errHandlingParent* = mixins cecil_error_handling.

    printString = (  | str <- ''. |
    	str: 'Method Dictionary:\n'.
	do: [ | :m | str: str, m printString, '\n' ].
    	str ).
    printStringSize: n = ( printString copyAtMostWithEllipsis: n ).

    ^ markPredefined = (
	do: [ | :m | m isPredefined: true ].
    ).

    ^ reset = ( | new |
	new: copyRemoveAll.
	do: [ | :m. :k. |
	    m isPredefined ifTrue: [
		"keep"
		new at: k Put: m.
	    ] False: [
		"disassociate method from constraint objects"
		m removeFromConstraints.
	    ].
	].
	new ).
|)

globals cecil_interp _AddSlotsIfAbsent: (| cecil_method_dictionary = () |)
cecil_method_dictionary _Define: dictionary clone _AddSlots: ( |
    _ parent* = traits cecil_method_dictionary.
    _ thisObjectPrints = true.
|)



"a key for the method dictionary"
"composed of the method name, number of params, and arg constraints"
traits cecil_interp _AddSlotsIfAbsent: ( | cecil_method_key = () | )
traits cecil_method_key _Define: ( |
    _ parent* = traits clonable.
    _ errHandlingParent* = mixins cecil_error_handling.

    ^ printString = ( | cString. |
	cString: name, params printString, '('.
    	constraints do: [ | :c |
	    cString: cString, '@', c cecilShortPrintString ].
    	cString, ')' ).

    _ copyName: name Params: ps Constraints: cs = (
	(((resend.copy name: name) params: ps) constraints: cs) computeHash ).
    _ computeHash = (
	hash: name hash && params size hash && constraints hash.
    ).

    ^ copy = (
	copyName: name Params: params copy Constraints: constraints copy ).
    ^ copyName: n Params: ps = (
	copyName: n Params: ps Constraints: constraints copyRemoveAll ).
    ^ copyFromMethod: method = (
	copyName: method name Params: method params copy
	    Constraints: method formals constraints ).

    ^ = mk = ( (name = mk name) && [(constraints = mk constraints) &&
		[params size = mk params size]] ).
|)

globals cecil_interp _AddSlotsIfAbsent: ( | cecil_method_key = () | )
cecil_method_key _Define: ( |
    _ parent* = traits cecil_method_key.
    _ thisObjectPrints = true.
    name <- ''.       "method name"
    params <- cecil_formal_param_list.	"we really only care about its size"
    constraints <- cecil_constraint_list.  "a list of the constraint objects"
    hash.	"precompute & store the hash of the method key"
|)


traits cecil_interp _AddSlotsIfAbsent: ( | cecil_constraint_list = () | )
traits cecil_constraint_list _Define: ( |
    _ parent* = traits list.
    _ errHandlingParent* = mixins cecil_error_handling.
| )

globals cecil_interp _AddSlotsIfAbsent: (| cecil_constraint_list = () |)
cecil_constraint_list _Define: list clone _AddSlots: ( |
    _ parent* = traits cecil_constraint_list.
| )


"A signature dictionary is a dictionary of sets,
 indexed by method name and number of arguments."
traits cecil_interp _AddSlotsIfAbsent: ( | cecil_signature_dictionary = () | )
traits cecil_signature_dictionary _Define: ( |
    _ parent* = traits dictionary.
    _ errHandlingParent* = mixins cecil_error_handling.

    printString = (  | str <- ''. |
    	str: 'Signature Dictionary:\n'.
	do: [ | :sset. :key. |
	    str: str, key, ':\n'.
	    sset do: [ | :sig. |
		str: str, '  ', sig printString, '\n'.
	    ].
	].
    	str ).

    printStringSize: n = ( printString copyAtMostWithEllipsis: n ).

    "Key is a string of the form '<sig name>/<# args>/<# params>',
     e.g. '+/2/0' or 'new_array/2/1'"
    _ keyFor: name NumArgs: argc NumParams: paramc = (
	name, '/', argc printString, '/', paramc printString ).

    atName: name NumArgs: argc NumParams: paramc IfAbsent: block = (
	at: (keyFor: name NumArgs: argc NumParams: paramc) IfAbsent: block ).

    addSignature: signature InContext: context = ( | sset. addLater. |
	"Add a signature to the dictionary.  Return the signature.
         If there's already a signature in the dictionary which implies
           this one, don't add the latter, return the former.
         If this signature implied some signatures in the dictionary already,
           remove them."

	sset: context lookup_sig: signature name
	    NumArgs: signature args size NumParams: signature params size
	    IfAbsent: [ | key |
	    "we're the first, add the signature and exit method"
	    debugMsg: 'Extracting ', signature printString.
	    context interp signaturesNeedTypeChecking: true.
	    key: keyFor: signature name
		NumArgs: signature args size
		NumParams: signature params size.
	    at: key Put: set copyRemoveAll add: signature.
	    ^ self.
	].

	"If this signature already exists in the sset, Or..."
	"If there exists a signature in the sset with
	 args more general and result type no more general,
	 then don't add this signature."
	sset findFirst: [ |:sig| (sig implies: signature) || (sig = signature)
	] IfPresent: [ ^ self ] IfAbsent: [].

	"Else, if there are any signatures in the sset which
	 duplicate this signature, then throw them out."
	sset do: [ | :sig. |
	    (signature implies: sig) ifTrue: [
		sset remove: sig.
	    ].
	].

	"add the signature"
	debugMsg: 'Extracting ', signature printString.
	context interp signaturesNeedTypeChecking: true.
	sset add: signature.
    ).

    ^ markPredefined = (
	do: [ | :sset | 
	    sset do: [ | :s |
		s isPredefined: true.
	    ].
	].
    ).

    ^ reset = ( | new |
	new: copyRemoveAll.
	do: [ | :sset. :key. newSSet. | 
	    newSSet: sset copyRemoveAll.
	    sset do: [ | :s |
		s isPredefined ifTrue: [ 
		    newSSet add: s.
		].
	    ].
	    newSSet nonEmpty ifTrue: [
		new at: key Put: newSSet.
	    ].
	].
	new ).
|)

globals cecil_interp _AddSlotsIfAbsent: (| cecil_signature_dictionary = () |)
cecil_signature_dictionary _Define: dictionary clone _AddSlots: ( |
    _ parent* = traits cecil_signature_dictionary.
    _ thisObjectPrints = true.
|)

traits cecil_interp _AddSlotsIfAbsent: ( | cecil_closure_list = () | )
traits cecil_closure_list _Define: ( |
    _ parent* = traits list.
    _ errHandlingParent* = mixins cecil_error_handling.

    ^ markPredefined = ( do: [ | :cl | cl isPredefined: true. ] ).

    ^ reset = ( | new |
	new: copyRemoveAll.
	do: [ | :cl | cl isPredefined ifTrue: [ new add: cl ] ].
	new ).
|)

globals cecil_interp _AddSlotsIfAbsent: (| cecil_closure_list = () |)
cecil_closure_list _Define: list clone _AddSlots: ( |
    _ parent* = traits cecil_closure_list.
    _ thisObjectPrints = true.
|)


traits cecil_interp _AddSlotsIfAbsent: ( | cecil_var_bindings = () | )
traits cecil_var_bindings _Define: ( |
    _ parent* = traits dictionary.
    _ errHandlingParent* = mixins cecil_error_handling.

    printString = (  | str <- ''. |
        str: 'Var Bindings:\n'.
	do: [ | :m. :k | str: str, k printString, '-', m printString, '\n' ]. 
    	str ).
    printStringSize: n = ( printString copyAtMostWithEllipsis: n ).

    "duplicate the contents of the variable bindings"
    ^ copy = ( | varBndgs |
	varBndgs: resend.copy.
	do: [ | :binding. :k | varBndgs at: k Put: binding copy ].
	varBndgs ).

    ^ markPredefined = ( 
	do: [ | :binding | binding isPredefined: true ].
    ).

    ^ reset = ( | new |
	new: copyRemoveAll.
	do: [ | :binding. :k | 
	    binding isPredefined ifTrue: [ 
		"keep"
		new at: k Put: binding.
	    ] False: [
		"throw away"
		binding isObjectBinding ifTrue: [
		    "forget links in the type lattice that have been
		     constructed"
		    binding value removeFromTypeLattice.
		].
	    ].
	].
	new ).
|)

globals cecil_interp _AddSlotsIfAbsent: (| cecil_var_bindings = () |)
cecil_var_bindings _Define: dictionary clone _AddSlots: ( |
    _ parent* = traits cecil_var_bindings.
    _ thisObjectPrints = true.
|)


traits cecil_interp _AddSlotsIfAbsent: ( | cecil_type_bindings = () | )
traits cecil_type_bindings _Define: ( |
    _ parent* = traits dictionary.
    _ errHandlingParent* = mixins cecil_error_handling.

    printString = (  | str <- ''. |
        str: 'Type Bindings:\n'.
	do: [ | :type. :name |
	    str: str, name printString, '-', type printString, '\n'.
	]. 
    	str ).

    printStringSize: n = ( printString copyAtMostWithEllipsis: n ).

    ^ markPredefined = ( 
	do: [ | :type | type isPredefined: true ].
    ).

    ^ reset = ( | new |
	new: copyRemoveAll.
	filterBy: [| :type | type isPredefined ] Into: new.
	new ).
|)

globals cecil_interp _AddSlotsIfAbsent: (| cecil_type_bindings = () |)
cecil_type_bindings _Define: dictionary clone _AddSlots: ( |
    _ parent* = traits cecil_type_bindings.
    _ thisObjectPrints = true.
|)
