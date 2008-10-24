"Sun-$Revision: 9.1 $"

"cecilUITempBox"

traits  cecilUserInterface _AddSlotsIfAbsent: ( | ^ cecilUITempBox = () |)
globals cecilUserInterface _AddSlotsIfAbsent: ( | ^ cecilUITempBox = () |)

traits cecilUITempBox _Define: ( |
    _ parent* = traits cecilUIBox.
    
    "displaying"
    
    ^ display = (
	graphic location: location.
	graphic display.
	updateUI.
	self ).
    
    ^ redisplay = (
	graphic moveTo: location.
	updateUI.
	self).
    
    "updating"
    
    ^ updateUI = (
	theUI updateRect: location ## (size - (1@1)).
	self ).
    
    ^ printString = 'a cecilUITempBox.'
| )


cecilUITempBox _Define: (cecilUIBox copy) _AddSlots: ( |
    _ parent* = traits cecilUITempBox.
    _ thisObjectPrints = true.
    
    ^ graphic <- movingBitmap.
| )
