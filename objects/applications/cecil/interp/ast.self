"Sun-$Revision: 9.1 $"

"*************************
 *                       *
 *      AST Nodes        *
 *                       *
 *************************"

traits cecil_interp _AddSlotsIfAbsent: ( | cecil_AST_node = () | )
traits cecil_AST_node _Define: ( |
    parent* = traits clonable.
    errHandlingParent* = mixins cecil_error_handling.
    isVarNode = false.
    isLiteral = false.
    isBinaryMsg = false.
    isEffectExpression = false.
    isSugarMsg = false.
    isUninitialized = false.
    isClosureNode = false.
    isIncludeNode = false.
    isEndIncludeNode = false.
    hasSavedRepresentation = false.
| )

globals cecil_interp _AddSlotsIfAbsent: ( | token_location = () | )

globals cecil_interp _AddSlotsIfAbsent: (| cecil_AST_node = () |)
cecil_AST_node _Define: ( |
    _ parent* = traits cecil_AST_node.
    location <- token_location.
|)

traits cecil_interp _AddSlotsIfAbsent: ( | cecil_object_expr_node = () | )
traits cecil_object_expr_node _Define: ( |
    parent* = traits cecil_object_or_expr.
    other_parent* = traits cecil_AST_node.

    printString = (
	kindString, nameString, ancestryPrintString, fieldInitString,
	    whenString ).
    kindString = (
	(kind isUnspecified ifTrue: '' False: [kind printString, ' ']),
	    (isType ifTrue: 'type' False: 'object') ).
    nameString = ''.
    ancestryPrintString = ( | str |
	isaSpecs doFirst: [ |:p| 
	    str: ' isa ', p printString.
	] MiddleLast: [ |:p| 
	    str: str, ', ', p printString.
	] IfEmpty: [
	    str: ''.
	].
	parentSpecs doFirst: [ |:p| 
	    str: str, ' inherits ', p printString.
	] MiddleLast: [ |:p| 
	    str: str, ', ', p printString.
	] IfEmpty: [
	].
	supertypeSpecs doFirst: [ |:t| 
	    str: str, ' subtypes ', t printString.
	] MiddleLast: [ |:p| 
	    str: str, ', ', t printString.
	] IfEmpty: [
	].
	str ).
    fieldInitString = ( | str |
	fieldInitDecls isEmpty ifTrue: [ ^ '' ].
	str: ' { '.
	fieldInitDecls doFirst: [ |:init| str: str, init printString ]
	    MiddleLast: [ |:init| str: str, ', ', init printString ]
	    IfEmpty: [ error: 'shouldn\'t be here' ].
	str, ' }' ).
    whenString = ''.

    copy = ( parent.copy fieldInitDecls: fieldInitDecls copy ).

    setKind: k = (
	k = 'concrete' ifTrue: [
	    kind: cecil_concrete. 
	] False: [
	    k = 'template' ifTrue: [
		kind: cecil_template. 
	    ] False: [
		k = 'abstract' ifTrue: [
		    kind: cecil_abstract.
		] False: [
		    error: '"concrete", "abstract", or "template" is expected'
		] ] ].
    ).
| )

globals cecil_interp _AddSlotsIfAbsent: (| cecil_field_init_list = () |)

globals cecil_interp _AddSlotsIfAbsent: ( | cecil_object_expr_node = () | )
cecil_object_expr_node _Define: cecil_object_or_expr clone _AddSlots: ( |
    _ parent* = traits cecil_object_expr_node.
    _ thisObjectPrints = true.
    fieldInitDecls <- cecil_field_init_list.
| )


traits cecil_interp _AddSlotsIfAbsent: ( | cecil_object_decl_node = () | )
traits cecil_object_decl_node _Define: ( |
    parent* = traits cecil_object_expr_node.

    nameString = ( ' ', name, params printString ).

    cecilPrintString = ( cecilShortPrintString ).
    cecilShortPrintString = ( name, params cecilShortPrintString ).

    copy = ( resend.copy params: params copy ).
| )

globals cecil_interp _AddSlotsIfAbsent: ( | cecil_object_decl_node = () | )
cecil_object_decl_node _Define: cecil_object_expr_node clone _AddSlots: ( |
    _ parent* = traits cecil_object_decl_node.
    name <- 'prototype object decl'.
    params <- cecil_formal_param_list.
    isPredefined <- false.
| )


traits cecil_interp _AddSlotsIfAbsent: ( | cecil_predicate_decl_node = () | )
traits cecil_predicate_decl_node _Define: ( |
    parent* = traits cecil_object_decl_node.
    kindString = 'pred '.
    whenString = (
	when == cecil_AST_node ifTrue: '' False: [' when ', when printString] ).
    copy = ( resend.copy kind: cecil_predicate_kind ).
| )

globals cecil_interp _AddSlotsIfAbsent: ( | 
    cecil_predicate_decl_node = () | )
cecil_predicate_decl_node _Define: cecil_object_decl_node clone _AddSlots: ( |
    _ parent* = traits cecil_predicate_decl_node.
    when <- cecil_AST_node.
| )


traits cecil_interp _AddSlotsIfAbsent: ( | 
    cecil_object_extension_decl_node = () | )
traits cecil_object_extension_decl_node _Define: ( |
    parent* = traits cecil_object_decl_node.
    kindString = ''.
| )

globals cecil_interp _AddSlotsIfAbsent: ( | 
    cecil_object_extension_decl_node = () | )
cecil_object_extension_decl_node _Define: cecil_object_decl_node clone _AddSlots: ( |
    _ parent* = traits cecil_object_extension_decl_node.
    name <- 'prototype extension decl'.
    params <- cecil_param_list.
| )


traits cecil_interp _AddSlotsIfAbsent: ( | cecil_field_init_list = () | )
traits cecil_field_init_list _Define: ( |
    parent* = traits list.
    errHandlingParent* = mixins cecil_error_handling.
| )

globals cecil_interp _AddSlotsIfAbsent: (| cecil_field_init_list = () |)
cecil_field_init_list _Define: list clone _AddSlots: ( |
    _ parent* = traits cecil_field_init_list.
| )


traits cecil_interp _AddSlotsIfAbsent: ( | cecil_field_init_node = () | )
traits cecil_field_init_node _Define: ( |
    parent* = traits cecil_AST_node.

    printString = ( 
	fieldName, 
	    (constraintSpec isSpecified
		ifFalse: '' True: ['@', constraintSpec printString]),
	    ' ', assignName, ' ', expr printString ).

    copyName: n Constraint: c WithExpr: e = (
	((copy fieldName: n) constraintSpec: c) expr: e ).

    constraint = ( constraintSpec object ).
| )

globals cecil_interp _AddSlotsIfAbsent: (| cecil_field_init_node = () |)
cecil_field_init_node _Define: cecil_AST_node clone _AddSlots: ( |
    _ parent* = traits cecil_field_init_node.
    fieldName <- ''.
    constraintSpec <- cecil_unspecified.
    expr <- cecil_AST_node.
| )

traits cecil_interp _AddSlotsIfAbsent: ( | cecil_field_init_assign_node = () | )
traits cecil_field_init_assign_node _Define: ( |
    parent* = traits cecil_field_init_node.
    assignName = ':='.
| )

globals cecil_interp _AddSlotsIfAbsent: (| cecil_field_init_assign_node = () |)
cecil_field_init_assign_node _Define: cecil_field_init_node clone _AddSlots: ( |
    _ parent* = traits cecil_field_init_assign_node.
    _ thisObjectPrints = true.
| )

traits cecil_interp _AddSlotsIfAbsent: ( | cecil_include_node = () | )
traits cecil_include_node _Define: ( |
    parent* = traits cecil_AST_node.
    copyName: name = ( resend.copy fileName: name ).
    printString = ( 'include "', fileName, '"' ).
    isIncludeNode = true.
| )

globals cecil_interp _AddSlotsIfAbsent: (| cecil_end_include_node = () |)

globals cecil_interp _AddSlotsIfAbsent: (| cecil_include_node = () |)
cecil_include_node _Define: ( |
    parent* = traits cecil_include_node.
    fileName <- 'Name of file'.
    topLevel <- false.
    fastParse <- false.
    companion <- cecil_end_include_node.
| )

traits cecil_interp _AddSlotsIfAbsent: ( | cecil_end_include_node = () | )
traits cecil_end_include_node _Define: ( |
    parent* = traits cecil_AST_node.
    printString = ( '-- end include "', fileName, '"' ).
    copyName: name = ( resend.copy fileName: name ).
    isEndIncludeNode = true.
| )
globals cecil_interp _AddSlotsIfAbsent: (| cecil_end_include_node = () |)
cecil_end_include_node _AddSlots: ( |
    parent* = traits cecil_end_include_node.
    fileName <- 'Name of file'.
    savedFileName <- 'No saved file'.
    topLevel <- false.
| )

traits cecil_interp _AddSlotsIfAbsent: ( | cecil_prim_include_node = () | )
traits cecil_prim_include_node _Define: ( |
    parent* = traits cecil_AST_node.
    printString = ( 'prim include "', fileName, '"' ).
    copyName: name = ( resend.copy fileName: name ).
| )
globals cecil_interp _AddSlotsIfAbsent: ( | cecil_prim_include_node = () | )
cecil_prim_include_node _Define: ( |
    parent* = traits cecil_prim_include_node.
    fileName <- 'Name of file'.
| )

traits cecil_interp _AddSlotsIfAbsent: ( | cecil_field_init_constant_node = () | )
traits cecil_field_init_constant_node _Define: ( |
    parent* = traits cecil_field_init_node.
    assignName = '='.
| )

globals cecil_interp _AddSlotsIfAbsent: (| cecil_field_init_constant_node = () |)
cecil_field_init_constant_node _Define: cecil_field_init_node clone _AddSlots: ( |
    _ parent* = traits cecil_field_init_constant_node.
    _ thisObjectPrints = true.
| )


" cecil_decl_node, cecil_extension_decl_node, and cecil_method_node are the
  three kinds of asts representing declarations "

traits cecil_interp _AddSlotsIfAbsent: ( | cecil_decl_node = () | )
traits cecil_decl_node _Define: ( |
    parent* = traits cecil_AST_node.
    printString = ( binding printString ).
    copyWithBinding: b = ( copy binding: b ).
| )

globals cecil_interp _AddSlotsIfAbsent: ( | cecil_binding = () | )

globals cecil_interp _AddSlotsIfAbsent: (| cecil_decl_node = () |)
cecil_decl_node _Define: cecil_AST_node clone _AddSlots: ( |
    _ parent* = traits cecil_decl_node.
    _ thisObjectPrints = true.
    binding <- cecil_binding.
| )

traits cecil_interp _AddSlotsIfAbsent: ( | cecil_extension_decl_node = () | )
traits cecil_extension_decl_node _Define: ( |
    parent* = traits cecil_AST_node.
    printString = ( value printString ).
    copyWithValue: v = ( copy value: v ).
| )

globals cecil_interp _AddSlotsIfAbsent: (| cecil_extension_decl_node = () |)
cecil_extension_decl_node _Define: cecil_AST_node clone _AddSlots: ( |
    _ parent* = traits cecil_extension_decl_node.
    _ thisObjectPrints = true.
    value <- cecil_object_extension_decl_node.
    resolvedContext <- nil. "or cecil_nested_context"
| )

traits cecil_interp _AddSlotsIfAbsent: ( | cecil_field_info_node = () | )
traits cecil_field_info_node _Define: ( |
    parent* = traits cecil_AST_node.
    printString = (
	((kind printString) != 'normal' ifTrue: [ (kind printString), ' ' ] False: [ '' ] ),
	    'field ', name, '(@', constraintObject printString, ')' 
    ).
    copyWithName: n Kind: k Object: constObj = ( | c |
	c: resend.copy.
	c name: n.
	c kind: k.
	c constraintObject: constObj.
	c ).
    objectName = ( constraintObject name ).
| )

globals cecil_interp _AddSlotsIfAbsent: ( | cecil_field_info_node = () | )
globals cecil_field_info_node _Define: ( |
    parent* = traits cecil_field_info_node.
    name <- 'No name given'.
    kind <- 'No kind given'.
    constraintObject <- nil.
| )

traits cecil_interp _AddSlotsIfAbsent: ( | cecil_anon_obj_info_node = () | )
traits cecil_anon_obj_info_node _Define: ( |
    parent* = traits cecil_AST_node.
    copyWithExpr: e = ( copy obj_expr: e ).
    printString = ( 'anon_obj_info ', obj_expr printString ).
| )

globals cecil_interp _AddSlotsIfAbsent: ( | cecil_anon_obj_info_node = () | )
globals cecil_anon_obj_info_node _Define: ( |
    parent* = traits cecil_anon_obj_info_node.
    obj_expr <- cecil_object_expr_node.
| )

traits cecil_interp _AddSlotsIfAbsent: ( | cecil_method_node = () | )
traits cecil_method_node _Define: ( |
    parent* = traits cecil_AST_node.
    printString = ( method fullPrintString ).
    copyWithMethod: m = ( copy method: m ).
| )

globals cecil_interp _AddSlotsIfAbsent: (| cecil_method_node = () |)
cecil_method_node _Define: cecil_AST_node clone _AddSlots: ( |
    _ parent* = traits cecil_method_node.
    _ thisObjectPrints = true.
    method <- cecil_method.
    resolvedMethod <- cecil_method.	"used by the type-checker"
| )


traits cecil_interp _AddSlotsIfAbsent: ( | cecil_var_node = () | )
traits cecil_var_node _Define: ( |
    parent* = traits cecil_AST_node.
    printString = ( name, params printString ).
    copyWithName: n Params: ps = ( (copy name: n) params: ps ).
    isVarNode = true.
| )

globals cecil_interp _AddSlotsIfAbsent: (| cecil_var_node = () |)
cecil_var_node _Define: cecil_AST_node clone _AddSlots: ( |
    _ parent* = traits cecil_var_node.
    _ thisObjectPrints = true.
    name <- ''.
    params <- cecil_param_list.
| )


traits cecil_interp _AddSlotsIfAbsent: ( | cecil_literal_node = () | )
traits cecil_literal_node _Define: ( |
    parent* = traits cecil_AST_node.

    printString = ( cecilShortPrintString ).
    cecilShortPrintString = ( value cecilShortPrintString ).
    ancestryPrintString = ''.	"not declared by programmer"

    copy = ( (resend.copy value: value copy) dynamicValue: dynamicValue copy ).
    copyWithValue: literalValue = ( clone value: literalValue ).

    isLiteral = true.
    getLiteralValue = ( value value ).
| )

globals cecil_interp _AddSlotsIfAbsent: (| cecil_literal_node = () |)
cecil_literal_node _Define: cecil_AST_node clone _AddSlots: ( |
    _ parent* = traits cecil_literal_node.
    _ thisObjectPrints = true.
    " this is a static Cecil object representing the literal "
    value <- cecil_literal_object.
    " this is a dynamic Cecil object representing the literal "
    dynamicValue <- nil.
| )


traits cecil_interp _AddSlotsIfAbsent: ( | cecil_expr_list = () | )
traits cecil_expr_list _Define: ( |
    parent* = traits list.
    errHandlingParent* = mixins cecil_error_handling.

    printString = ( | str |
	doFirst: [      |:e| str:            e printString.
	] MiddleLast: [ |:e| str: str, ', ', e printString.
	] IfEmpty: [         str: ''.
	].
	str ).
| )

globals cecil_interp _AddSlotsIfAbsent: (| cecil_expr_list = () |)
cecil_expr_list _Define: list clone _AddSlots: ( |
    _ parent* = traits cecil_expr_list.
| )


traits cecil_interp _AddSlotsIfAbsent: ( | 
    cecil_array_object_expr_node = () | )
traits cecil_array_object_expr_node _Define: ( |
    parent* = traits cecil_AST_node.
    printString = ( '[', elems printString, ']' ).
    copy = ( resend.copy elems: elems copy ).
    addElement: e = ( elems add: e ).
| )

globals cecil_interp _AddSlotsIfAbsent: ( | 
    cecil_array_object_expr_node = () | )
cecil_array_object_expr_node _Define: cecil_AST_node clone _AddSlots: ( |
    _ parent* = traits cecil_array_object_expr_node.
    elems <- cecil_expr_list.
| )


traits cecil_interp _AddSlotsIfAbsent: ( | cecil_msg_node = () | )
traits cecil_msg_node _Define: ( |
    parent* = traits cecil_AST_node.
    printString = ( msgName, params printString, '(', exprs printString, ')' ).
    copy = ( (resend.copy params: params copy) exprs: exprs copy ).
    add_expr: e = ( exprs add: e ).
    isEffectExpression = true.
| )

globals cecil_interp _AddSlotsIfAbsent: (| cecil_msg_node = () |)
cecil_msg_node _Define: cecil_AST_node clone _AddSlots: ( |
    _ parent* = traits cecil_msg_node.
    _ thisObjectPrints = true.
    msgName <- ''.
    params <- cecil_param_list.
    exprs <- cecil_expr_list.
| )


traits cecil_interp _AddSlotsIfAbsent: ( | cecil_sugar_msg_node = () | )
traits cecil_sugar_msg_node _Define: ( |
    parent* = traits cecil_msg_node.
    printString = ( exprs first printString, '.', msgName ).
    copyName: n WithExpr: e = ( | c |
	c: copy msgName: n.
	c add_expr: e.
	c ).
    isSugarMsg = true.
| )

globals cecil_interp _AddSlotsIfAbsent: (| cecil_sugar_msg_node = () |)
cecil_sugar_msg_node _Define: cecil_msg_node clone _AddSlots: ( |
    _ parent* = traits cecil_sugar_msg_node.
| )


traits cecil_interp _AddSlotsIfAbsent: ( | cecil_sugar_assign_msg_node = () | )
traits cecil_sugar_assign_msg_node _Define: ( |
    parent* = traits cecil_msg_node.
    printString = (
	exprs first printString, '.', (msgName copyFrom: 4), ' := ',
	    exprs last printString ).
    copyName: n WithExprs: e = ( (copy msgName: n) exprs: e ).
| )

globals cecil_interp _AddSlotsIfAbsent: (| cecil_sugar_assign_msg_node = () |)
cecil_sugar_assign_msg_node _Define: cecil_msg_node clone _AddSlots: ( |
    _ parent* = traits cecil_sugar_assign_msg_node.
| )


traits cecil_interp _AddSlotsIfAbsent: ( | cecil_sugar_binary_assign_msg_node = () | )
traits cecil_sugar_binary_assign_msg_node _Define: ( |
    parent* = traits cecil_sugar_assign_msg_node.
    printString = (
	exprs first printString, ' ', (msgName copyFrom: 4), ' ',
	    (exprs at: 1) printString, ' := ', exprs last printString ).
| )

globals cecil_interp _AddSlotsIfAbsent: (| cecil_sugar_binary_assign_msg_node = () |)
cecil_sugar_binary_assign_msg_node _Define: cecil_msg_node clone _AddSlots: ( |
    _ parent* = traits cecil_sugar_binary_assign_msg_node.
| )


traits cecil_interp _AddSlotsIfAbsent: ( | cecil_bin_msg_node = () | )
traits cecil_bin_msg_node _Define: ( |
    parent* = traits cecil_msg_node.
    printString = (
	exprs first printString, ' ', msgName, ' ', exprs last printString ).
    copyName: name With: leftOperand With: rightOperand = ( | newMsg |
	newMsg: copy.
	newMsg msgName: name.
	newMsg add_expr: leftOperand.
	newMsg add_expr: rightOperand.
	newMsg ).
    isBinaryMsg = true.
| )

globals cecil_interp _AddSlotsIfAbsent: (| cecil_bin_msg_node = () |)
cecil_bin_msg_node _Define: cecil_msg_node clone _AddSlots: ( |
    _ parent* = traits cecil_bin_msg_node.
| )


traits cecil_interp _AddSlotsIfAbsent: ( | cecil_qualified_expr = () | )
traits cecil_qualified_expr _Define: ( |
    parent* = traits cecil_AST_node.
    printString = (
	expr printString,
	    (isDirected ifFalse: '' True: ['@', constraintSpec printString]) ).
    copyWithExpr: e Constraint: c = ( (resend.copy expr: e) constraintSpec: c ).
    isDirected = ( constraintSpec isSpecified ).
    constraint = ( constraintSpec object ).
| )

globals cecil_interp _AddSlotsIfAbsent: ( | cecil_qualified_expr = () | )
cecil_qualified_expr _Define: ( |
    _ parent* = traits cecil_qualified_expr.
    _ thisObjectPrints = true.
    expr <- cecil_AST_node.
    constraintSpec <- cecil_unspecified. 
| )


traits cecil_interp _AddSlotsIfAbsent: ( | cecil_qualified_expr_list = () | )
traits cecil_qualified_expr_list _Define: ( |
    parent* = traits cecil_expr_list.
| )

globals cecil_interp _AddSlotsIfAbsent: (| cecil_qualified_expr_list = () |)
cecil_qualified_expr_list _Define: cecil_expr_list clone _AddSlots: ( |
    _ parent* = traits cecil_qualified_expr_list.
| )


traits cecil_interp _AddSlotsIfAbsent: ( | cecil_resend_node = () | )
traits cecil_resend_node _Define: ( |
    parent* = traits cecil_AST_node.
    printString = (
	'resend', (hasArguments ifTrue: ['(', qualifiedExprs printString, ')']
			         False: '') ).
    copy = ( resend.copy qualifiedExprs: qualifiedExprs copy ).
    addQualifiedExpr: qe = ( qualifiedExprs add: qe ).
    hasArguments = ( qualifiedExprs nonEmpty ).
    isEffectExpression = true.
| )

globals cecil_interp _AddSlotsIfAbsent: (| cecil_resend_node = () |)
cecil_resend_node _Define: cecil_AST_node clone _AddSlots: ( |
    _ parent* = traits cecil_resend_node.   
    _ thisObjectPrints = true.
    qualifiedExprs <- cecil_qualified_expr_list.
| )


traits cecil_interp _AddSlotsIfAbsent: ( | cecil_assign_node = () | )
traits cecil_assign_node _Define: ( |
    parent* = traits cecil_AST_node.
    printString = ( name, ' := ', expr printString ).
    copyName: n = ( copy name: n ).
    add_expr: e = ( expr: e ).

    "in the version of the language where assignments are expressions"
    isEffectExpression = true.
| )

globals cecil_interp _AddSlotsIfAbsent: (| cecil_assign_node = () |)
cecil_assign_node _Define: cecil_AST_node clone _AddSlots: ( |
    _ parent* = traits cecil_assign_node.
    _ thisObjectPrints = true.
    name <- ''.
    expr <- cecil_AST_node.     "any legal cecil AST node"
| )


traits cecil_interp _AddSlotsIfAbsent: ( | cecil_return_node = () | )
traits cecil_return_node _Define: ( |
    parent* = traits cecil_AST_node.
    printString = (
	expr == cecil_no_result_node ifTrue: '' False: [expr printString] ).
    copyWithExpr: e = ( copy expr: e ).
| )

globals cecil_interp _AddSlotsIfAbsent: (| cecil_return_node = () |)
cecil_return_node _Define:  cecil_AST_node clone _AddSlots: ( |
    _ parent* = traits cecil_return_node.
    _ thisObjectPrints = true.
    expr <- cecil_AST_node.
| )

traits cecil_interp _AddSlotsIfAbsent: ( | cecil_nonlocal_return_node = () | )
traits cecil_nonlocal_return_node _Define: ( |
    parent* = traits cecil_return_node.
    printString = ( '^ ', resend.printString ).
| )

globals cecil_interp _AddSlotsIfAbsent: (| 
    cecil_nonlocal_return_node = () |)
cecil_nonlocal_return_node _Define: cecil_return_node clone _AddSlots: ( |
    _ parent* = traits cecil_nonlocal_return_node.
| )

globals cecil_interp _AddSlotsIfAbsent: ( | cecil_no_result_node = () | )
cecil_no_result_node _Define: ( |
    parent* = traits cecil_AST_node.
    printString = '<no result>'.
    _ thisObjectPrints = true.
| )


traits cecil_interp _AddSlotsIfAbsent: ( | cecil_closure_node = () | )
traits cecil_closure_node _Define: ( |
    parent* = traits cecil_AST_node.

    isClosureNode = true.

    printString = (
	method formals isEmpty && [method resultTypeSpec isUndeclared] ifTrue: [
	    method body fullPrintString
	] False: [
	    '&', method argsAndBodyPrintString
	] ).

    ^ copy = ( resend.copy method: method copy ).
| )

globals cecil_interp _AddSlotsIfAbsent: (| cecil_closure_node = () |)
cecil_closure_node _Define: cecil_AST_node clone _AddSlots: ( |
    _ parent* = traits cecil_closure_node.  
    _ thisObjectPrints = true.
    method <- cecil_eval_method.  
    resolvedClosure <- cecil_closure_object.
| )

traits cecil_interp _AddSlotsIfAbsent: ( | 
    cecil_optimized_closure_node = () | )
traits cecil_optimized_closure_node _Define: ( |
    parent* = traits cecil_closure_node.
| )

globals cecil_interp _AddSlotsIfAbsent: (|
    cecil_optimized_closure_node = () |)
cecil_optimized_closure_node _Define: cecil_closure_node clone _AddSlots: ( |
    _ parent* = traits cecil_optimized_closure_node.  

    "these two are dynamic object and method, used only by the interpreter;
     still have unoptimized eval method for use during type checking"
    optimizedClosureParent <- nil.
    optimizedEvalMethod <- cecil_optimized_eval_method.  "a special eval method"
| )


traits cecil_interp _AddSlotsIfAbsent: ( | cecil_nested_scope_node = () | )
traits cecil_nested_scope_node _Define: ( |
    parent* = traits cecil_AST_node.
    printString = ( body fullPrintString ).
    copy = ( clone body: body copy ).
    addStmt: s = ( body addStmt: s ).
    resultExpr: e = ( body resultExpr: e ).
    isEffectExpression = ( body resultExpr expr = cecil_no_result_node ).
| )

globals cecil_interp _AddSlotsIfAbsent: (| cecil_nested_scope_node = () |)
cecil_nested_scope_node _Define: cecil_AST_node clone _AddSlots: ( |
    _ parent* = traits cecil_nested_scope_node.  
    _ thisObjectPrints = true.
    body <- cecil_nested_scope_body.
| )


traits cecil_interp _AddSlotsIfAbsent: ( | cecil_decl_block = () | )
traits cecil_decl_block _Define: ( |
    parent* = traits list.
    errHandlingParent* = mixins cecil_error_handling.

    printString = ( | str |
	str: ''.
	doFirst: [ |:d| str: str, d printString ]
	    MiddleLast: [ |:d| str: str, ';\n\t', d printString ]
	    IfEmpty: [].
	str ).
| )

globals cecil_interp _AddSlotsIfAbsent: (| cecil_decl_block = () |)
cecil_decl_block _Define: list clone _AddSlots: ( |
    _ parent* = traits cecil_decl_block.
| )
