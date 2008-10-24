"Sun-$Revision: 9.1 $"

"cecilUI"

"This is the top cecil user interface object"
"It knows about the uiController, which does most of the work,"
"and the window for the ui, and can respond to window events"


traits  cecilUserInterface _AddSlotsIfAbsent: ( | ^ cecilUI = () | )
globals cecilUserInterface _AddSlotsIfAbsent: ( | ^ cecilUI = () | )

traits cecilUI _Define: ( |
    _ parent* = traits clonable.
    
    "starting"
    ^ start = (
	(uiController = nil) ||	[uiController interpreter = nil] ifTrue: [
	    startOn: cecil_interpreter copy.
	] False: [
	    startOn: uiController interpreter.
	].
	self ).
    
    ^ startOn: interp = (
	setupWindow.
	uiController: cecilUIController.
	uiController initializeOn: interp.
	stopResponding: false.
	startHandlerProcess.
    ).
    
    _ setupWindow = (
	uiWindow: globals window copy.
	uiWindow displayName: preferences xDisplay.
	uiWindow name: 'Cecil'.
	uiWindow iconName: 'cecil ui'.
	uiWindow size: size.
	uiWindow useQueueingHandlerFor: self.
	uiWindow open.
	self ).
    
    
    "quitting"
    
    ^ quit = ( uiWindow handler queue: 'realQuit' 
	    With: vector copySize: 0.
	self ).
    
    realQuit = (stopResponding: true).
    
    
    "addingObjects"
    ^ add: objName = ( | box | "objName is a string"
	box: uiController addObjNamed: objName At: defaultLoc. 
	setNextDefaultLocAfter: box.
	self ).
    
    ^ addObj: obj = ( | box |
	box: uiController addObj: obj At: defaultLoc.
	setNextDefaultLocAfter: box.
	self).
    
    ^ setNextDefaultLocAfter: lastBox = ( | x. y. |
	x: defaultLoc x + lastBox size x + 5.
	y: defaultLoc y.
	(x > (size x - lastBox size x)) ifTrue: [
	    x: 0.
	    y: defaultLoc y + lastBox size y + 5.
	    (y > (size y - lastBox size y)) ifTrue: [y: 0].
	].
	defaultLoc: x@y.
	self ).
    
    
    "updating"
    
    "this assumes that the uiController's graphic is up-to-date"
    ^ update = (
	uiController graphic copyTo: uiWindow bitmap.
	uiWindow flush.
	self ).
    
    ^ updateRect: rect = (
	uiController graphic copy: rect To: uiWindow bitmap At: rect origin.
	uiWindow flush.
	self ).
    
    "eventHandling"
    
    " make a process to handle events, and set it running"
    " this process will send the run message to the ui (self)"
    _ startHandlerProcess = (
	(process copySend: message copy 
		receiver: self Selector: 'run') resume
    ).
    
    "_" run = (
	uiProcess: process this.
	startResponding.
	endResponding.
	self ).
    
    "keep handling window events until stopResponding is true"
    _ startResponding = (
	[ stopResponding ] whileFalse: [uiWindow handler next ].
	self ).
    
    _ endResponding = (
	uiWindow closeAsync.
	self ).
    
    
    "windowEvents"
    "all of these get sent by the window's event handler"
    
    "Need to inherit event handling behavior"
    _ event_parent* = traits queueingEventHandler nullTarget.
    
    "Need to resize the uiController's bitmap as well as the window"
    "Since resizing a bitmap causes it to lose all pixel info,"
    "I need to copy the window's bitmap to the uiController's"
    "at the end"
    ^ windowChanged: rect Event: event = (
	event delete.
	uiWindow position: rect topLeft.
	uiWindow size: rect size.
	size: rect size.
	uiWindow bitmap fillRectangle: (0@0) ## (size - (1@1))
	    Color: cecilUIColors windowBackground.
	uiController graphic copyTo: uiWindow bitmap.
	uiWindow flush.
	uiController resize: rect size.
	uiWindow bitmap copyTo: uiController graphic.
	self ).
    
    ^ windowExposed: rect Last: last Event: event = (
	event delete.
	last ifTrue: [update].
	self ).
    
    "Send the event on down to the right place"
    ^ leftButtonDownAt: pos Event: event = (
	updateCursorAndDeleteEvent: event.
	uiController leftButtonDownAt: pos.
	self  ).
    
    ^ leftButtonUpAt: pos Event: event = (
	updateCursorAndDeleteEvent: event.
	self  ).
    
    ^ middleButtonDownAt: pos Event: event = (
	updateCursorAndDeleteEvent: event.
	self).
    
    ^ middleButtonUpAt: pos Event: event = (
	updateCursorAndDeleteEvent: event.
	self ).
    
    ^ rightButtonDownAt: pos Event: event = (
	updateCursorAndDeleteEvent: event.
	uiController rightButtonDownAt: pos.
	self ).
    
    ^ rightButtonUpAt: pos Event: event = (
	updateCursorAndDeleteEvent: event.
	self ).
    
    ^ keyDown: keycode At: pos Event: event = (
	updateCursorAndDeleteEvent: event.
	self).
    
    ^ windowQuit: win Event: event = ( 
	updateCursorAndDeleteEvent: event.
	quit ).
    
    ^ updateCursorAndDeleteEvent: event = (
	uiWindow updateCursor: event.
	event delete.
	self ).
    
    ^ printString = 'cecil UI'.
| )


cecilUI _Define: ( |
    _ parent* = traits cecilUI.
    
    ^ uiController.  "this object keeps track of everything in the ui"
    ^ uiWindow.
    ^ size <- 900@700.
    ^ defaultLoc <- 0@0.
    
    " need a process to handle events in the ui window"
    _ uiProcess <- ( | isActive = false | ).
    _ stopResponding <- false.
| )
