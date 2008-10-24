 'Sun-$Revision: 30.8 $'
 '
Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: parseNodes InitialContents: FollowSlot'
        
         parseNodes = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'parseNodes' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'comment' From:
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'parseNodes' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules parseNodes.

CopyDowns:
globals modules init. copy 
SlotsToOmit: comment directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'parseNodes' -> () From: ( | {
         'ModuleInfo: Module: parseNodes InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'tests'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'parseNodes' -> () From: ( | {
         'ModuleInfo: Module: parseNodes InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'parseNodes' -> () From: ( | {
         'ModuleInfo: Module: parseNodes InitialContents: FollowSlot'
        
         myComment <- 'CAUTION: This file is not part of the documented Self world.  It may be
             be changed or removed at any time, and it will not be documented.  Don\'t
             try to learn good Self style from this file.

             This file can be removed from all.self without affecting the Self world,
             except for tests.self which uses it for testing purposes.\"

              \"Parse nodes for a parser for an old version of Self grammar.'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'parseNodes' -> () From: ( | {
         'ModuleInfo: Module: parseNodes InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- 'Sun-$Revision: 30.8 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'parseNodes' -> () From: ( | {
         'ModuleInfo: Module: parseNodes InitialContents: FollowSlot\x7fVisibility: private'
        
         subpartNames <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'oldParser' -> () From: ( | {
         'ModuleInfo: Module: parseNodes InitialContents: FollowSlot'
        
         parseNodes = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'oldParser' -> 'parseNodes' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals oldParser parseNodes.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'oldParser' -> 'parseNodes' -> () From: ( | {
         'ModuleInfo: Module: parseNodes InitialContents: FollowSlot'
        
         argSlot = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'oldParser' -> 'parseNodes' -> 'argSlot' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals oldParser parseNodes argSlot.
\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'oldParser' -> 'parseNodes' -> 'argSlot' -> () From: ( | {
         'ModuleInfo: Module: parseNodes InitialContents: FollowSlot'
        
         name <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'oldParser' -> 'parseNodes' -> () From: ( | {
         'ModuleInfo: Module: parseNodes InitialContents: FollowSlot'
        
         argSlot = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'oldParser' -> 'parseNodes' -> 'argSlot' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits oldParser parseNodes argSlot.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'oldParser' -> 'parseNodes' -> 'argSlot' -> () From: ( | {
         'ModuleInfo: Module: parseNodes InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'oldParser' -> 'parseNodes' -> 'argSlot' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'oldParser' -> 'parseNodes' -> () From: ( | {
         'ModuleInfo: Module: parseNodes InitialContents: FollowSlot'
        
         binarySend = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'oldParser' -> 'parseNodes' -> 'binarySend' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals oldParser parseNodes binarySend.
\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'oldParser' -> 'parseNodes' -> 'binarySend' -> () From: ( | {
         'ModuleInfo: Module: parseNodes InitialContents: FollowSlot'
        
         argument.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'oldParser' -> 'parseNodes' -> () From: ( | {
         'ModuleInfo: Module: parseNodes InitialContents: FollowSlot'
        
         binarySend = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'oldParser' -> 'parseNodes' -> 'binarySend' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits oldParser parseNodes binarySend.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'oldParser' -> 'parseNodes' -> 'binarySend' -> () From: ( | {
         'ModuleInfo: Module: parseNodes InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'oldParser' -> 'parseNodes' -> 'binarySend' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'oldParser' -> 'parseNodes' -> 'binarySend' -> () From: ( | {
         'ModuleInfo: Module: parseNodes InitialContents: FollowSlot'
        
         receiver.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'oldParser' -> 'parseNodes' -> 'binarySend' -> () From: ( | {
         'ModuleInfo: Module: parseNodes InitialContents: FollowSlot'
        
         selector.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'oldParser' -> 'parseNodes' -> () From: ( | {
         'ModuleInfo: Module: parseNodes InitialContents: FollowSlot'
        
         blockObject = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'oldParser' -> 'parseNodes' -> 'blockObject' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals oldParser parseNodes blockObject.
\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'oldParser' -> 'parseNodes' -> 'blockObject' -> () From: ( | {
         'ModuleInfo: Module: parseNodes InitialContents: FollowSlot'
        
         code.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'oldParser' -> 'parseNodes' -> () From: ( | {
         'ModuleInfo: Module: parseNodes InitialContents: FollowSlot'
        
         blockObject = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'oldParser' -> 'parseNodes' -> 'blockObject' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits oldParser parseNodes blockObject.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'oldParser' -> 'parseNodes' -> 'blockObject' -> () From: ( | {
         'ModuleInfo: Module: parseNodes InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'oldParser' -> 'parseNodes' -> 'blockObject' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'oldParser' -> 'parseNodes' -> 'blockObject' -> () From: ( | {
         'ModuleInfo: Module: parseNodes InitialContents: FollowSlot'
        
         slotList.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'oldParser' -> 'parseNodes' -> () From: ( | {
         'ModuleInfo: Module: parseNodes InitialContents: FollowSlot'
        
         implicitSelf = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'oldParser' -> 'parseNodes' -> 'implicitSelf' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals oldParser parseNodes implicitSelf.
\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'oldParser' -> 'parseNodes' -> () From: ( | {
         'ModuleInfo: Module: parseNodes InitialContents: FollowSlot'
        
         implicitSelf = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'oldParser' -> 'parseNodes' -> 'implicitSelf' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits oldParser parseNodes implicitSelf.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'oldParser' -> 'parseNodes' -> 'implicitSelf' -> () From: ( | {
         'ModuleInfo: Module: parseNodes InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'oldParser' -> 'parseNodes' -> 'implicitSelf' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'oldParser' -> 'parseNodes' -> () From: ( | {
         'ModuleInfo: Module: parseNodes InitialContents: FollowSlot'
        
         keywordSend = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'oldParser' -> 'parseNodes' -> 'keywordSend' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals oldParser parseNodes keywordSend.
\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'oldParser' -> 'parseNodes' -> 'keywordSend' -> () From: ( | {
         'ModuleInfo: Module: parseNodes InitialContents: FollowSlot'
        
         arguments <- bootstrap stub -> 'globals' -> 'list' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'oldParser' -> 'parseNodes' -> () From: ( | {
         'ModuleInfo: Module: parseNodes InitialContents: FollowSlot'
        
         keywordSend = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'oldParser' -> 'parseNodes' -> 'keywordSend' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits oldParser parseNodes keywordSend.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'oldParser' -> 'parseNodes' -> 'keywordSend' -> () From: ( | {
         'ModuleInfo: Module: parseNodes InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'oldParser' -> 'parseNodes' -> 'keywordSend' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'oldParser' -> 'parseNodes' -> 'keywordSend' -> () From: ( | {
         'ModuleInfo: Module: parseNodes InitialContents: FollowSlot'
        
         receiver.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'oldParser' -> 'parseNodes' -> 'keywordSend' -> () From: ( | {
         'ModuleInfo: Module: parseNodes InitialContents: FollowSlot'
        
         selector.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'oldParser' -> 'parseNodes' -> () From: ( | {
         'ModuleInfo: Module: parseNodes InitialContents: FollowSlot'
        
         methodObject = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'oldParser' -> 'parseNodes' -> 'methodObject' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals oldParser parseNodes methodObject.
\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'oldParser' -> 'parseNodes' -> 'methodObject' -> () From: ( | {
         'ModuleInfo: Module: parseNodes InitialContents: FollowSlot'
        
         code.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'oldParser' -> 'parseNodes' -> () From: ( | {
         'ModuleInfo: Module: parseNodes InitialContents: FollowSlot'
        
         methodObject = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'oldParser' -> 'parseNodes' -> 'methodObject' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits oldParser parseNodes methodObject.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'oldParser' -> 'parseNodes' -> 'methodObject' -> () From: ( | {
         'ModuleInfo: Module: parseNodes InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'oldParser' -> 'parseNodes' -> 'methodObject' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'oldParser' -> 'parseNodes' -> 'methodObject' -> () From: ( | {
         'ModuleInfo: Module: parseNodes InitialContents: FollowSlot'
        
         slotList.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'oldParser' -> 'parseNodes' -> () From: ( | {
         'ModuleInfo: Module: parseNodes InitialContents: FollowSlot'
        
         nonArgSlot = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'oldParser' -> 'parseNodes' -> 'nonArgSlot' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals oldParser parseNodes nonArgSlot.
\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'oldParser' -> 'parseNodes' -> 'nonArgSlot' -> () From: ( | {
         'ModuleInfo: Module: parseNodes InitialContents: FollowSlot'
        
         isWritable <- bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'oldParser' -> 'parseNodes' -> 'nonArgSlot' -> () From: ( | {
         'ModuleInfo: Module: parseNodes InitialContents: FollowSlot'
        
         name <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'oldParser' -> 'parseNodes' -> () From: ( | {
         'ModuleInfo: Module: parseNodes InitialContents: FollowSlot'
        
         nonArgSlot = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'oldParser' -> 'parseNodes' -> 'nonArgSlot' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits oldParser parseNodes nonArgSlot.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'oldParser' -> 'parseNodes' -> 'nonArgSlot' -> () From: ( | {
         'ModuleInfo: Module: parseNodes InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'oldParser' -> 'parseNodes' -> 'nonArgSlot' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'oldParser' -> 'parseNodes' -> 'nonArgSlot' -> () From: ( | {
         'ModuleInfo: Module: parseNodes InitialContents: FollowSlot'
        
         value.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'oldParser' -> 'parseNodes' -> () From: ( | {
         'ModuleInfo: Module: parseNodes InitialContents: FollowSlot'
        
         slotList = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'oldParser' -> 'parseNodes' -> 'slotList' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals oldParser parseNodes slotList.
\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'oldParser' -> 'parseNodes' -> 'slotList' -> () From: ( | {
         'ModuleInfo: Module: parseNodes InitialContents: FollowSlot'
        
         copy = ( |
            | nodeParent.copy slots: slots copy).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'oldParser' -> 'parseNodes' -> () From: ( | {
         'ModuleInfo: Module: parseNodes InitialContents: FollowSlot'
        
         slotList = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'oldParser' -> 'parseNodes' -> 'slotList' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits oldParser parseNodes slotList.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'oldParser' -> 'parseNodes' -> 'slotList' -> () From: ( | {
         'ModuleInfo: Module: parseNodes InitialContents: FollowSlot'
        
         nodeParent* = bootstrap stub -> 'traits' -> 'oldParser' -> 'parseNodes' -> 'slotList' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'oldParser' -> 'parseNodes' -> 'slotList' -> () From: ( | {
         'ModuleInfo: Module: parseNodes InitialContents: InitializeToExpression: (list copyRemoveAll)'
        
         slots <- list copyRemoveAll.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'oldParser' -> 'parseNodes' -> () From: ( | {
         'ModuleInfo: Module: parseNodes InitialContents: FollowSlot'
        
         slotName = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'oldParser' -> 'parseNodes' -> 'slotName' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals oldParser parseNodes slotName.
\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'oldParser' -> 'parseNodes' -> 'slotName' -> () From: ( | {
         'ModuleInfo: Module: parseNodes InitialContents: FollowSlot'
        
         isParent <- bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'oldParser' -> 'parseNodes' -> 'slotName' -> () From: ( | {
         'ModuleInfo: Module: parseNodes InitialContents: FollowSlot'
        
         name <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'oldParser' -> 'parseNodes' -> () From: ( | {
         'ModuleInfo: Module: parseNodes InitialContents: FollowSlot'
        
         slotName = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'oldParser' -> 'parseNodes' -> 'slotName' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits oldParser parseNodes slotName.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'oldParser' -> 'parseNodes' -> 'slotName' -> () From: ( | {
         'ModuleInfo: Module: parseNodes InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'oldParser' -> 'parseNodes' -> 'slotName' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'oldParser' -> 'parseNodes' -> () From: ( | {
         'ModuleInfo: Module: parseNodes InitialContents: FollowSlot'
        
         statements = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'oldParser' -> 'parseNodes' -> 'statements' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals oldParser parseNodes statements.
\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'oldParser' -> 'parseNodes' -> 'statements' -> () From: ( | {
         'ModuleInfo: Module: parseNodes InitialContents: FollowSlot'
        
         copy = ( |
            | nodeParent.copy statements: statements copy).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'oldParser' -> 'parseNodes' -> () From: ( | {
         'ModuleInfo: Module: parseNodes InitialContents: FollowSlot'
        
         statements = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'oldParser' -> 'parseNodes' -> 'statements' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits oldParser parseNodes statements.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'oldParser' -> 'parseNodes' -> 'statements' -> () From: ( | {
         'ModuleInfo: Module: parseNodes InitialContents: FollowSlot'
        
         nodeParent* = bootstrap stub -> 'traits' -> 'oldParser' -> 'parseNodes' -> 'statements' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'oldParser' -> 'parseNodes' -> 'statements' -> () From: ( | {
         'ModuleInfo: Module: parseNodes InitialContents: InitializeToExpression: (list copyRemoveAll)'
        
         statements <- list copyRemoveAll.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'oldParser' -> 'parseNodes' -> () From: ( | {
         'ModuleInfo: Module: parseNodes InitialContents: FollowSlot'
        
         unarySend = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'oldParser' -> 'parseNodes' -> 'unarySend' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals oldParser parseNodes unarySend.
\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'oldParser' -> 'parseNodes' -> () From: ( | {
         'ModuleInfo: Module: parseNodes InitialContents: FollowSlot'
        
         unarySend = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'oldParser' -> 'parseNodes' -> 'unarySend' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits oldParser parseNodes unarySend.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'oldParser' -> 'parseNodes' -> 'unarySend' -> () From: ( | {
         'ModuleInfo: Module: parseNodes InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'oldParser' -> 'parseNodes' -> 'unarySend' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'oldParser' -> 'parseNodes' -> 'unarySend' -> () From: ( | {
         'ModuleInfo: Module: parseNodes InitialContents: FollowSlot'
        
         receiver.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'oldParser' -> 'parseNodes' -> 'unarySend' -> () From: ( | {
         'ModuleInfo: Module: parseNodes InitialContents: FollowSlot'
        
         selector.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'oldParser' -> () From: ( | {
         'ModuleInfo: Module: parseNodes InitialContents: FollowSlot'
        
         parseNodes = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'oldParser' -> 'parseNodes' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits oldParser parseNodes.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'oldParser' -> 'parseNodes' -> 'argSlot' -> () From: ( | {
         'ModuleInfo: Module: parseNodes InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'oldParser' -> 'parseNodes' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'oldParser' -> 'parseNodes' -> 'argSlot' -> () From: ( | {
         'ModuleInfo: Module: parseNodes InitialContents: FollowSlot'
        
         statePrintString = ( |
            | name).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'oldParser' -> 'parseNodes' -> 'binarySend' -> () From: ( | {
         'ModuleInfo: Module: parseNodes InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'oldParser' -> 'parseNodes' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'oldParser' -> 'parseNodes' -> 'binarySend' -> () From: ( | {
         'ModuleInfo: Module: parseNodes InitialContents: FollowSlot'
        
         statePrintString = ( |
            | 
            receiver printString, ', ', selector printString, ', ',
                      argument printString).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'oldParser' -> 'parseNodes' -> 'blockObject' -> () From: ( | {
         'ModuleInfo: Module: parseNodes InitialContents: FollowSlot'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'oldParser' -> 'parseNodes' -> 'blockObject' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits oldParser parseNodes blockObject parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'oldParser' -> 'parseNodes' -> 'blockObject' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: parseNodes InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'oldParser' -> 'parseNodes' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'oldParser' -> 'parseNodes' -> 'blockObject' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: parseNodes InitialContents: FollowSlot'
        
         statePrintString = ( |
            | 
            slotList printString, ', ', code printString).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'oldParser' -> 'parseNodes' -> 'implicitSelf' -> () From: ( | {
         'ModuleInfo: Module: parseNodes InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'oldParser' -> 'parseNodes' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'oldParser' -> 'parseNodes' -> 'keywordSend' -> () From: ( | {
         'ModuleInfo: Module: parseNodes InitialContents: FollowSlot'
        
         copy = ( |
            | clone arguments: arguments copyRemoveAll).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'oldParser' -> 'parseNodes' -> 'keywordSend' -> () From: ( | {
         'ModuleInfo: Module: parseNodes InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'oldParser' -> 'parseNodes' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'oldParser' -> 'parseNodes' -> 'keywordSend' -> () From: ( | {
         'ModuleInfo: Module: parseNodes InitialContents: FollowSlot'
        
         statePrintString = ( |
            | 
            receiver printString, ', ',
            selector printString, ', ',
            arguments printString).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'oldParser' -> 'parseNodes' -> 'methodObject' -> () From: ( | {
         'ModuleInfo: Module: parseNodes InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'oldParser' -> 'parseNodes' -> 'blockObject' -> 'parent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'oldParser' -> 'parseNodes' -> 'nonArgSlot' -> () From: ( | {
         'ModuleInfo: Module: parseNodes InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'oldParser' -> 'parseNodes' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'oldParser' -> 'parseNodes' -> 'nonArgSlot' -> () From: ( | {
         'ModuleInfo: Module: parseNodes InitialContents: FollowSlot'
        
         statePrintString = ( |
            | 
             name printString,
            (isWritable && [value isNil] ifTrue: [ '' ] False: [
                (isWritable ifTrue: ' <- ' False: ' = '),
                value printString])).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'oldParser' -> 'parseNodes' -> () From: ( | {
         'ModuleInfo: Module: parseNodes InitialContents: FollowSlot'
        
         object = bootstrap stub -> 'traits' -> 'oldParser' -> 'parseNodes' -> 'blockObject' -> 'parent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'oldParser' -> 'parseNodes' -> () From: ( | {
         'ModuleInfo: Module: parseNodes InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'clonable' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'oldParser' -> 'parseNodes' -> 'slotList' -> () From: ( | {
         'ModuleInfo: Module: parseNodes InitialContents: FollowSlot'
        
         add: x = ( |
            | slots add: x.  self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'oldParser' -> 'parseNodes' -> 'slotList' -> () From: ( | {
         'ModuleInfo: Module: parseNodes InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'oldParser' -> 'parseNodes' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'oldParser' -> 'parseNodes' -> 'slotName' -> () From: ( | {
         'ModuleInfo: Module: parseNodes InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'oldParser' -> 'parseNodes' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'oldParser' -> 'parseNodes' -> 'slotName' -> () From: ( | {
         'ModuleInfo: Module: parseNodes InitialContents: FollowSlot'
        
         statePrintString = ( |
            | name).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'oldParser' -> 'parseNodes' -> 'statements' -> () From: ( | {
         'ModuleInfo: Module: parseNodes InitialContents: FollowSlot'
        
         add: x = ( |
            | statements add: x.  self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'oldParser' -> 'parseNodes' -> 'statements' -> () From: ( | {
         'ModuleInfo: Module: parseNodes InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'oldParser' -> 'parseNodes' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'oldParser' -> 'parseNodes' -> 'unarySend' -> () From: ( | {
         'ModuleInfo: Module: parseNodes InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'oldParser' -> 'parseNodes' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'oldParser' -> 'parseNodes' -> 'unarySend' -> () From: ( | {
         'ModuleInfo: Module: parseNodes InitialContents: FollowSlot'
        
         statePrintString = ( |
            | 
            receiver printString, ', ', selector printString).
        } | ) 



 '-- Side effects'

 globals modules parseNodes postFileIn
