"Sun-$Revision: 9.1 $"

"cecilResultEntry"

traits  cecilUserInterface _AddSlotsIfAbsent: ( | ^ cecilResultEntry = () |)
globals cecilUserInterface _AddSlotsIfAbsent: ( | ^ cecilResultEntry = () |)

traits cecilResultEntry _Define: ( |
    
    _ parent* = traits cecilMethodBodyEntry.
    
    "creating"
    ^ createFor: resultSpec On: pane = ( | newEntry |
	newEntry: (copy resultTypeSpec: resultSpec) container: pane.
	newEntry label: resultSpec printString.
	newEntry calculateSize.
	newEntry ).
    
    "sprouting"
    
    ^ highlight = ().
    
    ^ sproutNewBox = ( | newBox. newArrow. loc. arrowLoc. |
	loc: (myMethodBox location x + container location x) @ 
	    ((myMethodBox location y) - 100).
	newBox: uiController addObj: resultTypeSpec type At: loc.
	arrowLoc: (newBox findMethodEntry: method) arrowLocation.
	newArrow: methodArrow createFrom: newBox
	    WithTail: arrowLoc
	    To: myMethodBox.
	sproutBox: newBox WithArrow: newArrow.
	self ).
    
    ^ printString = 'cecilResultEntry'.
| )



cecilResultEntry _Define: (cecilMethodBodyEntry copy) _AddSlots: ( |
    _ parent* = traits cecilResultEntry.
    ^ resultTypeSpec.
| )
