 'Sun-$Revision: 30.7 $'
 '
Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap stub -> 'globals' -> () _AddSlots: ( | {
         'Category: Applications\x7fCategory: Histogram\x7fModuleInfo: Module: histogramMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         histogramMorph = bootstrap stub -> 'globals' -> 'histogramMorph' -> () _Define: (
             bootstrap remove: 'parent' From:
             globals rowMorph copyRemoveAllMorphs ) _AddSlots: bootstrap stub -> 'globals' -> 'histogramMorph' -> () _AddSlots: ( |
             {} = 'ModuleInfo: Creator: globals histogramMorph.

CopyDowns:
globals rowMorph. copyRemoveAllMorphs 
SlotsToOmit: parent.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap stub -> 'globals' -> 'histogramMorph' -> () _AddSlots: ( | {
         'Comment: height used for zero sample value\x7fModuleInfo: Module: histogramMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         heightForZero <- 3.
        } | ) 

 bootstrap stub -> 'globals' -> 'histogramMorph' -> () _AddSlots: ( | {
         'ModuleInfo: Module: histogramMorph InitialContents: FollowSlot\x7fVisibility: private'
        
         lastSampleTime <- bootstrap stub -> 'globals' -> 'time' -> ().
        } | ) 

 bootstrap stub -> 'globals' -> 'histogramMorph' -> () _AddSlots: ( | {
         'ModuleInfo: Module: histogramMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         mSecsPerSample <- 1000.
        } | ) 

 bootstrap stub -> 'traits' -> () _AddSlots: ( | {
         'Category: Applications\x7fCategory: Histogram\x7fModuleInfo: Module: histogramMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         histogramMorph = bootstrap stub -> 'traits' -> 'histogramMorph' -> () _AddSlots: ( |
             {} = 'ModuleInfo: Creator: traits histogramMorph.
'.
            | ) .
        } | ) 

 bootstrap stub -> 'globals' -> 'histogramMorph' -> () _AddSlots: ( | {
         'ModuleInfo: Module: histogramMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap stub -> 'traits' -> 'histogramMorph' -> ().
        } | ) 

 bootstrap stub -> 'globals' -> 'histogramMorph' -> () _AddSlots: ( | {
         'ModuleInfo: Module: histogramMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         scale <- 1.0.
        } | ) 

 bootstrap stub -> 'globals' -> 'histogramMorph' -> () _AddSlots: ( | {
         'ModuleInfo: Module: histogramMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         selector.
        } | ) 

 bootstrap stub -> 'globals' -> 'histogramMorph' -> () _AddSlots: ( | {
         'ModuleInfo: Module: histogramMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         target.
        } | ) 

 bootstrap stub -> 'globals' -> 'histogramMorph' -> () _AddSlots: ( | {
         'ModuleInfo: Module: histogramMorph InitialContents: FollowSlot\x7fVisibility: private'
        
         targetFrozen <- bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap stub -> 'globals' -> 'modules' -> () _AddSlots: ( | {
         'ModuleInfo: Module: histogramMorph InitialContents: FollowSlot'
        
         histogramMorph = bootstrap stub -> 'globals' -> 'modules' -> 'histogramMorph' -> () _Define: (
             bootstrap remove: 'comment' From:
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) _AddSlots: bootstrap stub -> 'globals' -> 'modules' -> 'histogramMorph' -> () _AddSlots: ( |
             {} = 'ModuleInfo: Creator: globals modules histogramMorph.

CopyDowns:
globals modules init. copy 
SlotsToOmit: comment directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap stub -> 'globals' -> 'modules' -> 'histogramMorph' -> () _AddSlots: ( | {
         'ModuleInfo: Module: histogramMorph InitialContents: FollowSlot\x7fVisibility: private'
        
         myComment <- ' \'\'
            \"A simple histogram morph.\"'.
        } | ) 

 bootstrap stub -> 'globals' -> 'modules' -> 'histogramMorph' -> () _AddSlots: ( | {
         'ModuleInfo: Module: histogramMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'ui2'.
        } | ) 

 bootstrap stub -> 'globals' -> 'modules' -> 'histogramMorph' -> () _AddSlots: ( | {
         'ModuleInfo: Module: histogramMorph InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap stub -> 'globals' -> 'modules' -> 'histogramMorph' -> () _AddSlots: ( | {
         'ModuleInfo: Module: histogramMorph InitialContents: FollowSlot'
        
         postFileIn = ( |
            | 
            resend.postFileIn.
            histogramMorph resizeRect: (0@0) # (200@100).
            histogramMorph beRigidHorizontally.
            histogramMorph beRigidVertically.
            histogramMorph bottomJustify).
        } | ) 

 bootstrap stub -> 'globals' -> 'modules' -> 'histogramMorph' -> () _AddSlots: ( | {
         'ModuleInfo: Module: histogramMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- 'Sun-$Revision: 30.7 $'.
        } | ) 

 bootstrap stub -> 'globals' -> 'modules' -> 'histogramMorph' -> () _AddSlots: ( | {
         'ModuleInfo: Module: histogramMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         subpartNames <- ''.
        } | ) 

 bootstrap stub -> 'traits' -> 'histogramMorph' -> () _AddSlots: ( | {
         'Category: stepping\x7fModuleInfo: Module: histogramMorph InitialContents: FollowSlot\x7fVisibility: private'
        
         addSample: s = ( |
            | 
            0 = morphCount ifFalse: [| m |
                "copy the first morph and make its height proportional to the sample"
                m: firstMorph copy.
                m setHeight: (heightForZero + (s * scale)) asInteger.

                "insert at left"
                m globalPosition: ((globalBounds left - m baseBounds width) @ 0).
                addMorph: m.

                "delete any morphs that fall off the end"
                [(0 != morphCount) &&
                 [lastMorph bounds right > baseBounds width]] whileTrue: [
                     removeMorph: m.
                ].
            ].
            self).
        } | ) 

 bootstrap stub -> 'traits' -> 'histogramMorph' -> () _AddSlots: ( | {
         'Category: targetManipulation\x7fModuleInfo: Module: histogramMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         freezeTarget = ( |
            | 
            targetFrozen: false.
            setTarget.
            targetFrozen: true.
            self).
        } | ) 

 bootstrap stub -> 'traits' -> 'histogramMorph' -> () _AddSlots: ( | {
         'Category: targetManipulation\x7fModuleInfo: Module: histogramMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         freezeTarget: t = ( |
            | 
            target: t.
            targetFrozen: true.
            self).
        } | ) 

 bootstrap stub -> 'traits' -> 'histogramMorph' -> () _AddSlots: ( | {
         'Category: stepping\x7fModuleInfo: Module: histogramMorph InitialContents: FollowSlot\x7fVisibility: private'
        
         getSample = ( |
            | 
            setTarget.
            ((nil = target) || (nil = selector))
                ifTrue: 0
                 False: [ selector sendTo: target ]).
        } | ) 

 bootstrap stub -> 'traits' -> 'histogramMorph' -> () _AddSlots: ( | {
         'Category: basics\x7fModuleInfo: Module: histogramMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         mapReferencesUsing: dict = ( |
            | 
            dict if: target IsPresentDo: [| :new | target: new ] IfAbsentDo: nil.
            self).
        } | ) 

 bootstrap stub -> 'traits' -> 'histogramMorph' -> () _AddSlots: ( | {
         'Category: basics\x7fModuleInfo: Module: histogramMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         morphTypeName = 'histogramMorph'.
        } | ) 

 bootstrap stub -> 'traits' -> 'histogramMorph' -> () _AddSlots: ( | {
         'ModuleInfo: Module: histogramMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap stub -> 'traits' -> 'rowMorph' -> ().
        } | ) 

 bootstrap stub -> 'traits' -> 'histogramMorph' -> () _AddSlots: ( | {
         'Category: stepping\x7fModuleInfo: Module: histogramMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         run = ( |
            | startGettingStepped).
        } | ) 

 bootstrap stub -> 'traits' -> 'histogramMorph' -> () _AddSlots: ( | {
         'Category: targetManipulation\x7fModuleInfo: Module: histogramMorph InitialContents: FollowSlot\x7fVisibility: private'
        
         setTarget = ( |
             o.
            | 
            targetFrozen ifTrue: [ ^self ].
            o: owner.
            [(nil != o) && [o isWorldMorph not]] whileTrue: [ o: o owner ].
            target: (((nil = o) || [o isWorldMorph]) ifTrue: nil False: o).
            self).
        } | ) 

 bootstrap stub -> 'traits' -> 'histogramMorph' -> () _AddSlots: ( | {
         'Category: stepping\x7fModuleInfo: Module: histogramMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         step = ( |
             mSecsSinceLastSample.
            | 
            mSecsSinceLastSample: time current - lastSampleTime.
            (mSecsSinceLastSample >= mSecsPerSample) ifTrue: [
                addSample: getSample.
                lastSampleTime: time current.
            ].
            self).
        } | ) 

 bootstrap stub -> 'traits' -> 'histogramMorph' -> () _AddSlots: ( | {
         'Category: stepping\x7fModuleInfo: Module: histogramMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         stop = ( |
            | stopGettingStepped).
        } | ) 

 bootstrap stub -> 'traits' -> 'histogramMorph' -> () _AddSlots: ( | {
         'Category: targetManipulation\x7fModuleInfo: Module: histogramMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         unfreezeTarget = ( |
            | 
            targetFrozen: false.
            self).
        } | ) 



 '-- Side effects'

 globals modules histogramMorph postFileIn
