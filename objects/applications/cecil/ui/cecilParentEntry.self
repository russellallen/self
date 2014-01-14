"Sun-$Revision: 9.1 $"

 "cecilParentEntry"

"This entry is within a cecilParentsPane, and shows a parent of
 an object.  It shows whether the relationship is isa, inherits, or
 subtype"

"If this entry is selected (by left-button clicking on it twice),
 a cecilObjectBox sprouts which displays that parent."


traits  cecilUserInterface _AddSlotsIfAbsent: ( | ^ cecilParentEntry = () |)
globals cecilUserInterface _AddSlotsIfAbsent: ( | ^ cecilParentEntry = () |)

traits cecilParentEntry _Define: ( |
    _ parent* = traits cecilPaneEntry.
    
    "creating"
    ^ createFor: parentObj Kind: kind On: pane = (
	((copy parentObject: parentObj) container: pane) 
	    label: (prettyPrintParent: parentObj WithKind: kind).
    ).
    
    "drawing"
    
    "Takes a method and returns a string that will be used"
    "as the label for this method"
    _ prettyPrintParent: parentObj WithKind: kind= ( | str |
	str: kind, ' ', parentObj name.
	str).
    
    "sprouting"
    
    ^ sproutNewBox = ( | newBox. newArrow. loc. |
	loc: (myObjBox location x + myObjBox size x + 80) @ 
	    (myObjBox location y + container location y + location y).
	newBox: uiController addObj: parentObject At: loc.
	newArrow: parentArrow createFrom: myObjBox
	    WithTail: arrowLocation
	    To: newBox.
	sproutBox: newBox WithArrow: newArrow.
	self ).
    
    ^ tailColor = (cecilUIColors parentArrowTail).
    
    ^ printString = 'cecilMethodEntry'.
| )


cecilParentEntry _Define: cecilPaneEntry clone _AddSlots: ( |
    _ parent* = traits cecilParentEntry.
    ^ parentObject.
| )
