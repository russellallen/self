"Sun-$Revision: 9.1 $"

"cecilMethodBodyPane"

"This object is the pane on which actual method text is displayed"
"It is contained within a cecilMethodBox"

traits  cecilUserInterface _AddSlotsIfAbsent: ( | ^ cecilMethodBodyPane = () |)
globals cecilUserInterface _AddSlotsIfAbsent: ( | ^ cecilMethodBodyPane = () |)

traits cecilMethodBodyPane _Define: ( |
    _ parent* = traits cecilUIBox.
    
    "shortcut"
    
    ^ methodBox = (container).
    ^ method = (methodBox method).
    ^ graphic = (methodBox graphic).
    
    "creating" 
    ^ createOn: cecilMethodBox = ( | newPane |
	newPane: copy.
	newPane container: cecilMethodBox.
	newPane initialize.
	newPane ).
    
    _ initialize = ( 
	argEntries: list copyRemoveAll.
	headerAndBody: method bodyText. "only has method body right now"
	method formals do: [ | :formal. newArgEntry. |
	    newArgEntry: cecilArgEntry createFor: formal
		On: self.
	    components addLast: newArgEntry.
	    argEntries addLast: newArgEntry.
	].
	resultEntry: cecilResultEntry createFor: method resultTypeSpec On: self.
	components addLast: resultEntry.
	setLocation.
	makeHeader.
	calculateSize.
	self ).
    
    "header"
    
    ^ makeHeader = ( | header. x. y. i. last. |
	x: textOffset x.
	y: textOffset y.
	header: method privacyString, 'method ', method name, '('.
	x: x + (boxLayout boxFont widthOfString: header).
	i: 0.
	last: argEntries size pred.
	argEntries do: [ | :arg. str. |
	    arg location: x@y.
	    str: arg label.
	    i != last ifTrue: [ str: str, ', ' ].
	    header: header, str.
	    x: x + (boxLayout boxFont widthOfString: str).
	    i: i succ.
	].
	header: header, ')'.
	(resultEntry resultTypeSpec isUndeclared) ifFalse: [
	    header: header, ':'.
	    x: textOffset x + (boxLayout boxFont 
		    widthOfString: header).
	    resultEntry location: x@y.
	    header: header, resultEntry label.
	].
	tackOnHeaderToBody: header. "put header on top of body"
	self ).
    
    _ tackOnHeaderToBody: header = ( | bodyString |
	bodyString: headerAndBody asString.
	bodyString: header, ' ', bodyString.
	headerAndBody: textLines copyLines: bodyString.
	self ).
    
    "location within cecilMethodBox"
    
    _ setLocation = ( | xpos. ypos. |
	xpos: boxLayout leftMethodBoxMargin + boxLayout boxOutlineWidth.
	ypos: boxLayout topMethodBoxMargin + boxLayout boxOutlineWidth.
	location: xpos @ ypos.
	self ).
    
    _ textStartLocation = ( location + textOffset ).
    
    _ textOffset = (
	boxLayout methodBodyPaneMargin @ boxLayout methodBodyPaneMargin ).
    
    "drawing" 
    
    ^ drawPane = ( | textForBody |
	setLocation.
	
	"color whole pane, and draw pane outline"
	drawBackground.
	drawOutline.
	
	"lastly, draw the text into the pane"	
	graphic textLines: headerAndBody
	    At: textStartLocation
	    Font: boxLayout boxFont
	    Color: cecilUIColors text.
	self ).	
    
    _ drawOutline = (
	graphic rectangle: location ## (size - (1@1))
	    Color: cecilUIColors paneOutline.
	self ).
    
    _ drawBackground = (
	graphic fillRectangle: location ## (size - (1@1))
	    Color: cecilUIColors paneBackground.
	self ).
    
    
    "sizing"
    
    "To find the width, find the widest line in the body,
     and add on space for margins, and the pane outline."
    "To find the height, multiply the number of lines in the body
     by the font height, taking vertical spacing into account,
     and add on space for margins and for the pane outline"
    
    ^ calculateSize = ( 
	headerAndBody lines do: [ |:line. lineWidth. |
	    lineWidth: (boxLayout boxFont widthOfString: line).
	    (lineWidth > maxWidth) ifTrue: [maxWidth: lineWidth].
	].
	
	size: calculateWidth @ calculateHeight.
	self ).
    
    _ calculateWidth = (
	(2 * boxLayout methodBodyPaneMargin) +
	    (2 * boxLayout boxOutlineWidth) +
	    maxWidth ).
    
    _ calculateHeight = (
	(2 * boxLayout methodBodyPaneMargin) +
	    (2 * boxLayout boxOutlineWidth) +
	    (headerAndBody height * boxLayout boxFont height) ).
    
    ^ printSting = 'cecilMethodBodyPane'.
| )

cecilMethodBodyPane _Define: (cecilUIBox copy) _AddSlots: ( |
    _ parent* = traits cecilMethodBodyPane.
    
    ^ maxWidth <- 0.
    
    ^ argEntries.
    ^ resultEntry.
    
    ^ headerAndBody.
| )
