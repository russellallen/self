"Sun-$Revision: 9.1 $"

"cecilMethodsPane"

"This is a pane within a cecilObjectBox that displays all the object's
 methods."
"It contains a cecilMethodEntry for each method"
"Field get accessors are displayed, but not field set accessors."

traits  cecilUserInterface _AddSlotsIfAbsent: ( | ^ cecilMethodsPane = () |)
globals cecilUserInterface _AddSlotsIfAbsent: ( | ^ cecilMethodsPane = () |)

traits cecilMethodsPane _Define: ( |
    _ parent* = traits cecilObjectPane.
    
    "creating"
    ^ createOn: cecilObjBox = ( | newPane. cmp. |
	newPane: copy.
	newPane fields: list copyRemoveAll.
	newPane methods: list copyRemoveAll.
	newPane container: cecilObjBox.
	newPane container cecilObj attachedMethodsDo: [
	    | :method. methodEntry. |
	    (method isInitSetAccessor not) &&
		[method isSetAccessor not] ifTrue: [
		methodEntry: cecilMethodEntry  createFor: method 
		    On: newPane.
		methodEntry isField ifTrue:[
		    newPane fields add: methodEntry.
		]
		    False: [
		    newPane methods add: methodEntry.
		].
		newPane components add: methodEntry.
		newPane updateMaxWidth: methodEntry label.
	    ].
	].
	newPane container updateMaxWidth: newPane maxEntryWidth.
	"newPane sortEntries."
	newPane ).
    
    
    "finding"
    
    ^ findMethodEntry: method = (
	components findFirst: [| :methodEntry | methodEntry method = method ]
	    IfPresent: [ | :methodEntry | methodEntry]
	    IfAbsent:  [ error: 'Cound not find method in object'].
    ).
    
    "sorting"
    
    ^ sortEntries = (
	fields: (fields copySortBy: ( | element: e1 Precedes: e2 = 
		    (e1 label < e2 label) |)).
	methods: (methods copySortBy: ( | element: e1 Follows: e2 = 
		    (e1 label > e2 label) |)).
	components addAllFirst: methods.
	components addAllFirst: fields.
	self ).
    
    ^ printString = 'cecilMethodsPane'
| )

cecilMethodsPane _Define: (cecilObjectPane copy) _AddSlots: ( |
    _ parent* = traits cecilMethodsPane.
    fields <- list copyRemoveAll.
    methods <- list copyRemoveAll.
| )
