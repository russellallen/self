 'Sun-$Revision: 30.8 $'
 '
Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: parser InitialContents: FollowSlot'
        
         parser = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'parser' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'comment' From:
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'parser' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules parser.

CopyDowns:
globals modules init. copy 
SlotsToOmit: comment directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'parser' -> () From: ( | {
         'ModuleInfo: Module: parser InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'tests'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'parser' -> () From: ( | {
         'ModuleInfo: Module: parser InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'parser' -> () From: ( | {
         'ModuleInfo: Module: parser InitialContents: FollowSlot'
        
         myComment <- 'CAUTION: This file is not part of the documented Self world.  It may be
             be changed or removed at any time, and it will not be documented.  Don\'t
             try to learn good Self style from this file.

             This file can be removed from all.self without affecting the Self world,
             except for tests.self which uses it for testing purposes.\"

              \"A parser for an old version of Self grammar.\"

            \"Doesn\'t handle delegation!'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'parser' -> () From: ( | {
         'ModuleInfo: Module: parser InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- 'Sun-$Revision: 30.8 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'parser' -> () From: ( | {
         'ModuleInfo: Module: parser InitialContents: FollowSlot\x7fVisibility: private'
        
         subpartNames <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: applications\x7fModuleInfo: Module: parser InitialContents: FollowSlot\x7fVisibility: public'
        
         oldParser = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'oldParser' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals oldParser.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'oldParser' -> () From: ( | {
         'ModuleInfo: Module: parser InitialContents: FollowSlot'
        
         debugParser = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'oldParser' -> 'debugParser' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals oldParser debugParser.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'oldParser' -> 'debugParser' -> () From: ( | {
         'ModuleInfo: Module: parser InitialContents: FollowSlot'
        
         input.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'oldParser' -> 'debugParser' -> () From: ( | {
         'ModuleInfo: Module: parser InitialContents: FollowSlot'
        
         inputPosition.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'oldParser' -> () From: ( | {
         'ModuleInfo: Module: parser InitialContents: FollowSlot'
        
         debugParser = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'oldParser' -> 'debugParser' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits oldParser debugParser.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'oldParser' -> 'debugParser' -> () From: ( | {
         'ModuleInfo: Module: parser InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'oldParser' -> 'debugParser' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'oldParser' -> 'debugParser' -> () From: ( | {
         'ModuleInfo: Module: parser InitialContents: FollowSlot'
        
         thisChar.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'oldParser' -> 'debugParser' -> () From: ( | {
         'ModuleInfo: Module: parser InitialContents: FollowSlot'
        
         whatWasExpected.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'oldParser' -> () From: ( | {
         'ModuleInfo: Module: parser InitialContents: FollowSlot'
        
         parser = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'oldParser' -> 'parser' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals oldParser parser.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'oldParser' -> 'parser' -> () From: ( | {
         'ModuleInfo: Module: parser InitialContents: FollowSlot'
        
         input.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'oldParser' -> 'parser' -> () From: ( | {
         'ModuleInfo: Module: parser InitialContents: FollowSlot'
        
         inputPosition.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'oldParser' -> () From: ( | {
         'ModuleInfo: Module: parser InitialContents: FollowSlot'
        
         noisyParser = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'oldParser' -> 'noisyParser' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits oldParser noisyParser.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'oldParser' -> 'parser' -> () From: ( | {
         'ModuleInfo: Module: parser InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'oldParser' -> 'noisyParser' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'oldParser' -> 'parser' -> () From: ( | {
         'ModuleInfo: Module: parser InitialContents: FollowSlot'
        
         thisChar.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'oldParser' -> 'parser' -> () From: ( | {
         'ModuleInfo: Module: parser InitialContents: FollowSlot'
        
         whatWasExpected.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'oldParser' -> () From: ( | {
         'ModuleInfo: Module: parser InitialContents: FollowSlot'
        
         silentParser = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'oldParser' -> 'silentParser' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals oldParser silentParser.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'oldParser' -> 'silentParser' -> () From: ( | {
         'ModuleInfo: Module: parser InitialContents: FollowSlot'
        
         input.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'oldParser' -> 'silentParser' -> () From: ( | {
         'ModuleInfo: Module: parser InitialContents: FollowSlot'
        
         inputPosition.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'oldParser' -> () From: ( | {
         'ModuleInfo: Module: parser InitialContents: FollowSlot'
        
         silentParser = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'oldParser' -> 'silentParser' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits oldParser silentParser.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'oldParser' -> 'silentParser' -> () From: ( | {
         'ModuleInfo: Module: parser InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'oldParser' -> 'silentParser' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'oldParser' -> 'silentParser' -> () From: ( | {
         'ModuleInfo: Module: parser InitialContents: FollowSlot'
        
         thisChar.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'oldParser' -> 'silentParser' -> () From: ( | {
         'ModuleInfo: Module: parser InitialContents: FollowSlot'
        
         whatWasExpected.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: applications\x7fModuleInfo: Module: parser InitialContents: FollowSlot\x7fVisibility: public'
        
         oldParser = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'oldParser' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits oldParser.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'oldParser' -> 'debugParser' -> () From: ( | {
         'ModuleInfo: Module: parser InitialContents: FollowSlot'
        
         argSlot: f = ( |
            | ' argSlot ' print. resend.argSlot: f).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'oldParser' -> 'debugParser' -> () From: ( | {
         'ModuleInfo: Module: parser InitialContents: FollowSlot'
        
         binaryMessage: f Receiver: r = ( |
            | 
            ' binaryMessage:Receiver: ' print.
            resend.binaryMessage: f Receiver: r).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'oldParser' -> 'debugParser' -> () From: ( | {
         'ModuleInfo: Module: parser InitialContents: FollowSlot'
        
         binaryMessages: f = ( |
            | ' binaryMessages ' print. resend.binaryMessages: f).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'oldParser' -> 'debugParser' -> () From: ( | {
         'ModuleInfo: Module: parser InitialContents: FollowSlot'
        
         binarySelector: f = ( |
            | ' binarySelector ' print. resend.binarySelector: f).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'oldParser' -> 'debugParser' -> () From: ( | {
         'ModuleInfo: Module: parser InitialContents: FollowSlot'
        
         blockObject: f = ( |
            | ' blockObject ' print. resend.blockObject: f).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'oldParser' -> 'debugParser' -> () From: ( | {
         'ModuleInfo: Module: parser InitialContents: FollowSlot'
        
         expression: f = ( |
            | ' expression ' print. resend.expression: f).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'oldParser' -> 'debugParser' -> () From: ( | {
         'ModuleInfo: Module: parser InitialContents: FollowSlot'
        
         fail: f = ( |
            | 'FAIL ' print. resend.fail: f).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'oldParser' -> 'debugParser' -> () From: ( | {
         'ModuleInfo: Module: parser InitialContents: FollowSlot'
        
         identifier: f = ( |
            | ' identifier ' print. resend.identifier: f).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'oldParser' -> 'debugParser' -> () From: ( | {
         'ModuleInfo: Module: parser InitialContents: FollowSlot'
        
         keywordMessage: f Receiver: r = ( |
            | 
            ' keywordMessage:Receiver: ' print.
            resend.keywordMessage: f Receiver: r).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'oldParser' -> 'debugParser' -> () From: ( | {
         'ModuleInfo: Module: parser InitialContents: FollowSlot'
        
         keywordMessages: f = ( |
            | ' keywordMessages ' print. resend.keywordMessages: f).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'oldParser' -> 'debugParser' -> () From: ( | {
         'ModuleInfo: Module: parser InitialContents: FollowSlot'
        
         literal: s Fail: f = ( |
            | 
            (' literal ', s, ' ') print. resend.literal: s Fail: f).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'oldParser' -> 'debugParser' -> () From: ( | {
         'ModuleInfo: Module: parser InitialContents: FollowSlot'
        
         lookingFor: s = ( |
            | 
            (' looking for ', s, '\n') print. resend.lookingFor: s. self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'oldParser' -> 'debugParser' -> () From: ( | {
         'ModuleInfo: Module: parser InitialContents: FollowSlot'
        
         lowerKeyword: f = ( |
            | ' lowerKeyword ' print. resend.lowerKeyword: f).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'oldParser' -> 'debugParser' -> () From: ( | {
         'ModuleInfo: Module: parser InitialContents: FollowSlot'
        
         methodObject: f = ( |
            | ' methodObject ' print. resend.methodObject: f).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'oldParser' -> 'debugParser' -> () From: ( | {
         'ModuleInfo: Module: parser InitialContents: FollowSlot'
        
         nonArgSlot: f = ( |
            | ' nonArgSlot ' print. resend.nonArgSlot: f).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'oldParser' -> 'debugParser' -> () From: ( | {
         'ModuleInfo: Module: parser InitialContents: FollowSlot'
        
         number: f = ( |
            | ' number ' print. resend.number: f).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'oldParser' -> () From: ( | {
         'ModuleInfo: Module: parser InitialContents: FollowSlot'
        
         parser = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'oldParser' -> 'parser' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits oldParser parser.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'oldParser' -> 'debugParser' -> () From: ( | {
         'ModuleInfo: Module: parser InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'oldParser' -> 'parser' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'oldParser' -> 'debugParser' -> () From: ( | {
         'ModuleInfo: Module: parser InitialContents: FollowSlot'
        
         slot: f = ( |
            | ' slot ' print. resend.slot: f).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'oldParser' -> 'debugParser' -> () From: ( | {
         'ModuleInfo: Module: parser InitialContents: FollowSlot'
        
         slotList: f = ( |
            | ' slotList ' print. resend.slotList: f).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'oldParser' -> 'debugParser' -> () From: ( | {
         'ModuleInfo: Module: parser InitialContents: FollowSlot'
        
         slotName: f = ( |
            | ' slotName ' print.  resend.slotName: f).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'oldParser' -> 'debugParser' -> () From: ( | {
         'ModuleInfo: Module: parser InitialContents: FollowSlot'
        
         statements: f = ( |
            | ' statements ' print. resend.statements: f).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'oldParser' -> 'debugParser' -> () From: ( | {
         'ModuleInfo: Module: parser InitialContents: FollowSlot'
        
         string: f = ( |
            | ' string ' print. resend.string: f).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'oldParser' -> 'debugParser' -> () From: ( | {
         'ModuleInfo: Module: parser InitialContents: FollowSlot'
        
         unaryMessage: f Receiver: r = ( |
            | 
            ' unaryMessage:Receiver: ' print.
            resend.unaryMessage: f Receiver: r).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'oldParser' -> 'debugParser' -> () From: ( | {
         'ModuleInfo: Module: parser InitialContents: FollowSlot'
        
         unaryMessages: f = ( |
            | ' unaryMessages ' print. resend.unaryMessages: f).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'oldParser' -> 'debugParser' -> () From: ( | {
         'ModuleInfo: Module: parser InitialContents: FollowSlot'
        
         unarySelector: f = ( |
            | ' unarySelector ' print. resend.unarySelector: f).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'oldParser' -> 'debugParser' -> () From: ( | {
         'ModuleInfo: Module: parser InitialContents: FollowSlot'
        
         upperKeyword: f = ( |
            | ' upperKeyword ' print. resend.upperKeyword: f).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'oldParser' -> 'noisyParser' -> () From: ( | {
         'ModuleInfo: Module: parser InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'oldParser' -> 'parser' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'oldParser' -> 'noisyParser' -> () From: ( | {
         'ModuleInfo: Module: parser InitialContents: FollowSlot'
        
         printRetreat = ( |
            | '<-' print).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'oldParser' -> 'noisyParser' -> () From: ( | {
         'ModuleInfo: Module: parser InitialContents: FollowSlot'
        
         printThisChar = ( |
            | 
            thisChar ifNotNil: [ thisChar print ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'oldParser' -> 'parser' -> () From: ( | {
         'ModuleInfo: Module: parser InitialContents: FollowSlot'
        
         advance = ( |
            | 
            eof ifTrue: [^error: 'advancing past end'].
            inputPosition: inputPosition successor.
            setThisChar.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'oldParser' -> 'parser' -> () From: ( | {
         'ModuleInfo: Module: parser InitialContents: FollowSlot'
        
         advance: i = ( |
            | i do: [ advance ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'oldParser' -> 'parser' -> () From: ( | {
         'ModuleInfo: Module: parser InitialContents: FollowSlot'
        
         argSlot: f = ( |
            | 
            literal: ':' Fail: [^fail: f].
            oldParser parseNodes argSlot copy name: identifier: [^syntaxError]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'oldParser' -> 'parser' -> () From: ( | {
         'ModuleInfo: Module: parser InitialContents: FollowSlot'
        
         binaryMessage: f Receiver: r = ( | {
                 'ModuleInfo: Module: parser InitialContents: FollowSlot'
                
                 n.
                }  {
                 'ModuleInfo: Module: parser InitialContents: FollowSlot'
                
                 s.
                } 
            | 
            s: binarySelector: [^fail: f].
            n: oldParser parseNodes binarySend copy.
            n receiver: r.
            n selector: s.
            n argument: unaryMessages: [^syntaxError].
            n).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'oldParser' -> 'parser' -> () From: ( | {
         'ModuleInfo: Module: parser InitialContents: FollowSlot'
        
         binaryMessages: f = ( | {
                 'ModuleInfo: Module: parser InitialContents: FollowSlot'
                
                 n.
                } 
            | 
            n: unaryMessages: [
                binaryMessage: [^fail: f] Receiver: selfNode].
            [ n: binaryMessage: [^n] Receiver: n ] loop).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'oldParser' -> 'parser' -> () From: ( | {
         'ModuleInfo: Module: parser InitialContents: FollowSlot'
        
         binarySelector: f = ( | {
                 'ModuleInfo: Module: parser InitialContents: FollowSlot'
                
                 sel <- ''.
                } 
            | 
            lookingFor: 'binary selector'.
            [isBinary] whileTrue: [ sel: sel, thisChar. advance. ].
            (sel = '') || [ (sel = '|') || [ (sel = '^') ]] ifTrue: [
                retreat: sel size. ^fail: f].
            white.
            sel).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'oldParser' -> 'parser' -> () From: ( | {
         'ModuleInfo: Module: parser InitialContents: FollowSlot'
        
         blockObject: f = ( | {
                 'ModuleInfo: Module: parser InitialContents: FollowSlot'
                
                 n.
                } 
            | 
            token: '[' Fail: [^fail: f].
            n: oldParser parseNodes blockObject copy.
            n slotList: slotList: [oldParser parseNodes slotList copy].
            n code: statements: [selfNode].
            token: ']' Fail: [^syntaxError].
            n).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'oldParser' -> 'parser' -> () From: ( | {
         'ModuleInfo: Module: parser InitialContents: FollowSlot'
        
         bof = ( |
            | inputPosition <= input firstKey).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'oldParser' -> 'parser' -> () From: ( | {
         'ModuleInfo: Module: parser InitialContents: FollowSlot'
        
         comment: f = ( |
            | 
            literal: '"' Fail: [^fail: f].
            [
                [ | :e |
                    literal: '"' Fail: e.
                    ^self
                ] exit.
                advance.
            ] loop).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'oldParser' -> 'parser' -> () From: ( | {
         'ModuleInfo: Module: parser InitialContents: FollowSlot'
        
         eof = ( |
            | inputPosition >  input lastKey).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'oldParser' -> 'parser' -> () From: ( | {
         'ModuleInfo: Module: parser InitialContents: FollowSlot'
        
         expression: f = ( |
            | keywordMessages: f).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'oldParser' -> 'parser' -> () From: ( | {
         'Comment: debug hook\x7fModuleInfo: Module: parser InitialContents: FollowSlot'
        
         fail: f = ( |
            | f value).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'oldParser' -> 'parser' -> () From: ( | {
         'ModuleInfo: Module: parser InitialContents: FollowSlot'
        
         identifier: f = ( | {
                 'ModuleInfo: Module: parser InitialContents: FollowSlot'
                
                 r <- ''.
                } 
            | 
            lookingFor: 'identifier'.
            isLetter ifFalse: [^fail: f].
            [r: r, thisChar. advance] untilFalse: [isLetter || [isDigit]].
            white.
            r).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'oldParser' -> 'parser' -> () From: ( | {
         'ModuleInfo: Module: parser InitialContents: FollowSlot'
        
         isBinary = ( |
            | '!@#$%^&*-+=\\~<,>/?|' includes: thisChar).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'oldParser' -> 'parser' -> () From: ( | {
         'ModuleInfo: Module: parser InitialContents: FollowSlot'
        
         isDigit = ( |
            | thisChar isDigit).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'oldParser' -> 'parser' -> () From: ( | {
         'ModuleInfo: Module: parser InitialContents: FollowSlot'
        
         isLetter = ( |
            | isLower || [isUpper]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'oldParser' -> 'parser' -> () From: ( | {
         'ModuleInfo: Module: parser InitialContents: FollowSlot'
        
         isLower = ( |
            | thisChar isLowerCase).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'oldParser' -> 'parser' -> () From: ( | {
         'ModuleInfo: Module: parser InitialContents: FollowSlot'
        
         isUpper = ( |
            | thisChar isUpperCase).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'oldParser' -> 'parser' -> () From: ( | {
         'ModuleInfo: Module: parser InitialContents: FollowSlot'
        
         isWhite = ( |
            | ' \t\n' includes: thisChar).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'oldParser' -> 'parser' -> () From: ( | {
         'ModuleInfo: Module: parser InitialContents: FollowSlot'
        
         keyword: f = ( | {
                 'ModuleInfo: Module: parser InitialContents: FollowSlot'
                
                 x.
                } 
            | 
            x: identifier: [^fail: f].
            token: ':' Fail: [retreat: x size. ^fail: f].
            x, ':').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'oldParser' -> 'parser' -> () From: ( | {
         'ModuleInfo: Module: parser InitialContents: FollowSlot'
        
         keywordMessage: f Receiver: r = ( | {
                 'ModuleInfo: Module: parser InitialContents: FollowSlot'
                
                 n.
                }  {
                 'ModuleInfo: Module: parser InitialContents: FollowSlot'
                
                 s.
                } 
            | 
            s: lowerKeyword: [^fail: f].
            n: oldParser parseNodes keywordSend copy.
            n receiver: r.
            n selector: s.
            n arguments: list copyRemoveAll.
            [
                n arguments addLast: keywordMessages: [^syntaxError].
                n selector: n selector, upperKeyword: [^n].
            ] loop).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'oldParser' -> 'parser' -> () From: ( | {
         'ModuleInfo: Module: parser InitialContents: FollowSlot'
        
         keywordMessages: f = ( | {
                 'ModuleInfo: Module: parser InitialContents: FollowSlot'
                
                 n.
                } 
            | 
            n: binaryMessages: [
                ^keywordMessage: [^fail: f] Receiver: selfNode
            ].
            keywordMessage: [^n] Receiver: n).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'oldParser' -> 'parser' -> () From: ( | {
         'ModuleInfo: Module: parser InitialContents: FollowSlot'
        
         literal: s Fail: f = ( |
            | 
            lookingFor: s.
            s do: [ | :v. :i |
                (i + inputPosition)  >=  input size ifTrue: [^fail: f]. "eof"
                (input at: i + inputPosition) = (s at: i)
                   ifFalse: [^fail: f] ].
            advance: s size.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'oldParser' -> 'parser' -> () From: ( | {
         'ModuleInfo: Module: parser InitialContents: FollowSlot'
        
         lookingFor: s = ( |
            | 
            whatWasExpected:
                whatWasExpected,
                (whatWasExpected isEmpty ifTrue: [' '] False: [' or ']),
                s.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'oldParser' -> 'parser' -> () From: ( | {
         'ModuleInfo: Module: parser InitialContents: FollowSlot'
        
         lowerKeyword: f = ( |
            | 
            lookingFor: 'lower case keyword'.
            isLower ifFalse: [^fail: f].
            keyword: f).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'oldParser' -> 'parser' -> () From: ( | {
         'ModuleInfo: Module: parser InitialContents: FollowSlot'
        
         methodObject: f = ( | {
                 'ModuleInfo: Module: parser InitialContents: FollowSlot'
                
                 n.
                } 
            | 
            token: '(' Fail: [^fail: f].
            n: oldParser parseNodes methodObject copy.
            n slotList: slotList: [oldParser parseNodes slotList copy].
            n code: statements: [selfNode].
            token: ')' Fail: [^syntaxError].
            n).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'oldParser' -> 'parser' -> () From: ( | {
         'ModuleInfo: Module: parser InitialContents: FollowSlot'
        
         nonArgSlot: f = ( | {
                 'ModuleInfo: Module: parser InitialContents: FollowSlot'
                
                 n.
                } 
            | 
            n: oldParser parseNodes nonArgSlot copy.
            n name: slotName: [^fail: f].
            token: '=' Fail: [
                n isWritable: true.
                token: '<-' Fail: [^n] ].
            n value: expression: [^syntaxError].
            n).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'oldParser' -> 'parser' -> () From: ( | {
         'ModuleInfo: Module: parser InitialContents: FollowSlot'
        
         number: f = ( |
            | 
            lookingFor: 'number'.
            number: f Base: 10).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'oldParser' -> 'parser' -> () From: ( | {
         'ModuleInfo: Module: parser InitialContents: FollowSlot'
        
         number: f Base: b = ( | {
                 'ModuleInfo: Module: parser InitialContents: FollowSlot'
                
                 x <- 0.
                } 
            | 
            isDigit || [(b > 10) && [isLetter]] ifFalse: [^fail: f].
            [
                x: x * b.
                x: (x + thisChar asByte) - (
                  isDigit
                    ifTrue: ['0' first asByte]
                    False: [ isLetter && [b > 10]
                      ifTrue: [
                        (isUpper ifTrue: ['A'] False: ['a']) first asByte + 10]
                      False: [^syntaxError]]).
                advance.
            ] untilFalse: [isDigit].
            white.
            x).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'oldParser' -> 'parser' -> () From: ( | {
         'ModuleInfo: Module: parser InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'clonable' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'oldParser' -> 'parser' -> () From: ( | {
         'ModuleInfo: Module: parser InitialContents: FollowSlot'
        
         primary: f = ( |
            | 
            number: [
                string: [
                    methodObject: [
                        blockObject: [
                            fail: f
                        ]
                    ]
                ]
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'oldParser' -> 'parser' -> () From: ( | {
         'ModuleInfo: Module: parser InitialContents: FollowSlot'
        
         restOfSlotList: f Node: n = ( |
            | 
            token: '|' Fail: [
                n addLast: slot: [^syntaxError].
                token: '.' Fail: [
                    token: '|' Fail: [^syntaxError].
                    ^n
                ].
                restOfSlotList: f Node: n.
            ].
            n).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'oldParser' -> 'parser' -> () From: ( | {
         'ModuleInfo: Module: parser InitialContents: FollowSlot'
        
         retreat = ( |
            | 
            bof ifTrue: [^error: 'retreating past beginning'].
            printRetreat.
            inputPosition: inputPosition predecessor.
            setThisChar. self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'oldParser' -> 'parser' -> () From: ( | {
         'ModuleInfo: Module: parser InitialContents: FollowSlot'
        
         retreat: i = ( |
            | i do: [ retreat ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'oldParser' -> 'parser' -> () From: ( | {
         'Comment: shorthand\x7fModuleInfo: Module: parser InitialContents: FollowSlot'
        
         selfNode = ( |
            | oldParser parseNodes implicitSelf copy).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'oldParser' -> 'parser' -> () From: ( | {
         'ModuleInfo: Module: parser InitialContents: FollowSlot'
        
         setThisChar = ( |
            | 
            whatWasExpected: ''.
            printThisChar.
            thisChar: eof ifTrue: [' ' first] False: [input at: inputPosition].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'oldParser' -> 'parser' -> () From: ( | {
         'ModuleInfo: Module: parser InitialContents: FollowSlot'
        
         slot: f = ( |
            | 
            argSlot: [
                nonArgSlot: [ ^syntaxError ] ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'oldParser' -> 'parser' -> () From: ( | {
         'ModuleInfo: Module: parser InitialContents: FollowSlot'
        
         slotList: f = ( |
            | 
            token: '|' Fail: [^fail: f].
            restOfSlotList: f Node: oldParser parseNodes slotList copy).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'oldParser' -> 'parser' -> () From: ( | {
         'Comment: elim slot Name node--use slot node here instead
     so it can this method can set parent bit, & arg names \x7fModuleInfo: Module: parser InitialContents: FollowSlot'
        
         slotName: f = ( | {
                 'ModuleInfo: Module: parser InitialContents: FollowSlot'
                
                 namePart.
                }  {
                 'ModuleInfo: Module: parser InitialContents: FollowSlot'
                
                 node.
                } 
            | 
            node: oldParser parseNodes slotName copy.
            node name: identifier: [^fail: f].
            token: ':' Fail: [
                token: '*' Fail: [^node].
                node isParent: true.
                ^node ].
            node name: node name, ':'.
            namePart: identifier: [^node].
            token: ':' Fail: [
                [
                    node arguments addLast: namePart.
                    node name: node name, (upperKeyword: [^node]).
                ] loop ].
            [ node name: node name, (upperKeyword: [^node]). ] loop).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'oldParser' -> 'parser' -> () From: ( | {
         'ModuleInfo: Module: parser InitialContents: FollowSlot'
        
         source: s = ( |
            | 
            input: s.
            inputPosition: input firstKey.
            setThisChar. white.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'oldParser' -> 'parser' -> () From: ( | {
         'ModuleInfo: Module: parser InitialContents: FollowSlot'
        
         statements: f = ( | {
                 'ModuleInfo: Module: parser InitialContents: FollowSlot'
                
                 n.
                } 
            | 
            n: oldParser parseNodes statements copy.
            n add: expression: [^fail: f].
            [ | :exit |
                token: '.' Fail: [^n].
                thisChar = '^' ifTrue: exit.
                n addLast: expression: [^n].
            ] loopExit.
            advance.
            n addLast: oldParser parseNodes return copy
                message: expression: [^syntaxError].
            n).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'oldParser' -> 'parser' -> () From: ( | {
         'ModuleInfo: Module: parser InitialContents: FollowSlot'
        
         string: f = ( | {
                 'ModuleInfo: Module: parser InitialContents: FollowSlot'
                
                 x <- ''.
                } 
            | 
            literal: '\'' Fail: [^fail: f].
            [thisChar = '\''] whileFalse: [
                thisChar = '\\'
                    ifTrue: [
                        advance.
                        thisChar = 'r'  ifTrue: [advance. x: x, '\r'].
                        thisChar = 'n'  ifTrue: [advance. x: x, '\n'].
                        thisChar = 't'  ifTrue: [advance. x: x, '\t'].
                        thisChar = '\\' ifTrue: [advance. x: x, '\\'].
                        thisChar = '\'' ifTrue: [advance. x: x, '\''].
                        isDigit ifTrue: [x: x,
                            mutableString copySize: 1 FillingWith:
                                (number: [^syntaxError] Base: 8) asCharacter]]
                     False: [x: x, thisChar. advance].
            ].
            white.
            x).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'oldParser' -> 'parser' -> () From: ( | {
         'ModuleInfo: Module: parser InitialContents: FollowSlot'
        
         syntaxError = ( |
            | 
            error:
                (input copySize: inputPosition),
                '(<', whatWasExpected, ' expected)>',
                (input copyFrom: inputPosition).
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'oldParser' -> 'parser' -> () From: ( | {
         'ModuleInfo: Module: parser InitialContents: FollowSlot'
        
         test = ( |
            | testAddPoints).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'oldParser' -> 'parser' -> () From: ( | {
         'ModuleInfo: Module: parser InitialContents: FollowSlot'
        
         test: s = ( | {
                 'ModuleInfo: Module: parser InitialContents: FollowSlot'
                
                 p.
                } 
            | 
            p: copy.
            p source: s.
            p expression: [^p syntaxError]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'oldParser' -> 'parser' -> () From: ( | {
         'ModuleInfo: Module: parser InitialContents: FollowSlot'
        
         testAddPoints = ( |
            | test: '(clone x: x + p x) y: y + p y').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'oldParser' -> 'parser' -> () From: ( | {
         'ModuleInfo: Module: parser InitialContents: FollowSlot'
        
         testOnePlusTwo = ( |
            | test: '1 + 2').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'oldParser' -> 'parser' -> () From: ( | {
         'ModuleInfo: Module: parser InitialContents: FollowSlot'
        
         testRandom = ( |
            | 
            test: '3 + nil "*" a: b + c d e B: "\'asd\'" size C: a: 3').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'oldParser' -> 'parser' -> () From: ( | {
         'ModuleInfo: Module: parser InitialContents: FollowSlot'
        
         testXYZ = ( |
            | test: 'xyz').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'oldParser' -> 'parser' -> () From: ( | {
         'ModuleInfo: Module: parser InitialContents: FollowSlot'
        
         token: s Fail: f = ( |
            | literal: s Fail: [^fail: f]. white).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'oldParser' -> 'parser' -> () From: ( | {
         'ModuleInfo: Module: parser InitialContents: FollowSlot'
        
         unaryMessages: f = ( | {
                 'ModuleInfo: Module: parser InitialContents: FollowSlot'
                
                 n.
                } 
            | 
            n: primary: [^unaryMessages: [^fail: f] Receiver: selfNode].
            unaryMessages: [^n] Receiver: n).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'oldParser' -> 'parser' -> () From: ( | {
         'ModuleInfo: Module: parser InitialContents: FollowSlot'
        
         unaryMessages: f Receiver: r = ( | {
                 'ModuleInfo: Module: parser InitialContents: FollowSlot'
                
                 n.
                }  {
                 'ModuleInfo: Module: parser InitialContents: FollowSlot'
                
                 s.
                } 
            | 
            s: unarySelector: [^fail: f].
            n: oldParser parseNodes unarySend copy.
            n receiver: r.
            n selector: s.
            unaryMessages: [n] Receiver: n).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'oldParser' -> 'parser' -> () From: ( | {
         'ModuleInfo: Module: parser InitialContents: FollowSlot'
        
         unarySelector: f = ( | {
                 'ModuleInfo: Module: parser InitialContents: FollowSlot'
                
                 sel.
                } 
            | 
            sel: identifier: [^fail: f].
            thisChar = ':' ifTrue: [retreat: sel size. ^fail: f].
            white.
            sel).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'oldParser' -> 'parser' -> () From: ( | {
         'ModuleInfo: Module: parser InitialContents: FollowSlot'
        
         upperKeyword: f = ( |
            | 
            lookingFor: 'upper case keyword'.
            isUpper ifFalse: [^fail: f].
            keyword: f).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'oldParser' -> 'parser' -> () From: ( | {
         'ModuleInfo: Module: parser InitialContents: FollowSlot'
        
         white = ( |
            | 
            [ | :exit |
                [ eof not && [isWhite] ] whileTrue: [advance].
                comment: exit
            ] loopExit).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'oldParser' -> 'silentParser' -> () From: ( | {
         'ModuleInfo: Module: parser InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'oldParser' -> 'parser' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'oldParser' -> 'silentParser' -> () From: ( | {
         'ModuleInfo: Module: parser InitialContents: FollowSlot'
        
         printRetreat = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'oldParser' -> 'silentParser' -> () From: ( | {
         'ModuleInfo: Module: parser InitialContents: FollowSlot'
        
         printThisChar = ( |
            | self).
        } | ) 



 '-- Side effects'

 globals modules parser postFileIn
