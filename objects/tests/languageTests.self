 '$Revision:$'
 '
Copyright 1992-2012 AUTHORS.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: languageTests InitialContents: FollowSlot'
        
         languageTests = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'languageTests' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'languageTests' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules languageTests.

CopyDowns:
globals modules init. copy 
SlotsToOmit: directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'languageTests' -> () From: ( | {
         'ModuleInfo: Module: languageTests InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'tests'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'languageTests' -> () From: ( | {
         'ModuleInfo: Module: languageTests InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'languageTests' -> () From: ( | {
         'ModuleInfo: Module: languageTests InitialContents: FollowSlot'
        
         myComment <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'languageTests' -> () From: ( | {
         'ModuleInfo: Module: languageTests InitialContents: FollowSlot'
        
         postFileIn = ( |
            | resend.postFileIn).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'languageTests' -> () From: ( | {
         'ModuleInfo: Module: languageTests InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- '$Revision:$'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'languageTests' -> () From: ( | {
         'ModuleInfo: Module: languageTests InitialContents: FollowSlot\x7fVisibility: private'
        
         subpartNames <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> () From: ( | {
         'Category: VM tests\x7fCategory: resending\x7fModuleInfo: Module: languageTests InitialContents: FollowSlot\x7fVisibility: public'
        
         resending = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'tests' -> 'resending' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals tests resending.
\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'resending' -> () From: ( | {
         'ModuleInfo: Module: languageTests InitialContents: FollowSlot\x7fVisibility: private'
        
         objectThatInheritsTheSameMethodThatDoesAResend1 = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'tests' -> 'resending' -> 'objectThatInheritsTheSameMethodThatDoesAResend1' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals tests resending objectThatInheritsTheSameMethodThatDoesAResend1.
\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'resending' -> () From: ( | {
         'ModuleInfo: Module: languageTests InitialContents: FollowSlot\x7fVisibility: private'
        
         objectThatInheritsTheSameMethodThatDoesAResendParent = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'tests' -> 'resending' -> 'objectThatInheritsTheSameMethodThatDoesAResendParent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals tests resending objectThatInheritsTheSameMethodThatDoesAResendParent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'resending' -> 'objectThatInheritsTheSameMethodThatDoesAResend1' -> () From: ( | {
         'ModuleInfo: Module: languageTests InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'globals' -> 'tests' -> 'resending' -> 'objectThatInheritsTheSameMethodThatDoesAResendParent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'resending' -> () From: ( | {
         'ModuleInfo: Module: languageTests InitialContents: FollowSlot\x7fVisibility: private'
        
         objectThatInheritsTheSameMethodThatDoesAResend2 = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'tests' -> 'resending' -> 'objectThatInheritsTheSameMethodThatDoesAResend2' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals tests resending objectThatInheritsTheSameMethodThatDoesAResend2.
\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'resending' -> 'objectThatInheritsTheSameMethodThatDoesAResend2' -> () From: ( | {
         'ModuleInfo: Module: languageTests InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'globals' -> 'tests' -> 'resending' -> 'objectThatInheritsTheSameMethodThatDoesAResendParent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'resending' -> 'objectThatInheritsTheSameMethodThatDoesAResendParent' -> () From: ( | {
         'ModuleInfo: Module: languageTests InitialContents: FollowSlot'
        
         aardvark = ( |
            | [resend.aardvark] value).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'resending' -> 'objectThatInheritsTheSameMethodThatDoesAResendParent' -> () From: ( | {
         'ModuleInfo: Module: languageTests InitialContents: FollowSlot'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'tests' -> 'resending' -> 'objectThatInheritsTheSameMethodThatDoesAResendParent' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals tests resending objectThatInheritsTheSameMethodThatDoesAResendParent parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'resending' -> 'objectThatInheritsTheSameMethodThatDoesAResendParent' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: languageTests InitialContents: FollowSlot'
        
         aardvark = ( |
            | 
            4).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'resending' -> 'objectThatInheritsTheSameMethodThatDoesAResendParent' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: languageTests InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'oddball' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'resending' -> () From: ( | {
         'ModuleInfo: Module: languageTests InitialContents: FollowSlot\x7fVisibility: private'
        
         objectWithMultipleParents = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'tests' -> 'resending' -> 'objectWithMultipleParents' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals tests resending objectWithMultipleParents.
\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'resending' -> 'objectWithMultipleParents' -> () From: ( | {
         'ModuleInfo: Module: languageTests InitialContents: FollowSlot'
        
         a = ( |
            | resend.b _IntAdd: 1).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'resending' -> 'objectWithMultipleParents' -> () From: ( | {
         'ModuleInfo: Module: languageTests InitialContents: InitializeToExpression: (-1)'
        
         b <- -1.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'resending' -> 'objectWithMultipleParents' -> () From: ( | {
         'ModuleInfo: Module: languageTests InitialContents: FollowSlot'
        
         c = ( |
            | resend.c _IntAdd: 1).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'resending' -> 'objectWithMultipleParents' -> () From: ( | {
         'ModuleInfo: Module: languageTests InitialContents: FollowSlot'
        
         d = ( |
            | parentA.d _IntAdd: 1).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'resending' -> 'objectWithMultipleParents' -> () From: ( | {
         'ModuleInfo: Module: languageTests InitialContents: FollowSlot'
        
         e = ( |
            | parentB.e _IntAdd: 1).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'resending' -> 'objectWithMultipleParents' -> () From: ( | {
         'ModuleInfo: Module: languageTests InitialContents: FollowSlot'
        
         f = ( |
            | parentA.f _IntAdd: 1).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'resending' -> 'objectWithMultipleParents' -> () From: ( | {
         'ModuleInfo: Module: languageTests InitialContents: FollowSlot'
        
         g = ( |
            | parentA.g _IntAdd: parentB.g _IntAdd: 1).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'resending' -> 'objectWithMultipleParents' -> () From: ( | {
         'ModuleInfo: Module: languageTests InitialContents: FollowSlot'
        
         h = ( |
            | true ifTrue: [[parentB.h _IntAdd: 1] value] False: [-40]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'resending' -> 'objectWithMultipleParents' -> () From: ( | {
         'ModuleInfo: Module: languageTests InitialContents: FollowSlot'
        
         i = ( |
            | notAParent.i _IntAdd: 1).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'resending' -> 'objectWithMultipleParents' -> () From: ( | {
         'ModuleInfo: Module: languageTests InitialContents: FollowSlot'
        
         j = ( |
            | parentA.j _IntAdd: parentB.j _IntAdd: 1).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'resending' -> 'objectWithMultipleParents' -> () From: ( | {
         'ModuleInfo: Module: languageTests InitialContents: FollowSlot'
        
         notAParent = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'tests' -> 'resending' -> 'objectWithMultipleParents' -> 'notAParent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals tests resending objectWithMultipleParents notAParent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'resending' -> 'objectWithMultipleParents' -> 'notAParent' -> () From: ( | {
         'ModuleInfo: Module: languageTests InitialContents: FollowSlot'
        
         i = 60.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'resending' -> 'objectWithMultipleParents' -> () From: ( | {
         'ModuleInfo: Module: languageTests InitialContents: FollowSlot'
        
         parentA* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'tests' -> 'resending' -> 'objectWithMultipleParents' -> 'parentA' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals tests resending objectWithMultipleParents parentA.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'resending' -> 'objectWithMultipleParents' -> 'parentA' -> () From: ( | {
         'ModuleInfo: Module: languageTests InitialContents: FollowSlot'
        
         b = ( |
            | 
            0).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'resending' -> 'objectWithMultipleParents' -> 'parentA' -> () From: ( | {
         'ModuleInfo: Module: languageTests InitialContents: FollowSlot'
        
         d = 10.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'resending' -> 'objectWithMultipleParents' -> 'parentA' -> () From: ( | {
         'ModuleInfo: Module: languageTests InitialContents: FollowSlot'
        
         e = -20.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'resending' -> 'objectWithMultipleParents' -> 'parentA' -> () From: ( | {
         'ModuleInfo: Module: languageTests InitialContents: FollowSlot'
        
         f = ( |
            | parentA.f _IntAdd: 1).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'resending' -> 'objectWithMultipleParents' -> 'parentA' -> () From: ( | {
         'ModuleInfo: Module: languageTests InitialContents: FollowSlot'
        
         h = -50.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'resending' -> 'objectWithMultipleParents' -> 'parentA' -> () From: ( | {
         'ModuleInfo: Module: languageTests InitialContents: FollowSlot'
        
         j = ( |
            | resend.j).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'resending' -> 'objectWithMultipleParents' -> 'parentA' -> () From: ( | {
         'ModuleInfo: Module: languageTests InitialContents: FollowSlot'
        
         parentA* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'tests' -> 'resending' -> 'objectWithMultipleParents' -> 'parentA' -> 'parentA' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals tests resending objectWithMultipleParents parentA parentA.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'resending' -> 'objectWithMultipleParents' -> 'parentA' -> 'parentA' -> () From: ( | {
         'ModuleInfo: Module: languageTests InitialContents: FollowSlot'
        
         f = ( |
            | 30).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'resending' -> 'objectWithMultipleParents' -> 'parentA' -> 'parentA' -> () From: ( | {
         'ModuleInfo: Module: languageTests InitialContents: FollowSlot'
        
         j = ( |
            | 72).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'resending' -> 'objectWithMultipleParents' -> () From: ( | {
         'ModuleInfo: Module: languageTests InitialContents: FollowSlot'
        
         sharedGrandparent = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'tests' -> 'resending' -> 'objectWithMultipleParents' -> 'sharedGrandparent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals tests resending objectWithMultipleParents sharedGrandparent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'resending' -> 'objectWithMultipleParents' -> 'parentA' -> () From: ( | {
         'ModuleInfo: Module: languageTests InitialContents: FollowSlot'
        
         sharedParent* = bootstrap stub -> 'globals' -> 'tests' -> 'resending' -> 'objectWithMultipleParents' -> 'sharedGrandparent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'resending' -> 'objectWithMultipleParents' -> () From: ( | {
         'ModuleInfo: Module: languageTests InitialContents: FollowSlot'
        
         parentB* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'tests' -> 'resending' -> 'objectWithMultipleParents' -> 'parentB' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals tests resending objectWithMultipleParents parentB.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'resending' -> 'objectWithMultipleParents' -> 'parentB' -> () From: ( | {
         'ModuleInfo: Module: languageTests InitialContents: FollowSlot'
        
         e = ( |
            | 20).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'resending' -> 'objectWithMultipleParents' -> 'parentB' -> () From: ( | {
         'ModuleInfo: Module: languageTests InitialContents: FollowSlot'
        
         f = ( |
            | -30).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'resending' -> 'objectWithMultipleParents' -> 'parentB' -> () From: ( | {
         'ModuleInfo: Module: languageTests InitialContents: InitializeToExpression: (50)'
        
         h <- 50.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'resending' -> 'objectWithMultipleParents' -> 'parentB' -> () From: ( | {
         'ModuleInfo: Module: languageTests InitialContents: FollowSlot'
        
         j = ( |
            | resend.j).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'resending' -> 'objectWithMultipleParents' -> 'parentB' -> () From: ( | {
         'ModuleInfo: Module: languageTests InitialContents: FollowSlot'
        
         parentB* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'tests' -> 'resending' -> 'objectWithMultipleParents' -> 'parentB' -> 'parentB' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals tests resending objectWithMultipleParents parentB parentB.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'resending' -> 'objectWithMultipleParents' -> 'parentB' -> 'parentB' -> () From: ( | {
         'ModuleInfo: Module: languageTests InitialContents: FollowSlot'
        
         j = ( |
            | 73).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'resending' -> 'objectWithMultipleParents' -> 'parentB' -> () From: ( | {
         'ModuleInfo: Module: languageTests InitialContents: FollowSlot'
        
         sharedParent* = bootstrap stub -> 'globals' -> 'tests' -> 'resending' -> 'objectWithMultipleParents' -> 'sharedGrandparent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'resending' -> 'objectWithMultipleParents' -> 'sharedGrandparent' -> () From: ( | {
         'ModuleInfo: Module: languageTests InitialContents: FollowSlot'
        
         c = 10.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'resending' -> 'objectWithMultipleParents' -> 'sharedGrandparent' -> () From: ( | {
         'ModuleInfo: Module: languageTests InitialContents: FollowSlot'
        
         d = ( |
            | -10).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'resending' -> 'objectWithMultipleParents' -> 'sharedGrandparent' -> () From: ( | {
         'ModuleInfo: Module: languageTests InitialContents: FollowSlot'
        
         f = ( |
            | 
            -35).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'resending' -> 'objectWithMultipleParents' -> 'sharedGrandparent' -> () From: ( | {
         'ModuleInfo: Module: languageTests InitialContents: FollowSlot'
        
         g = ( |
            | 40).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'resending' -> 'objectWithMultipleParents' -> 'sharedGrandparent' -> () From: ( | {
         'ModuleInfo: Module: languageTests InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'clonable' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'resending' -> () From: ( | {
         'ModuleInfo: Module: languageTests InitialContents: FollowSlot\x7fVisibility: private'
        
         objectWithSingleParent = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'tests' -> 'resending' -> 'objectWithSingleParent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals tests resending objectWithSingleParent.
\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'resending' -> 'objectWithSingleParent' -> () From: ( | {
         'ModuleInfo: Module: languageTests InitialContents: FollowSlot'
        
         a = ( |
            | resend.a _IntAdd: 1).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'resending' -> 'objectWithSingleParent' -> () From: ( | {
         'ModuleInfo: Module: languageTests InitialContents: FollowSlot'
        
         b = ( |
            | resend.b _IntAdd: 1).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'resending' -> 'objectWithSingleParent' -> () From: ( | {
         'ModuleInfo: Module: languageTests InitialContents: FollowSlot'
        
         d = ( |
            | resend.e _IntAdd: 1).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'resending' -> 'objectWithSingleParent' -> () From: ( | {
         'ModuleInfo: Module: languageTests InitialContents: InitializeToExpression: (-30)'
        
         e <- -30.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'resending' -> 'objectWithSingleParent' -> () From: ( | {
         'ModuleInfo: Module: languageTests InitialContents: FollowSlot'
        
         g = -40.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'resending' -> 'objectWithSingleParent' -> () From: ( | {
         'ModuleInfo: Module: languageTests InitialContents: FollowSlot'
        
         h = ( |
            | resend.h _IntAdd: 1).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'resending' -> 'objectWithSingleParent' -> () From: ( | {
         'ModuleInfo: Module: languageTests InitialContents: FollowSlot'
        
         i = ( |
            | true ifTrue: [[[[resend.i _IntAdd: 1] value] value] value] False: [-60]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'resending' -> 'objectWithSingleParent' -> () From: ( | {
         'ModuleInfo: Module: languageTests InitialContents: FollowSlot'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'tests' -> 'resending' -> 'objectWithSingleParent' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals tests resending objectWithSingleParent parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'resending' -> 'objectWithSingleParent' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: languageTests InitialContents: FollowSlot'
        
         a = ( |
            | 
            0).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'resending' -> 'objectWithSingleParent' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: languageTests InitialContents: FollowSlot'
        
         c = ( |
            | resend.c _IntAdd: 1).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'resending' -> 'objectWithSingleParent' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: languageTests InitialContents: FollowSlot'
        
         d = -30.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'resending' -> 'objectWithSingleParent' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: languageTests InitialContents: FollowSlot'
        
         e = 30.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'resending' -> 'objectWithSingleParent' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: languageTests InitialContents: FollowSlot'
        
         f = ( |
            | resend.g _IntAdd: 1).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'resending' -> 'objectWithSingleParent' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: languageTests InitialContents: FollowSlot'
        
         g = -45.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'resending' -> 'objectWithSingleParent' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: languageTests InitialContents: FollowSlot'
        
         h = ( |
            | resend.h _IntAdd: 1).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'resending' -> 'objectWithSingleParent' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: languageTests InitialContents: FollowSlot'
        
         i = 60.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'resending' -> 'objectWithSingleParent' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: languageTests InitialContents: FollowSlot'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'tests' -> 'resending' -> 'objectWithSingleParent' -> 'parent' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals tests resending objectWithSingleParent parent parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'resending' -> 'objectWithSingleParent' -> 'parent' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: languageTests InitialContents: FollowSlot'
        
         a = ( |
            | 
            -1).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'resending' -> 'objectWithSingleParent' -> 'parent' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: languageTests InitialContents: FollowSlot'
        
         b = 10.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'resending' -> 'objectWithSingleParent' -> 'parent' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: languageTests InitialContents: InitializeToExpression: (20)'
        
         c <- 20.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'resending' -> 'objectWithSingleParent' -> 'parent' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: languageTests InitialContents: FollowSlot'
        
         g = ( |
            | 40).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'resending' -> 'objectWithSingleParent' -> 'parent' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: languageTests InitialContents: FollowSlot'
        
         h = ( |
            | 50).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'resending' -> 'objectWithSingleParent' -> 'parent' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: languageTests InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'clonable' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'resending' -> () From: ( | {
         'ModuleInfo: Module: languageTests InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'globals' -> 'tests' -> 'suite' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'resending' -> () From: ( | {
         'ModuleInfo: Module: languageTests InitialContents: FollowSlot\x7fVisibility: public'
        
         run = ( |
            | 
            testSimpleResend.
            testResendToGrandparent.
            testResendingMethodInParent.
            testResendingDifferentSelector.
            testResendingDifferentSelectorWithMethodInParent.
            testResendChain.
            testResendInsideBlocks.
            testUndirectedResendWithMultipleParents.
            testUndirectedResendToGrandparentThatCanBeReachedThroughTwoPaths.
            testUndirectedResendToTwoDifferentGrandparents.

            testDirectedResend1.
            testDirectedResend2.
            testDirectedResendChain.
            testDirectedResendToGrandparent.
            testDirectedResendInsideBlock.
            testDirectedResendToANonParent.

            testTwoObjectsInheritingTheSameMethodThatDoesAResend.

            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'resending' -> () From: ( | {
         'Category: tests\x7fModuleInfo: Module: languageTests InitialContents: FollowSlot\x7fVisibility: private'
        
         testDirectedResend1 = ( |
            | assert: objectWithMultipleParents d Is: 11).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'resending' -> () From: ( | {
         'Category: tests\x7fModuleInfo: Module: languageTests InitialContents: FollowSlot\x7fVisibility: private'
        
         testDirectedResend2 = ( |
            | assert: objectWithMultipleParents e Is: 21).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'resending' -> () From: ( | {
         'Category: tests\x7fModuleInfo: Module: languageTests InitialContents: FollowSlot\x7fVisibility: private'
        
         testDirectedResendChain = ( |
            | assert: objectWithMultipleParents f Is: 32).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'resending' -> () From: ( | {
         'Category: tests\x7fModuleInfo: Module: languageTests InitialContents: FollowSlot\x7fVisibility: private'
        
         testDirectedResendInsideBlock = ( |
            | assert: objectWithMultipleParents h Is: 51).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'resending' -> () From: ( | {
         'Category: tests\x7fModuleInfo: Module: languageTests InitialContents: FollowSlot\x7fVisibility: private'
        
         testDirectedResendToANonParent = ( |
            | assert: objectWithMultipleParents i Is: 61).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'resending' -> () From: ( | {
         'Category: tests\x7fModuleInfo: Module: languageTests InitialContents: FollowSlot\x7fVisibility: private'
        
         testDirectedResendToGrandparent = ( |
            | assert: objectWithMultipleParents g Is: 81).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'resending' -> () From: ( | {
         'Category: tests\x7fModuleInfo: Module: languageTests InitialContents: FollowSlot\x7fVisibility: private'
        
         testResendChain = ( |
            | assert: objectWithSingleParent h Is: 52).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'resending' -> () From: ( | {
         'Category: tests\x7fModuleInfo: Module: languageTests InitialContents: FollowSlot\x7fVisibility: private'
        
         testResendInsideBlocks = ( |
            | assert: objectWithSingleParent i Is: 61).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'resending' -> () From: ( | {
         'Category: tests\x7fModuleInfo: Module: languageTests InitialContents: FollowSlot\x7fVisibility: private'
        
         testResendToGrandparent = ( |
            | assert: objectWithSingleParent b Is: 11).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'resending' -> () From: ( | {
         'Category: tests\x7fModuleInfo: Module: languageTests InitialContents: FollowSlot\x7fVisibility: private'
        
         testResendingDifferentSelector = ( |
            | assert: objectWithSingleParent d Is: 31).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'resending' -> () From: ( | {
         'Category: tests\x7fModuleInfo: Module: languageTests InitialContents: FollowSlot\x7fVisibility: private'
        
         testResendingDifferentSelectorWithMethodInParent = ( |
            | assert: objectWithSingleParent f Is: 41).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'resending' -> () From: ( | {
         'Category: tests\x7fModuleInfo: Module: languageTests InitialContents: FollowSlot\x7fVisibility: private'
        
         testResendingMethodInParent = ( |
            | assert: objectWithSingleParent c Is: 21).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'resending' -> () From: ( | {
         'Category: tests\x7fModuleInfo: Module: languageTests InitialContents: FollowSlot\x7fVisibility: private'
        
         testSimpleResend = ( |
            | assert: objectWithSingleParent a Is: 1).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'resending' -> () From: ( | {
         'Category: tests\x7fModuleInfo: Module: languageTests InitialContents: FollowSlot\x7fVisibility: private'
        
         testTwoObjectsInheritingTheSameMethodThatDoesAResend = ( |
            | 
            assert: objectThatInheritsTheSameMethodThatDoesAResend1 aardvark Is: 4.
            assert: objectThatInheritsTheSameMethodThatDoesAResend2 aardvark Is: 4.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'resending' -> () From: ( | {
         'Category: tests\x7fModuleInfo: Module: languageTests InitialContents: FollowSlot\x7fVisibility: private'
        
         testUndirectedResendToGrandparentThatCanBeReachedThroughTwoPaths = ( |
            | assert: objectWithMultipleParents c Is: 11).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'resending' -> () From: ( | {
         'Category: tests\x7fModuleInfo: Module: languageTests InitialContents: FollowSlot\x7fVisibility: private'
        
         testUndirectedResendToTwoDifferentGrandparents = ( |
            | assert: objectWithMultipleParents j Is: 146).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'resending' -> () From: ( | {
         'Category: tests\x7fModuleInfo: Module: languageTests InitialContents: FollowSlot\x7fVisibility: private'
        
         testUndirectedResendWithMultipleParents = ( |
            | assert: objectWithMultipleParents a Is: 1).
        } | ) 



 '-- Side effects'

 globals modules languageTests postFileIn
