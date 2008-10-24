1] In this simple example, you will learn the basics of the Self object
model, how message sending and inheritance work, and how the Self module
system can let you save your changes.
.
We will be making an object that represents a bank account.  We start
with an "empty object" that contains no state or behavior. There is an
empty object on the screen there to the left, the one labeled "a slots object."
.
In Self, an object stores state and behavior in "slots." A slot has a
name, and a reference to some object - the object may or may not have
code (i.e.: it may be a method). Let's begin by adding a slot named
"dollars" to this empty object. The dollars slot will store the account
value.
.
Go to the object, invoke the middle button menu, and select "Add Slot".
The text in the resulting text field gives examples of slot definition
syntax. The text is pre-selected, so you will replace it the moment you
type.  Type in
.
    dollars <- 100
.
and hit the upper (green) button to accept the change.
.
Let's send our object a message: from the row of small buttons at the top
right of our object, select "E" for evaluator. In the resulting text area,
type in
.
    dollars
.
and hit the "Get it" button.
.
You end up holding the object 100, because that is the result of the
message send. Sending a message to a slot holding a non-method object
simply returns the object stored in that slot.
.
Click anywhere to drop 100 out of the way. The right button menu on the
100 object includes a "dismiss" item: use this to remove it from the 
screen.
.
Click the "Next step" button to go on...
