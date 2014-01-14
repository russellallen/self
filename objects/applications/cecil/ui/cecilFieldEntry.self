"Sun-$Revision: 9.1 $"

"cecilFieldEntry"

"For every field that a cecil object has, there is a cecilFieldEntry"
"All of the cecilFieldEntries for an object are displayed within the object's
 cecilFieldsPane (which is within the cecilObjectBox for that object)"

"A cecilFieldEntry can be selected (highlighted) by clicking the left
 button on it.  Once selected, another left button click on the entry will
 sprout a fieldBox, which shows the field's value (the value's object box)"


traits  cecilUserInterface _AddSlotsIfAbsent: ( | ^ cecilFieldEntry = () |)
globals cecilUserInterface _AddSlotsIfAbsent: ( | ^ cecilFieldEntry = () |)

traits cecilFieldEntry _Define: ( |
    
    _ parent* = traits cecilPaneEntry.
    
    "creating"
    ^ createForField: fName WithValue: fValue On: pane = ( | newEntry |
	newEntry: ((copy fieldName: fName) fieldValue: fValue) container: pane.
	newEntry label: newEntry fieldPrintString.
	newEntry ).
    
    
    "printing"
    
    "This is the string that the ui will use for a field."
    "It looks like <field name> :=  <field value>."
    _ fieldPrintString = (
	getFieldName, '   :=    ', fieldValue cecilShortPrintString ).
    
    "fieldName currently looks like this: <name of field>@<name of obj>"
    "this method will extract just <name of field> and return it"
    _ getFieldName = ( | index <- 0. |
	(fieldName includes: '@') ifTrue: [
	    [(fieldName at: index) = '@'] whileFalse: [index: index + 1].
	] False: [error: 'Entry in states dictionary does not have a @'].
	fieldName copyFrom: 0 UpTo: index ).
    
    
    "sprouting"
    
    "When this fieldEntry is selected, sprout a cecilObjectBox"
    "that displays the field's value"
    ^ sproutNewBox = ( | newBox. newArrow. loc. |
	loc:
	    (myObjBox location x + myObjBox size x + 80) @ 
	    (myObjBox location y + container location y + location y).
	newBox: uiController addObj: fieldValue At: loc.
	newArrow: fieldArrow createFrom: myObjBox
	    WithTail: arrowLocation
	    To: newBox.
	sproutBox: newBox WithArrow: newArrow.
	self ).
    
    ^ tailColor = (cecilUIColors fieldArrowTail).
    
    ^ printString = 'cecilFieldEntry'.
| )



cecilFieldEntry _Define: (cecilPaneEntry copy) _AddSlots: ( |
    _ parent* = traits cecilFieldEntry.
    ^ fieldName.
    ^ fieldValue.
| )
