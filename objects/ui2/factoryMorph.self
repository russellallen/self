 '$Revision: 30.8 $'
 '
Copyright 1992-2012 AUTHORS.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: graphical interface\x7fCategory: ui2\x7fCategory: Programming Environment\x7fCategory: Widgets\x7fModuleInfo: Module: factoryMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         factoryMorph = bootstrap define: bootstrap stub -> 'globals' -> 'factoryMorph' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'looksHollow' From:
             bootstrap remove: 'parent' From:
             bootstrap remove: 'prototype' From:
             globals simpleFrameMorph copyRemoveAllMorphs ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'factoryMorph' -> () From: ( |
             {} = 'Comment: A factoryMorph is a simple frame.  
If you use the left mouse button to pick a submorph up,
a copy is attached to the hand.
Useful for making copies of things.\x7fModuleInfo: Creator: globals factoryMorph.

CopyDowns:
globals simpleFrameMorph. copyRemoveAllMorphs 
SlotsToOmit: looksHollow parent prototype.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'factoryMorph' -> () From: ( | {
         'Category: Frame Morph State\x7fModuleInfo: Module: factoryMorph InitialContents: InitializeToExpression: (false)\x7fVisibility: public'
        
         looksHollow <- bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: graphical interface\x7fCategory: ui2\x7fCategory: Programming Environment\x7fCategory: Widgets\x7fModuleInfo: Module: factoryMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         factoryMorph = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'factoryMorph' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits factoryMorph.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'factoryMorph' -> () From: ( | {
         'ModuleInfo: Module: factoryMorph InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'factoryMorph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'factoryMorph' -> () From: ( | {
         'Category: filing out\x7fModuleInfo: Module: factoryMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         prototype = ( |
            | 
            factoryMorph).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: factoryMorph InitialContents: FollowSlot'
        
         factoryMorph = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'factoryMorph' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'comment' From:
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'factoryMorph' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules factoryMorph.

CopyDowns:
globals modules init. copy 
SlotsToOmit: comment directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'factoryMorph' -> () From: ( | {
         'ModuleInfo: Module: factoryMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'ui2'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'factoryMorph' -> () From: ( | {
         'ModuleInfo: Module: factoryMorph InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'factoryMorph' -> () From: ( | {
         'ModuleInfo: Module: factoryMorph InitialContents: FollowSlot'
        
         myComment <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'factoryMorph' -> () From: ( | {
         'ModuleInfo: Module: factoryMorph InitialContents: FollowSlot'
        
         postFileIn = ( |
            | 
            resend.postFileIn.
            "Can't use at:PutContents: because module cache is not ready
             during bootstrapping"
            factoryMorph standardFactory: bootstrap read: 'factory' From: 'ui2'.
            worldMorph addBackgroundMenuContributor: factoryMorph).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'factoryMorph' -> () From: ( | {
         'ModuleInfo: Module: factoryMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- '$Revision: 30.8 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'factoryMorph' -> () From: ( | {
         'ModuleInfo: Module: factoryMorph InitialContents: FollowSlot\x7fVisibility: private'
        
         subpartNames <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'factoryMorph' -> () From: ( | {
         'Comment: Wrap the morph in an inset frame.\x7fModuleInfo: Module: factoryMorph InitialContents: FollowSlot\x7fVisibility: private'
        
         addDroppingMorph: m Event: e = ( |
             f.
             mm.
            | 
            "Wrap m in an inset frame and embed into the factory.
             Finagle a bit to make the frame the right size but rigid.
             The idea is to not disturb the layout of m. -- dmu "

            mm: morph copy.
            mm setWidth: m baseBounds width Height: m baseBounds height.
            f: frameMorph copy.
            f color: color.
            f frameStyle: insetBezelStyle.

            f beShrinkWrap.
            f addMorph: mm.
            f position: maxSmallInt half @ 0.
            world safelyDo: [ world addMorph: f. f layoutChanged. f beRigid. f delete].
            mm delete.

            f globalPosition: m globalPosition - f borderWidth.
            resend.addDroppingMorph: ( f addMorph: m )
                              Event: e).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'factoryMorph' -> () From: ( | {
         'Comment: Only left mouse down doesn\'t get through.\x7fModuleInfo: Module: factoryMorph InitialContents: FollowSlot\x7fVisibility: private'
        
         allowSubmorphsToGetEvent: evt = ( |
            | 
            evt leftMouseDown not).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'factoryMorph' -> () From: ( | {
         'ModuleInfo: Module: factoryMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         contributeToBackgroundMenu: m = ( |
             b.
            | 
            b:  ui2Button copy scriptBlock: [| foo |
                                               foo: factoryMorph standardFactory copy.
                                               foo globalPosition: minSmallInt@minSmallInt. 
                                               target addMorph: foo.
                                               foo popUpInWindow
            ].
            b label: 'Open factory window'.
            b isAsynchronous: true.
            m addButton: b ToGroup: 'builtInMorphs'.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'factoryMorph' -> () From: ( | {
         'ModuleInfo: Module: factoryMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         isFactoryMorph = bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'factoryMorph' -> () From: ( | {
         'Comment: The left button copies the top-most submorph (if any).
Otherwise it just picks the entire morph up.\x7fModuleInfo: Module: factoryMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         leftMouseDown: evt = ( |
             l.
            | 
            l: (morphsAt: evt cursorPoint) asVector.
            evt sourceHand addMorph:
              (l size < 2
                ifTrue: [rootForGrab]
                 False: [| t |
                   t: topMorph: (l at: l lastKey pred).
                   "If the top morph has submorphs, assume it's a frame
                    (see addDroppingMorph:Event:)"
                   (t morphCount = 0 ifTrue: [t] False: [t morphs first]) copy
                 ]
              ).
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'factoryMorph' -> () From: ( | {
         'ModuleInfo: Module: factoryMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         morphTypeName = 'factoryMorph'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'factoryMorph' -> () From: ( | {
         'ModuleInfo: Module: factoryMorph InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'simpleFrameMorph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'factoryMorph' -> () From: ( | {
         'ModuleInfo: Module: factoryMorph InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         standardFactory <- bootstrap stub -> 'globals' -> 'nil' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'factoryMorph' -> () From: ( | {
         'Comment: Find the most distant owner of m that is still below me.\x7fModuleInfo: Module: factoryMorph InitialContents: FollowSlot\x7fVisibility: private'
        
         topMorph: m = ( |
             last.
             this.
            | 
            this: m.
            [last: this.
             this: this owner.
             != this
            ] whileTrue.
            last).
        } | ) 



 '-- Side effects'

 globals modules factoryMorph postFileIn
