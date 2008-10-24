"deltaBlue.st - The DeltaBlue constraint solver"

"$Revision: 30.1 $"

Object subclass: #Method
	instanceVariableNames: 'outIndex block '
	classVariableNames: ''
	poolDictionaries: ''
	category: 'DB-DeltaBlue'!
Method comment:
'I represent a method whose enforement procedure is stored in a Smalltalk block. Users may create custom methods by supplying an assignment expression string and a set of formal constrained variable names. See my instance creation protocol for further details.

Instance variables:
	outIndex		the index of my output variable (target of the assignment) in my constraint
	block		block to execute to enforce the constraint <BlockContext>
'!


!Method methodsFor: 'initialize-release'!

names: variableNames methodString: methodString
	"Initialize a method by compiling the given string considering the given collection of variable names to represent the parameters of the method (i.e. its inputs and outputs). A given variable may not be both an input and an output. Note: Any free variables in the methodString will be considered global (if they appear in 'Smalltalk') or temporary variables. The user is given a warning, however, since such cases are unusual and a free variable may indicate a typographical error."

	| insOutsTemps ins outs temps |
	insOutsTemps := self extractInsOutsAndTemps: methodString using: variableNames.
	ins := insOutsTemps at: 1.
	outs := insOutsTemps at: 2.
	temps := insOutsTemps at: 3.
	outIndex := self outIndexForIns: ins outs: outs temps: temps all: variableNames.
	block := Compiler
			evaluate:
				((self blockPrefixForIns: ins temps: temps args: variableNames),
				 methodString,
				 (self blockPostfixForOuts: outs allNames: variableNames))
			for: nil
			logged: false.
	(temps size > 0) ifTrue: [block fixTemps].!

release

	outIndex := nil.
	block := nil.! !

!Method methodsFor: 'constraint support'!

execute: variables
	"Execute myself to enforce my constraint on the given variables."

	block value: variables.!

outIndex
	"Answer the index of my output in the bindings array."

	^outIndex! !

!Method methodsFor: 'printing'!

printOn: aStream

	aStream
		nextPutAll: 'Method(', self asOop printString asSmalltalkString;
		nextPutAll: ' out: ', outIndex printString asSmalltalkString, ')'.! !

!Method methodsFor: 'private'!

blockPostfixForOuts: outNames allNames: allNames
	"Answer a string to be used as the postfix when creating a block for this method."

	| stream |
	"make a stream and add separator to terminate user's method string"
	stream := WriteStream on: (String new).
	stream nextPutAll: '.'; cr.

	"build the expression postfix, creating assignments for all outputs"
	1 to: allNames size do:
		[ :index |
		 (outNames includes: (allNames at: index)) ifTrue:
			[stream tab; nextPutAll: '(vars at: '.
			 stream nextPutAll: index printString, ') value: '.
			 stream nextPutAll: (allNames at: index), '.'; cr]].

	stream tab; nextPutAll: ']'; cr.
	^stream contents!

blockPrefixForIns: inNames temps: tempNames args: argNames
	"Answer a string to be used as the prefix when creating a block for a method with the given input names. All constraint variables are declared as temporaries, in addition to the temporary variables from the method string. Input variable temporaries are initialized from the argument vector."

	| stream |
	stream := WriteStream on: (String new).

	"build the expression prefix, making all the variables look like temps"
	stream nextPutAll: '| '.
	argNames do: [ :v | stream nextPutAll: v; space].
	tempNames do: [ :v | stream nextPutAll: v; space].
	stream nextPutAll: '|'; cr.

	"build the block header and input assignments"
	stream tab; nextPutAll: '[ :vars |'; cr.
	1 to: argNames size do:
		[ :index |
		 (inNames includes: (argNames at: index)) ifTrue:
			[stream tab; nextPutAll: (argNames at: index), ' := (vars at: '.
			stream nextPutAll: index printString.
			stream nextPutAll: ') value.'; cr]].

	stream tab.
	^stream contents!

extractInsOutsAndTemps: methodString using: allNames
	"Extract the input, output and temporary variable names from the Smalltalk expression represented by the given string. A temporary variable is one that is neither an input, an output, or a global. Answer an array containing the three lists (ins, outs, temps)."

	| s parseTree ins outs temps |
	s := (String new: 200) writeStream.
	s nextPutAll: 'DoIt'; cr; cr.
	s tab; nextPutAll: '| '.
	allNames do: [ :vName | s nextPutAll: vName; space].
	s nextPutAll: '|'; cr; tab; nextPutAll: methodString.
	parseTree := self parse: s contents.
	ins := parseTree referenced.
	outs := parseTree assignedTo.
	temps := parseTree allVariables select:
		[ :v | ((allNames includes: v) not) &
			  ((Smalltalk includesKey: v) not)].
	^Array with: ins with: outs with: temps!

outIndexForIns: inNames outs: outNames temps: tempNames all: allNames
	"Answer the index of the method output in the constraint variables. Raise an error if the input and output arg lists are not disjoint or if there is not exactly one output. Warn the user if the method code has free variables (these will be made into temporaries)."

	| realOuts |
	realOuts := outNames copy removeAll: tempNames; yourself.
	(realOuts size = 1) ifFalse:
		[self error: 'Constraints must have exactly one output variable'].

	outNames do:
		[ :v |
		 ((inNames includes: v) and:
		  [allNames includes: v]) ifTrue:
			[self error: v asString, ' cannot be both input and output!!']].

	tempNames do:
		[ :v |
		 Transcript show:
			'Warning: ''', v, ''' is assumed to be a temporary.'; cr].

	^allNames indexOf: (realOuts asOrderedCollection first)!

parse: methodString
	"Answer the Smalltalk parse tree for the given string."

	^(Compiler new)
		parse: methodString readStream
		in: UndefinedObject
		notifying: nil! !
"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

Method class
	instanceVariableNames: ''!


!Method class methodsFor: 'instance creation'!

names: variableNames methodString: methodString
	"Create a constraint method from the given string, an assignment statement using the given variable names. For example:

		Method names: #(a b c) methodString: 'a := b * c'"

	^(super new)
		names: variableNames
		methodString: methodString! !

Object subclass: #Strength
	instanceVariableNames: 'symbolicValue arithmeticValue '
	classVariableNames: 'AbsoluteStrongest AbsoluteWeakest Required StrengthConstants StrengthTable '
	poolDictionaries: ''
	category: 'DB-DeltaBlue'!
Strength comment:
'Strengths are used to measure the relative importance of constraints. The hierarchy of available strengths is determined by the class variable StrengthTable (see my class initialization method). Because Strengths are invariant, references to Strength instances are shared (i.e. all references to "Strength of: #required" point to a single, shared instance). New strengths may be inserted in the strength hierarchy without disrupting current constraints.

Instance variables:
	symbolicValue		symbolic strength name (e.g. #required) <Symbol>
	arithmeticValue		index of the constraint in the hierarchy, used for comparisons <Number>
'!


!Strength methodsFor: 'comparing'!

sameAs: aStrength
	"Answer true if I am the same strength as the given Strength."

	^arithmeticValue = aStrength arithmeticValue!

stronger: aStrength
	"Answer true if I am stronger than the given Strength."

	^arithmeticValue < aStrength arithmeticValue!

weaker: aStrength
	"Answer true if I am weaker than the given Strength."

	^arithmeticValue > aStrength arithmeticValue! !

!Strength methodsFor: 'max/min'!

strongest: aStrength
	"Answer the stronger of myself and aStrength."

	(aStrength stronger: self)
		ifTrue: [^aStrength]
		ifFalse: [^self].!

weakest: aStrength
	"Answer the weaker of myself and aStrength."

	(aStrength weaker: self)
		ifTrue: [^aStrength]
		ifFalse: [^self].! !

!Strength methodsFor: 'printing'!

printOn: aStream
	"Append a string which represents my strength onto aStream."

	aStream nextPutAll: '%', symbolicValue, '%'.! !

!Strength methodsFor: 'private'!

arithmeticValue
	"Answer my arithmetic value. Used for comparisons. Note that STRONGER constraints have SMALLER arithmetic values."

	^arithmeticValue!

initializeWith: symVal
	"Record my symbolic value and reset my arithmetic value."

	symbolicValue := symVal.
	self resetValue.!

resetValue
	"Lookup my symbolic value in the StrengthTable and reset my internal value."

	arithmeticValue := StrengthTable at: symbolicValue.! !
"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

Strength class
	instanceVariableNames: ''!


!Strength class methodsFor: 'class initialization'!

initialize
	"Initialize the symbolic strength table. Fix the internally caches values of all existing instances."
	"Strength initialize"

	StrengthTable := Dictionary new.
	StrengthTable at: #absoluteStrongest put: -1000.
	StrengthTable at: #required put: 0.
	StrengthTable at: #strongPreferred put: 1.
	StrengthTable at: #preferred put: 2.
	StrengthTable at: #strongDefault put: 3.
	StrengthTable at: #default put: 4.
	StrengthTable at: #weakDefault put: 5.
	StrengthTable at: #absoluteWeakest put: 1000.

	StrengthConstants := Dictionary new.
	StrengthTable keys do:
		[ :strengthSymbol |
			StrengthConstants
				at: strengthSymbol
				put: ((super new) initializeWith: strengthSymbol)].

	"Fix arithmetic values stored in all instances."
	"Strength allInstancesDo:
		[ :strength | strength resetValue]."

	AbsoluteStrongest := Strength of: #absoluteStrongest.
	AbsoluteWeakest := Strength of: #absoluteWeakest.
	Required := Strength of: #required.! !

!Strength class methodsFor: 'instance creation'!

of: aSymbol
	"Answer an instance with the specified strength."

	^StrengthConstants at: aSymbol! !

!Strength class methodsFor: 'constants'!

absoluteStrongest

	^AbsoluteStrongest!

absoluteWeakest

	^AbsoluteWeakest!

required

	^Required! !

Strength initialize!


OrderedCollection variableSubclass: #Plan
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'DB-DeltaBlue'!
Plan comment:
'A Plan is an ordered list of constraints to be executed in sequence to resatisfy all currently satisfiable constraints in the face of one or more changing inputs.'!


!Plan methodsFor: 'execution'!

execute
	"Execute my constraints in order."

	self do: [ :c | c execute].! !

Object subclass: #Planner
	instanceVariableNames: ''
	classVariableNames: 'CurrentMark'
	poolDictionaries: ''
	category: 'DB-DeltaBlue'!
Planner comment:
'I embody the DeltaBlue algorithm described in:
	"The DeltaBlue Algorithm: An Incremental Constraint Hierarchy Solver"
	by Bjorn N. Freeman-Benson and John Maloney
See January 1990 Communications of the ACM or University of Washington TR 89-08-06 for further details.'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

Planner class
	instanceVariableNames: ''!


!Planner class methodsFor: 'class initialization'!

initialize
	"Planner initialize"

	CurrentMark := 1.! !

!Planner class methodsFor: 'add/remove'!

incrementalAdd: c
	"Attempt to satisfy the given constraint and, if successful, incrementally update the dataflow graph."
	"Details: If satifying the constraint is successful, it may override a weaker constraint on its output. The algorithm attempts to resatisfy that constraint using some other method. This process is repeated until either a) it reaches a variable that was not previously determined by any constraint or b) it reaches a constraint that is too weak to be satisfied using any of its methods. The variables of constraints that have been processed are marked with a unique mark value so that we know where we've been. This allows the algorithm to avoid getting into an infinite loop even if the constraint graph has an inadvertent cycle."

	| mark overridden |
	mark := self newMark.
	overridden := c satisfy: mark.
	[overridden == nil] whileFalse:
		[overridden := overridden satisfy: mark].!

incrementalRemove: c
	"Entry point for retracting a constraint. Remove the given constraint and incrementally update the dataflow graph."
	"Details: Retracting the given constraint may allow some currently unsatisfiable downstream constraint be satisfied. We thus collect a list of unsatisfied downstream constraints and attempt to satisfy each one in turn. This list is sorted by constraint strength, strongest first, as a heuristic for avoiding unnecessarily adding and then overriding weak constraints."
	"Assume: c is satisfied."

	| out unsatisfied |
	out := c output.
	c markUnsatisfied.
	c removeFromGraph.
	unsatisfied := self removePropagateFrom: out.
	unsatisfied do: [ :u | self incrementalAdd: u].! !

!Planner class methodsFor: 'planning/value propagation'!

extractPlanFromConstraints: constraints
	"Extract a plan for resatisfaction starting from the outputs of the given constraints, usually a set of input constraints."

	| sources |
	sources := OrderedCollection new.
	constraints do:
		[ :c | ((c isInput) and: [c isSatisfied]) ifTrue: [sources add: c]].
	^self makePlan: sources!

extractPlanFromVariables: variables
	"Extract a plan from the dataflow graph having the given variables. It is assumed that the given set of variables is complete, or at least that it contains all the input variables."

	| sources |
	sources := OrderedCollection new.
	variables do:
		[ :v |
		 (v constraints) do:
			[ :c | ((c isInput) and: [c isSatisfied]) ifTrue: [sources add: c]]].
	^self makePlan: sources!

makePlan: sources
	"Extract a plan for resatisfaction starting from the given source constraints, usually a set of input constraints. This method assumes that stay optimization is desired; the plan will contain only constraints whose output variables are not stay. Constraints that do no computation, such as stay and edit constraints, are not included in the plan."
	"Details: The outputs of a constraint are marked when it is added to the plan under construction. A constraint may be appended to the plan when all its input variables are known. A variable is known if either a) the variable is marked (indicating that has been computed by a constraint appearing earlier in the plan), b) the variable is 'stay' (i.e. it is a constant at plan execution time), or c) the variable is not determined by any constraint. The last provision is for past states of history variables, which are not stay but which are also not computed by any constraint."
	"Assume: sources are all satisfied."

	| mark plan todo c |
	mark := self newMark.
	plan := Plan new.
	todo := sources.
	[todo isEmpty] whileFalse:
		[c := todo removeFirst.
		 ((c output mark ~= mark) and:		"not in plan already and..."
		  [c inputsKnown: mark]) ifTrue:		"eligible for inclusion"
			[plan addLast: c.
			 c output mark: mark.
			 c := self addConstraintsConsuming: c output to: todo]].
	^plan!

propagateFrom: v
	"The given variable has changed. Propagate new values downstream."

	| todo c |
	todo := OrderedCollection new.
	self addConstraintsConsuming: v to: todo.
	[todo isEmpty] whileFalse:
		[c := todo removeFirst.
		 c execute.
		 self addConstraintsConsuming: c output to: todo].! !

!Planner class methodsFor: 'benchmarks'!

chainTest: n
	"Do chain-of-equality-constraints performance tests, printing the results in the Transcript."
	"Planner chainTest: 100"

	| equalsC vars constraints v1 v2 eqC editConstraint plan |
	"This constraint is slower than the special-purpose EqualityConstraint."
	"equalsC := Constraint
		names: #(a b)
		methods: #('a := b'   'b := a')."

	self report: 'Built chain of ', n printString asSmalltalkString, ' equality constraints in' times: 1 run:
		[vars := (0 to: n) collect: [ :i | Variable new].
		 constraints := OrderedCollection new: n.
		 "thread a chain of equality constraints through the variables"
		 1 to: n do:
			[ :i |
			 v1 := (vars at: i).
			 v2 := (vars at: i + 1).
			 eqC := v1 requireEquals: v2 "equalsC copy var: v1 var: v2 strength: #required".
			 constraints add: eqC].
		 vars last strongDefaultStay].

	self report: 'Add constraint (case 1):' times: 1 run:
		[editConstraint := EditConstraint var: (vars first) strength: #preferred].
	self report: 'Make Plan (case 1)' times: 1 run:
		[plan := Planner extractPlanFromConstraints: (Array with: editConstraint)].
	Transcript show: 'Plan length: ', plan size printString asSmalltalkString, ' constraints'; cr.
	self report: 'Execute Plan (case 1):' times: 20 run:
		[plan execute].
	self report: 'Remove constraint (case 1):' times: 1 run:
		[editConstraint destroyConstraint].
	self report: 'Setting first node: (case 1a):' times: 1 run:
		[(vars first) setValue: 123 strength: #strongPreferred].
	self report: 'Setting last node: (case 1b):' times: 1 run:
		[(vars last) setValue: 321 strength: #strongPreferred].
	Transcript cr.

	self report: 'Add constraint (case 2):' times: 1 run:
		[editConstraint := EditConstraint var: (vars first) strength: #default].
	self report: 'Make Plan (case 2):' times: 1 run:
		[plan := Planner extractPlanFromConstraints: (Array with: editConstraint)].
	Transcript show: 'Plan length: ', plan size printString asSmalltalkString, ' constraints'; cr.
	self report: 'Execute Plan (case 2):' times: 20 run:
		[plan execute].
	self report: 'Remove constraint (case 2):' times: 1 run:
		[editConstraint destroyConstraint].
	self report: 'Setting first node: (case 2a):' times: 1 run:
		[(vars first) setValue: 1230 strength: #weakDefault].
	self report: 'Setting last node: (case 2b):' times: 1 run:
		[(vars last) setValue: 3210 strength: #weakDefault].
	Transcript cr.

	constraints do: [ :c | c release].
	vars do: [ :v | v release].
	Transcript cr.!

projectionTest: n
"This test constructs a two sets of variables related to each other by a simple linear transformation (scale and offset). The time is measured to change a variable on either side of the mapping and to change the scale and offset factors. Results are printed in the Transcript."
	"Planner projectionTest: 100"

	| projectionC constraints scale offset src dst |
	"This constraint is slower than the special-purpose ScaleConstraint."
	"projectionC := Constraint
		names: #(src scale offset dst)
		methods: #('dst := (src * scale) + offset'
		           'src := (dst - offset) // scale')."
	constraints := OrderedCollection new.

	self report: 'Projection test for ', n printString asSmalltalkString, ' points (Smalltalk):' times: 1 run:
		[scale := Variable value: 10.
		 offset := Variable value: 1000.
		 1 to: n do:
			[ :i |
			 src := Variable value: i.
			 dst := Variable value: i.
			 constraints add: (src defaultStay).
			 constraints add:
				("(projectionC copy)"ScaleConstraint
					var: src var: scale var: offset var: dst
					strength: #required)]].
	self reportChange: 'Changing a data point:'
		var: src newValue: 17.
	self reportChange: 'Changing a projected point:'
		var: dst newValue: 1050.
	self reportChange: 'Changing the scale factor:'
		var: scale newValue: 5.
	self reportChange: 'Changing the offset:'
		var: offset newValue: 2000.

	constraints do: [ :c | c release].
	Transcript cr.!

report: string times: count run: aBlock
	"Report the time required to execute the given block."

	| time |
	time := Time millisecondsToRun: [count timesRepeat: aBlock].
	Transcript show: string, ' ', (time // count) printString asSmalltalkString, ' milliseconds'; cr.!

reportChange: title var: aVariable newValue: newValue

	| editConstraint plan |
	Transcript show: title; cr.
	self report: '  Adding Constraint:' times: 1 run:
		[editConstraint := EditConstraint var: aVariable strength: #preferred].
	self report: '  Making Plan' times: 1 run:
		[plan := Planner extractPlanFromConstraints: (Array with: editConstraint)].
	Transcript show: '  Plan size: ', plan size printString asSmalltalkString, ' constraints'; cr.
	self report: '  Executing Plan:' times: 10 run:
		[aVariable value: newValue. plan execute].
	self report: '  Removing Constraint:' times: 1 run:
		[editConstraint destroyConstraint].! !

!Planner class methodsFor: 'private'!

addConstraintsConsuming: v to: aCollection

	| determiningC |
	determiningC := v determinedBy.
	v constraints do:
		[ :c |
		 ((c == determiningC) or: [c isSatisfied not]) ifFalse:
			[aCollection add: c]].!

addPropagate: c mark: mark
	"Recompute the walkabout strengths and stay flags of all variables downstream of the given constraint and recompute the actual values of all variables whose stay flag is true. If a cycle is detected, remove the given constraint and answer false. Otherwise, answer true."
	"Details: Cycles are detected when a marked variable is encountered downstream of the given constraint. The sender is assumed to have marked the inputs of the given constraint with the given mark. Thus, encountering a marked node downstream of the output constraint means that there is a path from the constraint's output to one of its inputs."

	| todo d |
	todo := OrderedCollection with: c.
	[todo isEmpty] whileFalse:
		[d := todo removeFirst.
		 (d output mark = mark) ifTrue:
			[self incrementalRemove: c.
			 ^false].
		 d recalculate.
		 self addConstraintsConsuming: d output to: todo].
	^true!

constraintsConsuming: v do: aBlock

	| determiningC |
	determiningC := v determinedBy.
	v constraints do:
		[ :c |
		 ((c == determiningC) or: [c isSatisfied not]) ifFalse:
			[aBlock value: c]].!

newMark
	"Select a previously unused mark value."
	"Details: We just keep incrementing. If necessary, the counter will turn into a LargePositiveInteger. In that case, it will be a bit slower to compute the next mark but the algorithms will all behave correctly. We reserve the value '0' to mean 'unmarked'. Thus, this generator starts at '1' and will never produce '0' as a mark value."

	^CurrentMark := CurrentMark + 1!

removePropagateFrom: out
	"Update the walkabout strengths and stay flags of all variables downstream of the given constraint. Answer a collection of unsatisfied constraints sorted in order of decreasing strength."

	| unsatisfied todo v nextC |
	unsatisfied := SortedCollection sortBlock:
		[ :c1 : c2 | c1 strength stronger: c2 strength] asNonLifoBlock.
	out determinedBy: nil.
	out walkStrength: Strength absoluteWeakest.
	out stay: true.
	todo := OrderedCollection with: out.
	[todo isEmpty] whileFalse:
		[v := todo removeFirst.
		 v constraints do:
		 	[ :c | (c isSatisfied) ifFalse: [unsatisfied add: c]].
		 self constraintsConsuming: v do:
			[ :c |
			 c recalculate.
			 todo add: c output]].
	^unsatisfied! !

Planner initialize!


Object subclass: #Variable
	instanceVariableNames: 'value constraints determinedBy walkStrength stay mark '
	classVariableNames: ''
	poolDictionaries: ''
	category: 'DB-DeltaBlue'!
Variable comment:
'I represent a constrained variable. In addition to my value, I maintain the structure of the constraint graph, the current dataflow graph, and various parameters of interest to the DeltaBlue incremental constraint solver.

Instance variables:
	value			my value; changed by constraints, read by client <Object>
	constraints		normal constraints that reference me <Array of Constraint>
	determinedBy	the constraint that currently determines
					my value (or nil if there isn''t one) <Constraint>
	walkStrength		my walkabout strength <Strength>
	stay			true if I am a planning-time constant <Boolean>
	mark			used by the planner to mark constraints <Number>'!


!Variable methodsFor: 'initialize-release'!

initialize

	value := 0.
	constraints := OrderedCollection new: 2.
	determinedBy := nil.
	walkStrength := Strength absoluteWeakest.
	stay := true.
	mark := 0.!

release
	"Break cycles (but leave me printable)."

	self initialize.! !

!Variable methodsFor: 'access'!

addConstraint: aConstraint
	"Add the given constraint to the set of all constraints that refer to me."

	constraints add: aConstraint.!

constraints
	"Answer the set of constraints that refer to me."

	^constraints!

determinedBy
	"Answer the constraint that determines my value in the current dataflow."

	^determinedBy!

determinedBy: aConstraint
	"Record that the given constraint determines my value in the current data flow."

	determinedBy := aConstraint.!

mark
	"Answer my mark value."

	^mark!

mark: markValue
	"Set my mark value."

	mark := markValue.!

removeConstraint: c
	"Remove all traces of c from this variable."

	constraints remove: c ifAbsent: [].
	(determinedBy == c) ifTrue: [determinedBy := nil].!

stay
	"Answer my stay flag."

	^stay!

stay: aBoolean
	"Set my stay flag."

	stay := aBoolean!

value
	"Answer my value."

	^value!

value: anObject
	"Set my value."

	value := anObject.!

walkStrength
	"Answer my walkabout strength in the current dataflow."

	^walkStrength!

walkStrength: aStrength
	"Set my walkabout strength in the current dataflow."

	walkStrength := aStrength.! !

!Variable methodsFor: 'changes'!

changeIn: aBlock strength: strengthSymbol
	"Attempt to add an edit constraint of the given strength to myself and execute the given block only if this constraint can be satisfied (i.e. no stronger constraint prevents me from changing)."

	| editConstraint |
	editConstraint := EditConstraint var: self strength: strengthSymbol.
	(editConstraint isSatisfied) ifTrue:
		[aBlock value.
		 Planner propagateFrom: self].
	editConstraint destroyConstraint.!

setAll: variables to: values strength: strengthSymbol
	"Attempt to assign the given values to the given variables using the given strength. This is an all-or-nothing operation; if any variable cannot be changed due to a stronger constraint then no variable is changed."

	| allSatisfied editConstraints editConstraint |
	(variables size = values size) ifFalse:
		[^self error: 'variable and value lists must be same size'].

	"add edit constraints"
	allSatisfied := true.		"true iff all edit constraints are satisfied"
	editConstraints := variables collect:
		[ :v |
		 editConstraint := EditConstraint var: v strength: strengthSymbol.
		 (editConstraint isSatisfied) ifFalse: [allSatisfied := false].
		 editConstraint].

	(allSatisfied) ifTrue:
		["do the assignments only if all edit constraints are satisfied"
		 variables with: values do:
			[ :thisVar : thisValue |
			 thisVar value: thisValue.
			 Planner propagateFrom: thisVar]].

	"remove edit constraints"
	editConstraints do: [ :c | c destroyConstraint].!

setValue: aValue
	"Attempt to assign the given value to me using a strength of #preferred."

	self setValue: aValue strength: #preferred.!

setValue: aValue strength: strengthSymbol
	"Attempt to assign the given value to me using the given strength."

	| editConstraint |
	editConstraint := EditConstraint var: self strength: strengthSymbol.
	(editConstraint isSatisfied) ifTrue:
		[self value: aValue.
		 Planner propagateFrom: self].
	editConstraint destroyConstraint.! !

!Variable methodsFor: 'stay constraints'!

defaultStay

	^StayConstraint var: self strength: #default!

preferredStay

	^StayConstraint var: self strength: #preferred!

requiredStay

	^StayConstraint var: self strength: #required!

strongDefaultStay

	^StayConstraint var: self strength: #strongDefault!

strongPreferredStay

	^StayConstraint var: self strength: #strongPreferred!

weakDefaultStay

	^StayConstraint var: self strength: #weakDefault! !

!Variable methodsFor: 'equality constraints'!

requireEquals: aVariable
	"Install a required equality constraint between me and the given variable."

	^EqualityConstraint var: self var: aVariable strength: #required! !

!Variable methodsFor: 'printing'!

longPrintOn: aStream

	self shortPrintOn: aStream.
	aStream nextPutAll: '   Constraints: '.
	(constraints isEmpty)
		ifTrue: [aStream cr; tab; nextPutAll: 'none']
		ifFalse:
			[constraints do:
				[ :c | aStream cr; tab. c shortPrintOn: aStream]].
	(determinedBy isNil) ifFalse:
		[aStream cr; nextPutAll: '   Determined by: '.
		 aStream cr; tab. determinedBy shortPrintOn: aStream].
	aStream cr.!

printOn: aStream
	self shortPrintOn: aStream
	"(Sensor leftShiftDown)
		ifTrue: [self longPrintOn: aStream]
		ifFalse: [self shortPrintOn: aStream]."!

shortPrintOn: aStream

	aStream nextPutAll: 'V(', self asOop printString asSmalltalkString, ', '.
	aStream nextPutAll: walkStrength printString, ', '.
	(stay isNil) ifFalse:
		[aStream nextPutAll: (stay ifTrue: ['stay, '] ifFalse: ['changing, '])].
	aStream nextPutAll: value printString.
	aStream nextPutAll: ')'.
	aStream cr.! !
"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

Variable class
	instanceVariableNames: ''!


!Variable class methodsFor: 'instance creation'!

new

	^super new initialize!

value: aValue

	^(super new) initialize; value: aValue! !

Object subclass: #AbstractConstraint
	instanceVariableNames: 'privateStrength '
	classVariableNames: ''
	poolDictionaries: ''
	category: 'DB-DeltaBlue'!
AbstractConstraint comment:
'I am an abstract class representing a system-maintainable relationship (or "constraint") between a set of variables. I supply a strength instance variable; concrete subclasses provide a means of storing the constrained variables and other information required to represent a constraint.

Instance variables:
	privateStrength			the strength of this constraint <Strength>
'!


!AbstractConstraint methodsFor: 'accessing'!

strength
	"Answer my strength."

	^privateStrength!

strength: strengthSymbol
	"Set my strength."

	privateStrength := Strength of: strengthSymbol.! !

!AbstractConstraint methodsFor: 'queries'!

includeInPlan
	"Answer true if this constraint should be included in the plan. Subclasses such as EditConstraint and StayConstraint override this method to return 'false', since they are noops at plan execution time."

	^true!

isInput
	"Normal constraints are not input constraints. An input constraint is one that depends on external state, such as the mouse, the keyboard, a clock, or some arbitrary piece of imperative code."

	^false!

isSatisfied
	"Answer true if this constraint is satisfied in the current solution."

	self subclassResponsibility! !

!AbstractConstraint methodsFor: 'add/remove'!

addConstraint
	"Activate this constraint and attempt to satisfy it."

	self addToGraph.
	Planner incrementalAdd: self.!

addToGraph
	"Add myself to the constraint graph."

	self subclassResponsibility!

destroyConstraint
	"Deactivate this constraint, remove it from the constraint graph, possibly causing other constraints to be satisfied, and destroy it."

	(self isSatisfied) ifTrue: [Planner incrementalRemove: self].
	self removeFromGraph.
	self release.!

removeFromGraph
	"Remove myself from the constraint graph."

	self subclassResponsibility! !

!AbstractConstraint methodsFor: 'planning'!

chooseMethod: mark
	"Decide if I can be satisfied and record that decision. The output of the choosen method must not have the given mark and must have a walkabout strength less than that of this constraint."

	self subclassResponsibility!

execute
	"Enforce this constraint. Assume that it is satisfied."

	self subclassResponsibility!

inputsDo: aBlock
	"Assume that I am satisfied. Evaluate the given block on all my current input variables."

	self subclassResponsibility!

inputsKnown: mark
	"Assume that I am satisfied. Answer true if all my current inputs are known. A variable is known if either a) it is 'stay' (i.e. it is a constant at plan execution time), b) it has the given mark (indicating that it has been computed by a constraint appearing earlier in the plan), or c) it is not determined by any constraint."

	self inputsDo:
		[ :v |
		 ((v mark = mark) or: [(v stay) or: [v determinedBy == nil]]) ifFalse:
			[^false]].
	^true!

markUnsatisfied
	"Record the fact that I am unsatisfied."

	self subclassResponsibility!

output
	"Answer my current output variable. Raise an error if I am not currently satisfied."

	self subclassResponsibility!

recalculate
	"Calculate the walkabout strength, the stay flag, and, if it is 'stay', the value for the current output of this constraint. Assume this constraint is satisfied."

	self subclassResponsibility!

satisfy: mark
	"Attempt to find a way to enforce this constraint. If successful, record the solution, perhaps modifying the current dataflow graph. Answer the constraint that this constraint overrides, if there is one, or nil, if there isn't."
	"Assume: I am not already satisfied"

	| overridden out |
	self chooseMethod: mark.
	(self isSatisfied)
		ifTrue:			"constraint can be satisfied"
			["mark inputs to allow cycle detection in addPropagate"
			 self inputsDo: [ :in | in mark: mark].
			 out := self output.
			 overridden := out determinedBy.
			 (overridden == nil) ifFalse: [overridden markUnsatisfied].
			 out determinedBy: self.
			 (Planner addPropagate: self mark: mark) ifFalse:
				[Transcript show:
					('Cycle encountered adding:   ',
					 self printString,
					 'Constraint removed.') ; cr "withCRs".
				 ^nil].
			 out mark: mark]
		ifFalse:			"constraint cannot be satisfied"
			[overridden := nil.
			 (self strength sameAs: (Strength required)) ifTrue:
				[Transcript show: 'Failed to satisfy a required constraint']].
	^overridden! !

!AbstractConstraint methodsFor: 'printing'!

longPrintOn: aStream

	| bindings |
	aStream nextPut: $(.
	self shortPrintOn: aStream.
	aStream space; nextPutAll: self strength printString.
	(self isSatisfied)
		ifTrue:
			[aStream cr; space; space; space.
			 self inputsDo:
				[ :in | aStream nextPutAll: 'v', in asOop printString asSmalltalkString, ' '].
			aStream nextPutAll: '-> '.
			aStream nextPutAll: 'v', self output asOop printString asSmalltalkString]
		ifFalse:
			[aStream space; nextPutAll: 'UNSATISFIED'].
	aStream nextPut: $); cr.!

printOn: aStream
	self shortPrintOn: aStream
	"(Sensor leftShiftDown)
		ifTrue: [self longPrintOn: aStream]
		ifFalse: [self shortPrintOn: aStream]."!

shortPrintOn: aStream

	aStream nextPutAll: self class name, '(', self asOop printString asSmalltalkString, ')'.! !

AbstractConstraint variableSubclass: #Constraint
	instanceVariableNames: 'privateMethods whichMethod '
	classVariableNames: ''
	poolDictionaries: ''
	category: 'DB-DeltaBlue'!
Constraint comment:
'I represent a system-maintainable relationship (or "constraint") between a set of variables. I contain a set of methods that can be executed to enforce the constraint. If I am satisfied in the current data flow graph, the method used to enforce the relationship is stored in whichMethod. If I am not satisfied, whichMethod is nil. My indexable fields contain the constrained variables.

Instance variables:
	privateMethods			a collection of methods that can be used to
					enforce this constraint <Array of Method>
	whichMethod		the method currently used to enforce this constraint
					or nil if this constraint is not satisfied <Method>'!


!Constraint methodsFor: 'initialize-release'!

methods
	^privateMethods!

methods: methodList
	"Initialize myself with the given methods. I am initially not bound to variables."

	privateStrength := Strength required.
	privateMethods := methodList asArray.
	whichMethod := nil.!

release

	privateStrength := nil.
	privateMethods := nil.
	whichMethod := nil.!

var: variable strength: strengthSymbol
	"Install myself on the given variable with the given strength."

	self
		vars: (Array with: variable)
		strength: strengthSymbol!

var: variable1 var: variable2 strength: strengthSymbol
	"Install myself on the given variables with the given strength."

	self
		vars: (Array with: variable1 with: variable2)
		strength: strengthSymbol!

var: variable1 var: variable2 var: variable3 strength: strengthSymbol
	"Install myself on the given variables with the given strength."

	self
		vars: (Array with: variable1 with: variable2 with: variable3)
		strength: strengthSymbol!

var: variable1 var: variable2 var: variable3 var: variable4 strength: strengthSymbol
	"Install myself on the given variables with the given strength."

	self
		vars: (Array with: variable1 with: variable2 with: variable3 with: variable4)
		strength: strengthSymbol!

var: variable1 var: variable2 var: variable3 var: variable4 var: variable5 strength: strengthSymbol
	"Install myself on the given variables with the given strength."

	self
		vars:
			(Array with: variable1 with: variable2 with: variable3),
			(Array with: variable4 with: variable5)
		strength: strengthSymbol!

var: variable1 var: variable2 var: variable3 var: variable4 var: variable5 var: variable6 strength: strengthSymbol
	"Install myself on the given variables with the given strength."

	self
		vars:
			(Array with: variable1 with: variable2 with: variable3),
			(Array with: variable4 with: variable5 with: variable6)
		strength: strengthSymbol!

var: variable1 var: variable2 var: variable3 var: variable4 var: variable5 var: variable6 var: variable7 strength: strengthSymbol
	"Install myself on the given variables with the given strength."

	self
		vars:
			(Array with: variable1 with: variable2 with: variable3 with: variable4),
			(Array with: variable5 with: variable6 with: variable7)
		strength: strengthSymbol!

var: variable1 var: variable2 var: variable3 var: variable4 var: variable5 var: variable6 var: variable7 var: variable8 strength: strengthSymbol
	"Install myself on the given variables with the given strength."

	self
		vars:
			(Array with: variable1 with: variable2 with: variable3 with: variable4),
			(Array with: variable5 with: variable6 with: variable7 with: variable8)
		strength: strengthSymbol!

vars: vars strength: aSymbol
	"Install myself on the given collection of variables with the given strength."

	(vars size == self size) ifFalse:
		[self error: 'Wrong number of variables for this constraint.'].
	1 to: self size do:
		[ :i | self at: i put: (vars at: i)].
	privateStrength := Strength of: aSymbol.
	self addConstraint.! !

!Constraint methodsFor: 'queries'!

isSatisfied
	"Answer true if this constraint is satisfied in the current solution."

	^whichMethod notNil! !

!Constraint methodsFor: 'add/remove'!

addToGraph
	"Add myself to the constraint graph."

	1 to: self size do:
		[ :i | (self at: i) addConstraint: self].
	whichMethod := nil.!

removeFromGraph
	"Remove myself from the constraint graph."

	| v |
	1 to: self size do:
		[ :i |
		 v := self at: i.
		 (v == nil) ifFalse: [v removeConstraint: self]].
	whichMethod := nil.! !

!Constraint methodsFor: 'planning'!

chooseMethod: mark
	"Decide if I can be satisfied and record that decision. The output of the choosen method must not have the given mark and must have a walkabout strength less than that of this constraint."

	| bestOutStrength mOut |
	whichMethod := nil.
	bestOutStrength := self strength.
	self methods do:
		[ :m |
		 mOut := self at: m outIndex.
		 ((mOut mark ~= mark) &
		  (mOut walkStrength weaker: bestOutStrength)) ifTrue:
			[whichMethod := m.
			 bestOutStrength := mOut walkStrength]].!

constantOutput
	"Answer true if:
	    1. I am not an input constraint such as an EditConstraint, and
	    2. If I have any inputs, they are all marked stay."

	| outIndex i |
	(self isInput) ifTrue: [^false].
	self inputsDo:
		[ :in | (in stay) ifFalse: [^false]].
	^true!

execute
	"Enforce this constraint. Assume that it is satisfied."

	whichMethod execute: self.!

inputsDo: aBlock
	"See comment in AbstractConstraint."

	| outIndex |
	outIndex := whichMethod outIndex.
	1 to: self size do:
		[ :i |
		 (i == outIndex) ifFalse:
			[aBlock value: (self at: i)]].!

markUnsatisfied
	"Record the fact that I am unsatisfied."

	whichMethod := nil.!

output
	"Answer the output variable for the currently selected method. Raise an error if the receiver is not currently satisfied."

	^self at: whichMethod outIndex!

outputWalkStrength
	"Answer the walkabout strength to be assigned to the output of my selected method."

	| minStrength currentOut methodOut |
	minStrength := self strength.
	currentOut := self at: whichMethod outIndex.
	1 to: self methods size do:
		[ :i |
		 methodOut := self at: ((self methods at: i) outIndex).
		 ((methodOut ~~ currentOut) and:
		   [methodOut walkStrength weaker: minStrength]) ifTrue:
			[minStrength := methodOut walkStrength]].
	^minStrength!

recalculate
	"Calculate the walkabout strength, the stay flag, and, if it is 'stay', the value for the current output of this constraint. Assume this constraint is satisfied."

	| out |
	out := self at: whichMethod outIndex.
	out walkStrength: self outputWalkStrength.
	out stay: self constantOutput.
	(out stay) ifTrue: [self execute].		"stay optimization"! !
"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

Constraint class
	instanceVariableNames: ''!


!Constraint class methodsFor: 'instance creation'!

names: variableNames methods: methodStrings
	"Create a new constraint from the given method strings. The expressions in methodStrings are compiled to produce the actual method bodies for the constraint. For example, the following builds a plus constraint:

	Constraint
		names: #(sum a b)
		methods: #('sum := a + b'    'a := sum - b'    'b := sum - a')

The constraint thus created may be bound to actual variables with a specific strength (see Constraint>bind:strength:)."

	| methodList |
	methodList := methodStrings collect:
		[ :s | Method names: variableNames methodString: s].
	^(super new: variableNames size) methods: methodList! !
AbstractConstraint subclass: #UnaryConstraint
	instanceVariableNames: 'output satisfied '
	classVariableNames: ''
	poolDictionaries: ''
	category: 'DB-Constraints'!
UnaryConstraint comment:
'I am an abstract superclass for constraints having a single possible output variable.

Instance variables:
	output		possible output variable <Variable>
	satisfied		true if I am currently satisfied <Boolean>'!


!UnaryConstraint methodsFor: 'initialize-release'!

release

	privateStrength := nil.
	output := nil.
	satisfied := nil.!

var: aVariable strength: strengthSymbol
	"Initialize myself with the given variable and strength."

	privateStrength := Strength of: strengthSymbol.
	output := aVariable.
	satisfied := false.
	self addConstraint.! !

!UnaryConstraint methodsFor: 'queries'!

isSatisfied
	"Answer true if this constraint is satisfied in the current solution."

	^satisfied! !

!UnaryConstraint methodsFor: 'add/remove'!

addToGraph
	"Add myself to the constraint graph."

	output addConstraint: self.
	satisfied := false.!

removeFromGraph
	"Remove myself from the constraint graph."

	(output == nil) ifFalse: [output removeConstraint: self].
	satisfied := false.! !

!UnaryConstraint methodsFor: 'planning'!

chooseMethod: mark
	"Decide if I can be satisfied and record that decision."

	satisfied :=
		(output mark ~= mark) and:
		[self strength stronger: output walkStrength].!

execute
	"Enforce this constraint. Assume that it is satisfied."

	self subclassResponsibility!

inputsDo: aBlock
	"I have no input variables."!

markUnsatisfied
	"Record the fact that I am unsatisfied."

	satisfied := false.!

output
	"Answer my current output variable."

	^output!

recalculate
	"Calculate the walkabout strength, the stay flag, and, if it is 'stay', the value for the current output of this constraint. Assume this constraint is satisfied."

	output walkStrength: self strength.
	output stay: (self isInput not).
	(output stay) ifTrue: [self execute].	"stay optimization"! !

AbstractConstraint subclass: #BinaryConstraint
	instanceVariableNames: 'v1 v2 direction '
	classVariableNames: ''
	poolDictionaries: ''
	category: 'DB-Constraints'!
BinaryConstraint comment:
'I am an abstract superclass for constraints having two possible output variables.

Instance variables:
	v1, v2		possible output variables <Variable>
	direction		one of:
					#forward (v2 is output)
					#backward (	v1 is output)
					nil (not satisfied)'!


!BinaryConstraint methodsFor: 'initialize-release'!

release

	privateStrength := nil.
	v1 := nil.
	v2 := nil.
	direction := nil.!

var: variable1 var: variable2 strength: strengthSymbol
	"Initialize myself with the given variables and strength."

	privateStrength := Strength of: strengthSymbol.
	v1 := variable1.
	v2 := variable2.
	direction := nil.
	self addConstraint.! !

!BinaryConstraint methodsFor: 'queries'!

isSatisfied
	"Answer true if this constraint is satisfied in the current solution."

	^direction notNil! !

!BinaryConstraint methodsFor: 'add/remove'!

addToGraph
	"Add myself to the constraint graph."

	v1 addConstraint: self.
	v2 addConstraint: self.
	direction := nil.!

removeFromGraph
	"Remove myself from the constraint graph."

	(v1 == nil) ifFalse: [v1 removeConstraint: self].
	(v2 == nil) ifFalse: [v2 removeConstraint: self].
	direction := nil.! !

!BinaryConstraint methodsFor: 'planning'!

chooseMethod: mark
	"Decide if I can be satisfied and which way I should flow based on the relative strength of the variables I relate, and record that decision."

	(v1 mark == mark) ifTrue:		"forward or nothing"
		[((v2 mark ~= mark) and: [self strength stronger: v2 walkStrength])
			ifTrue: [^direction := #forward]
			ifFalse: [^direction := nil]].

	(v2 mark == mark) ifTrue:		"backward or nothing"
		[((v1 mark ~= mark) and: [self strength stronger: v1 walkStrength])
			ifTrue: [^direction := #backward]
			ifFalse: [^direction := nil]].

	"if we get here, neither variable is marked, so we have choice"
	(v1 walkStrength weaker: v2 walkStrength)
		ifTrue:
			[(self strength stronger: v1 walkStrength)
				ifTrue: [^direction := #backward]
				ifFalse: [^direction := nil]]
		ifFalse:
			[(self strength stronger: v2 walkStrength)
				ifTrue: [^direction := #forward]
				ifFalse: [^direction := nil]].!

execute
	"Enforce this constraint. Assume that it is satisfied."

	self subclassResponsibility!

inputsDo: aBlock
	"Evaluate the given block on my current input variable."

	(direction == #forward)
		ifTrue: [aBlock value: v1]
		ifFalse: [aBlock value: v2].!

markUnsatisfied
	"Record the fact that I am unsatisfied."

	direction := nil.!

output
	"Answer my current output variable."

	(direction == #forward)
		ifTrue: [^v2]
		ifFalse: [^v1]!

recalculate
	"Calculate the walkabout strength, the stay flag, and, if it is 'stay', the value for the current output of this constraint. Assume this constraint is satisfied."

	| in out |
	(direction == #forward)
		ifTrue: [in := v1. out := v2]
		ifFalse: [in := v2. out := v1].
	out walkStrength: (self strength weakest: in walkStrength).
	out stay: (in stay).
	(out stay) ifTrue: [self execute].		"stay optimization"! !

BinaryConstraint subclass: #ScaleConstraint
	instanceVariableNames: 'scale offset '
	classVariableNames: ''
	poolDictionaries: ''
	category: 'DB-Constraints'!
ScaleConstraint comment:
'I relate two variables by the linear scaling relationship: "v2 = (v1 * scale) + offset". Either v1 or v2 may be changed to maintain this relationship but the scale factor and offset are considered read-only.

Instance variables:
	scale		scale factor input variable <Variable>
	offset		offset input variable <Variable>'!


!ScaleConstraint methodsFor: 'initialize-release'!

release

	super release.
	scale := nil.
	offset := nil.!

src: srcVar scale: scaleVar offset: offsetVar dst: dstVar strength: strengthSymbol
	"Initialize myself with the given variables and strength."

	privateStrength := Strength of: strengthSymbol.
	v1 := srcVar.
	v2 := dstVar.
	scale := scaleVar.
	offset := offsetVar.
	direction := nil.
	self addConstraint.! !

!ScaleConstraint methodsFor: 'add/remove'!

addToGraph
	"Add myself to the constraint graph."

	v1 addConstraint: self.
	v2 addConstraint: self.
	scale addConstraint: self.
	offset addConstraint: self.
	direction := nil.!

removeFromGraph
	"Remove myself from the constraint graph."

	(v1 == nil) ifFalse: [v1 removeConstraint: self].
	(v2 == nil) ifFalse: [v2 removeConstraint: self].
	(scale == nil) ifFalse: [scale removeConstraint: self].
	(offset == nil) ifFalse: [offset removeConstraint: self].
	direction := nil.! !

!ScaleConstraint methodsFor: 'planning'!

execute
	"Enforce this constraint. Assume that it is satisfied."

	(direction == #forward)
		ifTrue: [v2 value: (v1 value * scale value) + offset value]
		ifFalse: [v1 value: (v2 value - offset value) // scale value].!

inputsDo: aBlock
	"Evaluate the given block on my current input variable."

	(direction == #forward)
		ifTrue: [aBlock value: v1; value: scale; value: offset]
		ifFalse: [aBlock value: v2; value: scale; value: offset].!

recalculate
	"Calculate the walkabout strength, the stay flag, and, if it is 'stay', the value for the current output of this constraint. Assume this constraint is satisfied."

	| in out |
	(direction == #forward)
		ifTrue: [in := v1. out := v2]
		ifFalse: [out := v1. in := v2].
	out walkStrength: (self strength weakest: in walkStrength).
	out stay: ((in stay) and: [(scale stay) and: [offset stay]]).
	(out stay) ifTrue: [self execute].		"stay optimization"! !
"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

ScaleConstraint class
	instanceVariableNames: ''!


!ScaleConstraint class methodsFor: 'instance creation'!

var: src var: scale var: offset var: dst strength: strengthSymbol
	"Install a scale constraint with the given strength on the given variables."

	^(self new) src: src scale: scale offset: offset dst: dst strength: strengthSymbol! !

UnaryConstraint subclass: #XMouseConstraint
	instanceVariableNames: 'xOffset '
	classVariableNames: ''
	poolDictionaries: ''
	category: 'DB-Constraints'!
XMouseConstraint comment:
'I am a unary input constraint that constrains a variable to the current x-coordinate of the mouse. I contain an offset to normalize the coordinate system to one convenient for the target variable.

Instance variables:
	xOffset		constant x-offset <Number>'!


!XMouseConstraint methodsFor: 'initialize-release'!

var: aVariable offset: aNumber strength: strengthSymbol
	"Install myself with the given variable, x-offset, and strength."

	xOffset := aNumber.
	self var: aVariable strength: strengthSymbol.! !

!XMouseConstraint methodsFor: 'queries'!

isInput
	"I depend on the state of the mouse."

	^true! !

!XMouseConstraint methodsFor: 'execution'!

execute
	"Enforce this constraint. Assume that it is satisfied."

	output value: (Sensor mousePoint x + xOffset).! !
"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

XMouseConstraint class
	instanceVariableNames: ''!


!XMouseConstraint class methodsFor: 'instance creation'!

var: aVariable offset: xOffset strength: strengthSymbol
	"Install an XMouse constraint on the given variable with the given offset constant to be added to the raw mouse position."

	^(self new) var: aVariable offset: xOffset strength: strengthSymbol! !

UnaryConstraint subclass: #YMouseConstraint
	instanceVariableNames: 'yOffset '
	classVariableNames: ''
	poolDictionaries: ''
	category: 'DB-Constraints'!
YMouseConstraint comment:
'I am a unary input constraint that constrains a variable to the current y-coordinate of the mouse. I contain an offset to normalize the coordinate system to one convenient for the target variable.

Instance variables:
	yOffset		constant y-offset <Number>'!


!YMouseConstraint methodsFor: 'initialize-release'!

var: aVariable offset: aNumber strength: strengthSymbol
	"Install myself with the given variable, y-offset, and strength."

	yOffset := aNumber.
	self var: aVariable strength: strengthSymbol.! !

!YMouseConstraint methodsFor: 'queries'!

isInput
	"I depend on the state of the mouse."

	^true! !

!YMouseConstraint methodsFor: 'execution'!

execute
	"Enforce this constraint. Assume that it is satisfied."

	output value: (Sensor mousePoint y + yOffset).! !
"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

YMouseConstraint class
	instanceVariableNames: ''!


!YMouseConstraint class methodsFor: 'instance creation'!

var: aVariable offset: yOffset strength: strengthSymbol
	"Install a YMouse constraint on the given variable with the given offset constant to be added to the raw mouse position."

	^(self new) var: aVariable offset: yOffset strength: strengthSymbol! !

UnaryConstraint subclass: #StayConstraint
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'DB-Constraints'!
StayConstraint comment:
'I mark variables that should, with some level of preference, stay the same. I have one method with zero inputs and one output, which does nothing. Planners may exploit the fact that, if I am satisfied, my output will not change during plan execution. This is called "stay optimization."'!


!StayConstraint methodsFor: 'queries'!

includeInPlan
	"Stay constraints have no effect other than to control the planning process."

	^false! !

!StayConstraint methodsFor: 'execution'!

execute
	"Stay constraints do nothing."! !
"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

StayConstraint class
	instanceVariableNames: ''!


!StayConstraint class methodsFor: 'instance creation'!

var: aVariable strength: strengthSymbol
	"Install a stay constraint with the given strength on the given variable."

	^(self new) var: aVariable strength: strengthSymbol! !

UnaryConstraint subclass: #EditConstraint
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'DB-Constraints'!
EditConstraint comment:
'I am a unary input constraint used to mark a variable that the client wishes to change.'!


!EditConstraint methodsFor: 'queries'!

includeInPlan
	"Edit constraints have no effect other than to control the planning process."

	^false!

isInput
	"I indicate that a variable is to be changed by imperative code."

	^true! !

!EditConstraint methodsFor: 'execution'!

execute
	"Edit constraints do nothing."! !
"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

EditConstraint class
	instanceVariableNames: ''!


!EditConstraint class methodsFor: 'instance creation'!

var: aVariable strength: strengthSymbol
	"Install an edit constraint with the given strength on the given variable."

	^(self new) var: aVariable strength: strengthSymbol! !

BinaryConstraint subclass: #EqualityConstraint
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'DB-Constraints'!
EqualityConstraint comment:
'I constrain two variables to have the same value: "v1 = v2".'!


!EqualityConstraint methodsFor: 'execution'!

execute
	"Enforce this constraint. Assume that it is satisfied."

	(direction == #forward)
		ifTrue: [v2 value: v1 value]
		ifFalse: [v1 value: v2 value].! !
"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

EqualityConstraint class
	instanceVariableNames: ''!


!EqualityConstraint class methodsFor: 'instance creation'!

var: variable1 var: variable2 strength: strengthSymbol
	"Install a constraint with the given strength equating the given variables."

	^(self new) var: variable1 var: variable2 strength: strengthSymbol! !
