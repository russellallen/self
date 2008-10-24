"For the Smalltalk screen, make the browser, transcript, and workspace. Type 'OrderedCollection new' into the workspace and highlight it."
(|
p* = lobby.
doit = (
| h. b. w. t |
h: process this birthEvent sourceHand.

b: smalltalkEmulator browser copy.
b updateCategoryPane.
b position: 315 @ -725.
h world addMorph: b.

w: smalltalkEmulator workspace copy.
w position: 25 @ -350.
h world addMorph: w.
w morphs last setText: 'OrderedCollection new'.
w morphs last text selectAll.

t: smalltalkEmulator transcript.
t position: 10 @ -725.
t morphs last setWidth: 275 Height: 325.
h world addMorph: t.

self
) | ) doit.


"For the Final Challenge, get a shell and type 'traits gasTank' into it."
(|
p* = lobby.
doit = (
| e. h. o |
e: process this birthEvent.
h: e sourceHand.
o: h world outlinerForMirror: reflect: shell copy.
o position: 3325 @ 850.
h world addMorph: o.
(o model addEvaluator: e) setText: 'traits gasTank'.
self
) | ) doit.


"For the DirectConstruction2 screen, get a Properties guy for the green guy in the top left and for the blue guy in the bottom right. Also point a core sampler at the bottom-right green guy."
(|
p* = lobby.
doit = (
| e. h. p1. p2 |
e: process this birthEvent.
h: e sourceHand.

"I'm not sure how to get references to theTopLeftGreenGuy and theBottomRightBlueGuy
 and theBottomRightGreenGuy. -- Adam, 1/08

p1: propertiesSheetMorph copyTarget: theTopLeftGreenGuy.
p1 position: 1242 @ 1503.
h world addMorph: p1.

p2: propertiesSheetMorph copyTarget: theBottomRightBlueGuy.
p2 position: 1669 @ 1673.
h world addMorph: p2.

theBottomRightGreenGuy coreSamplerButton: button Event: e.
"

self
) | ) doit.


"Make the menus on the mouse screen."
(|
p* = lobby.
doit = (
| e. h. w. editor. m1. m2. m3 |
e: process this birthEvent.
h: e sourceHand.
w: h world.

w backgroundMenu ifNil: [w backgroundMenu: w buildBackgroundMenu].
m1: w backgroundMenu copy retargetButtonsTo: w.
m1 popUp: e.
m1 globalPosition: 1460 @ 75.
m1 changed.
m1 isTornOff: true.
m1 tearOffButton delete.
h unsubscribeCursor: m1.

editor: ((w outlinerForMirror: reflect: shell copy) model addEvaluator: e) setText: 'something'.
editor text selectAll.
m2: editor text buildSelfMenu.
m2 popUp: e.
m2 globalPosition: 1640 @ 35.
m2 changed.
m2 isTornOff: true.
m2 tearOffButton delete.
h unsubscribeCursor: m2.

m3: morph copy selfMenu.
m3 popUp: e.
m3 globalPosition: 1600 @ 475.
m3 changed.
m3 isTornOff: true.
m3 tearOffButton delete.
h unsubscribeCursor: m3.

self
) | ) doit.


"For the factory-window thing:"
(|
p* = lobby.
doit = (
| e. h. w. m |
e: process this birthEvent.
h: e sourceHand.
w: h world.

w backgroundMenu ifNil: [w backgroundMenu: w buildBackgroundMenu].
m: w backgroundMenu copy retargetButtonsTo: w.
"A bit of a hack to find the right button. -- Adam, 1/08"
m buttons findFirst: [|:b| b script includesSubstring: 'factoryMorph']
          IfPresent: [|:b| w addMorph: b.
                           b globalPosition: 2217 @ 682.
                           w moveToFront: b.
                           b changeDepressedState].

self
) | ) doit.
