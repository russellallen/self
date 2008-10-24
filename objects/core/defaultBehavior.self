 'Sun-$Revision: 30.10 $'
 '
Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> () From: ( | {
         'ModuleInfo: Module: defaultBehavior InitialContents: FollowSlot\x7fVisibility: public'
        
         defaultBehavior* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'defaultBehavior' -> () From: ( |
             {} = 'Comment: This is the default behavior for the lobby and objects that
inherit from it. Most objects in the system inherit from the lobby.\x7fModuleInfo: Creator: defaultBehavior.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'defaultBehavior' -> () From: ( | {
         'Category: comparing\x7fModuleInfo: Module: defaultBehavior InitialContents: FollowSlot\x7fVisibility: public'
        
         != x = ( |
            | ( = x ) not).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'defaultBehavior' -> () From: ( | {
         'Category: identity\x7fComment: == and !== should usually be avoided; if you really care
                  about object identities then you should probably be using
                  mirrors, since object identity is a reflective concept.\x7fModuleInfo: Module: defaultBehavior InitialContents: FollowSlot\x7fVisibility: public'
        
         !== x = ( |
            | ( == x ) not).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'defaultBehavior' -> () From: ( | {
         'Category: collectorMaking\x7fModuleInfo: Module: defaultBehavior InitialContents: FollowSlot\x7fVisibility: public'
        
         & el = ( |
            | el appendToCollector: (collector copyFirst: self)).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'defaultBehavior' -> () From: ( | {
         'Category: identity\x7fComment: == and !== should usually be avoided; if you really care
                  about object identities then you should probably be using
                  mirrors, since object identity is a reflective concept.\x7fModuleInfo: Module: defaultBehavior InitialContents: FollowSlot\x7fVisibility: public'
        
         == x = ( |
            | _Eq: x).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'defaultBehavior' -> () From: ( | {
         'Category: pairing\x7fComment: create a point\x7fModuleInfo: Module: defaultBehavior InitialContents: FollowSlot\x7fVisibility: public'
        
         @ y = ( |
            | point copyX: self Y: y).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'defaultBehavior' -> () From: ( | {
         'Category: collectorMaking\x7fComment: _\x7fModuleInfo: Module: defaultBehavior InitialContents: FollowSlot'
        
         appendToCollector: c = ( |
            | c append: self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'defaultBehavior' -> () From: ( | {
         'Category: reflecting\x7fModuleInfo: Module: defaultBehavior InitialContents: FollowSlot\x7fVisibility: public'
        
         asMirror = ( |
            | reflect: self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'defaultBehavior' -> () From: ( | {
         'Category: converting\x7fComment: override me to get a specialized outliner\x7fModuleInfo: Module: defaultBehavior InitialContents: FollowSlot\x7fVisibility: public'
        
         asOutliner = ( |
            | 
            selfObjectModel newOutlinerFor: asMirror).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'defaultBehavior' -> () From: ( | {
         'Category: converting\x7fModuleInfo: Module: defaultBehavior InitialContents: FollowSlot\x7fVisibility: public'
        
         asString = ( |
            | 
            printString).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'defaultBehavior' -> () From: ( | {
         'Category: copying\x7fComment: return a shallow copy of the receiver\x7fModuleInfo: Module: defaultBehavior InitialContents: FollowSlot\x7fVisibility: private'
        
         clone = ( |
            | _CloneIfFail: [|:error|
                'outOfMemoryError' == error ifFalse: [
                  error: error
                ] True: [
                  memory allocationFailed.
                  _Clone
                ]
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'defaultBehavior' -> () From: ( | {
         'Category: doubleDispatching\x7fComment: _\x7fModuleInfo: Module: defaultBehavior InitialContents: FollowSlot'
        
         equalsBigInteger: x = ( |
            | false).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'defaultBehavior' -> () From: ( | {
         'Category: doubleDispatching\x7fComment: _\x7fModuleInfo: Module: defaultBehavior InitialContents: FollowSlot'
        
         equalsCanonicalString: x = ( |
            | false).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'defaultBehavior' -> () From: ( | {
         'Category: doubleDispatching\x7fComment: _\x7fModuleInfo: Module: defaultBehavior InitialContents: FollowSlot'
        
         equalsCollection: x = ( |
            | false).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'defaultBehavior' -> () From: ( | {
         'Category: doubleDispatching\x7fComment: _\x7fModuleInfo: Module: defaultBehavior InitialContents: FollowSlot'
        
         equalsColor: x = ( |
            | false).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'defaultBehavior' -> () From: ( | {
         'Category: doubleDispatching\x7fComment: _\x7fModuleInfo: Module: defaultBehavior InitialContents: FollowSlot'
        
         equalsColormapEntry: x = ( |
            | false).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'defaultBehavior' -> () From: ( | {
         'Category: doubleDispatching\x7fComment: _\x7fModuleInfo: Module: defaultBehavior InitialContents: FollowSlot'
        
         equalsDeadActivationMirror: x = ( |
            | false).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'defaultBehavior' -> () From: ( | {
         'Category: doubleDispatching\x7fComment: _\x7fModuleInfo: Module: defaultBehavior InitialContents: FollowSlot'
        
         equalsDictionary: x = ( |
            | false).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'defaultBehavior' -> () From: ( | {
         'Category: doubleDispatching\x7fComment: _\x7fModuleInfo: Module: defaultBehavior InitialContents: FollowSlot'
        
         equalsFloat: x = ( |
            | false).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'defaultBehavior' -> () From: ( | {
         'Category: doubleDispatching\x7fComment: _\x7fModuleInfo: Module: defaultBehavior InitialContents: FollowSlot'
        
         equalsPair: x = ( |
            | false).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'defaultBehavior' -> () From: ( | {
         'Category: doubleDispatching\x7fComment: _\x7fModuleInfo: Module: defaultBehavior InitialContents: FollowSlot'
        
         equalsRectangle: x = ( |
            | false).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'defaultBehavior' -> () From: ( | {
         'Category: doubleDispatching\x7fComment: _\x7fModuleInfo: Module: defaultBehavior InitialContents: FollowSlot'
        
         equalsSet: x = ( |
            | false).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'defaultBehavior' -> () From: ( | {
         'Category: doubleDispatching\x7fComment: _\x7fModuleInfo: Module: defaultBehavior InitialContents: FollowSlot'
        
         equalsSmallInteger: x = ( |
            | false).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'defaultBehavior' -> () From: ( | {
         'Category: identity\x7fComment: == and !== should usually be avoided; if you really care
                  about object identities then you should probably be using
                  mirrors, since object identity is a reflective concept.\x7fModuleInfo: Module: defaultBehavior InitialContents: FollowSlot\x7fVisibility: public'
        
         identityHash = ( |
            | _IdentityHash).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'defaultBehavior' -> () From: ( | {
         'Category: testing\x7fModuleInfo: Module: defaultBehavior InitialContents: FollowSlot\x7fVisibility: public'
        
         isMorph = bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'defaultBehavior' -> () From: ( | {
         'Category: evaluating\x7fComment: 
Convenient behavior for key/value and value* messages. By default, an
object is its own key and value. The default value:{With:} messages
strip off the trailing argument and retry. For example, this behavior
allows a block taking one argument to be substituted for one taking two
arguments when only the first argument is of interest.\x7fModuleInfo: Module: defaultBehavior InitialContents: FollowSlot\x7fVisibility: public'
        
         key = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'defaultBehavior' -> () From: ( | {
         'Category: printing\x7fComment: Used by printString, supplies the name part of the result.\x7fModuleInfo: Module: defaultBehavior InitialContents: FollowSlot\x7fVisibility: public'
        
         namePrintString = ( |
            | asMirror safeName).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'defaultBehavior' -> () From: ( | {
         'Category: referencing\x7fModuleInfo: Module: defaultBehavior InitialContents: FollowSlot\x7fVisibility: public'
        
         objectID = ( |
            | '<', objectIDNumber printString, '>').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'defaultBehavior' -> () From: ( | {
         'Category: referencing\x7fModuleInfo: Module: defaultBehavior InitialContents: FollowSlot\x7fVisibility: public'
        
         objectIDNumber = ( |
            | 
            _ObjectID).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'defaultBehavior' -> () From: ( | {
         'Category: doubleDispatching\x7fComment: double-dispatching for pairs. 4/91 dmu _\x7fModuleInfo: Module: defaultBehavior InitialContents: FollowSlot'
        
         pairDivide: p = ( |
            | p copyX: p x / self  Y:  p y / self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'defaultBehavior' -> () From: ( | {
         'Category: doubleDispatching\x7fComment: double-dispatching for pairs. 4/91 dmu _\x7fModuleInfo: Module: defaultBehavior InitialContents: FollowSlot'
        
         pairDivideCeiling: p = ( |
            | p copyX: p x /+ self  Y:  p y /+ self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'defaultBehavior' -> () From: ( | {
         'Category: doubleDispatching\x7fComment: double-dispatching for pairs. 4/91 dmu _\x7fModuleInfo: Module: defaultBehavior InitialContents: FollowSlot'
        
         pairDivideExact: p = ( |
            | p copyX: p x /= self  Y:  p y /= self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'defaultBehavior' -> () From: ( | {
         'Category: doubleDispatching\x7fComment: double-dispatching for pairs. 4/91 dmu _\x7fModuleInfo: Module: defaultBehavior InitialContents: FollowSlot'
        
         pairDivideFloor: p = ( |
            | p copyX: p x /- self  Y:  p y /- self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'defaultBehavior' -> () From: ( | {
         'Category: doubleDispatching\x7fComment: double-dispatching for pairs. 4/91 dmu _\x7fModuleInfo: Module: defaultBehavior InitialContents: FollowSlot'
        
         pairDivideRound: p = ( |
            | p copyX: p x /~ self  Y:  p y /~ self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'defaultBehavior' -> () From: ( | {
         'Category: doubleDispatching\x7fComment: double-dispatching for pairs. 4/91 dmu _\x7fModuleInfo: Module: defaultBehavior InitialContents: FollowSlot'
        
         pairMax: p = ( |
            | p copyX: (p x max: self)  Y:  p y max: self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'defaultBehavior' -> () From: ( | {
         'Category: doubleDispatching\x7fComment: double-dispatching for pairs. 4/91 dmu _\x7fModuleInfo: Module: defaultBehavior InitialContents: FollowSlot'
        
         pairMean: p = ( |
            | p copyX: (p x mean: self)  Y:  p y mean: self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'defaultBehavior' -> () From: ( | {
         'Category: doubleDispatching\x7fComment: double-dispatching for pairs. 4/91 dmu _\x7fModuleInfo: Module: defaultBehavior InitialContents: FollowSlot'
        
         pairMin: p = ( |
            | p copyX: (p x min: self)  Y:  p y min: self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'defaultBehavior' -> () From: ( | {
         'Category: doubleDispatching\x7fComment: double-dispatching for pairs. 4/91 dmu _\x7fModuleInfo: Module: defaultBehavior InitialContents: FollowSlot'
        
         pairMinus: p = ( |
            | p copyX: p x - self  Y:  p y - self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'defaultBehavior' -> () From: ( | {
         'Category: doubleDispatching\x7fComment: double-dispatching for pairs. 4/91 dmu _\x7fModuleInfo: Module: defaultBehavior InitialContents: FollowSlot'
        
         pairPlus: p = ( |
            | p copyX: p x + self  Y:  p y + self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'defaultBehavior' -> () From: ( | {
         'Category: doubleDispatching\x7fComment: double-dispatching for pairs. 4/91 dmu _\x7fModuleInfo: Module: defaultBehavior InitialContents: FollowSlot'
        
         pairTimes: p = ( |
            | p copyX: p x * self  Y:  p y * self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'defaultBehavior' -> () From: ( | {
         'Category: printing\x7fComment: Print me out on the standard output.\x7fModuleInfo: Module: defaultBehavior InitialContents: FollowSlot\x7fVisibility: public'
        
         print = ( |
            | printString print. self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'defaultBehavior' -> () From: ( | {
         'Category: printing\x7fModuleInfo: Module: defaultBehavior InitialContents: FollowSlot\x7fVisibility: public'
        
         printLine = ( |
            | print. '\n' print. self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'defaultBehavior' -> () From: ( | {
         'Category: printing\x7fComment: Objects that print should understand the messages printString,
and printStringSize:.

Children of the lobby may implement just the message printString and
inherit reasonable behavior for the other three messages.
(Or may implement printStringState, or printStringName.)

To get the UI to print an object, its prototype (not traits) should
be annotated with isComplete = true.
See nameSize: in traits mirror
to understand how this works.\x7fModuleInfo: Module: defaultBehavior InitialContents: FollowSlot\x7fVisibility: public'
        
         printString = ( |
             sp.
            | 
            sp: statePrintString.
            namePrintString, 
            (sp isEmpty ifTrue: '' False: ['(', sp, ')'])).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'defaultBehavior' -> () From: ( | {
         'Category: printing\x7fComment: An object may implement this if it wants to control the
way its printString may be truncated.\x7fModuleInfo: Module: defaultBehavior InitialContents: FollowSlot\x7fVisibility: public'
        
         printStringSize: s = ( |
             r.
            | 
            r: printString.
            r size  <=  s ifTrue:  r  False: [namePrintString]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'defaultBehavior' -> () From: ( | {
         'Category: error handling\x7fComment: same as error: except does not print to the Self shell.\x7fModuleInfo: Module: defaultBehavior InitialContents: FollowSlot\x7fVisibility: public'
        
         quietError: message = ( |
             env = bootstrap stub -> 'lobby' -> ().
            | 
            env process this suspendWithError:
                (env processErrors userError copy
                    receiver: self)
                    message:  (ensureString: message).
            env process this errorContinueValue).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'defaultBehavior' -> () From: ( | {
         'Category: reflecting\x7fModuleInfo: Module: defaultBehavior InitialContents: FollowSlot\x7fVisibility: public'
        
         reflect: x = ( |
            | x _Mirror).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'defaultBehavior' -> () From: ( | {
         'Category: printing\x7fComment: Part of printString, prints out the specialized state part.
Should be overriden in order to print out my state.\x7fModuleInfo: Module: defaultBehavior InitialContents: FollowSlot\x7fVisibility: public'
        
         statePrintString = ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'defaultBehavior' -> () From: ( | {
         'Category: evaluating\x7fComment: 
Convenient behavior for key/value and value* messages. By default, an
object is its own key and value. The default value:{With:} messages
strip off the trailing argument and retry. For example, this behavior
allows a block taking one argument to be substituted for one taking two
arguments when only the first argument is of interest.\x7fModuleInfo: Module: defaultBehavior InitialContents: FollowSlot\x7fVisibility: public'
        
         value = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'defaultBehavior' -> () From: ( | {
         'Category: evaluating\x7fComment: 
Convenient behavior for key/value and value* messages. By default, an
object is its own key and value. The default value:{With:} messages
strip off the trailing argument and retry. For example, this behavior
allows a block taking one argument to be substituted for one taking two
arguments when only the first argument is of interest.\x7fModuleInfo: Module: defaultBehavior InitialContents: FollowSlot\x7fVisibility: public'
        
         value: a = ( |
            | value).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'defaultBehavior' -> () From: ( | {
         'Category: evaluating\x7fComment: 
Convenient behavior for key/value and value* messages. By default, an
object is its own key and value. The default value:{With:} messages
strip off the trailing argument and retry. For example, this behavior
allows a block taking one argument to be substituted for one taking two
arguments when only the first argument is of interest.\x7fModuleInfo: Module: defaultBehavior InitialContents: FollowSlot\x7fVisibility: public'
        
         value: a With: b = ( |
            | value: a).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'defaultBehavior' -> () From: ( | {
         'Category: evaluating\x7fComment: 
Convenient behavior for key/value and value* messages. By default, an
object is its own key and value. The default value:{With:} messages
strip off the trailing argument and retry. For example, this behavior
allows a block taking one argument to be substituted for one taking two
arguments when only the first argument is of interest.\x7fModuleInfo: Module: defaultBehavior InitialContents: FollowSlot\x7fVisibility: public'
        
         value: a With: b With: c = ( |
            | value: a With: b).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'defaultBehavior' -> () From: ( | {
         'Category: evaluating\x7fComment: 
Convenient behavior for key/value and value* messages. By default, an
object is its own key and value. The default value:{With:} messages
strip off the trailing argument and retry. For example, this behavior
allows a block taking one argument to be substituted for one taking two
arguments when only the first argument is of interest.\x7fModuleInfo: Module: defaultBehavior InitialContents: FollowSlot\x7fVisibility: public'
        
         value: a With: b With: c With: d = ( |
            | value: a With: b With: c).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'defaultBehavior' -> () From: ( | {
         'Category: evaluating\x7fComment: 
Convenient behavior for key/value and value* messages. By default, an
object is its own key and value. The default value:{With:} messages
strip off the trailing argument and retry. For example, this behavior
allows a block taking one argument to be substituted for one taking two
arguments when only the first argument is of interest.\x7fModuleInfo: Module: defaultBehavior InitialContents: FollowSlot\x7fVisibility: public'
        
         value: a With: b With: c With: d With: e = ( |
            | 
            value: a With: b With: c With: d).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'defaultBehavior' -> () From: ( | {
         'Category: evaluating\x7fComment: 
Convenient behavior for key/value and value* messages. By default, an
object is its own key and value. The default value:{With:} messages
strip off the trailing argument and retry. For example, this behavior
allows a block taking one argument to be substituted for one taking two
arguments when only the first argument is of interest.\x7fModuleInfo: Module: defaultBehavior InitialContents: FollowSlot\x7fVisibility: public'
        
         value: a With: b With: c With: d With: e With: f = ( |
            | value: a With: b With: c With: d With: e).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: defaultBehavior InitialContents: FollowSlot'
        
         defaultBehavior = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'defaultBehavior' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'comment' From:
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'defaultBehavior' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules defaultBehavior.

CopyDowns:
globals modules init. copy 
SlotsToOmit: comment directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'defaultBehavior' -> () From: ( | {
         'ModuleInfo: Module: defaultBehavior InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'core'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'defaultBehavior' -> () From: ( | {
         'ModuleInfo: Module: defaultBehavior InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'defaultBehavior' -> () From: ( | {
         'ModuleInfo: Module: defaultBehavior InitialContents: FollowSlot'
        
         myComment <- 'behavior for the lobby and objects that inherit from it'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'defaultBehavior' -> () From: ( | {
         'ModuleInfo: Module: defaultBehavior InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- 'Sun-$Revision: 30.10 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'defaultBehavior' -> () From: ( | {
         'ModuleInfo: Module: defaultBehavior InitialContents: FollowSlot\x7fVisibility: private'
        
         subpartNames <- ''.
        } | ) 



 '-- Side effects'

 globals modules defaultBehavior postFileIn
