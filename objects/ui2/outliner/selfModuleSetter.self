 '$Revision: 30.8 $'
 '
Copyright 1992-2012 AUTHORS.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: selfModuleSetter InitialContents: FollowSlot'
        
         selfModuleSetter = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'selfModuleSetter' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'selfModuleSetter' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules selfModuleSetter.

CopyDowns:
globals modules init. copy 
SlotsToOmit: directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'selfModuleSetter' -> () From: ( | {
         'ModuleInfo: Module: selfModuleSetter InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'ui2/outliner'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'selfModuleSetter' -> () From: ( | {
         'ModuleInfo: Module: selfModuleSetter InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'selfModuleSetter' -> () From: ( | {
         'ModuleInfo: Module: selfModuleSetter InitialContents: FollowSlot'
        
         myComment <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'selfModuleSetter' -> () From: ( | {
         'ModuleInfo: Module: selfModuleSetter InitialContents: FollowSlot'
        
         postFileIn = ( |
            | resend.postFileIn).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'selfModuleSetter' -> () From: ( | {
         'ModuleInfo: Module: selfModuleSetter InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- '$Revision: 30.8 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'selfModuleSetter' -> () From: ( | {
         'ModuleInfo: Module: selfModuleSetter InitialContents: FollowSlot\x7fVisibility: private'
        
         subpartNames <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: ui2\x7fCategory: Programming Environment\x7fCategory: Pluggable Self Object Outliner\x7fModuleInfo: Module: selfModuleSetter InitialContents: FollowSlot\x7fVisibility: public'
        
         selfModuleSetter = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'selfModuleSetter' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals selfModuleSetter.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfModuleSetter' -> () From: ( | {
         'ModuleInfo: Module: selfModuleSetter InitialContents: InitializeToExpression: (nil)'
        
         myOutliner.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfModuleSetter' -> () From: ( | {
         'ModuleInfo: Module: selfModuleSetter InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'selfModuleSetter' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals selfModuleSetter parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfModuleSetter' -> 'parent' -> () From: ( | {
         'Comment: sent from menu item for either
object or category outliner
-- dmu\x7fModuleInfo: Module: selfModuleSetter InitialContents: FollowSlot\x7fVisibility: public'
        
         chooseSlotsAndSetModule: evt = ( |
             menu.
             mods.
             tgt.
            | 
            mods: myOutliner model moduleNames.
            menu: ui2Menu copy.
            menu addMorphLast: labelMorph copy label:  'Of which slots?'.
            menu addDivider.
            menu addButtonTarget: self 
                     ScriptBlock: [target setModuleOfSlotsIn: '*' Event: event]
                           Label: 'All'.
            mods size > 1 ifTrue: [
              menu addDivider.
              mods asVector copySort do: [|:m. mm|
                mm: m isEmpty ifTrue: '-' False: m.
                menu addButtonTarget: self 
                              ScriptBlock: [target setModuleOfSlotsIn: button label Event: event]
                               Label: mm.
              ].
            ].
            ofDefaultButtonHolder: menu initializeDefaultButtonHolder: ofDefaultButtonHolder.
            menu colorAll: menu color.
            menu popUp: evt.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfModuleSetter' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: selfModuleSetter InitialContents: FollowSlot\x7fVisibility: public'
        
         copyForOutliner: o = ( |
            | 
            copy myOutliner: o).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfModuleSetter' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: selfModuleSetter InitialContents: FollowSlot'
        
         mirror = ( |
            | slotsToChange first holder).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfModuleSetter' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: selfModuleSetter InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         ofDefaultButtonHolder <- bootstrap stub -> 'globals' -> 'nil' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfModuleSetter' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: selfModuleSetter InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'clonable' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfModuleSetter' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: selfModuleSetter InitialContents: FollowSlot\x7fVisibility: public'
        
         setModuleOfSlot: s Event: e = ( |
            | 
            slotsToChange: vector copyAddLast: s.
            setModuleOfSlots: e).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfModuleSetter' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: selfModuleSetter InitialContents: FollowSlot\x7fVisibility: private'
        
         setModuleOfSlots: event = ( |
             menu.
             mns.
            | 

            slotsToChange isEmpty ifTrue: [
              userQuery show: 'No slots to change.' ForSecs: 5.
              ^ self.
            ].

            menu: ui2Menu copy.
            menu addMorphLast: (labelMorph copy label: 'To which module?').
            menu addDivider.

            mns: mirror moduleNames asList.
            mirror creatorSlotIfPresent: [|:s. n|
              n: s module.
              (mns includes: n) ifFalse: [mns: mns copy addFirst: n].
            ] IfAbsent: [].

            mns: mns copySort.

            mns do: [|:n. |
               "async for protect:"
              menu      addButtonTarget:  self
                AsynchronousScriptBlock:  [target setModuleTo: buttonArgs  Event: event]
                             ButtonArgs:  n
                                  Label:  n isEmpty ifTrue: '-' False: n.
            ].

            menu addDivider.
            menu      addButtonTarget: self
              AsynchronousScriptBlock: [target setModuleOfSlotsToOther: event]
                                Label: 'other'.
            toDefaultButtonHolder: menu initializeDefaultButtonHolder: toDefaultButtonHolder.
            menu colorAll: menu color.
            menu popUp: event.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfModuleSetter' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: selfModuleSetter InitialContents: FollowSlot\x7fVisibility: private'
        
         setModuleOfSlotsIn: modName Event: event = ( |
            | 
            "modName may be * or -"

            slotsToChange: myOutliner model slotsInMeAndSubcategories copyFilteredBy: [|:s| 
              s isAnnotationIgnored not  && [ | n |
                n: s module.
                 case if: [modName = '*'] Then: true
                      If: [modName = '-'] Then: [ n isEmpty ]
                      Else: [ modName = n ]
              ].
            ].
            setModuleOfSlots: event).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfModuleSetter' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: selfModuleSetter InitialContents: FollowSlot\x7fVisibility: private'
        
         setModuleOfSlotsToOther: event = ( |
             newName <- ''.
            | 
            newName: transporter moduleDictionary
              getAModuleNameQuestion: 'Set to which module?'
                             Default: ''
                            IfCancel: [ ^ self ].

            setModuleTo: newName Event: event).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfModuleSetter' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: selfModuleSetter InitialContents: FollowSlot\x7fVisibility: private'
        
         setModuleTo: newName Event: event = ( |
            | 
            myOutliner model protect: [
              slotsToChange do: [|:s| s module: newName ].
            ].
            update.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfModuleSetter' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: selfModuleSetter InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         toDefaultButtonHolder <- bootstrap stub -> 'globals' -> 'nil' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfModuleSetter' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: selfModuleSetter InitialContents: FollowSlot\x7fVisibility: private'
        
         update = ( |
             o.
            | 
            o: myOutliner.
            [
              o safelyDo: [o update].
              o: o enclosingOutlinerIfPresent: [|:eo| eo]
                                     IfAbsent: [^ self].
            ] loop).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfModuleSetter' -> () From: ( | {
         'ModuleInfo: Module: selfModuleSetter InitialContents: InitializeToExpression: (nil)'
        
         slotsToChange.
        } | ) 



 '-- Side effects'

 globals modules selfModuleSetter postFileIn
