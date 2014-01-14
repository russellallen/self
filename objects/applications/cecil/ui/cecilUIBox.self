"Sun-$Revision: 9.1 $"

"cecilUIBox"

"This object is an ancestor for any displayable component in the UI"
"These components are boxes."

"These objects nest.  They have a container, and some containees"
"which are called components."

"Since these objects know their bounds, it is easy to determine"
"which component is the intended receiver of a mouse click"

"When a mouse event occurs, we find the innermost component"
"whose boundaries include the location of the mouse click"

"Then, if that component doesn't want to handle the event,"
"it passes it upwards to its container, and the container"
"will do likewise"

"If no box in the hierarchy wants to handle the event,"
"then nothing happens, which is what we want."
"We just have to make sure that the top guy in the nesting"
"hierarchy doesn't try to pass it up - it should take the event"
"and do nothing with it"


traits  cecilUserInterface _AddSlotsIfAbsent: ( | ^ cecilUIBox = () |)
globals cecilUserInterface _AddSlotsIfAbsent: ( | ^ cecilUIBox = () |)

traits cecilUIBox _Define: ( |
    _ parent* = traits clonable.
    _ identity* = mixins identity.
    
    "copying"
    
    ^ copy = (
	resend.copy components: (components copy removeAll).
    ).
    
    "menus"
    
    ^ menu <- nil.
    
    ^ installMenu = (
	(menu = nil) ifTrue: [
	    createMenu.
	    menu drawMenu.
	].
	menu forBox: self.
	self).
    
    _ createMenu = (
	menu: cecilMenu create.
	addEntries.
	self ).
    
    _ addEntries = (
	menu addLabel: 'quit' WithAction: 'quitUI'.	
	self ).
    
    "descendant responsibilities"
    
    "descendants of cecilUIBox that want to have a menu
     OTHER than this default one must do 3 things:
     (1) Have s lot in their traits object called menu,
     initialized to nil.
     (2) Have an addEntries method which calls
     menu addLabel:WithAction: for all entries in the menu.
     (3) Have a method for each action that goes with
     a menu entry"
    
    
    "menu messages"
    
    ^ quitUI = (cecilUI quit).
    
    
    "sharedObjects"
    
    ^ theUI = cecilUI.
    ^ uiController = cecilUIController.
    ^ boxLayout = cecilBoxLayout.
    ^ colors = cecilColors.
    
    ^ colormap = (uiController colormap).
    ^ uiWindow = (cecilUI uiWindow).
    ^ cursor = (uiWindow cursor).
    
    
    "bounding"
    
    ^ bound = ( size asRectangle ).
    ^ containsPoint: pt = ( bound includes: pt ).
    
    "sizing"
    
    ^ height = (size y).
    ^ width  = (size x).
    
    "finding"
    
    ^ componentContaining: pt = (
	components do: [ | :box. translatedPt. |
	    translatedPt: pt - box location.
	    (box containsPoint: translatedPt)
		ifTrue: [^box componentContaining: translatedPt ].
	].
	self ).
    
    
    "updating"
    ^ updateUI = (
	theUI update.
	self ).
    
    ^ updateUIRect: rect = (
	theUI updateRect: rect.
	self ).
    
    
    "mouseButtonResponding"
    
    " By default, if the object doesn't handle a mouse event, "
    " let its container try and handle it"
    
    ^ leftButtonDown   = (container leftButtonDown).
    ^ leftButtonUp     = (container leftButtonUp ).
    
    ^ middleButtonDown = (container middleButtonDown).
    ^ middleButtonUp   = (container middleButtonUp).
    
    
    ^ rightButtonDown = (
	installMenu.
	menu displayAt: cursor location.
	menu followMenuCursorWhile: [cursor rightButtonDown].
	self).
    
    ^ rightButtonUp   = (container rightButtonUp).
|)


cecilUIBox _Define: ( |
    _ parent* = traits cecilUIBox.
    _ thisObjectPrints = true.
    
    ^ size <- 0@0.
    ^ location <- 0@0.
    ^ container.
    ^ components <- list copyRemoveAll.
| )
