"Sun-$Revision: 9.1 $"

"cecilArrow"

"This object is a graphical arrow for showing relationships between
 boxes in the ui.  Because arrows must be erased and redrawn often, we
 do not want to use movingBitmaps for them; since bitmaps are
 rectangular, an arrow's bitmap coule potentially be very large, and
 each time an arrow moves a save-under must be done, and the arrow's
 bitmap must be copied onto the ui bitmap."

"Instead, we use the colormap in order to get quick erasing /
 redrawing.  The idea works as follows.  Suppose that all arrows will
 be one color.  Every pixel on the screen has an eight-bit value which
 is an index into the colormap - the entry at that index in the
 colormap is the color of the pixel.  We will use the highest bit of
 those eight to determine whether or not the pixel is part of an
 arrow.  If that bit is a 1, then the pixel will have the arrow color;
 if the bit is a 0, that pixel will have another color.  If we fill
 the colormap normally for the first half (0-127), and then fill all
 entries in the second half with the arrow color, then it is very easy
 to draw an arrow - just flip the top bit of all the pixels in the arrow
 to 1, and then when the arrow is erased, flip the top bit back to 0, and 
 the original color is restored.  We use Xor to accomplish this.
 Note that arrow intersections will then be transparent."

"In the ui, we have 3 colors for arrows - 1 for parents, 1 for methods,
 and 1 for fields.  Thus I need to use the top 2 bits of the 8, and
 I use the same xoring method"


traits  cecilUserInterface _AddSlotsIfAbsent: ( | ^ cecilArrow = () | )
globals cecilUserInterface _AddSlotsIfAbsent: ( | ^ cecilArrow = () | )

traits cecilArrow _Define: ( |
    _ parent* = traits clonable.
    _ identity* = mixins identity.
    
    "commonly accessed objects"
    
    _ uiController = (cecilUI uiController).
    _ uiWindow = (cecilUI uiWindow).
    _ graphic = (uiController graphic).
    
    "creating"
    
    ^ createFrom: box1 WithTail: tailPt To: box2 = ( | newArrow |
	newArrow: copy.
	((newArrow fromBox: box1) toBox: box2) tail: tailPt.
	newArrow setHead.
	newArrow tailOffset: tailPt - box1 location.
	newArrow).
    
    "testing"
    
    ^ isArrow = true.
    
    ^ isBox = false.
    
    "identity"
    
    "2 arrows are the same if they have the same fromBox,
     toBox, and tailOffset"
    
    ^ isSameAs: arr = (
	(toBox = arr toBox) &&
	    [(fromBox = arr fromBox) &&
		[tailOffset = arr tailOffset]].
    ).
    
    "drawing" 
    
    "Set the plane mask so that only the 1 or 2 bits I want"
    "are affected by the xor, then draw an xor line and arrowhead"
    ^ drawArrow = ( | ah. ahStart. |
	ah: arrowhead.
	ahStart: (ah at: 1) asFloat mean: (ah at: 2) asFloat.
	graphic planeMask: myPlaneMask.
	graphic xorFillPolygon: ah Color: myColor.
	graphic xorLine: tail
	    To: ahStart 
	    Width: arrowWidth
	    Color: myColor.
	graphic useAllBitplanes.
	self ).
    
    ^ eraseArrow = (
	drawArrow.  "just to make code more understandable"
	self ).
    
    ^ removeArrow = (
	fromBox isIconBox ifTrue: [
	    fromBox fullBox eraseTailAt: tailOffset.
	] False: [
	    fromBox eraseTailAt: tailOffset.
	    fromBox redisplayWithUpdate.
	].
	eraseArrow.
	self ).
    
    ^ offsetForLine = (halfArrowWidth @ halfArrowWidth).
    
    ^ halfArrowWidth = ( arrowWidth asFloat /= 2.0 ).
    
    ^ arrowHeadLength = 15.
    
    "moving"
    
    ^ setHead = ( | toRect |
	toRect: toBox location ## toBox size.
	head: toRect pointClosestToPoint: tail.
	self ).
    
    ^ setHeadAndTail: possibleTail = ( 
	fromBox isIconBox ifTrue: [
	    setHeadAndTail.
	] False: [
	    setTail: possibleTail.	
	].
	self ).
    
    ^ setHeadAndTail = ( | fromRect. toRect. |
	toRect: toBox location ## toBox size.
	fromRect: fromBox location ## fromBox size.
	tail: fromRect pointClosestToRectangle: toRect.
	head: toRect pointClosestToPoint: tail.
	self ).
    
    
    ^ setTail: newTail = (
	tail: newTail.
	setHead.
	self ).
    
    
    "arrowheads"
    
    "Retrieves the arrowhead for this arrow from the arrowhead cache"
    ^ arrowhead = ( | ah. v. |
	ah: arrowheads retrieveDx: head x - tail x
	    Dy: head y - tail y.
	v: vector copySize: 3.
	v at: 0 Put: (ah at: 0) + head.
	v at: 1 Put: (ah at: 1) + head.
	v at: 2 Put: (ah at: 2) + head.
	v).
    
    ^ arrowheads <- nil.
    
    ^ printString = 'cecilArrow'.
    
|)


cecilArrow _Define: ( |
    _ parent* = traits cecilArrow.
    _ thisObjectPrints = true.
    
    ^ head <- point.
    ^ tail <- point.
    
    ^ fromBox.
    ^ toBox.
    
    ^ tailOffset. "offset from the origin of the fromBox"
| )
