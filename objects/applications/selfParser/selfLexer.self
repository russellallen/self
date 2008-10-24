 '$Revision: 30.7 $'
 '
Copyright 1992-2006 Sun Microsystems, Inc.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: selfLexer InitialContents: FollowSlot'
        
         selfLexer = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'selfLexer' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'comment' From:
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'selfLexer' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules selfLexer.

CopyDowns:
globals modules init. copy 
SlotsToOmit: comment directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'selfLexer' -> () From: ( | {
         'ModuleInfo: Module: selfLexer InitialContents: FollowSlot\x7fVisibility: private'
        
         myComment <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'selfLexer' -> () From: ( | {
         'ModuleInfo: Module: selfLexer InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'applications/selfParser'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'selfLexer' -> () From: ( | {
         'ModuleInfo: Module: selfLexer InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'selfLexer' -> () From: ( | {
         'ModuleInfo: Module: selfLexer InitialContents: FollowSlot'
        
         postFileIn = ( |
            | resend.postFileIn).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'selfLexer' -> () From: ( | {
         'ModuleInfo: Module: selfLexer InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- '$Revision: 30.7 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'selfLexer' -> () From: ( | {
         'ModuleInfo: Module: selfLexer InitialContents: FollowSlot\x7fVisibility: public'
        
         subpartNames <- 'selfLexerTokens'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> () From: ( | {
         'Category: lexing\x7fModuleInfo: Module: selfLexer InitialContents: FollowSlot\x7fVisibility: public'
        
         characterSets = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'selfParser' -> 'characterSets' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals selfParser characterSets.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'characterSets' -> () From: ( | {
         'ModuleInfo: Module: selfLexer InitialContents: FollowSlot\x7fVisibility: public'
        
         identifierLetter = (('A' asCharacterSet  =>  'Z') + ('a' asCharacterSet  =>  'z')) + ('_' asCharacterSet).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'characterSets' -> () From: ( | {
         'ModuleInfo: Module: selfLexer InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'globals' -> 'parseKit' -> 'characterSets' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'characterSets' -> () From: ( | {
         'ModuleInfo: Module: selfLexer InitialContents: FollowSlot\x7fVisibility: public'
        
         punctuation = '!#$%&*+-,/;<=>?@\\^`|~' asCharacterSet.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'characterSets' -> () From: ( | {
         'ModuleInfo: Module: selfLexer InitialContents: FollowSlot\x7fVisibility: public'
        
         selectorStart = ((('A' asCharacterSet  =>  'Z') + ('a' asCharacterSet  =>  'z')) + ('_' asCharacterSet)) + ('!#$%&*+-,/;<=>?@\\^`|~' asCharacterSet).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> () From: ( | {
         'Category: lexing\x7fModuleInfo: Module: selfLexer InitialContents: FollowSlot\x7fVisibility: public'
        
         lexer = bootstrap define: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             bootstrap remove: 'spaces' From:
             bootstrap remove: 'tokenTraits' From:
             bootstrap remove: 'tokens' From:
             globals parseKit lexer copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> () From: ( |
             {} = 'Comment: To make your lexer,
create a copy-down child of
this object and replace the contents of the spaces 
and tokens slots. -- dmu 8/99\x7fModuleInfo: Creator: globals selfParser lexer.

CopyDowns:
globals parseKit lexer. copy 
SlotsToOmit: parent spaces tokenTraits tokens.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> () From: ( | {
         'ModuleInfo: Module: selfLexer InitialContents: InitializeToExpression: (0)\x7fVisibility: private'
        
         nestingDepth <- 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> () From: ( | {
         'ModuleInfo: Module: selfLexer InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals selfParser lexer parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'parent' -> () From: ( | {
         'Category: nesting\x7fModuleInfo: Module: selfLexer InitialContents: FollowSlot\x7fVisibility: private'
        
         debugNesting = bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: selfLexer InitialContents: FollowSlot\x7fVisibility: public'
        
         doesNewlineEndExpression = ( |
            | 
            isNested not && [in isForFile]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'parent' -> () From: ( | {
         'Category: nesting\x7fModuleInfo: Module: selfLexer InitialContents: FollowSlot\x7fVisibility: public'
        
         isNested = ( |
            | nestingDepth != 0).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: selfLexer InitialContents: FollowSlot\x7fVisibility: private'
        
         nameSpace* = bootstrap stub -> 'globals' -> 'selfParser' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'parent' -> () From: ( | {
         'Category: nesting\x7fModuleInfo: Module: selfLexer InitialContents: FollowSlot\x7fVisibility: public'
        
         nest = ( |
            | 
            debugNesting ifTrue: [
              (in line printString, ': ', nestingDepth printString, ' -> ', nestingDepth succ printString) printLine.
            ].
             nestingDepth: nestingDepth succ. self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: selfLexer InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'globals' -> 'parseKit' -> 'lexer' -> 'parent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'parent' -> () From: ( | {
         'Category: testing\x7fModuleInfo: Module: selfLexer InitialContents: FollowSlot\x7fVisibility: private'
        
         testTokenFailures = ( |
            | 
            testToken: 'self:' ShouldFail: 'using `self\' as keyword: self:' Selecting: 'self:'.
            testToken: ':A' ShouldFail: 'arguments must be uncapitalized' Selecting: ':A'.
            testToken: ':abc:' ShouldFail: 'colon cannot both start and end token' Selecting: ':abc:'.
            testToken: '\'\\p\'' ShouldFail: 'unknown escape sequence' Selecting: '\'\\p'.
            testToken: '\'\\xag\'' ShouldFail: 'invalid digit in character escape' Selecting: '\'\\xag'.
            testToken: '\'\\o900\'' ShouldFail: 'invalid digit in character escape' Selecting: '\'\\o9'.
            testToken: '\'\\d300\'' ShouldFail: 'invalid character escape value (>255)' Selecting: '\'\\d300'.
            testToken: '"as' ShouldFail: 'EOF in middle of comment' Selecting: '"as'.
            testToken: '"\\' ShouldFail: 'EOF in middle of comment' Selecting: '"\\'.
            testToken: '\'asd' ShouldFail: 'missing trailing quote of string literal' Selecting: '\'asd'.
            testToken: '.1' ShouldFail: 'Floats must have a digit before the decimal point' Selecting: '.1'.
            testToken: 'Resend' ShouldFail: 'name tokens cannot be capitalized' Selecting: 'Resend'.
            testToken: '0x' ShouldFail: 'invalid numeric constant (use 16r...)' Selecting: '0x'.
            testToken: '03' ShouldFail: 'C-style octals are not supported (use 8r...)' Selecting: '03'.
            testToken: '6r ' ShouldFail: 'expecting a number after the base specifier' Selecting: '6r'.
            testToken: '1r0' ShouldFail: 'base must be between 2 and 36' Selecting: '1r'.
            testToken: '50r1' ShouldFail: 'base must be between 2 and 36' Selecting: '50r'.
            testToken: '8ra'  ShouldFail: 'letter too large for given base' Selecting: '8ra'.
            testToken: '\'asdf' ShouldFail: 'missing trailing quote of string literal' Selecting: '\'asdf'.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'parent' -> () From: ( | {
         'Category: testing\x7fModuleInfo: Module: selfLexer InitialContents: FollowSlot\x7fVisibility: private'
        
         testTokenSuccesses = ( |
            | 
            ('~' & '@@' & '#' & '$$' & '%' & '^^' & '&' & '**' & '-' & '+' & '==' & '||' & '!=' & '/' & '?')
             asVector do: [|:op| testToken: op ShouldBe: 'operator' Value: op].
            testToken: '<-' ShouldBe: 'arrow'.
            testToken: '=' ShouldBe: 'equals' Value: '='.
            testToken: '*' ShouldBe: 'star' Value: '*'.
            testToken: 'foobar.+' ShouldBe: 'delegatee' Value: 'foobar'.
            testToken: '_pKw' ShouldBe: 'primName' Value: '_pKw'.
            testToken: '_pKw:' ShouldBe: 'primKeyword' Value: '_pKw:'.
            testToken: 'fred23Bar' ShouldBe: 'name' Value: 'fred23Bar'.

            testToken: 'Resend3:' ShouldBe: 'capKeyword' Value: 'Resend3:'.

            testToken: '\'\\x13\\o123\\d145\''
             ShouldBe: 'string'
                Value: '\x13\o123\d145'.
            testToken: '\'a\\\n\\\r\\n\\t\\f\\r\\v\\b\\a\\0\\\'\\"\\?\\\\\''
             ShouldBe: 'string'
                Value: 'a\n\t\f\r\v\b\a\0\'"?\\'.

            testToken: '\'asdf\'' ShouldBe: 'string' Value: 'asdf'.
            testToken: '-2.3e-1' ShouldBe: 'float' Value: -0.23.
            testToken: '1.2' ShouldBe: 'float' Value: 1.2.
            testToken: '1.2' ShouldBe: 'float' Value: 1.2.
            testToken: '"comment"' ShouldBe: 'comment' Value: 'comment'.
            testToken: '""' ShouldBe: 'comment' Value: ''.
            testToken: '"a\\"\\b\\\\"' ShouldBe: 'comment' Value: 'a"b\\'.
            testToken: '.' ShouldBe: 'dot'.
            testToken: '\\\n' ShouldBe: 'escapedNewLine'.
            testToken: '{' ShouldBe: 'annotationStart'.
            testToken: '{}' ShouldBe: 'objectAnnotation'.
            testToken: '(' ShouldBe: 'openParen'.
            testToken: '[' ShouldBe: 'openSquare'.
            testToken: 'self' ShouldBe: 'receiver'.
            testToken: 'resend' ShouldBe: 'resendToken'.
            testToken: ')' ShouldBe: 'closeParen'.
            testToken: '}' ShouldBe: 'annotationEnd'.
            testToken: ']' ShouldBe: 'closeSquare'.
            testToken: '0' ShouldBe: 'integer' Value: 0.
            testToken: '|' ShouldBe: 'bar'.
            testToken: ':' ShouldBe: 'colon'.
            testToken: ':abc' ShouldBe: 'argument' Value: 'abc'.
            testToken: '^' ShouldBe: 'hat'.
            testToken: '-1' ShouldBe: 'integer' Value: -1.
            testToken: '1. 2' ShouldBe: 'integer' Value: 1.
            testToken: '3r12' ShouldBe: 'integer' Value: 5.
            testToken: '-16raa' ShouldBe: 'integer' Value: -170.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'parent' -> () From: ( | {
         'Category: nesting\x7fModuleInfo: Module: selfLexer InitialContents: FollowSlot\x7fVisibility: public'
        
         unnest = ( |
            | 
            debugNesting ifTrue: [
              (in line printString, ': ', nestingDepth printString, ' -> ', nestingDepth pred printString) printLine.
            ].
            nestingDepth: nestingDepth pred. self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> () From: ( | {
         'Category: change these to lex your language\x7fModuleInfo: Module: selfLexer InitialContents: FollowSlot\x7fVisibility: private'
        
         spaces = ' 	\f'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> () From: ( | {
         'Category: change these to lex your language\x7fModuleInfo: Module: selfLexer InitialContents: FollowSlot\x7fVisibility: private'
        
         tokenTraits = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokenTraits' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals selfParser lexer tokenTraits.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokenTraits' -> () From: ( | {
         'ModuleInfo: Module: selfLexer InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'globals' -> 'parseKit' -> 'lexer' -> 'tokenTraits' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> () From: ( | {
         'Category: change these to lex your language\x7fModuleInfo: Module: selfLexer InitialContents: FollowSlot\x7fVisibility: private'
        
         tokens = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'selfParser' -> 'lexer' -> 'tokens' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals selfParser lexer tokens.
'.
            | ) .
        } | ) 



 '-- Sub parts'

 bootstrap read: 'selfLexerTokens' From: 'applications/selfParser'



 '-- Side effects'

 globals modules selfLexer postFileIn
