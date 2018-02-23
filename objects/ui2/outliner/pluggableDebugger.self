 '30.38.2'
 '
Copyright 1992-2016 AUTHORS.
See the legal/LICENSE file for license information and legal/AUTHORS for authors.
'
["preFileIn" self] value


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: graphical interface\x7fCategory: ui2\x7fCategory: Programming Environment\x7fCategory: Pluggable Debugger\x7fModuleInfo: Module: pluggableDebugger InitialContents: FollowSlot'
        
         generalActivationModel = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'generalActivationModel' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals generalActivationModel.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalActivationModel' -> () From: ( | {
         'ModuleInfo: Module: pluggableDebugger InitialContents: FollowSlot'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'generalActivationModel' -> 'parent' -> () From: ( |
             {} = 'Comment: This is unusual--I am copied down
into the traits of the language-specific
activation model. That way, that object
can be a child in the language-specific
traits family.\x7fModuleInfo: Creator: globals generalActivationModel parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalActivationModel' -> 'parent' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: pluggableDebugger InitialContents: FollowSlot\x7fVisibility: public'
        
         activation = ( |
            | referrent).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalActivationModel' -> 'parent' -> () From: ( | {
         'Category: menu operations\x7fModuleInfo: Module: pluggableDebugger InitialContents: FollowSlot'
        
         buttonDescriptions = bootstrap define: bootstrap stub -> 'globals' -> 'generalActivationModel' -> 'parent' -> 'buttonDescriptions' -> () ToBe: bootstrap addSlotsTo: (
             globals generalSlotModel parent buttonDescriptions _Clone ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'generalActivationModel' -> 'parent' -> 'buttonDescriptions' -> () From: ( |
             {} = 'Comment: Holds button descriptions:
category leaf is button name, 
slot name is button name in buttonCache,
method source is button script,
public slots make asynchronous buttons.\x7fModuleInfo: Creator: globals generalActivationModel parent buttonDescriptions.

CopyDowns:
globals generalSlotModel parent buttonDescriptions. _Clone

'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalActivationModel' -> 'parent' -> 'buttonDescriptions' -> () From: ( | {
         'ModuleInfo: Module: pluggableDebugger InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'generalActivationModel' -> 'parent' -> 'buttonDescriptions' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals generalActivationModel parent buttonDescriptions parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalActivationModel' -> 'parent' -> () From: ( | {
         'Category: building\x7fModuleInfo: Module: pluggableDebugger InitialContents: FollowSlot\x7fVisibility: private'
        
         buttonIcon = ( |
            | methodIcon).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalActivationModel' -> 'parent' -> () From: ( | {
         'Category: menu operations\x7fModuleInfo: Module: pluggableDebugger InitialContents: FollowSlot\x7fVisibility: private'
        
         buttonsToPutInMenu = ( |
            | 
            ('step' & 'next' & 'retry' & 'revert' & 'finish' & nil &
             'methodHolder' & nil
            ) asVector,
            resend.buttonsToPutInMenu).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalActivationModel' -> 'parent' -> () From: ( | {
         'Category: contents editor\x7fComment: always is method\x7fModuleInfo: Module: pluggableDebugger InitialContents: FollowSlot\x7fVisibility: private'
        
         cachedIsMethod = bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalActivationModel' -> 'parent' -> () From: ( | {
         'Category: building\x7fModuleInfo: Module: pluggableDebugger InitialContents: FollowSlot\x7fVisibility: private'
        
         constructItems = ( |
            | 
            resend.constructItems.
            setMethodSelection).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalActivationModel' -> 'parent' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: pluggableDebugger InitialContents: FollowSlot\x7fVisibility: private'
        
         correspondingDebuggers = ( |
            | 
            myOutliner isInWorld ifFalse: [^ vector].

            myOutliner world reifiedObjects
              if: myProcess
              IsPresentDo: [|:v| vector copyAddFirst: v]
              IfAbsentDo: vector).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalActivationModel' -> 'parent' -> () From: ( | {
         'Category: browsing\x7fModuleInfo: Module: pluggableDebugger InitialContents: FollowSlot\x7fVisibility: private'
        
         getMethodHolder: evt = ( |
            | 
            evt sourceHand attach: world outlinerForMirror: outermostLexicalScope methodHolder.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalActivationModel' -> 'parent' -> () From: ( | {
         'Category: accessing\x7fComment: Override for top-level activation, otherwise
would seem that slot does not exist (since selector is goofy)
and you could not look at the source -- dmu 5/1\x7fModuleInfo: Module: pluggableDebugger InitialContents: FollowSlot\x7fVisibility: private'
        
         hasMethod = bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalActivationModel' -> 'parent' -> () From: ( | {
         'Category: building\x7fModuleInfo: Module: pluggableDebugger InitialContents: FollowSlot\x7fVisibility: private'
        
         labelMorphForTitle: str = ( |
            | 
            (labelMorph copy label: str) fontSpec: titleFontSpec).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalActivationModel' -> 'parent' -> () From: ( | {
         'Category: building\x7fModuleInfo: Module: pluggableDebugger InitialContents: FollowSlot\x7fVisibility: private'
        
         localHolder = ( |
            | activation).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalActivationModel' -> 'parent' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: pluggableDebugger InitialContents: FollowSlot\x7fVisibility: public'
        
         localVariableOutliners = ( |
             i.
            | 
            i: myOutliner items ifNil: [^ vector].
            i morphs asList copyFilteredBy: [|:m| m isOutliner]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalActivationModel' -> 'parent' -> () From: ( | {
         'Category: method source & selection\x7fModuleInfo: Module: pluggableDebugger InitialContents: FollowSlot\x7fVisibility: public'
        
         methodSelection = ( |
            | 
            activation isLive ifFalse: [^ (0@0) # (0@0)].
            innerMethod: activation SelectionForBCI: activation positionIfFail: [^ (0@0) # (0@0) ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalActivationModel' -> 'parent' -> () From: ( | {
         'Category: method source & selection\x7fModuleInfo: Module: pluggableDebugger InitialContents: FollowSlot\x7fVisibility: private'
        
         methodTextWithoutSlots = ( |
            | 
            activation isLive ifTrue: [resend.methodTextWithoutSlots]
                               False: [methodText]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalActivationModel' -> 'parent' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: pluggableDebugger InitialContents: FollowSlot\x7fVisibility: public'
        
         mirror = ( |
            | 
            outermostLexicalScope methodHolderIfFail: [nil asMirror]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalActivationModel' -> 'parent' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: pluggableDebugger InitialContents: FollowSlot\x7fVisibility: public'
        
         myProcess = ( |
            | activation myProcess).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalActivationModel' -> 'parent' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: pluggableDebugger InitialContents: FollowSlot\x7fVisibility: private'
        
         nameForBrowsing = ( |
            | 
            outermostLexicalScope selector).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalActivationModel' -> 'parent' -> () From: ( | {
         'Category: execution commands\x7fModuleInfo: Module: pluggableDebugger InitialContents: FollowSlot\x7fVisibility: private'
        
         nextCommand: evt = ( |
            | 
            activation number != 0 ifTrue: [
              myProcess finish:  myProcess at: activation number pred
            ]
            False: [
              myProcess step.
                   myProcess isAlive
              && [ myProcess currentActivation hasSender
              && [ myProcess currentActivation sender = activation ]]
                   ifTrue: [ myProcess finish ]
            ].
            stepOverUninterestingStuff.
            updateAfterStepping: evt).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalActivationModel' -> 'parent' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: pluggableDebugger InitialContents: FollowSlot\x7fVisibility: private'
        
         outermostLexicalScope = ( |
            | activation outermostLexicalScope).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalActivationModel' -> 'parent' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: pluggableDebugger InitialContents: FollowSlot\x7fVisibility: public'
        
         receiver = ( |
            | 
            outermostLexicalScope receiverIfFail: '<no receiver>').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalActivationModel' -> 'parent' -> () From: ( | {
         'Category: contents editor\x7fModuleInfo: Module: pluggableDebugger InitialContents: FollowSlot\x7fVisibility: private'
        
         setCachedIsMethod = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalActivationModel' -> 'parent' -> () From: ( | {
         'Category: method source & selection\x7fModuleInfo: Module: pluggableDebugger InitialContents: FollowSlot\x7fVisibility: private'
        
         setMethodSelection = ( |
             sel.
            | 
            sel: methodSelection.
            sel = ((0@0) # (0@0)) ifTrue: [^ self].
            myOutliner contentsEditor text selectionStart: sel origin End: sel corner).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalActivationModel' -> 'parent' -> () From: ( | {
         'Category: execution commands\x7fModuleInfo: Module: pluggableDebugger InitialContents: FollowSlot\x7fVisibility: private'
        
         stepAction = ( |
            | 
            childMustImplement).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalActivationModel' -> 'parent' -> () From: ( | {
         'Category: execution commands\x7fModuleInfo: Module: pluggableDebugger InitialContents: FollowSlot\x7fVisibility: private'
        
         stepCommand: evt = ( |
            | 
            stepAction.
            updateAfterStepping: evt).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalActivationModel' -> 'parent' -> () From: ( | {
         'Category: execution commands\x7fModuleInfo: Module: pluggableDebugger InitialContents: FollowSlot\x7fVisibility: private'
        
         stepOverUninterestingStuff = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalActivationModel' -> 'parent' -> () From: ( | {
         'Category: updating\x7fModuleInfo: Module: pluggableDebugger InitialContents: FollowSlot'
        
         updateAfterStepping: evt = ( |
            | 
            correspondingDebuggers do: [|:d| d model updateAfterStepping: evt].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalActivationModel' -> 'parent' -> () From: ( | {
         'Category: method source & selection\x7fModuleInfo: Module: pluggableDebugger InitialContents: FollowSlot'
        
         updateContentsEditor = ( |
            | 
            resend.updateContentsEditor.
            setMethodSelection).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalActivationModel' -> 'parent' -> () From: ( | {
         'Category: updating\x7fModuleInfo: Module: pluggableDebugger InitialContents: FollowSlot'
        
         updateItemsDo: blk = ( |
            | 
            resend.updateItemsDo: blk.
            localVariableOutliners do: [|:o| blk value: o].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalActivationModel' -> 'parent' -> () From: ( | {
         'Category: updating\x7fComment: activations on stack do not change
to point to other methods\x7fModuleInfo: Module: pluggableDebugger InitialContents: FollowSlot'
        
         updateSlot = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: graphical interface\x7fCategory: ui2\x7fCategory: Programming Environment\x7fCategory: Pluggable Debugger\x7fModuleInfo: Module: pluggableDebugger InitialContents: FollowSlot\x7fVisibility: public'
        
         generalProcessModel = bootstrap define: bootstrap stub -> 'globals' -> 'generalProcessModel' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals generalModel copyForSpecialization ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'generalProcessModel' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals generalProcessModel.

CopyDowns:
globals generalModel. copyForSpecialization 
SlotsToOmit: parent.

'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalProcessModel' -> () From: ( | {
         'Category: process model state\x7fComment: The command buttons used to control the process.\x7fModuleInfo: Module: pluggableDebugger InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         commands.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalProcessModel' -> () From: ( | {
         'Category: process model state\x7fComment: Optimize update by caching the last
status string displayed.\x7fModuleInfo: Module: pluggableDebugger InitialContents: InitializeToExpression: (\'\')\x7fVisibility: private'
        
         displayedStatus <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalProcessModel' -> () From: ( | {
         'Category: process model state\x7fModuleInfo: Module: pluggableDebugger InitialContents: InitializeToExpression: (true)\x7fVisibility: private'
        
         isUpdatingEnabled <- bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalProcessModel' -> () From: ( | {
         'Category: process model state\x7fModuleInfo: Module: pluggableDebugger InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         myCommandButtonStyle.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalProcessModel' -> () From: ( | {
         'ModuleInfo: Module: pluggableDebugger InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'generalProcessModel' -> 'parent' -> () From: ( |
             {} = 'Comment: A general collection of behavior for an outliner model
for a debugger. Must be specialized for a particular language,
e.g. Self or Klein. -- dmu 1/02\x7fModuleInfo: Creator: globals generalProcessModel parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalProcessModel' -> 'parent' -> () From: ( | {
         'Category: commands\x7fModuleInfo: Module: pluggableDebugger InitialContents: FollowSlot\x7fVisibility: public'
        
         abort = ( |
            | 
            myProcess isAlive ifTrue: [myProcess abort].
            safelyDo: [ updateStatus ].
            processWatcher abort).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalProcessModel' -> 'parent' -> () From: ( | {
         'Category: commands\x7fModuleInfo: Module: pluggableDebugger InitialContents: FollowSlot\x7fVisibility: public'
        
         abortAndAnimatedDelete = ( |
            | 
            abort.
            safelyDo: [myOutliner animatedDelete].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalProcessModel' -> 'parent' -> () From: ( | {
         'Category: commands\x7fModuleInfo: Module: pluggableDebugger InitialContents: FollowSlot\x7fVisibility: public'
        
         abortAndDelete = ( |
            | 
            abort.
            safelyDo: [myOutliner delete].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalProcessModel' -> 'parent' -> () From: ( | {
         'Category: command buttons\x7fModuleInfo: Module: pluggableDebugger InitialContents: FollowSlot\x7fVisibility: private'
        
         anotherCommandButtonSpacer = ( |
            | 
            transparentSpacerMorph copyH: 5).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalProcessModel' -> 'parent' -> () From: ( | {
         'Category: command buttons\x7fModuleInfo: Module: pluggableDebugger InitialContents: FollowSlot\x7fVisibility: private'
        
         buildCommandButton: lblScript = ( |
             b.
            | 
            b: ui2Button copy.
            b    label: lblScript x
              FontSpec: commandButtonStyle fontSpec
             FontColor: commandButtonStyle fontColor.
            ((b script: lblScript y) target: self) isAsynchronous: true.
            b).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalProcessModel' -> 'parent' -> () From: ( | {
         'Category: command buttons\x7fModuleInfo: Module: pluggableDebugger InitialContents: FollowSlot\x7fVisibility: private'
        
         buildCommandButtons = ( |
             cbc.
             r.
            | 
            r: rowMorph copyTransparent borderWidth: 2.
            cbc: commandButtonContents.
            cbc do: [|:ls. :i. |
              r addMorphLast: buildCommandButton: ls.
              i  =  cbc size pred  ifFalse: [ r addMorphLast: anotherCommandButtonSpacer ].
            ].
            r addMorphLast: transparentSpacerMorph copy beFlexible.
            r).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalProcessModel' -> 'parent' -> () From: ( | {
         'Category: menu\x7fCategory: override these\x7fModuleInfo: Module: pluggableDebugger InitialContents: FollowSlot\x7fVisibility: private'
        
         buttonDescriptions = bootstrap define: bootstrap stub -> 'globals' -> 'generalProcessModel' -> 'parent' -> 'buttonDescriptions' -> () ToBe: bootstrap addSlotsTo: (
             globals generalModel parent buttonDescriptions _Clone ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'generalProcessModel' -> 'parent' -> 'buttonDescriptions' -> () From: ( |
             {} = 'Comment: Holds button descriptions:
category leaf is button name, 
slot name is button name in buttonCache,
method source is button script,
public slots make asynchronous buttons.\x7fModuleInfo: Creator: globals generalProcessModel parent buttonDescriptions.

CopyDowns:
globals generalModel parent buttonDescriptions. _Clone

'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalProcessModel' -> 'parent' -> () From: ( | {
         'Category: commands\x7fModuleInfo: Module: pluggableDebugger InitialContents: FollowSlot\x7fVisibility: private'
        
         collapseStack: evt = ( |
            | 
            safelyDo: [ stack model collapse: evt ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalProcessModel' -> 'parent' -> () From: ( | {
         'Category: commands\x7fModuleInfo: Module: pluggableDebugger InitialContents: FollowSlot\x7fVisibility: private'
        
         collapseStackIfAppropriate: evt = ( |
            | 
            safelyDo: [
              isCollapsingStackInappropriate ifTrue: [ ^ self ].
              collapseStack: evt
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalProcessModel' -> 'parent' -> () From: ( | {
         'Category: command buttons\x7fModuleInfo: Module: pluggableDebugger InitialContents: FollowSlot\x7fVisibility: private'
        
         commandButtonContents = ( |
            | 
            (
            ('Continue'     @ 'target    continue: event') &
            ('Step'         @ 'target     stepTop: event') &
            ('Step lexical' @ 'target stepIntoTop: event') &
            ('Next'         @ 'target     nextTop: event') &
            ('Finish frame' @ 'target   finishTop: event')
            ) asVector).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalProcessModel' -> 'parent' -> () From: ( | {
         'Category: command buttons\x7fModuleInfo: Module: pluggableDebugger InitialContents: FollowSlot\x7fVisibility: private'
        
         commandButtonFontColor = ( |
            | titleFontColor).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalProcessModel' -> 'parent' -> () From: ( | {
         'Category: command buttons\x7fModuleInfo: Module: pluggableDebugger InitialContents: FollowSlot\x7fVisibility: private'
        
         commandButtonFontSpec = bootstrap setObjectAnnotationOf: ( fontSpec copyName: 'verdana' copyMutable Size: 12 Style: 'bold') From: ( |
             {} = 'Comment: I am an abstract, portable, description of a font.
I am also immutable.\x7fModuleInfo: Creator: globals generalProcessModel parent commandButtonFontSpec.
\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalProcessModel' -> 'parent' -> () From: ( | {
         'Category: command buttons\x7fModuleInfo: Module: pluggableDebugger InitialContents: FollowSlot\x7fVisibility: private'
        
         commandButtonStyle = ( |
            | 
            myCommandButtonStyle).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalProcessModel' -> 'parent' -> () From: ( | {
         'Category: command buttons\x7fModuleInfo: Module: pluggableDebugger InitialContents: FollowSlot\x7fVisibility: private'
        
         commandButtonStyleProto = bootstrap define: bootstrap stub -> 'globals' -> 'generalProcessModel' -> 'parent' -> 'commandButtonStyleProto' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals generalModel parent styleProto copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'generalProcessModel' -> 'parent' -> 'commandButtonStyleProto' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals generalProcessModel parent commandButtonStyleProto.

CopyDowns:
globals generalModel parent styleProto. copy 
SlotsToOmit: parent.

'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalProcessModel' -> 'parent' -> 'commandButtonStyleProto' -> () From: ( | {
         'ModuleInfo: Module: pluggableDebugger InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'generalProcessModel' -> 'parent' -> 'commandButtonStyleProto' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals generalProcessModel parent commandButtonStyleProto parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalProcessModel' -> 'parent' -> 'commandButtonStyleProto' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: pluggableDebugger InitialContents: FollowSlot'
        
         = x = ( |
            | (fontColor = x fontColor) && [fontSpec = x fontSpec]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalProcessModel' -> 'parent' -> 'commandButtonStyleProto' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: pluggableDebugger InitialContents: FollowSlot'
        
         fontColor = ( |
            | 
            myModel commandButtonFontColor).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalProcessModel' -> 'parent' -> 'commandButtonStyleProto' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: pluggableDebugger InitialContents: FollowSlot'
        
         fontSpec = ( |
            | 
            myModel commandButtonFontSpec).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalProcessModel' -> 'parent' -> 'commandButtonStyleProto' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: pluggableDebugger InitialContents: FollowSlot'
        
         hash = ( |
            | fontColor hash ^^ fontSpec hash).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalProcessModel' -> 'parent' -> 'commandButtonStyleProto' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: pluggableDebugger InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'globals' -> 'generalModel' -> 'parent' -> 'styleProto' -> 'parent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalProcessModel' -> 'parent' -> () From: ( | {
         'Category: comment\x7fModuleInfo: Module: pluggableDebugger InitialContents: FollowSlot\x7fVisibility: public'
        
         comment = ( |
            | 
            myProcess causeOfBirth).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalProcessModel' -> 'parent' -> () From: ( | {
         'Category: comment\x7fModuleInfo: Module: pluggableDebugger InitialContents: FollowSlot\x7fVisibility: public'
        
         comment: c = ( |
            | 
            myProcess causeOfBirth: c).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalProcessModel' -> 'parent' -> () From: ( | {
         'Category: building\x7fModuleInfo: Module: pluggableDebugger InitialContents: FollowSlot'
        
         constructItems = ( |
             l.
            | 
            l: list copyRemoveAll.
            updateStatus.
            l add: status.
            myProcess isAlive ifTrue: [
              commands: buildCommandButtons.
              l add: commands.
              stack: processStackModel newOutlinerFor: myProcess.
              l add: stack.
            ].
            myOutliner addItems: l.
            myOutliner recolor.
            commands isNil ifFalse: [
              commands morphsDo: [|:m| m color: myOutliner color]]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalProcessModel' -> 'parent' -> () From: ( | {
         'Category: commands\x7fModuleInfo: Module: pluggableDebugger InitialContents: FollowSlot\x7fVisibility: public'
        
         continue: evt = ( |
            | 
            myProcess isAlive ifTrue: [
              collapseStackIfAppropriate: evt.
              watcherSema signal.
              myProcess continue.
              safelyDo: [
                myOutliner update.
                updateStatus
              ].
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalProcessModel' -> 'parent' -> () From: ( | {
         'Category: copying\x7fModuleInfo: Module: pluggableDebugger InitialContents: FollowSlot\x7fVisibility: public'
        
         copy = ( |
             r.
            | 
            r: resend.copy.
            r myCommandButtonStyle: commandButtonStyleProto copyModel: r.
            r).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalProcessModel' -> 'parent' -> () From: ( | {
         'Category: debugging me\x7fModuleInfo: Module: pluggableDebugger InitialContents: FollowSlot\x7fVisibility: private'
        
         debug: str = ( |
            | str printLine).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalProcessModel' -> 'parent' -> () From: ( | {
         'Category: copying\x7fComment: After p hits an error,
call me to put debugger into
p\'s world.
-- Ungar, 1/12/95\x7fModuleInfo: Module: pluggableDebugger InitialContents: FollowSlot\x7fVisibility: public'
        
         debugProcess: p = ( |
             d.
             e.
             w.
            | 
            e: process this birthEvent ifNil: [
              p birthEvent ifNil: [^ self].
            ].
            w: e sourceHand world.

            "If world is so broken it cannot make it into worlds,
             bring up debugger elsewhere."
            (desktop worlds includes: w)
               ifFalse: [w: desktop worlds first.  e sourceHand: w hands first].

            d: newOutlinerFor: p InWorld: w.
            w safelyDo:[
              e sourceHand attach: d.
              d expand: e
            ].
            d).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalProcessModel' -> 'parent' -> () From: ( | {
         'Category: copying\x7fComment: After p hits an error,
call me to put debugger into
p\'s world.
-- Ungar, 1/12/95\x7fModuleInfo: Module: pluggableDebugger InitialContents: FollowSlot\x7fVisibility: public'
        
         debugUIProcess: p = ( |
             d.
             e.
             w.
            | 
            e: process this birthEvent ifNil: [
              p birthEvent ifNil: [^ self].
            ].
            w: e sourceHand world.
            d: newOutlinerFor: p InWorld: w.
            d).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalProcessModel' -> 'parent' -> () From: ( | {
         'Category: updating\x7fModuleInfo: Module: pluggableDebugger InitialContents: FollowSlot\x7fVisibility: private'
        
         disableUpdating = ( |
            | isUpdatingEnabled: false).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalProcessModel' -> 'parent' -> () From: ( | {
         'Category: building\x7fModuleInfo: Module: pluggableDebugger InitialContents: FollowSlot\x7fVisibility: private'
        
         dismissButtonContents = ('X')@('target model abortAndAnimatedDelete').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalProcessModel' -> 'parent' -> () From: ( | {
         'Category: updating\x7fModuleInfo: Module: pluggableDebugger InitialContents: FollowSlot\x7fVisibility: private'
        
         enableUpdating = ( |
            | isUpdatingEnabled: true).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalProcessModel' -> 'parent' -> () From: ( | {
         'Category: commands\x7fCategory: top activation commands\x7fModuleInfo: Module: pluggableDebugger InitialContents: FollowSlot\x7fVisibility: public'
        
         finishTop: evt = ( |
            | 
            (topActivationMorph: evt IfNone: [^self]) model finishCommand: evt).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalProcessModel' -> 'parent' -> () From: ( | {
         'Category: building\x7fModuleInfo: Module: pluggableDebugger InitialContents: FollowSlot\x7fVisibility: private'
        
         forkProcessWatcher = ( |
            | 
            watcherSema: watcherSema copy.
            [startProcessWatcher]. "browsing"
            processWatcher: (
              process copySend: (message copy receiver: self Selector: 'startProcessWatcher')
                 CauseOfBirth: 'generalProcessModel processWatcher'
            ) resume).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalProcessModel' -> 'parent' -> () From: ( | {
         'Category: building\x7fModuleInfo: Module: pluggableDebugger InitialContents: FollowSlot\x7fVisibility: private'
        
         headerButtonContents = ( |
            | 
            vector copyAddFirst: dismissButtonContents).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalProcessModel' -> 'parent' -> () From: ( | {
         'Category: building\x7fModuleInfo: Module: pluggableDebugger InitialContents: FollowSlot\x7fVisibility: private'
        
         initialize = ( |
            | 
            resend.initialize.
            forkProcessWatcher.
            "Can't do the following because myOutliner is not set yet. -ma 2/02"
            [expand: myProcess birthEvent.].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalProcessModel' -> 'parent' -> () From: ( | {
         'Category: commands\x7fModuleInfo: Module: pluggableDebugger InitialContents: FollowSlot\x7fVisibility: private'
        
         isCollapsingStackInappropriate = ( |
            | 
            "When the Continue button is pressed, we usually want the
            stack model to collapse.  However, when debugging assembly
            code (as in Klein), this is not the appropriate behaviour, since
            breakpoints may exist and it would be annoying if the stack
            model collapsed every time a breakpoint was encontered -ma 2/02"

                 stack isNil
            ||  [stack model isNil
            ||  [stack model hasMachineLevelForeignActivation]]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalProcessModel' -> 'parent' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: pluggableDebugger InitialContents: FollowSlot\x7fVisibility: private'
        
         myProcess = ( |
            | referrent).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalProcessModel' -> 'parent' -> () From: ( | {
         'Category: commands\x7fCategory: top activation commands\x7fModuleInfo: Module: pluggableDebugger InitialContents: FollowSlot\x7fVisibility: public'
        
         nextTop: evt = ( |
            | 
            disableUpdating.
            (topActivationMorph: evt IfNone: [^self]) model nextCommand: evt).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalProcessModel' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: pluggableDebugger InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'globals' -> 'generalModel' -> 'parent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalProcessModel' -> 'parent' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: pluggableDebugger InitialContents: FollowSlot\x7fVisibility: private'
        
         receiver = ( |
            | 
            myProcess).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalProcessModel' -> 'parent' -> () From: ( | {
         'Category: building\x7fModuleInfo: Module: pluggableDebugger InitialContents: FollowSlot\x7fVisibility: private'
        
         startProcessWatcher = ( |
            | 
            [ 
              isInWorld ifFalse: [ ^ self ].
              watcherSema wait.
              isInWorld ifFalse: [ ^ self ].
              myProcess waitForSuspension.
              isInWorld ifFalse: [ ^ self ].
              safelyDo: [
                myOutliner update.
                expand: myProcess birthEvent.
                myProcess isAlive  ifTrue: [
                  stack update.
                  stack model expand: myProcess birthEvent.
                ] False: [
                  ^ self
                ].
              ].
            ] loop).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalProcessModel' -> 'parent' -> () From: ( | {
         'Category: process status\x7fModuleInfo: Module: pluggableDebugger InitialContents: FollowSlot\x7fVisibility: private'
        
         status: str Color: col = ( |
            | 
            status ifNil: [
              status: ( columnMorph copy leftJustify beShrinkWrap color: myOutliner color) borderWidth: 0.
            ].
            safelyDo: [
              status removeAllMorphs.
              ( str asTextLines wrapLinesAtBlanksNear: 100 )
               lines do: [|:l|
                 status addMorphLast: 
                   ( ( labelMorph copy 
                                 fontSpec: commandButtonFontSpec )
                                 color: paint named: col )
                                 label: l.
              ].
              displayedStatus: str.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalProcessModel' -> 'parent' -> () From: ( | {
         'Category: commands\x7fCategory: top activation commands\x7fModuleInfo: Module: pluggableDebugger InitialContents: FollowSlot\x7fVisibility: public'
        
         stepIntoTop: evt = ( |
            | 
            disableUpdating. "this stepping is too slow with it"
            (topActivationMorph: evt IfNone: [^self]) model stepIntoCommand: evt).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalProcessModel' -> 'parent' -> () From: ( | {
         'Category: commands\x7fCategory: top activation commands\x7fModuleInfo: Module: pluggableDebugger InitialContents: FollowSlot\x7fVisibility: public'
        
         stepTop: evt = ( |
            | 
            (topActivationMorph: evt IfNone: [^self]) model stepCommand: evt).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalProcessModel' -> 'parent' -> () From: ( | {
         'Category: title\x7fModuleInfo: Module: pluggableDebugger InitialContents: FollowSlot\x7fVisibility: public'
        
         titleString = ( |
            | 
            ( ( 'Process:  `', myProcess causeOfBirth, '`' )
              asTextLines wrapLinesAtBlanksNear: 100
            ) asString).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalProcessModel' -> 'parent' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: pluggableDebugger InitialContents: FollowSlot\x7fVisibility: public'
        
         topActivationMorph: evt IfNone: aBlock = ( |
            | 
            stack
              ifNil:    aBlock
              IfNotNil: [stack model topActivationMorph: evt IfNone: aBlock]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalProcessModel' -> 'parent' -> () From: ( | {
         'Category: updating\x7fModuleInfo: Module: pluggableDebugger InitialContents: FollowSlot\x7fVisibility: public'
        
         updateAfterStepping: evt = ( |
            | 
            enableUpdating.
            isInWorld ifFalse: [^self].
            safelyDo: [
             expand: evt.
             myOutliner update.
             stack ifNil: [ ^ self ].
             "I changed ^ self to ^ continue: evt below so that
              if there are no interesting frames to show, the debugger just
              continues. However, the processStackMorph insists on showing the frame.
              I'll leave this in for when we fix it. -- dmu 6/95"
             (stack model topActivationMorph: evt IfNone: [^continue: evt]) model expand: evt.
             stack model setTypingFocusFor: evt sourceHand.
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalProcessModel' -> 'parent' -> () From: ( | {
         'Category: updating\x7fModuleInfo: Module: pluggableDebugger InitialContents: FollowSlot\x7fVisibility: public'
        
         updateItemsDo: blk = ( |
            | 
            updateStatus.
            stack isNotNil && [isUpdatingEnabled ]  ifTrue: [stack updateDo: blk].
            resend.updateItemsDo: blk.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalProcessModel' -> 'parent' -> () From: ( | {
         'Category: process status\x7fModuleInfo: Module: pluggableDebugger InitialContents: FollowSlot\x7fVisibility: private'
        
         updateStatus = ( |
             errorColorName = 'royal'.
             statusString.
            | 
            statusString: myProcess status asString copyAtMostWithEllipsis: 2000.
            status isNotNil && [ displayedStatus = statusString ] ifTrue: [^ self].

            myProcess isAlive ifFalse: [
              myOutliner itemsCached ifTrue: [
                safelyDo: [
                  stack    ifNotNil: [myOutliner removeItem: stack   ].
                  commands ifNotNil: [myOutliner removeItem: commands].
                ].
                commands: nil.
                stack: nil.
              ].
              ^ status: myProcess status asString Color: errorColorName.
            ].

            myProcess hasError ifFalse: [
              ^ status: 'Status: ', myProcess status asString Color: 'black'.
            ].

            status: (
              myProcess causeOfError isUndefinedSelectorError 
                ifFalse: [ myProcess causeOfError errorString ]
                   True: [ 'Lookup error, \'', myProcess causeOfError selector, '\' not found' ]
            ) Color: errorColorName).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalProcessModel' -> () From: ( | {
         'Category: process model state\x7fComment: The processWatcher is a process which waits for
the debugged process to suspend.  When this happens,
the processMorph is updated.\x7fModuleInfo: Module: pluggableDebugger InitialContents: InitializeToExpression: (process)\x7fVisibility: private'
        
         processWatcher <- bootstrap stub -> 'globals' -> 'process' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalProcessModel' -> () From: ( | {
         'Category: process model state\x7fComment: A processStackMorph on the process\'s stack -- Mario, 2/1/95\x7fModuleInfo: Module: pluggableDebugger InitialContents: FollowSlot\x7fVisibility: public'
        
         stack.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalProcessModel' -> () From: ( | {
         'Category: process model state\x7fComment: The morph displaying the process status.\x7fModuleInfo: Module: pluggableDebugger InitialContents: FollowSlot\x7fVisibility: private'
        
         status.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalProcessModel' -> () From: ( | {
         'Category: process model state\x7fComment: Used to synchronize with the processWatcher.\x7fModuleInfo: Module: pluggableDebugger InitialContents: InitializeToExpression: (semaphore)\x7fVisibility: private'
        
         watcherSema <- bootstrap stub -> 'globals' -> 'semaphore' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: graphical interface\x7fCategory: ui2\x7fCategory: Programming Environment\x7fCategory: Pluggable Debugger\x7fModuleInfo: Module: pluggableDebugger InitialContents: FollowSlot\x7fVisibility: public'
        
         generalProcessStackModel = bootstrap define: bootstrap stub -> 'globals' -> 'generalProcessStackModel' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals generalModel copyForSpecialization ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'generalProcessStackModel' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals generalProcessStackModel.

CopyDowns:
globals generalModel. copyForSpecialization 
SlotsToOmit: parent.

'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalProcessStackModel' -> () From: ( | {
         'Category: processStackModel state\x7fModuleInfo: Module: pluggableDebugger InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         buttons.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalProcessStackModel' -> () From: ( | {
         'Category: processStackModel state\x7fModuleInfo: Module: pluggableDebugger InitialContents: InitializeToExpression: (false)\x7fVisibility: private'
        
         moreStack <- bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalProcessStackModel' -> () From: ( | {
         'Category: processStackModel state\x7fModuleInfo: Module: pluggableDebugger InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         moreStackButton.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalProcessStackModel' -> () From: ( | {
         'ModuleInfo: Module: pluggableDebugger InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'generalProcessStackModel' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals generalProcessStackModel parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalProcessStackModel' -> 'parent' -> () From: ( | {
         'Category: accessing activations\x7fModuleInfo: Module: pluggableDebugger InitialContents: FollowSlot\x7fVisibility: private'
        
         activationMorphs = ( |
             result.
            | 
            result: list copyRemoveAll.
            myOutliner itemsCached ifTrue: [
              myOutliner items morphsDo: [|:m| result addFirst: m ].
            ].
            result).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalProcessStackModel' -> 'parent' -> () From: ( | {
         'Category: accessing activations\x7fModuleInfo: Module: pluggableDebugger InitialContents: FollowSlot\x7fVisibility: private'
        
         activationsDo: blk = ( |
            | 
            myProcess stack do: [|:a| blk value: a]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalProcessStackModel' -> 'parent' -> () From: ( | {
         'Category: buttons\x7fModuleInfo: Module: pluggableDebugger InitialContents: FollowSlot\x7fVisibility: private'
        
         buildStackButton: lblScript = ( |
             b.
            | 
            b: ui2Button copy.
            b label: lblScript x
              FontSpec: (fontSpec copyName: 'verdana' Style: 'bold')
              FontColor: myOutliner color textColorForBackground.
            ((b script: lblScript y) target: self) isAsynchronous.
            b).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalProcessStackModel' -> 'parent' -> () From: ( | {
         'Category: menuing\x7fModuleInfo: Module: pluggableDebugger InitialContents: FollowSlot\x7fVisibility: private'
        
         buttonDescriptions = bootstrap define: bootstrap stub -> 'globals' -> 'generalProcessStackModel' -> 'parent' -> 'buttonDescriptions' -> () ToBe: bootstrap addSlotsTo: (
             globals generalModel parent buttonDescriptions _Clone ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'generalProcessStackModel' -> 'parent' -> 'buttonDescriptions' -> () From: ( |
             {} = 'Comment: Holds button descriptions:
category leaf is button name, 
slot name is button name in buttonCache,
method source is button script,
public slots make asynchronous buttons.\x7fModuleInfo: Creator: globals generalProcessStackModel parent buttonDescriptions.

CopyDowns:
globals generalModel parent buttonDescriptions. _Clone

'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalProcessStackModel' -> 'parent' -> 'buttonDescriptions' -> () From: ( | {
         'Category: stack\x7fCategory: Don\'t filter frames\x7fModuleInfo: Module: pluggableDebugger InitialContents: FollowSlot'
        
         dontFilter = ( |
            | 
            target model toggleFiltering: event).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalProcessStackModel' -> 'parent' -> 'buttonDescriptions' -> () From: ( | {
         'Category: stack\x7fCategory: Filter frames\x7fModuleInfo: Module: pluggableDebugger InitialContents: FollowSlot'
        
         filter = ( |
            | 
            target model toggleFiltering: event).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalProcessStackModel' -> 'parent' -> 'buttonDescriptions' -> () From: ( | {
         'Category: stack\x7fCategory: Flush\x7fModuleInfo: Module: pluggableDebugger InitialContents: FollowSlot'
        
         flush = ( |
            | 
            target model flush: event).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalProcessStackModel' -> 'parent' -> 'buttonDescriptions' -> () From: ( | {
         'ModuleInfo: Module: pluggableDebugger InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'generalProcessStackModel' -> 'parent' -> 'buttonDescriptions' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals generalProcessStackModel parent buttonDescriptions parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalProcessStackModel' -> 'parent' -> () From: ( | {
         'Category: menuing\x7fModuleInfo: Module: pluggableDebugger InitialContents: FollowSlot\x7fVisibility: private'
        
         buttonsToPutInMenu = ( |
            | 
            ('flush' & nil) asVector,
            resend.buttonsToPutInMenu).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalProcessStackModel' -> 'parent' -> () From: ( | {
         'Category: expanding & collapsing\x7fModuleInfo: Module: pluggableDebugger InitialContents: FollowSlot\x7fVisibility: public'
        
         collapse: evt = ( |
            | 
            safelyDo: [
              myOutliner isExpanded ifTrue: [myOutliner removeMorph: buttons].
              resend.collapse: evt.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalProcessStackModel' -> 'parent' -> () From: ( | {
         'Category: building\x7fModuleInfo: Module: pluggableDebugger InitialContents: FollowSlot\x7fVisibility: private'
        
         constructItems = ( |
            | 
            myOutliner update.
            activationMorphs do: [ | :am | am model collapse: myProcess birthEvent ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalProcessStackModel' -> 'parent' -> () From: ( | {
         'Category: expanding & collapsing\x7fModuleInfo: Module: pluggableDebugger InitialContents: FollowSlot\x7fVisibility: public'
        
         expand: evt = ( |
            | 
            myProcess isActive
              ifTrue: [myProcess suspend].
              safelyDo: [
                 resend.expand: evt.
                 myOutliner =  buttons owner ifFalse: [
                   buttons delete.
                   myOutliner addMorphLast:  buttons].
              ]. 
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalProcessStackModel' -> 'parent' -> () From: ( | {
         'Category: accessing activations\x7fModuleInfo: Module: pluggableDebugger InitialContents: FollowSlot\x7fVisibility: private'
        
         findActivationStack: stack Index: activation From: index IfAbsent: absentBlk = ( |
            | 
            stack findFirst: [|:a. :i| ( i >= index ) && [ a = activation ]]
                  IfPresent: [|:a. :i| i]
                   IfAbsent: absentBlk).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalProcessStackModel' -> 'parent' -> () From: ( | {
         'Category: accessing activations\x7fModuleInfo: Module: pluggableDebugger InitialContents: FollowSlot\x7fVisibility: public'
        
         hasMachineLevelForeignActivation = ( |
             topActivation.
            | 
            topActivation: topActivationIfNone: [ nil ].
            topActivation isNotNil && ([topActivation isReflecteeMachineLevelForeignActivation])).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalProcessStackModel' -> 'parent' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: pluggableDebugger InitialContents: FollowSlot\x7fVisibility: private'
        
         myProcess = ( |
            | referrent).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalProcessStackModel' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: pluggableDebugger InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'globals' -> 'generalModel' -> 'parent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalProcessStackModel' -> 'parent' -> () From: ( | {
         'Category: appearance\x7fModuleInfo: Module: pluggableDebugger InitialContents: FollowSlot'
        
         preferredBodyColor = ( |
            | preferences outliner theme debugger).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalProcessStackModel' -> 'parent' -> () From: ( | {
         'Category: appearance\x7fModuleInfo: Module: pluggableDebugger InitialContents: FollowSlot'
        
         preferredHeaderColor = ( |
            | preferences outliner theme processDebugger).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalProcessStackModel' -> 'parent' -> () From: ( | {
         'Category: building\x7fModuleInfo: Module: pluggableDebugger InitialContents: FollowSlot\x7fVisibility: private'
        
         setAppearanceOfOutliner = ( |
             lessStackButton.
            | 
            moreStackButton: buildStackButton: 'More stack' @ 'target showMoreStack'.
            moreStackButton color: preferredBodyColor.
            moreStackButton target: self.

            lessStackButton: buildStackButton: 'Less stack' @ 'target showLessStack'.
            lessStackButton color: preferredBodyColor.
            lessStackButton target: self.

            buttons: rowMorph copyTransparent.
            buttons beShrinkWrap.
            buttons borderWidth: 3.

            buttons addMorph: lessStackButton.
            buttons addMorphLast: moreStackButton.

            myOutliner beFlexible.
            myOutliner borderWidth: 0).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalProcessStackModel' -> 'parent' -> () From: ( | {
         'Category: typing focus\x7fComment: make topmost open activation
be the focus
-- Ungar, 1/6/95\x7fModuleInfo: Module: pluggableDebugger InitialContents: FollowSlot\x7fVisibility: public'
        
         setTypingFocusFor: sourceHand = ( |
             a.
            | 
            a: activationMorphs.
            a isEmpty ifFalse: [
             a last beTypingFocusFor: sourceHand.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalProcessStackModel' -> 'parent' -> () From: ( | {
         'Category: expanding & collapsing\x7fModuleInfo: Module: pluggableDebugger InitialContents: FollowSlot\x7fVisibility: public'
        
         showLessStack = ( |
            | 
            stackDepthToShow:  (stackDepthToShow - ((stackDepthToShow /~ 3) min: 20)) max: 0.
            safelyDo: [myOutliner update]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalProcessStackModel' -> 'parent' -> () From: ( | {
         'Category: expanding & collapsing\x7fModuleInfo: Module: pluggableDebugger InitialContents: FollowSlot\x7fVisibility: public'
        
         showMoreStack = ( |
            | 
            stackDepthToShow: stackDepthToShow + (((stackDepthToShow /~ 3) min: 20) max: 5).
            safelyDo: [myOutliner update]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalProcessStackModel' -> 'parent' -> () From: ( | {
         'Category: building\x7fModuleInfo: Module: pluggableDebugger InitialContents: FollowSlot\x7fVisibility: private'
        
         titleString = 'Stack'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalProcessStackModel' -> 'parent' -> () From: ( | {
         'Category: accessing activations\x7fModuleInfo: Module: pluggableDebugger InitialContents: FollowSlot\x7fVisibility: private'
        
         topActivationIfNone: aBlock = ( |
             index.
             stack.
            | 
            stack: myProcess stack.
            index: myProcess causeOfError firstInterestingFrameOf: stack.
            stack
                    at: (index < 0 ifTrue: 0 False: index)
              IfAbsent: aBlock).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalProcessStackModel' -> 'parent' -> () From: ( | {
         'Category: accessing\x7fComment: get top activation\x7fModuleInfo: Module: pluggableDebugger InitialContents: FollowSlot\x7fVisibility: public'
        
         topActivationMorph: evt IfNone: aBlock = ( |
            | 
            updateIfNecessary.
            expand: evt.
            myOutliner items morphCount = 0 ifTrue: aBlock False: [myOutliner items firstMorph]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalProcessStackModel' -> 'parent' -> () From: ( | {
         'Category: accessing activations\x7fModuleInfo: Module: pluggableDebugger InitialContents: FollowSlot\x7fVisibility: private'
        
         topActivations = ( |
             result.
            | 
            result: list copy.
            topActivationsDo: [|:a| result addFirst: a].
            result).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalProcessStackModel' -> 'parent' -> () From: ( | {
         'Category: accessing activations\x7fModuleInfo: Module: pluggableDebugger InitialContents: FollowSlot\x7fVisibility: private'
        
         topActivationsDo: blk = ( |
            | unfilteredTopActivationsDo: blk).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalProcessStackModel' -> 'parent' -> () From: ( | {
         'Category: accessing activations\x7fModuleInfo: Module: pluggableDebugger InitialContents: FollowSlot\x7fVisibility: private'
        
         unfilteredTopActivationsDo: blk = ( |
             stack <- ((bootstrap stub -> 'globals') \/-> 'processStack') -> ().
            | 

            moreStack: false.
            stack: myProcess stackWithLimit: stackDepthToShow succ.
            stack isEmpty ifTrue: [^ self].
            stackDepthToShow do: [|:i|
              blk value:  stack at: i IfAbsent: [^ self].
            ].
            moreStack:  true.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalProcessStackModel' -> 'parent' -> () From: ( | {
         'Category: updating\x7fModuleInfo: Module: pluggableDebugger InitialContents: FollowSlot\x7fVisibility: private'
        
         updateAllActivationMorphs = ( |
             as.
             ms.
             previousMorph.
             wasMore.
            | 
            ms: activationMorphs copy.
            as: topActivations copy. "as is in reverse order: top of stack is last"

            "go up in stack while right morphs are there"
            updateCorrectActivationMorphs: ms ForActivations: as.

            "if have more morphs, must be bogus, so delete them"
            ms do: [|:m| myOutliner removeItem: m ].
            ms removeAll. 

            "if have more activations, must add morphs for them"
            safelyDo: [
              as do: [|:a. am| 
               am: activationModelProto newOutlinerFor: a.
               myOutliner addItemFirst: am.
              ]
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalProcessStackModel' -> 'parent' -> () From: ( | {
         'Category: updating\x7fModuleInfo: Module: pluggableDebugger InitialContents: FollowSlot\x7fVisibility: private'
        
         updateCorrectActivationMorphs: aMorphs ForActivations: acts = ( |
            | 
            "go up in stack while right morphs are there"
            [acts isEmpty  ||  [aMorphs isEmpty]] whileFalse: [|a|
              "equals for activations only works for live activations"
              a: aMorphs first model activation.
              a isLive && [a = acts first] ifTrue: [
                "a match: set number of activation and remove heads"
                a number: acts first number.
                aMorphs removeFirst.
                acts    removeFirst.
              ]
              False: [
                "The current morph does not match the activation"
                ^ self
              ]. 
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalProcessStackModel' -> 'parent' -> () From: ( | {
         'Category: updating\x7fModuleInfo: Module: pluggableDebugger InitialContents: FollowSlot\x7fVisibility: private'
        
         updateIfNecessary = ( |
             currentTopActivation.
             morphTopActivation.
            | 
            myOutliner isExpanded ifFalse: [^self].
            myOutliner items morphCount = 0 ifTrue: [^self].
            currentTopActivation:  topActivationIfNone: [^self].
            morphTopActivation:  myOutliner items firstMorph model activation.
               (currentTopActivation != morphTopActivation)
            || [currentTopActivation position != morphTopActivation position]
                ifTrue: [myOutliner update]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalProcessStackModel' -> 'parent' -> () From: ( | {
         'Category: updating\x7fModuleInfo: Module: pluggableDebugger InitialContents: FollowSlot\x7fVisibility: private'
        
         updateItemsDo: blk = ( |
            | 
            updateAllActivationMorphs.

            activationMorphs do: [|:a| blk value: a ].

            moreStack not && [ buttons morphs includes: moreStackButton ]
              ifTrue: [ moreStackButton safelyDo: [ moreStackButton delete ] ].

            moreStack && [ ( buttons morphs includes: moreStackButton ) not ]
              ifTrue: [ buttons safelyDo: [ buttons addMorphLast: moreStackButton ] ].

            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalProcessStackModel' -> () From: ( | {
         'Category: processStackModel state\x7fModuleInfo: Module: pluggableDebugger InitialContents: InitializeToExpression: (5)\x7fVisibility: private'
        
         stackDepthToShow <- 5.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: pluggableDebugger InitialContents: FollowSlot'
        
         pluggableDebugger = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'pluggableDebugger' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'pluggableDebugger' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules pluggableDebugger.

CopyDowns:
globals modules init. copy 
SlotsToOmit: directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'pluggableDebugger' -> () From: ( | {
         'ModuleInfo: Module: pluggableDebugger InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'ui2/outliner'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'pluggableDebugger' -> () From: ( | {
         'ModuleInfo: Module: pluggableDebugger InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'pluggableDebugger' -> () From: ( | {
         'ModuleInfo: Module: pluggableDebugger InitialContents: FollowSlot'
        
         myComment <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'pluggableDebugger' -> () From: ( | {
         'ModuleInfo: Module: pluggableDebugger InitialContents: FollowSlot'
        
         postFileIn = ( |
            | resend.postFileIn).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'pluggableDebugger' -> () From: ( | {
         'ModuleInfo: Module: pluggableDebugger InitialContents: InitializeToExpression: (\'30.38.2\')\x7fVisibility: public'
        
         revision <- '30.38.2'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'pluggableDebugger' -> () From: ( | {
         'ModuleInfo: Module: pluggableDebugger InitialContents: FollowSlot\x7fVisibility: private'
        
         subpartNames <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfActivationModel' -> 'parent' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: pluggableDebugger InitialContents: FollowSlot\x7fVisibility: public'
        
         receiver = ( |
            | 
            outermostLexicalScope receiverIfFail: [|:e| reflect: 'no rcvr: ', e]).
        } | ) 



 '-- Side effects'

 globals modules pluggableDebugger postFileIn
