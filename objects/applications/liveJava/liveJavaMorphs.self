 '$Revision: 1.2 $'
 '
Copyright 1992-2012 AUTHORS.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'liveJava' -> () From: ( | {
         'Category: tools\x7fCategory: testing\x7fModuleInfo: Module: liveJavaMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         selfToJavaTesterMorph = bootstrap define: bootstrap stub -> 'globals' -> 'liveJava' -> 'selfToJavaTesterMorph' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             bootstrap remove: 'prototype' From:
             globals abstractSimpleApplicationMorph copyRemoveAllMorphs ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'liveJava' -> 'selfToJavaTesterMorph' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals liveJava selfToJavaTesterMorph.

CopyDowns:
globals abstractSimpleApplicationMorph. copyRemoveAllMorphs 
SlotsToOmit: parent prototype.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'liveJava' -> 'selfToJavaTesterMorph' -> () From: ( | {
         'ModuleInfo: Module: liveJavaMorphs InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'liveJava' -> 'selfToJavaTesterMorph' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals liveJava selfToJavaTesterMorph parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'liveJava' -> 'selfToJavaTesterMorph' -> 'parent' -> () From: ( | {
         'Category: menuing\x7fModuleInfo: Module: liveJavaMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         addButtonsToMenu: menu = ( |
            | 
            addDuplicateButtonTo: menu.
            menu addButtonTarget: self
              AsynchronousScriptBlock: [ liveJava selfToJavaTester testAll ] 
              Label: 'Test All'.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'liveJava' -> 'selfToJavaTesterMorph' -> 'parent' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: liveJavaMorphs InitialContents: FollowSlot'
        
         addLabelIfNeeded = ( |
            | addLabel).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'liveJava' -> 'selfToJavaTesterMorph' -> 'parent' -> () From: ( | {
         'Category: background menu\x7fModuleInfo: Module: liveJavaMorphs InitialContents: FollowSlot\x7fVisibility: private'
        
         backgroundMenuButtonLabel = 'Self to Java tester'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'liveJava' -> 'selfToJavaTesterMorph' -> 'parent' -> () From: ( | {
         'Category: menuing\x7fModuleInfo: Module: liveJavaMorphs InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         defaultButtonHolder <- bootstrap stub -> 'globals' -> 'nil' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'liveJava' -> 'selfToJavaTesterMorph' -> 'parent' -> () From: ( | {
         'Category: style\x7fModuleInfo: Module: liveJavaMorphs InitialContents: FollowSlot\x7fVisibility: private'
        
         defaultColor = paint copyRed: 0.352884 Green: 0.863148  Blue: 0.814272.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'liveJava' -> 'selfToJavaTesterMorph' -> 'parent' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: liveJavaMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         morphTypeName = 'selfToJavaTesterMorph'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'liveJava' -> 'selfToJavaTesterMorph' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: liveJavaMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap stub -> 'globals' -> 'abstractSimpleApplicationMorph' -> 'parent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'liveJava' -> 'selfToJavaTesterMorph' -> 'parent' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: liveJavaMorphs InitialContents: FollowSlot'
        
         titleString = 'Self to Java tester'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'liveJava' -> 'selfToJavaTesterMorph' -> () From: ( | {
         'Category: filing out\x7fModuleInfo: Module: liveJavaMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         prototype = ( |
            | 
            liveJava selfToJavaTesterMorph).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: liveJavaMorphs InitialContents: FollowSlot'
        
         liveJavaMorphs = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'liveJavaMorphs' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'liveJavaMorphs' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules liveJavaMorphs.

CopyDowns:
globals modules init. copy 
SlotsToOmit: directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'liveJavaMorphs' -> () From: ( | {
         'ModuleInfo: Module: liveJavaMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'applications/liveJava'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'liveJavaMorphs' -> () From: ( | {
         'ModuleInfo: Module: liveJavaMorphs InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'liveJavaMorphs' -> () From: ( | {
         'ModuleInfo: Module: liveJavaMorphs InitialContents: FollowSlot'
        
         myComment <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'liveJavaMorphs' -> () From: ( | {
         'ModuleInfo: Module: liveJavaMorphs InitialContents: FollowSlot'
        
         postFileIn = ( |
            | 
             resend.postFileIn.
            (vector copyAddLast: liveJava selfToJavaTesterMorph)
             do: [|:m|
              m initializePrototype.
              worldMorph addBackgroundMenuContributor: m.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'liveJavaMorphs' -> () From: ( | {
         'ModuleInfo: Module: liveJavaMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- '$Revision: 1.2 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'liveJavaMorphs' -> () From: ( | {
         'ModuleInfo: Module: liveJavaMorphs InitialContents: FollowSlot\x7fVisibility: private'
        
         subpartNames <- ''.
        } | ) 



 '-- Side effects'

 globals modules liveJavaMorphs postFileIn
