4] Let's look at "traits clonable," referenced by our recently added parent
slot.  You can send the message "parent" using the evaluator, but there
is an interface shortcut to directly inspect the slot contents: hit the
little button at the right end of the parent slot. You end up holding
the object referenced by that slot. Expand this "traits clonable" object
using the little black triangle.
.
This object has four parent slots, so method lookup can continue on to
objects in each of these slots. You will find "copy" in the object
referenced by the "cloning" slot.
.
You can look at the code inside "copy" (it sends just one message), and
can examine the comment on the object containing the copy slot ("mixins
clonable"). To toggle the comment editor, left click on the very tiny
button at the upper left of the object. Many slots have tiny comment
buttons like this as well.
.
Let's interpose a new parent between our bank account object and traits
clonable. This parent will be a useful place to store shared state and
behavior needed by all bank accounts.
.
Start by making an empty object. In any evaluator, type () and
evaluate. This is Self syntax for an empty object. We want this object
to be the parent of our account, and we want this object to have traits
clonable as its own parent.
.
We will accomplish this in the next step...
