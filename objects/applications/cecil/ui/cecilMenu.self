"Sun-$Revision: 9.1 $"

"cecilMenu"

traits  cecilUserInterface _AddSlotsIfAbsent: ( | ^ cecilMenu = () |)
globals cecilUserInterface _AddSlotsIfAbsent: ( | ^ cecilMenu = () |)

traits cecilMenu _Define: ( |
    _ parent* = traits cecilUITempBox.
    
    "creating"
    
    ^ create = ( | newMenu |
	newMenu: copy.
	newMenu components removeAll.
	newMenu container: uiController.
	newMenu ).
    
    "adding entries"
    
    ^ addLabel: label WithAction: message = (
	labels: labels copyAddLast: label.
	messages: messages copyAddLast: message.
	numEntries: numEntries + 1.
	updateMaxWidth: label.
	self ).
    
    "displaying"
    
    ^ displayAt: loc = (
	location: loc.
	display.
	self ).
    
    "following cursor"
    
    ^ followMenuCursorWhile: whileBlock = (
	followCursorDoing: [ | :doBlock |
	    cursor while: whileBlock
		Do: doBlock.
	].
	takeActionAndErase.
	self ).
    
    _ followCursorDoing: block = (
	block value: [ | :nextLocation. currentEntry. |
	    currentEntry: (inWhichEntry: nextLocation).
	    (currentEntry = chosenEntry) ifFalse: [
		(chosenEntry = nil) ifFalse: [
		    changeEntry: chosenEntry Highlight: false.
		].
		chosenEntry: currentEntry.
		changeEntry: currentEntry Highlight: true.
		redisplay.
	    ].
	].
	self).
    
    _ inWhichEntry: loc = ( | num |
	(absoluteUpperLeft ## allEntriesSize includes: loc) ifTrue: [
	    num: (loc y - absoluteFirstY) /- entryHeight.
	    num > numEntries ifTrue: [nil] False: [num]
	]
	    False: [nil].
    ).
    
    _ changeEntry: num Highlight: bool = (
	(num = nil) ifFalse: [ | entryY. backColor. textColor. |
	    bool ifTrue: [
		backColor: cecilUIColors menuHighlight.
		textColor: cecilUIColors highlightText.
	    ] False: [
		backColor: cecilUIColors menuBackground.
		textColor: cecilUIColors text.
	    ].
	    entryY:  firstEntryY + (num * entryHeight).
	    graphic fillRectangle:
		((entryX + boxLayout menuHighlightMargin) @ entryY) ##
		(entrySize - ((2 * boxLayout menuHighlightMargin) @ 0))
		Color:  backColor.
	    graphic text: (labels at: num)
		At: (textX @ entryY)
		Font: boxLayout boxFont
		Color: textColor.
	].
	self ).
    
    "acting on a selection, and erasing"
    
    ^ takeActionAndErase = (
	erase.
	takeAction.
	forBox: nil.
	self ).
    
    _ takeAction = (
	(chosenEntry != nil) ifTrue: [
	    ('forBox ', (messages at: chosenEntry))
		evalInContext: (reflect: self)
		FileName: 'cecilMenu.self'.
	].
	self ).
    
    _ erase = (
	graphic erase.
	updateUI.
	self ).
    
    "drawing"
    
    ^ drawMenu = (
	calculateSize.
	
	graphic: (movingBitmap copyFor: uiWindow Size: size)
	    background: uiController graphic.	
	
	drawBackground.
	drawOutline.
	drawEntries.
	self ). 
    
    
    _ drawBackground = (
	graphic fillRectangle: (0@0) ## (size - (1@1))
	    Color: cecilUIColors menuBackground.
	self ).
    
    _ drawOutline = (
	graphic rectangle: (0@0) ## (size - (1@1))
	    Color: cecilUIColors boxOutline.
	self ).
    
    _ drawEntries = ( | textY |
	textY: firstEntryY.
	
	labels do: [ | :label |
	    graphic text: label
		At: textX @ textY
		Font: boxLayout boxFont
		Color: cecilUIColors text.
	    textY: textY + entryHeight.
	].
	self ).
    
    
    "sizing"
    
    _ calculateSize = ( 
	size: calculateWidth @ calculateHeight.
	self ).
    
    _ calculateWidth = (
	(2 * boxLayout boxOutlineWidth) + 
	    entryWidth ).
    
    _ calculateHeight = ( 
	(2 * boxLayout boxOutlineWidth) + 
	    (numEntries * entryHeight) + 
	    (2 * boxLayout menuMargin) ).
    
    ^ updateMaxWidth: label = ( | labelWidth |
	labelWidth: boxLayout boxFont widthOfString: label.
	(labelWidth > maxWidth) ifTrue: [maxWidth: labelWidth].
	self ).
    
    "convenient calculations"
    
    _ textX = (boxLayout boxOutlineWidth + boxLayout menuMargin).
    
    _ entryX = (boxLayout boxOutlineWidth).
    
    _ firstEntryY = (boxLayout boxOutlineWidth + boxLayout menuMargin).
    
    _ absoluteFirstY = (location y + firstEntryY).
    
    _ upperLeft = (entryX @ firstEntryY).
    
    _ absoluteUpperLeft = (location + upperLeft).
    
    _ entryWidth = (maxWidth + (2 * boxLayout menuMargin)).
    
    _ entryHeight = (boxLayout boxFont height).
    
    _ entrySize = (entryWidth @ entryHeight).
    
    _ allEntriesSize = (entryWidth @ (numEntries * entryHeight)).
    
    ^ printString = 'cecilMenu'.
| )


cecilMenu _Define: cecilUITempBox clone _AddSlots: ( |
    _ parent* = traits cecilMenu.
    
    forBox <- nil.
    numEntries <- 0.
    labels <- vector copyRemoveAll.
    messages <- vector copyRemoveAll.
    chosenEntry <- nil.
    
    maxWidth <- 0.
|)
