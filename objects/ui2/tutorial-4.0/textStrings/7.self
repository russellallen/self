7] To make an object widely available from most of the system, we simply
store it in a well-known slot. By "well-known slot," we simply mean a
slot in an object that is inherited by most other Self objects.  The
objects with well-known slots thus are near the top of the inheritance
hierarchy.
.
In the object "traits clonable" (the grandparent of the account objects)
you will find a slot called "parent" which contains an object called
"lobby." The lobby is inherited by nearly all objects in Self. It is an
inheritance ancestor of numbers, lists, windows, and so on. Yet, still more
parents are found in the lobby.
.
Get the lobby onto the screen (press the little "=" button at the right
of traits clonable's parent slot.) "Expand" the lobby to see its slots.
The lobby has two parents itself: let's look at the one called
"globals." Get out the globals object by clicking on the "=" button at
the right of the globals slot.
.
Spend a moment to clean up: you can "dismiss" the lobby and
traits clonable from the screen: select "dismiss" from the right button
menu while pointing to each of these objects.
.
Let's turn our attention to the "globals" object. By convention, globals
is where widely used objects are stored. In globals you will find
everything from useful data structures (sequences, rectangles, graphical
objects) to entire applications (web browser). You might want to spend a
few minutes exploring this important object. Expand it, and expand its
categories to see what kinds of objects are stored in its slots.
.
When you are ready to continue, close all of the global's categories
except for the one called applications. We are going to store our new
accounts there.
.
Hit "Next step" to continue...
