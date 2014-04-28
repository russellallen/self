"Sun-$Revision: 9.1 $"

"cecilObjectPane"

"A pane is a box within a cecilObjectBox which holds either parents,
  methods, fields, or the object's name. "
"This is the parent of cecilNamePane, cecilParentsPane, cecilFieldsPane, 
 and cecilMethodsPane"

traits  cecilUserInterface _AddSlotsIfAbsent: ( | ^ cecilObjectPane = () |)
globals cecilUserInterface _AddSlotsIfAbsent: ( | ^ cecilObjectPane = () |)

traits cecilObjectPane _Define: ( |
    
    _ parent* = traits cecilUIBox.
    
    
    "bitmap"
    
    ^ graphic = (container graphic).
    
    "drawing" 
    
    ^ drawPane = ( 
	drawBackground.	    
	drawOutline.
	drawEntries.
	self ).	
    
    _ drawBackground = (
	graphic fillRectangle: location ## (size - (1@1))
	    Color: cecilUIColors entryBackground.
	self).
    
    _ drawOutline = (
	graphic rectangle: location ## (size - (1@1))
	    Color: cecilUIColors paneOutline.
	self ).
    
    _ drawEntries = ( | xpos. ypos. |
	xpos: boxLayout leftPaneMargin + boxLayout boxOutlineWidth.
	ypos: boxLayout topPaneMargin + boxLayout boxOutlineWidth.
	
	components do: [ | :entry |
	    entry location: xpos @ ypos.
	    entry drawEntry.
	    ypos: ypos + (boxLayout boxFont height *
		    boxLayout verticalSpacing).
	].
	self ).
    
    
    "sizing"
    
    " calculate and set the size of the pane"
    " the height depends on the number of entries"
    " the width depends on the widest pane entry in ANY of the panes"
    
    ^ calculateSize = ( 
	components size > 0 ifTrue: [
	    size: calculateWidth @ calculateHeight.
	] False: [
	    size: 0@0.
	].
	self ).
    
    _ calculateWidth = (
	boxLayout leftPaneMargin + boxLayout rightPaneMargin +
	    (2 * boxLayout boxOutlineWidth) + maxWidth.
    ).
    
    _ calculateHeight = (
	(boxLayout topPaneMargin + boxLayout bottomPaneMargin
		+ (2 * boxLayout boxOutlineWidth) + 
		(components size * boxLayout verticalSpacing *  
		    boxLayout boxFont height)).
    ).
    
    
    
    "width updating"
    ^ updateMaxWidth: string = ( | stringWidth |
	stringWidth: (boxLayout boxFont widthOfString: string).
	(stringWidth > maxEntryWidth)
	    ifTrue: [maxEntryWidth: stringWidth].
	self ).
    
    ^ maxWidth = (container maxPaneWidth).
    
    ^ printSting = 'cecilObjectPane'.
| )

cecilObjectPane _Define: (cecilUIBox copy) _AddSlots: ( |
    _ parent* = traits cecilObjectPane.
    
    ^ maxEntryWidth <- 0.
| )
