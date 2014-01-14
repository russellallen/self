"Sun-$Revision: 9.1 $"

"cecilObjectBox"

"This object is a box that displays a cecil object"

"It contains 4 panes - one which shows the name of the object,
 and the others for parents, fields, and methods"
"(See cecilNamePane, cecilParentsPane, cecilFieldsPane, and cecilMethodsPane)"

"It is a cecilUIMovingBox - see comments there about moving it around"

"In order to calculate the size of this box, this object must know"
"the maximum width of all 4 panes, and must know the height of"
"all43 panes."

"Thus we must first create all 4 panes, so that we can determine"
"the widest one, and the height of all 4 panes."
"From this we can calculate the size of the cecilObjectBox"
"and allocate the bitmap for it, then we can draw the box and all 4 panes."


traits  cecilUserInterface _AddSlotsIfAbsent: ( | ^ cecilObjectBox = () |)
globals cecilUserInterface _AddSlotsIfAbsent: ( | ^ cecilObjectBox = () |)

traits cecilObjectBox _Define: ( |
    _ parent* = traits cecilFullBox.
    
    "creating"
    
    ^ createForObjNamed: objName = (
	"objName is a string"
	createForObj: 
	    (cecilUI uiController cecilVarBindings at: objName) value.
    ).
    
    ^ createForObj: obj = ( | newBox |
	"obj is a cecilObject"
	newBox: copy.
	newBox initializeWithObj: obj.
	newBox ).
    
    _ initializeWithObj: obj = (
	components removeAll.
	container: cecilUI uiController.
	cecilObj: obj.
	fromArrows: list copyRemoveAll.
	toArrows: list copyRemoveAll.
	label: obj cecilUIPrintString.
	updateMaxWidth: labelWidth.
	components add: (cecilParentsPane createOn: self).
	components add: (cecilFieldsPane createOn: self).
	components add: (cecilMethodsPane createOn: self).
	iconBox: (cecilIconBox createForObjBox: self).
	self ).
    
    
    "drawing"
    
    ^ drawBox = (
	calculateSize.
	
	graphic: (movingBitmap copyFor: uiWindow Size: size)
	    background: uiController graphic.	
	
	drawBackground.
	drawLabel.
	drawOutline.
	drawPanes.
	
	self ). 
    
    
    _ drawBackground = (
	graphic fillRectangle: (0@0) ## (size - (1@1))
	    Color: cecilUIColors boxBackground.
	self ).
    
    _ drawOutline = (
	graphic rectangle: (0@0) ## (size - (1@1))
	    Color: cecilUIColors boxOutline.
	self ).
    
    _ drawLabel = ( | xpos. ypos. widthDiff. labelPos. |
	xpos: boxLayout boxOutlineWidth.
	ypos: boxLayout topMargin + boxLayout boxOutlineWidth.
	widthDiff: size x - labelWidth.
	labelPos: (xpos + (widthDiff /= 2)) @ ypos.
	
	graphic text: label
	    At: labelPos
	    Font: boxLayout boxPublicFont
	    Color: cecilUIColors labelText.
	self ).
    
    
    _ drawPanes = ( | xpos. ypos. |
	xpos: boxLayout leftMargin + boxLayout boxOutlineWidth.
	ypos: boxLayout topMargin + boxLayout boxOutlineWidth +
	    boxLayout boxPublicFont height + boxLayout marginBetweenPanes.
	
	components do: [| :pane | 
	    (pane components size) > 0 ifTrue: [
		pane location: xpos@ypos.
		pane drawPane.
		ypos: ypos + pane size y + boxLayout marginBetweenPanes
		    + boxLayout boxOutlineWidth.
	    ].
	].
	self ).
    
    "finding"
    
    ^ myMethodsPane = (components at: 2).
    
    ^ findMethodEntry: method = (
	myMethodsPane findMethodEntry: method.
    ).
    
    "arrows"
    
    ^ eraseTailAt: loc = ( 
	graphic fillCircleCenteredAt: loc
	    Diameter: boxLayout tailDiameter
	    Color: cecilUIColors entryBackground.
	self ).
    
    "sizing"
    
    _ calculateSize = ( 
	components do: [|:pane| pane calculateSize].
	size: calculateWidth @ calculateHeight.
	self ).
    
    _ calculateWidth = (
	boxLayout leftMargin + boxLayout rightMargin + 
	    boxLayout leftPaneMargin + boxLayout rightPaneMargin +
	    (4 * boxLayout boxOutlineWidth) + maxPaneWidth ).
    
    _ calculateHeight = ( | h |
	h: boxLayout topMargin + boxLayout bottomMargin +
	    (2 * boxLayout boxOutlineWidth).
	components do: [ |:pane | h: h + pane size y.
	    (pane components size > 0) ifTrue: [
		h: h + boxLayout marginBetweenPanes. ].
	].
	h: h + boxLayout boxPublicFont height.
	h ).
    
    ^ updateMaxWidth: paneWidth = ( 
	(paneWidth > maxPaneWidth) ifTrue: [maxPaneWidth: paneWidth].
	self ).
    
    "menu"
    
    ^ menu <- nil.
    
    _ addEntries = (
	resend.addEntries.
	self ).
    
    
    "label"
    
    ^ my_identity = (cecilObj).
    
    _ labelWidth = (
	boxLayout boxPublicFont widthOfString: label.
    ).
    
    ^ printString = 'cecilObjectBox'.
| )


cecilObjectBox _Define: (cecilFullBox copy) _AddSlots: ( |
    _ parent* = traits cecilObjectBox.
    
    ^ cecilObj.
    ^ label.
    ^ maxPaneWidth <- 0.
|)
