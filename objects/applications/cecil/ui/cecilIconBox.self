"Sun-$Revision: 9.1 $"

"cecilIconBox"

traits  cecilUserInterface _AddSlotsIfAbsent: ( | ^ cecilIconBox = () |)
globals cecilUserInterface _AddSlotsIfAbsent: ( | ^ cecilIconBox = () |)

traits cecilIconBox _Define: ( |
    _ parent* = traits cecilUIMovingBox.
    
    "creating"
    
    ^ createForObjBox: objBox = ( | newBox |
	newBox: copy.
	newBox components removeAll.
	newBox container: cecilUI uiController.
	newBox fullBox: objBox.
	newBox label: objBox cecilObj cecilShortUIPrintString.
	newBox fromArrows: list copyRemoveAll.
	newBox toArrows: list copyRemoveAll.
	newBox calculateSize.
	newBox).
    
    ^ createForMethodBox: methodBox = ( | newBox |
	newBox: copy.
	newBox components removeAll.
	newBox container: cecilUI uiController.
	newBox fullBox: methodBox.
	newBox label: methodBox method printString.
	newBox fromArrows: list copyRemoveAll.
	newBox toArrows: list copyRemoveAll.
	newBox calculateSize.
	newBox).
    
    "identity"
    
    ^ my_identity = (fullBox my_identity).
    
    "forwarding"
    
    ^ findMethodEntry: method = (fullBox findMethodEntry: method).
    
    "moving"
    
    ^ moveFromArrows: pt = ( 
	location: pt.
	fromArrows do: [ | :arr |
	    boundingBoxMin: boundingBoxMin min: arr head.
	    boundingBoxMax: boundingBoxMax max: arr head.
	    arr eraseArrow.
	    arr setHeadAndTail.
	    boundingBoxMin: boundingBoxMin min: arr head.
	    boundingBoxMax: boundingBoxMax max: arr head.
	].
	self ).
    
    "drawing"
    
    ^ drawBox = (
	
	graphic: (movingBitmap copyFor: uiWindow Size: size)
	    background: uiController graphic.	
	
	drawBackground.
	drawOutline.
	drawLabel.
	
	self ). 
    
    
    _ drawBackground = (
	graphic fillRectangle: (0@0) ## (size - (1@1))
	    Color: cecilUIColors boxBackground.
	self ).
    
    _ drawOutline = (
	graphic rectangle: (0@0) ## (size - (1@1))
	    Color: cecilUIColors boxOutline.
	self ).
    
    _ drawLabel = ( | xpos. ypos. |
	xpos: boxLayout leftMargin + boxLayout boxOutlineWidth.
	ypos: boxLayout topMargin + boxLayout boxOutlineWidth.
	
	graphic text: label
	    At: xpos @ ypos
	    Font: boxLayout boxFont
	    Color: cecilUIColors labelText.
	self ).
    
    
    "sizing"
    
    _ calculateSize = ( 
	components do: [|:pane| pane calculateSize].
	size: calculateWidth @ calculateHeight.
	self ).
    
    _ calculateWidth = (
	boxLayout leftMargin + boxLayout rightMargin + 
	    (2 * boxLayout boxOutlineWidth) + labelWidth.
    ).
    
    _ calculateHeight = ( | h |
	boxLayout topMargin + boxLayout bottomMargin +
	    (2 * boxLayout boxOutlineWidth) + labelHeight.
    ).
    
    _ labelWidth = (boxLayout boxFont widthOfString: label).
    
    _ labelHeight = (boxLayout boxFont height).
    
    "arrows"
    
    ^ addToArrow: arr = (
	toArrows addFirst: arr.
	fullBox toArrows addFirst: arr.
	self ).
    
    ^ addFromArrow: arr = (
	fromArrows addFirst: arr.
	fullBox fromArrows addFirst: arr.
	self ).
    
    ^ removeFromArrow: arr = (
	fromArrows remove: arr.
	fullBox fromArrows remove: arr.
	self ).
    
    ^ removeToArrow: arr = (
	toArrows remove: arr.
	fullBox toArrows remove: arr.
	self ).
    
    
    "menu"
    
    ^ menu <- nil.
    
    _ addEntries = (
	menu addLabel: 'expand' WithAction: 'expand'.
	menu addLabel: 'close' WithAction: 'close'.
	resend.addEntries.
	self ).
    
    "menu messages"
    
    ^ close = (
	uiController removeBox: self.
	
	fromArrows do: [ | :arr |
	    arr removeArrow.
	    arr toBox removeToArrow: arr.
	    uiController removeArrow: arr.
	].
	toArrows do: [| :arr | 
	    arr removeArrow.
	    arr fromBox removeFromArrow: arr.
	    uiController removeArrow: arr.
	].
	fromArrows removeAll.
	toArrows removeAll.
	fullBox fromArrows removeAll.
	fullBox toArrows removeAll.
	eraseWithUpdate.
    ).
    
    ^ expand = ( | x. y. |
	x: (location x + size x) - fullBox size x.
	y: location y.
	uiController removeBox: self.
	fullBox location: x@y.
	fromArrows do: [ | :arr |
	    arr eraseArrow.
	    arr fromBox: fullBox.
	    arr tail: fullBox location + arr tailOffset.
	    uiController removeArrow: arr.
	].
	toArrows do: [ | :arr |
	    arr eraseArrow.
	    arr toBox: fullBox.
	    arr setHead.
	    uiController removeArrow: arr.
	].
	eraseNoUpdate.
	uiController reAddBox: fullBox.
	
	toArrows do: [ | :arr |
	    uiController addArrow: arr.
	    arr drawArrow.
	]. 
	fromArrows do: [ | :arr |
	    uiController addArrow: arr.
	    arr drawArrow.
	].	
	updateUI.
	self ).
    
    ^ isIconBox = true.
    
    ^ printString = 'cecilIconBox'.
| )


cecilIconBox _Define: (cecilUIMovingBox copy) _AddSlots: ( |
    _ parent* = traits cecilIconBox.
    
    ^ label.
    ^ fullBox.
    
    ^ fromArrows.
    ^ toArrows.
|)
