 'Sun-$Revision: 30.8 $'
 '
Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: userInterface\x7fModuleInfo: Module: boxBlueprint InitialContents: FollowSlot\x7fVisibility: public'
        
         boxBlueprint = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'boxBlueprint' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals boxBlueprint.
\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'boxBlueprint' -> () From: ( | {
         'ModuleInfo: Module: boxBlueprint InitialContents: FollowSlot\x7fVisibility: private'
        
         defaultHiddenSlotsPolicy = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'boxBlueprint' -> 'defaultHiddenSlotsPolicy' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits boxBlueprint defaultHiddenSlotsPolicy.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'boxBlueprint' -> () From: ( | {
         'ModuleInfo: Module: boxBlueprint InitialContents: FollowSlot\x7fVisibility: private'
        
         hideSlotsPolicy* <- bootstrap stub -> 'traits' -> 'boxBlueprint' -> 'defaultHiddenSlotsPolicy' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'boxBlueprint' -> () From: ( | {
         'ModuleInfo: Module: boxBlueprint InitialContents: FollowSlot\x7fVisibility: public'
        
         messages <- bootstrap stub -> 'globals' -> 'list' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: userInterface\x7fModuleInfo: Module: boxBlueprint InitialContents: FollowSlot\x7fVisibility: public'
        
         boxBlueprint = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'boxBlueprint' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits boxBlueprint.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'boxBlueprint' -> () From: ( | {
         'ModuleInfo: Module: boxBlueprint InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'boxBlueprint' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'boxBlueprint' -> () From: ( | {
         'ModuleInfo: Module: boxBlueprint InitialContents: FollowSlot\x7fVisibility: public'
        
         slotNames <- bootstrap stub -> 'globals' -> 'list' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'boxBlueprint' -> () From: ( | {
         'ModuleInfo: Module: boxBlueprint InitialContents: FollowSlot\x7fVisibility: public'
        
         storeStringNeeds = bootstrap stub -> 'globals' -> 'boxBlueprint' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: userInterface\x7fModuleInfo: Module: boxBlueprint InitialContents: FollowSlot\x7fVisibility: public'
        
         boxBlueprintDict = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'boxBlueprintDict' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals boxBlueprintDict.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'boxBlueprintDict' -> () From: ( | {
         'Category: adding\x7fModuleInfo: Module: boxBlueprint InitialContents: FollowSlot\x7fVisibility: public'
        
         add: mir Blueprint: bp = ( |
            | 
            dict at: (keyFrom: mir) Put: bp.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'boxBlueprintDict' -> () From: ( | {
         'Category: adding\x7fModuleInfo: Module: boxBlueprint InitialContents: FollowSlot\x7fVisibility: public'
        
         add: mir HidingSlots: slots = ( |
            | 
            add: mir
              Blueprint: boxBlueprint copy showOtherSlots slotNames: slots).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'boxBlueprintDict' -> () From: ( | {
         'Category: adding\x7fModuleInfo: Module: boxBlueprint InitialContents: FollowSlot\x7fVisibility: public'
        
         add: mir Messages: msgs = ( |
            | 
            add: mir Blueprint: boxBlueprint copy messages: msgs).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'boxBlueprintDict' -> () From: ( | {
         'Category: adding\x7fModuleInfo: Module: boxBlueprint InitialContents: FollowSlot\x7fVisibility: public'
        
         add: mir ShowingSlots: slots = ( |
            | 
            add: mir
              Blueprint: boxBlueprint copy hideOtherSlots slotNames: slots).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'boxBlueprintDict' -> () From: ( | {
         'Category: initialization\x7fModuleInfo: Module: boxBlueprint InitialContents: FollowSlot\x7fVisibility: private'
        
         addPointBlueprint = ( |
             bp.
            | 
            bp: boxBlueprint copy showOtherSlots.
            bp slotNames: 
                list copyRemoveAll.
            bp showOtherSlots.
            boxBlueprintDict add: (reflect: point) Blueprint: bp.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'boxBlueprintDict' -> () From: ( | {
         'Category: initialization\x7fModuleInfo: Module: boxBlueprint InitialContents: FollowSlot\x7fVisibility: private'
        
         addProcessBlueprint = ( | {
                 'ModuleInfo: Module: boxBlueprint InitialContents: FollowSlot'
                
                 bp.
                } 
            | 
            bp: boxBlueprint copy hideOtherSlots.
            bp messages: ('finishCurrent' & 'finishSelected' &
                    'step_ui' & 'trimmedStack') asList.
            bp slotNames: list copyRemoveAll add: '<stack>'.
            bp hideOtherSlots.
            boxBlueprintDict add: (reflect: process) Blueprint: bp.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'boxBlueprintDict' -> () From: ( | {
         'ModuleInfo: Module: boxBlueprint InitialContents: InitializeToExpression: (dictionary copyRemoveAll)\x7fVisibility: private'
        
         dict = dictionary copyRemoveAll.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'boxBlueprintDict' -> () From: ( | {
         'Category: initialization\x7fModuleInfo: Module: boxBlueprint InitialContents: FollowSlot'
        
         init = ( |
            | 
            "add some sendable messages to processes"
            "probably not needed when we start filing out"
            addProcessBlueprint.
            addPointBlueprint.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'boxBlueprintDict' -> () From: ( | {
         'ModuleInfo: Module: boxBlueprint InitialContents: FollowSlot\x7fVisibility: private'
        
         keyFrom: mir = ( | {
                 'ModuleInfo: Module: boxBlueprint InitialContents: FollowSlot'
                
                 s.
                } 
            | 
            s: set copy removeAll.
            mir names do: [ | :n | s add: n ].
            s).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'boxBlueprintDict' -> () From: ( | {
         'ModuleInfo: Module: boxBlueprint InitialContents: FollowSlot\x7fVisibility: public'
        
         lookup: mir = ( |
            | 
            dict at: (keyFrom: mir) IfAbsent: [defaultBoxBlueprint]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'boxBlueprintDict' -> () From: ( | {
         'ModuleInfo: Module: boxBlueprint InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'oddball' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: userInterface\x7fModuleInfo: Module: boxBlueprint InitialContents: FollowSlot\x7fVisibility: public'
        
         defaultBoxBlueprint = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'defaultBoxBlueprint' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals defaultBoxBlueprint.
\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'defaultBoxBlueprint' -> () From: ( | {
         'ModuleInfo: Module: boxBlueprint InitialContents: FollowSlot\x7fVisibility: private'
        
         hideSlotsPolicy* = bootstrap stub -> 'traits' -> 'boxBlueprint' -> 'defaultHiddenSlotsPolicy' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'defaultBoxBlueprint' -> () From: ( | {
         'ModuleInfo: Module: boxBlueprint InitialContents: FollowSlot\x7fVisibility: public'
        
         messages = ((bootstrap stub -> 'globals') \/-> 'vector') -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'defaultBoxBlueprint' -> () From: ( | {
         'ModuleInfo: Module: boxBlueprint InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'boxBlueprint' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'defaultBoxBlueprint' -> () From: ( | {
         'ModuleInfo: Module: boxBlueprint InitialContents: FollowSlot\x7fVisibility: public'
        
         slotNames = ((bootstrap stub -> 'globals') \/-> 'vector') -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'defaultBoxBlueprint' -> () From: ( | {
         'ModuleInfo: Module: boxBlueprint InitialContents: FollowSlot\x7fVisibility: public'
        
         storeStringIfFail: fb = ( |
            | fb value: 'should never copy me').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: boxBlueprint InitialContents: FollowSlot'
        
         boxBlueprint = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'boxBlueprint' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'boxBlueprint' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules boxBlueprint.

CopyDowns:
globals modules init. copy 
SlotsToOmit: directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'boxBlueprint' -> () From: ( | {
         'ModuleInfo: Module: boxBlueprint InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'ui1'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'boxBlueprint' -> () From: ( | {
         'ModuleInfo: Module: boxBlueprint InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'boxBlueprint' -> () From: ( | {
         'ModuleInfo: Module: boxBlueprint InitialContents: FollowSlot'
        
         myComment <- 'Slots are shown or hidden on a box according to the following policy:
              1. If the box is created with a message specifying shown/hidden slots,
                 those choices are honored.
              2. Else if the box has appeared on the world before, it is in the
                 hiddenSlotDict (in traits objectBody) and the hidden slot list
                 in that dictionary is used.
              3. Else the box is looked up in the boxBlueprint dictionary.
                 3.1. If the box is not in the boxBlueprint dictionary, the
                      default boxBlueprint is used, which has a hidden slots policy
                      defined in the object traits boxBlueprint defaultHiddenSlotsPolicy.
                 3.2. Else the box is in the boxBlueprint dictionary, and the
                      policy it inherits is used.  This policy is defined in the
                      method \'initialHiddenSlotsFor:\'.'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'boxBlueprint' -> () From: ( | {
         'ModuleInfo: Module: boxBlueprint InitialContents: FollowSlot'
        
         postFileIn = ( |
            | boxBlueprintDict init.
            resend.postFileIn).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'boxBlueprint' -> () From: ( | {
         'ModuleInfo: Module: boxBlueprint InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- 'Sun-$Revision: 30.8 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'boxBlueprint' -> () From: ( | {
         'ModuleInfo: Module: boxBlueprint InitialContents: FollowSlot\x7fVisibility: private'
        
         subpartNames <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'boxBlueprint' -> () From: ( | {
         'ModuleInfo: Module: boxBlueprint InitialContents: FollowSlot\x7fVisibility: public'
        
         copy = ( |
            | (resend.copy messages:  messages copyRemoveAll)
            slotNames: slotNames copyRemoveAll).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'boxBlueprint' -> () From: ( | {
         'Category: hideSlotsPolicies\x7fModuleInfo: Module: boxBlueprint InitialContents: FollowSlot'
        
         defaultHiddenSlots = ( |
            | hideSlotsPolicy: defaultHiddenSlotsPolicy).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'boxBlueprint' -> 'defaultHiddenSlotsPolicy' -> () From: ( | {
         'ModuleInfo: Module: boxBlueprint InitialContents: FollowSlot'
        
         initialHiddenSlotsFor: objBody = ( | {
                 'ModuleInfo: Module: boxBlueprint InitialContents: FollowSlot'
                
                 mir.
                }  {
                 'ModuleInfo: Module: boxBlueprint InitialContents: FollowSlot'
                
                 r <- bootstrap stub -> 'globals' -> 'set' -> ().
                }  {
                 'ModuleInfo: Module: boxBlueprint InitialContents: FollowSlot'
                
                 t <- bootstrap stub -> 'globals' -> 'list' -> ().
                } 
            | 
            mir: objBody objMirror.
            t: t copyRemoveAll.
            mir do: [ | :s | 
                preferences mergeAssignmentSlots &&
                    s value isReflecteeAssignment ifFalse: [ t add: s ].
            ].
            objBody fakeSlotsDo: [ | :s | t add: s ].
            "Must copy the set first, cause this method makes it--
             even if empty--dmu"
            r: hiddenSlotsFor: mir.

            " hide fake slots on methods and strings -- dmu "
            mir isReflecteeMethod  || [mir isReflecteeString] ifTrue: [
                t do: [ | :s | r add: s ].
                ^ r ].

            t size > preferences defaultSlotCountThreshold ifTrue: [
                "Too big; just put non-parents in hidden slot set--dmu"
                t do: [ | :s | s isParent ifFalse: [ r add: s ] ].
            ].

            r).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'boxBlueprint' -> 'defaultHiddenSlotsPolicy' -> () From: ( | {
         'ModuleInfo: Module: boxBlueprint InitialContents: FollowSlot'
        
         policySettingMessage = 'defaultHiddenSlots'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'boxBlueprint' -> () From: ( | {
         'Category: hideSlotsPolicies\x7fModuleInfo: Module: boxBlueprint InitialContents: FollowSlot\x7fVisibility: private'
        
         hiddenSlotsFor: mir = ( |
            | 
            set copyRemoveAll desiredMinCapacity: mir size).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'boxBlueprint' -> () From: ( | {
         'Category: hideSlotsPolicies\x7fModuleInfo: Module: boxBlueprint InitialContents: FollowSlot'
        
         hideOtherSlots = ( |
            | hideSlotsPolicy: hideOtherSlotsPolicy).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'boxBlueprint' -> () From: ( | {
         'ModuleInfo: Module: boxBlueprint InitialContents: FollowSlot\x7fVisibility: private'
        
         hideOtherSlotsPolicy = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'boxBlueprint' -> 'hideOtherSlotsPolicy' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits boxBlueprint hideOtherSlotsPolicy.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'boxBlueprint' -> 'hideOtherSlotsPolicy' -> () From: ( | {
         'ModuleInfo: Module: boxBlueprint InitialContents: FollowSlot'
        
         initialHiddenSlotsFor: objBody = ( | {
                 'ModuleInfo: Module: boxBlueprint InitialContents: FollowSlot'
                
                 hidden.
                }  {
                 'ModuleInfo: Module: boxBlueprint InitialContents: FollowSlot'
                
                 mir.
                } 
            | 
            mir: objBody objMirror.
            hidden: hiddenSlotsFor: mir.
            mir do: [ | :s |
                (slotNames includes: s name) ifFalse: [ hidden add: s ] ].
            hidden).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'boxBlueprint' -> 'hideOtherSlotsPolicy' -> () From: ( | {
         'ModuleInfo: Module: boxBlueprint InitialContents: FollowSlot'
        
         policySettingMessage = 'hideOtherSlots'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'boxBlueprint' -> () From: ( | {
         'ModuleInfo: Module: boxBlueprint InitialContents: FollowSlot\x7fVisibility: private'
        
         indexableSlotsPolicy = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'boxBlueprint' -> 'indexableSlotsPolicy' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits boxBlueprint indexableSlotsPolicy.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'boxBlueprint' -> 'indexableSlotsPolicy' -> () From: ( | {
         'Comment: show indexable slots and slots in slotNames\x7fModuleInfo: Module: boxBlueprint InitialContents: FollowSlot'
        
         initialHiddenSlotsFor: objBody = ( | {
                 'ModuleInfo: Module: boxBlueprint InitialContents: FollowSlot'
                
                 hidden.
                }  {
                 'ModuleInfo: Module: boxBlueprint InitialContents: FollowSlot'
                
                 mir.
                }  {
                 'ModuleInfo: Module: boxBlueprint InitialContents: FollowSlot'
                
                 shownIndexableSlots.
                } 
            | 
            mir: objBody objMirror.
            hidden: hiddenSlotsFor: mir.
            shownIndexableSlots: list copyRemoveAll.
            mir do: [ | :s |
                (slotNames includes: s name) ifFalse: [ hidden add: s ] ].
            objBody fakeSlotsDo: [ | :s |
                s isVectorElement && [isIndexableSlotShown: s]
                    ifTrue: [ shownIndexableSlots add: s ]
                     False: [ hidden add: s ].
            ].
            shownIndexableSlots size > maxSize ifTrue: [
                hidden addAll: shownIndexableSlots ].
            hidden).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'boxBlueprint' -> 'indexableSlotsPolicy' -> () From: ( | {
         'ModuleInfo: Module: boxBlueprint InitialContents: FollowSlot\x7fVisibility: private'
        
         isIndexableSlotShown: s = ( |
            | true).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'boxBlueprint' -> 'indexableSlotsPolicy' -> () From: ( | {
         'ModuleInfo: Module: boxBlueprint InitialContents: FollowSlot\x7fVisibility: private'
        
         maxSize = 10.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'boxBlueprint' -> 'indexableSlotsPolicy' -> () From: ( | {
         'ModuleInfo: Module: boxBlueprint InitialContents: FollowSlot'
        
         policySettingMessage = 'showIndexableSlots'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'boxBlueprint' -> () From: ( | {
         'ModuleInfo: Module: boxBlueprint InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'clonable' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'boxBlueprint' -> () From: ( | {
         'ModuleInfo: Module: boxBlueprint InitialContents: FollowSlot\x7fVisibility: private'
        
         sendersSlotsPolicy = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'boxBlueprint' -> 'sendersSlotsPolicy' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits boxBlueprint sendersSlotsPolicy.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'boxBlueprint' -> 'sendersSlotsPolicy' -> () From: ( | {
         'ModuleInfo: Module: boxBlueprint InitialContents: FollowSlot\x7fVisibility: private'
        
         isIndexableSlotShown: s = ( |
            | 
            "s is an indexable slot in a vector of slot objects"
            s contents reflectee holder hasCreator).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'boxBlueprint' -> 'sendersSlotsPolicy' -> () From: ( | {
         'ModuleInfo: Module: boxBlueprint InitialContents: FollowSlot\x7fVisibility: private'
        
         maxSize = 20.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'boxBlueprint' -> 'sendersSlotsPolicy' -> () From: ( | {
         'ModuleInfo: Module: boxBlueprint InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'boxBlueprint' -> 'indexableSlotsPolicy' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'boxBlueprint' -> 'sendersSlotsPolicy' -> () From: ( | {
         'ModuleInfo: Module: boxBlueprint InitialContents: FollowSlot'
        
         policySettingMessage = 'showSendersSlots'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'boxBlueprint' -> () From: ( | {
         'Category: hideSlotsPolicies\x7fModuleInfo: Module: boxBlueprint InitialContents: FollowSlot'
        
         showIndexableSlots = ( |
            | hideSlotsPolicy: indexableSlotsPolicy).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'boxBlueprint' -> () From: ( | {
         'Category: hideSlotsPolicies\x7fModuleInfo: Module: boxBlueprint InitialContents: FollowSlot'
        
         showOtherSlots = ( |
            | hideSlotsPolicy: showOtherSlotsPolicy).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'boxBlueprint' -> () From: ( | {
         'ModuleInfo: Module: boxBlueprint InitialContents: FollowSlot\x7fVisibility: private'
        
         showOtherSlotsPolicy = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'boxBlueprint' -> 'showOtherSlotsPolicy' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits boxBlueprint showOtherSlotsPolicy.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'boxBlueprint' -> 'showOtherSlotsPolicy' -> () From: ( | {
         'ModuleInfo: Module: boxBlueprint InitialContents: FollowSlot'
        
         initialHiddenSlotsFor: objBody = ( | {
                 'ModuleInfo: Module: boxBlueprint InitialContents: FollowSlot'
                
                 hidden.
                }  {
                 'ModuleInfo: Module: boxBlueprint InitialContents: FollowSlot'
                
                 mir.
                } 
            | 
            mir: objBody objMirror.
            hidden: hiddenSlotsFor: mir.
            mir do: [ | :s |
                (slotNames includes: s name) ifTrue: [ hidden add: s ] ].
            hidden).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'boxBlueprint' -> 'showOtherSlotsPolicy' -> () From: ( | {
         'ModuleInfo: Module: boxBlueprint InitialContents: FollowSlot'
        
         policySettingMessage = 'showOtherSlots'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'boxBlueprint' -> () From: ( | {
         'Category: hideSlotsPolicies\x7fModuleInfo: Module: boxBlueprint InitialContents: FollowSlot'
        
         showSendersSlots = ( |
            | hideSlotsPolicy: sendersSlotsPolicy).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'boxBlueprint' -> () From: ( | {
         'Category: hideSlotsPolicies\x7fModuleInfo: Module: boxBlueprint InitialContents: FollowSlot'
        
         showWellKnownIndexableSlots = ( |
            | 
            hideSlotsPolicy: wellKnownIndexableSlotsPolicy).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'boxBlueprint' -> () From: ( | {
         'ModuleInfo: Module: boxBlueprint InitialContents: FollowSlot\x7fVisibility: public'
        
         storeStringIfFail: fb = ( |
            | 'boxBlueprint copy ', policySettingMessage).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'boxBlueprint' -> () From: ( | {
         'ModuleInfo: Module: boxBlueprint InitialContents: FollowSlot\x7fVisibility: private'
        
         wellKnownIndexableSlotsPolicy = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'boxBlueprint' -> 'wellKnownIndexableSlotsPolicy' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits boxBlueprint wellKnownIndexableSlotsPolicy.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'boxBlueprint' -> 'wellKnownIndexableSlotsPolicy' -> () From: ( | {
         'Comment: show well known indexable slots and slots in slotNames\x7fModuleInfo: Module: boxBlueprint InitialContents: FollowSlot'
        
         initialHiddenSlotsFor: objBody = ( | {
                 'ModuleInfo: Module: boxBlueprint InitialContents: FollowSlot'
                
                 hidden.
                }  {
                 'ModuleInfo: Module: boxBlueprint InitialContents: FollowSlot'
                
                 maxSize = 20.
                }  {
                 'ModuleInfo: Module: boxBlueprint InitialContents: FollowSlot'
                
                 mir.
                }  {
                 'ModuleInfo: Module: boxBlueprint InitialContents: FollowSlot'
                
                 shownIndexableSlots.
                } 
            | 
            mir: objBody objMirror.
            hidden: hiddenSlotsFor: mir.
            shownIndexableSlots: list copyRemoveAll.
            mir do: [ | :s |
                (slotNames includes: s name) ifFalse: [ hidden add: s ] ].
            objBody fakeSlotsDo: [ | :s |
                s isVectorElement && [s contents hasCreator]
                    ifTrue: [ shownIndexableSlots add: s ]
                     False: [ hidden add: s ].
            ].
            shownIndexableSlots size > maxSize ifTrue: [
                hidden addAll: shownIndexableSlots ].
            hidden).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'boxBlueprint' -> 'wellKnownIndexableSlotsPolicy' -> () From: ( | {
         'ModuleInfo: Module: boxBlueprint InitialContents: FollowSlot'
        
         policySettingMessage = 'showWellKnownIndexableSlots'.
        } | ) 



 '-- Side effects'

 globals modules boxBlueprint postFileIn
