 '$Revision: 30.8 $'
 '
Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: selfLexerTokens InitialContents: FollowSlot'
        
         selfLexerTokens = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'selfLexerTokens' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'comment' From:
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'selfLexerTokens' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules selfLexerTokens.

CopyDowns:
globals modules init. copy 
SlotsToOmit: comment directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'selfLexerTokens' -> () From: ( | {
         'ModuleInfo: Module: selfLexerTokens InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'applications/selfParser'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'selfLexerTokens' -> () From: ( | {
         'ModuleInfo: Module: selfLexerTokens InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'selfLexerTokens' -> () From: ( | {
         'ModuleInfo: Module: selfLexerTokens InitialContents: FollowSlot\x7fVisibility: private'
        
         myComment <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'selfLexerTokens' -> () From: ( | {
         'ModuleInfo: Module: selfLexerTokens InitialContents: FollowSlot'
        
         postFileIn = ( |
            | resend.postFileIn).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'selfLexerTokens' -> () From: ( | {
         'ModuleInfo: Module: selfLexerTokens InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- '$Revision: 30.8 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'selfLexerTokens' -> () From: ( | {
         'ModuleInfo: Module: selfLexerTokens InitialContents: FollowSlot\x7fVisibility: public'
        
         subpartNames <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'parseKit' -> 'parseNodes' -> 'node' -> 'parent' -> () From: ( | {
         'Category: testing for self\x7fModuleInfo: Module: selfLexerTokens InitialContents: FollowSlot\x7fVisibility: public'
        
         isSelfAbstractKeyword = bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'parseKit' -> 'parseNodes' -> 'node' -> 'parent' -> () From: ( | {
         'Category: testing for self\x7fModuleInfo: Module: selfLexerTokens InitialContents: FollowSlot\x7fVisibility: public'
        
         isSelfAbstractName = bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'parseKit' -> 'parseNodes' -> 'node' -> 'parent' -> () From: ( | {
         'Category: testing for self\x7fModuleInfo: Module: selfLexerTokens InitialContents: FollowSlot\x7fVisibility: public'
        
         isSelfAccept = bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'parseKit' -> 'parseNodes' -> 'node' -> 'parent' -> () From: ( | {
         'Category: testing for self\x7fModuleInfo: Module: selfLexerTokens InitialContents: FollowSlot\x7fVisibility: public'
        
         isSelfAnnotationEnd = bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'parseKit' -> 'parseNodes' -> 'node' -> 'parent' -> () From: ( | {
         'Category: testing for self\x7fModuleInfo: Module: selfLexerTokens InitialContents: FollowSlot\x7fVisibility: public'
        
         isSelfArgument = bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'parseKit' -> 'parseNodes' -> 'node' -> 'parent' -> () From: ( | {
         'Category: testing for self\x7fModuleInfo: Module: selfLexerTokens InitialContents: FollowSlot\x7fVisibility: public'
        
         isSelfBlockClose = bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'parseKit' -> 'parseNodes' -> 'node' -> 'parent' -> () From: ( | {
         'Category: testing for self\x7fModuleInfo: Module: selfLexerTokens InitialContents: FollowSlot\x7fVisibility: public'
        
         isSelfCapKeyword = bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'parseKit' -> 'parseNodes' -> 'node' -> 'parent' -> () From: ( | {
         'Category: testing for self\x7fModuleInfo: Module: selfLexerTokens InitialContents: FollowSlot\x7fVisibility: public'
        
         isSelfConstant = bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'parseKit' -> 'parseNodes' -> 'node' -> 'parent' -> () From: ( | {
         'Category: testing for self\x7fModuleInfo: Module: selfLexerTokens InitialContents: FollowSlot\x7fVisibility: public'
        
         isSelfConstantSlotAssignment = bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'parseKit' -> 'parseNodes' -> 'node' -> 'parent' -> () From: ( | {
         'Category: testing for self\x7fModuleInfo: Module: selfLexerTokens InitialContents: FollowSlot\x7fVisibility: public'
        
         isSelfDelegatee = bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'parseKit' -> 'parseNodes' -> 'node' -> 'parent' -> () From: ( | {
         'Category: testing for self\x7fModuleInfo: Module: selfLexerTokens InitialContents: FollowSlot\x7fVisibility: public'
        
         isSelfFirstKeyword = bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'parseKit' -> 'parseNodes' -> 'node' -> 'parent' -> () From: ( | {
         'Category: testing for self\x7fModuleInfo: Module: selfLexerTokens InitialContents: FollowSlot\x7fVisibility: public'
        
         isSelfObjectAnnotation = bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'parseKit' -> 'parseNodes' -> 'node' -> 'parent' -> () From: ( | {
         'Category: testing for self\x7fModuleInfo: Module: selfLexerTokens InitialContents: FollowSlot\x7fVisibility: public'
        
         isSelfObjectClose = bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'parseKit' -> 'parseNodes' -> 'node' -> 'parent' -> () From: ( | {
         'Category: testing for self\x7fModuleInfo: Module: selfLexerTokens InitialContents: FollowSlot\x7fVisibility: public'
        
         isSelfOpenParen = bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'parseKit' -> 'parseNodes' -> 'node' -> 'parent' -> () From: ( | {
         'Category: testing for self\x7fModuleInfo: Module: selfLexerTokens InitialContents: FollowSlot\x7fVisibility: public'
        
         isSelfOpenSquare = bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'parseKit' -> 'parseNodes' -> 'node' -> 'parent' -> () From: ( | {
         'Category: testing for self\x7fModuleInfo: Module: selfLexerTokens InitialContents: FollowSlot\x7fVisibility: public'
        
         isSelfOperator = bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'parseKit' -> 'parseNodes' -> 'node' -> 'parent' -> () From: ( | {
         'Category: testing for self\x7fModuleInfo: Module: selfLexerTokens InitialContents: FollowSlot\x7fVisibility: public'
        
         isSelfParent = bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'parseKit' -> 'parseNodes' -> 'node' -> 'parent' -> () From: ( | {
         'Category: testing for self\x7fModuleInfo: Module: selfLexerTokens InitialContents: FollowSlot\x7fVisibility: public'
        
         isSelfReceiver = bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'parseKit' -> 'parseNodes' -> 'node' -> 'parent' -> () From: ( | {
         'Category: testing for self\x7fModuleInfo: Module: selfLexerTokens InitialContents: FollowSlot\x7fVisibility: public'
        
         isSelfResendToken = bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'parseKit' -> 'parseNodes' -> 'node' -> 'parent' -> () From: ( | {
         'Category: testing for self\x7fModuleInfo: Module: selfLexerTokens InitialContents: FollowSlot\x7fVisibility: public'
        
         isSelfReturnToken = bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'parseKit' -> 'parseNodes' -> 'node' -> 'parent' -> () From: ( | {
         'Category: testing for self\x7fModuleInfo: Module: selfLexerTokens InitialContents: FollowSlot\x7fVisibility: public'
        
         isSelfSimpleName = bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'parseKit' -> 'parseNodes' -> 'node' -> 'parent' -> () From: ( | {
         'Category: testing for self\x7fModuleInfo: Module: selfLexerTokens InitialContents: FollowSlot\x7fVisibility: public'
        
         isSelfSlotAssignment = bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'parseKit' -> 'parseNodes' -> 'node' -> 'parent' -> () From: ( | {
         'Category: testing for self\x7fModuleInfo: Module: selfLexerTokens InitialContents: FollowSlot\x7fVisibility: public'
        
         isSelfSlotListDelimiter = bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'parseKit' -> 'parseNodes' -> 'node' -> 'parent' -> () From: ( | {
         'Category: testing for self\x7fModuleInfo: Module: selfLexerTokens InitialContents: FollowSlot\x7fVisibility: public'
        
         isSelfSlotSeparator = bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'parseKit' -> 'parseNodes' -> 'node' -> 'parent' -> () From: ( | {
         'Category: testing for self\x7fModuleInfo: Module: selfLexerTokens InitialContents: FollowSlot\x7fVisibility: public'
        
         isSelfStatementSeparator = bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'parseKit' -> 'parseNodes' -> 'node' -> 'parent' -> () From: ( | {
         'Category: testing for self\x7fModuleInfo: Module: selfLexerTokens InitialContents: FollowSlot\x7fVisibility: public'
        
         isSelfString = bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'characterSets' -> () From: ( | {
         'ModuleInfo: Module: selfLexerTokens InitialContents: FollowSlot\x7fVisibility: public'
        
         identifierCharacters = ((('a' asCharacterSet  =>  'z') + ('A' asCharacterSet  =>  'Z')) + ('0' asCharacterSet  =>  '9')) + ('_' asCharacterSet).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'characterSets' -> () From: ( | {
         'ModuleInfo: Module: selfLexerTokens InitialContents: FollowSlot\x7fVisibility: public'
        
         keywordCharacters = 'a' asCharacterSet  =>  'z'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'abstractSelfToken' -> () From: ( | {
         'ModuleInfo: Module: selfLexerTokens InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'abstractSelfToken' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals selfParser lexer tokens abstractSelfToken parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'abstractSelfToken' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: selfLexerTokens InitialContents: FollowSlot\x7fVisibility: private'
        
         condenseValueUsingSelfIfFail: fb = ( |
            | 
            value: source evalIfFail: [|:e|
              ^ illegalTokenReason: 'Self could not construct value for ',
                                     source, ' because: ', e printString, ' from:'
                FailBlock: fb
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'abstractSelfToken' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: selfLexerTokens InitialContents: FollowSlot\x7fVisibility: private'
        
         nameSpace* = bootstrap stub -> 'globals' -> 'selfParser' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'abstractSelfToken' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: selfLexerTokens InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'globals' -> 'parseKit' -> 'lexer' -> 'tokens' -> 'token' -> 'parent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'identifier' -> () From: ( | {
         'ModuleInfo: Module: selfLexerTokens InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'identifier' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals selfParser lexer tokens identifier parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'identifier' -> 'parent' -> () From: ( | {
         'Category: scanning\x7fModuleInfo: Module: selfLexerTokens InitialContents: FollowSlot\x7fVisibility: private'
        
         advancePastMeIfFail: fb = ( |
             t.
            | 
            scanLeadingCharacter.
            scanMiddleCharactersIfFail: [|:e| ^ fb value: e].
            t: scanTrailingCharacterIfFail: [|:e| ^ fb value: e].
            t).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'identifier' -> 'parent' -> () From: ( | {
         'Category: constructing\x7fModuleInfo: Module: selfLexerTokens InitialContents: FollowSlot\x7fVisibility: private'
        
         beResendIfFail: fb = ( |
            | 
            illegalTokenReason: 'using `resend\' as ', asMirror name
            FailBlock: fb).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'identifier' -> 'parent' -> () From: ( | {
         'Category: constructing\x7fModuleInfo: Module: selfLexerTokens InitialContents: FollowSlot\x7fVisibility: private'
        
         beSelfIfFail: fb = ( |
            | 
            illegalTokenReason: 'using `self\' as ', shortPrintString
            FailBlock: fb).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'identifier' -> 'parent' -> () From: ( | {
         'Category: constructing\x7fModuleInfo: Module: selfLexerTokens InitialContents: FollowSlot\x7fVisibility: public'
        
         condenseValueIfFail: fb = ( |
             s.
            | 
            resend.condenseValueIfFail: [|:e| ^ fb value: e].
            s: value.
            s: s last = ':' ifTrue: [s copyWithoutLast] False: s.
            case if: [ s = 'self'   ] Then: [   beSelfIfFail:   fb ]
                 If: [ s = 'resend' ] Then: [ beResendIfFail: fb ]
               Else: [ self ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'tokenWithName' -> () From: ( | {
         'ModuleInfo: Module: selfLexerTokens InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'tokenWithName' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals selfParser lexer tokens tokenWithName parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'identifier' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: selfLexerTokens InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'tokenWithName' -> 'parent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'identifier' -> 'parent' -> () From: ( | {
         'Category: scanning\x7fModuleInfo: Module: selfLexerTokens InitialContents: FollowSlot\x7fVisibility: private'
        
         scanLeadingCharacter = ( |
            | childShouldOverride).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'identifier' -> 'parent' -> () From: ( | {
         'Category: scanning\x7fModuleInfo: Module: selfLexerTokens InitialContents: FollowSlot\x7fVisibility: private'
        
         scanMiddleCharactersIfFail: fb = ( |
            | 
            [ characterSets identifierCharacters includes: in peek ]
              whileTrue: [ in advance ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'identifier' -> 'parent' -> () From: ( | {
         'Category: scanning\x7fModuleInfo: Module: selfLexerTokens InitialContents: FollowSlot\x7fVisibility: private'
        
         scanTrailingCharacterIfFail: fb = ( |
            | childShouldImplement).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> () From: ( | {
         'ModuleInfo: Module: selfLexerTokens InitialContents: FollowSlot\x7fVisibility: public'
        
         abstractSelfToken = bootstrap define: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'abstractSelfToken' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals parseKit lexer tokens token copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'abstractSelfToken' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals selfParser lexer tokens abstractSelfToken.

CopyDowns:
globals parseKit lexer tokens token. copy 
SlotsToOmit: parent.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> () From: ( | {
         'Category: value is source\x7fModuleInfo: Module: selfLexerTokens InitialContents: FollowSlot\x7fVisibility: private'
        
         tokenWithName = bootstrap define: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'tokenWithName' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals selfParser lexer tokens abstractSelfToken copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'tokenWithName' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals selfParser lexer tokens tokenWithName.

CopyDowns:
globals selfParser lexer tokens abstractSelfToken. copy 
SlotsToOmit: parent.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'tokenWithName' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: selfLexerTokens InitialContents: FollowSlot\x7fVisibility: public'
        
         condenseValueIfFail: fb = ( |
            | 
            resend.condenseValueIfFail: [|:e| ^ fb value: e].
            value: source).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'tokenWithName' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: selfLexerTokens InitialContents: FollowSlot\x7fVisibility: public'
        
         copyFrom: aTok = ( |
            | 
            (resend.copyFrom: aTok) value: aTok value).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'tokenWithName' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: selfLexerTokens InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'abstractSelfToken' -> 'parent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'tokenWithName' -> () From: ( | {
         'ModuleInfo: Module: selfLexerTokens InitialContents: InitializeToExpression: (\'\')\x7fVisibility: public'
        
         value <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> () From: ( | {
         'Category: value is source\x7fCategory: identifiers\x7fModuleInfo: Module: selfLexerTokens InitialContents: FollowSlot\x7fVisibility: public'
        
         identifier = bootstrap define: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'identifier' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals selfParser lexer tokens tokenWithName copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'identifier' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals selfParser lexer tokens identifier.

CopyDowns:
globals selfParser lexer tokens tokenWithName. copy 
SlotsToOmit: parent.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> () From: ( | {
         'Category: value is source\x7fCategory: identifiers\x7fCategory: keywords\x7fModuleInfo: Module: selfLexerTokens InitialContents: FollowSlot\x7fVisibility: private'
        
         nameOrKeyword = bootstrap define: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'nameOrKeyword' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals selfParser lexer tokens identifier copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'nameOrKeyword' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals selfParser lexer tokens nameOrKeyword.

CopyDowns:
globals selfParser lexer tokens identifier. copy 
SlotsToOmit: parent.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'nameOrKeyword' -> () From: ( | {
         'ModuleInfo: Module: selfLexerTokens InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'nameOrKeyword' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals selfParser lexer tokens nameOrKeyword parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'nameOrKeyword' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: selfLexerTokens InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'identifier' -> 'parent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'nameOrKeyword' -> 'parent' -> () From: ( | {
         'Category: scanning\x7fModuleInfo: Module: selfLexerTokens InitialContents: FollowSlot\x7fVisibility: private'
        
         scanLeadingCharacter = ( |
            | in advance).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'nameOrKeyword' -> 'parent' -> () From: ( | {
         'Category: scanning\x7fModuleInfo: Module: selfLexerTokens InitialContents: FollowSlot\x7fVisibility: private'
        
         scanTrailingCharacterIfFail: fb = ( |
            | 
            case
              if: [in peek = ':'] 
              Then: [|f. proto|
                in advance. "eat :"
                setEnd.
                f: source first.
                proto: case
                  if: [f = '_'      ]  Then: [lexer tokens primKeyword]
                  If: [f isLowerCase]  Then: [lexer tokens     keyword]
                  If: [f isUpperCase]  Then: [lexer tokens  capKeyword]
                  Else: [ error: 'should not get here'].
                proto copyFrom: self
              ]
              If: [(in peek = '.')
              &&  [characterSets selectorStart includes: in peekSecond]]
              Then: [
                in advance. "."
                lexer tokens delegatee copyFrom: self
              ]
              Else: [ self ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> () From: ( | {
         'Category: value is source\x7fCategory: identifiers\x7fCategory: keywords\x7fModuleInfo: Module: selfLexerTokens InitialContents: FollowSlot\x7fVisibility: private'
        
         abstractKeyword = bootstrap define: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'abstractKeyword' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals selfParser lexer tokens nameOrKeyword copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'abstractKeyword' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals selfParser lexer tokens abstractKeyword.

CopyDowns:
globals selfParser lexer tokens nameOrKeyword. copy 
SlotsToOmit: parent.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'abstractKeyword' -> () From: ( | {
         'ModuleInfo: Module: selfLexerTokens InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'abstractKeyword' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals selfParser lexer tokens abstractKeyword parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'abstractKeyword' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: selfLexerTokens InitialContents: FollowSlot\x7fVisibility: public'
        
         isSelfAbstractKeyword = bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'abstractKeyword' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: selfLexerTokens InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'nameOrKeyword' -> 'parent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> () From: ( | {
         'Category: value is source\x7fCategory: identifiers\x7fCategory: names\x7fModuleInfo: Module: selfLexerTokens InitialContents: FollowSlot\x7fVisibility: private'
        
         abstractName = bootstrap define: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'abstractName' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals selfParser lexer tokens nameOrKeyword copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'abstractName' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals selfParser lexer tokens abstractName.

CopyDowns:
globals selfParser lexer tokens nameOrKeyword. copy 
SlotsToOmit: parent.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'abstractName' -> () From: ( | {
         'ModuleInfo: Module: selfLexerTokens InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'abstractName' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals selfParser lexer tokens abstractName parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'abstractName' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: selfLexerTokens InitialContents: FollowSlot\x7fVisibility: public'
        
         condenseValueIfFail: fb = ( |
            | 
            source first isUpperCase ifTrue: [
              ^ illegalTokenReason: 'name tokens cannot be capitalized'
                FailBlock: fb
            ].
            resend.condenseValueIfFail: fb).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'abstractName' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: selfLexerTokens InitialContents: FollowSlot\x7fVisibility: public'
        
         isSelfAbstractName = bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'abstractName' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: selfLexerTokens InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'nameOrKeyword' -> 'parent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> () From: ( | {
         'Category: value is source\x7fCategory: operators\x7fModuleInfo: Module: selfLexerTokens InitialContents: FollowSlot\x7fVisibility: private'
        
         abstractOperator = bootstrap define: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'abstractOperator' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals selfParser lexer tokens tokenWithName copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'abstractOperator' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals selfParser lexer tokens abstractOperator.

CopyDowns:
globals selfParser lexer tokens tokenWithName. copy 
SlotsToOmit: parent.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'abstractOperator' -> () From: ( | {
         'ModuleInfo: Module: selfLexerTokens InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'abstractOperator' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals selfParser lexer tokens abstractOperator parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'abstractOperator' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: selfLexerTokens InitialContents: FollowSlot\x7fVisibility: public'
        
         isSelfOperator = bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'abstractOperator' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: selfLexerTokens InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'tokenWithName' -> 'parent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> () From: ( | {
         'Category: punctuation\x7fModuleInfo: Module: selfLexerTokens InitialContents: FollowSlot\x7fVisibility: public'
        
         accept = bootstrap define: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'accept' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'initialCharacterSet' From:
             bootstrap remove: 'initialCharacterSet:' From:
             bootstrap remove: 'parent' From:
             globals selfParser lexer tokens abstractSelfToken copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'accept' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals selfParser lexer tokens accept.

CopyDowns:
globals selfParser lexer tokens abstractSelfToken. copy 
SlotsToOmit: initialCharacterSet initialCharacterSet: parent.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'accept' -> () From: ( | {
         'Category: change these for types of tokens\x7fModuleInfo: Module: selfLexerTokens InitialContents: FollowSlot\x7fVisibility: public'
        
         initialCharacterSet = '\x0d
'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'accept' -> () From: ( | {
         'ModuleInfo: Module: selfLexerTokens InitialContents: InitializeToExpression: (false)\x7fVisibility: public'
        
         isMeaningful <- bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'accept' -> () From: ( | {
         'ModuleInfo: Module: selfLexerTokens InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'accept' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals selfParser lexer tokens accept parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'accept' -> 'parent' -> () From: ( | {
         'Category: creating\x7fModuleInfo: Module: selfLexerTokens InitialContents: FollowSlot\x7fVisibility: private'
        
         initForLexer: aLexer = ( |
            | 
            isMeaningful: aLexer doesNewlineEndExpression.
            resend.initForLexer: aLexer).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'accept' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: selfLexerTokens InitialContents: FollowSlot\x7fVisibility: public'
        
         isSelfAccept = bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'accept' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: selfLexerTokens InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'abstractSelfToken' -> 'parent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'accept' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: selfLexerTokens InitialContents: FollowSlot\x7fVisibility: public'
        
         statePrintString = ( |
            | 
            isMeaningful
             ifTrue: '`meaningfulAccept\''
              False: '`meaninglessAccept\'').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> () From: ( | {
         'Category: closings\x7fModuleInfo: Module: selfLexerTokens InitialContents: FollowSlot\x7fVisibility: private'
        
         closing = bootstrap define: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'closing' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals selfParser lexer tokens abstractSelfToken copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'closing' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals selfParser lexer tokens closing.

CopyDowns:
globals selfParser lexer tokens abstractSelfToken. copy 
SlotsToOmit: parent.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'closing' -> () From: ( | {
         'ModuleInfo: Module: selfLexerTokens InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'closing' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals selfParser lexer tokens closing parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'closing' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: selfLexerTokens InitialContents: FollowSlot\x7fVisibility: private'
        
         initForLexer: lxr = ( |
            | 
            lxr unnest.
            resend.initForLexer: lxr).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'closing' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: selfLexerTokens InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'abstractSelfToken' -> 'parent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> () From: ( | {
         'Category: closings\x7fModuleInfo: Module: selfLexerTokens InitialContents: FollowSlot\x7fVisibility: public'
        
         annotationEnd = bootstrap define: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'annotationEnd' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'initialCharacterSet' From:
             bootstrap remove: 'initialCharacterSet:' From:
             bootstrap remove: 'parent' From:
             globals selfParser lexer tokens closing copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'annotationEnd' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals selfParser lexer tokens annotationEnd.

CopyDowns:
globals selfParser lexer tokens closing. copy 
SlotsToOmit: initialCharacterSet initialCharacterSet: parent.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'annotationEnd' -> () From: ( | {
         'Category: change these for types of tokens\x7fModuleInfo: Module: selfLexerTokens InitialContents: FollowSlot\x7fVisibility: public'
        
         initialCharacterSet = '}' asCharacterSet.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'annotationEnd' -> () From: ( | {
         'ModuleInfo: Module: selfLexerTokens InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'annotationEnd' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals selfParser lexer tokens annotationEnd parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'annotationEnd' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: selfLexerTokens InitialContents: FollowSlot\x7fVisibility: public'
        
         isSelfAnnotationEnd = bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'annotationEnd' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: selfLexerTokens InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'closing' -> 'parent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> () From: ( | {
         'Category: openings\x7fModuleInfo: Module: selfLexerTokens InitialContents: FollowSlot\x7fVisibility: private'
        
         opening = bootstrap define: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'opening' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals selfParser lexer tokens abstractSelfToken copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'opening' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals selfParser lexer tokens opening.

CopyDowns:
globals selfParser lexer tokens abstractSelfToken. copy 
SlotsToOmit: parent.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'opening' -> () From: ( | {
         'Comment: annotationStart needs me to unnest\x7fModuleInfo: Module: selfLexerTokens InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         myLexer.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'opening' -> () From: ( | {
         'ModuleInfo: Module: selfLexerTokens InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'opening' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals selfParser lexer tokens opening parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'opening' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: selfLexerTokens InitialContents: FollowSlot\x7fVisibility: private'
        
         initForLexer: lxr = ( |
            | 
            lxr nest.
            myLexer: lxr.
            resend.initForLexer: lxr).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'opening' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: selfLexerTokens InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'abstractSelfToken' -> 'parent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> () From: ( | {
         'Category: openings\x7fModuleInfo: Module: selfLexerTokens InitialContents: FollowSlot\x7fVisibility: public'
        
         annotationStart = bootstrap define: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'annotationStart' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'initialCharacterSet' From:
             bootstrap remove: 'initialCharacterSet:' From:
             bootstrap remove: 'parent' From:
             globals selfParser lexer tokens opening copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'annotationStart' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals selfParser lexer tokens annotationStart.

CopyDowns:
globals selfParser lexer tokens opening. copy 
SlotsToOmit: initialCharacterSet initialCharacterSet: parent.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'annotationStart' -> () From: ( | {
         'Category: change these for types of tokens\x7fModuleInfo: Module: selfLexerTokens InitialContents: FollowSlot\x7fVisibility: public'
        
         initialCharacterSet = '{' asCharacterSet.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'annotationStart' -> () From: ( | {
         'ModuleInfo: Module: selfLexerTokens InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'annotationStart' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals selfParser lexer tokens annotationStart parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'annotationStart' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: selfLexerTokens InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'opening' -> 'parent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'annotationStart' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: selfLexerTokens InitialContents: FollowSlot\x7fVisibility: public'
        
         scanIfFail: fb = ( |
            | 
            in peekSecond = '}'  ifTrue: [
              in advance advance. "{}"
              myLexer unnest.
              ^ (lexer tokens objectAnnotation copyFrom: self)
                finishIfFail: fb
            ].
            resend.scanIfFail: fb).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> () From: ( | {
         'Category: value is source\x7fCategory: identifiers\x7fModuleInfo: Module: selfLexerTokens InitialContents: FollowSlot\x7fVisibility: public'
        
         argument = bootstrap define: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'argument' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'initialCharacterSet' From:
             bootstrap remove: 'initialCharacterSet:' From:
             bootstrap remove: 'parent' From:
             globals selfParser lexer tokens identifier copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'argument' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals selfParser lexer tokens argument.

CopyDowns:
globals selfParser lexer tokens identifier. copy 
SlotsToOmit: initialCharacterSet initialCharacterSet: parent.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'argument' -> () From: ( | {
         'Category: change these for types of tokens\x7fModuleInfo: Module: selfLexerTokens InitialContents: FollowSlot\x7fVisibility: public'
        
         initialCharacterSet = ':' asCharacterSet.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'argument' -> () From: ( | {
         'ModuleInfo: Module: selfLexerTokens InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'argument' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals selfParser lexer tokens argument parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'argument' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: selfLexerTokens InitialContents: FollowSlot\x7fVisibility: public'
        
         condenseValueIfFail: fb = ( |
            | 
            resend.condenseValueIfFail: [|:e| ^ fb value: e].
            value: value copyWithoutFirst. ":"
            value isEmpty ifTrue: [lexer tokens colon copyFrom: self]
                           False: [self]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'argument' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: selfLexerTokens InitialContents: FollowSlot\x7fVisibility: public'
        
         isSelfArgument = bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'argument' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: selfLexerTokens InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'identifier' -> 'parent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'argument' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: selfLexerTokens InitialContents: FollowSlot\x7fVisibility: private'
        
         scanLeadingCharacter = ( |
            | 
            in advance. "skip colon"
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'argument' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: selfLexerTokens InitialContents: FollowSlot\x7fVisibility: private'
        
         scanMiddleCharactersIfFail: fb = ( |
            | 
            in peek isUpperCase ifTrue: [
              in advance.
              ^ illegalTokenReason: 'arguments must be uncapitalized'
                FailBlock: fb
            ].
            resend.scanMiddleCharactersIfFail: fb).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'argument' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: selfLexerTokens InitialContents: FollowSlot\x7fVisibility: private'
        
         scanTrailingCharacterIfFail: fb = ( |
            | 
            in peek = ':'  ifTrue: [
              in advance. setEnd.
              ^ illegalTokenReason: 'colon cannot both start and end token'
                FailBlock: fb
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> () From: ( | {
         'Category: value is source\x7fCategory: operators\x7fModuleInfo: Module: selfLexerTokens InitialContents: FollowSlot\x7fVisibility: public'
        
         arrow = bootstrap define: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'arrow' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals selfParser lexer tokens abstractOperator copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'arrow' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals selfParser lexer tokens arrow.

CopyDowns:
globals selfParser lexer tokens abstractOperator. copy 
SlotsToOmit: parent.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'arrow' -> () From: ( | {
         'ModuleInfo: Module: selfLexerTokens InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'arrow' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals selfParser lexer tokens arrow parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'arrow' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: selfLexerTokens InitialContents: FollowSlot\x7fVisibility: public'
        
         isSelfSlotAssignment = bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'arrow' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: selfLexerTokens InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'abstractOperator' -> 'parent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> () From: ( | {
         'Category: punctuation\x7fModuleInfo: Module: selfLexerTokens InitialContents: FollowSlot\x7fVisibility: public'
        
         bar = bootstrap define: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'bar' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals selfParser lexer tokens abstractSelfToken copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'bar' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals selfParser lexer tokens bar.

CopyDowns:
globals selfParser lexer tokens abstractSelfToken. copy 
SlotsToOmit: parent.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'bar' -> () From: ( | {
         'ModuleInfo: Module: selfLexerTokens InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'bar' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals selfParser lexer tokens bar parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'bar' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: selfLexerTokens InitialContents: FollowSlot\x7fVisibility: public'
        
         isSelfSlotListDelimiter = bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'bar' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: selfLexerTokens InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'abstractSelfToken' -> 'parent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> () From: ( | {
         'Category: value is source\x7fCategory: identifiers\x7fCategory: keywords\x7fModuleInfo: Module: selfLexerTokens InitialContents: FollowSlot\x7fVisibility: public'
        
         capKeyword = bootstrap define: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'capKeyword' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals selfParser lexer tokens abstractKeyword copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'capKeyword' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals selfParser lexer tokens capKeyword.

CopyDowns:
globals selfParser lexer tokens abstractKeyword. copy 
SlotsToOmit: parent.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'capKeyword' -> () From: ( | {
         'ModuleInfo: Module: selfLexerTokens InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'capKeyword' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals selfParser lexer tokens capKeyword parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'capKeyword' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: selfLexerTokens InitialContents: FollowSlot\x7fVisibility: public'
        
         isSelfCapKeyword = bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'capKeyword' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: selfLexerTokens InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'abstractKeyword' -> 'parent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> () From: ( | {
         'Category: closings\x7fModuleInfo: Module: selfLexerTokens InitialContents: FollowSlot\x7fVisibility: public'
        
         closeParen = bootstrap define: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'closeParen' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'initialCharacterSet' From:
             bootstrap remove: 'initialCharacterSet:' From:
             bootstrap remove: 'parent' From:
             globals selfParser lexer tokens closing copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'closeParen' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals selfParser lexer tokens closeParen.

CopyDowns:
globals selfParser lexer tokens closing. copy 
SlotsToOmit: initialCharacterSet initialCharacterSet: parent.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'closeParen' -> () From: ( | {
         'Category: change these for types of tokens\x7fModuleInfo: Module: selfLexerTokens InitialContents: FollowSlot\x7fVisibility: public'
        
         initialCharacterSet = ')' asCharacterSet.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'closeParen' -> () From: ( | {
         'ModuleInfo: Module: selfLexerTokens InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'closeParen' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals selfParser lexer tokens closeParen parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'closeParen' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: selfLexerTokens InitialContents: FollowSlot\x7fVisibility: public'
        
         isSelfObjectClose = bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'closeParen' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: selfLexerTokens InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'closing' -> 'parent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> () From: ( | {
         'Category: closings\x7fModuleInfo: Module: selfLexerTokens InitialContents: FollowSlot\x7fVisibility: public'
        
         closeSquare = bootstrap define: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'closeSquare' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'initialCharacterSet' From:
             bootstrap remove: 'initialCharacterSet:' From:
             bootstrap remove: 'parent' From:
             globals selfParser lexer tokens closing copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'closeSquare' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals selfParser lexer tokens closeSquare.

CopyDowns:
globals selfParser lexer tokens closing. copy 
SlotsToOmit: initialCharacterSet initialCharacterSet: parent.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'closeSquare' -> () From: ( | {
         'Category: change these for types of tokens\x7fModuleInfo: Module: selfLexerTokens InitialContents: FollowSlot\x7fVisibility: public'
        
         initialCharacterSet = ']' asCharacterSet.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'closeSquare' -> () From: ( | {
         'ModuleInfo: Module: selfLexerTokens InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'closeSquare' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals selfParser lexer tokens closeSquare parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'closeSquare' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: selfLexerTokens InitialContents: FollowSlot\x7fVisibility: public'
        
         isSelfBlockClose = bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'closeSquare' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: selfLexerTokens InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'closing' -> 'parent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> () From: ( | {
         'Category: punctuation\x7fModuleInfo: Module: selfLexerTokens InitialContents: FollowSlot\x7fVisibility: public'
        
         colon = bootstrap define: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'colon' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals selfParser lexer tokens abstractSelfToken copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'colon' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals selfParser lexer tokens colon.

CopyDowns:
globals selfParser lexer tokens abstractSelfToken. copy 
SlotsToOmit: parent.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'colon' -> () From: ( | {
         'ModuleInfo: Module: selfLexerTokens InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'colon' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals selfParser lexer tokens colon parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'colon' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: selfLexerTokens InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'abstractSelfToken' -> 'parent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> () From: ( | {
         'ModuleInfo: Module: selfLexerTokens InitialContents: FollowSlot\x7fVisibility: public'
        
         comment = bootstrap define: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'comment' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'initialCharacterSet' From:
             bootstrap remove: 'parent' From:
             globals selfParser lexer tokens abstractSelfToken copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'comment' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals selfParser lexer tokens comment.

CopyDowns:
globals selfParser lexer tokens abstractSelfToken. copy 
SlotsToOmit: initialCharacterSet parent.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'comment' -> () From: ( | {
         'Category: change these for types of tokens\x7fModuleInfo: Module: selfLexerTokens InitialContents: InitializeToExpression: (\'\"\' asCharacterSet)\x7fVisibility: public'
        
         initialCharacterSet <- '"' asCharacterSet.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'comment' -> () From: ( | {
         'ModuleInfo: Module: selfLexerTokens InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'comment' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals selfParser lexer tokens comment parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'comment' -> 'parent' -> () From: ( | {
         'Category: scanning\x7fModuleInfo: Module: selfLexerTokens InitialContents: FollowSlot\x7fVisibility: private'
        
         advancePastMeIfFail: fb = ( |
            | 
            value: list copyRemoveAll.
            in advance. "eat \""
            [|c|
              c: in nextIfEOF: [
                ^ illegalTokenReason: 'EOF in middle of comment' FailBlock: fb
              ].
              c = '"'  ifTrue: [^ self].
              c = '\\' ifTrue: [value addLast: in next "skip escaped character"]
                        False: [value addLast: c].
            ] loop).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'comment' -> 'parent' -> () From: ( | {
         'Category: category\x7fModuleInfo: Module: selfLexerTokens InitialContents: FollowSlot\x7fVisibility: public'
        
         condenseValueIfFail: fb = ( |
            | 
            value: value asString).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'comment' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: selfLexerTokens InitialContents: FollowSlot\x7fVisibility: public'
        
         isComment = bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'comment' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: selfLexerTokens InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'abstractSelfToken' -> 'parent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'comment' -> 'parent' -> () From: ( | {
         'Category: attic\x7fModuleInfo: Module: selfLexerTokens InitialContents: FollowSlot\x7fVisibility: public'
        
         xxxcondenseValueIfFail: fb = ( |
             body.
            | 
            "rm open, close quotes"
            body: source copyWithoutFirst copyWithoutLast.
            body: body shrinkwrap. "rm blanks"
               ('***' isPrefixOf: body)
            && [['***' isSuffixOf: body]
            && [body size >= 6]]
             ifTrue: [
              body: copyStartingAt: 3. "trim prefix"
              body: copySize: size - 3. "trim suffix"
            ].
            resend.condenseValueIfFail: fb).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'comment' -> () From: ( | {
         'ModuleInfo: Module: selfLexerTokens InitialContents: InitializeToExpression: (\'\')\x7fVisibility: public'
        
         value <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> () From: ( | {
         'Category: value is source\x7fCategory: identifiers\x7fCategory: names\x7fModuleInfo: Module: selfLexerTokens InitialContents: FollowSlot\x7fVisibility: public'
        
         delegatee = bootstrap define: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'delegatee' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals selfParser lexer tokens abstractName copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'delegatee' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals selfParser lexer tokens delegatee.

CopyDowns:
globals selfParser lexer tokens abstractName. copy 
SlotsToOmit: parent.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'delegatee' -> () From: ( | {
         'ModuleInfo: Module: selfLexerTokens InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'delegatee' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals selfParser lexer tokens delegatee parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'delegatee' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: selfLexerTokens InitialContents: FollowSlot\x7fVisibility: public'
        
         condenseValueIfFail: fb = ( |
            | 
            resend.condenseValueIfFail: fb.
            value: value copyWithoutLast. "do not include dot in value"
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'delegatee' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: selfLexerTokens InitialContents: FollowSlot\x7fVisibility: public'
        
         isSelfDelegatee = bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'delegatee' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: selfLexerTokens InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'abstractName' -> 'parent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> () From: ( | {
         'ModuleInfo: Module: selfLexerTokens InitialContents: FollowSlot\x7fVisibility: public'
        
         dot = bootstrap define: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'dot' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'initialCharacterSet' From:
             bootstrap remove: 'initialCharacterSet:' From:
             bootstrap remove: 'parent' From:
             globals selfParser lexer tokens abstractSelfToken copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'dot' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals selfParser lexer tokens dot.

CopyDowns:
globals selfParser lexer tokens abstractSelfToken. copy 
SlotsToOmit: initialCharacterSet initialCharacterSet: parent.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'dot' -> () From: ( | {
         'Category: change these for types of tokens\x7fModuleInfo: Module: selfLexerTokens InitialContents: FollowSlot\x7fVisibility: public'
        
         initialCharacterSet = '.' asCharacterSet.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'dot' -> () From: ( | {
         'ModuleInfo: Module: selfLexerTokens InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'dot' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals selfParser lexer tokens dot parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'dot' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: selfLexerTokens InitialContents: FollowSlot\x7fVisibility: public'
        
         isSelfSlotSeparator = bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'dot' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: selfLexerTokens InitialContents: FollowSlot\x7fVisibility: public'
        
         isSelfStatementSeparator = bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'dot' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: selfLexerTokens InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'abstractSelfToken' -> 'parent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'dot' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: selfLexerTokens InitialContents: FollowSlot\x7fVisibility: public'
        
         scanIfFail: fb = ( |
            | 
            in peekSecond isDigit ifTrue: [
              in advance advance.
              ^  illegalTokenReason: 'Floats must have a digit before the decimal point'
                          FailBlock: fb
            ].
            resend.scanIfFail: fb).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> () From: ( | {
         'Category: value is source\x7fCategory: operators\x7fModuleInfo: Module: selfLexerTokens InitialContents: FollowSlot\x7fVisibility: public'
        
         equals = bootstrap define: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'equals' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals selfParser lexer tokens abstractOperator copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'equals' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals selfParser lexer tokens equals.

CopyDowns:
globals selfParser lexer tokens abstractOperator. copy 
SlotsToOmit: parent.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'equals' -> () From: ( | {
         'ModuleInfo: Module: selfLexerTokens InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'equals' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals selfParser lexer tokens equals parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'equals' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: selfLexerTokens InitialContents: FollowSlot\x7fVisibility: public'
        
         isSelfConstantSlotAssignment = bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'equals' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: selfLexerTokens InitialContents: FollowSlot\x7fVisibility: public'
        
         isSelfSlotAssignment = bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'equals' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: selfLexerTokens InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'abstractOperator' -> 'parent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> () From: ( | {
         'ModuleInfo: Module: selfLexerTokens InitialContents: FollowSlot\x7fVisibility: public'
        
         escapedNewLine = bootstrap define: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'escapedNewLine' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals selfParser lexer tokens abstractSelfToken copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'escapedNewLine' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals selfParser lexer tokens escapedNewLine.

CopyDowns:
globals selfParser lexer tokens abstractSelfToken. copy 
SlotsToOmit: parent.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'escapedNewLine' -> () From: ( | {
         'ModuleInfo: Module: selfLexerTokens InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'escapedNewLine' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals selfParser lexer tokens escapedNewLine parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'escapedNewLine' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: selfLexerTokens InitialContents: FollowSlot\x7fVisibility: public'
        
         isMeaningful = bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'escapedNewLine' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: selfLexerTokens InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'abstractSelfToken' -> 'parent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> () From: ( | {
         'Category: constants\x7fModuleInfo: Module: selfLexerTokens InitialContents: FollowSlot\x7fVisibility: public'
        
         float = bootstrap define: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'float' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals selfParser lexer tokens abstractSelfToken copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'float' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals selfParser lexer tokens float.

CopyDowns:
globals selfParser lexer tokens abstractSelfToken. copy 
SlotsToOmit: parent.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'float' -> () From: ( | {
         'ModuleInfo: Module: selfLexerTokens InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'float' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals selfParser lexer tokens float parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'float' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: selfLexerTokens InitialContents: FollowSlot\x7fVisibility: public'
        
         argumentCountAsSlotContents = 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'float' -> 'parent' -> () From: ( | {
         'Comment: Called when the last character has been found.
(Input stream points to first character AFTER
this token.)
My job is to boil down the input characters of this
token as need be.
For instance, for an integer, I would calculate the
integer value from the characters.\x7fModuleInfo: Module: selfLexerTokens InitialContents: FollowSlot\x7fVisibility: public'
        
         condenseValueIfFail: fb = ( |
            | 
            condenseValueUsingSelfIfFail: fb).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'float' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: selfLexerTokens InitialContents: FollowSlot\x7fVisibility: public'
        
         copyFrom: aTok = ( |
            | 
            (resend.copyFrom: aTok) value: aTok value).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'float' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: selfLexerTokens InitialContents: FollowSlot\x7fVisibility: public'
        
         isSelfConstant = bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'float' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: selfLexerTokens InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'abstractSelfToken' -> 'parent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'float' -> () From: ( | {
         'ModuleInfo: Module: selfLexerTokens InitialContents: InitializeToExpression: (0)\x7fVisibility: public'
        
         value <- 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> () From: ( | {
         'Category: punctuation\x7fModuleInfo: Module: selfLexerTokens InitialContents: FollowSlot\x7fVisibility: public'
        
         hat = bootstrap define: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'hat' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals selfParser lexer tokens abstractSelfToken copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'hat' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals selfParser lexer tokens hat.

CopyDowns:
globals selfParser lexer tokens abstractSelfToken. copy 
SlotsToOmit: parent.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'hat' -> () From: ( | {
         'ModuleInfo: Module: selfLexerTokens InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'hat' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals selfParser lexer tokens hat parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'hat' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: selfLexerTokens InitialContents: FollowSlot\x7fVisibility: public'
        
         isSelfReturnToken = bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'hat' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: selfLexerTokens InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'abstractSelfToken' -> 'parent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> () From: ( | {
         'ModuleInfo: Module: selfLexerTokens InitialContents: FollowSlot\x7fVisibility: public'
        
         implicitSelf = bootstrap define: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'implicitSelf' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals selfParser lexer tokens abstractSelfToken copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'implicitSelf' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals selfParser lexer tokens implicitSelf.

CopyDowns:
globals selfParser lexer tokens abstractSelfToken. copy 
SlotsToOmit: parent.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'implicitSelf' -> () From: ( | {
         'ModuleInfo: Module: selfLexerTokens InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'implicitSelf' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals selfParser lexer tokens implicitSelf parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'implicitSelf' -> 'parent' -> () From: ( | {
         'Category: copying\x7fModuleInfo: Module: selfLexerTokens InitialContents: FollowSlot\x7fVisibility: public'
        
         copyForFirstSelectorNode: selTok = ( |
             st.
            | 
            st: selTok extent start.
            (copyFrom: selTok) extent: st to: st).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'implicitSelf' -> 'parent' -> () From: ( | {
         'Category: testing\x7fModuleInfo: Module: selfLexerTokens InitialContents: FollowSlot\x7fVisibility: public'
        
         isSelfImplicitSelf = bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'implicitSelf' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: selfLexerTokens InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'abstractSelfToken' -> 'parent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'implicitSelf' -> 'parent' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: selfLexerTokens InitialContents: FollowSlot\x7fVisibility: public'
        
         source = ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'implicitSelf' -> 'parent' -> () From: ( | {
         'Category: printing\x7fModuleInfo: Module: selfLexerTokens InitialContents: FollowSlot\x7fVisibility: public'
        
         statePrintString = '<implicitSelf>'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> () From: ( | {
         'Category: constants\x7fModuleInfo: Module: selfLexerTokens InitialContents: FollowSlot\x7fVisibility: public'
        
         integer = bootstrap define: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'integer' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals selfParser lexer tokens abstractSelfToken copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'integer' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals selfParser lexer tokens integer.

CopyDowns:
globals selfParser lexer tokens abstractSelfToken. copy 
SlotsToOmit: parent.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'integer' -> () From: ( | {
         'ModuleInfo: Module: selfLexerTokens InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'integer' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals selfParser lexer tokens integer parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'integer' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: selfLexerTokens InitialContents: FollowSlot\x7fVisibility: public'
        
         argumentCountAsSlotContents = 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'integer' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: selfLexerTokens InitialContents: FollowSlot\x7fVisibility: public'
        
         condenseValueIfFail: fb = ( |
            | 
            condenseValueUsingSelfIfFail: fb).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'integer' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: selfLexerTokens InitialContents: FollowSlot\x7fVisibility: public'
        
         copyFrom: aTok = ( |
            | 
            (resend.copyFrom: aTok) value: aTok value).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'integer' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: selfLexerTokens InitialContents: FollowSlot\x7fVisibility: public'
        
         isSelfConstant = bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'integer' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: selfLexerTokens InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'abstractSelfToken' -> 'parent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'integer' -> () From: ( | {
         'ModuleInfo: Module: selfLexerTokens InitialContents: InitializeToExpression: (0)'
        
         value <- 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> () From: ( | {
         'Category: value is source\x7fCategory: identifiers\x7fCategory: keywords\x7fModuleInfo: Module: selfLexerTokens InitialContents: FollowSlot\x7fVisibility: public'
        
         keyword = bootstrap define: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'keyword' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals selfParser lexer tokens abstractKeyword copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'keyword' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals selfParser lexer tokens keyword.

CopyDowns:
globals selfParser lexer tokens abstractKeyword. copy 
SlotsToOmit: parent.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'keyword' -> () From: ( | {
         'ModuleInfo: Module: selfLexerTokens InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'keyword' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals selfParser lexer tokens keyword parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'keyword' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: selfLexerTokens InitialContents: FollowSlot\x7fVisibility: public'
        
         isSelfFirstKeyword = bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'keyword' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: selfLexerTokens InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'abstractKeyword' -> 'parent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> () From: ( | {
         'Category: value is source\x7fCategory: identifiers\x7fCategory: names\x7fModuleInfo: Module: selfLexerTokens InitialContents: FollowSlot\x7fVisibility: public'
        
         name = bootstrap define: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'name' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'initialCharacterSet' From:
             bootstrap remove: 'initialCharacterSet:' From:
             bootstrap remove: 'parent' From:
             globals selfParser lexer tokens abstractName copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'name' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals selfParser lexer tokens name.

CopyDowns:
globals selfParser lexer tokens abstractName. copy 
SlotsToOmit: initialCharacterSet initialCharacterSet: parent.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'name' -> () From: ( | {
         'Category: change these for types of tokens\x7fModuleInfo: Module: selfLexerTokens InitialContents: FollowSlot\x7fVisibility: public'
        
         initialCharacterSet = bootstrap stub -> 'globals' -> 'parseKit' -> 'characterSets' -> 'letters' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'name' -> () From: ( | {
         'ModuleInfo: Module: selfLexerTokens InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'name' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals selfParser lexer tokens name parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'name' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: selfLexerTokens InitialContents: FollowSlot\x7fVisibility: private'
        
         beResendIfFail: fb = ( |
            | 
            lexer tokens resendToken copyFrom: self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'name' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: selfLexerTokens InitialContents: FollowSlot\x7fVisibility: private'
        
         beSelfIfFail: fb = ( |
            | 
            lexer tokens receiver copyFrom: self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'name' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: selfLexerTokens InitialContents: FollowSlot\x7fVisibility: public'
        
         isSelfSimpleName = bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'name' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: selfLexerTokens InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'abstractName' -> 'parent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> () From: ( | {
         'Category: constants\x7fModuleInfo: Module: selfLexerTokens InitialContents: FollowSlot\x7fVisibility: private'
        
         number = bootstrap define: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'number' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'initialCharacterSet' From:
             bootstrap remove: 'initialCharacterSet:' From:
             bootstrap remove: 'parent' From:
             globals selfParser lexer tokens abstractSelfToken copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'number' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals selfParser lexer tokens number.

CopyDowns:
globals selfParser lexer tokens abstractSelfToken. copy 
SlotsToOmit: initialCharacterSet initialCharacterSet: parent.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'number' -> () From: ( | {
         'Category: change these for types of tokens\x7fModuleInfo: Module: selfLexerTokens InitialContents: FollowSlot\x7fVisibility: public'
        
         initialCharacterSet = bootstrap stub -> 'globals' -> 'parseKit' -> 'characterSets' -> 'digits' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'number' -> () From: ( | {
         'ModuleInfo: Module: selfLexerTokens InitialContents: InitializeToExpression: (false)\x7fVisibility: private'
        
         isFloat <- bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'number' -> () From: ( | {
         'ModuleInfo: Module: selfLexerTokens InitialContents: InitializeToExpression: (false)\x7fVisibility: private'
        
         isNegative <- bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'number' -> () From: ( | {
         'ModuleInfo: Module: selfLexerTokens InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'number' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals selfParser lexer tokens number parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'number' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: selfLexerTokens InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'abstractSelfToken' -> 'parent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'number' -> 'parent' -> () From: ( | {
         'Category: scanning\x7fModuleInfo: Module: selfLexerTokens InitialContents: FollowSlot\x7fVisibility: private'
        
         rejectCNumbersIfFail: fb = ( |
             err <- ''.
            | 
            err: case
              if:   [ in peek != '0' ]
              Then: ''
              If:   [ in peekSecond uncapitalize == 'x' ] 
              Then: 'invalid numeric constant (use 16r...)'
              If:   [ characterSets digits includes: in peekSecond]
              Then: 'C-style octals are not supported (use 8r...)'
              Else: ''.

            err isEmpty ifTrue: [^ self].
            in advance advance.
            illegalTokenReason: err FailBlock: fb).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'number' -> 'parent' -> () From: ( | {
         'Category: scanning\x7fModuleInfo: Module: selfLexerTokens InitialContents: FollowSlot\x7fVisibility: private'
        
         scanBase: b IsNegative: isN IfFail: fb = ( |
             foundOne <- bootstrap stub -> 'globals' -> 'false' -> ().
             i <- 0.
             lowLimit.
            | 
            (2 <= b) && [b <= 36]  ifFalse: [
              ^ illegalTokenReason: 'base must be between 2 and 36' FailBlock: fb
            ].
            lowLimit: selfIntLimit / b.
            [|:exit. c. d|
              c: in peekIfEOF: exit.
              d: case
                if: [ c isDigit  ]  Then: [c asByte - '0' asByte]
                If: [ c isLetter ]  Then: [(c uncapitalize asByte - 'a' asByte) + 10]
                Else: exit.
              d >= b  ifTrue: exit.
              foundOne: true.
                  ( isNegative not  &&  [ i >= lowLimit ] )
              ||  [ isNegative      &&  [ i >  lowLimit ] ]
               ifTrue: [
                ^ illegalTokenReason: 'numeric constant too large' FailBlock: fb
              ].
              i: (b * i) + d.
              in advance
            ] loopExit.
            foundOne ifTrue: i False: -1).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'number' -> 'parent' -> () From: ( | {
         'Category: scanning\x7fModuleInfo: Module: selfLexerTokens InitialContents: FollowSlot\x7fVisibility: private'
        
         scanDecimalPointAndFraction = ( |
            | 
            (in peek = '.')
            && [ in peekSecond isDigit ]  ifTrue: [
              in advance. "."
              isFloat: true.
              value: value asFloat + scanFraction
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'number' -> 'parent' -> () From: ( | {
         'Category: scanning\x7fModuleInfo: Module: selfLexerTokens InitialContents: FollowSlot\x7fVisibility: private'
        
         scanExponentIfFail: fb = ( |
             exp.
             expSign <- 1.
            | 
            in peek uncapitalize = 'e' ifFalse: [^ self].
            in advance. "e"
            isFloat: true.
            case if: [ in peek = '+' ] Then: [ in advance ]
                 If: [ in peek = '-' ] Then: [ in advance. expSign: -1 ].
            exp: scanBase: 10 IsNegative: expSign = -1 IfFail: [|:e| ^ fb value: e].
            (exp = '-1') || [in peek isLetter]  ifTrue: [
              ^ illegalTokenReason: 'illegal exponent' FailBlock: fb
            ].
            value: value asFloat * (10 power: (exp * expSign))).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'number' -> 'parent' -> () From: ( | {
         'Category: scanning\x7fModuleInfo: Module: selfLexerTokens InitialContents: FollowSlot\x7fVisibility: private'
        
         scanFraction = ( |
             f <- 0.0.
             q <- 0.1.
            | 
            [|:exit. c|
              c: in peek.
              c isDigit ifFalse: exit.
              f: f + ((c asByte - '0' asByte) * q).
              q: q / 10.0.
              in advance.
            ] loopExit.
            f).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'number' -> 'parent' -> () From: ( | {
         'Category: scanning\x7fModuleInfo: Module: selfLexerTokens InitialContents: FollowSlot\x7fVisibility: public'
        
         scanIfFail: fb = ( |
             i.
            | 
            setIsNegative.
            rejectCNumbersIfFail: [|:e| ^ fb value: e].

            i:   scanBase: 10
               IsNegative: false
                   IfFail: [|:e| ^ fb value: e].

            in peek uncapitalize = 'r'
              ifTrue: [ scanRadixNumber:   i IfFail: [|:e| ^ fb value: e]]
               False: [ scanPutativeFloat: i IfFail: [|:e| ^ fb value: e]].

            isNegative ifTrue: [
              isFloat ifTrue: [value: value negate asFloat]
                       False: [value: value negate asInteger]
            ].
            setEnd.
            (isFloat ifTrue: [lexer tokens float] False: [lexer tokens integer])
              copyFrom: self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'number' -> 'parent' -> () From: ( | {
         'Category: scanning\x7fModuleInfo: Module: selfLexerTokens InitialContents: FollowSlot\x7fVisibility: private'
        
         scanPutativeFloat: i IfFail: fb = ( |
            | 
            in peek isLetter
            && [in peek uncapitalize != 'e']
             ifTrue: [
              ^ illegalTokenReason: 'need spaces between numeric literals and selectors'
                FailBlock: fb
            ].
            value: i == -1 ifTrue: "no int part:" 0 False: i.
            scanDecimalPointAndFraction.
            scanExponentIfFail: fb).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'number' -> 'parent' -> () From: ( | {
         'Category: scanning\x7fModuleInfo: Module: selfLexerTokens InitialContents: FollowSlot\x7fVisibility: private'
        
         scanRadixNumber: base IfFail: fb = ( |
             err.
             i.
            | 
            in advance. "skip r"
            i:   scanBase: base
               IsNegative: isNegative
                   IfFail: [|:e| ^ fb value: e].
            i >= 0  ifTrue: [ ^ value: i ]. "found a digit"
            err: case
              if: [in peek isDigit ]  Then: [in advance.  'digit too large for given base']
              If: [in peek isLetter]  Then: [in advance. 'letter too large for given base']
                                      Else: 'expecting a number after the base specifier'.
            illegalTokenReason: err FailBlock: fb).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'number' -> 'parent' -> () From: ( | {
         'Category: scanning\x7fModuleInfo: Module: selfLexerTokens InitialContents: FollowSlot\x7fVisibility: private'
        
         selfIntLimit = bootstrap setObjectAnnotationOf: ( '1073741824' asInteger) From: ( |
             {} = 'Comment: A bigInt is represented using a smallInt for the sign (-1, 0, 1  if 
       the bigInt is respectively negative, zero, positive), and a \'list\' of
       \'digits\'. Each digit is an integer. The range of these integers is
       0..base-1, where base is defined in traits bigInt.
       The bigInt zero has an empty list of digits. 
       Changed representation to use a byte vector instead of a list for
       the digits. Ole, 5/21/93.\x7fModuleInfo: Creator: globals selfParser lexer tokens number parent selfIntLimit.
\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'number' -> 'parent' -> () From: ( | {
         'Category: scanning\x7fModuleInfo: Module: selfLexerTokens InitialContents: FollowSlot\x7fVisibility: private'
        
         setIsNegative = ( |
            | 
            in peek = '-' ifTrue: [
              isNegative: true.
              in advance. '-'
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'number' -> () From: ( | {
         'ModuleInfo: Module: selfLexerTokens InitialContents: InitializeToExpression: (0)\x7fVisibility: private'
        
         value <- 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> () From: ( | {
         'ModuleInfo: Module: selfLexerTokens InitialContents: FollowSlot\x7fVisibility: public'
        
         objectAnnotation = bootstrap define: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'objectAnnotation' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals selfParser lexer tokens abstractSelfToken copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'objectAnnotation' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals selfParser lexer tokens objectAnnotation.

CopyDowns:
globals selfParser lexer tokens abstractSelfToken. copy 
SlotsToOmit: parent.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'objectAnnotation' -> () From: ( | {
         'ModuleInfo: Module: selfLexerTokens InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'objectAnnotation' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals selfParser lexer tokens objectAnnotation parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'objectAnnotation' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: selfLexerTokens InitialContents: FollowSlot\x7fVisibility: private'
        
         advancePastMeIfFail: fb = ( |
            | 
            in advance. "{"
            in advance. "}"
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'objectAnnotation' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: selfLexerTokens InitialContents: FollowSlot\x7fVisibility: public'
        
         isSelfObjectAnnotation = bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'objectAnnotation' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: selfLexerTokens InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'abstractSelfToken' -> 'parent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> () From: ( | {
         'Category: openings\x7fModuleInfo: Module: selfLexerTokens InitialContents: FollowSlot\x7fVisibility: public'
        
         openParen = bootstrap define: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'openParen' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'initialCharacterSet' From:
             bootstrap remove: 'initialCharacterSet:' From:
             bootstrap remove: 'parent' From:
             globals selfParser lexer tokens opening copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'openParen' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals selfParser lexer tokens openParen.

CopyDowns:
globals selfParser lexer tokens opening. copy 
SlotsToOmit: initialCharacterSet initialCharacterSet: parent.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'openParen' -> () From: ( | {
         'Category: change these for types of tokens\x7fModuleInfo: Module: selfLexerTokens InitialContents: FollowSlot\x7fVisibility: public'
        
         initialCharacterSet = '(' asCharacterSet.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'openParen' -> () From: ( | {
         'ModuleInfo: Module: selfLexerTokens InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'openParen' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals selfParser lexer tokens openParen parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'openParen' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: selfLexerTokens InitialContents: FollowSlot\x7fVisibility: public'
        
         isSelfOpenParen = bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'openParen' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: selfLexerTokens InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'opening' -> 'parent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> () From: ( | {
         'Category: openings\x7fModuleInfo: Module: selfLexerTokens InitialContents: FollowSlot\x7fVisibility: public'
        
         openSquare = bootstrap define: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'openSquare' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'initialCharacterSet' From:
             bootstrap remove: 'initialCharacterSet:' From:
             bootstrap remove: 'parent' From:
             globals selfParser lexer tokens opening copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'openSquare' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals selfParser lexer tokens openSquare.

CopyDowns:
globals selfParser lexer tokens opening. copy 
SlotsToOmit: initialCharacterSet initialCharacterSet: parent.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'openSquare' -> () From: ( | {
         'Category: change these for types of tokens\x7fModuleInfo: Module: selfLexerTokens InitialContents: FollowSlot\x7fVisibility: public'
        
         initialCharacterSet = '[' asCharacterSet.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'openSquare' -> () From: ( | {
         'ModuleInfo: Module: selfLexerTokens InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'openSquare' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals selfParser lexer tokens openSquare parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'openSquare' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: selfLexerTokens InitialContents: FollowSlot\x7fVisibility: public'
        
         isSelfOpenSquare = bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'openSquare' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: selfLexerTokens InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'opening' -> 'parent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> () From: ( | {
         'Category: value is source\x7fCategory: operators\x7fModuleInfo: Module: selfLexerTokens InitialContents: FollowSlot\x7fVisibility: public'
        
         operator = bootstrap define: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'operator' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'initialCharacterSet' From:
             bootstrap remove: 'parent' From:
             globals selfParser lexer tokens abstractOperator copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'operator' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals selfParser lexer tokens operator.

CopyDowns:
globals selfParser lexer tokens abstractOperator. copy 
SlotsToOmit: initialCharacterSet parent.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'operator' -> () From: ( | {
         'Category: change these for types of tokens\x7fModuleInfo: Module: selfLexerTokens InitialContents: FollowSlot\x7fVisibility: public'
        
         initialCharacterSet = ( |
            | characterSets punctuation).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'operator' -> () From: ( | {
         'ModuleInfo: Module: selfLexerTokens InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'operator' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals selfParser lexer tokens operator parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'operator' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: selfLexerTokens InitialContents: FollowSlot\x7fVisibility: private'
        
         condenseValueIfFail: fb = ( |
             s.
            | 
            resend.condenseValueIfFail: [|:e| ^ fb value: e].
            s: value.
            ( case
              if: [s = '='  ] Then: [lexer tokens equals]
              If: [s = '<-' ] Then: [lexer tokens arrow]
              If: [s = '|'  ] Then: [lexer tokens bar]
              If: [s = '^'  ] Then: [lexer tokens hat]
              If: [s = '*'  ] Then: [lexer tokens star]
              If: [(s = '\\')  && ['\r\n' includes: in peek]] 
              Then: [in advance. setEnd. lexer tokens escapedNewLine]
              Else: [ ^ self]
            ) copyFrom: self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'operator' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: selfLexerTokens InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'abstractOperator' -> 'parent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'operator' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: selfLexerTokens InitialContents: FollowSlot\x7fVisibility: private'
        
         preceedingMinusNumberCharacters = ((' 	\f' asCharacterSet) + ('\x00' asCharacterSet)) + ('(' asCharacterSet).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'operator' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: selfLexerTokens InitialContents: FollowSlot\x7fVisibility: public'
        
         scanIfFail: fb = ( |
            | 
                (in peek = '-')
            &&  [in peekSecond isDigit
            &&  [preceedingMinusNumberCharacters includes:  in previous]]  ifTrue: [
              "ensure that x-1 does not parse to a negative number"
              ^ (lexer tokens number copyFrom: self) scanIfFail: fb
            ].
            in advance.
            [characterSets punctuation includes: in peek]
             whileTrue: [in advance].
            finishIfFail: fb).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> () From: ( | {
         'ModuleInfo: Module: selfLexerTokens InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'globals' -> 'parseKit' -> 'lexer' -> 'tokens' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> () From: ( | {
         'Category: value is source\x7fCategory: identifiers\x7fCategory: keywords\x7fModuleInfo: Module: selfLexerTokens InitialContents: FollowSlot\x7fVisibility: public'
        
         primKeyword = bootstrap define: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'primKeyword' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals selfParser lexer tokens abstractKeyword copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'primKeyword' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals selfParser lexer tokens primKeyword.

CopyDowns:
globals selfParser lexer tokens abstractKeyword. copy 
SlotsToOmit: parent.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'primKeyword' -> () From: ( | {
         'ModuleInfo: Module: selfLexerTokens InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'primKeyword' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals selfParser lexer tokens primKeyword parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'primKeyword' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: selfLexerTokens InitialContents: FollowSlot\x7fVisibility: public'
        
         isSelfFirstKeyword = bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'primKeyword' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: selfLexerTokens InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'abstractKeyword' -> 'parent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> () From: ( | {
         'Category: value is source\x7fCategory: identifiers\x7fCategory: names\x7fModuleInfo: Module: selfLexerTokens InitialContents: FollowSlot\x7fVisibility: public'
        
         primName = bootstrap define: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'primName' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'initialCharacterSet' From:
             bootstrap remove: 'initialCharacterSet:' From:
             bootstrap remove: 'parent' From:
             globals selfParser lexer tokens abstractName copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'primName' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals selfParser lexer tokens primName.

CopyDowns:
globals selfParser lexer tokens abstractName. copy 
SlotsToOmit: initialCharacterSet initialCharacterSet: parent.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'primName' -> () From: ( | {
         'Category: change these for types of tokens\x7fModuleInfo: Module: selfLexerTokens InitialContents: FollowSlot\x7fVisibility: public'
        
         initialCharacterSet = '_' asCharacterSet.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'primName' -> () From: ( | {
         'ModuleInfo: Module: selfLexerTokens InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'primName' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals selfParser lexer tokens primName parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'primName' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: selfLexerTokens InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'abstractName' -> 'parent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'primName' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: selfLexerTokens InitialContents: FollowSlot\x7fVisibility: private'
        
         scanTrailingCharacterIfFail: fb = ( |
            | 
            setEnd.
            source size == 1  ifTrue: [
              ^ illegalTokenReason: 'missing rest of primitive name' FailBlock: fb
            ].
            resend.scanTrailingCharacterIfFail: fb).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> () From: ( | {
         'ModuleInfo: Module: selfLexerTokens InitialContents: FollowSlot\x7fVisibility: public'
        
         receiver = bootstrap define: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'receiver' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals selfParser lexer tokens abstractSelfToken copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'receiver' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals selfParser lexer tokens receiver.

CopyDowns:
globals selfParser lexer tokens abstractSelfToken. copy 
SlotsToOmit: parent.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'receiver' -> () From: ( | {
         'ModuleInfo: Module: selfLexerTokens InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'receiver' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals selfParser lexer tokens receiver parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'receiver' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: selfLexerTokens InitialContents: FollowSlot\x7fVisibility: public'
        
         isSelfReceiver = bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'receiver' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: selfLexerTokens InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'abstractSelfToken' -> 'parent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> () From: ( | {
         'ModuleInfo: Module: selfLexerTokens InitialContents: FollowSlot\x7fVisibility: public'
        
         resendToken = bootstrap define: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'resendToken' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals selfParser lexer tokens abstractSelfToken copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'resendToken' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals selfParser lexer tokens resendToken.

CopyDowns:
globals selfParser lexer tokens abstractSelfToken. copy 
SlotsToOmit: parent.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'resendToken' -> () From: ( | {
         'ModuleInfo: Module: selfLexerTokens InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'resendToken' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals selfParser lexer tokens resendToken parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'resendToken' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: selfLexerTokens InitialContents: FollowSlot\x7fVisibility: public'
        
         isSelfDelegatee = bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'resendToken' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: selfLexerTokens InitialContents: FollowSlot\x7fVisibility: public'
        
         isSelfResendToken = bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'resendToken' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: selfLexerTokens InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'abstractSelfToken' -> 'parent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'resendToken' -> 'parent' -> () From: ( | {
         'Comment: for use as selector\x7fModuleInfo: Module: selfLexerTokens InitialContents: FollowSlot\x7fVisibility: public'
        
         value = 'resend'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> () From: ( | {
         'Category: value is source\x7fCategory: operators\x7fModuleInfo: Module: selfLexerTokens InitialContents: FollowSlot\x7fVisibility: public'
        
         star = bootstrap define: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'star' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals selfParser lexer tokens abstractOperator copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'star' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals selfParser lexer tokens star.

CopyDowns:
globals selfParser lexer tokens abstractOperator. copy 
SlotsToOmit: parent.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'star' -> () From: ( | {
         'ModuleInfo: Module: selfLexerTokens InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'star' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals selfParser lexer tokens star parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'star' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: selfLexerTokens InitialContents: FollowSlot\x7fVisibility: public'
        
         isSelfParent = bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'star' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: selfLexerTokens InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'abstractOperator' -> 'parent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'star' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: selfLexerTokens InitialContents: FollowSlot\x7fVisibility: public'
        
         value = '*'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> () From: ( | {
         'Category: constants\x7fModuleInfo: Module: selfLexerTokens InitialContents: FollowSlot\x7fVisibility: public'
        
         string = bootstrap define: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'string' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'initialCharacterSet' From:
             bootstrap remove: 'initialCharacterSet:' From:
             bootstrap remove: 'parent' From:
             globals selfParser lexer tokens abstractSelfToken copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'string' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals selfParser lexer tokens string.

CopyDowns:
globals selfParser lexer tokens abstractSelfToken. copy 
SlotsToOmit: initialCharacterSet initialCharacterSet: parent.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'string' -> () From: ( | {
         'ModuleInfo: Module: selfLexerTokens InitialContents: InitializeToExpression: (list copyRemoveAll)'
        
         buffer <- list copyRemoveAll.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'string' -> () From: ( | {
         'Category: change these for types of tokens\x7fModuleInfo: Module: selfLexerTokens InitialContents: FollowSlot\x7fVisibility: public'
        
         initialCharacterSet = '\'' asCharacterSet.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'string' -> () From: ( | {
         'ModuleInfo: Module: selfLexerTokens InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'string' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals selfParser lexer tokens string parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'string' -> 'parent' -> () From: ( | {
         'Category: scanning\x7fModuleInfo: Module: selfLexerTokens InitialContents: FollowSlot\x7fVisibility: private'
        
         advancePastMeIfFail: fb = ( |
            | 
            buffer: list copyRemoveAll.
            in advance. "'"
            [ readStringCharIfDone: [^ self]
                            IfFail: [|:e| ^ fb value: e]
            ] loop.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'string' -> 'parent' -> () From: ( | {
         'Category: scanning\x7fModuleInfo: Module: selfLexerTokens InitialContents: FollowSlot\x7fVisibility: private'
        
         append: c = ( |
            | buffer addLast: c. self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'string' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: selfLexerTokens InitialContents: FollowSlot\x7fVisibility: public'
        
         argumentCountAsSlotContents = 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'string' -> 'parent' -> () From: ( | {
         'Category: constructing\x7fModuleInfo: Module: selfLexerTokens InitialContents: FollowSlot\x7fVisibility: public'
        
         condenseValueIfFail: fb = ( |
            | 
            value: buffer asString.
            buffer: nil.
            resend.condenseValueIfFail: fb).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'string' -> 'parent' -> () From: ( | {
         'Category: scanning\x7fModuleInfo: Module: selfLexerTokens InitialContents: FollowSlot\x7fVisibility: public'
        
         delimeter = '\''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'string' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: selfLexerTokens InitialContents: FollowSlot\x7fVisibility: public'
        
         isSelfConstant = bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'string' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: selfLexerTokens InitialContents: FollowSlot\x7fVisibility: public'
        
         isSelfString = bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'string' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: selfLexerTokens InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'abstractSelfToken' -> 'parent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'string' -> 'parent' -> () From: ( | {
         'Category: scanning\x7fModuleInfo: Module: selfLexerTokens InitialContents: FollowSlot\x7fVisibility: private'
        
         readNumericEscapeBase: b Length: len IfFail: fb = ( |
             c.
             count <- 0.
             d.
             result <- 0.
            | 
            [
              c: in next.
              d:  case if: [c isDigit] Then: [c asByte - '0' asByte]
                       If: [c isLetter] Then: [(c uncapitalize asByte - 'a' asByte) + 10]
                       Else: b.
              d >= b ifTrue: [ ^ illegalTokenReason: 'invalid digit in character escape'  FailBlock: fb ].
              result: (result * b) + d.
              result > 255  ifTrue: [^ illegalTokenReason: 'invalid character escape value (>255)'  FailBlock: fb ].
              count: count succ. 
              count = len  ifTrue: [ ^ append: result asCharacter ]
            ] loop).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'string' -> 'parent' -> () From: ( | {
         'Category: scanning\x7fModuleInfo: Module: selfLexerTokens InitialContents: FollowSlot\x7fVisibility: private'
        
         readStringCharIfDone: db IfFail: fb = ( |
             c.
            | 
            c: in peekIfEOF: [
             ^ illegalTokenReason: 'missing trailing quote of string literal' FailBlock: fb
            ].
            case
              if: [ c = delimeter ] Then: [ in advance. "eat close quote"  ^ db value ]
              If: [ c = '\\' ] Then: [|cc|
                in next. "backslash"
                scanEscapeSequenceIfFail: [|:e| ^ fb value: e]
              ]
              Else: [ append: in next ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'string' -> 'parent' -> () From: ( | {
         'Category: scanning\x7fModuleInfo: Module: selfLexerTokens InitialContents: FollowSlot\x7fVisibility: private'
        
         scanEscapeSequenceIfFail: fb = ( |
             c.
            | 
            c: in next.
            case
             if: [ '\r\n' includes: c ] Then: ["ignore escaped nl in string"]
             If: [ c = 'n' ] Then: [ append: '\n' ]
             If: [ c = 't' ] Then: [ append: '\t' ]
             If: [ c = 'f' ] Then: [ append: '\f' ]
             If: [ c = 'r' ] Then: [ append: '\r' ]
             If: [ c = 'v' ] Then: [ append: '\v' ]
             If: [ c = 'b' ] Then: [ append: '\b' ]
             If: [ c = 'a' ] Then: [ append: '\a' ]
             If: [ c = '0' ] Then: [ append: '\0' ]
             If: [ '\'"?\\' includes: c ] Then: [ append: c ]
             If: [ c = 'x' ] Then: [ readNumericEscapeBase: 16 Length: 2 IfFail: [|:e| ^ fb value: e] ]
             If: [ c = 'o' ] Then: [ readNumericEscapeBase:  8 Length: 3 IfFail: [|:e| ^ fb value: e] ]
             If: [ c = 'd' ] Then: [ readNumericEscapeBase: 10 Length: 3 IfFail: [|:e| ^ fb value: e] ]
             Else: [ ^ illegalTokenReason: 'unknown escape sequence' FailBlock: fb ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> 'string' -> () From: ( | {
         'ModuleInfo: Module: selfLexerTokens InitialContents: InitializeToExpression: (\'\')\x7fVisibility: public'
        
         value <- ''.
        } | ) 



 '-- Side effects'

 globals modules selfLexerTokens postFileIn
