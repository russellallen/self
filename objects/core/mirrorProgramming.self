 '$Revision:$'
 '
Copyright 1992-2012 AUTHORS.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: mirrorProgramming InitialContents: FollowSlot'
        
         mirrorProgramming = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'mirrorProgramming' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'mirrorProgramming' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules mirrorProgramming.

CopyDowns:
globals modules init. copy 
SlotsToOmit: directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'mirrorProgramming' -> () From: ( | {
         'ModuleInfo: Module: mirrorProgramming InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'core'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'mirrorProgramming' -> () From: ( | {
         'ModuleInfo: Module: mirrorProgramming InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'mirrorProgramming' -> () From: ( | {
         'ModuleInfo: Module: mirrorProgramming InitialContents: FollowSlot'
        
         myComment <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'mirrorProgramming' -> () From: ( | {
         'ModuleInfo: Module: mirrorProgramming InitialContents: FollowSlot'
        
         postFileIn = ( |
            | resend.postFileIn).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'mirrorProgramming' -> () From: ( | {
         'ModuleInfo: Module: mirrorProgramming InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- '$Revision:$'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'mirrorProgramming' -> () From: ( | {
         'ModuleInfo: Module: mirrorProgramming InitialContents: FollowSlot\x7fVisibility: private'
        
         subpartNames <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'abstractMirror' -> () From: ( | {
         'Category: programming\x7fCategory: replacing one object with another\x7fCategory: hooks for observers\x7fComment: If you want to get notifed of defines,
call me and pass in an object that understands justMutated:
Perhaps the module cache hooks should be changes to use this facility someday. -- dmu 5/04\x7fModuleInfo: Module: mirrorProgramming InitialContents: FollowSlot\x7fVisibility: public'
        
         addObjectMutationObserver: obj = ( |
            | 
            objectMutationObservers add: obj.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'abstractMirror' -> () From: ( | {
         'Category: programming environment\x7fModuleInfo: Module: mirrorProgramming InitialContents: FollowSlot\x7fVisibility: public'
        
         addOrChange: allSlots FormerlyKnownAs: oldName IfAnyFail: failBlock = ( |
             anyFailed <- bootstrap stub -> 'globals' -> 'false' -> ().
             batchAdds.
             batchRms.
             defaultModule.
             nonAsgSlots.
             priorModules.
            | 

            batchAdds: list copyRemoveAll.  batchRms: list copyRemoveAll.

            defaultModule: defaultModuleIfFail: ''.  priorModules: moduleNames.

            nonAsgSlots: allSlots asList copyFilteredBy: [|:s| s isAssignment not].
            nonAsgSlots do: [|:s|
              (shouldChangeSlot: s FormerlyKnownAs: oldName)
               ifFalse: [ anyFailed: true ]
               True: [
                batchAdds addLast: s.
                case
                 if: [s isAssignable] Then: [ | as |
                     "oops, better ask about replacing method with new assignment, too"
                      as: s correspondingAssignmentSlot.
                      (shouldChangeAssignmentSlot: as)
                         ifTrue: [ batchAdds addLast: as ] 
                          False: [ anyNotAdded: true ].
                ]
                If: [s isMethod not] Then: [
                     "and better remove assignment slot if replacing var with const"
                     [|:exit. ss| 
                       ss: at: s name IfFail: exit.
                       ss isAssignable  ifTrue: [batchRms addLast: ss correspondingAssignmentSlot].
                     ] exit.
                ].
              ]. 
            ].
            addSlotsToMeAndDescendants:      batchAdds.
            removeSlotsFromMeAndDescendants: batchRms. 

            nonAsgSlots do: [|:s|
              (includes: s name) ifTrue: [
                (at: s name) maybeSetModuleTo: defaultModule IfNot: priorModules
              ].
            ].
            anyFailed ifTrue: failBlock False: [self]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'abstractMirror' -> () From: ( | {
         'Category: programming\x7fCategory: adding a slot\x7fModuleInfo: Module: mirrorProgramming InitialContents: FollowSlot\x7fVisibility: public'
        
         addSlot: slot = ( |
            | addSlot: slot IfFail: raiseError).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'abstractMirror' -> () From: ( | {
         'Category: programming\x7fCategory: adding a slot\x7fModuleInfo: Module: mirrorProgramming InitialContents: FollowSlot\x7fVisibility: public'
        
         addSlot: slot IfFail: fb = ( |
            | 
            defineAndSave: (copyAddSlot: slot IfFail: [|:e| ^ fb value: e]) IfFail: fb).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'abstractMirror' -> () From: ( | {
         'Category: programming\x7fCategory: adding multiple slots\x7fModuleInfo: Module: mirrorProgramming InitialContents: FollowSlot\x7fVisibility: public'
        
         addSlots: collectionOfSlots = ( |
            | addSlots: collectionOfSlots IfFail: raiseError).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'abstractMirror' -> () From: ( | {
         'Category: programming\x7fCategory: adding multiple slots\x7fModuleInfo: Module: mirrorProgramming InitialContents: FollowSlot\x7fVisibility: public'
        
         addSlots: collectionOfSlots IfFail: fb = ( |
            | defineAndSave: (copyAddSlots: collectionOfSlots IfFail: [|:e| ^ fb value: e]) IfFail: fb).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'abstractMirror' -> () From: ( | {
         'Category: programming\x7fCategory: adding multiple slots\x7fModuleInfo: Module: mirrorProgramming InitialContents: FollowSlot\x7fVisibility: public'
        
         addSlotsIfAbsent: collectionOfSlots = ( |
            | addSlotsIfAbsent: collectionOfSlots IfFail: raiseError).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'abstractMirror' -> () From: ( | {
         'Category: programming\x7fCategory: adding multiple slots\x7fModuleInfo: Module: mirrorProgramming InitialContents: FollowSlot\x7fVisibility: public'
        
         addSlotsIfAbsent: collectionOfSlots IfFail: fb = ( |
            | 
            defineAndSave: (copyAddSlotsIfAbsent: collectionOfSlots 
                                   IfFail: [|:e| ^ fb value: e]
                    ) IfFail: fb).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'abstractMirror' -> () From: ( | {
         'Category: programming\x7fCategory: changing annotation\x7fCategory: mutating annotation\x7fModuleInfo: Module: mirrorProgramming InitialContents: FollowSlot\x7fVisibility: public'
        
         annotation: a = ( |
            | annotation: a IfFail: raiseError).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'abstractMirror' -> () From: ( | {
         'Category: programming\x7fCategory: changing annotation\x7fCategory: mutating annotation\x7fModuleInfo: Module: mirrorProgramming InitialContents: FollowSlot\x7fVisibility: public'
        
         annotation: a IfFail: fb = ( |
            | 
            defineAndSave: (copyAnnotation: a IfFail: [|:e| ^ fb value: e]) IfFail: fb).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'abstractMirror' -> () From: ( | {
         'Category: programming\x7fCategory: adding a slot and setting contents\x7fModuleInfo: Module: mirrorProgramming InitialContents: FollowSlot\x7fVisibility: public'
        
         at: n PutContents: mir = ( |
            | at: n PutContents: mir IfFail: raiseError).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'abstractMirror' -> () From: ( | {
         'Category: programming\x7fCategory: adding a slot and setting contents\x7fModuleInfo: Module: mirrorProgramming InitialContents: FollowSlot\x7fVisibility: public'
        
         at: n PutContents: mir IfFail: fb = ( |
            | 
            defineAndSave:      
              (copyAt: n PutContents: mir IfFail: [|:e| ^ fb value: e]) 
             IfFail: fb).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'abstractMirror' -> () From: ( | {
         'Category: programming\x7fCategory: changing annotation\x7fCategory: comments\x7fModuleInfo: Module: mirrorProgramming InitialContents: FollowSlot\x7fVisibility: public'
        
         comment: c = ( |
            | comment: c IfFail: raiseError).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'abstractMirror' -> () From: ( | {
         'Category: programming\x7fCategory: changing annotation\x7fCategory: comments\x7fModuleInfo: Module: mirrorProgramming InitialContents: FollowSlot\x7fVisibility: public'
        
         comment: c IfFail: fb = ( |
            | annotation: (annotation copyForComment: c) IfFail: fb).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'abstractMirror' -> () From: ( | {
         'Category: programming\x7fCategory: adding a slot\x7fModuleInfo: Module: mirrorProgramming InitialContents: FollowSlot\x7fVisibility: public'
        
         copyAddSlot: slot = ( |
            | copyAddSlot: slot IfFail: raiseError).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'abstractMirror' -> () From: ( | {
         'Category: programming\x7fCategory: adding a slot\x7fModuleInfo: Module: mirrorProgramming InitialContents: FollowSlot\x7fVisibility: public'
        
         copyAddSlot: slot IfFail: fb = ( |
            | 
            primitiveCopyAt: slot key 
                PutContents: slot value 
                   IsParent: slot isParent
                 IsArgument: slot isArgument
                 Annotation: slot annotation
                     IfFail: fb).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'abstractMirror' -> () From: ( | {
         'Category: programming\x7fCategory: adding multiple slots\x7fModuleInfo: Module: mirrorProgramming InitialContents: FollowSlot\x7fVisibility: public'
        
         copyAddSlots: collectionOfSlots = ( |
            | copyAddSlots: collectionOfSlots IfFail: raiseError).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'abstractMirror' -> () From: ( | {
         'Category: programming\x7fCategory: adding multiple slots\x7fModuleInfo: Module: mirrorProgramming InitialContents: FollowSlot\x7fVisibility: public'
        
         copyAddSlots: collectionOfSlots IfFail: fb = ( |
            | 
            copyAddSlots: collectionOfSlots Overwrite: true IfFail: fb).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'abstractMirror' -> () From: ( | {
         'Category: programming\x7fCategory: adding multiple slots\x7fModuleInfo: Module: mirrorProgramming InitialContents: FollowSlot\x7fVisibility: private'
        
         copyAddSlots: collectionOfSlots Overwrite: overwrite IfFail: fb = ( | {
                 'ModuleInfo: Module: mirror InitialContents: FollowSlot'
                
                 assignmentsLast.
                }  {
                 'ModuleInfo: Module: mirror InitialContents: FollowSlot'
                
                 r.
                } 
            | 
            assignmentsLast: list copyRemoveAll.
            collectionOfSlots do: [|:s|  
              s isAssignment 
                ifTrue: [assignmentsLast addLast:  s] 
                 False: [assignmentsLast addFirst: s].
            ].
            r: self.
            assignmentsLast do: [|:s| 
              overwrite || [(r includesKey: s name) not]
                    ifTrue: [r: r copyAddSlot: s IfFail: [|:e| ^ fb value: e]].
            ].
            r).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'abstractMirror' -> () From: ( | {
         'Category: programming\x7fCategory: adding multiple slots\x7fModuleInfo: Module: mirrorProgramming InitialContents: FollowSlot\x7fVisibility: public'
        
         copyAddSlotsIfAbsent: collectionOfSlots = ( |
            | copyAddSlotsIfAbsent: collectionOfSlots IfFail: raiseError).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'abstractMirror' -> () From: ( | {
         'Category: programming\x7fCategory: adding multiple slots\x7fModuleInfo: Module: mirrorProgramming InitialContents: FollowSlot\x7fVisibility: public'
        
         copyAddSlotsIfAbsent: collectionOfSlots IfFail: fb = ( |
            | 
            copyAddSlots: collectionOfSlots Overwrite: false IfFail: fb).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'abstractMirror' -> () From: ( | {
         'Category: programming environment\x7fModuleInfo: Module: mirrorProgramming InitialContents: FollowSlot\x7fVisibility: public'
        
         copyAdoptingArgumentSlotsFrom: argSlotDonor = ( |
             r.
            | 
            r: copyRemoveAllArgumentSlots.
            argSlotDonor do: [|:s|
              s isArgument ifTrue: [ 
                r: r copyAddSlot: s.
              ].
            ].
            r).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'abstractMirror' -> () From: ( | {
         'Category: programming\x7fCategory: changing annotation\x7fCategory: mutating annotation\x7fModuleInfo: Module: mirrorProgramming InitialContents: FollowSlot\x7fVisibility: public'
        
         copyAnnotation: a = ( |
            | copyAnnotation: a IfFail: raiseError).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'abstractMirror' -> () From: ( | {
         'Category: programming\x7fCategory: changing annotation\x7fCategory: mutating annotation\x7fModuleInfo: Module: mirrorProgramming InitialContents: FollowSlot\x7fVisibility: public'
        
         copyAnnotation: a IfFail: fb = ( |
            | 
            reflectionPrimitives forMirror: self CopyAnnotation: a IfFail: [|:err|
                'outOfMemoryError' == err ifFalse: [
                   fb value: err
                ] True: [
                  memory allocationFailed.
                  reflectionPrimitives forMirror: self CopyAnnotation: a IfFail: fb]]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'abstractMirror' -> () From: ( | {
         'Category: programming\x7fCategory: adding a slot and setting contents\x7fModuleInfo: Module: mirrorProgramming InitialContents: FollowSlot\x7fVisibility: public'
        
         copyAt: n PutContents: mir = ( |
            | copyAt: n PutContents: mir IfFail: raiseError).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'abstractMirror' -> () From: ( | {
         'Category: programming\x7fCategory: adding a slot and setting contents\x7fModuleInfo: Module: mirrorProgramming InitialContents: FollowSlot\x7fVisibility: public'
        
         copyAt: n PutContents: mir IfFail: fb = ( |
            | 
            primitiveCopyAt: n 
                PutContents: mir 
                   IsParent: ( primitiveIsParentAt:   n IfFail: false )
                 IsArgument: ( primitiveIsArgumentAt: n IfFail: false )
                 Annotation: ( primitiveAnnotationAt: n IfFail: slotAnnotation )
                     IfFail: fb).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'abstractMirror' -> () From: ( | {
         'Category: programming\x7fCategory: changing annotation\x7fCategory: comments\x7fModuleInfo: Module: mirrorProgramming InitialContents: FollowSlot\x7fVisibility: public'
        
         copyComment: c = ( |
            | copyComment: c IfFail: raiseError).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'abstractMirror' -> () From: ( | {
         'Category: programming\x7fCategory: changing annotation\x7fCategory: comments\x7fModuleInfo: Module: mirrorProgramming InitialContents: FollowSlot\x7fVisibility: public'
        
         copyComment: c IfFail: fb = ( |
            | copyAnnotation: (annotation copyForComment: c) IfFail: fb).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'abstractMirror' -> () From: ( | {
         'Category: programming\x7fCategory: changing annotation\x7fCategory: mutating copy-down annotations\x7fModuleInfo: Module: mirrorProgramming InitialContents: FollowSlot\x7fVisibility: public'
        
         copyCopyDowns: cds = ( |
            | copyCopyDowns: cds IfFail: raiseError).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'abstractMirror' -> () From: ( | {
         'Category: programming\x7fCategory: changing annotation\x7fCategory: mutating copy-down annotations\x7fModuleInfo: Module: mirrorProgramming InitialContents: FollowSlot\x7fVisibility: public'
        
         copyCopyDowns: cds IfFail: fb = ( |
            | copyModuleInfo: (moduleInfo copyForCopyDowns: cds) IfFail: fb).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'abstractMirror' -> () From: ( | {
         'Category: programming\x7fCategory: changing annotation\x7fCategory: mutating creator\x7fModuleInfo: Module: mirrorProgramming InitialContents: FollowSlot\x7fVisibility: public'
        
         copyCreatorPath: p = ( |
            | copyCreatorPath: p IfFail: raiseError).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'abstractMirror' -> () From: ( | {
         'Category: programming\x7fCategory: changing annotation\x7fCategory: mutating creator\x7fModuleInfo: Module: mirrorProgramming InitialContents: FollowSlot\x7fVisibility: public'
        
         copyCreatorPath: p IfFail: fb = ( |
            | 
            copyCreatorSlot: (p targetSlotIfAbsent: [
              ^ fb value: 'cannot set creator of: ', name, ' cannot find target of path: ',
                          p fullName.
            ]) IfFail: fb).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'abstractMirror' -> () From: ( | {
         'Category: programming\x7fCategory: changing annotation\x7fCategory: mutating creator\x7fModuleInfo: Module: mirrorProgramming InitialContents: FollowSlot\x7fVisibility: public'
        
         copyCreatorSlot: s = ( |
            | copyCreatorSlot: s IfFail: raiseError).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'abstractMirror' -> () From: ( | {
         'Category: programming\x7fCategory: changing annotation\x7fCategory: mutating creator\x7fModuleInfo: Module: mirrorProgramming InitialContents: FollowSlot\x7fVisibility: public'
        
         copyCreatorSlot: s IfFail: fb = ( |
            | copyModuleInfo: (moduleInfo copyForCreatorSlotHint: s) IfFail: fb.  self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'abstractMirror' -> () From: ( | {
         'Category: programming\x7fCategory: higher-level operations\x7fCategory: helpers\x7fModuleInfo: Module: mirrorProgramming InitialContents: FollowSlot\x7fVisibility: private'
        
         copyDownFrom: parentMirror Sending: copySelector Omitting: slotsToOmit = ( |
             cd.
            | 
            cd: (((transporter moduleInfo copyDown)
                copyForParentMirror: parentMirror)
                copyForSelector: copySelector)
                copyForSlotsToOmit: [
                  slotsToOmit asVector copyMappedBy: [|:s| s name]].

            copyDowns: vector copyAddLast: cd.
            addCopiedDownSlotsToMeAndDescendants:
                (cd copiedParentMirror
                  removeSlotsFromMeAndDescendants: slotsToOmit)
              From: parentMirror.

            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'abstractMirror' -> () From: ( | {
         'Category: programming\x7fCategory: changing annotation\x7fCategory: mutating copy-down annotations\x7fModuleInfo: Module: mirrorProgramming InitialContents: FollowSlot\x7fVisibility: public'
        
         copyDowns: cds = ( |
            | copyDowns: cds IfFail: raiseError).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'abstractMirror' -> () From: ( | {
         'Category: programming\x7fCategory: changing annotation\x7fCategory: mutating copy-down annotations\x7fModuleInfo: Module: mirrorProgramming InitialContents: FollowSlot\x7fVisibility: public'
        
         copyDowns: cds IfFail: fb = ( |
            | moduleInfo: (moduleInfo copyForCopyDowns: cds) IfFail: fb).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'abstractMirror' -> () From: ( | {
         'Category: programming\x7fCategory: changing annotation\x7fCategory: completeness\x7fModuleInfo: Module: mirrorProgramming InitialContents: FollowSlot\x7fVisibility: public'
        
         copyIsComplete: aBool = ( |
            | 
            copyIsComplete: aBool IfFail: raiseError).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'abstractMirror' -> () From: ( | {
         'Category: programming\x7fCategory: changing annotation\x7fCategory: completeness\x7fModuleInfo: Module: mirrorProgramming InitialContents: FollowSlot\x7fVisibility: public'
        
         copyIsComplete: aBool IfFail: fb = ( |
            | 
            copyAnnotation: (annotation copyIsComplete: aBool) IfFail: fb).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'abstractMirror' -> () From: ( | {
         'Category: programming\x7fCategory: changing annotation\x7fCategory: mutating module info\x7fModuleInfo: Module: mirrorProgramming InitialContents: FollowSlot\x7fVisibility: public'
        
         copyModuleInfo: mi = ( |
            | 
            copyModuleInfo: mi IfFail: raiseError).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'abstractMirror' -> () From: ( | {
         'Category: programming\x7fCategory: changing annotation\x7fCategory: mutating module info\x7fModuleInfo: Module: mirrorProgramming InitialContents: FollowSlot\x7fVisibility: public'
        
         copyModuleInfo: mi IfFail: fb = ( |
            | 
            copyAnnotation: (annotation copyForModuleInfo: mi) IfFail: fb).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'abstractMirror' -> () From: ( | {
         'Category: programming\x7fCategory: removing all slots\x7fModuleInfo: Module: mirrorProgramming InitialContents: FollowSlot\x7fVisibility: public'
        
         copyRemoveAll = ( |
            | copyRemoveAllSlots).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'abstractMirror' -> () From: ( | {
         'Category: programming environment\x7fModuleInfo: Module: mirrorProgramming InitialContents: FollowSlot\x7fVisibility: public'
        
         copyRemoveAllArgumentSlots = ( |
             r.
            | 
            r: self.
            do: [|:s| 
              s isArgument ifTrue: [ 
                r: (r at: s name) copyHolderForRemove.      
              ].
            ].
            r).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'abstractMirror' -> () From: ( | {
         'Category: programming\x7fCategory: removing all slots\x7fModuleInfo: Module: mirrorProgramming InitialContents: FollowSlot\x7fVisibility: public'
        
         copyRemoveAllSlots = ( |
            | copyRemoveAllSlotsIfFail: raiseError).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'abstractMirror' -> () From: ( | {
         'Category: programming\x7fCategory: removing all slots\x7fModuleInfo: Module: mirrorProgramming InitialContents: FollowSlot\x7fVisibility: public'
        
         copyRemoveAllSlotsIfFail: fb = ( |
             r.
            | 
            r: self.
            do: [|:s| s isAssignment ifFalse: [r: (r at: s name) copyHolderForRemove.]].
            r).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'abstractMirror' -> () From: ( | {
         'Category: programming\x7fCategory: removing a slot\x7fModuleInfo: Module: mirrorProgramming InitialContents: FollowSlot\x7fVisibility: public'
        
         copyRemoveSlot: n = ( |
            | copyRemoveSlot: n IfFail: raiseError).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'abstractMirror' -> () From: ( | {
         'Category: programming\x7fCategory: removing a slot\x7fModuleInfo: Module: mirrorProgramming InitialContents: FollowSlot\x7fVisibility: public'
        
         copyRemoveSlot: n IfFail: fb = ( |
            | 
            primitiveCopyRemoveSlot: n IfFail: fb).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'abstractMirror' -> () From: ( | {
         'Category: programming\x7fCategory: higher-level operations\x7fComment: make a copy-down child of this object,
Make a new, empty parent of my parent that
inherits from my parents.
Set the creator of my parent slot.\x7fModuleInfo: Module: mirrorProgramming InitialContents: FollowSlot\x7fVisibility: public'
        
         createSubclass = ( |
             copySelector.
             newChild.
             newTraits.
             parentsToOmit.
             pname = 'parent'.
            | 
            newChild: copyRemoveAll isComplete: false.
            newTraits: reflect: () _Clone.
            parentsToOmit:  asSet copyFilteredBy: [|:s| s isParent ].

            copySelector:
             copyDowns isEmpty 
              ifFalse: [copyDowns first selector]
                 True: [|cdc. sels. selCounts|
                        cdc: browseWellKnown copyDownChildrenOfReflectee: self Limit: 1.
                        sels: cdc asVector copyMappedBy: [|:m| m copyDowns first selector].
                        sels at: 0 IfAbsent: 'copy'
              ].

            copySelector: userQueryMorph askString: 'Copydown selector?' 
                                     DefaultAnswer: copySelector
                                             Event: process this birthEvent.
            newChild copyDownFrom: self Sending: copySelector Omitting: parentsToOmit.

            do: [|:s|
              s isParent ifTrue: [
                newTraits addSlot: s copyHolderForModule: ''
              ]
            ].
             newChild at: pname PutContents: newTraits.
            (newChild at: pname) isParent: true.
            (newChild at: pname) visibility: privateSlot.
            newTraits creatorSlot: newChild at: pname.
            newChild isComplete: isComplete.

            newChild).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'abstractMirror' -> () From: ( | {
         'Category: programming\x7fCategory: changing annotation\x7fCategory: mutating creator\x7fModuleInfo: Module: mirrorProgramming InitialContents: FollowSlot\x7fVisibility: public'
        
         creatorPath: p = ( |
            | creatorPath: p IfFail: raiseError).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'abstractMirror' -> () From: ( | {
         'Category: programming\x7fCategory: changing annotation\x7fCategory: mutating creator\x7fModuleInfo: Module: mirrorProgramming InitialContents: FollowSlot\x7fVisibility: public'
        
         creatorPath: p IfFail: fb = ( |
            | 
            creatorSlot: (p targetSlotIfAbsent: [
              ^ fb value: 'cannot set creator of: ', name, ' cannot find target of path: ',
                          p fullName.
            ]) IfFail: fb).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'abstractMirror' -> () From: ( | {
         'Category: programming\x7fCategory: changing annotation\x7fCategory: mutating creator\x7fModuleInfo: Module: mirrorProgramming InitialContents: FollowSlot\x7fVisibility: public'
        
         creatorSlot: s = ( |
            | creatorSlot: s IfFail: raiseError).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'abstractMirror' -> () From: ( | {
         'Category: programming\x7fCategory: changing annotation\x7fCategory: mutating creator\x7fModuleInfo: Module: mirrorProgramming InitialContents: FollowSlot\x7fVisibility: public'
        
         creatorSlot: s IfFail: fb = ( |
            | moduleInfo: (moduleInfo copyForCreatorSlotHint: s) IfFail: fb.  self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'abstractMirror' -> () From: ( | {
         'Category: programming\x7fCategory: replacing one object with another\x7fModuleInfo: Module: mirrorProgramming InitialContents: FollowSlot\x7fVisibility: public'
        
         define: newObjMir = ( |
            | define: newObjMir IfFail: raiseError).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'abstractMirror' -> () From: ( | {
         'Category: programming\x7fCategory: replacing one object with another\x7fModuleInfo: Module: mirrorProgramming InitialContents: FollowSlot\x7fVisibility: public'
        
         define: newObjMir IfFail: failBlock = ( |
             r.
            | 
            r: primitiveDefine: newObjMir IfFail: failBlock.
            safelyTellObserversAboutMutationOf: r.
            r).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'abstractMirror' -> () From: ( | {
         'Category: programming environment\x7fCategory: missing slots\x7fComment: Iterates through all the selectors which are sent implicitly to self
in all of the reflectee\'s methods, but which the reflectee does not
understand. -- Adam, 6/05\x7fModuleInfo: Module: mirrorProgramming InitialContents: FollowSlot\x7fVisibility: public'
        
         everyMessageReflecteeSendsToSelfButDoesNotUnderstandDo: b = ( |
             understood.
            | 
            understood: everyMessageReflecteeUnderstands.
            everyMessageReflecteeSendsToSelfDo: [|:n|
              (understood includes: n) ifFalse: [b value: n].
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'abstractMirror' -> () From: ( | {
         'Category: programming environment\x7fCategory: missing slots\x7fComment: Iterates through all the non-primitive selectors sent implicitly
to self in all of the reflectee\'s methods. Does not yield any
selector more than once. -- Adam, 6/05\x7fModuleInfo: Module: mirrorProgramming InitialContents: FollowSlot\x7fVisibility: public'
        
         everyMessageReflecteeSendsToSelfDo: b = ( |
             alreadySeen.
            | 
            alreadySeen: set copyRemoveAll.
            slotsInMeAndAncestorsUpTo: (reflect: ()) Do: [|:s|
              s isMethod ifTrue: [
                s contents allImplicitSelfSendsDo: [|:n|
                  alreadySeen if: n IsAbsentAddAndDo: [
                    ('_' isPrefixOf: n) ifFalse: [b value: n].
                  ].
                ].
              ].
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'abstractMirror' -> () From: ( | {
         'Category: programming timestamp\x7fModuleInfo: Module: mirrorProgramming InitialContents: InitializeToExpression: (0)\x7fVisibility: private'
        
         freezeDelta <- 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'abstractMirror' -> () From: ( | {
         'Category: programming timestamp\x7fModuleInfo: Module: mirrorProgramming InitialContents: FollowSlot\x7fVisibility: public'
        
         freezeProgrammingTimestampDo: aBlock = ( |
             ts.
            | 
            ts: programmingTimestamp.
            aBlock onReturn: [
              freezeDelta: freezeDelta + (programmingTimestamp - ts).
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'abstractMirror' -> () From: ( | {
         'Category: programming environment\x7fCategory: missing slots\x7fModuleInfo: Module: mirrorProgramming InitialContents: FollowSlot\x7fVisibility: public'
        
         hasAnyMissingSlots = ( |
            | 
            everyMessageReflecteeSendsToSelfButDoesNotUnderstandDo: [^ true].
            false).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'abstractMirror' -> () From: ( | {
         'Category: programming\x7fCategory: changing annotation\x7fCategory: completeness\x7fModuleInfo: Module: mirrorProgramming InitialContents: FollowSlot\x7fVisibility: public'
        
         isComplete: aBool = ( |
            | 
            isComplete: aBool IfFail: raiseError).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'abstractMirror' -> () From: ( | {
         'Category: programming\x7fCategory: changing annotation\x7fCategory: completeness\x7fModuleInfo: Module: mirrorProgramming InitialContents: FollowSlot\x7fVisibility: public'
        
         isComplete: aBool IfFail: fb = ( |
            | 
            annotation: (annotation copyForIsComplete: aBool) IfFail: fb).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'abstractMirror' -> () From: ( | {
         'Category: programming environment\x7fCategory: missing slots\x7fModuleInfo: Module: mirrorProgramming InitialContents: FollowSlot\x7fVisibility: public'
        
         missingSlots = ( |
             mir.
            | 

            "To see an example of the result of this method, choose the
             Find Missing Slots operation from the menu of an object
             outliner. -- Adam, 6/05"

            mir: reflect: objectToDisplayMissingSlots.

            [objectToDisplayMissingSlots objectWithMissingSlots]. "browsing"
            mir: ((mir slotAt: 'objectWithMissingSlots') copyHolderForContents: self) holder.

            everyMessageReflecteeSendsToSelfButDoesNotUnderstandDo: [|:n. sel. r <- ''. slot |
              sel:  selector copyStr: n.
              r: r & (sel intersperse: (vector copySize: sel numberOfArguments) copyMappedBy: [|:x. :i| 'arg', i succ asString]).
              r: r & ' = (childMustImplement)'.
              slot: (r flatString asSlotIfFail: raiseError) first.
              slot: slot copyHolderForCategory:    'messages that should be implemented'.
              slot: slot copyHolderForVisibility:  visibility privateSlot.
              slot: slot copyHolderForComment:     'Use \'Senders in family\' to find out where this message is sent.'.
              mir: mir copyAddSlot: slot.
            ].

            mir).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'abstractMirror' -> () From: ( | {
         'Category: programming\x7fCategory: changing annotation\x7fCategory: mutating module info\x7fModuleInfo: Module: mirrorProgramming InitialContents: FollowSlot\x7fVisibility: public'
        
         moduleInfo: mi = ( |
            | 
            moduleInfo: mi IfFail: raiseError).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'abstractMirror' -> () From: ( | {
         'Category: programming\x7fCategory: changing annotation\x7fCategory: mutating module info\x7fModuleInfo: Module: mirrorProgramming InitialContents: FollowSlot\x7fVisibility: public'
        
         moduleInfo: mi IfFail: fb = ( |
            | 
            annotation: (annotation copyForModuleInfo: mi) IfFail: fb).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'abstractMirror' -> () From: ( | {
         'Category: programming\x7fCategory: replacing one object with another\x7fCategory: hooks for observers\x7fModuleInfo: Module: mirrorProgramming InitialContents: InitializeToExpression: (set copyRemoveAll)\x7fVisibility: private'
        
         objectMutationObservers <- set copyRemoveAll.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'abstractMirror' -> () From: ( | {
         'Category: programming environment\x7fCategory: missing slots\x7fModuleInfo: Module: mirrorProgramming InitialContents: FollowSlot\x7fVisibility: private'
        
         objectToDisplayMissingSlots = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'mirrors' -> 'abstractMirror' -> 'objectToDisplayMissingSlots' -> () From: ( |
             {} = 'Comment: This object is the result of a Find Missing Slots operation.
It shows you a list of messages that the objectWithMissingSlots
sends to itself but does not understand yet.\x7fModuleInfo: Creator: traits mirrors abstractMirror objectToDisplayMissingSlots.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'abstractMirror' -> () From: ( | {
         'Category: programming\x7fCategory: programming primitives\x7fModuleInfo: Module: mirrorProgramming InitialContents: FollowSlot\x7fVisibility: private'
        
         primitiveCopyAt: n PutContents: objMirr IsParent: p IsArgument: isA Annotation: a IfFail: failBlock = ( |
            | 
            reflectionPrimitives
                forMirror:  self
                   CopyAt:  n asString canonicalize
                      Put:  objMirr
                 IsParent:  p
               IsArgument:  isA
               Annotation:  a
                   IfFail:  [|:error|
              'outOfMemoryError' == error ifFalse: [
                failBlock value: error
              ] True: [
                 memory allocationFailed.
                 ^ reflectionPrimitives
                      forMirror:  self
                         CopyAt:  n asString canonicalize
                            Put:  objMirr
                       IsParent:  p
                     IsArgument: isA
                     Annotation: a
                         IfFail:  failBlock
              ]]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'abstractMirror' -> () From: ( | {
         'Category: programming\x7fCategory: programming primitives\x7fModuleInfo: Module: mirrorProgramming InitialContents: FollowSlot\x7fVisibility: private'
        
         primitiveCopyRemoveSlot: n IfFail: fb = ( |
            | 
            reflectionPrimitives
                        forMirror: self
                   CopyRemoveSlot: n asString canonicalize 
                           IfFail: [|:error|
               'outOfMemoryError' == error ifFalse: [
                 fb value: error
               ] True: [
                 memory allocationFailed.
                 reflectionPrimitives
                             forMirror: self
                        CopyRemoveSlot: n asString canonicalize 
                                IfFail: fb
               ]
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'abstractMirror' -> () From: ( | {
         'Category: programming\x7fCategory: replacing one object with another\x7fModuleInfo: Module: mirrorProgramming InitialContents: FollowSlot\x7fVisibility: private'
        
         primitiveDefine: newObjMir IfFail: fb = ( |
            | 
             reflectionPrimitives forMirror: self Define: newObjMir IfFail: [|:error|
              'outOfMemoryError' == error ifFalse: [
                fb value: error
              ] True: [
                memory allocationFailed.
                reflectionPrimitives forMirror: self Define: newObjMir IfFail: fb
              ]
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'abstractMirror' -> () From: ( | {
         'Category: programming timestamp\x7fModuleInfo: Module: mirrorProgramming InitialContents: FollowSlot\x7fVisibility: public'
        
         programmingTimestamp = ( |
            | 
            programmingTimestampIfFail: raiseError).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'abstractMirror' -> () From: ( | {
         'Category: programming timestamp\x7fModuleInfo: Module: mirrorProgramming InitialContents: FollowSlot\x7fVisibility: public'
        
         programmingTimestampIfFail: fb = ( |
            | _ProgrammingTimestampIfFail: fb).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'abstractMirror' -> () From: ( | {
         'Category: programming\x7fCategory: removing all slots\x7fModuleInfo: Module: mirrorProgramming InitialContents: FollowSlot\x7fVisibility: public'
        
         removeAll = ( |
            | removeAllSlots).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'abstractMirror' -> () From: ( | {
         'Category: programming\x7fCategory: removing all slots\x7fModuleInfo: Module: mirrorProgramming InitialContents: FollowSlot\x7fVisibility: public'
        
         removeAllSlots = ( |
            | removeAllSlotsIfFail: raiseError).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'abstractMirror' -> () From: ( | {
         'Category: programming\x7fCategory: removing all slots\x7fModuleInfo: Module: mirrorProgramming InitialContents: FollowSlot\x7fVisibility: public'
        
         removeAllSlotsIfFail: fb = ( |
            | defineAndSave: (copyRemoveAllSlotsIfFail: [|:e| ^ fb value: e] ) IfFail: fb).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'abstractMirror' -> () From: ( | {
         'Category: programming\x7fCategory: replacing one object with another\x7fCategory: hooks for observers\x7fModuleInfo: Module: mirrorProgramming InitialContents: FollowSlot\x7fVisibility: public'
        
         removeObjectMutationObserver: obj = ( |
            | 
            objectMutationObservers remove: obj IfAbsent: [].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'abstractMirror' -> () From: ( | {
         'Category: programming\x7fCategory: removing a slot\x7fModuleInfo: Module: mirrorProgramming InitialContents: FollowSlot\x7fVisibility: public'
        
         removeSlot: n = ( |
            | removeSlot: n IfFail: raiseError).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'abstractMirror' -> () From: ( | {
         'Category: programming\x7fCategory: removing a slot\x7fModuleInfo: Module: mirrorProgramming InitialContents: FollowSlot\x7fVisibility: public'
        
         removeSlot: n IfFail: b = ( |
            | 
            defineAndSave: (copyRemoveSlot: n IfFail: [|:e| ^b value: e]) IfFail: b).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'abstractMirror' -> () From: ( | {
         'Category: programming\x7fCategory: replacing one object with another\x7fCategory: hooks for observers\x7fModuleInfo: Module: mirrorProgramming InitialContents: FollowSlot\x7fVisibility: private'
        
         safelyTellObserversAboutMutationOf: newMir = ( |
            | 
            [tellObserversAboutMutationOf: newMir]. "browsing"
            scheduler isRunning            ifFalse: [^ self]. "fork would break"
            objectMutationObservers isEmpty ifTrue: [^ self]. "a little optimization"
            (message copy receiver: self Selector: 'tellObserversAboutMutationOf:' With: newMir) fork.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'abstractMirror' -> () From: ( | {
         'Category: programming environment\x7fModuleInfo: Module: mirrorProgramming InitialContents: FollowSlot\x7fVisibility: private'
        
         shouldChangeAssignmentSlot: as = ( |
            | 
                 ( includesKey: as name) not
            ||  [( at: as name ) isAssignment
            ||  [  userQuery askYesNo:  
                    'Do you want to replace method "', 
                     as name, 
                 '"\nwith an assignment slot?' ]]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'abstractMirror' -> () From: ( | {
         'Category: programming environment\x7fModuleInfo: Module: mirrorProgramming InitialContents: FollowSlot\x7fVisibility: private'
        
         shouldChangeSlot: s FormerlyKnownAs: oldName = ( |
            | 
            "if already there, need to ask about adding it"
              "oldName set if the user explicity changed it from oldName"
                   ( includesKey: s name ) not
              || [ ( s name = oldName )
              || [ ( (at: s name) contents = s contents ) "OK if just recategorizing (same contents)"
              || [   userQuery askYesNo: 'Slot: "', s name, '" is already in object.\nAdd it anyway?' ]]]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrors' -> 'abstractMirror' -> () From: ( | {
         'Category: programming\x7fCategory: replacing one object with another\x7fCategory: hooks for observers\x7fModuleInfo: Module: mirrorProgramming InitialContents: FollowSlot\x7fVisibility: private'
        
         tellObserversAboutMutationOf: newObjMir = ( |
            | 
            objectMutationObservers do: [|:ob| ob justMutated: newObjMir].
            self).
        } | ) 



 '-- Side effects'

 globals modules mirrorProgramming postFileIn
