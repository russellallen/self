 '$Revision: 30.12 $'
 '
Copyright 1992-2012 AUTHORS.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: profileSliceGrpMod InitialContents: FollowSlot'
        
         profileSliceGrpMod = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'profileSliceGrpMod' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'profileSliceGrpMod' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules profileSliceGrpMod.

CopyDowns:
globals modules init. copy 
SlotsToOmit: directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'profileSliceGrpMod' -> () From: ( | {
         'ModuleInfo: Module: profileSliceGrpMod InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'ui2/outliner'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'profileSliceGrpMod' -> () From: ( | {
         'ModuleInfo: Module: profileSliceGrpMod InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'profileSliceGrpMod' -> () From: ( | {
         'ModuleInfo: Module: profileSliceGrpMod InitialContents: FollowSlot'
        
         myComment <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'profileSliceGrpMod' -> () From: ( | {
         'ModuleInfo: Module: profileSliceGrpMod InitialContents: FollowSlot'
        
         postFileIn = ( |
            | resend.postFileIn).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'profileSliceGrpMod' -> () From: ( | {
         'ModuleInfo: Module: profileSliceGrpMod InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- '$Revision: 30.12 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'profileSliceGrpMod' -> () From: ( | {
         'ModuleInfo: Module: profileSliceGrpMod InitialContents: FollowSlot\x7fVisibility: private'
        
         subpartNames <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: graphical interface\x7fCategory: ui2\x7fCategory: Programming Environment\x7fCategory: Pluggable Self Object Outliner\x7fCategory: Profile Slice Outliner & helpers\x7fModuleInfo: Module: profileSliceGrpMod InitialContents: FollowSlot\x7fVisibility: public'
        
         profileSliceGroupModel = bootstrap define: bootstrap stub -> 'globals' -> 'profileSliceGroupModel' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals generalSliceGroupModel copyForSpecialization ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'profileSliceGroupModel' -> () From: ( |
             {} = 'Comment: I represent a group of slots in a slice.
May contain subgroups. -- dmu 5/1\x7fModuleInfo: Creator: globals profileSliceGroupModel.

CopyDowns:
globals generalSliceGroupModel. copyForSpecialization 
SlotsToOmit: parent.

'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'profileSliceGroupModel' -> () From: ( | {
         'Category: profile slice group state\x7fModuleInfo: Module: profileSliceGrpMod InitialContents: InitializeToExpression: (profileSliceControlPanel)'
        
         controlPanel <- bootstrap stub -> 'globals' -> 'profileSliceControlPanel' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'profileSliceGroupModel' -> () From: ( | {
         'ModuleInfo: Module: profileSliceGrpMod InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'profileSliceGroupModel' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals profileSliceGroupModel parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'profileSliceGroupModel' -> 'parent' -> () From: ( | {
         'Category: title\x7fModuleInfo: Module: profileSliceGrpMod InitialContents: FollowSlot\x7fVisibility: private'
        
         allocationString = ( |
            | referrent node allocationString).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'profileSliceGroupModel' -> 'parent' -> () From: ( | {
         'Category: copying & creating\x7fModuleInfo: Module: profileSliceGrpMod InitialContents: FollowSlot\x7fVisibility: public'
        
         beForOutliner: o = ( |
            | 
            resend.beForOutliner: o isLazy: false).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'profileSliceGroupModel' -> 'parent' -> () From: ( | {
         'Category: building\x7fModuleInfo: Module: profileSliceGrpMod InitialContents: FollowSlot\x7fVisibility: private'
        
         buildContentsOutliners = ( |
             m.
             s.
            | 
            [xxxxx]. "add highlighting"
            referrent node isBlockNode ifTrue:[
              s: referrent node slotIfNone: [ ^vector]
            ] False: [
              s: referrent node owner slotIfNone: [^vector]
            ].
            m: (slotModel newOutlinerFor: s) model.
            m addInSituButtonToHeader.
            referrent node isBlockNode ifTrue:[
              m innerMethod: referrent node method.
            ] False:[
              m innerMethod: referrent node owner method.
            ].
            m bciToSelect: referrent bci min: s contents codes size pred.
            vector copyAddLast: m myOutliner).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'profileSliceGroupModel' -> 'parent' -> () From: ( | {
         'Category: menu\x7fModuleInfo: Module: profileSliceGrpMod InitialContents: FollowSlot\x7fVisibility: private'
        
         buttonDescriptions = bootstrap define: bootstrap stub -> 'globals' -> 'profileSliceGroupModel' -> 'parent' -> 'buttonDescriptions' -> () ToBe: bootstrap addSlotsTo: (
             globals generalModel parent buttonDescriptions _Clone ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'profileSliceGroupModel' -> 'parent' -> 'buttonDescriptions' -> () From: ( |
             {} = 'Comment: Holds button descriptions:
category leaf is button name, 
slot name is button name in buttonCache,
method source is button script,
public slots make asynchronous buttons.\x7fModuleInfo: Creator: globals profileSliceGroupModel parent buttonDescriptions.

CopyDowns:
globals generalModel parent buttonDescriptions. _Clone

'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'profileSliceGroupModel' -> 'parent' -> 'buttonDescriptions' -> () From: ( | {
         'Category: filtering\x7fCategory: Filter out this module\x7fModuleInfo: Module: profileSliceGrpMod InitialContents: FollowSlot'
        
         filterOutThisModule = ( |
            | 
            target filterOutThisModule: event).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'profileSliceGroupModel' -> 'parent' -> () From: ( | {
         'Category: menu\x7fModuleInfo: Module: profileSliceGrpMod InitialContents: FollowSlot\x7fVisibility: private'
        
         buttonsToPutInMenu = ( |
            | 
            [filterOutThisModule]. "browsing"
            resend.buttonsToPutInMenu copyAddLast: 'filterOutThisModule').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'profileSliceGroupModel' -> 'parent' -> () From: ( | {
         'Category: building\x7fModuleInfo: Module: profileSliceGrpMod InitialContents: FollowSlot\x7fVisibility: private'
        
         constructItems = ( |
            | 
            resend.constructItems.
            myOutliner addItems: referrent node profileSliceGroupOutlinersForChildren: referrent node bcisAndNodes
                                                                         ControlPanel: controlPanel.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'profileSliceGroupModel' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: profileSliceGrpMod InitialContents: FollowSlot'
        
         cutoff = ( |
            | 
            controlPanel cutoff).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'profileSliceGroupModel' -> 'parent' -> () From: ( | {
         'Category: title\x7fModuleInfo: Module: profileSliceGrpMod InitialContents: FollowSlot\x7fVisibility: private'
        
         flatTime = ( |
            | 
            referrent node flatTime printString, 'ms').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'profileSliceGroupModel' -> 'parent' -> () From: ( | {
         'Category: helpers\x7fModuleInfo: Module: profileSliceGrpMod InitialContents: FollowSlot\x7fVisibility: public'
        
         newOutlinerFor: whatever ControlPanel: controlPanel = ( |
            | 
            (copy controlPanel: controlPanel) newOutlinerFor: whatever).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'profileSliceGroupModel' -> 'parent' -> () From: ( | {
         'Category: title\x7fModuleInfo: Module: profileSliceGrpMod InitialContents: FollowSlot\x7fVisibility: private'
        
         normalizedTime = ( |
             t.
             ts.
            | 
            t: referrent node normalizedTime.
            ts: (t * 100) printStringPrecision: 0.
            ts, '%').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'profileSliceGroupModel' -> 'parent' -> () From: ( | {
         'Category: building\x7fModuleInfo: Module: profileSliceGrpMod InitialContents: FollowSlot\x7fVisibility: private'
        
         outlinerPrototype = ( |
            | 
            profileSliceGroupOutliner).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'profileSliceGroupModel' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: profileSliceGrpMod InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'globals' -> 'generalSliceGroupModel' -> 'parent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'profileSliceGroupModel' -> 'parent' -> () From: ( | {
         'Category: title\x7fModuleInfo: Module: profileSliceGrpMod InitialContents: FollowSlot\x7fVisibility: private'
        
         shallowNormalizedTime = ( |
            | 
            (referrent node shallowNormalizedTime * 100) asInteger printString, '%').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'profileSliceGroupModel' -> 'parent' -> () From: ( | {
         'Category: title\x7fModuleInfo: Module: profileSliceGrpMod InitialContents: FollowSlot\x7fVisibility: private'
        
         shallowTime = ( |
            | 
            referrent node shallowTime printString, 'ms').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'profileSliceGroupModel' -> 'parent' -> () From: ( | {
         'Category: building\x7fModuleInfo: Module: profileSliceGrpMod InitialContents: FollowSlot'
        
         slotModel = ( |
            | 
            profileSelfSlotModel).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'profileSliceGroupModel' -> 'parent' -> () From: ( | {
         'Category: title\x7fModuleInfo: Module: profileSliceGrpMod InitialContents: FollowSlot\x7fVisibility: public'
        
         timeString = ( |
             ts.
            | 
            case if: [controlPanel beForShallow]
               Then: [ts: shallowTime]
                 If: [isForFlat]
               Then: [ts: flatTime]
               Else: [ts: normalizedTime].

            ('   ' copySize: (3 - ts size max: 0)), ts,' ').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'profileSliceGroupModel' -> 'parent' -> () From: ( | {
         'Category: title\x7fModuleInfo: Module: profileSliceGrpMod InitialContents: FollowSlot\x7fVisibility: public'
        
         titleString = ( |
             r.
             showPruningInfo = bootstrap stub -> 'globals' -> 'false' -> ().
            | 
            r: timeString & '  '.
            r: r & '-> ' & referrent node idString & ' in: ' & referrent holderIDString.
            referrent node pruningInfo hasHighShallowTime ifTrue: [ r: r & ' shallow time: ' & shallowNormalizedTime].
            showPruningInfo ifTrue: [r: r & referrent node pruningInfoString]. "Useful for debugging the pruning algorithm."
            r flatString).
        } | ) 



 '-- Side effects'

 globals modules profileSliceGrpMod postFileIn
