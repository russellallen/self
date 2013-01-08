 'Sun-$Revision: 30.8 $'
 '
Copyright 1992-2012 AUTHORS.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: graphics\x7fCategory: animation\x7fModuleInfo: Module: inBetweener InitialContents: FollowSlot\x7fVisibility: public'
        
         inBetweenerTemplate = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'inBetweenerTemplate' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals inBetweenerTemplate.
\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'inBetweenerTemplate' -> () From: ( | {
         'ModuleInfo: Module: inBetweener InitialContents: FollowSlot\x7fVisibility: private'
        
         acceleration <- 1.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'inBetweenerTemplate' -> () From: ( | {
         'Comment: in msec\x7fModuleInfo: Module: inBetweener InitialContents: InitializeToExpression: (25)\x7fVisibility: public'
        
         delay <- 25.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'inBetweenerTemplate' -> () From: ( | {
         'ModuleInfo: Module: inBetweener InitialContents: FollowSlot\x7fVisibility: publicReadPrivateWrite'
        
         from <- 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'inBetweenerTemplate' -> () From: ( | {
         'ModuleInfo: Module: inBetweener InitialContents: InitializeToExpression: (time origin)\x7fVisibility: private'
        
         lastTime <- time origin.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: graphics\x7fCategory: animation\x7fModuleInfo: Module: inBetweener InitialContents: FollowSlot\x7fVisibility: public'
        
         inBetweener = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'inBetweener' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits inBetweener.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'inBetweenerTemplate' -> () From: ( | {
         'ModuleInfo: Module: inBetweener InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'inBetweener' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'inBetweenerTemplate' -> () From: ( | {
         'ModuleInfo: Module: inBetweener InitialContents: FollowSlot\x7fVisibility: publicReadPrivateWrite'
        
         position <- 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'inBetweener' -> () From: ( | {
         'ModuleInfo: Module: inBetweener InitialContents: FollowSlot\x7fVisibility: private'
        
         accelerate = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'inBetweener' -> 'accelerate' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits inBetweener accelerate.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'inBetweenerTemplate' -> () From: ( | {
         'ModuleInfo: Module: inBetweener InitialContents: FollowSlot\x7fVisibility: private'
        
         stepping* <- bootstrap stub -> 'traits' -> 'inBetweener' -> 'accelerate' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'inBetweenerTemplate' -> () From: ( | {
         'ModuleInfo: Module: inBetweener InitialContents: FollowSlot\x7fVisibility: private'
        
         steps <- 10.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'inBetweenerTemplate' -> () From: ( | {
         'ModuleInfo: Module: inBetweener InitialContents: FollowSlot\x7fVisibility: private'
        
         t <- 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'inBetweenerTemplate' -> () From: ( | {
         'ModuleInfo: Module: inBetweener InitialContents: FollowSlot\x7fVisibility: publicReadPrivateWrite'
        
         to <- 1.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'inBetweenerTemplate' -> () From: ( | {
         'ModuleInfo: Module: inBetweener InitialContents: FollowSlot\x7fVisibility: private'
        
         velocity <- 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'inBetweener' -> 'accelerate' -> () From: ( | {
         'ModuleInfo: Module: inBetweener InitialContents: FollowSlot\x7fVisibility: private'
        
         kinematics = ( |
            | velocity: acceleration + velocity.
            position: position + velocity.
            t:        t succ).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'inBetweener' -> 'accelerate' -> () From: ( | {
         'ModuleInfo: Module: inBetweener InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'inBetweener' -> 'accelerate' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits inBetweener accelerate parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'inBetweener' -> 'accelerate' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: inBetweener InitialContents: FollowSlot\x7fVisibility: public'
        
         isFinished = bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'inBetweener' -> 'accelerate' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: inBetweener InitialContents: FollowSlot\x7fVisibility: private'
        
         oneStep = ( |
            | 
            kinematics.
            t = steps ifTrue: [ t: 0. nextSegment value: self ]
                       False: [ self ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'inBetweener' -> () From: ( | {
         'ModuleInfo: Module: inBetweener InitialContents: FollowSlot\x7fVisibility: public'
        
         copyFrom: f To: t Steps: s = ( |
            | 
            ((copy from: f) to: t) setupForSteps: s).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'inBetweener' -> () From: ( | {
         'ModuleInfo: Module: inBetweener InitialContents: FollowSlot\x7fVisibility: private'
        
         decelerate = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'inBetweener' -> 'decelerate' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits inBetweener decelerate.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'inBetweener' -> 'decelerate' -> () From: ( | {
         'ModuleInfo: Module: inBetweener InitialContents: FollowSlot\x7fVisibility: private'
        
         kinematics = ( |
            | t:        t succ.
            position: position + velocity.
            velocity: velocity - acceleration).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'inBetweener' -> 'decelerate' -> () From: ( | {
         'ModuleInfo: Module: inBetweener InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'inBetweener' -> 'accelerate' -> 'parent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'inBetweener' -> () From: ( | {
         'ModuleInfo: Module: inBetweener InitialContents: FollowSlot\x7fVisibility: public'
        
         do: b = ( |
            | 
            b value: value.
            [b value: step value] untilTrue: [isFinished].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'inBetweener' -> () From: ( | {
         'Comment: _\x7fModuleInfo: Module: inBetweener InitialContents: FollowSlot'
        
         mainEnginesOff = ( |
            | position: to. t: steps. stepping: stayPut).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'inBetweener' -> () From: ( | {
         'ModuleInfo: Module: inBetweener InitialContents: FollowSlot\x7fVisibility: private'
        
         mainEnginesOffBlock = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'inBetweener' -> 'mainEnginesOffBlock' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits inBetweener mainEnginesOffBlock.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'inBetweener' -> 'mainEnginesOffBlock' -> () From: ( | {
         'ModuleInfo: Module: inBetweener InitialContents: FollowSlot'
        
         value: rec = ( |
            | rec mainEnginesOff).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'inBetweener' -> () From: ( | {
         'ModuleInfo: Module: inBetweener InitialContents: FollowSlot\x7fVisibility: private'
        
         moving = bootstrap stub -> 'traits' -> 'inBetweener' -> 'accelerate' -> 'parent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'inBetweener' -> () From: ( | {
         'ModuleInfo: Module: inBetweener InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'clonable' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'inBetweener' -> () From: ( | {
         'Category: testing\x7fModuleInfo: Module: inBetweener InitialContents: FollowSlot\x7fVisibility: public'
        
         pointTest = ( |
            | testFrom: 0 @ 10 To: 100 @ 0 Steps: 10).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'inBetweener' -> () From: ( | {
         'Category: testing\x7fModuleInfo: Module: inBetweener InitialContents: FollowSlot\x7fVisibility: public'
        
         rectangleTest = ( |
            | testFrom: (  0 @  10) #! (100 @ 200)
               To: (300 @ 400) #! (500 @ 600)
            Steps: 10).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'inBetweener' -> () From: ( | {
         'ModuleInfo: Module: inBetweener InitialContents: FollowSlot'
        
         reset: s = ( |
            | 
            setupForSteps: s.
            velocity: 0.
            t: 0.
            stepping: traits inBetweener accelerate.
            lastTime: 0.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'inBetweener' -> () From: ( | {
         'Category: testing\x7fModuleInfo: Module: inBetweener InitialContents: FollowSlot\x7fVisibility: public'
        
         scalarTest = ( |
            | testFrom: 1      To: 100     Steps: 10).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'inBetweener' -> () From: ( | {
         'ModuleInfo: Module: inBetweener InitialContents: FollowSlot\x7fVisibility: public'
        
         size = ( |
            | steps).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'inBetweener' -> () From: ( | {
         'ModuleInfo: Module: inBetweener InitialContents: FollowSlot\x7fVisibility: public'
        
         statePrintString = ( |
            | ' From: ', from printString, ' To: ',
            to printString  "' At: ', value printString"
            "value sideeffects the object!").
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'inBetweener' -> () From: ( | {
         'ModuleInfo: Module: inBetweener InitialContents: FollowSlot\x7fVisibility: private'
        
         stayPut = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'inBetweener' -> 'stayPut' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits inBetweener stayPut.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'inBetweener' -> 'stayPut' -> () From: ( | {
         'ModuleInfo: Module: inBetweener InitialContents: FollowSlot\x7fVisibility: public'
        
         isFinished = bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'inBetweener' -> 'stayPut' -> () From: ( | {
         'ModuleInfo: Module: inBetweener InitialContents: FollowSlot\x7fVisibility: private'
        
         oneStep = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'inBetweener' -> () From: ( | {
         'Category: testing\x7fModuleInfo: Module: inBetweener InitialContents: FollowSlot\x7fVisibility: public'
        
         test = ( |
            | scalarTest.  pointTest.  rectangleTest.  tripletTest).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'inBetweener' -> () From: ( | {
         'Category: testing\x7fModuleInfo: Module: inBetweener InitialContents: FollowSlot\x7fVisibility: public'
        
         testFrom: f To: t Steps: s = ( | {
                 'ModuleInfo: Module: inBetweener InitialContents: FollowSlot'
                
                 ib.
                } 
            | 
            ib: copyFrom: f To: t Steps: s.
            '\n\n' print.
            ib do: [|:x| x print.  '\n' print.].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'inBetweener' -> () From: ( | {
         'Category: testing\x7fModuleInfo: Module: inBetweener InitialContents: FollowSlot\x7fVisibility: public'
        
         tripletTest = ( |
            | testFrom: (0 @ 10) @ 100 To: (30 @ 200) @ 10
            Steps: 10).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'inBetweener' -> () From: ( | {
         'ModuleInfo: Module: inBetweener InitialContents: FollowSlot\x7fVisibility: public'
        
         value = ( |
            | lastTime: times real.  position round asInteger).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'inBetweener' -> () From: ( | {
         'ModuleInfo: Module: inBetweener InitialContents: FollowSlot\x7fVisibility: private'
        
         wait = ( |
            | 
            delay = 0 ifTrue: [^self].
            times delay: 0 max: delay - (times real - lastTime).
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'inBetweener' -> () From: ( | {
         'ModuleInfo: Module: inBetweener InitialContents: FollowSlot\x7fVisibility: public'
        
         with: inB Do: b = ( |
            | 
            b value: value With: inB value.
            [b value: step value With: inB step value] untilTrue: [isFinished].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: graphics\x7fCategory: animation\x7fModuleInfo: Module: inBetweener InitialContents: FollowSlot\x7fVisibility: public'
        
         acceleratingInBetweener = bootstrap define: bootstrap stub -> 'globals' -> 'acceleratingInBetweener' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals inBetweenerTemplate copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'acceleratingInBetweener' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals acceleratingInBetweener.

CopyDowns:
globals inBetweenerTemplate. copy 
SlotsToOmit: parent.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: graphics\x7fCategory: animation\x7fModuleInfo: Module: inBetweener InitialContents: FollowSlot\x7fVisibility: public'
        
         acceleratingInBetweener = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'acceleratingInBetweener' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits acceleratingInBetweener.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'acceleratingInBetweener' -> () From: ( | {
         'ModuleInfo: Module: inBetweener InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'acceleratingInBetweener' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: graphics\x7fCategory: animation\x7fModuleInfo: Module: inBetweener InitialContents: FollowSlot\x7fVisibility: public'
        
         deceleratingInBetweener = bootstrap define: bootstrap stub -> 'globals' -> 'deceleratingInBetweener' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             bootstrap remove: 'stepping' From:
             globals inBetweenerTemplate copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'deceleratingInBetweener' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals deceleratingInBetweener.

CopyDowns:
globals inBetweenerTemplate. copy 
SlotsToOmit: parent stepping.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: graphics\x7fCategory: animation\x7fModuleInfo: Module: inBetweener InitialContents: FollowSlot\x7fVisibility: public'
        
         deceleratingInBetweener = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'deceleratingInBetweener' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits deceleratingInBetweener.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'deceleratingInBetweener' -> () From: ( | {
         'ModuleInfo: Module: inBetweener InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'deceleratingInBetweener' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'deceleratingInBetweener' -> () From: ( | {
         'ModuleInfo: Module: inBetweener InitialContents: FollowSlot\x7fVisibility: private'
        
         stepping* <- bootstrap stub -> 'traits' -> 'inBetweener' -> 'decelerate' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: graphics\x7fCategory: animation\x7fModuleInfo: Module: inBetweener InitialContents: FollowSlot\x7fVisibility: public'
        
         dummyInBetweener = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'dummyInBetweener' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals dummyInBetweener.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'dummyInBetweener' -> () From: ( | {
         'ModuleInfo: Module: inBetweener InitialContents: FollowSlot'
        
         copyFrom: f To: t Steps: s = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'dummyInBetweener' -> () From: ( | {
         'ModuleInfo: Module: inBetweener InitialContents: FollowSlot'
        
         delay: x = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'dummyInBetweener' -> () From: ( | {
         'ModuleInfo: Module: inBetweener InitialContents: FollowSlot'
        
         do: b = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'dummyInBetweener' -> () From: ( | {
         'ModuleInfo: Module: inBetweener InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'oddball' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: graphics\x7fCategory: animation\x7fModuleInfo: Module: inBetweener InitialContents: FollowSlot\x7fVisibility: public'
        
         jointInBetweener = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'jointInBetweener' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals jointInBetweener.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: graphics\x7fCategory: animation\x7fModuleInfo: Module: inBetweener InitialContents: FollowSlot\x7fVisibility: public'
        
         jointInBetweener = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'jointInBetweener' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits jointInBetweener.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'jointInBetweener' -> () From: ( | {
         'ModuleInfo: Module: inBetweener InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'jointInBetweener' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'jointInBetweener' -> () From: ( | {
         'ModuleInfo: Module: inBetweener InitialContents: FollowSlot'
        
         xib.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'jointInBetweener' -> () From: ( | {
         'ModuleInfo: Module: inBetweener InitialContents: FollowSlot'
        
         yib.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: graphics\x7fCategory: animation\x7fModuleInfo: Module: inBetweener InitialContents: FollowSlot\x7fVisibility: public'
        
         linearInBetweener = bootstrap define: bootstrap stub -> 'globals' -> 'linearInBetweener' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             bootstrap remove: 'velocity' From:
             globals inBetweenerTemplate copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'linearInBetweener' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals linearInBetweener.

CopyDowns:
globals inBetweenerTemplate. copy 
SlotsToOmit: parent velocity.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'linearInBetweener' -> () From: ( | {
         'ModuleInfo: Module: inBetweener InitialContents: FollowSlot'
        
         fixedVelocity <- 1.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: graphics\x7fCategory: animation\x7fModuleInfo: Module: inBetweener InitialContents: FollowSlot\x7fVisibility: public'
        
         linearInBetweener = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'linearInBetweener' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits linearInBetweener.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'linearInBetweener' -> () From: ( | {
         'ModuleInfo: Module: inBetweener InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'linearInBetweener' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: inBetweener InitialContents: FollowSlot'
        
         inBetweener = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'inBetweener' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'comment' From:
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'inBetweener' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules inBetweener.

CopyDowns:
globals modules init. copy 
SlotsToOmit: comment directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'inBetweener' -> () From: ( | {
         'ModuleInfo: Module: inBetweener InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'graphics'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'inBetweener' -> () From: ( | {
         'ModuleInfo: Module: inBetweener InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'inBetweener' -> () From: ( | {
         'ModuleInfo: Module: inBetweener InitialContents: FollowSlot'
        
         myComment <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'inBetweener' -> () From: ( | {
         'ModuleInfo: Module: inBetweener InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- 'Sun-$Revision: 30.8 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'inBetweener' -> () From: ( | {
         'ModuleInfo: Module: inBetweener InitialContents: FollowSlot\x7fVisibility: private'
        
         subpartNames <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: graphics\x7fCategory: animation\x7fModuleInfo: Module: inBetweener InitialContents: FollowSlot\x7fVisibility: public'
        
         oneWayInBetweener = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'oneWayInBetweener' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits oneWayInBetweener.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'linearInBetweener' -> () From: ( | {
         'ModuleInfo: Module: inBetweener InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'oneWayInBetweener' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'linearInBetweener' -> () From: ( | {
         'ModuleInfo: Module: inBetweener InitialContents: FollowSlot'
        
         setupForSteps: s = ( |
            | 
            steps: s.
            "acceleration is ignored; but is set so it is of the right type"
            acceleration: from asFloat.
            fixedVelocity: (to - from) / steps.
            position: from asFloat).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'linearInBetweener' -> () From: ( | {
         'ModuleInfo: Module: inBetweener InitialContents: FollowSlot'
        
         velocity = ( |
            | fixedVelocity).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'linearInBetweener' -> () From: ( | {
         'ModuleInfo: Module: inBetweener InitialContents: FollowSlot'
        
         velocity: n = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'oneWayInBetweener' -> () From: ( | {
         'ModuleInfo: Module: inBetweener InitialContents: FollowSlot\x7fVisibility: private'
        
         nextSegment = bootstrap stub -> 'traits' -> 'inBetweener' -> 'mainEnginesOffBlock' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'oneWayInBetweener' -> () From: ( | {
         'ModuleInfo: Module: inBetweener InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'inBetweener' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'oneWayInBetweener' -> () From: ( | {
         'Comment: _\x7fModuleInfo: Module: inBetweener InitialContents: FollowSlot'
        
         setupForSteps: s = ( |
            | 
            steps: s.
            acceleration: ((to - from) * 2) /= (steps * steps succ).
            position: from asFloat).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'oneWayInBetweener' -> () From: ( | {
         'ModuleInfo: Module: inBetweener InitialContents: FollowSlot\x7fVisibility: public'
        
         step = ( |
            | wait.  oneStep).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: graphics\x7fCategory: animation\x7fModuleInfo: Module: inBetweener InitialContents: FollowSlot\x7fVisibility: public'
        
         movingLinearInBetweener = bootstrap define: bootstrap stub -> 'globals' -> 'movingLinearInBetweener' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             bootstrap remove: 'stepping' From:
             globals linearInBetweener copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'movingLinearInBetweener' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals movingLinearInBetweener.

CopyDowns:
globals linearInBetweener. copy 
SlotsToOmit: parent stepping.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: graphics\x7fCategory: animation\x7fModuleInfo: Module: inBetweener InitialContents: FollowSlot\x7fVisibility: public'
        
         movingLinearInBetweener = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'movingLinearInBetweener' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits movingLinearInBetweener.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'movingLinearInBetweener' -> () From: ( | {
         'ModuleInfo: Module: inBetweener InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'movingLinearInBetweener' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: graphics\x7fCategory: animation\x7fModuleInfo: Module: inBetweener InitialContents: FollowSlot\x7fVisibility: public'
        
         peakingInBetweener = bootstrap define: bootstrap stub -> 'globals' -> 'peakingInBetweener' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals inBetweenerTemplate copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'peakingInBetweener' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals peakingInBetweener.

CopyDowns:
globals inBetweenerTemplate. copy 
SlotsToOmit: parent.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'peakingInBetweener' -> () From: ( | {
         'ModuleInfo: Module: inBetweener InitialContents: FollowSlot\x7fVisibility: private'
        
         turnAndFireRetrosBlock = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'peakingInBetweener' -> 'turnAndFireRetrosBlock' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits peakingInBetweener turnAndFireRetrosBlock.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'peakingInBetweener' -> () From: ( | {
         'ModuleInfo: Module: inBetweener InitialContents: FollowSlot\x7fVisibility: private'
        
         nextSegment <- bootstrap stub -> 'traits' -> 'peakingInBetweener' -> 'turnAndFireRetrosBlock' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: graphics\x7fCategory: animation\x7fModuleInfo: Module: inBetweener InitialContents: FollowSlot\x7fVisibility: public'
        
         peakingInBetweener = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'peakingInBetweener' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits peakingInBetweener.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'peakingInBetweener' -> () From: ( | {
         'ModuleInfo: Module: inBetweener InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'peakingInBetweener' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'peakingInBetweener' -> () From: ( | {
         'ModuleInfo: Module: inBetweener InitialContents: FollowSlot\x7fVisibility: private'
        
         even = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'peakingInBetweener' -> 'even' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits peakingInBetweener even.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'peakingInBetweener' -> () From: ( | {
         'ModuleInfo: Module: inBetweener InitialContents: FollowSlot\x7fVisibility: private'
        
         parity* <- bootstrap stub -> 'traits' -> 'peakingInBetweener' -> 'even' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'acceleratingInBetweener' -> () From: ( | {
         'ModuleInfo: Module: inBetweener InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'oneWayInBetweener' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'deceleratingInBetweener' -> () From: ( | {
         'ModuleInfo: Module: inBetweener InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'oneWayInBetweener' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'deceleratingInBetweener' -> () From: ( | {
         'ModuleInfo: Module: inBetweener InitialContents: FollowSlot\x7fVisibility: private'
        
         setupForSteps: s = ( |
            | 
            resend.setupForSteps: s.
            velocity: acceleration * steps).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'jointInBetweener' -> () From: ( | {
         'ModuleInfo: Module: inBetweener InitialContents: FollowSlot'
        
         do: block = ( |
            | 
            yib delay: 0.
            block value: (xib value @ yib value).
            [ block value: (xib step value @ yib step value) ]
                untilTrue: [ xib isFinished ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'jointInBetweener' -> () From: ( | {
         'ModuleInfo: Module: inBetweener InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'clonable' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'movingLinearInBetweener' -> () From: ( | {
         'ModuleInfo: Module: inBetweener InitialContents: FollowSlot'
        
         isFinished = ( |
            | steps <= 0).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'movingLinearInBetweener' -> () From: ( | {
         'ModuleInfo: Module: inBetweener InitialContents: FollowSlot'
        
         oneStep = ( |
            | 
            position: position + ((to - position) / steps).
            steps: steps pred.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'movingLinearInBetweener' -> () From: ( | {
         'ModuleInfo: Module: inBetweener InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'oneWayInBetweener' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'movingLinearInBetweener' -> () From: ( | {
         'ModuleInfo: Module: inBetweener InitialContents: FollowSlot'
        
         setupForSteps: s = ( |
            | 
            steps: s.
            position: from asFloat).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'peakingInBetweener' -> 'even' -> () From: ( | {
         'ModuleInfo: Module: inBetweener InitialContents: FollowSlot\x7fVisibility: public'
        
         step = ( |
            | wait.  oneStep).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'peakingInBetweener' -> () From: ( | {
         'ModuleInfo: Module: inBetweener InitialContents: FollowSlot\x7fVisibility: private'
        
         odd = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'peakingInBetweener' -> 'odd' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits peakingInBetweener odd.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'peakingInBetweener' -> 'odd' -> () From: ( | {
         'ModuleInfo: Module: inBetweener InitialContents: FollowSlot\x7fVisibility: public'
        
         step = ( |
            | wait.  oneStep. oneStep).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'peakingInBetweener' -> () From: ( | {
         'ModuleInfo: Module: inBetweener InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'inBetweener' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'peakingInBetweener' -> () From: ( | {
         'Comment: _\x7fModuleInfo: Module: inBetweener InitialContents: FollowSlot'
        
         setupForSteps: s = ( |
            | 
            " if s is even, solve the following:
              v(t) = a + v(t-1), where v(0) = 0. So v(t) = at.
              x(t) = v(t) + x(t-1) where x(0) = 0. So x(t) = sum<0 to t> of at.
              So x(t) = a *  t * t+1 / 2.  So a = dist * 2 / (t * t+1)"
            " if s is odd, double it and do 2 steps per step "
            1 = (s && 1) ifTrue: [steps: s.       parity: odd]
                          False: [steps: s / 2.   parity: even].
             acceleration: (to - from) /= (steps * steps succ).
             position: from asFloat.
             nextSegment: turnAndFireRetrosBlock).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'peakingInBetweener' -> () From: ( | {
         'Comment: _\x7fModuleInfo: Module: inBetweener InitialContents: FollowSlot'
        
         turnAndFireRetros = ( |
            | 
            stepping: decelerate.
            nextSegment: mainEnginesOffBlock).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'peakingInBetweener' -> 'turnAndFireRetrosBlock' -> () From: ( | {
         'ModuleInfo: Module: inBetweener InitialContents: FollowSlot'
        
         value: rec = ( |
            | rec turnAndFireRetros).
        } | ) 



 '-- Side effects'

 globals modules inBetweener postFileIn
