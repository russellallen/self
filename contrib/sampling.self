 '
Written by Ivan Moore <ivan@cs.man.ac.uk>.
Added to the contrib area by Mario Wolczko <Mario.Wolczko@eng.sun.com>.

Here is some code which will tell you the object ID of an object that
you want to refer to, so you can refer to it using \'NUMBER as\' where
NUMBER is the appropriate object ID.
 
After \'_RunScript\'ing the file, have a look at the comment of
\'oidSamplerMorph\'. Please let me know if you have any problems
loading this, I tried it on a fresh new image and it worked for
me. (Please don\'t look at the actual code - it\'s not my best - but
nevertheless does work)
 
My apologies to those who think this is a horrible way of doing this, but it 
does work.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: mirror samplers\x7fModuleInfo: Module: sampling InitialContents: FollowSlot'
        
         copyButtonMorphFor: aMorphName = ( |
            | 
            (ui2Button copy label: (aMorphName sendTo: self) title) script: 'event sourceHand attach: ',aMorphName,' copy').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: mirror samplers\x7fModuleInfo: Module: sampling InitialContents: FollowSlot'
        
         eraseMorph = bootstrap define: bootstrap stub -> 'globals' -> 'eraseMorph' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             bootstrap remove: 'prototype' From:
             globals frameMorph copyRemoveAllMorphs ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'eraseMorph' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals eraseMorph.

CopyDowns:
globals frameMorph. copyRemoveAllMorphs 
SlotsToOmit: parent prototype.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'eraseMorph' -> () From: ( | {
         'ModuleInfo: Module: sampling InitialContents: FollowSlot\x7fVisibility: private'
        
         highlightBox.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'eraseMorph' -> () From: ( | {
         'ModuleInfo: Module: sampling InitialContents: InitializeToExpression: (nil)'
        
         mirrorsOfObjectsOld.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'eraseMorph' -> () From: ( | {
         'ModuleInfo: Module: sampling InitialContents: FollowSlot\x7fVisibility: public'
        
         morphTypeName = 'eraseMorph'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'oidSamplerMorph' -> () From: ( | {
         'ModuleInfo: Module: sampling InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'oidSamplerMorph' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals oidSamplerMorph parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'eraseMorph' -> () From: ( | {
         'ModuleInfo: Module: sampling InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap stub -> 'globals' -> 'oidSamplerMorph' -> 'parent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'eraseMorph' -> () From: ( | {
         'Category: filing out\x7fModuleInfo: Module: sampling InitialContents: FollowSlot\x7fVisibility: public'
        
         prototype = ( |
            | 
            eraseMorph).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'eraseMorph' -> () From: ( | {
         'ModuleInfo: Module: sampling InitialContents: FollowSlot'
        
         title = 'erase'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'eraseMorph' -> () From: ( | {
         'ModuleInfo: Module: sampling InitialContents: FollowSlot\x7fVisibility: private'
        
         updateForSubmorphs: mList Using: msg = ( |
             mirrors.
            | 
            mirrors: set copy.
            removeAllMorphs.
            addTitle.
            mList do: [| :m | m deleteIfOutliner ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: sampling InitialContents: FollowSlot'
        
         sampling = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'sampling' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'comment' From:
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'sampling' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules sampling.

CopyDowns:
globals modules init. copy 
SlotsToOmit: comment directory fileInTimeString postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'sampling' -> () From: ( | {
         'ModuleInfo: Module: sampling InitialContents: FollowSlot\x7fVisibility: public'
        
         comment <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'sampling' -> () From: ( | {
         'ModuleInfo: Module: sampling InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'applications'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'sampling' -> () From: ( | {
         'ModuleInfo: Module: sampling InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'sampling' -> () From: ( | {
         'ModuleInfo: Module: sampling InitialContents: FollowSlot'
        
         postFileIn = ( |
            | 
            transporter moduleDictionary resetFillingSemaphore.
            snapshotAction addSchedulerInitialMessage:  
              message copy receiver: transporter moduleDictionary
                           Selector: 'resetFillingSemaphore'.
            resend.postFileIn).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'sampling' -> () From: ( | {
         'ModuleInfo: Module: sampling InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- '$Revision: 1.1.1.1 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'sampling' -> () From: ( | {
         'ModuleInfo: Module: sampling InitialContents: FollowSlot\x7fVisibility: public'
        
         subpartNames <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: mirror samplers\x7fCategory: mirror sampler morphs\x7fModuleInfo: Module: sampling InitialContents: FollowSlot'
        
         numberOfSlotsSamplerMorph = bootstrap define: bootstrap stub -> 'globals' -> 'numberOfSlotsSamplerMorph' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             bootstrap remove: 'prototype' From:
             globals frameMorph copyRemoveAllMorphs ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'numberOfSlotsSamplerMorph' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals numberOfSlotsSamplerMorph.

CopyDowns:
globals frameMorph. copyRemoveAllMorphs 
SlotsToOmit: parent prototype.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'numberOfSlotsSamplerMorph' -> () From: ( | {
         'ModuleInfo: Module: sampling InitialContents: FollowSlot\x7fVisibility: private'
        
         highlightBox.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'numberOfSlotsSamplerMorph' -> () From: ( | {
         'ModuleInfo: Module: sampling InitialContents: InitializeToExpression: (nil)'
        
         mirrorsOfObjectsOld <- bootstrap stub -> 'globals' -> 'nil' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'numberOfSlotsSamplerMorph' -> () From: ( | {
         'ModuleInfo: Module: sampling InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'numberOfSlotsSamplerMorph' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals numberOfSlotsSamplerMorph parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'numberOfSlotsSamplerMorph' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: sampling InitialContents: FollowSlot\x7fVisibility: public'
        
         morphTypeName = 'numberOfSlotsSamplerMorph'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'numberOfSlotsSamplerMorph' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: sampling InitialContents: FollowSlot'
        
         myMessage = 'numberOfSlotsString'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'oidSamplerMorph' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: sampling InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'oidSamplerMorph' -> 'parent' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals oidSamplerMorph parent parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'numberOfSlotsSamplerMorph' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: sampling InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap stub -> 'globals' -> 'oidSamplerMorph' -> 'parent' -> 'parent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'numberOfSlotsSamplerMorph' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: sampling InitialContents: FollowSlot'
        
         title = 'number of slots'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'numberOfSlotsSamplerMorph' -> () From: ( | {
         'Category: filing out\x7fModuleInfo: Module: sampling InitialContents: FollowSlot\x7fVisibility: public'
        
         prototype = ( |
            | 
            numberOfSlotsSamplerMorph).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: mirror samplers\x7fCategory: mirror sampler morphs\x7fModuleInfo: Module: sampling InitialContents: FollowSlot'
        
         oidSamplerMorph = bootstrap define: bootstrap stub -> 'globals' -> 'oidSamplerMorph' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             bootstrap remove: 'prototype' From:
             globals frameMorph copyRemoveAllMorphs ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'oidSamplerMorph' -> () From: ( |
             {} = 'Comment: This is a morph which tells you the object ID number 
for the object underneath it.
(but only starts working once it has been dropped once)
The object ID number can be used to refer to an
object by sending it the message \'as\'.
For example, the object with object ID number = 5
can be refered to using \'5 as\'.
Other related thingies:
\"eraseMorph\" deletes the object underneath it.
\"numberOfSlotsSamplerMorph\" tells you the number of
   slots that the object underneath it has.
(Both these also don\'t start working until they have been
dropped once)
(There seems to be a strange behavior if these 3 morphs 
 are used - please use copies only - preferably using 
 \'copyButtonMorphFor:\' as described below)
-----
Another related thing:
\"copyButtonMorphFor: \'eraseMorph\'\"
will produce a button which when pressed attaches a new
eraseMorph to your \'hand\'. 
Can also be used for \'oidSamplerMorph\' and 
       \'numberOfSlotsSamplerMorph\'.
-----
All the above are (c) Ivan Moore 1995, have no warranty 
and are *not* examples of particularly good Self code.\x7fModuleInfo: Creator: globals oidSamplerMorph.

CopyDowns:
globals frameMorph. copyRemoveAllMorphs 
SlotsToOmit: parent prototype.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'oidSamplerMorph' -> () From: ( | {
         'ModuleInfo: Module: sampling InitialContents: FollowSlot\x7fVisibility: private'
        
         highlightBox.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'oidSamplerMorph' -> () From: ( | {
         'ModuleInfo: Module: sampling InitialContents: InitializeToExpression: (nil)'
        
         mirrorsOfObjectsOld <- bootstrap stub -> 'globals' -> 'nil' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'oidSamplerMorph' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: sampling InitialContents: FollowSlot\x7fVisibility: public'
        
         morphTypeName = 'oidSamplerMorph'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'oidSamplerMorph' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: sampling InitialContents: FollowSlot'
        
         myMessage = 'reflecteeIDPrintString'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'oidSamplerMorph' -> 'parent' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: sampling InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'oidSamplerMorph' -> 'parent' -> 'parent' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals oidSamplerMorph parent parent parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'oidSamplerMorph' -> 'parent' -> 'parent' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: sampling InitialContents: FollowSlot'
        
         addTitle = ( |
            | color: paint named: 'lightGray'.
            addMorph: labelMorph copy label: title).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'oidSamplerMorph' -> 'parent' -> 'parent' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: sampling InitialContents: FollowSlot'
        
         copy = ( |
            | resend.copy addTitle).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'oidSamplerMorph' -> 'parent' -> 'parent' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: sampling InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap stub -> 'traits' -> 'coreSamplerMorph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'oidSamplerMorph' -> 'parent' -> 'parent' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: sampling InitialContents: FollowSlot\x7fVisibility: private'
        
         submorphsMatch: mList = ( |
             mirrors.
             result.
            | 
            mirrors: set copy.
            mList do: [| :m | mirrors addAll: m mirrorsOfObjectsIRepresent ].
            result: mirrorsOfObjectsOld = mirrors.
            mirrorsOfObjectsOld: mirrors.
            result).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'oidSamplerMorph' -> 'parent' -> 'parent' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: sampling InitialContents: FollowSlot'
        
         updateForSubmorphs: mList = ( |
            | 
            updateForSubmorphs: mList Using: myMessage).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'oidSamplerMorph' -> 'parent' -> 'parent' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: sampling InitialContents: FollowSlot\x7fVisibility: private'
        
         updateForSubmorphs: mList Using: msg = ( |
             mirrors.
             ambiguities.
            | 
            mirrors: set copy.
            ambiguities: set copy.
            removeAllMorphs.
            mList do: [| :m | mirrors addAll: m mirrorsOfObjectsIRepresent ].
            addTitle.
            mirrors do: [| :mirror | ambiguities addAll: msg sendTo: mirror ].
            addAllMorphs: ( ambiguities copyMappedBy: [ | :ambiguity |
                                    labelMorph copy label: ambiguity ]).
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'oidSamplerMorph' -> 'parent' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: sampling InitialContents: FollowSlot\x7fVisibility: private'
        
         updateForSubmorphs: mList Using: msg = ( |
             mirrors.
            | 
            mirrors: set copy.
            removeAllMorphs.
            mList do: [| :m | mirrors addAll: m mirrorsOfObjectsIRepresent ].
            addTitle.
            addAllMorphs: ( mirrors copyMappedBy: [ | :mirror |
                                    labelMorph copy label: msg sendTo: mirror ]).
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'oidSamplerMorph' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: sampling InitialContents: FollowSlot'
        
         title = 'object ID'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'oidSamplerMorph' -> () From: ( | {
         'Category: filing out\x7fModuleInfo: Module: sampling InitialContents: FollowSlot\x7fVisibility: public'
        
         prototype = ( |
            | 
            oidSamplerMorph).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'abstractMirror' -> () From: ( | {
         'Category: restructuring stuff\x7fCategory: mirrorSampler stuff\x7fCategory: simpler stuff\x7fModuleInfo: Module: sampling InitialContents: FollowSlot'
        
         numberOfSlotsString = ( |
            | 
            size printString).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'abstractMirror' -> () From: ( | {
         'Category: restructuring stuff\x7fCategory: mirrorSampler stuff\x7fCategory: simpler stuff\x7fModuleInfo: Module: sampling InitialContents: FollowSlot'
        
         reflecteeIDPrintString = ( |
            | 
            reflecteeID printString).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'morph' -> () From: ( | {
         'ModuleInfo: Module: sampling InitialContents: FollowSlot'
        
         deleteIfOutliner = ( |
            | 
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'morph' -> () From: ( | {
         'ModuleInfo: Module: sampling InitialContents: InitializeToExpression: (set copy)'
        
         mirrorsOfObjectsIRepresent = set copy.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectOutliner' -> () From: ( | {
         'ModuleInfo: Module: sampling InitialContents: FollowSlot'
        
         deleteIfOutliner = ( |
            | delete).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectOutliner' -> () From: ( | {
         'ModuleInfo: Module: sampling InitialContents: FollowSlot'
        
         mirrorsOfObjectsIRepresent = ( |
            | set copy add: mirror).
        } | ) 



 '-- Side effects'

 globals modules sampling postFileIn
