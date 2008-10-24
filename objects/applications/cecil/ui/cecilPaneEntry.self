"Sun-$Revision: 9.1 $"

"cecilPaneEntry"

"A cecilPaneEntry is an object that lives within a cecilObjectPane"
"cecilNameEntry shows the name of an object - it is within cecilNamePane"
"cecilParentEntry's are all the parents in the cecilParentsPane"
"cecilFieldEntry's are all the fields in the cecilFieldsPane"
"cecilMethodEntry's are all the methods in the cecilMethodsPane"
"See descriptions of these objects"

traits  cecilUserInterface _AddSlotsIfAbsent: ( | ^ cecilPaneEntry = () |)
globals cecilUserInterface _AddSlotsIfAbsent: ( | ^ cecilPaneEntry = () |)

traits cecilPaneEntry _Define: ( |
    _ parent* = traits cecilUIBox.
    
    "locating and bitmap stuff"
    
    ^ myObjBox = (container container).
    ^ graphic = (myObjBox graphic).
    ^ offset  = (location + container location).
    
    "drawing"
    
    ^ drawEntry = (
	size: container maxWidth @ height.
	graphic text: label
	    At: offset
	    Font: boxLayout boxFont
	    Color: cecilUIColors text.
	self ).
    
    
    "arrows"
    ^ localArrowLoc = (| x. y. |
	x: offset x + size x + (boxLayout rightPaneMargin /= 2).
	y: offset y + ((height /= 2) - 1).
	x@y).
    
    ^ arrowLocation = ( 
	localArrowLoc + myObjBox location.
    ).
    
    ^ drawTail = (
	graphic fillCircleCenteredAt: localArrowLoc
	    Diameter: boxLayout tailDiameter
	    Color: tailColor.
	myObjBox redisplayWithUpdate.
	self ).
    
    ^ drawTailNoUpdate = (
	graphic fillCircleCenteredAt: localArrowLoc
	    Diameter: boxLayout tailDiameter
	    Color: tailColor.
	self ).
    
    
    "selecting"
    _ highlight = ( | entryColor. textColor. |
	selected ifTrue: [
	    selected: false.
	    entryColor: cecilUIColors entryBackground.
	    textColor: cecilUIColors text.
	] False: [
	    selected: true.
	    entryColor: cecilUIColors highlightBackground.
	    textColor: cecilUIColors highlightText.
	].
	
	graphic fillRectangle: offset ## (size - (1@1))
	    Color: entryColor.
	graphic text: label
	    At: offset
	    Font: boxLayout boxFont
	    Color: textColor.
	myObjBox redisplayWithUpdate.
	
	selected ifFalse: [
	    sproutNewBox.
	].
	
	self ).
    
    "sprouting"
    
    " first check to see if there is already an arrow there"
    ^ sproutBox: aBox WithArrow: anArrow = (
	myObjBox fromArrows findFirst: [ |:arr|
	    arr isSameAs: anArrow
	] IfPresent: [ |:arr| arr eraseArrow. 
	    updateUI.
	    arr drawArrow.
	    updateUI.
	] IfAbsent: [
	    drawTail.
	    aBox addToArrow: anArrow.
	    myObjBox addFromArrow: anArrow.
	    uiController addArrow: anArrow.
	    anArrow drawArrow.
	    updateUI.
	].
	self ).
    
    
    "responding"
    ^ leftButtonDown = (highlight).
    
    "sizing stuff"
    _ height = (boxLayout boxFont height * boxLayout verticalSpacing).
    
    ^ printString = 'cecilPaneEntry'.
| )

cecilPaneEntry _Define: (cecilUIBox copy) _AddSlots: ( |
    _ parent* = traits cecilPaneEntry.
    _ selected <- false.
    ^ label.  "a string"
| )
