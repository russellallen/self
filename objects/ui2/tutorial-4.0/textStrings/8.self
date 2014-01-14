8] In the globals object, point to the category named "applications,"
and, from the middle button menu, select "Add Slot." Type in
    bankAccount = ().
and hit the green button (the system can take a while to respond to this
change.) The (), an empty object, is just a place holder for now.
.
We need to install our bank account object in this slot: point to the
little "=" button at the right of this slot, and from the middle button
menu select "Grab pointer." Drop the button on the bank account object
(the one that stores values in the single "dollars" slot). Once the
change takes effect, most objects in the system can access this object
by sending themselves the message "bankAccount."
.
Let's establish a new module for saving our objects to a file, so they
can be imported to other snapshots. On the middle button menu of the
bankAccount slot, select "show annotation." The resulting panel shows a
blank Module field. Enter "accounts" as the module name, and hit the
green button to accept. As this is a new module, the system will ask you
a number of questions. First, confirm creation of a new module, then
specify that this is not to be a submodule of another module. (Leave the
reply field blank to indicate that we don't want "accounts" to be a
submodule of any module).  This surprises the system as indicated in the
next dialogue, but insist by selecting "No module." Finally, just say
"okay" to the suggested file directory.
.
We've now established a new module in the system, and indicated that one
slot, bankAccount, belongs to that module.
.
Next go to the object in the bankAccount slot and select "Set module..."
from the middle button menu at the top of the object. Select "All"
slots, and select "other" from the suggested module list (the entry "-"
indicates "no module"). Type in "accounts" as the name of the module.
Now all the slots in this object are in the accounts module.
.
Do the same thing for the parent of the accounts (with the deposit: and
withdraw slots) and for the stock-based account object, so that we end
up with three objects in our module.
.
Hit "Next step" to continue...
