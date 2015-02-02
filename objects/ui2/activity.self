 'Sun-$Revision: 30.11 $'
 '
Copyright 1992-2012 AUTHORS.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: graphical interface\x7fCategory: ui2\x7fCategory: System\x7fCategory: Activities\x7fModuleInfo: Module: activity InitialContents: FollowSlot\x7fVisibility: public'
        
         activity = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'activity' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals activity.
\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'activity' -> () From: ( | {
         'ModuleInfo: Module: activity InitialContents: InitializeToExpression: (false)\x7fVisibility: public'
        
         abortOnTargetGrab <- bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'activity' -> () From: ( | {
         'ModuleInfo: Module: activity InitialContents: FollowSlot\x7fVisibility: public'
        
         currentFrame <- 1.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'activity' -> () From: ( | {
         'Comment: records elapsed time when paused\x7fModuleInfo: Module: activity InitialContents: FollowSlot\x7fVisibility: public'
        
         elapsedTimeOrNil.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: graphical interface\x7fCategory: ui2\x7fCategory: System\x7fCategory: Activities\x7fModuleInfo: Module: activity InitialContents: FollowSlot\x7fVisibility: public'
        
         activity = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'activity' -> () From: ( |
             {} = 'Comment: An animator controls some time-dependent aspect of its target morph.
     This behavior may be of fixed duration or may continue until some
     termination condition is met (or perhaps forever). Animators of
     fixed duration may be defined to consume a fixed number of frames
     or a fixed amount of time, independent of the frame rate.

     An animator responds to a step message by computing the next state
     for its target object, perhaps based on the time or frame number
     since the start of the animation.\x7fModuleInfo: Creator: traits activity.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'activity' -> () From: ( | {
         'ModuleInfo: Module: activity InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap stub -> 'traits' -> 'activity' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'activity' -> () From: ( | {
         'ModuleInfo: Module: activity InitialContents: FollowSlot\x7fVisibility: public'
        
         startTime <- bootstrap stub -> 'globals' -> 'time' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'activity' -> () From: ( | {
         'ModuleInfo: Module: activity InitialContents: FollowSlot\x7fVisibility: public'
        
         target.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'activity' -> () From: ( | {
         'Category: controlling\x7fModuleInfo: Module: activity InitialContents: FollowSlot\x7fVisibility: public'
        
         abort = ( |
            | 
            "Terminate the receiver without completing."

            terminate.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'activity' -> () From: ( | {
         'Category: controlling\x7fModuleInfo: Module: activity InitialContents: FollowSlot\x7fVisibility: private'
        
         advanceFrameCounter = ( |
            | 
            currentFrame: currentFrame succ.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'activity' -> () From: ( | {
         'Category: combining\x7fModuleInfo: Module: activity InitialContents: FollowSlot\x7fVisibility: public'
        
         andThen: a = ( |
             r.
            | 
            "Return an animator that first performs the actions of
             the receiver followed by the actions of the argument."
            a isActive ifTrue: [ a terminate].
            r: sequentialActivity copyRemoveAllTarget: target.
            r addAnimator: self.
            r addAnimator: a.
            isActive ifTrue: [
              target topmostOwner addActivityIfWorld: r.
              terminate. 
            ].
            r).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'activity' -> () From: ( | {
         'Category: combining\x7fModuleInfo: Module: activity InitialContents: FollowSlot\x7fVisibility: public'
        
         andThenSend: selector To: t = ( |
            | 
            "Return an animator that first performs the actions of
             the receiver followed by the actions of the argument."

            andThen: (messageActivity copyTarget: t Selector: selector)).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'activity' -> () From: ( | {
         'Category: combining\x7fModuleInfo: Module: activity InitialContents: FollowSlot\x7fVisibility: public'
        
         andThenSend: selector To: t Args: args = ( |
            | 
            andThen: (messageActivity copyTarget: t Selector: selector Args: args)).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'activity' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: activity InitialContents: FollowSlot\x7fVisibility: public'
        
         copyTarget: t = ( |
             new.
            | 
            new: copy.
            new target: t.
            new startOver.
            new).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'activity' -> () From: ( | {
         'Category: controlling\x7fModuleInfo: Module: activity InitialContents: FollowSlot\x7fVisibility: public'
        
         cutToFinish = ( |
            | 
            "Complete the receiver immediately and terminate."

            finalStep.
            terminate.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'activity' -> () From: ( | {
         'Category: stepping\x7fModuleInfo: Module: activity InitialContents: FollowSlot\x7fVisibility: public'
        
         done = ( |
            | 
            "Return true when the animation is complete. Returns false by
             default, resulting in continuous animation."

            false).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'activity' -> () From: ( | {
         'Category: combining\x7fModuleInfo: Module: activity InitialContents: FollowSlot\x7fVisibility: public'
        
         during: a = ( |
             r.
            | 
            "Return an animator that performs the actions of the
             receiver and the argument concurrently."

            r: concurrentActivity copyRemoveAllTarget: target.
            r addAnimator: self.
            r addAnimator: a.
            r).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'activity' -> () From: ( | {
         'Category: stepping\x7fModuleInfo: Module: activity InitialContents: FollowSlot\x7fVisibility: public'
        
         finalStep = ( |
            | 
            "This message is sent when the animation completes, either
             because done has become true or because a user action has
             forced the animation to complete early. This message allows
             the receiver to perform any final animation actions. Typically,
             the target object is updated with the final state of the
             animation sequence."

            advanceFrameCounter.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'activity' -> () From: ( | {
         'Category: controlling\x7fModuleInfo: Module: activity InitialContents: FollowSlot\x7fVisibility: public'
        
         isActive = ( |
             w.
            | 
            w: target topmostOwner.
            w isWorldMorph ifTrue: [ 
               w activities includes: self.
            ] False: [
               false
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'activity' -> () From: ( | {
         'ModuleInfo: Module: activity InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap stub -> 'traits' -> 'clonable' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'activity' -> () From: ( | {
         'Category: controlling\x7fModuleInfo: Module: activity InitialContents: FollowSlot\x7fVisibility: public'
        
         pause = ( |
            | 
            "Put the receiver into suspended animation."

            elapsedTimeOrNil ifNotNil: [ ^self ].      "already paused"
            elapsedTimeOrNil: time current - startTime.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'activity' -> () From: ( | {
         'Category: controlling\x7fModuleInfo: Module: activity InitialContents: FollowSlot\x7fVisibility: public'
        
         resume = ( |
            | 
            "Resume after a pause. The receiver's new start time is set
             to m milliseconds before the current time, where m is the
             number of milliseconds it had run before it was paused."

            elapsedTimeOrNil ifNotNil: [
                startTime: time current - elapsedTimeOrNil.
                elapsedTimeOrNil: nil.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'activity' -> () From: ( | {
         'Category: controlling\x7fModuleInfo: Module: activity InitialContents: FollowSlot\x7fVisibility: public'
        
         shouldAbort = ( |
            | 
            "This method may be overridden to test conditions under
             which this activity should abort. Checked by step."

            abortOnTargetGrab ifTrue: [
                ^((target owner isMorph) &&
                  [target owner morphTypeName = handMorph morphTypeName]).
            ].
            false).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'activity' -> () From: ( | {
         'Category: controlling\x7fModuleInfo: Module: activity InitialContents: FollowSlot\x7fVisibility: public'
        
         startOver = ( |
            | 
            "Reset the state of the receiver to begin the animation
             from the beginning."

            startTime: time current.
            currentFrame: 1.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'activity' -> () From: ( | {
         'Category: stepping\x7fModuleInfo: Module: activity InitialContents: FollowSlot\x7fVisibility: public'
        
         step = ( |
            | 
            "Perform one step of the animation."

            shouldAbort ifTrue: [ ^abort ].
            advanceFrameCounter.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'activity' -> () From: ( | {
         'Category: controlling\x7fModuleInfo: Module: activity InitialContents: FollowSlot\x7fVisibility: private'
        
         terminate = ( |
             w.
            | 
            "Remove the receiver from its target's world's activity list."

            w: target topmostOwner.
            w isWorldMorph ifTrue: [ w removeActivity: self ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: graphical interface\x7fCategory: ui2\x7fCategory: System\x7fCategory: Activities\x7fModuleInfo: Module: activity InitialContents: FollowSlot\x7fVisibility: public'
        
         interpolatingAnimator = bootstrap define: bootstrap stub -> 'globals' -> 'interpolatingAnimator' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals activity copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'interpolatingAnimator' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals interpolatingAnimator.

CopyDowns:
globals activity. copy 
SlotsToOmit: parent.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'interpolatingAnimator' -> () From: ( | {
         'Comment: duration, in frames or seconds\x7fModuleInfo: Module: activity InitialContents: FollowSlot\x7fVisibility: public'
        
         duration <- 10.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'interpolatingAnimator' -> () From: ( | {
         'Comment: true -> frame-based, false -> time-based\x7fModuleInfo: Module: activity InitialContents: FollowSlot\x7fVisibility: public'
        
         frameBased <- bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: graphical interface\x7fCategory: ui2\x7fCategory: System\x7fCategory: Activities\x7fModuleInfo: Module: activity InitialContents: FollowSlot\x7fVisibility: public'
        
         interpolatingAnimator = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'interpolatingAnimator' -> () From: ( |
             {} = 'Comment: An interpolating animator interpolates between two states of its
     target morph over the duration of the animation. The duration, which
     must be greater than zero, may be specified in either frames or
     seconds. The interpolation policy can be either \'slow-in, slow-out\'
     or simple linear interpolation.\x7fModuleInfo: Creator: traits interpolatingAnimator.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'interpolatingAnimator' -> () From: ( | {
         'ModuleInfo: Module: activity InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap stub -> 'traits' -> 'interpolatingAnimator' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'interpolatingAnimator' -> () From: ( | {
         'Comment: use slow-in/out (vs. linear) interpolation\x7fModuleInfo: Module: activity InitialContents: FollowSlot\x7fVisibility: public'
        
         useSlowInOut <- bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'interpolatingAnimator' -> () From: ( | {
         'Category: stepping\x7fModuleInfo: Module: activity InitialContents: FollowSlot\x7fVisibility: private'
        
         computeSlowInOut: t = ( |
            | 
            "Interpolate based on applying Newton's law of motion under
             constant acceleration (from rest): p(t) = (a * t^2) / 2.
             This equation is used for t in [0.0..0.5) (acceleration)
             and its complement is used for t = [0.5..1.0] (deceleration),
             using the acceleration factor a = 4 so that p(0.5) = 0.5.
             It is assumed that t is in the range [0.0..1.0]."

            t < 0.5 ifTrue: [
                2.0 * t * t.
            ] False: [| tComplement |
                tComplement: 1.0 - t.
                1.0 - (2.0 * tComplement * tComplement).
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'interpolatingAnimator' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: activity InitialContents: FollowSlot\x7fVisibility: public'
        
         copyTarget: t Frames: f = ( |
             new.
            | 
            f <= 0 ifTrue:
                [ error: 'You must specify at least one frame for an animator' ].
            new: copyTarget: t.
            new frameBased: true.
            new duration: f asFloat.
            new).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'interpolatingAnimator' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: activity InitialContents: FollowSlot\x7fVisibility: public'
        
         copyTarget: t Seconds: s = ( |
             new.
            | 
            s <= 0 ifTrue:
                [ error: 'You must specify a positive, non-zero duration for animator' ].
            new: copyTarget: t.
            new frameBased: false.
            new duration: s asFloat * 1000.0.
            new).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'interpolatingAnimator' -> () From: ( | {
         'Category: stepping\x7fModuleInfo: Module: activity InitialContents: FollowSlot\x7fVisibility: public'
        
         done = ( |
            | 
            frameBased
                ifTrue: [ currentFrame               >= duration ]
                 False: [ (time current - startTime) >= duration ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'interpolatingAnimator' -> () From: ( | {
         'Category: stepping\x7fModuleInfo: Module: activity InitialContents: FollowSlot\x7fVisibility: public'
        
         finalStep = ( |
            | 
            target ifNotNil: [
                setRelativeTargetValue: 1.0.
            ].
            advanceFrameCounter.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'interpolatingAnimator' -> () From: ( | {
         'ModuleInfo: Module: activity InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap stub -> 'traits' -> 'activity' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'interpolatingAnimator' -> () From: ( | {
         'Category: stepping\x7fModuleInfo: Module: activity InitialContents: FollowSlot\x7fVisibility: public'
        
         setRelativeTargetValue: p = ( |
            | 
            "Children specialize this message to assign a value to some aspect
             of their target object that is p of the way between the initial and
             final values, where p is in the range [0.0-1.0]. For example, in
             a moveAnimator, if p is 0.5 then the position of the target would
             be set to the midpoint between its initial and final position."

            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'interpolatingAnimator' -> () From: ( | {
         'Category: stepping\x7fModuleInfo: Module: activity InitialContents: FollowSlot\x7fVisibility: public'
        
         step = ( |
             p.
            | 
            "Interpolate between initial and final states by time or frame."

            frameBased
                ifTrue: [ p: currentFrame asFloat               / duration ]
                 False: [ p: (time current - startTime) asFloat / duration ].
            p: 1.0 min: p.
            useSlowInOut ifTrue: [ p: computeSlowInOut: p ].
            nil = target ifFalse: [ setRelativeTargetValue: p ].
            resend.step.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: graphical interface\x7fCategory: ui2\x7fCategory: System\x7fCategory: Activities\x7fModuleInfo: Module: activity InitialContents: FollowSlot\x7fVisibility: public'
        
         boundsAnimator = bootstrap define: bootstrap stub -> 'globals' -> 'boundsAnimator' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals interpolatingAnimator copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'boundsAnimator' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals boundsAnimator.

CopyDowns:
globals interpolatingAnimator. copy 
SlotsToOmit: parent.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'boundsAnimator' -> () From: ( | {
         'ModuleInfo: Module: activity InitialContents: FollowSlot\x7fVisibility: public'
        
         from <- ((0)@(0)) # ((100)@(100)).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: graphical interface\x7fCategory: ui2\x7fCategory: System\x7fCategory: Activities\x7fModuleInfo: Module: activity InitialContents: FollowSlot\x7fVisibility: public'
        
         boundsAnimator = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'boundsAnimator' -> () From: ( |
             {} = 'Comment: A boundsAnimator interpolates between two bounding rectangles
     for its target morph over the duration of the animation.\x7fModuleInfo: Creator: traits boundsAnimator.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'boundsAnimator' -> () From: ( | {
         'ModuleInfo: Module: activity InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap stub -> 'traits' -> 'boundsAnimator' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'boundsAnimator' -> () From: ( | {
         'ModuleInfo: Module: activity InitialContents: FollowSlot\x7fVisibility: public'
        
         to <- ((0)@(0)) # ((100)@(100)).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: graphical interface\x7fCategory: ui2\x7fCategory: System\x7fCategory: Activities\x7fModuleInfo: Module: activity InitialContents: FollowSlot\x7fVisibility: public'
        
         colorAnimator = bootstrap define: bootstrap stub -> 'globals' -> 'colorAnimator' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals interpolatingAnimator copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'colorAnimator' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals colorAnimator.

CopyDowns:
globals interpolatingAnimator. copy 
SlotsToOmit: parent.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'colorAnimator' -> () From: ( | {
         'ModuleInfo: Module: activity InitialContents: FollowSlot\x7fVisibility: public'
        
         from <- bootstrap stub -> 'globals' -> 'paint' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: graphical interface\x7fCategory: ui2\x7fCategory: System\x7fCategory: Activities\x7fModuleInfo: Module: activity InitialContents: FollowSlot\x7fVisibility: public'
        
         colorAnimator = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'colorAnimator' -> () From: ( |
             {} = 'Comment: A colorAnimator interpolates between two colors for
     its target morph over the duration of the animation.\x7fModuleInfo: Creator: traits colorAnimator.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'colorAnimator' -> () From: ( | {
         'ModuleInfo: Module: activity InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap stub -> 'traits' -> 'colorAnimator' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'colorAnimator' -> () From: ( | {
         'ModuleInfo: Module: activity InitialContents: FollowSlot\x7fVisibility: public'
        
         to <- bootstrap stub -> 'globals' -> 'paint' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: graphical interface\x7fCategory: ui2\x7fCategory: System\x7fCategory: Activities\x7fModuleInfo: Module: activity InitialContents: FollowSlot\x7fVisibility: public'
        
         concurrentActivity = bootstrap define: bootstrap stub -> 'globals' -> 'concurrentActivity' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals activity copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'concurrentActivity' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals concurrentActivity.

CopyDowns:
globals activity. copy 
SlotsToOmit: parent.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'concurrentActivity' -> () From: ( | {
         'ModuleInfo: Module: activity InitialContents: FollowSlot\x7fVisibility: public'
        
         allDone <- bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'concurrentActivity' -> () From: ( | {
         'ModuleInfo: Module: activity InitialContents: FollowSlot\x7fVisibility: public'
        
         animators <- ((bootstrap stub -> 'globals') \/-> 'vector') -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: graphical interface\x7fCategory: ui2\x7fCategory: System\x7fCategory: Activities\x7fModuleInfo: Module: activity InitialContents: FollowSlot\x7fVisibility: public'
        
         concurrentActivity = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'concurrentActivity' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits concurrentActivity.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'concurrentActivity' -> () From: ( | {
         'ModuleInfo: Module: activity InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'concurrentActivity' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: graphical interface\x7fCategory: ui2\x7fCategory: System\x7fCategory: Activities\x7fModuleInfo: Module: activity InitialContents: FollowSlot\x7fVisibility: public'
        
         messageActivity = bootstrap define: bootstrap stub -> 'globals' -> 'messageActivity' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals activity copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'messageActivity' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals messageActivity.

CopyDowns:
globals activity. copy 
SlotsToOmit: parent.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'messageActivity' -> () From: ( | {
         'ModuleInfo: Module: activity InitialContents: InitializeToExpression: (message copy  receiver: (nil) Selector: (\'aMessageSelector\'))\x7fVisibility: public'
        
         mssg <- message copy  receiver: (nil) Selector: ('aMessageSelector').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: graphical interface\x7fCategory: ui2\x7fCategory: System\x7fCategory: Activities\x7fModuleInfo: Module: activity InitialContents: FollowSlot\x7fVisibility: public'
        
         messageActivity = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'messageActivity' -> () From: ( |
             {} = 'Comment: A messageActivity has one step that just sends a message.\x7fModuleInfo: Creator: traits messageActivity.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'messageActivity' -> () From: ( | {
         'ModuleInfo: Module: activity InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap stub -> 'traits' -> 'messageActivity' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: activity InitialContents: FollowSlot'
        
         activity = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'activity' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'activity' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules activity.

CopyDowns:
globals modules init. copy 
SlotsToOmit: directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'activity' -> () From: ( | {
         'ModuleInfo: Module: activity InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'ui2'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'activity' -> () From: ( | {
         'ModuleInfo: Module: activity InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'activity' -> () From: ( | {
         'ModuleInfo: Module: activity InitialContents: FollowSlot'
        
         myComment <- 'Activities are used for animation and other
             behavior that extends over a period of time.'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'activity' -> () From: ( | {
         'ModuleInfo: Module: activity InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- 'Sun-$Revision: 30.11 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'activity' -> () From: ( | {
         'ModuleInfo: Module: activity InitialContents: FollowSlot\x7fVisibility: private'
        
         subpartNames <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: graphical interface\x7fCategory: ui2\x7fCategory: System\x7fCategory: Activities\x7fModuleInfo: Module: activity InitialContents: FollowSlot\x7fVisibility: public'
        
         morphStepActivity = bootstrap define: bootstrap stub -> 'globals' -> 'morphStepActivity' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals activity copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'morphStepActivity' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals morphStepActivity.

CopyDowns:
globals activity. copy 
SlotsToOmit: parent.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: graphical interface\x7fCategory: ui2\x7fCategory: System\x7fCategory: Activities\x7fModuleInfo: Module: activity InitialContents: FollowSlot\x7fVisibility: public'
        
         morphStepActivity = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'morphStepActivity' -> () From: ( |
             {} = 'Comment: A morphStepActivity simply passes on step messages to its target morph.\x7fModuleInfo: Creator: traits morphStepActivity.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'morphStepActivity' -> () From: ( | {
         'ModuleInfo: Module: activity InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap stub -> 'traits' -> 'morphStepActivity' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'morphStepActivity' -> () From: ( | {
         'Category: stepping\x7fModuleInfo: Module: activity InitialContents: FollowSlot\x7fVisibility: public'
        
         done = ( |
            | 
            "Stop if target is removed from the world."

            (target isInWorld not) || [ target done ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'morphStepActivity' -> () From: ( | {
         'Category: stepping\x7fModuleInfo: Module: activity InitialContents: FollowSlot\x7fVisibility: public'
        
         finalStep = ( |
            | 
            "Send finalStep to the target if it is still in the world."

            target isInWorld ifFalse: [ ^self ].
            target finalStep.
            advanceFrameCounter.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'morphStepActivity' -> () From: ( | {
         'ModuleInfo: Module: activity InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap stub -> 'traits' -> 'activity' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'morphStepActivity' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: activity InitialContents: FollowSlot\x7fVisibility: public'
        
         statePrintString = ( |
            | target printString).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'morphStepActivity' -> () From: ( | {
         'Category: stepping\x7fModuleInfo: Module: activity InitialContents: FollowSlot\x7fVisibility: public'
        
         step = ( |
            | "Send step to the target if it is still in the world."

            target isInWorld ifFalse: [ ^self ].
            target step.
            resend.step.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: graphical interface\x7fCategory: ui2\x7fCategory: System\x7fCategory: Activities\x7fModuleInfo: Module: activity InitialContents: FollowSlot\x7fVisibility: public'
        
         periodicMorphStepActivity = bootstrap define: bootstrap stub -> 'globals' -> 'periodicMorphStepActivity' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals morphStepActivity copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'periodicMorphStepActivity' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals periodicMorphStepActivity.

CopyDowns:
globals morphStepActivity. copy 
SlotsToOmit: parent.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'periodicMorphStepActivity' -> () From: ( | {
         'ModuleInfo: Module: activity InitialContents: InitializeToExpression: (time current)\x7fVisibility: public'
        
         lastTime <- time current.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: graphical interface\x7fCategory: ui2\x7fCategory: System\x7fCategory: Activities\x7fModuleInfo: Module: activity InitialContents: FollowSlot\x7fVisibility: public'
        
         periodicMorphStepActivity = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'periodicMorphStepActivity' -> () From: ( |
             {} = 'Comment: A periodicMorphStepActivity sends step messages to
its target morph at periodic intervals.\x7fModuleInfo: Creator: traits periodicMorphStepActivity.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'periodicMorphStepActivity' -> () From: ( | {
         'ModuleInfo: Module: activity InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap stub -> 'traits' -> 'periodicMorphStepActivity' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'periodicMorphStepActivity' -> () From: ( | {
         'ModuleInfo: Module: activity InitialContents: InitializeToExpression: (100)\x7fVisibility: public'
        
         periodMSecs <- 100.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: graphical interface\x7fCategory: ui2\x7fCategory: System\x7fCategory: Activities\x7fModuleInfo: Module: activity InitialContents: FollowSlot\x7fVisibility: public'
        
         positionAnimator = bootstrap define: bootstrap stub -> 'globals' -> 'positionAnimator' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals interpolatingAnimator copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'positionAnimator' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals positionAnimator.

CopyDowns:
globals interpolatingAnimator. copy 
SlotsToOmit: parent.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'positionAnimator' -> () From: ( | {
         'ModuleInfo: Module: activity InitialContents: FollowSlot\x7fVisibility: public'
        
         from <- (0)@(0).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: graphical interface\x7fCategory: ui2\x7fCategory: System\x7fCategory: Activities\x7fModuleInfo: Module: activity InitialContents: FollowSlot\x7fVisibility: public'
        
         positionAnimator = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'positionAnimator' -> () From: ( |
             {} = 'Comment: An positionAnimator interpolates between two positions for
     its target morph over the duration of the animation.\x7fModuleInfo: Creator: traits positionAnimator.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'positionAnimator' -> () From: ( | {
         'ModuleInfo: Module: activity InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap stub -> 'traits' -> 'positionAnimator' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'positionAnimator' -> () From: ( | {
         'ModuleInfo: Module: activity InitialContents: FollowSlot\x7fVisibility: public'
        
         to <- (0)@(0).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: graphical interface\x7fCategory: ui2\x7fCategory: System\x7fCategory: Activities\x7fModuleInfo: Module: activity InitialContents: FollowSlot\x7fVisibility: public'
        
         sequentialActivity = bootstrap define: bootstrap stub -> 'globals' -> 'sequentialActivity' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals activity copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'sequentialActivity' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals sequentialActivity.

CopyDowns:
globals activity. copy 
SlotsToOmit: parent.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'sequentialActivity' -> () From: ( | {
         'ModuleInfo: Module: activity InitialContents: FollowSlot\x7fVisibility: public'
        
         animators <- ((bootstrap stub -> 'globals') \/-> 'vector') -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'sequentialActivity' -> () From: ( | {
         'ModuleInfo: Module: activity InitialContents: FollowSlot\x7fVisibility: private'
        
         currentAnimatorIndex <- 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: graphical interface\x7fCategory: ui2\x7fCategory: System\x7fCategory: Activities\x7fModuleInfo: Module: activity InitialContents: FollowSlot\x7fVisibility: public'
        
         sequentialActivity = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'sequentialActivity' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits sequentialActivity.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'sequentialActivity' -> () From: ( | {
         'ModuleInfo: Module: activity InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'sequentialActivity' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: graphical interface\x7fCategory: ui2\x7fCategory: System\x7fCategory: Activities\x7fModuleInfo: Module: activity InitialContents: FollowSlot\x7fVisibility: public'
        
         sizeAnimator = bootstrap define: bootstrap stub -> 'globals' -> 'sizeAnimator' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals interpolatingAnimator copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'sizeAnimator' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals sizeAnimator.

CopyDowns:
globals interpolatingAnimator. copy 
SlotsToOmit: parent.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'sizeAnimator' -> () From: ( | {
         'ModuleInfo: Module: activity InitialContents: FollowSlot\x7fVisibility: public'
        
         from <- (0)@(0).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: graphical interface\x7fCategory: ui2\x7fCategory: System\x7fCategory: Activities\x7fModuleInfo: Module: activity InitialContents: FollowSlot\x7fVisibility: public'
        
         sizeAnimator = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'sizeAnimator' -> () From: ( |
             {} = 'Comment: An sizeAnimator interpolates between two sizes
     for its target morph over the duration of the animation.\x7fModuleInfo: Creator: traits sizeAnimator.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'sizeAnimator' -> () From: ( | {
         'ModuleInfo: Module: activity InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap stub -> 'traits' -> 'sizeAnimator' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'sizeAnimator' -> () From: ( | {
         'ModuleInfo: Module: activity InitialContents: FollowSlot\x7fVisibility: public'
        
         to <- (100)@(100).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'positionAnimator' -> () From: ( | {
         'ModuleInfo: Module: activity InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap stub -> 'traits' -> 'interpolatingAnimator' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'positionAnimator' -> () From: ( | {
         'Category: stepping\x7fModuleInfo: Module: activity InitialContents: FollowSlot\x7fVisibility: public'
        
         setRelativeTargetValue: p = ( |
            | 
            target changed.
            target globalPosition:
              ( (from x interpolate: p From: to x) asInteger @
                (from y interpolate: p From: to y) asInteger).
            target changed.
            target owner ifNotNil: [|:o| o layoutChanged].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: graphical interface\x7fCategory: ui2\x7fCategory: System\x7fCategory: Activities\x7fModuleInfo: Module: activity InitialContents: FollowSlot\x7fVisibility: public'
        
         toObjectAnimator = bootstrap define: bootstrap stub -> 'globals' -> 'toObjectAnimator' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             bootstrap remove: 'to' From:
             globals positionAnimator copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'toObjectAnimator' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals toObjectAnimator.

CopyDowns:
globals positionAnimator. copy 
SlotsToOmit: parent to.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'toObjectAnimator' -> () From: ( | {
         'ModuleInfo: Module: activity InitialContents: FollowSlot\x7fVisibility: public'
        
         goalObject.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'toObjectAnimator' -> () From: ( | {
         'ModuleInfo: Module: activity InitialContents: InitializeToExpression: (0@0)\x7fVisibility: public'
        
         offset <- 0@0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: graphical interface\x7fCategory: ui2\x7fCategory: System\x7fCategory: Activities\x7fModuleInfo: Module: activity InitialContents: FollowSlot\x7fVisibility: public'
        
         toObjectAnimator = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'toObjectAnimator' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits toObjectAnimator.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'toObjectAnimator' -> () From: ( | {
         'ModuleInfo: Module: activity InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'toObjectAnimator' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: graphical interface\x7fCategory: ui2\x7fCategory: System\x7fCategory: Activities\x7fModuleInfo: Module: activity InitialContents: FollowSlot\x7fVisibility: public'
        
         valueAnimator = bootstrap define: bootstrap stub -> 'globals' -> 'valueAnimator' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals interpolatingAnimator copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'valueAnimator' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals valueAnimator.

CopyDowns:
globals interpolatingAnimator. copy 
SlotsToOmit: parent.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'valueAnimator' -> () From: ( | {
         'ModuleInfo: Module: activity InitialContents: FollowSlot\x7fVisibility: public'
        
         from <- 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: graphical interface\x7fCategory: ui2\x7fCategory: System\x7fCategory: Activities\x7fModuleInfo: Module: activity InitialContents: FollowSlot\x7fVisibility: public'
        
         valueAnimator = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'valueAnimator' -> () From: ( |
             {} = 'Comment: An valueAnimator interpolates between two values and
     sends the given binary selector to its target for each
     interpolated value.\x7fModuleInfo: Creator: traits valueAnimator.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'valueAnimator' -> () From: ( | {
         'ModuleInfo: Module: activity InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap stub -> 'traits' -> 'valueAnimator' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'valueAnimator' -> () From: ( | {
         'ModuleInfo: Module: activity InitialContents: FollowSlot\x7fVisibility: public'
        
         selector.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'valueAnimator' -> () From: ( | {
         'ModuleInfo: Module: activity InitialContents: FollowSlot\x7fVisibility: public'
        
         to <- 1.0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'boundsAnimator' -> () From: ( | {
         'ModuleInfo: Module: activity InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap stub -> 'traits' -> 'interpolatingAnimator' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'boundsAnimator' -> () From: ( | {
         'Category: stepping\x7fModuleInfo: Module: activity InitialContents: FollowSlot\x7fVisibility: public'
        
         setRelativeTargetValue: p = ( |
             c.
             o.
            | 
            target changed.
            o: ( (from origin x interpolate: p From: to origin x) asInteger @
                 (from origin y interpolate: p From: to origin y) asInteger).
            c: ( (from corner x interpolate: p From: to corner x) asInteger @
                 (from corner y interpolate: p From: to corner y) asInteger).
            target resizeRect: (o # c).
            target layoutChanged.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'colorAnimator' -> () From: ( | {
         'ModuleInfo: Module: activity InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap stub -> 'traits' -> 'interpolatingAnimator' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'colorAnimator' -> () From: ( | {
         'Category: stepping\x7fModuleInfo: Module: activity InitialContents: FollowSlot\x7fVisibility: public'
        
         setRelativeTargetValue: p = ( |
            | 
            target colorAll: (from interpolate: ((60.0 * p asFloat) asInteger /= 60) From: to).
            target changed.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'concurrentActivity' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: activity InitialContents: FollowSlot\x7fVisibility: public'
        
         addAnimator: a = ( |
            | 
            animators: animators copyAddLast: a.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'concurrentActivity' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: activity InitialContents: FollowSlot\x7fVisibility: public'
        
         copyRemoveAllTarget: t = ( |
             new.
            | 
            new: resend.copyTarget: t.
            new allDone: false.
            new animators: animators copyRemoveAll.
            new).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'concurrentActivity' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: activity InitialContents: FollowSlot\x7fVisibility: public'
        
         copyTarget: t = ( |
             new.
            | 
            new: resend.copyTarget: t.
            new allDone: false.
            new animators: animators copy mapBy: [| :a | a copyTarget: t ].
            new).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'concurrentActivity' -> () From: ( | {
         'Category: stepping\x7fModuleInfo: Module: activity InitialContents: FollowSlot\x7fVisibility: public'
        
         done = ( |
            | allDone).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'concurrentActivity' -> () From: ( | {
         'Category: stepping\x7fModuleInfo: Module: activity InitialContents: FollowSlot\x7fVisibility: public'
        
         finalStep = ( |
             a.
            | 
            done ifTrue: [ ^self ].
            animators do: [| :a | a done ifFalse: [ a finalStep ]].
            allDone: true.
            advanceFrameCounter.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'concurrentActivity' -> () From: ( | {
         'ModuleInfo: Module: activity InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'activity' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'concurrentActivity' -> () From: ( | {
         'Category: controlling\x7fModuleInfo: Module: activity InitialContents: FollowSlot\x7fVisibility: public'
        
         shouldAbort = ( |
            | 
            "Abort if any component activity wants to abort or if
             this activity itself wants to abort."

            animators do: [| :a |  
                a shouldAbort ifTrue: [ ^true ].
            ].
            resend.shouldAbort).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'concurrentActivity' -> () From: ( | {
         'Category: stepping\x7fModuleInfo: Module: activity InitialContents: FollowSlot\x7fVisibility: public'
        
         step = ( |
            | 
            allDone: true.  "assume done until proven otherwise"
            animators do: [| :a |
                a done ifFalse: [
                    a step.
                    a done ifTrue: [ a finalStep ].
                    allDone: false.
                ].
            ].
            resend.step. 
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'messageActivity' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: activity InitialContents: FollowSlot\x7fVisibility: public'
        
         copyTarget: t Message: m = ( |
             new.
            | 
            new: copyTarget: t.
            new mssg: m.
            new).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'messageActivity' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: activity InitialContents: FollowSlot\x7fVisibility: public'
        
         copyTarget: t Selector: s = ( |
            | 
            copyTarget: t Selector: s Args: vector).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'messageActivity' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: activity InitialContents: FollowSlot\x7fVisibility: public'
        
         copyTarget: t Selector: s Args: args = ( |
            | 
            copyTarget: t Message: (((message copy receiver: t) selector: s) arguments: args)).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'messageActivity' -> () From: ( | {
         'Category: stepping\x7fModuleInfo: Module: activity InitialContents: FollowSlot\x7fVisibility: public'
        
         done = ( |
            | true).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'messageActivity' -> () From: ( | {
         'Category: stepping\x7fModuleInfo: Module: activity InitialContents: FollowSlot\x7fVisibility: public'
        
         finalStep = ( |
            | 
            "Send my message."

            1 = currentFrame ifTrue: [
                "Only send the message on the first frame; this prevents
                 a message that fails from getting repeatedly sent every
                 time the ui process is restarted because its activity
                 is still on the activities list."

                advanceFrameCounter.
                mssg send.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'messageActivity' -> () From: ( | {
         'ModuleInfo: Module: activity InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap stub -> 'traits' -> 'activity' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'messageActivity' -> () From: ( | {
         'ModuleInfo: Module: activity InitialContents: FollowSlot\x7fVisibility: public'
        
         statePrintString = ( |
            | target printString).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'morph' -> () From: ( | {
         'Category: activities\x7fModuleInfo: Module: activity InitialContents: FollowSlot\x7fVisibility: public'
        
         addActivity: a = ( |
            | 
            topmostOwner addActivityIfWorld: a).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'morph' -> () From: ( | {
         'Category: activities\x7fModuleInfo: Module: activity InitialContents: FollowSlot\x7fVisibility: private'
        
         addActivityIfWorld: a = ( |
            | 
            "not in world, do nothing"
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'morph' -> () From: ( | {
         'Category: animation\x7fModuleInfo: Module: activity InitialContents: FollowSlot\x7fVisibility: public'
        
         colorThrobTo: c2 TimePerThrob: sec NumThrobs: n = ( |
             a1.
             a2.
            | 
            "Make n even in order to return to the initial color."
            a1: colorAnimator copyTarget: self Seconds: sec.
            ((a1 from: color) to: c2) useSlowInOut: true.
            n = 1 ifFalse: [
              a2: messageActivity 
                   copyTarget: self 
                   Selector: 'colorThrobTo:TimePerThrob:NumThrobs:'
                   Args: (color & sec & (n-1)) asVector.
              a1: a1 andThen: a2.
            ].
            addActivity: a1.
            a1 "not really right, should return PERSISTENT activity -- dmu").
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'morph' -> () From: ( | {
         'Category: animation\x7fModuleInfo: Module: activity InitialContents: FollowSlot\x7fVisibility: private'
        
         moveThroughPts: aList Index: i RelativeTo: pt TimeBetweenPts: t Reps: n = ( |
             a1.
             a2.
            | 
            isInWorld ifFalse: [ ^ self ].

            a1: (((((positionAnimator copyTarget: self  Seconds: t)
                 from: globalPosition)
                 to:   (pt + (aList at: i)))
                 useSlowInOut: false)
                 abortOnTargetGrab: true).

            i = (aList size - 1) ifTrue: [ 
              n = 1 ifFalse: [
              a2: messageActivity 
                   copyTarget: self 
                   Selector: 'moveThroughPts:Index:RelativeTo:TimeBetweenPts:Reps:'
                   Args: (aList & 0 & pt & t & (n-1))  asVector.
              a1:  a1 andThen: a2.
               ].
            ] False: [ 
              a2: messageActivity 
                   copyTarget: self 
                   Selector: 'moveThroughPts:Index:RelativeTo:TimeBetweenPts:Reps:'
                   Args: (aList & (i + 1) & pt & t & n)  asVector.
              a1:  a1 andThen: a2.
            ].

            addActivity: a1.
            a1 "not really right, should return PERSISTENT activity--dmu").
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'morph' -> () From: ( | {
         'Category: animation\x7fModuleInfo: Module: activity InitialContents: FollowSlot\x7fVisibility: public'
        
         moveThroughPts: aList RelativeTo: pt TimeBetweenPts: t Reps: n = ( |
            | 
            moveThroughPts: aList 
              Index: aList size - 1  
              RelativeTo: pt   
              TimeBetweenPts: t 
              Reps: n).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'morph' -> () From: ( | {
         'Category: animation\x7fModuleInfo: Module: activity InitialContents: FollowSlot\x7fVisibility: public'
        
         moveToObject: obj Offset: p Time: sec = ( |
             a.
            | 
            a:  toObjectAnimator copyTarget: self  Seconds: sec.
            a from: globalPosition.
            a goalObject: obj.
            a offset: p.
            a useSlowInOut: true.
            a abortOnTargetGrab: true.

            addActivity: a.
            a).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'morph' -> () From: ( | {
         'Category: animation\x7fModuleInfo: Module: activity InitialContents: FollowSlot\x7fVisibility: public'
        
         moveToPosition: p = ( |
            | 
            moveToPosition: p Time: 0.5).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'morph' -> () From: ( | {
         'Category: animation\x7fModuleInfo: Module: activity InitialContents: FollowSlot\x7fVisibility: public'
        
         moveToPosition: p Time: sec = ( |
             a.
            | 
            a: positionAnimator copyTarget: self  Seconds: sec.
            a from: globalPosition.
            a   to: p.
            a useSlowInOut: true.
            a abortOnTargetGrab: true.

            addActivity: a.
            a).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'morph' -> () From: ( | {
         'Category: animation\x7fModuleInfo: Module: activity InitialContents: FollowSlot\x7fVisibility: public'
        
         reshapeToBounds: globalB Time: sec = ( |
             a.
            | 
             "Animating bounds does not work well 
            if the receiver is owned by an object trying to 
            maintain layout.  Use animation of size
            in that case."

            a: boundsAnimator copyTarget: self  Seconds: sec.
            a from: bounds.
            a   to:  globalB translateBy: position - globalPosition.
            a useSlowInOut: true.

            addActivity: a.
            a).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'morph' -> () From: ( | {
         'Category: animation\x7fModuleInfo: Module: activity InitialContents: FollowSlot\x7fVisibility: public'
        
         resizeTo: sz Time: sec = ( |
             a.
            | 
            a: sizeAnimator copyTarget: self  Seconds: sec.
            a from: bounds size.
            a   to: sz.
            a useSlowInOut: true.

            addActivity: a.
            a).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'morph' -> () From: ( | {
         'Category: animation\x7fModuleInfo: Module: activity InitialContents: FollowSlot\x7fVisibility: public'
        
         throbToBounds: globalB TimePerThrob: sec NumThrobs: n = ( |
             a1.
             a2.
            | 
            "Make n even in order to return to the initial bounds.
             Animating bounds does not cooperate well with layout constraints.
             Animate size instead."
            a1: boundsAnimator copyTarget: self Seconds: sec.
            ((a1 from: bounds) to:  (globalB translateBy: (position - globalPosition))) 
                useSlowInOut: true.
            n = 1 ifFalse: [
              a2: messageActivity 
                   copyTarget: self 
                   Selector: 'throbToBounds:TimePerThrob:NumThrobs:'
                   Args: (bounds & sec & (n-1)) asVector.
              a1:  a1 andThen: a2.
            ].
            addActivity: a1.
            a1 "not really right, should return PERSISTENT activity--dmu").
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'morph' -> () From: ( | {
         'Category: animation\x7fModuleInfo: Module: activity InitialContents: FollowSlot\x7fVisibility: public'
        
         throbToSize: sz TimePerThrob: sec NumThrobs: n = ( |
             a1.
             a2.
            | 
            "Make n even in order to return to the initial size."
            a1: sizeAnimator copyTarget: self Seconds: sec.
            ((a1 from: bounds size) to: sz) 
                useSlowInOut: true.
            n = 1 ifFalse: [
              a2: messageActivity 
                   copyTarget: self 
                   Selector: 'throbToSize:TimePerThrob:NumThrobs:'
                   Args: (bounds size & sec & (n-1)) asVector.
              a1:  a1 andThen: a2.
            ].
            addActivity: a1.
            a1 "not really right, should return PERSISTENT activity--dmu").
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'periodicMorphStepActivity' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: activity InitialContents: FollowSlot\x7fVisibility: public'
        
         copyTarget: t Period: mSecs = ( |
            | 
            (copyTarget: t) periodMSecs: mSecs).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'periodicMorphStepActivity' -> () From: ( | {
         'ModuleInfo: Module: activity InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap stub -> 'traits' -> 'morphStepActivity' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'periodicMorphStepActivity' -> () From: ( | {
         'Category: stepping\x7fModuleInfo: Module: activity InitialContents: FollowSlot\x7fVisibility: public'
        
         step = ( |
             deltaT.
             now.
            | 
            now: time current.
            deltaT: now - lastTime.
            (deltaT > periodMSecs)
            || (deltaT < 0) "clock was wrong"
              ifTrue: [
                resend.step.
                lastTime: now.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'sequentialActivity' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: activity InitialContents: FollowSlot\x7fVisibility: public'
        
         addAnimator: a = ( |
            | 
            animators: animators copyAddLast: a.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'sequentialActivity' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: activity InitialContents: FollowSlot\x7fVisibility: public'
        
         copyRemoveAllTarget: t = ( |
             new.
            | 
            new: resend.copyTarget: t.
            new animators: animators copyRemoveAll.
            new currentAnimatorIndex: 0.
            new).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'sequentialActivity' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: activity InitialContents: FollowSlot\x7fVisibility: public'
        
         copyTarget: t = ( |
             new.
            | 
            new: resend.copyTarget: t.
            new animators: animators copy mapBy: [| :a | a copyTarget: t ].
            new currentAnimatorIndex: 0.
            new).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'sequentialActivity' -> () From: ( | {
         'Category: stepping\x7fModuleInfo: Module: activity InitialContents: FollowSlot\x7fVisibility: public'
        
         done = ( |
            | currentAnimatorIndex >= animators size).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'sequentialActivity' -> () From: ( | {
         'Category: stepping\x7fModuleInfo: Module: activity InitialContents: FollowSlot\x7fVisibility: public'
        
         finalStep = ( |
            | 
            [done] whileFalse: [| a |
                a: animators at: currentAnimatorIndex.
                a done ifFalse: [ a finalStep ].
                currentAnimatorIndex: currentAnimatorIndex succ.
            ].
            advanceFrameCounter.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'sequentialActivity' -> () From: ( | {
         'ModuleInfo: Module: activity InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'activity' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'sequentialActivity' -> () From: ( | {
         'Category: controlling\x7fModuleInfo: Module: activity InitialContents: FollowSlot\x7fVisibility: public'
        
         shouldAbort = ( |
            | 
            "Abort if any component activity wants to abort or if
             this activity itself wants to abort."

            animators do: [| :a |  
                a shouldAbort ifTrue: [ ^true ].
            ].
            resend.shouldAbort).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'sequentialActivity' -> () From: ( | {
         'Category: stepping\x7fModuleInfo: Module: activity InitialContents: FollowSlot\x7fVisibility: public'
        
         step = ( |
             a.
            | 
            done ifTrue: [ ^self ].
            a: animators at: currentAnimatorIndex.
            a done ifTrue: [
                a finalStep.
                currentAnimatorIndex: currentAnimatorIndex succ.
                done ifFalse: [| nextA |
                    nextA: (animators at: currentAnimatorIndex).
                    nextA startOver.
                    "Overlap last step of the current animator with the
                     first step of the next one."
                    nextA done
                        ifTrue: [ nextA finalStep ]
                         False: [ nextA step      ].
                ].
            ] False: [
                a step.
            ].
            resend.step.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'sizeAnimator' -> () From: ( | {
         'ModuleInfo: Module: activity InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap stub -> 'traits' -> 'interpolatingAnimator' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'sizeAnimator' -> () From: ( | {
         'Category: stepping\x7fModuleInfo: Module: activity InitialContents: FollowSlot\x7fVisibility: public'
        
         setRelativeTargetValue: p = ( |
             sz.
            | 
            target changed.
            sz: ( (from x interpolate: p From: to x) asInteger @
                  (from y interpolate: p From: to y) asInteger).
            target setWidth: sz x Height: sz y.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'toObjectAnimator' -> () From: ( | {
         'ModuleInfo: Module: activity InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'positionAnimator' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'toObjectAnimator' -> () From: ( | {
         'ModuleInfo: Module: activity InitialContents: FollowSlot\x7fVisibility: public'
        
         to = ( |
            | goalObject globalPosition + offset).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'valueAnimator' -> () From: ( | {
         'ModuleInfo: Module: activity InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap stub -> 'traits' -> 'interpolatingAnimator' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'valueAnimator' -> () From: ( | {
         'Category: stepping\x7fModuleInfo: Module: activity InitialContents: FollowSlot\x7fVisibility: public'
        
         setRelativeTargetValue: p = ( |
             val.
            | 
            val: from interpolate: p From: to.
            selector ifNotNil: [
                selector sendTo: target With: val.
            ].
            self).
        } | ) 



 '-- Side effects'

 globals modules activity postFileIn
