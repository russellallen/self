"Sun-$Revision: 9.1 $"

"cecilUIController"

"This is a box in the UI that knows about all the object boxes in the ui"

"It has a bitmap that is the same size as the ui window"
"All box bitmaps get copied to the uiController's bitmap."
"Then, when it comes time to update the ui display, this bitmap"
"is copied to the uiWindow's bitmap, and the uiWindow is flushed."

"It also has the cecilVarBindings, which is a dictionary whose keys are"
"names of all the top level objects in Cecil, and whose values are the"
"the cecilObjects for those names."

traits  cecilUserInterface _AddSlotsIfAbsent: ( | ^ cecilUIController = () |)
globals cecilUserInterface _AddSlotsIfAbsent: ( | ^ cecilUIController = () |)

traits  cecilUserInterface _AddSlotsIfAbsent: ( | ^ cecilUIBox = () |)
globals cecilUserInterface _AddSlotsIfAbsent: ( | ^ cecilUIBox = () |)

traits cecilUIController _Define: ( |
    _ parent* = traits cecilUIBox.
    
    "initializingAndFinalizing"
    
    ^ initializeOn: interp = (
	boxes: boxes copyRemoveAll.
	boxArrowStack: boxArrowStack copyRemoveAll.
	initColorsAndLayoutInfo.
	initBitmap.
	updateUI.
	interpreter: interp.
	cecilVarBindings: interpreter dynamicContext varBindings.
	traits cecilArrow arrowheads: 
	    arrowheadCache copy makeLength: 15 Width: 10.
	self ).
    
    _ initColorsAndLayoutInfo = ( 
	colormap: (cecilColormap initializeOn: uiWindow) uiColormap.
	cecilBoxLayout initFor: uiWindow.
	self ).
    
    
    _ initBitmap = (
	graphic: bitmap copyFor: uiWindow Size: size.
	colorBackground.
	self ).
    
    ^ colorBackground = (
	graphic fillRectangle: (0@0) ## (size - (1@1)) 
	    Color: cecilUIColors windowBackground.
	self ).
    
    ^ resize: newSize = (
	graphic resize: newSize.
	colorBackground.
    ).
    
    
    "adding"
    
    ^ addObjNamed: objName At: loc = ( 
	addObj: (uiController cecilVarBindings at: objName) value
	    At: loc.
    ).
    
    ^ addObj: obj At: loc = (
	boxes findFirst: [| :b | b my_identity =  obj]
	    IfPresent: [| :b | moveBoxToTop: b]
	    IfAbsent: [ addBox: 
		(cecilObjectBox createForObj: obj) At: loc].
    ).
    
    ^ addMethod: method At: loc = (
	boxes findFirst: [| :b | b my_identity =  method]
	    IfPresent: [| :b | moveBoxToTop: b]
	    IfAbsent: [ addBox: 
		(cecilMethodBox createForCecilMethod: method)
		At: loc].
    ).
    
    
    ^ addBox: aBox At: loc = (
	aBox location: loc.
	boxes addFirst: aBox.
	boxArrowStack addFirst: aBox.
	aBox drawBox.
	aBox displayWithUpdate.
	aBox).
    
    ^ reAddBox: aBox = (
	boxes addFirst: aBox.
	boxArrowStack addFirst: aBox.
	aBox displayWithUpdate.
	self ).
    
    ^ removeBox: box = (
	boxes remove: box.
	boxArrowStack remove: box.
	self).
    
    ^ addArrow: arrow = (
	boxArrowStack addFirst: arrow.
	self ).
    
    ^ removeArrow: arrow = (
	boxArrowStack remove: arrow.
	self ).
    
    "raising"
    
    ^ moveBoxToTop: box = ( | index <- 0. connectedArrows. |
	index: eraseBoxesAndArrowsAbove: box.
	
	(index = 0) ifFalse: [
	    box eraseNoUpdate.   
	    connectedArrows: (redisplayBoxesAndArrowsFrom: index - 1).
	    
	    boxArrowStack remove: box.
	    boxArrowStack addFirst: box.
	    box displayNoUpdate. 
	    
	    connectedArrows do: [ |:arr|
		boxArrowStack remove: arr.
		boxArrowStack addFirst: arr.
		arr drawArrow.
	    ].
	    updateUI.
	].
	
	box).
    
    _ eraseBoxesAndArrowsAbove: box = ( | index. boxOrArrow. |
	index: 0.
	boxOrArrow: boxArrowStack at: index.
	[boxOrArrow = box] whileFalse: [
	    boxOrArrow isBox ifTrue: [
		boxOrArrow eraseNoUpdate.
	    ] False: [  "it's an arrow"
		boxOrArrow eraseArrow.
	    ].
	    index: index + 1.
	    boxOrArrow: boxArrowStack at: index.
	].
	index).
    
    _ eraseFromArrows: box = (
	box fromArrows do: [ |:arr|
	    arr drawArrow.
	].
	self ).
    
    _ drawFromArrows: box = (
	box fromArrows do: [ |:arr|
	    arr drawArrow.
	].
	self ). 
    
    _ redisplayBoxesAndArrowsFrom: i = ( | index. boxOrArrow. 
	connectedArrows. theBox. |
	index: i.
	theBox: boxArrowStack at: index+1.
	connectedArrows: list copyRemoveAll.
	
	[index >= 0] whileTrue: [ 
	    boxOrArrow: boxArrowStack at: index.
	    boxOrArrow isBox ifTrue: [
		boxOrArrow displayNoUpdate.
	    ] False: [
		(theBox hasArrow: boxOrArrow) ifTrue: [
		    connectedArrows addFirst: boxOrArrow.
		] False: [
		    boxOrArrow drawArrow.
		].
	    ].
	    index: index - 1.
	].
	connectedArrows ).	
    
    _ bringBoxToFront: box = (
	boxArrowStack remove: box.
	boxArrowStack addFirst: box.
	boxes remove: box.
	boxes addFirst: box.
	self ).
    
    
    "responding"
    
    ^ leftButtonDownAt: pos = (
	(componentContaining: pos) leftButtonDown.
	self ).
    
    ^ rightButtonDownAt: pos = (
	(componentContaining: pos) rightButtonDown.
	self ).
    
    ^ leftButtonDown = ().
    ^ leftButtonUp = ().
    ^ middleButtonDown = ().
    ^ middleButtonUp = ().
    
    "shortcuts"
    ^ size = (theUI size).
    ^ uiWindow = (theUI uiWindow).
    
    ^ components = (boxes).
    
    ^ container = (theUI).
    
    ^ printString = 'cecilUIController'.
| )


cecilUIController _Define: ( |
    _ parent* = traits cecilUIController.
    
    ^ boxes <- list.
    ^ boxArrowStack <- list.
    
    ^ graphic <- bitmap.
    ^_cecilVarBindings <- nil.
    ^ interpreter.
    ^ colormap <- xlib colormap.
| )
