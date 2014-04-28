5] We want our new empty object to inherit from traits clonable. There
already is such a slot in our bank account. Let's copy that slot into
our empty object.
.
Go to the parent slot of the bank account object, and select "copy" from
the middle button menu. Carry the resulting slot over to the empty
object and drop it in.
.
We want the bank account to inherit through our new object rather than
directly from traits clonable.  There is a little  button at the right
end of the bank account's parent slot. It contains an "=" label
(indicating it is not an assignable slot). There is a middle button pop
up menu on this little button. To set the parent of our bank account,
select "Grab pointer" from the middle button pop up menu on this little
button.
.
You should find yourself holding the little button. Drop the button on
our new object. It is now the parent of our bank account. To retract the
pointer, invoke the middle button pop up on the tiny button you just
dropped, and select "Retract." You can also left button click on the
other end of the line coming out of the slot.
.
A parent provides shared state and behavior for its children. Let's move
the "deposit:" and "withdraw:" slots from the original bank account into the
parent. That way, when we change these methods all bank accounts will
inherit the change. Go to the "deposit:" slot and select "move" from its
middle button pop up menu. Drop the slot on the parent.
.
Sometimes when making a programming change, a warning dialogue will pop
up notifying you that the system is waiting for another programming
change to finish. You can normally "wait out" this particular kind of
warning, they tend to go away once the system gets through its queue of
tasks.
.
Also move the "withdraw:" slot into the parent.
.
Now send "copy" to the bank account: the resulting object has its own
"dollars" slot, but shares methods for deposit and withdrawal with the
original account.
.
You might verify this by depositing some money in one account and not
the other....When ready, go to the next step...
