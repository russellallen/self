"Sun-$Revision: 9.1 $"

"cecilMethodEntry"

"For every method that a cecil object has, there is a cecilMethodEntry"
"All of the cecilMethodEntries for an object are displayed within the object's
 cecilMethodsPane (which is within the cecilObjectBox for that object)"
"A cecilMethodEntry has a label, which is the header of the method."
"It is this label which gets displayed in the pane"

"A cecilMethodEntry can be selected (highlighted) by clicking the left
 button on it.  Once selected, another left button click on the entry will
 sprout a methodBox, which shows the code for this method"


traits  cecilUserInterface _AddSlotsIfAbsent: ( | ^ cecilMethodEntry = () |)
globals cecilUserInterface _AddSlotsIfAbsent: ( | ^ cecilMethodEntry = () |)

traits cecilMethodEntry _Define: ( |
    _ parent* = traits cecilPaneEntry.
    
    "creating"
    ^ createFor: method On: pane = ( | newEntry |
	newEntry: copy.
	(newEntry method: method) container: pane.
	newEntry label: newEntry labelPrintString.
	newEntry ).
    
    "printing" 
    ^ labelPrintString = ( | str. first. |
	str: method privacyString.
	method isGetAccessor ifTrue: [
	    isField: true.
	    str: str, method body kind, 'field'.
	] False: [
	    isField: false.
	    str: str, 'method'.
	].
	str: str, ' ', method name, method params printString.
	str: str, (method argsPrintStringIn: myObjBox cecilObj).
	str ).
    
    "highlighting"
    
    ^ highlight = (
	isField ifFalse: [resend.highlight].
	self ).
    
    
    "sprouting"
    
    ^ sproutNewBox = ( | newBox. newArrow. loc. |
	loc: (myObjBox location x + myObjBox size x + 80) @ 
	    (myObjBox location y + container location y + location y + 50).
	newBox: uiController addMethod: method At: loc.
	newArrow: methodArrow createFrom: myObjBox
	    WithTail: arrowLocation
	    To: newBox.
	sproutBox: newBox WithArrow: newArrow.
	self ).
    
    ^ tailColor = (cecilUIColors methodArrowTail).
    
    ^ printString = 'cecilMethodEntry'.
| )



cecilMethodEntry _Define: (cecilPaneEntry copy) _AddSlots: ( |
    _ parent* = traits cecilMethodEntry.
    ^ method.  "a cecilMethod"
    ^ isField <- true.
| )
