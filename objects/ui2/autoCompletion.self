 '$Revision: 30.4 $'
 '
Copyright 1992-2011 AUTHORS.
See the legal/LICENSE file for license information and legal/AUTHORS for authors.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractEditorMorph' -> () From: ( | {
         'ModuleInfo: Module: autoCompletion InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         currentAutoCompleter.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalCategoryModel' -> 'parent' -> () From: ( | {
         'Category: auto-completion\x7fModuleInfo: Module: autoCompletion InitialContents: FollowSlot\x7fVisibility: public'
        
         justMyOwnAutoCompletionWords = ( |
            | 
            slotsInMeAndSubcategories gather: [|:s| s basicPrintString asWords]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalModel' -> 'parent' -> () From: ( | {
         'Category: auto-completion\x7fModuleInfo: Module: autoCompletion InitialContents: FollowSlot\x7fVisibility: public'
        
         justMyOwnAutoCompletionWords = ( |
            | 
            vector copyRemoveAll).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalSliceGroupModel' -> 'parent' -> () From: ( | {
         'Category: auto-completion\x7fModuleInfo: Module: autoCompletion InitialContents: FollowSlot\x7fVisibility: public'
        
         justMyOwnAutoCompletionWords = ( |
            | 
            slots gather: [|:s| s basicPrintString asWords]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalSlotModel' -> 'parent' -> () From: ( | {
         'Category: auto-completion\x7fModuleInfo: Module: autoCompletion InitialContents: FollowSlot\x7fVisibility: public'
        
         justMyOwnAutoCompletionWords = ( |
            | 
            slotsInMeAndSubcategories gather: [|:s| s basicPrintString asWords]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: autoCompletion InitialContents: FollowSlot'
        
         autoCompletion = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'autoCompletion' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'autoCompletion' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules autoCompletion.

CopyDowns:
globals modules init. copy 
SlotsToOmit: directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'autoCompletion' -> () From: ( | {
         'ModuleInfo: Module: autoCompletion InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'ui2'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'autoCompletion' -> () From: ( | {
         'ModuleInfo: Module: autoCompletion InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'autoCompletion' -> () From: ( | {
         'ModuleInfo: Module: autoCompletion InitialContents: FollowSlot'
        
         myComment <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'autoCompletion' -> () From: ( | {
         'ModuleInfo: Module: autoCompletion InitialContents: FollowSlot'
        
         postFileIn = ( |
            | resend.postFileIn).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'autoCompletion' -> () From: ( | {
         'ModuleInfo: Module: autoCompletion InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- '$Revision: 30.4 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'autoCompletion' -> () From: ( | {
         'ModuleInfo: Module: autoCompletion InitialContents: FollowSlot\x7fVisibility: private'
        
         subpartNames <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pluggableOutliner' -> 'parent' -> () From: ( | {
         'Category: auto-completion\x7fModuleInfo: Module: autoCompletion InitialContents: FollowSlot\x7fVisibility: private'
        
         justMyOwnAutoCompletionWords = ( |
            | 
            model justMyOwnAutoCompletionWords).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfObjectModel' -> 'parent' -> () From: ( | {
         'Category: auto-completion\x7fModuleInfo: Module: autoCompletion InitialContents: FollowSlot\x7fVisibility: public'
        
         justMyOwnAutoCompletionWords = ( |
            | 
            resend.justMyOwnAutoCompletionWords, receiver everyMessageReflecteeUnderstands).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfSlotModel' -> 'parent' -> () From: ( | {
         'Category: auto-completion\x7fModuleInfo: Module: autoCompletion InitialContents: FollowSlot\x7fVisibility: public'
        
         justMyOwnAutoCompletionWords = ( |
            | 
            resend.justMyOwnAutoCompletionWords, receiver everyMessageReflecteeUnderstands).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractEditorMorph' -> () From: ( | {
         'Category: auto-completion\x7fModuleInfo: Module: autoCompletion InitialContents: FollowSlot\x7fVisibility: public'
        
         autoComplete = ( |
            | 
            hasSelection ifTrue: [^self].
            currentAutoCompleter ifNil: [
              currentAutoCompleter: (autoCompleter copy editor: self) prefix: currentWord.
            ].
            currentAutoCompleter tryNext.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractEditorMorph' -> () From: ( | {
         'Category: auto-completion\x7fModuleInfo: Module: autoCompletion InitialContents: FollowSlot\x7fVisibility: private'
        
         autoCompleter = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'abstractEditorMorph' -> 'autoCompleter' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits abstractEditorMorph autoCompleter.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractEditorMorph' -> 'autoCompleter' -> () From: ( | {
         'ModuleInfo: Module: autoCompletion InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         completions.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractEditorMorph' -> 'autoCompleter' -> () From: ( | {
         'ModuleInfo: Module: autoCompletion InitialContents: InitializeToExpression: (-1)\x7fVisibility: private'
        
         currentCompletionIndex <- -1.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractEditorMorph' -> 'autoCompleter' -> () From: ( | {
         'ModuleInfo: Module: autoCompletion InitialContents: InitializeToExpression: (nil)\x7fVisibility: public'
        
         editor.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractEditorMorph' -> 'autoCompleter' -> () From: ( | {
         'ModuleInfo: Module: autoCompletion InitialContents: InitializeToExpression: (false)\x7fVisibility: public'
        
         isReplacing <- bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractEditorMorph' -> 'autoCompleter' -> () From: ( | {
         'ModuleInfo: Module: autoCompletion InitialContents: FollowSlot'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'abstractEditorMorph' -> 'autoCompleter' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits abstractEditorMorph autoCompleter parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractEditorMorph' -> 'autoCompleter' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: autoCompletion InitialContents: FollowSlot\x7fVisibility: private'
        
         calculateCompletions = ( |
            | 
            completions: (editor possibleAutoCompletionWords copyFilteredBy: [|:w| (prefix size < w size) && [prefix isPrefixOf: w]]) asOrderedSet asVector, (vector copyAddLast: prefix)).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractEditorMorph' -> 'autoCompleter' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: autoCompletion InitialContents: FollowSlot\x7fVisibility: private'
        
         nextCompletion = ( |
            | 
            completions ifNil: [calculateCompletions].
            completions isEmpty ifTrue: [^nil].
            currentCompletionIndex: currentCompletionIndex + 1.
            completions at: currentCompletionIndex % completions size).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractEditorMorph' -> 'autoCompleter' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: autoCompletion InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'clonable' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractEditorMorph' -> 'autoCompleter' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: autoCompletion InitialContents: FollowSlot\x7fVisibility: public'
        
         tryNext = ( |
             next.
            | 
            next: nextCompletion ifNil: [^self].
            isReplacing: true.
            editor replaceCurrentWordWith: next.
            isReplacing: false.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractEditorMorph' -> 'autoCompleter' -> () From: ( | {
         'ModuleInfo: Module: autoCompletion InitialContents: InitializeToExpression: (nil)\x7fVisibility: public'
        
         prefix.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractEditorMorph' -> () From: ( | {
         'Category: auto-completion\x7fModuleInfo: Module: autoCompletion InitialContents: FollowSlot\x7fVisibility: private'
        
         justMyOwnAutoCompletionWords = ( |
            | 
            words).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractEditorMorph' -> () From: ( | {
         'Category: auto-completion\x7fModuleInfo: Module: autoCompletion InitialContents: FollowSlot\x7fVisibility: private'
        
         resetAutoCompleter = ( |
            | 
            currentAutoCompleter ifNotNil: [|:a| a isReplacing ifFalse: [currentAutoCompleter: nil]]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'morph' -> () From: ( | {
         'Category: auto-completion\x7fModuleInfo: Module: autoCompletion InitialContents: FollowSlot\x7fVisibility: private'
        
         justMyOwnAutoCompletionWords = ( |
            | vector copyRemoveAll).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'morph' -> () From: ( | {
         'Category: auto-completion\x7fModuleInfo: Module: autoCompletion InitialContents: FollowSlot\x7fVisibility: public'
        
         possibleAutoCompletionWords = ( |
            | 
            justMyOwnAutoCompletionWords, (owner ifNil: [vector] IfNotNil: [owner possibleAutoCompletionWords])).
        } | ) 



 '-- Side effects'

 globals modules autoCompletion postFileIn
