"Sun-$Revision: 9.1 $"

"cecilArgEntry"

traits  cecilUserInterface _AddSlotsIfAbsent: ( | ^ cecilArgEntry = () |)
globals cecilUserInterface _AddSlotsIfAbsent: ( | ^ cecilArgEntry = () |)

traits cecilArgEntry _Define: ( |
    _ parent* = traits cecilMethodBodyEntry.
    
    "creating"
    ^ createFor: formal On: pane = ( | newEntry |
	newEntry: copy.
	(newEntry formal: formal) container: pane.
	newEntry label: formal printString.
	newEntry calculateSize.
	newEntry ).
    
    "sprouting"
    ^ sproutNewBox = ( | newBox. newArrow. loc. arrowLoc. |
	loc:
	    (myMethodBox location x + container location x) @
	    (myMethodBox location y - 300).
	newBox: uiController addObj: formal constraint At: loc.
	newBox isIconBox ifTrue: [
	    newBox fullBox location: newBox location.
	    arrowLoc: (newBox findMethodEntry: method) arrowLocation.
	    
	    newArrow: methodArrow createFrom: newBox
		WithTail: arrowLoc
		To: myMethodBox.
	    sproutBox: newBox WithArrow: newArrow.
	] False: [
	    arrowLoc: (newBox findMethodEntry: method) arrowLocation.
	    
	    newArrow: methodArrow createFrom: newBox
		WithTail: arrowLoc
		To: myMethodBox.
	    sproutBox: newBox WithArrow: newArrow.
	].
	self ).
    
    ^ printString = 'cecilArgEntry'.
    
| )



cecilArgEntry _Define: (cecilMethodBodyEntry copy) _AddSlots: ( |
    _ parent* = traits cecilArgEntry.
    ^ formal. "a cecilFormal" 
| )
