"Sun-$Revision: 9.1 $"

"cecilFullBox"

traits  cecilUserInterface _AddSlotsIfAbsent: ( | ^ cecilFullBox = () |)
globals cecilUserInterface _AddSlotsIfAbsent: ( | ^ cecilFullBox = () |)

traits cecilFullBox _Define: ( |
    _ parent* = traits cecilUIMovingBox.
    
    "arrows"
    
    ^ addFromArrow: arr = (
	fromArrows addFirst: arr.
	iconBox fromArrows addFirst: arr.
	self).
    
    ^ addToArrow: arr = (
	toArrows addFirst: arr.
	iconBox toArrows addFirst: arr.
	self).
    
    ^ removeFromArrow: arr = (
	fromArrows remove: arr.
	iconBox fromArrows remove: arr.
	self ).
    
    ^ removeToArrow: arr = (
	toArrows remove: arr.
	iconBox toArrows remove: arr.
	self ).
    
    "menu"
    
    ^ menu <- nil.
    
    _ addEntries = (
	menu addLabel: 'iconify' WithAction: 'iconify'.
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
	iconBox fromArrows removeAll.
	iconBox toArrows removeAll.
	eraseWithUpdate.
    ).
    
    ^ iconify = ( | x. y. |
	uiController removeBox: self.
	x: (location x + size x) - iconBox size x.
	y: location y.
	iconBox location: x@y.
	fromArrows do: [ | :arr |
	    arr eraseArrow.
	    arr fromBox: iconBox.
	    arr setHeadAndTail.
	    uiController removeArrow: arr.
	].
	toArrows do: [ | :arr |
	    arr eraseArrow.
	    arr toBox: iconBox.
	    arr setHead.
	    uiController removeArrow: arr.
	].
	eraseNoUpdate.
	uiController addBox: iconBox At: iconBox location.
	
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
    
    
    ^ printString = 'cecilFullBox'.
| )


cecilFullBox _Define: (cecilUIMovingBox copy) _AddSlots: ( |
    _ parent* = traits cecilFullBox.
    ^ iconBox.
|)
