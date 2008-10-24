 '$Revision: 30.2 $'
 '
Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: stringTests InitialContents: FollowSlot'
        
         stringTests = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'stringTests' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'stringTests' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules stringTests.

CopyDowns:
globals modules init. copy 
SlotsToOmit: directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'stringTests' -> () From: ( | {
         'ModuleInfo: Module: stringTests InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'core'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'stringTests' -> () From: ( | {
         'ModuleInfo: Module: stringTests InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'stringTests' -> () From: ( | {
         'ModuleInfo: Module: stringTests InitialContents: FollowSlot'
        
         myComment <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'stringTests' -> () From: ( | {
         'ModuleInfo: Module: stringTests InitialContents: FollowSlot'
        
         postFileIn = ( |
            | resend.postFileIn).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'stringTests' -> () From: ( | {
         'ModuleInfo: Module: stringTests InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- '$Revision: 30.2 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'stringTests' -> () From: ( | {
         'ModuleInfo: Module: stringTests InitialContents: FollowSlot\x7fVisibility: private'
        
         subpartNames <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'string' -> () From: ( | {
         'Category: transforming\x7fCategory: tokenizing\x7fModuleInfo: Module: stringTests InitialContents: FollowSlot\x7fVisibility: private'
        
         tokenizingUnitTests = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'string' -> 'tokenizingUnitTests' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits string tokenizingUnitTests.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'string' -> 'tokenizingUnitTests' -> () From: ( | {
         'ModuleInfo: Module: stringTests InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'string' -> 'tokenizingUnitTests' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits string tokenizingUnitTests parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'string' -> 'tokenizingUnitTests' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: stringTests InitialContents: FollowSlot\x7fVisibility: private'
        
         assert: b = ( |
            | 
            b value ifFalse: [error: 'assertion failure']).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'string' -> 'tokenizingUnitTests' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: stringTests InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'clonable' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'string' -> 'tokenizingUnitTests' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: stringTests InitialContents: FollowSlot\x7fVisibility: public'
        
         run = ( |
            | 
            testTokenizingByWhiteSpace.
            testTokenizingIntoWords.
            testTokenizingByCertainCharacters.
            testTokenizingByAnArbitraryBlock.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'string' -> 'tokenizingUnitTests' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: stringTests InitialContents: FollowSlot\x7fVisibility: private'
        
         testTokenizingByAnArbitraryBlock = ( |
            | 
            assert: [('aaaxbbxycx' asTokensSeparatedByCharactersSatisfying: [|:c| c asByte > 'w' asByte]) = ('aaa' & 'bb' & 'c') asList]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'string' -> 'tokenizingUnitTests' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: stringTests InitialContents: FollowSlot\x7fVisibility: private'
        
         testTokenizingByCertainCharacters = ( |
            | 
            assert: [('aaaxbbxycx' asTokensSeparatedByCharactersIn: 'xy') = ('aaa' & 'bb' & 'c') asList]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'string' -> 'tokenizingUnitTests' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: stringTests InitialContents: FollowSlot\x7fVisibility: private'
        
         testTokenizingByWhiteSpace = ( |
            | 
            assert: ['hello world ' asTokensSeparatedByWhiteSpace = ('hello' & 'world') asList].
            assert: ['this is 
            a string that
            spans multiple lines' asTokensSeparatedByWhiteSpace = ('this' & 'is' & 'a' & 'string' & 'that' & 'spans' & 'multiple' & 'lines') asList].
            assert: ['this_is_one_big_token' asTokensSeparatedByWhiteSpace = (list copyRemoveAll addLast: 'this_is_one_big_token')]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'string' -> 'tokenizingUnitTests' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: stringTests InitialContents: FollowSlot\x7fVisibility: private'
        
         testTokenizingIntoWords = ( |
            | 
            assert: ['hello world ' asWords = ('hello' & 'world') asList].
            assert: ['this is 
            a string that
            spans multiple lines' asWords = ('this' & 'is' & 'a' & 'string' & 'that' & 'spans' & 'multiple' & 'lines') asList].
            assert: ['this_is_not_one_big_word' asWords = ('this' & 'is' & 'not' & 'one' & 'big' & 'word') asList]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'string' -> () From: ( | {
         'ModuleInfo: Module: stringTests InitialContents: FollowSlot\x7fVisibility: private'
        
         unitTests = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'string' -> 'unitTests' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits string unitTests.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'string' -> 'unitTests' -> () From: ( | {
         'ModuleInfo: Module: stringTests InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'string' -> 'unitTests' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits string unitTests parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'string' -> 'unitTests' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: stringTests InitialContents: FollowSlot'
        
         assert: b = ( |
            | 
            b value ifFalse: [error: 'assertion failure in string unitTests']).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'string' -> 'unitTests' -> 'parent' -> () From: ( | {
         'Category: transforming\x7fModuleInfo: Module: stringTests InitialContents: InitializeToExpression: (( \'0.2\' &  \'0.2e9\' &  \'0.2e+9\' &  \'0.2e-9\' &  \'-0.0\' &  \'0.0\' &  \'0.0e9\' &  \'-0.0e9\' &  \'0.2e11\' &  \'0.1e-8\' &  \'0.1e-9\' & \' 1.0 \' ) asVector)\x7fVisibility: private'
        
         floatStrings = ( '0.2' &  '0.2e9' &  '0.2e+9' &  '0.2e-9' &  '-0.0' &  '0.0' &  '0.0e9' &  '-0.0e9' &  '0.2e11' &  '0.1e-8' &  '0.1e-9' & ' 1.0 ' ) asVector.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'string' -> 'unitTests' -> 'parent' -> () From: ( | {
         'Category: transforming\x7fModuleInfo: Module: stringTests InitialContents: InitializeToExpression: (( 0.2 &  0.2e9 &  0.2e+9 &  0.2e-9 &  -0.0 &  0.0 &  0.0e9 &  -0.0e9 &  0.2e11 &  0.1e-8 &  0.1e-9 &  1.0  ) asVector)\x7fVisibility: private'
        
         floatValues = ( 0.2 &  0.2e9 &  0.2e+9 &  0.2e-9 &  -0.0 &  0.0 &  0.0e9 &  -0.0e9 &  0.2e11 &  0.1e-8 &  0.1e-9 &  1.0  ) asVector.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'string' -> 'unitTests' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: stringTests InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'oddball' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'string' -> 'unitTests' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: stringTests InitialContents: FollowSlot\x7fVisibility: public'
        
         run = ( |
            | 
            testTransforming.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'string' -> 'unitTests' -> 'parent' -> () From: ( | {
         'Category: transforming\x7fModuleInfo: Module: stringTests InitialContents: FollowSlot\x7fVisibility: private'
        
         testAsFloat = ( |
            | 
            floatStrings do: [ |:s. :i|
              assert: [ s asFloat = (floatValues at: i)]
            ].
            true).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'string' -> 'unitTests' -> 'parent' -> () From: ( | {
         'Category: transforming\x7fModuleInfo: Module: stringTests InitialContents: FollowSlot\x7fVisibility: private'
        
         testTransforming = ( |
            | 
            testAsFloat).
        } | ) 



 '-- Side effects'

 globals modules stringTests postFileIn
