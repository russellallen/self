"Sun-$Revision: 9.1 $"

"Cecil signatures."

traits cecil_interp _AddSlotsIfAbsent: ( | cecil_signature = () | )
traits cecil_signature _Define: ( |
    parent* = traits clonable.
    errHandlingParent* = mixins cecil_error_handling.

    printString = ( | str. |
	str: 'signature ', name, params printString, '('.
	args doFirst:    [ | :el | str: str, el printString. ]
             MiddleLast: [ | :el | str: str, ',', el printString. ]
	     IfEmpty:    [ ].
	str: str, '):', result printString.
	isPrivate ifTrue: [
	    str: 'private ', str, '<'.
	    constraints doFirst:    [ | :el | str: str, el printString. ]
		        MiddleLast: [ | :el | str: str, ',', el printString. ]
		        IfEmpty:    [ ].
	    str: str, '>'.
	].
	str ).

    copy = (
	(((resend.copy
			args: args copy)
		    constraints: constraints copy)
		params: params copy)
	    typeBindings: typeBindings copy ).

    createFromMethod: method In: context = ( | sig |
	sig: cecil_signature copy.
	sig name: method name.
	sig params: method params copy.
	method formals do: [ | :formal |
	    sig args add: formal type.
	].
	sig result: method resultType.
	sig typeBindings: method resolvedContext typeBindings copy.
	method isPrivate ifTrue: [
	    sig isPrivate: true.
	    sig constraints: method formals constraints.
	] False: [
	    method formals do: [
		sig constraints add: context top_object.
	    ].
	].
	sig ).

    createFromClosureType: type In: context = ( | sig |
	sig: cecil_signature copy.
	sig name: 'eval'.
	sig params: cecil_formal_param_list copyRemoveAll.
	sig args add: type.
	sig args addAll: type args.
	sig result: type result.
	sig typeBindings: typeBindings copyRemoveAll.
	sig args do: [
	    sig constraints add: context top_object.
	].
	sig ).

    = s2 = (
	(result = s2 result) && [(args = s2 args) && [params = s2 params]] ).

    implies: s2 = (
        "Check if s2 adds no new information, used in extracting signatures."
        "E.g. (s1 implies: s2) ifTrue: [ don't add s2 to the dictionary ]"

	"If result types are different, then keep both"
	result = s2 result ifFalse: [ ^ false ].

	"If params are different, then keep both"
	params = s2 params ifFalse: [ ^ false ].

	"If type bindings are different, then keep both"
	typeBindings = s2 typeBindings ifFalse: [ ^ false ].

	"If s2's arg types are subtypes of s1's arg types, then s1 implies s2;
	 so look for one that isn't a subtype"
	 args with: s2 args Do: [ | :s1arg. :s2arg. |
	    (s2arg isSubtypeOf: s1arg HandlingDynamic: false) ifFalse: [^false].
	].

	"If encapsulation info is different, then keep both"
	(isPrivate != s2 isPrivate) || [constraints != s2 constraints]
	    ifTrue: [ ^ false ].

	true ).

    "this version does old-style type-checking w/o handling parameterized
     types well"
    appliesTo: actualArgs Params: actualParams
		IfSo: soBlock IfNot: notBlock = ( | nBlock |
	"given a signature with the right name, number of arguments, and
	 number of params, does it apply to a particular message?"

	nBlock: [ ^ notBlock value ].	"an instantly-returning not block"

	"check each argument position for subtyping,
	 and extend type bindings with implicit type variables"
	args with: actualArgs Do: [ | :formal. :actual. |
	    "exclude if any actual not a subtype of formal"
	    (actual isSubtypeOf: formal) ifFalse: nBlock.
	].

	"signature applies to this send"
	soBlock value: result.
    ).

    "this version represents the beginnings of improved signature type-checking"
    newAppliesTo: actualArgs Params: actualParams
		IfSo: soBlock IfNot: notBlock = ( | nBlock |
	"given a signature with the right name, number of arguments, and
	 number of params, does it apply to a particular message?"

	nBlock: [ ^ notBlock value ].	"an instantly-returning not block"

	"maintain a mapping from type vars in the sig to actual types
	 used in the call"
	bindings: dictionary copyRemoveAll.

	"visit all binding occurrences of type vars,
	 and create a mapping from formal type vars to actual types"
	"if can't match an arg type against a formal type spec,
	 then report failure"
	params appliesTo: actualParams Bindings: bindings
	    FormalBindings: typeBindings IfNot: nBlock.
	args   appliesTo: actualArgs   Bindings: bindings
	    FormalBindings: typeBindings IfNot: nBlock.

	typeBindings nonEmpty ifTrue: [
	    "revisit all type constraints,
	     verifying that they hold for the actuals,
	     now that all binding occurrences of type vars have been resolved"
	    "this allows uses of type variables to occur before
	     binding occurrences"
	    params appliesTo: actualParams Bindings: bindings
		FormalBindings: typeBindings IfNot: nBlock.
	    args   appliesTo: actualArgs   Bindings: bindings
		FormalBindings: typeBindings IfNot: nBlock.
	].

	"check each param position for subtyping, and extend type bindings
	 with explicit type variables"
	params with: actualParams Do: [ | :formal. :actual. |
	    formal upperBound isSpecified ifTrue: [
		(actual type isSubtypeOf: formal upperBound type)
		    ifFalse: nBlock.
	    ].
	    formal lowerBound isSpecified ifTrue: [
		(formal lowerBound type isSubtypeOf: actual type)
		    ifFalse: nBlock.
	    ].
	    bindings if: formal type
		IsPresentPut: [ | :t | t lub: actual type ] AndDo: []
		IfAbsentPut: [ actual type ] AndDo: [].
	].
	
	"check each argument position for subtyping,
	 and extend type bindings with implicit type variables"
	args with: actualArgs Do: [ | :formal. :actual. |
	    "exclude if any actual not a subtype of formal"
	    (actual isSubtypeOf: formal) ifFalse: nBlock.
	].

	"signature applies to this send"

	"compute the result type, given the type bindings"

	soBlock value: result.
    ).
| )

globals cecil_interp _AddSlotsIfAbsent: (| cecil_formal_param_list = () |)
globals cecil_interp _AddSlotsIfAbsent: (| cecil_constraint_list = () |)
globals cecil_interp _AddSlotsIfAbsent: (| cecil_type_bindings = () |)

globals cecil_interp _AddSlotsIfAbsent: ( | cecil_signature = () | )
cecil_signature _Define: ( |
    _ parent* = traits cecil_signature.
    _ thisObjectPrints = true.
    name <- ''.
    params <- cecil_formal_param_list.
    args <- list. " of types "
    result <- cecil_type.
    isPrivate <- false.
    constraints <- cecil_constraint_list.
    typeBindings <- cecil_type_bindings.
    isPredefined <- false.
| )
