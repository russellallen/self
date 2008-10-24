"Sun-$Revision: 9.1 $"

"the binding that's stored in the variable and type bindings of context"

traits cecil_interp _AddSlotsIfAbsent: ( | cecil_binding = () | )
traits cecil_binding _Define: ( |
    parent* = traits clonable.
    errHandlingParent* = mixins cecil_error_handling.

    copyName: name = ( copy name: name ).
    copyName: name WithValue: v = ( (copyName: name) value: v ).

    setValue: v = (
	v = cecil_void ifTrue: [
	    cecilErr: 'cannot use a non-value-returning expression in a ',
		'context that expects a value'.
	].
	value: v.
    ).

    isObjectBinding = false.
    isVariableBinding = false.

    isPredefined = ( isPredefined_internal ).
    isPredefined: flag = ( isPredefined_internal: flag ).
| )

globals cecil_interp _AddSlotsIfAbsent: ( | cecil_binding = () | )
cecil_binding _Define: ( |
    _ parent* = traits cecil_binding.
    name <- ''.
    value <- cecil_AST_node.
    isPredefined_internal <- false.
    location <- token_location.

    "pretty blecky, since location already contains a file name"
    file <- ''.    " Short name of file where name was defined "
    fullFile <- ''.    " Full name of file where name was defined "
| )


traits cecil_interp _AddSlotsIfAbsent: ( | cecil_non_object_binding = () | )
traits cecil_non_object_binding _Define: ( |
    parent* = traits cecil_binding.

    printString = (
	'var ', name,
	    (typeSpec isUndeclared
		ifTrue: '' False: [':', typeSpec printString]),
	    ' ', assignString, ' ', value printString ).

    copy = ( resend.copy typeSpec: typeSpec copy ).

    type = ( typeSpec type ).
| )

globals cecil_interp _AddSlotsIfAbsent: ( | cecil_non_object_binding = () | )
cecil_non_object_binding _Define: cecil_binding clone _AddSlots: ( |
    _ parent* = traits cecil_non_object_binding.
    typeSpec <- cecil_undeclared_type_spec.
| )

traits cecil_interp _AddSlotsIfAbsent: ( | cecil_var_binding = () | )
traits cecil_var_binding _Define: ( |
    parent* = traits cecil_non_object_binding.

    assignString = ':='.

    assignValue: v = ( setValue: v ).

    isVariableBinding = true.
| )

globals cecil_interp _AddSlotsIfAbsent: ( | cecil_var_binding = () | )
cecil_var_binding _Define: cecil_non_object_binding clone _AddSlots: ( |
    _ parent* = traits cecil_var_binding.
    _ thisObjectPrints = true.
| )

traits cecil_interp _AddSlotsIfAbsent: ( | cecil_constant_binding = () | )
traits cecil_constant_binding _Define: ( |
    parent* = traits cecil_non_object_binding.

    assignString = '='.

    assignValue: v = ( 
	cecilErr: 'cannot modify the constant "', name, '"'.
    ).
| )

globals cecil_interp _AddSlotsIfAbsent: ( | cecil_constant_binding = () | )
cecil_constant_binding _Define: cecil_non_object_binding clone _AddSlots: ( |
    _ parent* = traits cecil_constant_binding.
    _ thisObjectPrints = true.
| )


traits cecil_interp _AddSlotsIfAbsent: ( | cecil_object_binding = () | )
traits cecil_object_binding _Define: ( |
    parent* = traits cecil_binding.

    printString = ( value printString ).

    copy = ( resend.copy params: params copy ).

    assignValue: v = ( 
	cecilErr: 'cannot modify the object "', name, '"'.
    ).

    type = ( value type ).

    isObjectBinding = true.

    isPredefined: flag = (
	resend.isPredefined: flag.
	value type isPredefined: flag.
	self ).
| )

globals cecil_interp _AddSlotsIfAbsent: ( | cecil_object_binding = () | )
cecil_object_binding _Define: cecil_binding clone _AddSlots: ( |
    _ parent* = traits cecil_object_binding.
    _ thisObjectPrints = true.
    params <- cecil_formal_param_list.
    resolvedContext <- nil. "or cecil_nested_context"
| )
