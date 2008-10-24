 '$Revision: 30.7 $'
 '
Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap stub -> 'globals' -> 'modules' -> () _AddSlots: ( | {
         'ModuleInfo: Module: reorganizer InitialContents: FollowSlot'
        
         reorganizer = bootstrap stub -> 'globals' -> 'modules' -> 'reorganizer' -> () _Define: (
             bootstrap remove: 'comment' From:
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) _AddSlots: bootstrap stub -> 'globals' -> 'modules' -> 'reorganizer' -> () _AddSlots: ( |
             {} = 'ModuleInfo: Creator: globals modules reorganizer.

CopyDowns:
globals modules init. copy 
SlotsToOmit: comment directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap stub -> 'globals' -> 'modules' -> 'reorganizer' -> () _AddSlots: ( | {
         'ModuleInfo: Module: reorganizer InitialContents: FollowSlot\x7fVisibility: public'
        
         comment = ('This doesn\'t do the whole job -- there are still
	 creator paths that are wrong.  You have been warned!').
        } | ) 

 bootstrap stub -> 'globals' -> 'modules' -> 'reorganizer' -> () _AddSlots: ( | {
         'ModuleInfo: Module: reorganizer InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'misc'.
        } | ) 

 bootstrap stub -> 'globals' -> 'modules' -> 'reorganizer' -> () _AddSlots: ( | {
         'ModuleInfo: Module: reorganizer InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap stub -> 'globals' -> 'modules' -> 'reorganizer' -> () _AddSlots: ( | {
         'ModuleInfo: Module: reorganizer InitialContents: FollowSlot'
        
         postFileIn = ( |
            | 
            resend.postFileIn).
        } | ) 

 bootstrap stub -> 'globals' -> 'modules' -> 'reorganizer' -> () _AddSlots: ( | {
         'ModuleInfo: Module: reorganizer InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- '$Revision: 30.7 $'.
        } | ) 

 bootstrap stub -> 'globals' -> 'modules' -> 'reorganizer' -> () _AddSlots: ( | {
         'ModuleInfo: Module: reorganizer InitialContents: FollowSlot\x7fVisibility: public'
        
         subpartNames <- ''.
        } | ) 

 bootstrap stub -> 'globals' -> () _AddSlots: ( | {
         'Category: applications\x7fModuleInfo: Module: reorganizer InitialContents: FollowSlot'
        
         reorganizer = bootstrap stub -> 'globals' -> 'reorganizer' -> () _AddSlots: ( |
             {} = 'ModuleInfo: Creator: globals reorganizer.
'.
            | ) .
        } | ) 

 bootstrap stub -> 'globals' -> 'reorganizer' -> () _AddSlots: ( | {
         'ModuleInfo: Module: reorganizer InitialContents: InitializeToExpression: (nil)'
        
         creatorSlots <- bootstrap stub -> 'globals' -> 'nil' -> ().
        } | ) 

 bootstrap stub -> 'globals' -> 'reorganizer' -> () _AddSlots: ( | {
         'ModuleInfo: Module: reorganizer InitialContents: FollowSlot\x7fVisibility: public'
        
         doLobby = ( |
            | 
            eliminatedSlots: sequence copyRemoveAll.
            dontChange: set copyRemoveAll.
            dontChange add: 'visibility'.

            reOrgObj: globals.
            reOrgObj: traits.
            reOrgObj: mixins.

            eliminatedSlots do: [|:n|
              process this birthEvent sourceHand attach:
                (implementorsMorph copySelector: n)
            ]).
        } | ) 

 bootstrap stub -> 'globals' -> 'reorganizer' -> () _AddSlots: ( | {
         'ModuleInfo: Module: reorganizer InitialContents: InitializeToExpression: (nil)'
        
         dontChange <- bootstrap stub -> 'globals' -> 'nil' -> ().
        } | ) 

 bootstrap stub -> 'globals' -> 'reorganizer' -> () _AddSlots: ( | {
         'ModuleInfo: Module: reorganizer InitialContents: InitializeToExpression: (nil)'
        
         eliminatedSlots <- bootstrap stub -> 'globals' -> 'nil' -> ().
        } | ) 

 bootstrap stub -> 'globals' -> 'reorganizer' -> () _AddSlots: ( | {
         'ModuleInfo: Module: reorganizer InitialContents: InitializeToExpression: (traits oddball)'
        
         parent* = bootstrap stub -> 'traits' -> 'oddball' -> ().
        } | ) 

 bootstrap stub -> 'globals' -> 'reorganizer' -> () _AddSlots: ( | {
         'ModuleInfo: Module: reorganizer InitialContents: FollowSlot'
        
         reOrg: slot = ( |
            | 
            slot isParent ifTrue: [| obj. new. holder. |
              (dontChange includes: slot name) ifTrue: [
                ('Not changing ', slot name) printLine.
                ^self
              ].
              ('Eliminating ', slot name) printLine.
              obj: slot contents.
              obj do: [|:s| reOrg: s].
              holder: slot holder.
              new:  holder copyRemoveSlot: slot name.
              obj comment isEmpty ifFalse: [(slot name, ' has a comment!') printLine].
              new addSlots: obj.
              obj do: [| :s. newSlot. cat. newCat. |
                s name printLine.
                newSlot:  new at: s name.
                cat: newSlot category.
                newCat: slot name.
                cat isEmpty ifFalse: [newCat:  newCat, '\x7f', newSlot category].
                newSlot category: newCat. 
              ].
              holder define: new.
              obj do: [|:s|
                s isCreator ifTrue: [creatorSlots add: s name].
              ].
              eliminatedSlots add: slot name.
            ]).
        } | ) 

 bootstrap stub -> 'globals' -> 'reorganizer' -> () _AddSlots: ( | {
         'ModuleInfo: Module: reorganizer InitialContents: FollowSlot\x7fVisibility: public'
        
         reOrgObj: obj = ( |
             objMir.
            | 
            objMir:   reflect: obj.
            ('***reorganizing ', objMir name, ' ***') printLine.
            creatorSlots: list copyRemoveAll.
            objMir do: [|:s| reOrg: s].
            '***Setting creator slots***' printLine.
            creatorSlots do: [| :n. slot. |
              n printLine.
              slot:  objMir at: n.
              slot contents creatorSlot: slot
                IfFail: [
                  'couldn\'t set creator of ' print.
                  slot contents reflectee printLine
                ]
            ]).
        } | ) 



 '-- Side effects'

 globals modules reorganizer postFileIn
