10] Let's add our bankAccount parent to traits. Add a slot in the
applications category, naming it "bankAccount" and put the bankAccount
parent in this slot.  Also set the module of the slot to "accounts," and
make this slot the creator of its object.
.
We emphasize that this is an optional step, and in fact some of the more
recent parts of the system are written without the extra slot in
traits.  After all, the slot (or even the traits object itself) really
isn't needed, you can always directly get at the parents of objects
stored in globals. For example, the parent of the stockAccount object
can be accessed by saying "stockAccount parent."
.
Back to the "accounts" module: let's save our module to a file.
.
On the background middle button menu, select "Changed Modules," and drop
the resulting object anywhere it is convenient. In a moment the object
will expand to reveal an item named "accounts" representing your new
module.
.
The small "w" button on the right is for writing out the module. There
is a middle button menu on the module name that will let you perform
other operations and browse the changes associated with the module.
Press the little "w" button to write out the module.
.
If you ever want to read in the module, go to an evaluator (on the lobby,
say) and evaluate the expression
.
  bootstrap read: 'accounts' From: 'applications'
.
Congratulations! You've finished with this example, and should understand
some important ideas about Self objects and how to work with slots and
the module system.
.
You can read more about the module system in the manual "How to Program
Self 4.0" There also is a step by step example of how to make a new
graphical object in the user interface framework manual. Finally, there
is an animated example based on an ideal gas simulation in this tutorial
on the screen directly below this one. (3 clicks of the radar view
navigation buttons going downward.)
.
Thanks for your patience!
