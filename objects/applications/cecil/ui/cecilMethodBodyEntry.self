"Sun-$Revision: 9.1 $"

"cecilMethodBodyEntry"

traits  cecilUserInterface _AddSlotsIfAbsent: ( | ^ cecilMethodBodyEntry = () |)
globals cecilUserInterface _AddSlotsIfAbsent: ( | ^ cecilMethodBodyEntry = () |)

traits cecilMethodBodyEntry _Define: ( |
    
    _ parent* = traits cecilUIBox.
    
    "shortcuts"
    
    ^ myMethodBox = (container container).
    ^ offset = (container location + location).
    ^ graphic = (myMethodBox graphic).
    ^ method = (container method).
    
    "highlighting"
    
    ^ leftButtonDown = (highlight).
    
    ^ highlight = (| entryColor. textColor. |
	selected 
	    ifTrue: [
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
	myMethodBox redisplayWithUpdate.
	
	selected ifFalse: [
	    sproutNewBox.
	].
	
	self ).
    
    
    "sprouting"
    
    ^ sproutBox: aBox WithArrow: anArrow = (
	myMethodBox toArrows findFirst: [ |:arr|
	    arr isSameAs: anArrow
	] IfPresent: [ |:arr|
	    arr eraseArrow. 
	    updateUI.
	    arr drawArrow.
	    updateUI.
	] IfAbsent: [
	    anArrow fromBox isIconBox ifTrue: [
		(anArrow fromBox findMethodEntry: method)
		    drawTailNoUpdate.
		anArrow setHeadAndTail.
	    ] False: [
		(anArrow fromBox findMethodEntry: method)
		    drawTail.
	    ].
	    aBox addFromArrow: anArrow.
	    myMethodBox addToArrow: anArrow.
	    uiController addArrow: anArrow.
	    anArrow drawArrow.
	    updateUI.
	].
	self ).
    
    "sizing"
    
    ^ calculateSize = ( | w. h. |
	w: boxLayout boxFont widthOfString: label.
	h: boxLayout boxFont height.
	size: w@h.
    ).
    
    ^ printString = 'cecilMethodBodyEntry'.
| )



cecilMethodBodyEntry _Define: (cecilUIBox copy) _AddSlots: ( |
    _ parent* = traits cecilMethodBodyEntry.
    
    _ selected <- false.
    ^ label.
| )

