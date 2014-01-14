"Sun-$Revision: 9.1 $"

"tokens"

traits cecil_interp _AddSlotsIfAbsent: ( | token_location = () | )
traits token_location _Define: ( |
    parent* = traits clonable.

    printString = ( (lineNum = 0) ifTrue: [ 'unknown file location' ]
	    False: [ fileName, ':', lineNum printString] ).
|)

globals cecil_interp _AddSlotsIfAbsent: ( | token_location = () | )
token_location _Define: ( |
    _ parent* = traits token_location.
    _ thisObjectPrints = true.
    fileName <- ''.
    lineNum <- 0.
|)


traits cecil_interp _AddSlotsIfAbsent: ( | token = () | )
traits token _Define: ( |
    parent* = traits clonable.
    errHandlingParent* = mixins cecil_error_handling.

    printString = ( id, ': \"', name, '\"' ).

    copy = ( clone location: location copy ).

    createOn: id Name: n = ( | newToken. |
	newToken: copy.  
	newToken id: id.
    	newToken name: n.
	newToken ).

    "for binary operator tokens"
    _ precedence = (
	" provide precedence for standard binary operators "
	name = '**' ifTrue: [ ^ 5 ]. "exponentiation"
	(name = '*') || [(name = '/') || [name = '%']] ifTrue: [ ^ 4 ].
	(name = '+') || [name = '-'] ifTrue: [ ^ 3 ].
	(name = '=') || [(name = '!=') || 
	    [(name = '<') || [(name = '<=') ||
		    [(name = '>=') || [name = '>']]]]] ifTrue: [ ^ 2 ].
	name = '&' ifTrue: [ ^ 1 ].
	name = '|' ifTrue: [ ^ 0 ].
	'unknown' ).
    _ associativity = (
	" provide associativity for standard binary operators "
	(name = '*') || [(name = '/') || [(name = '%') ||
		[(name = '+') || [(name = '-') ||
			[(name = '&') || [name = '|']]]]]] ifTrue: [ ^'left' ].
	name = '**' ifTrue: [ ^ 'right' ].
	(name = '=') || [(name = '!=') || 
	    [(name = '<') || [(name = '<=') ||
		    [(name = '>=') || [name = '>']]]]] ifTrue: [ ^ 'none' ].
	'unknown' ).

    " this interface supports an arbitrary partial ordering of precedence
	groups, although the implementation only provides totally-ordered 
	precedence groups for a few fixed operators "
    ^ definedPrecedence = ( precedence != 'unknown' ).
    ^ higherPrecedenceThan: token = ( precedence > token precedence ).
    ^ samePrecedenceAs: token = ( 
	precedence = token precedence ifTrue: [
	    associativity = token associativity ifFalse: [
		error: 'associativities must match at same precedence level'.
	    ].
	    true
	] False: [
	    false
	] ).

    ^ definedAssociativity = ( associativity != 'unknown' ).
    ^ leftAssociative = ( associativity = 'left' ).
    ^ rightAssociative = ( associativity = 'right' ).
    ^ nonAssociative = ( associativity = 'none' ).
|)

globals cecil_interp _AddSlotsIfAbsent: ( | token = () | )
token _Define: ( |
    _ parent* = traits token.
    _ thisObjectPrints = true.
    name <- '<prototype>'.
    id <- '<prototype>'.
    location <- token_location.
|)


traits cecil_interp _AddSlotsIfAbsent: ( | literal_token = () | )
traits literal_token _Define: ( |
    parent* = traits token.

    printString = ( id, ': ', cecil_obj cecilShortPrintString ).

    createOn: id Value: v = ( | newToken. |
	newToken: resend.createOn: id Name: 'literal'.
	id = 'integer' ifTrue: [
	    newToken cecil_obj: cecil_integer_literal copyValue: v.
	] False: [
	    id = 'float' ifTrue: [
		newToken cecil_obj: cecil_float_literal copyValue: v.
	    ] False: [
		id = 'char' ifTrue: [
		    newToken cecil_obj: cecil_char_literal copyValue: v.
		] False: [
		    id = 'string' ifTrue: [
			newToken cecil_obj: cecil_string_literal copyValue: v.
		    ] False: [
			error: 'unexpected kind of literal token'.
		    ] ] ] ].
	newToken ).
    
    isString = ( id = 'string' ).
|)


globals cecil_interp _AddSlotsIfAbsent: ( | literal_token = () | )
literal_token _Define: token clone _AddSlots: ( |
    _ parent* = traits literal_token.
    cecil_obj <- cecil_literal_object.
|)

