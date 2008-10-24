"Sun-$Revision: 9.1 $"

"cecilMethodBox"

"This is a box that displays a cecil method."
"Currently, a cecilMethodBox gets created and drawn when
 a method displayed in the cecilObjectBox gets selected."
"This box contains a single pane - a cecilMethodBodyPane -
 which contains the actual text."

"Since this inherits from cecilUIMovingBox, a cecilMethodBox can
 be moved around by holding down the left mouse button and dragging."


traits  cecilUserInterface _AddSlotsIfAbsent: ( | ^ cecilMethodBox = () |)
globals cecilUserInterface _AddSlotsIfAbsent: ( | ^ cecilMethodBox = () |)

traits cecilMethodBox _Define: ( |
    
    _ parent* = traits cecilFullBox.
    
    "creating"
    
    ^ createForCecilMethod: method = ( | newBox |
	newBox: copy.
	newBox container: cecilUI uiController.
	newBox method: method.
	newBox components add: (cecilMethodBodyPane createOn: newBox).
	newBox fromArrows: list copyRemoveAll.
	newBox toArrows: list copyRemoveAll.
	newBox calculateSize.
	newBox iconBox: (cecilIconBox createForMethodBox: newBox).
	newBox ).
    
    "identity"
    
    ^ my_identity = (method).
    
    "accessing"
    
    _ pane = (components first).
    
    "drawing"
    
    ^ drawBox = ( | xpos. ypos. |
	graphic: (movingBitmap copyFor: uiWindow Size: size)
	    background: container graphic.
	
	drawBackground.
	drawOutline.
	components first drawPane.
	self ).
    
    _ drawOutline = (
	graphic rectangle: (0@0) ## (size - (1@1))
	    Color: cecilUIColors boxOutline.
	self ).
    
    _ drawBackground = (
	graphic fillRectangle: (0@0) ## (size - (1@1))
	    Color: cecilUIColors boxBackground.
	self ).
    
    "displaying"
    
    ^ displayAt: loc = (
	location: loc.
	display.
	self ).
    
    "sizing"
    
    "To find the size, use the size of the pane that is"
    "contained within this box, and add the necessary"
    "margins to the width and height"
    ^ calculateSize = (| extraWidth. extraHeight. |
	extraWidth: boxLayout leftMethodBoxMargin + 
	    boxLayout rightMethodBoxMargin +
	    (2 * boxLayout boxOutlineWidth).
	extraHeight: boxLayout topMethodBoxMargin + 
	    boxLayout bottomMethodBoxMargin +
	    (2 * boxLayout boxOutlineWidth).
	size: pane size + (extraWidth @ extraHeight).
	self ).
    
    ^ printString = 'cecilMethodBox'.
| )

cecilMethodBox _Define: (cecilFullBox copy) _AddSlots: ( |
    _ parent* = traits cecilMethodBox.
    ^ method.
|)
