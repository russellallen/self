"Sun-$Revision: 9.1 $"

"cecilUIMovingBox"

"This object is an ancestor for any displayable component"
"in the ui that can be moved around interactively."
"They are just cecilUIBox's with moving behavior added"

"Holding down the left mouse button on one of these boxes"
"makes the box move with the mouse cursor."

"If the box that is clicked on is not already at the front,"
"then we must first bring it to the front before moving it"

"In order to get the right results when we bring a box to"
"the front, we must erase any boxes which have been displayed"
"more recently than this one, then erase this one,"
"then display each from back to front, then display this box."
"This is necessary even though some of the more recently displayed"
"boxes may not even cover up (overlap) this box,"
"because such boxes may overlap with boxes which do overlap this box"


traits  cecilUserInterface _AddSlotsIfAbsent: ( | ^ cecilUIMovingBox = () |)
globals cecilUserInterface _AddSlotsIfAbsent: ( | ^ cecilUIMovingBox = () |)

traits cecilUIMovingBox _Define: ( |
    _ parent* = traits cecilUIBox.
    _ identity* = mixins identity.
    
    "responding"
    
    ^ leftButtonDown = ( 
	uiController moveBoxToTop: self.
	followCursorWhile: [cursor leftButtonDown].
	self ).
    
    ^ rightButtonDown = (
	uiController moveBoxToTop: self.
	resend.rightButtonDown.
	self).
    
    "moving"
    
    ^ moveTo: pt = ( 
	boundingBoxMin: location min: pt.
	boundingBoxMax: (location + size) max: (pt + size).
	moveFromArrows: pt.	   
	moveToArrows.
	redrawAll: pt.
	self ).
    
    _ moveFromArrows: pt = (
	fromArrows do: [ | :arr |
	    boundingBoxMin: boundingBoxMin min: arr head.
	    boundingBoxMax: boundingBoxMax max: arr head.
	    arr eraseArrow.
	    arr setTail: arr tail + (pt - location).
	    boundingBoxMin: boundingBoxMin min: arr head.
	    boundingBoxMax: boundingBoxMax max: arr head.
	].
	location: pt.
	self ).
    
    _ moveToArrows = (
	toArrows do: [ | :arr |
	    boundingBoxMin: boundingBoxMin min: arr tail.
	    boundingBoxMax: boundingBoxMax max: arr tail.
	    arr eraseArrow.
	    arr setHeadAndTail: arr tail.
	    boundingBoxMin: boundingBoxMin min: arr tail.
	    boundingBoxMax: boundingBoxMax max: arr tail.
	].
	self ).
    
    _ redrawAll: pt = (
	graphic moveTo: pt.
	
	fromArrows do: [ | :arr |
	    arr drawArrow.
	].
	toArrows do: [ | :arr |
	    arr drawArrow.
	].
	self ).
    
    _ followCursorWhile: whileBlock = (
	moveBoxWithCursorOffset: cursor location - location
	    Doing: [ | :doBlock |
	    cursor while: whileBlock
		Do: doBlock.
	].
	self ).
    
    _ moveBoxWithCursorOffset: offset Doing: block = (
	block value: [ | :nextLocation. nextPoint. prevPoint. orig. corn. |
	    prevPoint: location.
	    nextPoint: nextLocation - offset.
	    moveTo: nextPoint.
	    orig: prevPoint min: nextPoint.
	    corn: (prevPoint + size) max: (nextPoint + size).
	    updateUIRect:
		(boundingBoxMin - (5@5)) #  "the extra 5 is for arrowhead width"
		(boundingBoxMax + (5@5)).
	].
	self).
    
    
    "displaying"
    
    ^ displayWithUpdate = (
	displayNoUpdate.
	updateUI.
	self ).
    
    ^ displayNoUpdate = (
	graphic location: location.
	graphic display.
	self ).
    
    ^ redisplayWithUpdate = (
	redisplayNoUpdate.
	updateUI.
	self).
    
    ^ redisplayNoUpdate = (
	uiController eraseFromArrows: self.
	graphic erase.
	graphic display.
	uiController drawFromArrows: self.
	self).
    
    ^ eraseWithUpdate = (
	eraseNoUpdate.
	updateUI.
	self ).
    
    ^ eraseNoUpdate = (
	graphic erase.
    ).
    
    "arrows"
    
    ^ hasArrow: arrow = (
	(fromArrows includes: arrow) || [toArrows includes: arrow].
    ).
    
    "testing"
    ^ isBox = true.
    
    ^ isArrow = false.
    
    ^ isIconBox = false.
    
    ^ printString = 'a cecilUIMovingBox.'
	
| )


cecilUIMovingBox _Define: (cecilUIBox copy) _AddSlots: ( |
    _ parent* = traits cecilUIMovingBox.
    _ thisObjectPrints = true.
    
    ^ graphic <- movingBitmap.
    
    ^ fromArrows <- list copyRemoveAll.
    ^ toArrows <- list copyRemoveAll.
    
    _ boundingBoxMin <- 1000@1000.
    _ boundingBoxMax <- 0@0.
| )
