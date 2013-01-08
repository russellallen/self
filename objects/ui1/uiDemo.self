 'Sun-$Revision: 30.8 $'
 '
Copyright 1992-2012 AUTHORS.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: uiDemo InitialContents: FollowSlot'
        
         uiDemo = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'uiDemo' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'comment' From:
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'uiDemo' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules uiDemo.

CopyDowns:
globals modules init. copy 
SlotsToOmit: comment directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'uiDemo' -> () From: ( | {
         'ModuleInfo: Module: uiDemo InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'ui1'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'uiDemo' -> () From: ( | {
         'ModuleInfo: Module: uiDemo InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'uiDemo' -> () From: ( | {
         'ModuleInfo: Module: uiDemo InitialContents: FollowSlot'
        
         myComment <- 'no comment'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'uiDemo' -> () From: ( | {
         'ModuleInfo: Module: uiDemo InitialContents: FollowSlot'
        
         postFileIn = ( |
            | 
            uiDemo initializeStrings.
            uiDemo initializeTextPositions.
            snapshotAction addPostReadMessage:
                message copy receiver: uiDemo Selector: 
                'flushEditors'.
            resend.postFileIn).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'uiDemo' -> () From: ( | {
         'ModuleInfo: Module: uiDemo InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- 'Sun-$Revision: 30.8 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'uiDemo' -> () From: ( | {
         'ModuleInfo: Module: uiDemo InitialContents: FollowSlot\x7fVisibility: public'
        
         subpartNames <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: applications\x7fModuleInfo: Module: uiDemo InitialContents: FollowSlot'
        
         uiDemo = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'uiDemo' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals uiDemo.
\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'uiDemo' -> () From: ( | {
         'ModuleInfo: Module: uiDemo InitialContents: FollowSlot'
        
         acceptStep: n = ( | {
                 'ModuleInfo: Module: uiDemo InitialContents: FollowSlot'
                
                 newS.
                }  {
                 'ModuleInfo: Module: uiDemo InitialContents: FollowSlot'
                
                 oldP.
                }  {
                 'ModuleInfo: Module: uiDemo InitialContents: FollowSlot'
                
                 oldS.
                } 
            | 
            oldS: strings at: n-1.
            newS: (textEditors at: n-1) methodView contentsString.
            oldP: (textPositions at: oldS).
            textPositions removeKey: oldS.
            textPositions at: newS Put: oldP.
            strings: (strings asVector  at: n - 1 Put: newS ) asList.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'uiDemo' -> () From: ( | {
         'ModuleInfo: Module: uiDemo InitialContents: FollowSlot'
        
         account1 = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'uiDemo' -> 'account1' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals uiDemo account1.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'uiDemo' -> 'account1' -> () From: ( | {
         'ModuleInfo: Module: uiDemo InitialContents: FollowSlot'
        
         dollars <- 100.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'uiDemo' -> 'account1' -> () From: ( | {
         'ModuleInfo: Module: uiDemo InitialContents: FollowSlot'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'uiDemo' -> 'account1' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals uiDemo account1 parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'uiDemo' -> 'account1' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: uiDemo InitialContents: FollowSlot'
        
         deposit: amt = ( |
            | dollars: dollars + amt).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'uiDemo' -> 'account1' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: uiDemo InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'clonable' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'uiDemo' -> 'account1' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: uiDemo InitialContents: FollowSlot'
        
         withdraw: amt = ( |
            | deposit: amt negate).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'uiDemo' -> () From: ( | {
         'ModuleInfo: Module: uiDemo InitialContents: FollowSlot'
        
         account2 = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'uiDemo' -> 'account2' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals uiDemo account2.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'uiDemo' -> 'account2' -> () From: ( | {
         'ModuleInfo: Module: uiDemo InitialContents: FollowSlot'
        
         dollars <- 100.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'uiDemo' -> 'account2' -> () From: ( | {
         'ModuleInfo: Module: uiDemo InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'globals' -> 'uiDemo' -> 'account1' -> 'parent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'uiDemo' -> () From: ( | {
         'ModuleInfo: Module: uiDemo InitialContents: FollowSlot\x7fVisibility: private'
        
         applyCommand = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'uiDemo' -> 'applyCommand' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals uiDemo applyCommand.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'uiDemo' -> 'applyCommand' -> () From: ( | {
         'ModuleInfo: Module: uiDemo InitialContents: FollowSlot'
        
         demo.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'uiDemo' -> 'applyCommand' -> () From: ( | {
         'ModuleInfo: Module: uiDemo InitialContents: FollowSlot'
        
         doIt: ctx = ( |
            | demo nextStepFromIndex: ctx container index).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'uiDemo' -> 'applyCommand' -> () From: ( | {
         'ModuleInfo: Module: uiDemo InitialContents: FollowSlot'
        
         doIt: ctx Shift: bool = ( |
            | doIt: ctx).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'uiDemo' -> 'applyCommand' -> () From: ( | {
         'ModuleInfo: Module: uiDemo InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'clonable' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'uiDemo' -> () From: ( | {
         'ModuleInfo: Module: uiDemo InitialContents: FollowSlot\x7fVisibility: private'
        
         cancelCommand = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'uiDemo' -> 'cancelCommand' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals uiDemo cancelCommand.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'uiDemo' -> 'cancelCommand' -> () From: ( | {
         'ModuleInfo: Module: uiDemo InitialContents: FollowSlot'
        
         demo.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'uiDemo' -> 'cancelCommand' -> () From: ( | {
         'ModuleInfo: Module: uiDemo InitialContents: FollowSlot'
        
         doIt: ctx = ( |
            | demo prevStepFromIndex: ctx container index).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'uiDemo' -> 'cancelCommand' -> () From: ( | {
         'ModuleInfo: Module: uiDemo InitialContents: FollowSlot'
        
         doIt: ctx Shift: bool = ( |
            | doIt: ctx).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'uiDemo' -> 'cancelCommand' -> () From: ( | {
         'ModuleInfo: Module: uiDemo InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'clonable' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'uiDemo' -> () From: ( | {
         'ModuleInfo: Module: uiDemo InitialContents: FollowSlot'
        
         exampleObject = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'uiDemo' -> 'exampleObject' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals uiDemo exampleObject.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'uiDemo' -> 'exampleObject' -> () From: ( | {
         'ModuleInfo: Module: uiDemo InitialContents: FollowSlot'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'uiDemo' -> 'exampleObject' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals uiDemo exampleObject parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'uiDemo' -> 'exampleObject' -> () From: ( | {
         'ModuleInfo: Module: uiDemo InitialContents: FollowSlot'
        
         slotA = 'a string'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'uiDemo' -> 'exampleObject' -> () From: ( | {
         'ModuleInfo: Module: uiDemo InitialContents: FollowSlot'
        
         slotB = 43.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'uiDemo' -> 'exampleObject' -> () From: ( | {
         'ModuleInfo: Module: uiDemo InitialContents: FollowSlot'
        
         slotC = ( |
            | 2 * slotB).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'uiDemo' -> () From: ( | {
         'ModuleInfo: Module: uiDemo InitialContents: FollowSlot'
        
         flushEditors = ( |
            | 
            textEditors: vector copySize: textEditors size FillingWith: nil).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'uiDemo' -> () From: ( | {
         'ModuleInfo: Module: uiDemo InitialContents: FollowSlot\x7fVisibility: private'
        
         initializeStrings = ( |
            | 
            strings: (uiDemo s1 & uiDemo s2 & uiDemo s3 & uiDemo s4 & uiDemo s5 & uiDemo s6 & uiDemo s7 & uiDemo s8) asList.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'uiDemo' -> () From: ( | {
         'ModuleInfo: Module: uiDemo InitialContents: FollowSlot\x7fVisibility: private'
        
         initializeTextPositions = ( |
            | 
            textPositions removeAll.
            strings asVector do: [|:s. :i| textPositions at: s Put: (554 @ 55) + ((20 @ -10) * i)].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'uiDemo' -> () From: ( | {
         'ModuleInfo: Module: uiDemo InitialContents: FollowSlot'
        
         makeAndSproutIndex: i = ( |
            | 
            makeTextEditorIndex: i.
            textEditors at: i).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'uiDemo' -> () From: ( | {
         'ModuleInfo: Module: uiDemo InitialContents: FollowSlot'
        
         makeTextEditorIndex: i = ( |
             dx <- 5.
             s.
             t.
             te.
            | 

            s:  strings at: i.
            te: demoEditor copyOn: ui world
                    Size: ( 517 + ((strings size - 1 - i)*dx) )@ (668 )
                      Do: [ | :e | 
                         e applyButtonName: 'next'.
                         e dismissButtonName: 'previous'.
                         e name: 'Step ', ( i + 1)  printString.
                         e index: i ].
            textEditors at: i Put: te.
            te methodView setText: s.
            te applyButton  command: (  applyCommand copy demo: self ).
            te cancelButton command: ( cancelCommand copy demo: self ). 
            te location: (textPositions at: s).
            textEditors at: i Put: te.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'uiDemo' -> () From: ( | {
         'ModuleInfo: Module: uiDemo InitialContents: FollowSlot'
        
         makeTextEditors = ( |
            | 
            textEditors: vector copySize: strings size. 
            strings size   do: [ | :i |
                makeTextEditorIndex: i.
             ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'uiDemo' -> () From: ( | {
         'ModuleInfo: Module: uiDemo InitialContents: FollowSlot'
        
         nextStep = ( |
            | "ui send: 'lowerBody:' To: ui world  Args: ((vector copySize: 1) at: 0 Put: topTextEditor).
            ui send: 'display' To: ui world" topTextEditor banish).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'uiDemo' -> () From: ( | {
         'ModuleInfo: Module: uiDemo InitialContents: FollowSlot'
        
         nextStepFromIndex: i = ( |
             nextI.
            | 
            nextI: ((0 max: (i + 1)) min: textEditors size - 1).
            (textEditors at: i) banish.
            textEditors at: i Put: nil.
            i = nextI ifTrue: [ ^ self ].
            (textEditors at: nextI) ifNil: [
                makeTextEditorIndex: nextI.
                ui world addBodyOnTop: (textEditors at: nextI).
                (textEditors at: nextI) swoopDown.
            ].
            (textEditors at: nextI) raise.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'uiDemo' -> () From: ( | {
         'ModuleInfo: Module: uiDemo InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'oddball' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'uiDemo' -> () From: ( | {
         'ModuleInfo: Module: uiDemo InitialContents: FollowSlot'
        
         placeExamples = ( | {
                 'ModuleInfo: Module: uiDemo InitialContents: FollowSlot'
                
                 pt.
                } 
            | 
            ui add: uiDemo account1      At: 28@380.
            ui add: uiDemo account2      At: 28@586.
            ui add: uiDemo exampleObject At: 243@242.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'uiDemo' -> () From: ( | {
         'ModuleInfo: Module: uiDemo InitialContents: FollowSlot'
        
         placeStrings = ( |
            | 
            textEditors reverseDo: [ | :te | 
                   ui world addBodyOnTop: te.
                   te swoopDown.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'uiDemo' -> () From: ( | {
         'ModuleInfo: Module: uiDemo InitialContents: FollowSlot'
        
         prevStepFromIndex: i = ( |
             prevI.
            | 
            prevI: ((0 max: (i - 1)) min: textEditors size - 1).
            (textEditors at: prevI) ifNil: [
                makeTextEditorIndex: prevI.
                ui world addBodyOnTop: (textEditors at: prevI).
                (textEditors at: prevI) swoopDown.
            ] IfNotNil: [
                (textEditors at: prevI) raise.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'uiDemo' -> () From: ( | {
         'ModuleInfo: Module: uiDemo InitialContents: FollowSlot'
        
         s1 = 'WELCOME...
 
  
 
 
 
...to the experimental Self user interface.  (This interface is an
experiment in a way to represent Self objects, not a general purpose
interface.  Nevertheless, it is a good way to learn about Self, and will
let you see and directly modify Self objects.)
 
 
Follow the instructions on this box for a brief demo/tutorial.
 
 
STEP 1: Objects, manipulation, and menu buttons.
 
You only need the LEFT MOUSE BUTTON for this tutorial.
The left mouse button is used to activate buttons and to grab objects.
Try grabbing and moving the \"uiDemo exampleObject\" (at the left).
 
Let\'s examine the uiDemo exampleObject to the left.  This represents a Self
object.  A Self object is a collection of \"slots.\"  Each slot has a name, and
each slot contains some object.
 
The exampleObject\'s slotA contains a character string object. In
in slotB there is a number object.  SlotC contains some Self code.  
  
The object name (such as \"uiDemo exampleObject\") is not an intrinsic
part of the Self object. (It\'s a kind of path name that the interface
prints for convenience.)
 
The little inset rectangles along the left of each object are
\"menu buttons\" -- a menu button pops up a menu.  We are done with     
the object called \"uiDemo exampleObject,\" so let\'s send it away.  Press and
hold the left mouse button on the upper left menu button of that object
and select \"dismiss.\"
 
To move on to step 2, get rid of this \"STEP 1\" box by pressing \"next\"
at the lower right.'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'uiDemo' -> () From: ( | {
         'ModuleInfo: Module: uiDemo InitialContents: FollowSlot'
        
         s2 = 'STEP 2: Sending messages with the evaluator window.
  
In Self, you can send an object a message that matches one of its slot names:
this will return the slot\'s contents, or, if the slot contains code, will
execute the code.
  
You can use an \"evaluator\" window to send messages to an object. Use the
upper left menu button on account1 to get an evaluator window. Point the
mouse button within the evaluator window and type \"dollars\". Send the
message by pressing the \"Eval\" button. You should get the object 100,
because the evaluator puts the result of the message on the screen (if it
is not already there.)
 
Now erase what you have typed in the evaluator and insert 
\"dollars: 120\". As a result of this message, the dollars slot contains 
120.  The colon at the end of the message name \"dollars:\" means that
this message takes an argument (120 in this case). If you look inside
the \"dollars:\" slot, you will see a strange marker \"<-\".  This means
that the argument will be assigned into the slot of the same name
without the colon - \"dollars\" in this case.
 
In other words, the \"<-\" marker in a slot named \"foo:\" means you can set the
contents of the \"foo\" slot to x by sending \"foo: x\".
 
You can use this interface to directly inspect the contents of slots
without sending messages. This is called \"sprouting\" a slots\'s
contents. You sprout a slot\'s contents by poking the round button at
the right end of the slot.  Go ahead and try it on account1\'s
\"dollars\" slot.
 
(Sprouting doesn\'t change the Self object, it just summons the slot
contents onto the screen, [unless it\'s already there].)
  
Feel free to experiment by sending \"dollars\", \"dollars: <some number>,\" 
and by sprouting slots.
 
Before proceeding, it\'s probably a good idea to tidy up the screen by
dismissing extraneous objects: you only need the two account objects
and these text boxes to continue.
   
Press the \"next\" button to move on'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'uiDemo' -> () From: ( | {
         'ModuleInfo: Module: uiDemo InitialContents: FollowSlot'
        
         s3 = 'STEP 3: Adding slots.
 
Let\'s turn our attention to the account2 object.
 
Suppose we want account2 to be based on shares of stock instead of a   
stored amount of dollars.  Let\'s add some place for the value and
number of shares to be stored.
 
From the upper left menu button on account2, select \"add slot...\".
 
Point the mouse in the window and type \"nShares <- 10\". (If you wish,
you can select the text in this editor and use the copy and paste keys on the 
keyboard.)   Note the uppercase \"S\" in the middle of this word.  In Self, 
capitalization matters.  Press the \"Apply\" button. (This actually adds two 
slots in one blow: an \"nShares\" slot and an \"nShares:\" slot for assigning to
nShares.)
 
A little error box may fly onto the screen if you\'ve made some sort of error.     
Of course, if there is no error box after pressing \"Accept,\"
you still might not have typed what you meant to type, so be reasonably 
careful!
 
In a similar way, add a slot called \"pricePerShare\" and give it a value of 32.
Again, check your spelling: you should type \"pricePerShare <- 32\" 
into the window for adding slots.
 
You have just added two new attributes to a Self object.
  
 
 
 
 
 
 
Press the \"next\" button to move on.'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'uiDemo' -> () From: ( | {
         'ModuleInfo: Module: uiDemo InitialContents: FollowSlot'
        
         s4 = 'STEP 4:
We are going to modify the stock account object (account2) so that adding 
more dollars affects the amount of stock. (The \"dollars:\" slot is currently 
used to assign a new value into the \"dollars\" slot.)  From the little square 
menu button on the left of the \"dollars:\" slot (the colon is important) 
select \"edit...\"  

Point the mouse cursor in the resulting window and change
        dollars: = <-
to
        dollars: amount = ( nShares: amount / pricePerShare )
(There is a resize corner at the bottom right with which you can stretch the
window for more space.)
 
This bit of Self code means \"to set the dollar value to \"amount\", set
the number of shares according to amount / pricePerShare.\"

Again, watch for details like the colon and capitalization, and hit \"Apply\"
when you\'re ready.
 
In a similar way, edit the \"dollars\" slot (the one without the colon).
Change it from
        dollars = 100
to 
        dollars = ( nShares * pricePerShare )
and press the \"Apply\" button.

 
 
 
 
 
 
 
 

Press the \"next\" button to move on.'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'uiDemo' -> () From: ( | {
         'ModuleInfo: Module: uiDemo InitialContents: FollowSlot'
        
         s5 = 'STEP 5: Inherited messages. 
 
Before sending more messages to your object, let\'s look at the parent
slots. Notice that each of the two accounts has a slot called \"parent*.\"
Let\'s examine the contents of these \"parent*\" slots . Recall, you can just 
press the round button in the slot to get the contents sprouted onto the screen. 
Sprout the \"parent*\" slot in each of the two accounts. Feel free to move 
this object to a convenient place.
  
Note that the account1 object shares its parent with account2.  The 
asterisk after the word \"parent\" means that the object inherits through     
that slot.
  
If we sent the message \"deposit: 32\" to the account1 object, the code
in the associated slot will run --look at the code and try to predict
what will happen to account1 if we were to send that message.
 
Now actually send \"deposit: 32\" to account1. (Recall you can use the
evaluator window to do this.) (The object wiggles because it is the
return value of this message.)
  
The code that ran (in the \"deposit:\" slot) was found in a parent of
account1, but the code actually executed in account1 itself. 
 
Now what would happen if we sent \"deposit: 32\" to account2 (the stock-
based account)? Make your prediction then try it out.
 
Notice that the same code works in each account, even though \"dollars\"
is stored in one case and computed in the other.
 
 
Press the \"next\" button to move on.'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'uiDemo' -> () From: ( | {
         'ModuleInfo: Module: uiDemo InitialContents: FollowSlot'
        
         s6 = 'STEP 6: Arrow dragging
 
Make a copy of the parent object by getting its evaluator window and
sending \"copy.\" (Optional puzzle - you might try to find where the
\"copy\" slot is:  off in some parent of this object.)
 
We can make this new object the parent of account2 by \"arrow dragging.\"
 
Find the arrow pointing from account2\'s \"parent\" slot to the actual
parent object.  Use the left mouse button to grab and drag the
arrowhead. Drag it over to the new parent -- and drop the arrowhead
directly on the new parent somewhere, you don\'t have to try for the edge.)
 
Now the stock account has its own parent. 
 
 
 
 
 
 
 
 
 
 

Move on to STEP 7 when ready...
'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'uiDemo' -> () From: ( | {
         'ModuleInfo: Module: uiDemo InitialContents: FollowSlot'
        
         s7 = 'STEP 7: More method editing. 
 
In a stock-based account like account2, it would be nice to disallow
deposit of fractional shares of stock. We\'ll edit the \"deposit:\" slot
so that you can deposit only whole shares of stock.  Go to account2\'s
parent, and select \"edit\" from the \"deposit:\" slot
pop up menu. We will use the \"remainder\" (or \"modulo\") message for
numbers, sent with the \"%\" sign.
 
The resulting window is too small. Resize it by grabbing the little
rectangle at lower right.  Change \"deposit:\" so it has the following 
two lines
 
        deposit: amt = ((amt % pricePerShare) = 0 ifFalse: [^ error: \'oops\' ].
                        dollars: dollars + amt )
 
Again, check your syntax.  The period at the end of the first line is
important.  
  
Before going on, try out your change by sending \"deposit: 32\" and
\"deposit: 31\" to the stock-based account.
 
 
 
Move on when ready for STEP 8.
'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'uiDemo' -> () From: ( | {
         'ModuleInfo: Module: uiDemo InitialContents: FollowSlot'
        
         s8 = 'STEP 8: Slot removal
 
You\'ve just modified the parent of the stock account.  But the
\"withdraw:\" slot is the same in each of the two account parents.
Let\'s have our new stock account parent inherit \"withdraw:\" from the
original account parent.
 
Go to your newly modified stock parent, and sprout *its* parent.  This object 
is called \"traits clonable.\" Use arrow dragging to change the modified stock
parent\'s parent from \"traits clonable\" to the *original* account parent (the
one with the normal deposit: and withdraw: slots.)
 
Now go to the stock account parent\'s \"withdraw:\" slot and, using this 
slot\'s menu button, remove the slot. Now the stock-based account will
inherit \"withdraw:\" from the original account parent.

You might test the effect of sending \"withdraw:\" to the stock-based account.
==============================================================================
                            Things to try now.

1] MAKE YOUR OWN OBJECT: Go to any evaluator and type 
  (| |)
The result of evaluating this expression is an empty object. You can add slots
and start to build whatever you like.  We suggest adding a slot so that  \"traits
clonable\" is a parent: select \"add slot...\" and enter \"parent* = traits clonable\"

2] BROWSE AROUND THE SYSTEM: Go to any evaluator and type \"lobby.\" The lobby
object is an important parent of most objects. The lobby in turn has many
parents of its own, and these parents contain useful objects.  For example,
look from lobby to globals to preferences and find the slot called
mergeAssignemtSlots. Change this slot to contain true to save screen space.

3] FOR FURTHER INFORMATION about the system, you can read the documentation
\"How to use Self 3.0,\" which is available at the same FTP site as Self.

4] QUIT AND/OR SAVE:  To quit, type \"quit\" in the original shell from which
you invoked this Self world. Before exiting, it will ask if you want to save 
the current state of the system in an executable snapshot file.

    To run the demo/tutorial again, type \"ui demo\" in the original shell.

    Thanks for trying Self - good luck to you and yourSelf!'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'uiDemo' -> () From: ( | {
         'ModuleInfo: Module: uiDemo InitialContents: FollowSlot'
        
         start = ( |
            | 
            ui uiProcess isActive ifTrue: 
                [' ' printLine. ' ' printLine.
                'The demo must start with a fresh user interface but' printLine.
                'you currently have one running.' printLine.
                'If you really want to run the demo, say \"ui quit\"' printLine.
                'then try "ui demo" again.' printLine.
                ' ' printLine. ' ' printLine.
                 ^ self ].

            ' ' printLine. ' ' printLine. 
            'This will take a minute...' printLine.
            '...ready to go when a box starting with WELCOME' printLine.
            '   appears in the user interface' printLine.
            '   followed by 3 smaller boxes.' printLine.
            preferences mergeAssignmentSlots: false.
            preferences allowArrowGrabbing: true.

            ui resetWindowRect.
            preferences initialWindowRect: (0@0) # (1142@868).
            ui animationOff.
            ui start.
            ui banishAll.
            makeTextEditors.
            placeStrings. 
            placeExamples.
            ui animationOn.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'uiDemo' -> () From: ( | {
         'ModuleInfo: Module: uiDemo InitialContents: InitializeToExpression: ( nil )'
        
         strings <- bootstrap stub -> 'globals' -> 'nil' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'uiDemo' -> () From: ( | {
         'ModuleInfo: Module: uiDemo InitialContents: InitializeToExpression: (vector copySize: 8)'
        
         textEditors <- vector copySize: 8.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'uiDemo' -> () From: ( | {
         'ModuleInfo: Module: uiDemo InitialContents: InitializeToExpression: (dictionary copyRemoveAll)'
        
         textPositions = dictionary copyRemoveAll.
        } | ) 



 '-- Side effects'

 globals modules uiDemo postFileIn
