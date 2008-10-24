"Sun-$Revision: 9.1 $"

" Object kind objects "

traits cecil_interp _AddSlotsIfAbsent: ( | cecil_object_kind = () | )
traits cecil_object_kind _Define: ( |
    _ parent* = traits oddball.
    _ errHandlingParent* = mixins cecil_error_handling.
    isTemplate = false.
    isAbstract = false.
    isConcrete = false.
    isPredicate = false.
    isUnspecified = false.
|)

globals cecil_interp _AddSlotsIfAbsent: ( | cecil_abstract = () | )
cecil_abstract _Define: ( |
    _ parent* = traits cecil_object_kind.
    _ thisObjectPrints = true.
    printString = 'abstract'.
    isAbstract = true.
|)

globals cecil_interp _AddSlotsIfAbsent: ( | cecil_template = () | )
cecil_template _Define: ( |
    _ parent* = traits cecil_object_kind.
    _ thisObjectPrints = true.
    printString = 'template'.
    isTemplate = true.
|)

globals cecil_interp _AddSlotsIfAbsent: ( | cecil_concrete = () | )
cecil_concrete _Define: ( |
    _ parent* = traits cecil_object_kind.
    _ thisObjectPrints = true.
    printString = 'concrete'.
    isConcrete = true.
|)

globals cecil_interp _AddSlotsIfAbsent: ( | cecil_predicate_kind = () | )
cecil_predicate_kind _Define: ( |
    _ parent* = traits cecil_object_kind.
    _ thisObjectPrints = true.
    printString = 'cecil_predicate_kind'.
    isPredicate = true.
|)

globals cecil_interp _AddSlotsIfAbsent: ( | cecil_unspecified_kind = () | )
cecil_unspecified_kind _Define: ( |
    _ parent* = traits cecil_object_kind.
    _ thisObjectPrints = true.
    printString = 'cecil_unspecified_kind'.
    isUnspecified = true.
|)


traits cecil_interp _AddSlotsIfAbsent: ( | cecil_object_or_expr = () | )
traits cecil_object_or_expr _Define: ( |
    parent* = traits clonable.
    copy = ( | newObj. |
    	newObj: resend.copy.
    	newObj parentSpecs: parentSpecs copy.
	newObj isaSpecs: isaSpecs copy.
	newObj supertypeSpecs: supertypeSpecs copy.
	newObj location: location copy.
    	newObj).

    setType = ( isType: true ).

    parentSpecsDo: aBlock = (
	isaSpecs do: aBlock.
	parentSpecs do: aBlock.
    ).
    parentsDo: aBlock = (
	parentSpecsDo: [ | :spec | aBlock value: spec object ].
    ).
    parents = ( | ps |
	ps: set copyRemoveAll.
	parentsDo: [ | :p | ps add: p ].
	ps ).

    supertypeSpecsDo: aBlock = (
	isaSpecs do: aBlock.
	supertypeSpecs do: aBlock.
    ).
    supertypesDo: aBlock = (
	supertypeSpecsDo: [ | :spec | aBlock value: spec type ].
    ).
    supertypes = ( | ts |
	ts: set copyRemoveAll.
	supertypesDo: [ | :t | ts add: t ].
	ts ).

    needsInstantiation = false.
    isInstantiated = false.
| )

globals cecil_interp _AddSlotsIfAbsent: (| token_location = () |)

globals cecil_interp _AddSlotsIfAbsent: ( | cecil_object_or_expr = () | )
cecil_object_or_expr _Define: ( |
    _ parent* = traits cecil_object_or_expr.

    kind <- cecil_unspecified_kind.
    isType <- false. "this object is a type"

    parentSpecs <- cecil_spec_list. "list of inherited parent specs"
    isaSpecs <- cecil_spec_list. "list of objects"
    supertypeSpecs <- cecil_spec_list.

    location <- token_location.
| )


traits cecil_interp _AddSlotsIfAbsent: ( | cecil_object = () | )
traits cecil_object _Define: ( |
    parent* = traits cecil_object_or_expr.
    errHandlingParent* = mixins cecil_error_handling.

    printString = 'cecil_object'.

    cecilShortPrintString = 'object'.
    cecilPrintString = (
	cecilShortPrintString, ancestryPrintString, statePrintString ).
    cecilShortUIPrintString = (
	"used to label icon boxes"
	cecilShortPrintString, ancestryPrintString ).
    cecilUIPrintString = ( | str |
	"used to label expanded boxes"
	kind isAbstract ifTrue: [ str: 'abstract ' ] False: [
	    kind isTemplate ifTrue: [ str: 'template ' ] False: [
		kind isConcrete ifTrue: [ str: 'concrete ' ] False: [
		    str: '' ]]].
	str: str, (isType ifTrue: 'type' False: 'object').
	str: str, nameString.
	str: str, ancestryPrintString.
	str ).
    nameString = ''.

    ancestryPrintString = ( | str |
	isaSpecs doFirst: [ |:p| 
	    str: ' isa ', p object cecilShortPrintString.
	] MiddleLast: [ |:p| 
	    str: str, ', ', p object cecilShortPrintString.
	] IfEmpty: [
	    str: ''.
	].
	parentSpecs doFirst: [ |:p| 
	    str: str, ' inherits ', p object cecilShortPrintString.
	] MiddleLast: [ |:p| 
	    str: str, ', ', p object cecilShortPrintString.
	] IfEmpty: [
	].
	supertypeSpecs doFirst: [ |:t| 
	    str: str, ' subtypes ', t type cecilShortPrintString.
	] MiddleLast: [ |:p| 
	    str: str, ', ', t type cecilShortPrintString.
	] IfEmpty: [
	].
	str ).
    statePrintString = ( | str |
	str: ''.
	states nonEmpty ifTrue: [
	    str: str, ' {'.
	    states doFirst: [ |:v.:k.| 
		str: str, k, '=', v cecilShortPrintString.
	    ] MiddleLast:   [ |:v.:k.| 
		str: str, ', ', k, '=', v cecilShortPrintString.
	    ] IfEmpty: [ error: 'shouldn\'t be here' ].
	    str: str, '}' ].
	str ).

    copy = ( | newObj |
    	newObj: resend.copy.
	newObj type: type copyObject: newObj.
    	newObj states: states copy.
    	newObj attachedMethods: attachedMethods copyRemoveAll.
	newObj predicateChildren: predicateChildren copy.
	newObj predicateParents: predicateParents copy.
	newObj creationTime: 'unknown'.
	newObj compilerProcessed: false.
	newObj compilerStates: compilerStates copyRemoveAll.
    	newObj ).

    newParent: pname AndObject: obj = ( | newParent |
	newParent: cecil_named_object_spec createWithName: pname.
	newParent object: obj.
	parentSpecs add: newParent.
	newParent.
    ).

    { 'attached_method_operations'
	hasAttachedMethods = (
	    attachedMethodsDo: [ ^ true ].
	    false ).
	
	attachedMethodsDo: block = (
	    attachedMethods do: [ | :el. | block value: el. ].
	).
	
	attachMethod: m = (
	    attachedMethods add: m.
	).
	
	detachMethod: m = (	
	    "a method could be constrained to the same argument constraint
	     more than once. So when the method is no longer in the 
	     attachedMethods, it is not an error"
	    attachedMethods remove: m IfAbsent: [].
	).
    }

    { 'field_operations'
	"manipulate fields of object"

	"tester"
	fieldIsDefined: key = ( states includesKey: key ).

	"get accessors"
	atFieldName: key = ( states at: key ).
	atFieldName: key IfAbsent: block = ( states at: key IfAbsent: block ).

	"set accessor"
	atFieldName: key Put: val = ( states at: key Put: val ).
    }

    { 'prim_field_operations'
        "manipulate primitive fields"

	"get accessors"
	atPrimFieldName: name Of: objName InContext: c = (
	    atPrimFieldName: name Of: objName DefaultFieldName: name
	    	InContext: c ).

	atPrimElem: index Of: objName InContext: c = (
	    atPrimFieldName: (elem_name: index) Of: objName
	        DefaultFieldName: 'initial_value' InContext: c ).

	atPrimFieldName: name Of: objName DefaultFieldName: defaultName
		InContext: c = (
	    atFieldName: name, '@', objName IfAbsent: [
	        " return the default value instead "
		atFieldName: defaultName, '@', objName IfAbsent: [
		    | m. args. |
		    " evaluate and return the default value of the field "
		    c == nil ifTrue: [ error: 'need a context' ].
		    args: cecil_obj_list copy add:
			c lookup_top_context_object: objName.
		    m: c method_lookup: defaultName Args: args
			Params: cecil_param_list copyRemoveAll.
		    m eval: c WithArgs: args.
		]
	    ] ).

	"set accessors"
	atPrimElem: index Of: objName Put: value = (
	    atPrimFieldName: (elem_name: index) Of: objName Put: value ).

	atPrimFieldName: name Of: objName Put: value = (
	    atFieldName: name, '@', objName Put: value ).

	"vector elem name"
	_ elem_name: index = ( '<', index printString, '>' ).
    }

    { 'array_operations'
	makeArrayOfSize: size Filler: filler Type: type InContext: context = (
	    | newObj. params. parent. |
	    newObj: cecil_object copy.
	    params: cecil_param_list copyRemoveAll add:
		cecil_fixed_type_spec copy: type.
	    parent: (context lookup_top_context_object: 'array')
		copyInstantiatingWith: params AtLocation: location.
	    newObj newParent: 'array' AndObject: parent.
	    newObj setArrayLength: size InContext: context.
	    size do: [ | :index | 
		newObj arrayElem: index Put: filler InContext: context.
	    ].
	    newObj creationTime: 'dynamic'.
	    newObj ).

	arrayLengthObjectInContext: c = (
	    atPrimFieldName: 'length' Of: 'array' InContext: c ).
	arrayLengthInContext: c = (
	    (arrayLengthObjectInContext: c) integerValueInContext: c ).
	setArrayLength: length InContext: context = ( 
	    atPrimFieldName: 'length' Of: 'array' Put:
	        cecil_integer_literal copyValue: length InContext: context ).

	arrayElem: index InContext: c = (
	    (index >= 0) && [index < (arrayLengthInContext: c)] ifFalse: [
		error: 'accessing an array element out of bounds'
	    ].
	    atPrimElem: index Of: 'array' InContext: c ).
	arrayElem: index Put: value InContext: c = (
	    (index >= 0) && [index < (arrayLengthInContext: c)] ifFalse: [
		error: 'storing into an array element out of bounds'
	    ].
	    atPrimElem: index Of: 'array' Put: value ).
    }

    { 'string_operations'
	makeStringOfType: parent Size: size Filler: filler 
	        InContext: context = ( | newObj |
	    newObj: cecil_object copy.
	    newObj newParent: parent AndObject: 
		context lookup_top_context_object: parent.
	    newObj setStringLength: size InContext: context.
	    size do: [ | :index | 
		newObj stringElem: index Put: filler InContext: context.
	    ].
	    newObj creationTime: 'dynamic'.
	    newObj ).

	stringLengthObjectInContext: c = (
	    atPrimFieldName: 'length' Of: 'string' InContext: c ).
	stringLengthInContext: c = (
	    (stringLengthObjectInContext: c) integerValueInContext: c ).
	setStringLength: length InContext: context = ( 
	    atPrimFieldName: 'length' Of: 'string' Put:
	        cecil_integer_literal copyValue: length InContext: context ).

	stringElem: index InContext: c = (
	    (index >= 0) && [index < (stringLengthInContext: c)] ifFalse: [
		error: 'accessing a string element out of bounds'
	    ].
	    atPrimElem: index Of: 'string' InContext: c ).
	stringElem: index Put: value InContext: c = (
	    (index >= 0) && [index < (stringLengthInContext: c)] ifFalse: [
		error: 'storing into a string element out of bounds'
	    ].
	    atPrimElem: index Of: 'string' Put: value ).
    }

    { 'literal_value_operations'
	"return Self objects, not Cecil objects"
	integerValueInContext: c = ( 
	    (atPrimFieldName: 'value' Of: 'integer' InContext: c)
	        integerValueInContext: c ).
	floatValueInContext: c = (
	    (atPrimFieldName: 'value' Of: 'float' InContext: c)
	        floatValueInContext: c ).
	charValueInContext: c = (
	    (atPrimFieldName: 'value' Of: 'char' InContext: c)
	        charValueInContext: c ).
	stringValueInContext: c = ( | str |
	    " concatenate all the characters to form a string "
	    str: ''.
	    (stringLengthInContext: c) do: [ |:i|
		str: str,
		     ((stringElem: i InContext: c) charValueInContext: c).
	    ].
	    str ).
    }

    "used for determing the method lookups for the eval msg"
    existsEvalMethodWithArgSize: n = (
	attachedMethodsDo: [ | :method |
	    (method name = 'eval') && [
		(method formals size = n) && [
		    method params size = 0 ]]
		ifTrue: [ ^ true ].
	].
	false ).

    isTopObject = false.
    isLiteral = false.
    isUnoptimizedClosureObject = false.
| )

globals cecil_interp _AddSlotsIfAbsent: ( | cecil_field_info_list = () | )

globals cecil_interp _AddSlotsIfAbsent: ( | cecil_object = () | )
cecil_object _Define: cecil_object_or_expr clone _AddSlots: ( |
    _ parent* = traits cecil_object.
    _ thisObjectPrints = true.

    type <- cecil_named_type.

    states <- dictionary.

    attachedMethods <- set.

    predicateChildren <- set.  "direct children that are predicate objects"
    predicateChildrenUsed <- false. "have they been read?"
    predicateParents <- set.  "computed immediate parent predicate objects"
    predicateParentsCalculated <- false.

    creationTime <- 'prototype'.	" or 'static' or 'dynamic' "

    "used when compiling Cecil programs"
    compilerProcessed <- false.
    compilerStates <- cecil_field_info_list.
| )


"this abstract traits is for objects with names and parameters, but doesn't say
 whether the parameters are formal or actual params"
traits cecil_interp _AddSlotsIfAbsent: ( | cecil_parameterized_object = () | )
traits cecil_parameterized_object _Define: ( |
    parent* = traits cecil_object.

    printString = ( name, params printString ).
    ancestryPrintString = ''. "don't include ancestry for parameterized object"
    cecilShortPrintString = ( name, params cecilShortPrintString ).
    nameString = ( ' ', cecilShortPrintString ).

    copy = ( resend.copy params: params copy ).
    copyName: n In: context = (
	(copy name: n) defining_context: context ).
    copyName: n Params: p In: context = (
	(copyName: n In: context) params: p copy ).
| )

globals cecil_interp _AddSlotsIfAbsent: (| cecil_formal_param_list = () |)

globals cecil_interp _AddSlotsIfAbsent: ( | cecil_parameterized_object = () | )
cecil_parameterized_object _Define: cecil_object clone _AddSlots: ( |
    _ parent* = traits cecil_parameterized_object.
    name <- ''.
    params <- cecil_formal_param_list.
    defining_context <- cecil_context.
| )


traits cecil_interp _AddSlotsIfAbsent: ( | cecil_named_object = () | )
traits cecil_named_object _Define: ( |
    parent* = traits cecil_parameterized_object.

    copy = ( resend.copy instantiations: instantiations copy ).

    copyInstantiatingWith: p AtLocation: location = ( | obj |
	defining_context interp doInstantiation ifFalse: [ ^ self ].
	obj: instantiations at: p IfAbsent: [
	    instantiations at: p Put: nil.
	    obj: cecil_instantiated_object copyInstantiating: self With: p
		AtLocation: location.
	    instantiations at: p Put: obj.
	    ^ obj ].
	obj == nil ifTrue: [
	    cecilErr: 'illegal cyclic inheritance for ', printString.
	].
	obj ).

    needsInstantiation = ( params nonEmpty ).

    attachMethod: m = (
	needsInstantiation && [m resolvedContext interp doInstantiation]
	  ifTrue: [
	    error: 'shouldn\'t be attaching a method to a parameterized object'.
	].
	resend.attachMethod: m.
    ).

    attachedMethodsDo: block = (
	resend.attachedMethodsDo: block.
	needsInstantiation ifTrue: [
	    instantiations do: [ | :obj. :params |
		obj localAttachedMethods do: block.
	    ].
	].
    ).
| )

globals cecil_interp _AddSlotsIfAbsent: ( | cecil_named_object = () | )
cecil_named_object _Define: cecil_parameterized_object clone _AddSlots: ( |
    _ parent* = traits cecil_named_object.
    "the following are used only for parameterized objects"
    instantiations <- dictionary. "cecil_param_list->cecil_instantiated_object"
| )


traits cecil_interp _AddSlotsIfAbsent: ( | cecil_predicate_object = () | )
traits cecil_predicate_object _Define: ( |
    parent* = traits cecil_named_object.

    copyName: n Params: p In: context When: w = ( | c |
	c: copyName: n Params: p In: context.
	c when: w.
	c kind: cecil_predicate_kind.
	c ).

    attachMethod: m = (
	" remember that messages with the same name as this method need to
	  consider predicate objects (i.e. can't be cached in this impl) "
	m enclosingContext interp == cecil_interpreter ifTrue: [
	    error: 'method doesn\'t have a real context yet'.
	].
	m enclosingContext interp messagesAffectedByPredicateObjects
	    add: m name.
	resend.attachMethod: m ).
| )

globals cecil_interp _AddSlotsIfAbsent: ( | cecil_AST_node = () | )

globals cecil_interp _AddSlotsIfAbsent: ( | cecil_predicate_object = () | )
cecil_predicate_object _Define: cecil_named_object clone _AddSlots: ( |
    _ parent* = traits cecil_predicate_object.
    when <- cecil_AST_node.
| )


traits cecil_interp _AddSlotsIfAbsent: ( | cecil_extension_object = () | )
traits cecil_extension_object _Define: ( |
    parent* = traits cecil_parameterized_object.
| )

globals cecil_interp _AddSlotsIfAbsent: ( | cecil_extension_object = () | )
cecil_extension_object _Define: cecil_parameterized_object clone _AddSlots: ( |
    _ parent* = traits cecil_extension_object.
    params <- cecil_param_list.
| )


traits cecil_interp _AddSlotsIfAbsent: ( | cecil_instantiated_object = () | )
traits cecil_instantiated_object _Define: ( |
    parent* = traits cecil_object.

    printString = ( name, params printString ).
    ancestryPrintString = ''. "don't include ancestry for named object"
    cecilShortPrintString = ( name, params cecilShortPrintString ).
    nameString = ( ' ', cecilShortPrintString ).

    copy = ( error: 'shouldn\'t be called' ).

    copyInstantiating: obj With: params AtLocation: location = ( | c. context. |
	c: clone.	"don't call copy!"

	"make copies of nested data structures"
	c predicateParents: predicateParents copy.
	c states: states copy.
	c localAttachedMethods: localAttachedMethods copyRemoveAll.
	c creationTime: 'unknown'.

	c parameterized_object: obj.
	c params: params.

	"copy over ancestry from parameterized object"
	c parentSpecs: obj parentSpecs copy.
	c isaSpecs: obj isaSpecs copy.
	c supertypeSpecs: obj supertypeSpecs copy.
	c type: obj type copyInstantiatingWith: params
	    In: obj defining_context AtLocation: location.

	"create a special context with parameters instantiated"
	context: cecil_nested_context createInContext: obj defining_context.
	obj params with: params Do: [ | :formal. :actual |
	    context addTypeDecl: formal name Type: actual type.
	].

	"resolve instantiated object in context with parameters instantiated"
	c resolveNames: context.
	
	c ).

    { 'attached_method_operations'
	attachedMethodsDo: block = (
	    "this will iterate through all its instantiations,
	     including this one and any 'generic' instantiations"
	    parameterized_object attachedMethodsDo: block.
	).
	
	attachMethod: m = (
	    localAttachedMethods add: m.
	).
	detachMethod: m = (	
	    "a method could be constrained to the same argument constraint
	     more than once. So when the method is no longer in the 
	     attachedMethods, it is not an error"
	    localAttachedMethods remove: m IfAbsent: [].
	).
    }

    "forwarders"
    name = ( parameterized_object name ).
    kind = ( parameterized_object kind ).
    isType = ( parameterized_object isType ).
    predicateChildren = ( parameterized_object predicateChildren ).
    location = ( parameterized_object location ).

    compilerProcessed = ( parameterized_object compilerProcessed ).
    compilerProcessed: flag = ( parameterized_object compilerProcessed: flag. ).
    compilerStates = ( parameterized_object compilerStates ).
    compilerStates: states = ( parameterized_object compilerStates: states ).

    isInstantiated = true.
| )

globals cecil_interp _AddSlotsIfAbsent: (| cecil_instantiated_object = () |)
cecil_instantiated_object _Define: ( |
    _ parent* = traits cecil_instantiated_object.
    _ thisObjectPrints = true.

    parameterized_object <- cecil_named_object.

    params <- cecil_param_list.

    parentSpecs <- cecil_spec_list. "list of inherited parent specs"
    isaSpecs <- cecil_spec_list. "list of objects"
    supertypeSpecs <- cecil_spec_list.

    predicateChildrenUsed <- false. "have they been read?"
    predicateParents <- set.  "computed immediate parent predicate objects"
    predicateParentsCalculated <- false.

    type <- cecil_named_type.

    states <- dictionary.

    localAttachedMethods <- set.

    creationTime <- 'prototype'.	" or 'static' or 'dynamic' "
| )


traits cecil_interp _AddSlotsIfAbsent: ( | cecil_top_object = () | )
traits cecil_top_object _Define: ( |
    parent* = traits cecil_named_object.
    isTopObject = true.
| )

globals cecil_interp _AddSlotsIfAbsent: ( | cecil_top_object = () | )
cecil_top_object _Define: cecil_named_object clone _AddSlots: ( |
    _ parent* = traits cecil_top_object.
| )


"cecil_closure_object represents an unoptimized closure objects"

traits cecil_interp _AddSlotsIfAbsent: ( | cecil_closure_object = () | )
traits cecil_closure_object _Define: ( |
    parent* = traits cecil_object.

    printString = '<a closure>'.
    cecilShortPrintString = ( printString ).
    ancestryPrintString = ''. "don't include ancestry for closure"
    cecilUIPrintString = ( cecilShortPrintString ).

    createWithMethod: method InContext: context = ( | object |
	object: copy.
	object newParent: 'closure'
	       AndObject: context lookup_top_context_object: 'closure'.
	object creationTime: context creationTime.
	object resolvedMethod:
	    method createEvalMethod: object WithContext: context.
	object ).

    isUnoptimizedClosureObject = true.
| )

globals cecil_interp _AddSlotsIfAbsent: ( | cecil_eval_method = () | )

globals cecil_interp _AddSlotsIfAbsent: ( | cecil_closure_object = () | )
cecil_closure_object _Define: cecil_object clone _AddSlots: ( |
    _ parent* = traits cecil_closure_object.
    resolvedMethod <- cecil_eval_method.
    isPredefined <- false.
| )


"cecil_optimized_closure_object represents a closure object for the optimized
 closure objects. It is different from other cecil object in containing 
 a lexical context for buiding up the correct lexically enclosing context
 for its eval method, and in figuring out what is its singly inherited 
 parent for finding the caching methods in method caches.

 As cecil_optimized_closure_object inherits from a dummy cecil_object for 
 its corresponding cecil_optimized_eval_method (this is where the optimization 
 comes from). The dummy cecil_object is called the pseudoClosureParent
 and it is inserted into the cecil_optimized_closure_object by the following
 createWithParent:InContext: msg."
 
traits cecil_interp _AddSlotsIfAbsent: ( |
    cecil_optimized_closure_object = () | )
traits cecil_optimized_closure_object _Define: ( |
    parent* = traits cecil_closure_object.

    createWithMethod: method InContext: context = ( 
	error: 'shouldn\'t be called on an optimized_closure_object'.
    ).

    createWithParent: obj InContext: context = ( | object. newParent. |
	obj creationTime != context creationTime ifTrue: [
	    error: 'pseudo-parent should be dynamic time, too'.
	].
	object: copy.
	object parentSpecs add:
	    cecil_fixed_spec copyName: '<pseudo-parent>' Object: obj.
	object lexicalContext: context.
	object creationTime: context creationTime.
	object ).

    existsEvalMethodWithArgSize: n = (
	"check the pseudo closure object for the eval method"
	parentSpecs first object existsEvalMethodWithArgSize: n.
    ).

    isUnoptimizedClosureObject = false.
| )

globals cecil_interp _AddSlotsIfAbsent: ( | cecil_nested_context = () | )

globals cecil_interp _AddSlotsIfAbsent: ( |
    cecil_optimized_closure_object = () | )
cecil_optimized_closure_object _Define: cecil_closure_object clone _AddSlots: (|
    _ parent* = traits cecil_optimized_closure_object.
    "closure keeps its lexically enclosing context for its
     cecil_optimized_eval_method"
    lexicalContext <- cecil_nested_context. 
| )

traits cecil_interp _AddSlotsIfAbsent: ( | cecil_literal_object = () | )
traits cecil_literal_object _Define: ( |
    "a literal object is a subtype of the cecil_concrete_object"
    parent* = traits cecil_object.

    printString = ( 'cecil(', basic_value printString, ')' ).

    cecilShortPrintString = ( basic_value printString ).
    ancestryPrintString = ''. "don't include ancestry for literal"
    statePrintString = ''. "don't include state for literal"
    cecilPrintString = ( cecilShortPrintString ).
    cecilUIPrintString = ( cecilPrintString ).

    = x = ( x isLiteral && [basic_value = x basic_value] ).

    "Literals created at parse time are constructed within cecil_literal_node
     using copyValue:.   The parent object spec is not resolved yet, but
     will be resolved when cecil_literal_node is sent the eval: msg.

     Literals created at run time are resolved at creation time
     by the copyValue:InContext: msg."

    copyValue: v = ( | newObj |
	newObj: copy.
	newObj basic_value: v.
	newObj parentSpecs add:
	    cecil_named_object_spec createWithName: parentName.
	newObj ).

    copyValue: v InContext: context = (	| newObj |
	newObj: copyValue: v.
	newObj resolveNames: context top_context.
	newObj ).

    isLiteral = true.
| )

globals cecil_interp _AddSlotsIfAbsent: (| cecil_literal_object = () |)
cecil_literal_object _Define: cecil_object clone _AddSlots: ( |
    _ parent* = traits cecil_literal_object.
    basic_value.	" holds the Self object representing the value "
| )


traits cecil_interp _AddSlotsIfAbsent: ( | cecil_integer_literal = () | )
traits cecil_integer_literal _Define: ( |
    parent* = traits cecil_literal_object.
    integerValueInContext: c = ( basic_value ).
    parentName = 'integer'.
| )

globals cecil_interp _AddSlotsIfAbsent: (| cecil_integer_literal = () |)
cecil_integer_literal _Define: cecil_literal_object clone _AddSlots: ( |
    _ parent* = traits cecil_integer_literal.
    _ thisObjectPrints = true.
| )


traits cecil_interp _AddSlotsIfAbsent: ( | cecil_float_literal = () | )
traits cecil_float_literal _Define: ( |
    parent* = traits cecil_literal_object.
    floatValueInContext: c = ( basic_value ).
    parentName = 'float'.
| )

globals cecil_interp _AddSlotsIfAbsent: (| cecil_float_literal = () |)
cecil_float_literal _Define: cecil_literal_object clone _AddSlots: ( |
    _ parent* = traits cecil_float_literal.
    _ thisObjectPrints = true.
| )


traits cecil_interp _AddSlotsIfAbsent: ( | cecil_char_literal = () | )
traits cecil_char_literal _Define: ( |
    parent* = traits cecil_literal_object.
    cecilShortPrintString = ( '\'', basic_value asString, '\'' ).
    charValueInContext: c = ( basic_value ).
    parentName = 'char'.
| )

globals cecil_interp _AddSlotsIfAbsent: (| cecil_char_literal = () |)
cecil_char_literal _Define: cecil_literal_object clone _AddSlots: ( |
    _ parent* = traits cecil_char_literal.
    _ thisObjectPrints = true.
| )


traits cecil_interp _AddSlotsIfAbsent: ( | cecil_string_literal = () | )
traits cecil_string_literal _Define: ( |
    parent* = traits cecil_literal_object.

    cecilShortPrintString = ( '"', basic_value, '"' ).

    copyValue: v = ( | s |
	s: resend.copyValue: v.
	s atPrimFieldName: 'length' Of: 'string' Put:
	    cecil_integer_literal copyValue: v size.
	s ).
    copyValue: v InContext: context = ( | s. len. |
	s: resend.copyValue: v InContext: context.
	len: s atPrimFieldName: 'length' Of: 'string' InContext: nil.
	len resolveNames: context top_context.
	s ).

    stringLengthInContext: c = ( basic_value size ).
    setStringLength: length InContext: context = (
	error: 'shouldn\'t be calling this on a string literal' ).
    
    stringElem: index InContext: c = (
	cecil_char_literal copyValue: (basic_value at: index) InContext: c ).
    stringElem: index Put: value InContext: c = (
	basic_value at: index Put: value charValueInContext: c.
	self ).

    "return Self objects, not Cecil objects"
    stringValueInContext: c = ( basic_value ).

    parentName = 'string'.
| )

globals cecil_interp _AddSlotsIfAbsent: ( | cecil_string_literal = () | )
cecil_string_literal _Define: cecil_literal_object clone _AddSlots: ( |
    _ parent* = traits cecil_string_literal.
    _ thisObjectPrints = true.
| )


"cecil_void represents no return value"
globals cecil_interp _AddSlotsIfAbsent: ( | cecil_void = () | )
cecil_void _Define: ( |
    _ parent* = traits oddball.
    _ errHandlingParent* = mixins cecil_error_handling.
    _ thisObjectPrints = true.
    printString = 'cecil_void'.
    isLiteral = false.
|)


"cecil_uninitialized_field_contents used for contents of uninitialized fields"
globals cecil_interp _AddSlotsIfAbsent: ( | 
    cecil_uninitialized_field_contents = () | )
cecil_uninitialized_field_contents _Define: ( |
    _ parent* = traits oddball.
    _ errHandlingParent* = mixins cecil_error_handling.
    _ thisObjectPrints = true.
    printString = 'uninitialized field contents'.
    isLiteral = false.
    isUninitialized = true.
| )


"cecil_uninitialized_variable used for contents of uninitialized variables
 (only during evaluation of a declaration block, though)"
globals cecil_interp _AddSlotsIfAbsent: (| cecil_uninitialized_variable = () |)
cecil_uninitialized_variable _Define: ( |
    _ parent* = traits oddball.
    _ errHandlingParent* = mixins cecil_error_handling.
    _ thisObjectPrints = true.
    printString = 'uninitialized variable'.
    isLiteral = false.
| )


" Argument lists for sends "

traits cecil_interp _AddSlotsIfAbsent: ( | cecil_obj_list = () | )
traits cecil_obj_list _Define: ( |
    parent* = traits list.
    errHandlingParent* = mixins cecil_error_handling.

    cecilShortPrintString = ( | s |
	s: '('.
	doFirst: [ | :e |
	    s: s, e cecilShortPrintString.
	] MiddleLast: [ | :e |
	    s: s, ', ', e cecilShortPrintString.
	] IfEmpty: [].
	s: s, ')'.
	s ).
| )

globals cecil_interp _AddSlotsIfAbsent: (| cecil_obj_list = () |)
cecil_obj_list _Define: list clone _AddSlots: ( |
    _ parent* = traits cecil_obj_list.
| )

