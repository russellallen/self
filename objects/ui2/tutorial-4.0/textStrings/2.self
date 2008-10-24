2] Because the dollars slot was defined using the <- symbol, the value
of the slot can also be set. Delete the existing text in the evaluator
(click to type) and send the message
.
    dollars: 200.
.
The object jiggles slightly to indicate that it is itself the result of
this message.
.
Let's add a second slot. Select "Add Slot" from the middle button menu
on the top of the object, the type in and accept
.
    deposit: x = (dollars: dollars + x)
.
Try activating this slot. In the evaluator, enter
.
    deposit: 50.
.
(don't forget to delete existing text - an evaluator evaluates
everything in it, or whatever text is selected) and evaluate this
expression. The "deposit:" slot contains code, and code runs as though
it were typed into the evaluator. Let's look at this code in the
deposit: slot. Left-button click on the little box at the right end of
the "deposit:" slot to toggle a method editor.
.
The code contains 4 separate "words," and each corresponds to a message
send: "dollars:" sets the value of the dollars slot, "dollars" accesses
it, "+" sends a message to the dollar value, and "x" accesses the object
in the argument slot within the current method activation (the x slot
in the most recent activation held 50).
.
Self has no distinguished notion of a "variable," rather data or code
is stored in a slot, and a slot is accessed by sending a message.
.
Close the "deposit:" method editor (recall the open/close toggle is the
small button at the right end of the slot). Now try adding a "withdraw:"
slot...
.
    withdraw: x = (dollars: (0 max: dollars - x)).
.
...and test this slot out with the evaluator. ) 
Hit "Next step" to continue...
