 'Sun-$Revision: 30.7 $'
 '
Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: rootTraits InitialContents: FollowSlot'
        
         rootTraits = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'rootTraits' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'comment' From:
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'rootTraits' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules rootTraits.

CopyDowns:
globals modules init. copy 
SlotsToOmit: comment directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'rootTraits' -> () From: ( | {
         'ModuleInfo: Module: rootTraits InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'core'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'rootTraits' -> () From: ( | {
         'ModuleInfo: Module: rootTraits InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'rootTraits' -> () From: ( | {
         'ModuleInfo: Module: rootTraits InitialContents: FollowSlot'
        
         myComment <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'rootTraits' -> () From: ( | {
         'ModuleInfo: Module: rootTraits InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- 'Sun-$Revision: 30.7 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'rootTraits' -> () From: ( | {
         'ModuleInfo: Module: rootTraits InitialContents: FollowSlot\x7fVisibility: private'
        
         subpartNames <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'mixins' -> () From: ( | {
         'Category: standard\x7fModuleInfo: Module: rootTraits InitialContents: FollowSlot'
        
         clonable = bootstrap setObjectAnnotationOf: bootstrap stub -> 'mixins' -> 'clonable' -> () From: ( |
             {} = 'Comment: This is the traits for ordinary objects. Ordinary objects
    are mutable and can be copied (cloned). A child should provide
    a methods for = and hash if the child is to be stored in a set
    or used as the key of a dictionary; the default is for objects to be
    compared and hashed using object identity.\x7fModuleInfo: Creator: mixins clonable.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'mixins' -> 'clonable' -> () From: ( | {
         'ModuleInfo: Module: rootTraits InitialContents: FollowSlot\x7fVisibility: public'
        
         copy = ( |
            | clone).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'mixins' -> () From: ( | {
         'Category: standard\x7fModuleInfo: Module: rootTraits InitialContents: FollowSlot\x7fVisibility: public'
        
         identity = bootstrap setObjectAnnotationOf: bootstrap stub -> 'mixins' -> 'identity' -> () From: ( |
             {} = 'Comment: This mixin behavior says that a = b if and only if a and b are the same
    object. This behavior is appropriate for unique objects like small integers,
    true, and false.
    The messages = and hash are closely related; if one is defined the other
    should be, too. This allows the defining object to be stored in
    hashtable-based sets and dictionaries.  The following should hold:

      (a == b) implies (a = b)
      (a = b)  implies (a hash = b hash)

    but

      (a hash = b hash) does not necessarily imply (a = b).\x7fModuleInfo: Creator: mixins identity.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'mixins' -> 'identity' -> () From: ( | {
         'ModuleInfo: Module: rootTraits InitialContents: FollowSlot\x7fVisibility: public'
        
         = x = ( |
            | == x).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'mixins' -> 'identity' -> () From: ( | {
         'ModuleInfo: Module: rootTraits InitialContents: FollowSlot\x7fVisibility: public'
        
         hash = ( |
            | identityHash).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'mixins' -> () From: ( | {
         'Category: standard\x7fModuleInfo: Module: rootTraits InitialContents: FollowSlot'
        
         oddball = bootstrap setObjectAnnotationOf: bootstrap stub -> 'mixins' -> 'oddball' -> () From: ( |
             {} = 'Comment: This is the traits for one-of-a-kind objects, such as the object
    true. An oddball responds to the copy message by returning itself
    and responds to = and hash using identity behavior. Most oddball
    objects are accessible by a path originating from the globals
    slot of the lobby.\x7fModuleInfo: Creator: mixins oddball.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'mixins' -> 'oddball' -> () From: ( | {
         'Comment: return the receiver, not a copy\x7fModuleInfo: Module: rootTraits InitialContents: FollowSlot\x7fVisibility: public'
        
         copy = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'mixins' -> () From: ( | {
         'Category: standard\x7fModuleInfo: Module: rootTraits InitialContents: FollowSlot'
        
         ordered = bootstrap setObjectAnnotationOf: bootstrap stub -> 'mixins' -> 'ordered' -> () From: ( |
             {} = 'Comment: Mixin for objects that wish to provide less-than\x7fModuleInfo: Creator: mixins ordered.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'mixins' -> 'ordered' -> () From: ( | {
         'ModuleInfo: Module: rootTraits InitialContents: FollowSlot\x7fVisibility: public'
        
         <= x = ( |
            | (x < self) not).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'mixins' -> 'ordered' -> () From: ( | {
         'ModuleInfo: Module: rootTraits InitialContents: FollowSlot\x7fVisibility: public'
        
         > x = ( |
            | ( <= x ) not).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'mixins' -> 'ordered' -> () From: ( | {
         'ModuleInfo: Module: rootTraits InitialContents: FollowSlot\x7fVisibility: public'
        
         >= x = ( |
            | ( <  x ) not).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'mixins' -> 'ordered' -> () From: ( | {
         'ModuleInfo: Module: rootTraits InitialContents: FollowSlot\x7fVisibility: public'
        
         compare: x IfLess: lb Equal: eb Greater: gb = ( |
            | 
            = x ifTrue: eb False: [ < x ifTrue: lb False: gb ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'mixins' -> 'ordered' -> () From: ( | {
         'ModuleInfo: Module: rootTraits InitialContents: FollowSlot\x7fVisibility: private'
        
         descendantResponsibilities = bootstrap setObjectAnnotationOf: bootstrap stub -> 'mixins' -> 'ordered' -> 'descendantResponsibilities' -> () From: ( |
             {} = 'ModuleInfo: Creator: mixins ordered descendantResponsibilities.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'mixins' -> 'ordered' -> 'descendantResponsibilities' -> () From: ( | {
         'Comment: The following methods must be implemented by a descendant.\x7fModuleInfo: Module: rootTraits InitialContents: FollowSlot\x7fVisibility: public'
        
         < x = ( |
            | 
            'child must implement: "<"
             and the binary comparisons will automaticaly work.
             (as well as compare:...)
             Also to double-dispatch, the child needs to double-dispatch on
             "<".  As an optimization, the child may implement other
             comparison ops as well').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'mixins' -> 'ordered' -> 'descendantResponsibilities' -> () From: ( | {
         'Comment: The following methods must be implemented by a descendant.\x7fModuleInfo: Module: rootTraits InitialContents: FollowSlot\x7fVisibility: public'
        
         = x = ( |
            | 'Am I equal to x?(can mixin mixins identity if desired)').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'mixins' -> 'ordered' -> 'descendantResponsibilities' -> () From: ( | {
         'Comment: The following methods must be implemented by a descendant.\x7fModuleInfo: Module: rootTraits InitialContents: FollowSlot\x7fVisibility: public'
        
         hash = ( |
            | 
            'Answer a smallInt such that x = y implies x hash = y hash
             (can mixin mixins identity if desired) ').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'mixins' -> 'ordered' -> () From: ( | {
         'ModuleInfo: Module: rootTraits InitialContents: FollowSlot\x7fVisibility: public'
        
         max: x = ( |
            | 
            > x ifTrue: [self] False: [x]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'mixins' -> 'ordered' -> () From: ( | {
         'ModuleInfo: Module: rootTraits InitialContents: FollowSlot\x7fVisibility: public'
        
         min: x = ( |
            | 
            < x ifTrue: [self] False: [x]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'mixins' -> () From: ( | {
         'Category: standard\x7fModuleInfo: Module: rootTraits InitialContents: FollowSlot'
        
         unordered = bootstrap setObjectAnnotationOf: bootstrap stub -> 'mixins' -> 'unordered' -> () From: ( |
             {} = 'Comment: Mixin for objects that have no notion of less-than\x7fModuleInfo: Creator: mixins unordered.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'mixins' -> 'unordered' -> () From: ( | {
         'ModuleInfo: Module: rootTraits InitialContents: FollowSlot\x7fVisibility: private'
        
         descendantResponsibilities = bootstrap setObjectAnnotationOf: bootstrap stub -> 'mixins' -> 'unordered' -> 'descendantResponsibilities' -> () From: ( |
             {} = 'Comment: The following methods must be implemented by a descendant.\x7fModuleInfo: Creator: mixins unordered descendantResponsibilities.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'mixins' -> 'unordered' -> 'descendantResponsibilities' -> () From: ( | {
         'ModuleInfo: Module: rootTraits InitialContents: FollowSlot\x7fVisibility: public'
        
         = x = ( |
            | 'Am I equal to x?(can mixin mixins identity if desired)').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'mixins' -> 'unordered' -> 'descendantResponsibilities' -> () From: ( | {
         'ModuleInfo: Module: rootTraits InitialContents: FollowSlot\x7fVisibility: public'
        
         hash = ( |
            | 
            'Answer a smallInt such that x = y implies x hash = y hash
             (can mixin mixins identity if desired) ').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: system\x7fCategory: roots\x7fModuleInfo: Module: rootTraits InitialContents: FollowSlot\x7fVisibility: public'
        
         clonable = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'clonable' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits clonable.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'clonable' -> () From: ( | {
         'ModuleInfo: Module: rootTraits InitialContents: FollowSlot'
        
         cloning* = bootstrap stub -> 'mixins' -> 'clonable' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'clonable' -> () From: ( | {
         'ModuleInfo: Module: rootTraits InitialContents: FollowSlot'
        
         comparing* = bootstrap stub -> 'mixins' -> 'identity' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'clonable' -> () From: ( | {
         'ModuleInfo: Module: rootTraits InitialContents: FollowSlot'
        
         ordering* = bootstrap stub -> 'mixins' -> 'unordered' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'clonable' -> () From: ( | {
         'ModuleInfo: Module: rootTraits InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'lobby' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: system\x7fCategory: roots\x7fModuleInfo: Module: rootTraits InitialContents: FollowSlot\x7fVisibility: public'
        
         oddball = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'oddball' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits oddball.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'oddball' -> () From: ( | {
         'ModuleInfo: Module: rootTraits InitialContents: FollowSlot'
        
         cloning* = bootstrap stub -> 'mixins' -> 'oddball' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'oddball' -> () From: ( | {
         'ModuleInfo: Module: rootTraits InitialContents: FollowSlot'
        
         comparing* = bootstrap stub -> 'mixins' -> 'identity' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'oddball' -> () From: ( | {
         'ModuleInfo: Module: rootTraits InitialContents: FollowSlot'
        
         ordering* = bootstrap stub -> 'mixins' -> 'unordered' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'oddball' -> () From: ( | {
         'ModuleInfo: Module: rootTraits InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'lobby' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: system\x7fCategory: roots\x7fModuleInfo: Module: rootTraits InitialContents: FollowSlot\x7fVisibility: public'
        
         orderedClonable = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'orderedClonable' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits orderedClonable.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'orderedClonable' -> () From: ( | {
         'ModuleInfo: Module: rootTraits InitialContents: FollowSlot'
        
         cloning* = bootstrap stub -> 'mixins' -> 'clonable' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'orderedClonable' -> () From: ( | {
         'ModuleInfo: Module: rootTraits InitialContents: FollowSlot'
        
         ordering* = bootstrap stub -> 'mixins' -> 'ordered' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'orderedClonable' -> () From: ( | {
         'ModuleInfo: Module: rootTraits InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'lobby' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: system\x7fCategory: roots\x7fModuleInfo: Module: rootTraits InitialContents: FollowSlot\x7fVisibility: public'
        
         orderedOddball = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'orderedOddball' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits orderedOddball.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'orderedOddball' -> () From: ( | {
         'ModuleInfo: Module: rootTraits InitialContents: FollowSlot'
        
         cloning* = bootstrap stub -> 'mixins' -> 'oddball' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'orderedOddball' -> () From: ( | {
         'ModuleInfo: Module: rootTraits InitialContents: FollowSlot'
        
         ordering* = bootstrap stub -> 'mixins' -> 'ordered' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'orderedOddball' -> () From: ( | {
         'ModuleInfo: Module: rootTraits InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'lobby' -> ().
        } | ) 



 '-- Side effects'

 globals modules rootTraits postFileIn
