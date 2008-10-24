3] Let's make another account. Send the "copy" message using the evaluator.
This will cause an error: there is no copy slot.
.
The resulting Self debugger allows you to investigate the Self stack,
make changes, step, continue, and so on. For now just hit the abort
button.
.
Let's provide a copy slot by using inheritance. Again, select "Add Slot"
from the middle button menu on our object, and enter
.
    parent* = traits clonable
.
Now try sending "copy" again. You can check the slots in the result by
hitting the little black triangle to expand the representation.  Now
dismiss this copy by invoking the right button menu on the object -
"dismiss" is the bottom element in the menu.
.
The asterisk on the "parent" slot name indicates that, in doing method
lookup, the system can continue looking through objects in these marked
slots. Such marked slots are called "parent" slots, though they need not
have that particular name. In fact there can be many "parent" slots:
Self supports multiple inheritance.
.
Hit "Next step" to continue...
