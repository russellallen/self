'Sun-$Revision: 30.1 $'


"First, let's define a new one-of-a-kind object, called oneOfAKindExample.
 Since it is a one-of-a-kind, we need to put it somewhere in the hierarchy
 above globals (an ancestor of the lobby), and the applications category of
 globals seems like the best place"

"Now, we could just add this object into the hierarchy:

      globals applications _AddSlots: ( | oneOfAKindExample = ( ... ) | )

 But if we did it that way, it would be hard to make changes and try their
 effects because the statement above would create a BRAND NEW 
 oneOfAKindExample object each time this file were read in. That means that
 old, unchanged versions of oneOfAKindExample could still be floating around
 in the system.

 Instead, we will create the object in two steps.
 First, let's create an object with the right name, but ONLY IF
 no such object exists already:"


globals _AddSlotsIfAbsent: ( | ^ applications* = () | )
globals applications _AddSlotsIfAbsent: ( | oneOfAKindExample = () | )



"(One peculiarity: the outermost expressions in a file or interactive input 
  cannot end with a period.)

 Now, let's fill it in with four things:
 a parent pointer to inherit default behavior for oddball objects,
 a constant slot containing pi,
 a method to printPi, and
 a variable called aVariable initialized to 17 
 (initializing variables is very Self-ish).

 We will do this with _Define, which will CHANGE THE OBJECT IN PLACE.
 That way, you could edit this file and read it in again, and
 all objects pointing to our example object would still feel
 your changes.

 Well, here goes:"

oneOfAKindExample _Define: ( |
    parent*   = traits oddball.
    pi        =  3.1416.
    printPi   =  (pi printLine).
    aVariable <- 17.		  
| )

"(By the way, since globals and globals applications are parent slots,
 we can just say oneOfAKindExample above).

 (Another peculiarity: The Self parser counts parentheses to know when
  the end of a line ends an expression. If we had written:

   oneOfAKindExample _Define:
     (| ... | )

 It would not have worked because the parser would have tried to evaluate
 the first line by itself).


 Now, we can try the new object:"

oneOfAKindExample printPi

"I hoped that worked.

 Now, maybe you would like something more exciting?
 How about a 3D point object? These will have to be clonable,
 so let's factor out the common traits from points themselves.
 This means we will need to add two objects to the system,
 one to hold the shared traits (called traits examplePoint)
 and another to hold the prototype (called examplePoint).

 First, create the traits object."

traits _AddSlotsIfAbsent: ( | ^ applications* = () | )

traits applications _AddSlotsIfAbsent: ( | examplePoint = () | )

"Now define its contents: inherit from traits clonable
 in order to obtain cloning behavior. Define copy in terms of clone.
 (Copy is the public interface, clone is a private low-level operation.)
 (The circumflex character denotes public, and the underbar denotes
 private.)"

traits examplePoint _Define: ( |
  _ parent* = traits clonable.

  ^ copy    = (clone).

  ^ printString = (
      '(',  x printString, ', ', 
            y printString, ', ',
            z printString, ')'   ).
| )

"Now create and initialize the prototype:"
"We'll put x y and z in a category called coordinates."
"We will also attach a comment to the z slot."

globals applications _AddSlotsIfAbsent: ( | examplePoint = () | )

examplePoint _Define: ( |
    _ parent* = traits examplePoint.
  { 'Category: coordinates'
     ^ x <- 0.     
     ^ y <- 0.     
    { 'Comment: This slot gives depth to this example'
     ^ z <- 0.    
    }
  }
| )


"That's it. Now let's try it:"

(((examplePoint copy x: 3) y: 5) z: 7) printString printLine


"Now, just for fun, let's split the methods in our traits object
 into different categories, copying and printing.
 We'll use annotations for the categories."


traits examplePoint _Define: ( |
  _ parent* = traits clonable.

    { 'Category: copying'
      ^ copy    = (clone).
    }
    { 'Category: printing'
      ^ printString = (
          '(',  x printString, ', ', 
                y printString, ', ',
                z printString, ')'   ).
    }
| )

"Just to be sure, let's try points one more time:"

(((examplePoint copy x: 2) y: 4) z: 'Self is polymorphic') printString printLine


"Finally, let's create a colored point, so the module can illustrate
copy-downs:"

mixins _AddSlotsIfAbsent: ( | ^ applications* = () | )

mixins applications _AddSlotsIfAbsent: ( | exampleStructuralMixin = () | )

mixins exampleStructuralMixin _Define: ( |
    ^ o_rama      = vector copySize: 234.
    ^ charm       <- 'I\'m sure'.
| )

globals applications _AddSlotsIfAbsent: ( | exampleColoredPoint = () | )

exampleColoredPoint _Define:  (
    ( examplePoint copy _AddSlots: mixins exampleStructuralMixin )
	_AddSlots: ( |
    ^ color       <- 'red'.
    ^ strangeness <- dictionary copyRemoveAll.
| ) )

globals applications _AddSlots: ( |
    anotherReference = exampleColoredPoint.
| )
 

"Enjoy!

   -- The Self Group"



"Here is the module information for this example:"

modules raw _AddSlots: ( | 
    example = ( |
      { 'Comment: needed so methods can run in me'
	parent* = lobby.  
      }
      { 'Comment: contains the revision string; will also appear as first line
	     of filed out file'
        revision = 'Sun-$Revision: 30.1 $'. 
      }
       directory = 'core'.
      { 'Comment: The comment method is a good place to put the comment that
	    used to be at the top of the file'
       comment = ( ''
"This file, example.self, is an example of a simple self program.
 You can copy and edit it to write your own self program.
 This paragraph is a comment (comments are enclosed in double-quotes).
 The first line of the file is also a comment, but its real
 purpose is to give RCS a place to put the file revision number.
 You do not need it for Self, it is just there for our own
 source control here in the Self project. --Dave Ungar 2/92"
	    ).
        }
      { 'Comment: Put a list of paths of slots to remove one per line
	    If the slot does not exist it is ok'

      }
      { 'Comment:  Any slots appearing in collectionsToEmpty which are
	     contained within the module will not be filed out accurately,
	     instead, they will be sent "copyRemoveAll" and the result
	     will be filed out'

	collectionsToEmpty = '
	     globals applications exampleColoredPoint strangeness
	 '.
      }
      { 'Comment:  Any slots appearing in vectorsToNotInitialize which are
	     contained within the module will not be filed out accurately,
	     instead, they will be written without initializing their indexable
	     parts'

	vectorsToNotInitialize = '
	     globals applications exampleColoredPoint o_rama
	 '.
      }
      { 'Comment: if this file contains any _RunScripts, put the names of the
	     modules in this slot, one per line'

	subparts = '
	 '.
      }
      { 'Comment: slot paths in here would cause the output file to
	     contain AddSlotsIfAbsent to create empty name spaces if need be'
	     
	nameSpaces = '
	 '.
      }
      { 'Comment: this is a list of slots whose contents are created by this module'

	contents = '
	 globals applications  oneOfAKindExample
	 
	 traits  applications examplePoint
	 globals applications examplePoint
	 mixins  applications exampleStructuralMixin
	 '.
       }
      { 'Comment: put slots in here that just refer to their contents'

	references = '
	     globals applications anotherReference
	 '.
       }
       { 'Comment: copyDowns contains one slot for each copied-down prototype in
	     the module. Each slot contains an object with three slots:
		from -- the objects to copy (1 per line) (handles > 1)
		to   -- the destination of the copy (the object to define)
		slotsToAdd -- the simple names of the slots added to the copy

	     If you have a a second copied-object that relies on the first,
	     be sure the slot name for it below is alphabetically after
	     the slot name for the first one; that way they will be
	     created in the right order'

	 copyDowns = ( |
	     slot_0 = ( |
	         from = '
		     globals applications examplePoint
		     mixins  application  exampleStructuralMixin'.
	         to   = 'globals applications exampleColoredPoint'.
                 slotsToAdd = 'color strangeness charm o_rama'.
		 copyMessage = 'copy'. "may be ommitted to default to copy"
	     | ).
	  | ).
	}
        { 'Comment: postFileIn will be run after this file is read in'

  	  postFileIn = (oneOfAKindExample printPi).
	}
    | ).
| )

modules raw example postFileIn
