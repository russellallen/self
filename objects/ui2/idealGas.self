 '$Revision: 30.7 $'
 '
Copyright 1992-2012 AUTHORS.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: ui2\x7fCategory: Examples\x7fComment: A circle with velocity. For use
in simulations-- Randy, 2/11/95\x7fModuleInfo: Module: idealGas InitialContents: FollowSlot\x7fVisibility: public'
        
         atom = bootstrap define: bootstrap stub -> 'globals' -> 'atom' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             bootstrap remove: 'prototype' From:
             bootstrap remove: 'rawBox' From:
             bootstrap remove: 'rawColor' From:
             globals morph copyRemoveAllMorphs ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'atom' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals atom.

CopyDowns:
globals morph. copyRemoveAllMorphs 
SlotsToOmit: parent prototype rawBox rawColor.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'atom' -> () From: ( | {
         'ModuleInfo: Module: idealGas InitialContents: FollowSlot\x7fVisibility: public'
        
         center <- (2044)@(865).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'atom' -> () From: ( | {
         'ModuleInfo: Module: idealGas InitialContents: FollowSlot\x7fVisibility: public'
        
         initializePrototype = ( |
             hilite.
            | 
            removeAllMorphs.
            hilite: polygonMorph copy.
            hilite vertices: ((0 @ 0) & (3 @ -6) & (9 @ -9)) asList.
            hilite globalPosition: globalPosition + ( -8 @ 0).
            hilite color: paint copyRed: 0.78 Green: 1.0  Blue: 0.77 .
            addMorph: hilite.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'atom' -> () From: ( | {
         'ModuleInfo: Module: idealGas InitialContents: InitializeToExpression: (10)\x7fVisibility: public'
        
         mass <- 10.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'atom' -> () From: ( | {
         'ModuleInfo: Module: idealGas InitialContents: FollowSlot\x7fVisibility: public'
        
         morphTypeName = 'atom'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: ui2\x7fCategory: Examples\x7fModuleInfo: Module: idealGas InitialContents: FollowSlot'
        
         atom = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'atom' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits atom.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'atom' -> () From: ( | {
         'ModuleInfo: Module: idealGas InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap stub -> 'traits' -> 'atom' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'atom' -> () From: ( | {
         'ModuleInfo: Module: idealGas InitialContents: FollowSlot\x7fVisibility: public'
        
         radius <- 12.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'atom' -> () From: ( | {
         'ModuleInfo: Module: idealGas InitialContents: FollowSlot\x7fVisibility: public'
        
         rawColor <- paint named: 'leaf'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'atom' -> () From: ( | {
         'ModuleInfo: Module: idealGas InitialContents: FollowSlot\x7fVisibility: public'
        
         velocity <- (1)@(1).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: ui2\x7fCategory: Examples\x7fComment: For use in an ideal gas demo. Simply
holds atoms and moves them around.
  -- Randy, 2/11/95\x7fModuleInfo: Module: idealGas InitialContents: FollowSlot\x7fVisibility: public'
        
         gasTank = bootstrap define: bootstrap stub -> 'globals' -> 'gasTank' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             bootstrap remove: 'prototype' From:
             globals simpleFrameMorph copyRemoveAllMorphs ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'gasTank' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals gasTank.

CopyDowns:
globals simpleFrameMorph. copyRemoveAllMorphs 
SlotsToOmit: parent prototype.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'gasTank' -> () From: ( | {
         'Comment: add an atom to this tank,
random size, position, & velocity.
-- Randy, 2/11/95\x7fModuleInfo: Module: idealGas InitialContents: FollowSlot\x7fVisibility: public'
        
         addAnAtom = ( |
             a.
            | 
            a: atom copy.
            a radius: (9 + (random integer: 5)).
            a velocity: ((random integer: 6) @ (random integer: 6)) + (1@1).
            a globalPosition: 
                 globalBaseBounds origin + 
                 (borderWidth@borderWidth) + (a radius @ a radius) +
                 ((random integer: innerBounds width - (a radius * 2) ) @ 
                  (random integer: innerBounds height- (a radius * 2) )).
            addMorph: a.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'gasTank' -> () From: ( | {
         'Comment: How much of an atom\'s momentum is retained
in a wall collision. -- Randy, 2/11/95\x7fModuleInfo: Module: idealGas InitialContents: InitializeToExpression: (100)\x7fVisibility: public'
        
         frictionPercentage <- 100.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'gasTank' -> () From: ( | {
         'Comment: A bollean: is the simulation going?
-- Randy, 6/22/95\x7fModuleInfo: Module: idealGas InitialContents: InitializeToExpression: (false.)\x7fVisibility: public'
        
         isRunning <- bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'gasTank' -> () From: ( | {
         'Comment: There are 2 different methods that move the atoms, in order to
make things look just right (baseDrawOn: and drawShadowOn:). This boolean
records weather or not this has been done.-- Randy, 6/22/95\x7fModuleInfo: Module: idealGas InitialContents: InitializeToExpression: (false)\x7fVisibility: public'
        
         movedAtoms <- bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'gasTank' -> () From: ( | {
         'Comment: used to keep track in change of
size across steps\x7fModuleInfo: Module: idealGas InitialContents: InitializeToExpression: (rectangle copy)\x7fVisibility: public'
        
         oldGBBounds <- rectangle copy.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: ui2\x7fCategory: Examples\x7fModuleInfo: Module: idealGas InitialContents: FollowSlot'
        
         gasTank = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'gasTank' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits gasTank.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'gasTank' -> () From: ( | {
         'ModuleInfo: Module: idealGas InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap stub -> 'traits' -> 'gasTank' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'gasTank' -> () From: ( | {
         'Comment: remove one of the atoms.
  -- Randy, 2/11/95\x7fModuleInfo: Module: idealGas InitialContents: FollowSlot\x7fVisibility: public'
        
         removeAnAtom = ( |
             atoms.
            | 
            atoms: (morphs asList copyFilteredBy: [ | :m | m morphTypeName = 'atom']).
            atoms isEmpty ifTrue: [ ^ self ].
            atoms last delete.
            changed. "Reports the need to redraw"
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'gasTank' -> () From: ( | {
         'Comment: Start the simulation running.-- Randy, 6/22/95\x7fModuleInfo: Module: idealGas InitialContents: FollowSlot\x7fVisibility: public'
        
         start = ( |
            | 
            isRunning: true.
            startGettingStepped.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'gasTank' -> () From: ( | {
         'Comment: step is a special message because
startGettingStepped or getSteppedEveryMSecs: mSecs
   will cause step
to be sent repeatedly by the UI.
  -- Randy, 2/11/95\x7fModuleInfo: Module: idealGas InitialContents: FollowSlot\x7fVisibility: public'
        
         step = ( |
            | 

            changed. 
            "...Changed causes graphics damage region
            to be reported, generating a draw message
            at appropriate time. See baseDrawOn:  method.
             Normally this step method is more
            direct about causing an incremental change, but due to
            subtle synchronization issues, the atomic motion
            is all done at draw time."
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'gasTank' -> () From: ( | {
         'Comment: Stop the simulation from running.
-- Randy, 6/22/95\x7fModuleInfo: Module: idealGas InitialContents: FollowSlot\x7fVisibility: public'
        
         stop = ( |
            | 
            isRunning: false. 
            stopGettingStepped.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'gasTank' -> () From: ( | {
         'Comment: Represents the energy the walls of the gas tank.
Think of it as the energy of an average atom in the
walls. It can be transferred to an atom on collision, 
or can gain energy from indiviadual atoms. -- Randy, 6/22/95\x7fModuleInfo: Module: idealGas InitialContents: InitializeToExpression: (100.)\x7fVisibility: public'
        
         wallEnergy <- 100.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: idealGas InitialContents: FollowSlot'
        
         idealGas = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'idealGas' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'idealGas' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules idealGas.

CopyDowns:
globals modules init. copy 
SlotsToOmit: directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'idealGas' -> () From: ( | {
         'ModuleInfo: Module: idealGas InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'ui2'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'idealGas' -> () From: ( | {
         'ModuleInfo: Module: idealGas InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'idealGas' -> () From: ( | {
         'ModuleInfo: Module: idealGas InitialContents: FollowSlot'
        
         myComment <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'idealGas' -> () From: ( | {
         'ModuleInfo: Module: idealGas InitialContents: FollowSlot'
        
         postFileIn = ( |
            | 
            resend.postFileIn.
            atom initializePrototype).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'idealGas' -> () From: ( | {
         'ModuleInfo: Module: idealGas InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- '$Revision: 30.7 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'idealGas' -> () From: ( | {
         'ModuleInfo: Module: idealGas InitialContents: FollowSlot\x7fVisibility: private'
        
         subpartNames <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'atom' -> () From: ( | {
         'Comment: The kinetic energy of the atom.
-- Randy, 6/22/95\x7fModuleInfo: Module: idealGas InitialContents: FollowSlot\x7fVisibility: public'
        
         energy = ( |
            | (mass * (velocity x square + velocity y square))/2).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'atom' -> () From: ( | {
         'ModuleInfo: Module: idealGas InitialContents: FollowSlot'
        
         initializePrototype = ( |
             hilite.
            | 
            removeAllMorphs.
            hilite: polygonMorph copy.
            hilite vertices: ((0@0) & (3@ -6) & (9@ -9)) asList.
            hilite globalPosition: globalPosition + ( -8 @ 0).
            hilite color: paint copyRed: 0.78 Green: 1.0  Blue: 0.77 .
            addMorph: hilite.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'atom' -> () From: ( | {
         'ModuleInfo: Module: idealGas InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'circleMorph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'gasTank' -> () From: ( | {
         'Comment: add an atom to this tank,
random size, position, & velocity.
-- Randy, 2/11/95\x7fModuleInfo: Module: idealGas InitialContents: FollowSlot\x7fVisibility: public'
        
         addAnAtom = ( |
             a.
            | 
            a: atom copy.
            a radius: (9 + (random integer: 5)).
            a velocity: ((random integer: 6) @ (random integer: 6)) + (1@1).
            a globalPosition: 
                 globalBaseBounds origin + 
                 (borderWidth@borderWidth) + (a radius @ a radius) +
                 ((random integer: innerBounds width - (a radius * 2) ) @ 
                  (random integer: innerBounds height- (a radius * 2) )).
            addMorph: a.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'gasTank' -> () From: ( | {
         'Comment: Only those submorphs that are atoms.
-- Randy, 2/13/95\x7fModuleInfo: Module: idealGas InitialContents: FollowSlot\x7fVisibility: public'
        
         atoms = ( |
            | 
            morphs asList copyFilteredBy: [ | :m | m morphTypeName = 'atom']).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'gasTank' -> () From: ( | {
         'ModuleInfo: Module: idealGas InitialContents: FollowSlot\x7fVisibility: public'
        
         baseDrawOn: c = ( |
            | 
            "When the shadow is drawn, the atoms get moved there.
            Hence the test on movedAtoms"
            movedAtoms not && [isRunning] ifTrue: [moveAtoms.].
            oldGBBounds: globalBaseBounds.
            resend.baseDrawOn: c.
            movedAtoms: false).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'gasTank' -> () From: ( | {
         'ModuleInfo: Module: idealGas InitialContents: FollowSlot\x7fVisibility: public'
        
         drawShadowOn: shadowC = ( |
            | 
            "Overrides the inherited method which calls
            baseDrawOn.  That method is used in this object to move the
            atoms, and we don't want the atoms moved twice.
            Also must move the atoms here if running. Set the
            flag (movedAtoms) to communicate with baseDrawOn so 
            it knows not to move them.  It will be called in a moment."
            movedAtoms not && [isRunning] ifTrue: [moveAtoms. movedAtoms: true].
            isRectangular && noStickOuts ifTrue: [
                shadowC fillRectangle: baseBounds Color: shadowColor.
            ] False: [
                resend.baseDrawOn: shadowC.  "...This is the change."
                0 = morphCount ifFalse: [| c |
                    c: (shadowC copyOffset: position).
                    morphsReverseDo: [| :m | m drawShadowOn: c ].
                ].
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'gasTank' -> () From: ( | {
         'ModuleInfo: Module: idealGas InitialContents: FollowSlot'
        
         innerBounds = ( |
            | (borderWidth@borderWidth) # (baseBounds size - (2*borderWidth))).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'gasTank' -> () From: ( | {
         'ModuleInfo: Module: idealGas InitialContents: FollowSlot'
        
         morphTypeName = 'gasTank'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'gasTank' -> () From: ( | {
         'Comment: Move the argument, reflecting off
a wall if necessary.
    -- Randy, 2/11/95\x7fModuleInfo: Module: idealGas InitialContents: FollowSlot\x7fVisibility: public'
        
         moveAtom: m = ( |
            | 
            m position: (m position + m velocity)  - (globalPosition - oldGBBounds origin).

            (m bounds top    < innerBounds top)    ifTrue: [ | wallVy . oldE . f |
               oldE: m energy.
               wallVy:  (globalBaseBounds top - oldGBBounds top).
               m position: m position x @ (innerBounds bottom - m radius min: (m position y +
                               (2 * (innerBounds top - m bounds top)))).
               f: frictionPercentage / 100.0 .
               m velocity:  (m velocity x * f )@ ((wallVy + wallVy + m velocity y absoluteValue  ) * f) .
               "wallEnergy: wallEnergy + (oldE - m energy)."
            ].
            (m bounds bottom > innerBounds bottom) ifTrue: [ | wallVy.  oldE . f |
               oldE: m energy.
               wallVy:  (globalBaseBounds bottom - oldGBBounds bottom).
               m position: m position x @ (innerBounds top + m radius max: (m position y -
                               (2 * (m bounds bottom - innerBounds bottom)))).
               f: frictionPercentage / 100.0 .
               m velocity: (m velocity x * f )@ ((wallVy + wallVy + m velocity y absoluteValue  negate) * f).
               "wallEnergy: wallEnergy + (oldE - m energy)."
            ].
            (m bounds left  < innerBounds left)    ifTrue: [ | wallVx . oldE . f |
               oldE: m energy.
               wallVx: (globalBaseBounds left - oldGBBounds left).
               m position: (innerBounds right - m radius min: (m position x +
                               (2 * (innerBounds left - m bounds left)))) @
                                  m position y.
               f: frictionPercentage / 100.0 .
               m velocity: ( (wallVx + wallVx + m velocity x absoluteValue) * f )@ (m velocity y * f).
               "wallEnergy: wallEnergy + (oldE - m energy)."
            ].
            (m bounds right > innerBounds right)   ifTrue: [ | wallVx . oldE . f |
               oldE: m energy.
               wallVx: (globalBaseBounds right - oldGBBounds right).
               m position: (innerBounds left + m radius max: (m position x -
                               (2 * (m bounds right - innerBounds right)))) @
                                  m position y.
               f: frictionPercentage / 100.0 .
               m velocity: ( (wallVx + wallVx + m velocity x absoluteValue negate) * f )@ (m velocity y *f) .
               "wallEnergy: wallEnergy + (oldE - m energy)."
            ].

            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'gasTank' -> () From: ( | {
         'ModuleInfo: Module: idealGas InitialContents: FollowSlot'
        
         moveAtoms = ( |
            | 
            morphs do: [ | :m | 
              m morphTypeName = 'atom' ifTrue: [
                moveAtom: m.
              ].
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'gasTank' -> () From: ( | {
         'ModuleInfo: Module: idealGas InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'simpleFrameMorph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'gasTank' -> () From: ( | {
         'Comment: remove one of the atoms.
  -- Randy, 2/11/95\x7fModuleInfo: Module: idealGas InitialContents: FollowSlot\x7fVisibility: public'
        
         removeAnAtom = ( |
             atoms.
            | 
            atoms: (morphs asList copyFilteredBy: [ | :m | m morphTypeName = 'atom']).
            atoms isEmpty ifTrue: [ ^ self ].
            atoms last delete.
            changed. "Reports the need to redraw"
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'gasTank' -> () From: ( | {
         'Comment: Start the simulation running.-- Randy, 6/22/95\x7fModuleInfo: Module: idealGas InitialContents: FollowSlot\x7fVisibility: public'
        
         start = ( |
            | 
            isRunning: true.
            startGettingStepped.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'gasTank' -> () From: ( | {
         'Comment: step is a special message because
startGettingStepped or getSteppedEveryMSecs: mSecs
   will cause step
to be sent repeatedly by the UI.
  -- Randy, 2/11/95\x7fModuleInfo: Module: idealGas InitialContents: FollowSlot\x7fVisibility: public'
        
         step = ( |
            | 

            changed. 
            "...Changed causes graphics damage region
            to be reported, generating a draw message
            at appropriate time. See baseDrawOn:  method.
             Normally this step method is more
            direct about causing an incremental change, but due to
            subtle synchronization issues, the atomic motion
            is all done at draw time."
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'gasTank' -> () From: ( | {
         'Comment: Stop the simulation from running.
-- Randy, 6/22/95\x7fModuleInfo: Module: idealGas InitialContents: FollowSlot\x7fVisibility: public'
        
         stop = ( |
            | 
            isRunning: false. 
            stopGettingStepped.
            self).
        } | ) 



 '-- Side effects'

 globals modules idealGas postFileIn
