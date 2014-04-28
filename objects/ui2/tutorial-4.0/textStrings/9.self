9] We need to indicate to the module system which slot (of the many
possible slots that may reference our bankAccount object) is the
"creator" of this object. The creator slot of an object serves as kind
of a distinguished home in which the object will reside after its
defining module is read in. Among other things, the creator slot is used
by the sytem to generate a helpful name, as we will see in a moment.
.
Go to the bankAccount slot in globals and select "make creator." This
marks our bankAccount object as being "created" by this slot.
.
After a few seconds, you will also notice that the name of our object
has changed from "anObject" to "bankAccount." The system uses the
creator slot information to infer names that will be helpful to the
programmer.
.
Let's make another slot called stockAccount to hold our stock-based account.
It will be a chance to review the procedure, the steps are...
  1. Add a slot named "stockAccount" to the "applications" category on
     globals. Define the slot so that it initially holds, say,
     an empty object: "stockAccount = ()."
  2. Install the stock-based account in the new slot by "grabbing" then
     dropping the little "=" button.
  3. Define the module of the new slot using the annotation panel.
  4. Select "make creator" on this slot.
.
At this point we could write out the accounts module, but there is
frequently an extra step taken by convention. Often the parent of a
globally reachable object like our bankAccount object is also stored in
a well-known slot. But not in globals -- by convention it is stored in
another object called "traits."
.
To add the traits slot, go to an evaluator on one of the account
objects and evaluate the message "lobby." In the lobby, you will find a
slot called "traits." Press the "=" button on the traits slot to look at
this object. You will find it has a categorization structure roughly
parallel to that of the globals object.  This traits object holds the
parents of many of the objects in globals.
.
Next step to continue...
