 'Sun-$Revision: 30.23 $'
 '
Copyright 1992-2011 AUTHORS.
See the legal/LICENSE file for license information and legal/AUTHORS for authors.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: system\x7fCategory: characters\x7fModuleInfo: Module: string InitialContents: FollowSlot\x7fVisibility: public'
        
         highestPrintableChar = '~'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: system\x7fCategory: characters\x7fComment: random needs these:\x7fModuleInfo: Module: string InitialContents: FollowSlot\x7fVisibility: public'
        
         lowestPrintableChar = ' '.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: string InitialContents: FollowSlot'
        
         string = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'string' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'string' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules string.

CopyDowns:
globals modules init. copy 
SlotsToOmit: directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'string' -> () From: ( | {
         'ModuleInfo: Module: string InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'core'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'string' -> () From: ( | {
         'ModuleInfo: Module: string InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'string' -> () From: ( | {
         'ModuleInfo: Module: string InitialContents: FollowSlot'
        
         myComment <- 'Inheritance hierarchy of strings:

              string
                immutableString
                  canonicalString
                mutableString'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'string' -> () From: ( | {
         'ModuleInfo: Module: string InitialContents: FollowSlot'
        
         postFileIn = ( |
            | 
            traits canonicalString _RemoveSlot: 'print' IfFail: [].
            '' initializeAscii.
            '' initializeCachedStoreCharacters.
            resend.postFileIn).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'string' -> () From: ( | {
         'ModuleInfo: Module: string InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- 'Sun-$Revision: 30.23 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'string' -> () From: ( | {
         'ModuleInfo: Module: string InitialContents: FollowSlot\x7fVisibility: public'
        
         subpartNames <- 'stringTests
'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: collections\x7fCategory: vectors\x7fModuleInfo: Module: string InitialContents: FollowSlot\x7fVisibility: public'
        
         mutableString = bootstrap define: bootstrap stub -> 'globals' -> 'mutableString' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals byteVector copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'mutableString' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals mutableString.

CopyDowns:
globals byteVector. copy 
SlotsToOmit: parent.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: collections\x7fCategory: vectors\x7fModuleInfo: Module: string InitialContents: FollowSlot\x7fVisibility: public'
        
         mutableString = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'mutableString' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits mutableString.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mutableString' -> () From: ( | {
         'ModuleInfo: Module: string InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'mutableString' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'byteVector' -> () From: ( | {
         'Category: iterating\x7fComment: Iterate over the elements\' integer values\x7fModuleInfo: Module: string InitialContents: FollowSlot\x7fVisibility: public'
        
         bytesDo: aBlock = ( |
            | 
            do: aBlock).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'byteVector' -> () From: ( | {
         'Category: copying\x7fModuleInfo: Module: string InitialContents: FollowSlot'
        
         copyContainingString: s = ( |
             bv.
             k.
            | 
            bv: copySize: s size.
            k: firstKey.
            s do: [ | :v | bv at: k Put: v asByte. k: k succ ].
            bv).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: collections\x7fCategory: vectors\x7fModuleInfo: Module: string InitialContents: FollowSlot\x7fVisibility: public'
        
         canonicalString = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'canonicalString' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits canonicalString.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'canonicalString' -> () From: ( | {
         'Category: comparing\x7fComment: optimization: use == to speed up the following:\x7fModuleInfo: Module: string InitialContents: FollowSlot\x7fVisibility: public'
        
         = s = ( |
            | == s ifTrue: true False: [ s equalsCanonicalString: self ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'canonicalString' -> () From: ( | {
         'ModuleInfo: Module: string InitialContents: FollowSlot\x7fVisibility: public'
        
         canonicalize = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'canonicalString' -> () From: ( | {
         'Category: comparing\x7fModuleInfo: Module: string InitialContents: FollowSlot\x7fVisibility: public'
        
         equalsCanonicalString: s = ( |
            | == s).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'canonicalString' -> () From: ( | {
         'ModuleInfo: Module: string InitialContents: FollowSlot\x7fVisibility: public'
        
         isCanonical = bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'canonicalString' -> () From: ( | {
         'Category: comparing\x7fModuleInfo: Module: string InitialContents: FollowSlot\x7fVisibility: public'
        
         isPrefixOf: s = ( |
            | == s ifTrue: true False: [ resend.isPrefixOf: s ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'canonicalString' -> () From: ( | {
         'Category: comparing\x7fModuleInfo: Module: string InitialContents: FollowSlot\x7fVisibility: public'
        
         isSuffixOf: s = ( |
            | == s ifTrue: true False: [ resend.isSuffixOf: s ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: collections\x7fCategory: vectors\x7fModuleInfo: Module: string InitialContents: FollowSlot\x7fVisibility: public'
        
         immutableString = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'immutableString' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits immutableString.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'canonicalString' -> () From: ( | {
         'ModuleInfo: Module: string InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'immutableString' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'immutableString' -> () From: ( | {
         'ModuleInfo: Module: string InitialContents: FollowSlot\x7fVisibility: public'
        
         at: index PutByte: byte IfAbsent: block = ( |
            | immutableError).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'immutableString' -> () From: ( | {
         'ModuleInfo: Module: string InitialContents: FollowSlot\x7fVisibility: public'
        
         copy = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'immutableString' -> () From: ( | {
         'ModuleInfo: Module: string InitialContents: FollowSlot\x7fVisibility: public'
        
         copyMutable = ( |
            | 
            (mutableString copySize: size) fillFrom: self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'immutableString' -> () From: ( | {
         'ModuleInfo: Module: string InitialContents: FollowSlot\x7fVisibility: public'
        
         copySize: len FillingWith: filler = ( |
            | 
            "this returns a mutable version"
            (mutableString copySize: len FillingWith: filler) fillFrom: self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'immutableString' -> () From: ( | {
         'ModuleInfo: Module: string InitialContents: FollowSlot\x7fVisibility: private'
        
         immutableError = ( |
            | error: 'cannot modify an immutable string').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: collections\x7fCategory: vectors\x7fModuleInfo: Module: string InitialContents: FollowSlot\x7fVisibility: public'
        
         string = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'string' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits string.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'immutableString' -> () From: ( | {
         'ModuleInfo: Module: string InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'string' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'immutableString' -> () From: ( | {
         'ModuleInfo: Module: string InitialContents: FollowSlot\x7fVisibility: private'
        
         prototypeForCopying = bootstrap stub -> 'globals' -> 'mutableString' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mutableString' -> () From: ( | {
         'ModuleInfo: Module: string InitialContents: FollowSlot\x7fVisibility: public'
        
         copy = ( |
            | clone).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mutableString' -> () From: ( | {
         'ModuleInfo: Module: string InitialContents: FollowSlot\x7fVisibility: public'
        
         copyMutable = ( |
            | copy).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mutableString' -> () From: ( | {
         'ModuleInfo: Module: string InitialContents: FollowSlot\x7fVisibility: public'
        
         copySize: len FillingWith: filler = ( |
            | 
            cloneSize: len FillingWith: filler asByte).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mutableString' -> () From: ( | {
         'Comment: You would think this would be true, but
the machinery does not exist to file in something like:
\'abc\' copyMutable
when nothing is filed in yet. -- dmu 4/1\x7fModuleInfo: Module: string InitialContents: FollowSlot\x7fVisibility: public'
        
         isImmutableForFilingOut = bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mutableString' -> () From: ( | {
         'ModuleInfo: Module: string InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'string' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mutableString' -> () From: ( | {
         'ModuleInfo: Module: string InitialContents: FollowSlot\x7fVisibility: public'
        
         storeStringIfFail: fb = ( | {
                 'ModuleInfo: Module: string InitialContents: FollowSlot'
                
                 f.
                } 
            | 
            isEmpty ifTrue: [^ 'mutableString'].
            f: first.
            findFirst:  [|:c| c != f]
            IfPresent:  [ (resend.storeStringIfFail: fb), ' copyMutable']
             IfAbsent:  ['mutableString copySize: ', size storeString,
                         ' FillingWith: ', first storeString]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mutableString' -> () From: ( | {
         'ModuleInfo: Module: string InitialContents: FollowSlot\x7fVisibility: public'
        
         storeStringNeeds = ( |
            | mutableString).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'string' -> () From: ( | {
         'Category: transforming\x7fModuleInfo: Module: string InitialContents: FollowSlot\x7fVisibility: public'
        
         asBigInteger = ( |
            | asInteger asBigInteger).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'string' -> () From: ( | {
         'Category: characters\x7fModuleInfo: Module: string InitialContents: FollowSlot\x7fVisibility: public'
        
         asByte = ( |
            | asByteFor: 'asByte').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'string' -> () From: ( | {
         'Category: characters\x7fModuleInfo: Module: string InitialContents: FollowSlot\x7fVisibility: private'
        
         asByteFor: op = ( |
            | 
            1 = size ifFalse: [
                error: op, ' only works on strings of size 1, but I',
                    ' (', self, ') have size ', size printString.
            ].
            firstByte).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'string' -> () From: ( | {
         'Category: transforming\x7fModuleInfo: Module: string InitialContents: FollowSlot\x7fVisibility: public'
        
         asByteVector = ( |
            | 
            byteVector copyContainingString: self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'string' -> () From: ( | {
         'Category: printing\x7fModuleInfo: Module: string InitialContents: FollowSlot\x7fVisibility: public'
        
         asEscapeSequence = ( | {
                 'ModuleInfo: Module: string InitialContents: FollowSlot'
                
                 escapeCodes = 'nr\\tfvba\"\'?'.
                }  {
                 'ModuleInfo: Module: string InitialContents: FollowSlot'
                
                 escapees = '

\\	\f\v\b\a\"\'?'.
                }  {
                 'ModuleInfo: Module: string InitialContents: FollowSlot'
                
                 r <- ''.
                } 
            | 

            "return escape sequence for the string"
            do: [| :c. | 
                r: r, '\\', [|:exit|
                    escapeCodes at: escapees keyAt: c IfAbsent: [
                        exit value: 'x', (
                                 c asByte printStringBase: 16 
                                                  PadWith: '0' 
                                                   ToSize: 2
                        ) 
                    ].
                ]  exitValue.
            ].
            r).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'string' -> () From: ( | {
         'Category: transforming\x7fModuleInfo: Module: string InitialContents: FollowSlot\x7fVisibility: public'
        
         asFloat = ( |
            | 
            asFloatIfFail: [|:e| 'error, not a float: ', e printString]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'string' -> () From: ( | {
         'Category: transforming\x7fModuleInfo: Module: string InitialContents: FollowSlot\x7fVisibility: public'
        
         asFloatIfFail: fb = ( |
             r.
            | 
            r: evalIfFail: [ |:e| ^ fb value: e].
            (reflect: r) isReflecteeFloat ifFalse: [ ^ fb value: self].
            r).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'string' -> () From: ( | {
         'Category: transforming\x7fModuleInfo: Module: string InitialContents: FollowSlot\x7fVisibility: public'
        
         asInteger = ( |
            | asIntegerIfFail: [ error: 'not a number' ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'string' -> () From: ( | {
         'Category: transforming\x7fModuleInfo: Module: string InitialContents: FollowSlot\x7fVisibility: public'
        
         asIntegerIfFail: b = ( |
            | 
            asIntegerParseWith: [ | :n. :digit. |
                digit isDigit ifFalse: [ ^ b value ].
                (n * 10) + (digit asByte - '0' asByte). ]
              IfFail: b).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'string' -> () From: ( | {
         'Category: transforming\x7fModuleInfo: Module: string InitialContents: FollowSlot\x7fVisibility: private'
        
         asIntegerParseWith: block IfFail: fb = ( | {
                 'ModuleInfo: Module: string InitialContents: FollowSlot'
                
                 n <- 0.
                }  {
                 'ModuleInfo: Module: string InitialContents: FollowSlot'
                
                 neg.
                }  {
                 'ModuleInfo: Module: string InitialContents: FollowSlot'
                
                 start.
                } 
            | 
            = '' ifTrue: [^fb value].
            first = '-' ifTrue: [ neg: true.  start: 1. ] 
                         False: [ neg: false. start: 0. ].
            start upTo: size Do: [ | :i | n: block value: n With: (at: i) ].
            neg ifTrue: [ n negate ] False: [ n ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'string' -> () From: ( | {
         'Category: transforming\x7fModuleInfo: Module: string InitialContents: FollowSlot\x7fVisibility: public'
        
         asSelector = ( |
            | selector copyStr: self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'string' -> () From: ( | {
         'Category: evaluation\x7fCategory: basic\x7fCategory: parsing as a slot\x7fComment: parses slot names & initializers,
returns mirror containing slot(s)
-- Ungar, 12/23/94\x7fModuleInfo: Module: string InitialContents: FollowSlot\x7fVisibility: public'
        
         asSlotIfFail: block = ( |
             postfix = '
|'.
             prefix = '|
'.
            | 
            prefix, self, postfix parseObjectBodyIfFail: [ |:e|
              e start y = 0  ifTrue: [error: 'could not parse prefix'].
              e start: e start x @ e start y pred.
              block value: e]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'string' -> () From: ( | {
         'Category: transforming\x7fModuleInfo: Module: string InitialContents: FollowSlot\x7fVisibility: public'
        
         asSmallInteger = ( |
            | asInteger asSmallInteger).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'string' -> () From: ( | {
         'Category: transforming\x7fModuleInfo: Module: string InitialContents: FollowSlot\x7fVisibility: public'
        
         asSmallIntegerIfFail: fb = ( |
            | 
            (asIntegerIfFail: [|:e| ^ fb value: e])
              asSmallIntegerIfFail: fb).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'string' -> () From: ( | {
         'Category: transforming\x7fModuleInfo: Module: string InitialContents: FollowSlot\x7fVisibility: public'
        
         asString = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'string' -> () From: ( | {
         'Category: transforming\x7fCategory: tokenizing\x7fComment: Return a list of the individual tokens in this string.
Tokens are identified by splitting the string at characters
in separatorsCollection.

See tokenizingUnitTests for examples.\x7fModuleInfo: Module: string InitialContents: FollowSlot\x7fVisibility: public'
        
         asTokensSeparatedByCharactersIn: separatorsCollection = ( |
             separatorsSet.
            | 
            separatorsSet: separatorsCollection asSet.
            asTokensSeparatedByCharactersSatisfying: [|:c| separatorsSet includes: c]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'string' -> () From: ( | {
         'Category: transforming\x7fCategory: tokenizing\x7fComment: Return a list of the individual tokens in this string.
Tokens are identified by splitting the string at characters
for which aBlock returns true.

See tokenizingUnitTests for examples.\x7fModuleInfo: Module: string InitialContents: FollowSlot\x7fVisibility: public'
        
         asTokensSeparatedByCharactersSatisfying: aBlock = ( |
             result <- bootstrap stub -> 'globals' -> 'list' -> ().
             token <- ''.
            | 
            result: list copyRemoveAll.
            do: [|:c|
              (aBlock value: c) ifTrue: [
                 token isEmpty ifFalse: [result add: token. token: '']
              ] False: [token: token, c ]
            ].
            token isEmpty ifFalse: [result add: token].
            result).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'string' -> () From: ( | {
         'Category: transforming\x7fCategory: tokenizing\x7fComment: Return a list of the individual tokens in this string.
Tokens are identified by splitting the string at spaces,
tabs, newlines, or carriage returns.

See tokenizingUnitTests for examples.\x7fModuleInfo: Module: string InitialContents: FollowSlot\x7fVisibility: public'
        
         asTokensSeparatedByWhiteSpace = ( |
             whiteSpace = ' 	

'.
            | 
            asTokensSeparatedByCharactersIn: whiteSpace).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'string' -> () From: ( | {
         'Category: transforming\x7fCategory: tokenizing\x7fComment: Return a list of the individual words in this string. This
is different from asTokensSeparatedByWhiteSpace because
some non-whitespace characters (like . and _) are still
considered to be word separators.

See tokenizingUnitTests for examples.\x7fModuleInfo: Module: string InitialContents: FollowSlot\x7fVisibility: public'
        
         asWords = ( |
            | 
            asTokensSeparatedByCharactersSatisfying: [|:c| c isWordSeparator]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'string' -> () From: ( | {
         'ModuleInfo: Module: string InitialContents: InitializeToExpression: (vector copySize: 256)\x7fVisibility: private'
        
         ascii = vector copySize: 256.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'string' -> () From: ( | {
         'Category: evaluation\x7fCategory: advanced\x7fComment: evaluate me,
context is the receiver (mirror)
aResultReporter gets sent
  either succeededReturning: returnValue
  or     syntaxError: errObject
  or     failedInProcess: aProcess
-- Ungar, 12/24/94\x7fModuleInfo: Module: string InitialContents: FollowSlot\x7fVisibility: public'
        
         asyncEvalObjectBodyInContext: context Prefix: pre Postfix: post ReportingTo: aResultReporter = ( |
            | 
            "spawn a process to evaluate the expression"
            scheduler isRunning ifFalse: [
              "ugh! need for intialization of ui2Button scripts"
              ^ riskyEvalObjBodyContext: context Prefix: pre Postfix: post ReportingTo: aResultReporter.
            ].
            (message copy receiver: self       
                          Selector: 'evalObjectBodyInContext:Prefix:Postfix:ReportingTo:'
                          With: context With: pre With: post With: aResultReporter
            ) forkForBirthEvent: aResultReporter event).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'string' -> () From: ( | {
         'Category: evaluation\x7fCategory: advanced\x7fModuleInfo: Module: string InitialContents: FollowSlot\x7fVisibility: public'
        
         asyncEvalObjectBodyInContext: context ReportingTo: aResultReporter = ( |
            | asyncEvalObjectBodyInContext: context Prefix: '' Postfix: ''ReportingTo: aResultReporter).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'string' -> () From: ( | {
         'Category: accessing\x7fComment: these take and return singleton string objects\x7fModuleInfo: Module: string InitialContents: FollowSlot\x7fVisibility: public'
        
         at: index IfAbsent: b = ( |
            | 
            (byteAt: index IfAbsent: [|:e| ^ b value: e]) asCharacter).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'string' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: string InitialContents: FollowSlot\x7fVisibility: public'
        
         at: index Put: value IfAbsent: b = ( |
            | 
            at: index PutByte: value asByte IfAbsent: b).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'string' -> () From: ( | {
         'Category: iterating\x7fComment: Iterate over the elements\' integer values\x7fModuleInfo: Module: string InitialContents: FollowSlot\x7fVisibility: public'
        
         bytesDo: aBlock = ( |
            | 
            firstKey to: lastKey Do: [|:i| aBlock value: (byteAt: i) With: i].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'string' -> () From: ( | {
         'Category: printing\x7fModuleInfo: Module: string InitialContents: InitializeToExpression: (vector copySize: 256)\x7fVisibility: private'
        
         cachedStoreCharacterSizes = vector copySize: 256.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'string' -> () From: ( | {
         'Category: printing\x7fModuleInfo: Module: string InitialContents: InitializeToExpression: (vector copySize: 256)\x7fVisibility: private'
        
         cachedStoreCharacters = vector copySize: 256.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'string' -> () From: ( | {
         'Category: comparing\x7fModuleInfo: Module: string InitialContents: FollowSlot\x7fVisibility: public'
        
         canonicalize = ( |
            | asString _StringCanonicalize).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'string' -> () From: ( | {
         'Category: characters\x7fModuleInfo: Module: string InitialContents: FollowSlot\x7fVisibility: private'
        
         capitalizationDifference = -32.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'string' -> () From: ( | {
         'Category: casing\x7fModuleInfo: Module: string InitialContents: FollowSlot\x7fVisibility: public'
        
         capitalize = ( |
            | 
            isEmpty ifTrue: [ ^ self ].
            isUncapitalized ifFalse: self True: [
                copyMutable firstByte: firstByte + capitalizationDifference]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'string' -> () From: ( | {
         'Category: casing\x7fModuleInfo: Module: string InitialContents: FollowSlot\x7fVisibility: public'
        
         capitalizeAll = ( |
            | 
            copyMutable mapBy: [|:c| c isCapitalized ifTrue: c False: [(c asByte + capitalizationDifference) asCharacter]]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'string' -> () From: ( | {
         'Category: characters\x7fModuleInfo: Module: string InitialContents: FollowSlot\x7fVisibility: private'
        
         charOp: op IsBetween: s1 And: s2 = ( | {
                 'ModuleInfo: Module: string InitialContents: FollowSlot'
                
                 b.
                } 
            | 
            b: asByteFor: op.
            (s1 <= b) && [s2 >= b]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'string' -> () From: ( | {
         'Category: characters\x7fModuleInfo: Module: string InitialContents: FollowSlot\x7fVisibility: public'
        
         characterFor: i IfFail: fb = ( |
            | ascii at: i IfAbsent: fb).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'string' -> () From: ( | {
         'Category: characters\x7fModuleInfo: Module: string InitialContents: FollowSlot\x7fVisibility: private'
        
         controlCharacterDifference = 96.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'string' -> () From: ( | {
         'Category: printing\x7fCategory: copying with ellipses\x7fComment: copies at most n characters.
Places ellipsis at beginning if ellipFraction is 0,
end if ellipFraction is 1. -- dmu\x7fModuleInfo: Module: string InitialContents: FollowSlot\x7fVisibility: public'
        
         copyAtMost: n WithEllipsisAt: ellipFraction = ( |
             ellipsis = '...'.
             f.
             l.
             nme.
             r.
            | 
            n    <= ellipsis size  ifTrue: [^ellipsis].
            size <= n              ifTrue: [^copy].
            ellipsis size >= n     ifTrue: [^ellipsis copySize: n].
            nme: n - ellipsis size.
            f: nme * ellipFraction.
            f: f asInteger.
            l: nme - f.
            (copySize: f), ellipsis, (copyFrom: size - l)).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'string' -> () From: ( | {
         'Category: printing\x7fCategory: copying with ellipses\x7fModuleInfo: Module: string InitialContents: FollowSlot\x7fVisibility: public'
        
         copyAtMostWithEllipsis: n = ( |
            | 
            copyAtMost: n WithEllipsisAt: 0.5).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'string' -> () From: ( | {
         'Category: printing\x7fCategory: copying with ellipses\x7fModuleInfo: Module: string InitialContents: FollowSlot\x7fVisibility: public'
        
         copyAtMostWithLeadingEllipsis: n = ( |
            | 
            copyAtMost: n WithEllipsisAt: 0).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'string' -> () From: ( | {
         'Category: running\x7fModuleInfo: Module: string InitialContents: FollowSlot\x7fVisibility: public'
        
         copyAtMostWithTrailingEllipsis: n = ( |
            | 
            copyAtMost: n WithEllipsisAt: 1).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'string' -> () From: ( | {
         'Category: copying\x7fModuleInfo: Module: string InitialContents: FollowSlot\x7fVisibility: public'
        
         copyNullTerminated = ( |
            | 
            "Copy and add a trailing '\0' character,
             unless the string already ends in a '\0'."
            isNullTerminated
                ifTrue: [ copy ] 
                 False: [ copySize: size + 1 FillingWith: '\0' ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'string' -> () From: ( | {
         'Category: padding\x7fModuleInfo: Module: string InitialContents: FollowSlot\x7fVisibility: private'
        
         defaultTabWidth = 8.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'string' -> () From: ( | {
         'Category: padding\x7fModuleInfo: Module: string InitialContents: FollowSlot\x7fVisibility: public'
        
         detabified = ( |
            | detabified: defaultTabWidth).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'string' -> () From: ( | {
         'Category: padding\x7fModuleInfo: Module: string InitialContents: FollowSlot\x7fVisibility: public'
        
         detabified: tabWidth = ( | {
                 'ModuleInfo: Module: string InitialContents: FollowSlot'
                
                 n.
                }  {
                 'ModuleInfo: Module: string InitialContents: FollowSlot'
                
                 newLine <- 0.
                }  {
                 'ModuleInfo: Module: string InitialContents: FollowSlot'
                
                 r.
                }  {
                 'ModuleInfo: Module: string InitialContents: FollowSlot'
                
                 ri <- 0.
                } 
            | 
            n: occurrencesOf: '\t'.
            0 = n  ifTrue: [^self].
            r: copySize: size + (tabWidth pred * n).
            do: [ | :c. :i. |
                '\t' = c ifFalse: [
                    r at: ri Put: c.
                    ri: ri succ.
                    '\n' = c ifTrue: [ newLine: ri ].
                ] True: [
                    tabWidth - ((ri - newLine) % tabWidth) do: [
                        r at: ri Put: ' '.
                        ri: ri succ.
                    ].
                ].
            ].
            ri = r size ifTrue: [ r ] False: [ r copySize: ri ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'string' -> () From: ( | {
         'Category: comparing\x7fComment: must be public! _\x7fModuleInfo: Module: string InitialContents: FollowSlot\x7fVisibility: public'
        
         equalsCanonicalString: s = ( |
            | = s).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'string' -> () From: ( | {
         'Category: printing\x7fModuleInfo: Module: string InitialContents: FollowSlot\x7fVisibility: private'
        
         escapeCharacterForStoreString = ( |
            | 
            " convert one character in a store string "
            "Some non-printables appear unescaped for formatting."

            = '\n'           ifTrue: [^ self].   
            = '\t'           ifTrue: [^ self].   

            isPrintable not  ifTrue: [^ asEscapeSequence].

            "Some printables must be escaped to parse correctly."
            'emacsHack \"'.

            = '\"'           ifTrue: [^ asEscapeSequence].
            = '\''           ifTrue: [^ asEscapeSequence].
            = '\\'           ifTrue: [^ asEscapeSequence].

            self "nothing special").
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'string' -> () From: ( | {
         'Category: transforming\x7fModuleInfo: Module: string InitialContents: FollowSlot\x7fVisibility: public'
        
         escaped = ( |
             escapeCodes = 'nr\\tfvba\"\'?'.
             escapees = '

\\	\f\v\b\a\"\'?'.
             r <- ''.
            | 

            "return escape sequence for the string"
            do: [| :c | 
                (escapees includes: c) ifTrue: [
                    r: r, '\\', (escapeCodes at: (escapees keyAt: c)).
                ] False: [
                    r: r, c.
                ].
            ].
            r).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'string' -> () From: ( | {
         'Category: evaluation\x7fCategory: basic\x7fCategory: parsing and running\x7fModuleInfo: Module: string InitialContents: FollowSlot\x7fVisibility: public'
        
         eval = ( |
            | 
            evalIfFail: [|:e| error: 'couldn\'t parse: ', e printString]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'string' -> () From: ( | {
         'Category: evaluation\x7fCategory: basic\x7fCategory: parsing and running\x7fModuleInfo: Module: string InitialContents: FollowSlot\x7fVisibility: public'
        
         evalIfFail: block = ( |
            | 
            evalInContext: (reflect: lobby) FileName: '<eval>' IfFail: block).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'string' -> () From: ( | {
         'Category: evaluation\x7fCategory: basic\x7fCategory: parsing and running\x7fModuleInfo: Module: string InitialContents: FollowSlot\x7fVisibility: public'
        
         evalInContext: c FileName: name = ( |
            | 
            evalInContext: c FileName: name
                   IfFail: [|:e| error: 'couldn\'t parse: ', e printString ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'string' -> () From: ( | {
         'Category: evaluation\x7fCategory: basic\x7fCategory: parsing and running\x7fModuleInfo: Module: string InitialContents: FollowSlot\x7fVisibility: public'
        
         evalInContext: ctxt FileName: name IfFail: block = ( |
             m.
            | 
            m: parseObjectBodyFileName: name IfFail: [ | :e | ^ block value: e ].
            m isReflecteeMethod ifTrue: [ ctxt evaluate: m ]
                                 False: [ m reflectee ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'string' -> () From: ( | {
         'Category: evaluation\x7fCategory: advanced\x7fModuleInfo: Module: string InitialContents: FollowSlot\x7fVisibility: public'
        
         evalObjectBodyInContext: context Prefix: pre Postfix: post ReportingTo: aResultReporter = ( |
             p.
            | 
            scheduler isRunning ifFalse: [
              ^ riskyEvalObjBodyContext: context Prefix: pre Postfix: post ReportingTo: aResultReporter.
            ].
            p: process copySend: 
              message copy receiver: self
                           Selector: 'riskyEvalObjBodyContext:Prefix:Postfix:ReportingTo:'
                           With: context With: pre With: post With: aResultReporter.
            p causeOfBirth: self.
            p resume waitForSuspension.
            p causeOfDeath = 'terminated'
              ifFalse: [ aResultReporter failedInProcess: p ].

            aResultReporter).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'string' -> () From: ( | {
         'Category: evaluation\x7fCategory: advanced\x7fModuleInfo: Module: string InitialContents: FollowSlot\x7fVisibility: public'
        
         evalObjectBodyInContext: context ReportingTo: aResultReporter = ( |
            | 
            evalObjectBodyInContext: context Prefix: '' Postfix: ''ReportingTo: aResultReporter).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'string' -> () From: ( | {
         'Category: copying\x7fModuleInfo: Module: string InitialContents: FollowSlot\x7fVisibility: private'
        
         filler = ' '.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'string' -> () From: ( | {
         'Category: characters\x7fModuleInfo: Module: string InitialContents: FollowSlot\x7fVisibility: private'
        
         firstByte = ( |
            | byteAt: firstKey).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'string' -> () From: ( | {
         'Category: characters\x7fModuleInfo: Module: string InitialContents: FollowSlot\x7fVisibility: private'
        
         firstByte: b = ( |
            | at: firstKey PutByte: b).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'string' -> () From: ( | {
         'Category: lines\x7fModuleInfo: Module: string InitialContents: FollowSlot\x7fVisibility: public'
        
         firstLine = ( |
            | 
            do: [|:c. :i| c isLineBreak ifTrue: [^ copyAtMost: i]].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'string' -> () From: ( | {
         'Category: transforming\x7fModuleInfo: Module: string InitialContents: FollowSlot\x7fVisibility: public'
        
         fixLineBreaksForPrinting = ( |
            | os fixLineBreaksForPrinting: self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'string' -> () From: ( | {
         'Category: transforming\x7fModuleInfo: Module: string InitialContents: FollowSlot\x7fVisibility: public'
        
         flatString = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'string' -> () From: ( | {
         'Category: parsing messages\x7fComment: Used by UIs to extract
a selector from an expression
in a method that the user selects.
-- Ungar, 12/22/94\x7fModuleInfo: Module: string InitialContents: FollowSlot\x7fVisibility: public'
        
         getSelectorFromExpression = ( |
            | 
            "should use ASTs; this way depends on how parser
             orders literals"

            "An exception: if the text contains a *,
             assume it is for a pattern, do not try to parse it
             because you just get a *, very annoyingly -- dmu 11/99"
            findFirst: [|:c| '*' = c]  IfPresent: [^ self].

            ( parseObjectBodyIfFail: [  "user selected an expression"
            "maybe user left off last arg"
                ( , ' nothing') parseObjectBodyIfFail: [ 
                ^ shrinkwrapped]]
            ) literals last).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'string' -> () From: ( | {
         'Category: comparing\x7fModuleInfo: Module: string InitialContents: FollowSlot\x7fVisibility: public'
        
         hash = ( |
            | canonicalize identityHash).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'string' -> () From: ( | {
         'Category: transforming\x7fModuleInfo: Module: string InitialContents: FollowSlot\x7fVisibility: public'
        
         hexAsInteger = ( |
            | 
            hexAsIntegerIfFail: [ error: 'not a hexadecimal number' ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'string' -> () From: ( | {
         'Category: transforming\x7fModuleInfo: Module: string InitialContents: FollowSlot\x7fVisibility: public'
        
         hexAsIntegerIfFail: b = ( |
            | 
            asIntegerParseWith: [ | :n. :digit. r |
                digit isDigit ifTrue: [
                    r: (digit asByte - '0' asByte).
                ] False: [
                    ('a' <= digit) && [digit <= 'f'] ifTrue: [
                    r: 10 + (digit asByte - 'a' asByte).
                ] False: [
                    ('A' <= digit) && [digit <= 'F'] ifTrue: [
                    r: 10 + (digit asByte - 'A' asByte).
                ] False: [
                    ^ b value.
                ]]].
                (n * 16) + r ]
              IfFail: b).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'string' -> () From: ( | {
         'Category: padding\x7fComment: Indent the receiver string by given number of
whitespaces. Indents all lines of the string,
except empty lines.\x7fModuleInfo: Module: string InitialContents: FollowSlot\x7fVisibility: public'
        
         indent: amount = ( |
             i <- 0.
             indentStr <- ''.
             j <- 0.
             lim <- 0.
             res <- ''.
            | 
            (0 = amount) || [= ''] ifTrue: [^ self].
            indentStr: ('' copySize: amount).
            lim: size.
            [i < lim] whileTrue: [
                j: i.
                [(j < lim) && ['\n' != (at: j)]] whileTrue: [
                    j: 1 + j.
                ].
                i = j ifTrue: [
                    res: res & '\n'.   "Don't indent empty lines."
                ] False: [
                    res: res & indentStr & (copyFrom: i UpTo: j).
                    j != lim ifTrue: [res: res & '\n'].
                ].
                i: 1 + j.
            ].
            res flatString).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'string' -> () From: ( | {
         'Category: characters\x7fModuleInfo: Module: string InitialContents: FollowSlot\x7fVisibility: public'
        
         initializeAscii = ( |
            | 
            ascii mapBy: [|:v. :i|
                (mutableString copySize: 1 FillingWith: i) canonicalize
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'string' -> () From: ( | {
         'Category: printing\x7fModuleInfo: Module: string InitialContents: FollowSlot\x7fVisibility: private'
        
         initializeCachedStoreCharacters = ( |
            | 
            cachedStoreCharacters mapBy: [|:v. :i| 
                i asCharacter escapeCharacterForStoreString.
            ].
            cachedStoreCharacterSizes mapBy: [|:v. :i|
                (cachedStoreCharacters at: i) size
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'string' -> () From: ( | {
         'Category: padding\x7fModuleInfo: Module: string InitialContents: FollowSlot\x7fVisibility: public'
        
         isAllWhiteSpace = ( |
            | 
            allSatisfy: [|:v| whiteSpace includes: v]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'string' -> () From: ( | {
         'Category: comparing\x7fModuleInfo: Module: string InitialContents: FollowSlot\x7fVisibility: public'
        
         isCanonical = bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'string' -> () From: ( | {
         'Category: casing\x7fModuleInfo: Module: string InitialContents: FollowSlot\x7fVisibility: public'
        
         isCapitalized = ( |
            | first isUpperCase).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'string' -> () From: ( | {
         'Category: characters\x7fModuleInfo: Module: string InitialContents: FollowSlot\x7fVisibility: public'
        
         isControlCharacter = ( |
            | 
            charOp: 'isControlCharacter' IsBetween: minControlCharByte And: maxControlCharByte).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'string' -> () From: ( | {
         'Category: characters\x7fModuleInfo: Module: string InitialContents: FollowSlot\x7fVisibility: public'
        
         isDigit = ( |
            | 
            charOp: 'isDigit' IsBetween: minDigitByte And: maxDigitByte).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'string' -> () From: ( | {
         'Category: characters\x7fModuleInfo: Module: string InitialContents: FollowSlot\x7fVisibility: public'
        
         isLetter = ( |
            | isUpperCase || isLowerCase).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'string' -> () From: ( | {
         'Category: characters\x7fModuleInfo: Module: string InitialContents: FollowSlot\x7fVisibility: public'
        
         isLineBreak = ( | {
                 'ModuleInfo: Module: string InitialContents: FollowSlot'
                
                 b.
                } 
            | 
            b: asByteFor: 'isLineBreak'.
            (b = '\r' asByte) ||[b = '\n' asByte]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'string' -> () From: ( | {
         'Category: characters\x7fModuleInfo: Module: string InitialContents: FollowSlot\x7fVisibility: public'
        
         isLowerCase = ( |
            | 
            charOp: 'isLowerCase' IsBetween: minLCByte And: maxLCByte).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'string' -> () From: ( | {
         'Category: comparing\x7fModuleInfo: Module: string InitialContents: FollowSlot\x7fVisibility: public'
        
         isNullTerminated = ( |
            | nonEmpty && [last = '\0']).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'string' -> () From: ( | {
         'Category: characters\x7fModuleInfo: Module: string InitialContents: FollowSlot\x7fVisibility: public'
        
         isPrintable = ( |
            | 
            charOp: 'isPrintable' IsBetween: minPrintableByte 
                And: maxPrintableByte).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'string' -> () From: ( | {
         'Category: casing\x7fModuleInfo: Module: string InitialContents: FollowSlot\x7fVisibility: public'
        
         isUncapitalized = ( |
            | first isLowerCase).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'string' -> () From: ( | {
         'Category: characters\x7fModuleInfo: Module: string InitialContents: FollowSlot\x7fVisibility: public'
        
         isUpperCase = ( |
            | 
            charOp: 'isUpperCase' IsBetween: minUCByte And: maxUCByte).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'string' -> () From: ( | {
         'Category: characters\x7fModuleInfo: Module: string InitialContents: FollowSlot\x7fVisibility: public'
        
         isVowel = ( |
            | 'aeiouAEIOU' includes: self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'string' -> () From: ( | {
         'Category: characters\x7fModuleInfo: Module: string InitialContents: FollowSlot\x7fVisibility: public'
        
         isWordSeparator = ( |
            | (isLetter || [isDigit || [= ':']]) not).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'string' -> () From: ( | {
         'Category: lines\x7fModuleInfo: Module: string InitialContents: FollowSlot\x7fVisibility: public'
        
         lastLine = ( |
            | 
            reverseDo: [|:c. :i| c isLineBreak ifTrue: [^ copyFrom: i succ]].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'string' -> () From: ( | {
         'Category: padding\x7fModuleInfo: Module: string InitialContents: FollowSlot\x7fVisibility: public'
        
         leadingSpaces = ( |
            | 
            findFirst:   [|:v| ' ' != v]
              IfPresent: [|:v. :i| i]
              IfAbsent:  [size]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'string' -> () From: ( | {
         'Category: padding\x7fModuleInfo: Module: string InitialContents: FollowSlot\x7fVisibility: public'
        
         leadingWhiteSpace = ( |
            | 
            findFirst: [ | :v | (whiteSpace includes: v) not ]
            IfPresent: [ | :v. :i. | i ]
             IfAbsent: [ size ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'string' -> () From: ( | {
         'Category: printing\x7fModuleInfo: Module: string InitialContents: FollowSlot\x7fVisibility: private'
        
         leftBracket = '\''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'string' -> () From: ( | {
         'Category: padding\x7fComment: shrinkwraps left side only\x7fModuleInfo: Module: string InitialContents: FollowSlot\x7fVisibility: public'
        
         leftShrinkwrapped = ( | {
                 'ModuleInfo: Module: string InitialContents: FollowSlot'
                
                 start <- 0.
                } 
            | 
            start: leadingWhiteSpace.
            start >= size ifTrue: [ '' ] False: [ copyFrom: start ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'string' -> () From: ( | {
         'Category: matching\x7fComment: Returns whether the pattern matches the receiver.
? and * may be used as wild cards in the pattern to match a
single character or a sequence of characters.\x7fModuleInfo: Module: string InitialContents: FollowSlot\x7fVisibility: public'
        
         matchesPattern: pattern = ( |
            | 
            matchesPattern: pattern IgnoreCase: false).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'string' -> () From: ( | {
         'Category: matching\x7fComment: Returns whether the pattern matches the receiver.
? and * may be used as wild cards in the pattern to match a
single character or a sequence of characters.\x7fModuleInfo: Module: string InitialContents: FollowSlot\x7fVisibility: public'
        
         matchesPattern: pattern IgnoreCase: case = ( |
             c.
             index <- 0.
             patternIndex <- 0.
             patternSize.
             patternStartScan.
             stringSize.
             stringStartScan.
             t.
            | 

            stringSize:  size. 
            patternSize: pattern size.

            [patternIndex < patternSize] whileTrue: [
              c: pattern at: patternIndex.
              patternIndex:  patternIndex succ.
              c = '*' ifTrue: [
                patternIndex >= patternSize ifTrue: [^true].
                stringStartScan: index.
                patternStartScan: patternIndex.
              ] False: [
                index >= stringSize ifTrue: [^false].
                t: at: index.
                index: index succ.
                (t = c) || [(c = '?') || [case && [t capitalize = c capitalize]]] ifTrue: [
                  (patternIndex >= patternSize) && [index < stringSize] ifTrue: [
                     stringStartScan ifNil: [^false].
                     index: index + (patternStartScan - patternIndex) succ.
                     patternIndex: patternStartScan.
                  ]
                ] False: [
                  stringStartScan ifNil: [^false].
                  index: index + (patternStartScan - patternIndex) succ.
                  patternIndex: patternStartScan]]].
            index >= stringSize).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'string' -> () From: ( | {
         'Category: characters\x7fModuleInfo: Module: string InitialContents: FollowSlot\x7fVisibility: private'
        
         maxControlCharByte = 31.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'string' -> () From: ( | {
         'Category: characters\x7fModuleInfo: Module: string InitialContents: FollowSlot\x7fVisibility: private'
        
         maxDigitByte = 57.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'string' -> () From: ( | {
         'Category: characters\x7fModuleInfo: Module: string InitialContents: FollowSlot\x7fVisibility: private'
        
         maxLCByte = 122.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'string' -> () From: ( | {
         'Category: characters\x7fModuleInfo: Module: string InitialContents: FollowSlot\x7fVisibility: private'
        
         maxPrintableByte = 126.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'string' -> () From: ( | {
         'Category: characters\x7fModuleInfo: Module: string InitialContents: FollowSlot\x7fVisibility: private'
        
         maxUCByte = 90.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'string' -> () From: ( | {
         'Category: characters\x7fModuleInfo: Module: string InitialContents: FollowSlot\x7fVisibility: private'
        
         minControlCharByte = 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'string' -> () From: ( | {
         'Category: characters\x7fModuleInfo: Module: string InitialContents: FollowSlot\x7fVisibility: private'
        
         minDigitByte = 48.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'string' -> () From: ( | {
         'Category: characters\x7fModuleInfo: Module: string InitialContents: FollowSlot\x7fVisibility: private'
        
         minLCByte = 97.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'string' -> () From: ( | {
         'Category: characters\x7fModuleInfo: Module: string InitialContents: FollowSlot\x7fVisibility: private'
        
         minPrintableByte = 32.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'string' -> () From: ( | {
         'Category: characters\x7fModuleInfo: Module: string InitialContents: FollowSlot\x7fVisibility: private'
        
         minUCByte = 65.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'string' -> () From: ( | {
         'Category: padding\x7fModuleInfo: Module: string InitialContents: FollowSlot\x7fVisibility: public'
        
         padOnLeft: len = ( | {
                 'ModuleInfo: Module: string InitialContents: FollowSlot'
                
                 s.
                } 
            | 
            s: self.
            len - size do: [ s: ' ', s ].
            s).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'string' -> () From: ( | {
         'Category: padding\x7fComment: pad with spaces to make string of length len\x7fModuleInfo: Module: string InitialContents: FollowSlot\x7fVisibility: public'
        
         padOnRight: len = ( | {
                 'ModuleInfo: Module: string InitialContents: FollowSlot'
                
                 s.
                } 
            | 
            s: self.
            len - size do: [ s: s, ' ' ].
            s).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'string' -> () From: ( | {
         'ModuleInfo: Module: string InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'byteVector' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'string' -> () From: ( | {
         'Category: evaluation\x7fCategory: basic\x7fCategory: parsing string as a method or object body\x7fModuleInfo: Module: string InitialContents: FollowSlot\x7fVisibility: public'
        
         parseErrorPt = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'string' -> 'parseErrorPt' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits string parseErrorPt.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'string' -> 'parseErrorPt' -> () From: ( | {
         'Category: error token\x7fComment: used when adding a prefix
to the string to be parsed
-- Ungar, 12/25/94\x7fModuleInfo: Module: string InitialContents: FollowSlot\x7fVisibility: public'
        
         adjustForPrefix: pre Body: body Postfix: post = ( |
             nl <- 0.
             r.
            | 
            pre do: [|:c| c = '\n' ifTrue: [nl: nl succ]].
            r: copy.
            nl > 0   ifTrue: [
              r start: start - (0 @ nl).
              r end:   end   - (0 @ nl).
            ] False: [ 
              start y = 0  ifTrue: [ r start: start - (pre size @ 0) ].
              end   y = 0  ifTrue: [ r   end: end   - (pre size @ 0) ].
            ].
            case
             if: [(r start x min: r start y) < 0] Then: [
              r start: 0@0.
              r message: 'In prefix: "', pre, '" ', message.
              (r end x min: r end y) < 0 ifTrue: [
                r end: 0@0.
              ].
            ] Else: [ "should maybe count nls in string and check for past end" ].
            r).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'string' -> 'parseErrorPt' -> () From: ( | {
         'Category: printing\x7fModuleInfo: Module: string InitialContents: FollowSlot\x7fVisibility: public'
        
         collectionName = 'string'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'string' -> 'parseErrorPt' -> () From: ( | {
         'Category: scanner position\x7fComment: 0-origin x and y coordinates
of end of error
-- Ungar, 12/23/94\x7fModuleInfo: Module: string InitialContents: FollowSlot\x7fVisibility: public'
        
         end = ( |
            | 
            scannerColumn pred @ scannerLine pred).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'string' -> 'parseErrorPt' -> () From: ( | {
         'Category: scanner position\x7fModuleInfo: Module: string InitialContents: FollowSlot\x7fVisibility: private'
        
         end: p = ( |
            | scannerColumn: p x succ. scannerLine: p y succ).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'string' -> 'parseErrorPt' -> () From: ( | {
         'Category: error token\x7fModuleInfo: Module: string InitialContents: FollowSlot\x7fVisibility: private'
        
         errorColumn <- 1.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'string' -> 'parseErrorPt' -> () From: ( | {
         'Category: error token\x7fModuleInfo: Module: string InitialContents: FollowSlot\x7fVisibility: private'
        
         errorLine <- 1.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'string' -> 'parseErrorPt' -> () From: ( | {
         'Category: error text\x7fModuleInfo: Module: string InitialContents: FollowSlot'
        
         expecting <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'string' -> 'parseErrorPt' -> () From: ( | {
         'Category: error text\x7fModuleInfo: Module: string InitialContents: FollowSlot'
        
         message <- 'the prototypical syntax error'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'string' -> 'parseErrorPt' -> () From: ( | {
         'ModuleInfo: Module: string InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'clonable' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'string' -> 'parseErrorPt' -> () From: ( | {
         'Category: testing\x7fModuleInfo: Module: string InitialContents: FollowSlot'
        
         prematureEOF = ( |
            | 'premature end of input' = message).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'string' -> 'parseErrorPt' -> () From: ( | {
         'Category: printing\x7fModuleInfo: Module: string InitialContents: FollowSlot'
        
         printString = ( |
            | 
            message,
            (expecting isEmpty ifTrue: '' False: [', expecting: ', expecting ]),
            '.').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'string' -> 'parseErrorPt' -> () From: ( | {
         'Category: scanner position\x7fModuleInfo: Module: string InitialContents: FollowSlot\x7fVisibility: private'
        
         scannerColumn <- 1.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'string' -> 'parseErrorPt' -> () From: ( | {
         'Category: scanner position\x7fModuleInfo: Module: string InitialContents: FollowSlot\x7fVisibility: private'
        
         scannerLine <- 1.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'string' -> 'parseErrorPt' -> () From: ( | {
         'Category: error token\x7fComment: 0-origin x and y coordinates
of start of error
-- Ungar, 12/23/94\x7fModuleInfo: Module: string InitialContents: FollowSlot\x7fVisibility: public'
        
         start = ( |
            | 
            errorColumn pred @ errorLine pred).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'string' -> 'parseErrorPt' -> () From: ( | {
         'Category: error token\x7fModuleInfo: Module: string InitialContents: FollowSlot\x7fVisibility: private'
        
         start: p = ( |
            | errorColumn: p x succ. errorLine: p y succ).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'string' -> () From: ( | {
         'Category: evaluation\x7fCategory: basic\x7fCategory: parsing string as a method or object body\x7fModuleInfo: Module: string InitialContents: FollowSlot\x7fVisibility: public'
        
         parseObjectBody = ( |
            | 
            parseObjectBodyIfFail: [ | :err |
                error: '<', self, '>  ',
                       ' failed & returned: ', err printString ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'string' -> () From: ( | {
         'Category: evaluation\x7fCategory: basic\x7fCategory: parsing string as a method or object body\x7fModuleInfo: Module: string InitialContents: FollowSlot\x7fVisibility: public'
        
         parseObjectBodyFileName: name IfFail: block = ( |
             errObj.
            | 
            errObj: parseErrorPt copy.
            asString
              _ParseObjectFileName: name
                          ErrorObj: errObj
                            IfFail: [|:e|  
                'outOfMemoryError' = e ifTrue: [
                  memory allocationFailedBytes: size * 2.
                  ^parseObjectBodyFileName: name
                                    IfFail: block.
                ] False: [
                  block value: errObj
                ]
              ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'string' -> () From: ( | {
         'Category: evaluation\x7fCategory: basic\x7fCategory: parsing string as a method or object body\x7fModuleInfo: Module: string InitialContents: FollowSlot\x7fVisibility: public'
        
         parseObjectBodyIfFail: block = ( |
            | 
            parseObjectBodyFileName: '<a string>' IfFail: block).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'string' -> () From: ( | {
         'ModuleInfo: Module: string InitialContents: FollowSlot\x7fVisibility: private'
        
         parseObjectIntoPositionTableIfFail: fb = ( |
            | 
             _ParseObjectIntoPositionTableIfFail: [|:e|
                    ^ fb value: e.
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'string' -> () From: ( | {
         'Category: characters\x7fModuleInfo: Module: string InitialContents: FollowSlot\x7fVisibility: public'
        
         pred = ( |
            | predecessor).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'string' -> () From: ( | {
         'Category: characters\x7fModuleInfo: Module: string InitialContents: FollowSlot\x7fVisibility: public'
        
         predecessor = ( |
            | ascii at: (asByteFor: 'predecessor') predecessor).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'string' -> () From: ( | {
         'ModuleInfo: Module: string InitialContents: FollowSlot\x7fVisibility: public'
        
         prependAOrAn = ( |
            | 
            (first isVowel ifTrue: [
              first = 'u'   ifTrue: [
                ( size = 1 )                       ||
                ((size >= 2) && [(at: 1) isVowel]) || 
                ((size >= 3) && [(at: 2) isVowel])  
                  ifTrue: 'a '
                  False:  'an '
              ] False:    'an ' 
            ] False:      'a '
            ), self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'string' -> () From: ( | {
         'Category: printing\x7fComment: print must be overridden here to avoid endless recursive calls
         to printString. The recursion bottoms out by using the _StringPrint
         primitive. This leads to a subtle (but desirable) difference between
         the expressions \'myString printString print\' and \'myString print\'.
         The first expression prints the string delimiters whereas the
         second does not.\x7fModuleInfo: Module: string InitialContents: FollowSlot\x7fVisibility: public'
        
         print = ( |
            | 
            scheduler isRunning
              ifTrue: [stdout write: fixLineBreaksForPrinting] 
               False: [asString _StringPrint].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'string' -> () From: ( | {
         'Category: printing\x7fModuleInfo: Module: string InitialContents: FollowSlot\x7fVisibility: public'
        
         printString = ( |
            | 
            leftBracket, self, rightBracket).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'string' -> () From: ( | {
         'Category: printing\x7fModuleInfo: Module: string InitialContents: FollowSlot\x7fVisibility: public'
        
         printStringSize: s = ( | {
                 'ModuleInfo: Module: string InitialContents: FollowSlot'
                
                 bsz.
                } 
            | 
            bsz: leftBracket size + rightBracket size.
            leftBracket,    
            (copyAtMostWithEllipsis: (s - bsz  max: 0)), 
            rightBracket).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'string' -> () From: ( | {
         'Category: printing\x7fModuleInfo: Module: string InitialContents: FollowSlot\x7fVisibility: private'
        
         prototype = ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'string' -> () From: ( | {
         'Category: evaluation\x7fCategory: advanced\x7fModuleInfo: Module: string InitialContents: FollowSlot\x7fVisibility: public'
        
         resultReporter = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'string' -> 'resultReporter' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits string resultReporter.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'string' -> 'resultReporter' -> () From: ( | {
         'Comment: Put it up at this level
so fork can set it.
-- Ungar, 1/11/95\x7fModuleInfo: Module: string InitialContents: InitializeToExpression: (nil)\x7fVisibility: public'
        
         event.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'string' -> 'resultReporter' -> () From: ( | {
         'ModuleInfo: Module: string InitialContents: FollowSlot\x7fVisibility: public'
        
         failedInProcess: p = ( |
            | 
            p printLine.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'string' -> 'resultReporter' -> () From: ( | {
         'ModuleInfo: Module: string InitialContents: FollowSlot\x7fVisibility: public'
        
         finished = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'string' -> 'resultReporter' -> () From: ( | {
         'ModuleInfo: Module: string InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'clonable' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'string' -> 'resultReporter' -> () From: ( | {
         'Category: error reporting\x7fModuleInfo: Module: string InitialContents: FollowSlot\x7fVisibility: public'
        
         reportError: errObj Title: t = ( |
            | 
            (t, ': ', errObj printString) printLine.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'string' -> 'resultReporter' -> () From: ( | {
         'ModuleInfo: Module: string InitialContents: FollowSlot\x7fVisibility: public'
        
         started = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'string' -> 'resultReporter' -> () From: ( | {
         'ModuleInfo: Module: string InitialContents: FollowSlot\x7fVisibility: public'
        
         starting = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'string' -> 'resultReporter' -> () From: ( | {
         'ModuleInfo: Module: string InitialContents: FollowSlot\x7fVisibility: public'
        
         succeededReturning: result = ( |
            | 
            result printLine.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'string' -> 'resultReporter' -> () From: ( | {
         'Category: error reporting\x7fModuleInfo: Module: string InitialContents: FollowSlot\x7fVisibility: public'
        
         syntaxError: err = ( |
            | 
            reportError: err Title: 'Syntax Error').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'string' -> () From: ( | {
         'Category: printing\x7fModuleInfo: Module: string InitialContents: FollowSlot\x7fVisibility: private'
        
         rightBracket = '\''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'string' -> () From: ( | {
         'Category: evaluation\x7fCategory: advanced\x7fModuleInfo: Module: string InitialContents: FollowSlot'
        
         riskyEvalObjBodyContext: context Prefix: pre Postfix: post ReportingTo: aResultReporter = ( |
             mess.
             mirr.
            | 
            " parsing may crash process: (e.g.: | snort = 1 / 0 | 3 + 4)"

            mirr: (pre, self, post) parseObjectBodyIfFail: [| :err. |
            ^  aResultReporter syntaxError: err adjustForPrefix: pre Body: self Postfix: post
            ].
            aResultReporter succeededReturning:
              mirr isReflecteeMethod
                ifTrue: [ context evaluate: mirr ]
                 False: [ mirr reflectee ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'string' -> () From: ( | {
         'Category: running\x7fModuleInfo: Module: string InitialContents: FollowSlot\x7fVisibility: public'
        
         runScript = ( |
            | runScriptIfFail: [|:e. :n| error: n, ' error: ', e]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'string' -> () From: ( | {
         'Category: running\x7fModuleInfo: Module: string InitialContents: FollowSlot\x7fVisibility: public'
        
         runScriptIfFail: fb = ( |
            | _RunScriptIfFail: fb).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'string' -> () From: ( | {
         'Comment: behavior for performs\x7fModuleInfo: Module: string InitialContents: FollowSlot\x7fVisibility: private'
        
         sendingParent* = bootstrap stub -> 'traits' -> 'sending' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'string' -> () From: ( | {
         'Category: padding\x7fModuleInfo: Module: string InitialContents: FollowSlot\x7fVisibility: public'
        
         shrinkwrapped = ( | {
                 'ModuleInfo: Module: string InitialContents: FollowSlot'
                
                 start <- 0.
                }  {
                 'ModuleInfo: Module: string InitialContents: FollowSlot'
                
                 stop <- 0.
                } 
            | 
            start: leadingWhiteSpace.
            stop: size - trailingWhiteSpace.
            start >= size ifTrue: [ '' ] False: [ copyFrom: start UpTo: stop ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'string' -> () From: ( | {
         'Category: printing\x7fModuleInfo: Module: string InitialContents: FollowSlot\x7fVisibility: public'
        
         storeStringIfFail: fb = ( | {
                 'ModuleInfo: Module: string InitialContents: FollowSlot'
                
                 len <- 0.
                }  {
                 'ModuleInfo: Module: string InitialContents: FollowSlot'
                
                 outputIndex <- 0.
                }  {
                 'ModuleInfo: Module: string InitialContents: FollowSlot'
                
                 r <- ''.
                } 
            | 
            " return a string suitable for embedding in a file which will then
              parse back to the original string "

            false ifTrue: [
                "less optimized code:"
                do: [|:c | r: r, cachedStoreCharacters at: c asByte. ].
                '\'', r, '\''.
            ].

            " use two passes to go faster"
            size do: [|:i.| 
                len: len + (cachedStoreCharacterSizes at: byteAt: i).
            ].
            r: mutableString copySize: len + 2.
            r at: 0 Put: '\''.
            len = size ifTrue: [ "an optimization"
                size do: [|:i| r at: i succ PutByte: byteAt: i].
            ] False: [
                outputIndex: 1.
                size do: [|:i. t|
                    t: cachedStoreCharacters at: byteAt: i.
                    t size do: [|:j|
                        r at: outputIndex PutByte: t byteAt: j.
                        outputIndex: outputIndex succ.
                    ].
                ].
            ].
            r at: r size pred Put: '\''.
            r).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'string' -> () From: ( | {
         'Category: printing\x7fComment: allow \'\' for storeString of empty string, a must for the new transporter\x7fModuleInfo: Module: string InitialContents: FollowSlot\x7fVisibility: public'
        
         storeStringNeeds = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'string' -> 'storeStringNeeds' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits string storeStringNeeds.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'string' -> () From: ( | {
         'Category: characters\x7fModuleInfo: Module: string InitialContents: FollowSlot\x7fVisibility: public'
        
         succ = ( |
            | successor).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'string' -> () From: ( | {
         'Category: characters\x7fModuleInfo: Module: string InitialContents: FollowSlot\x7fVisibility: public'
        
         successor = ( |
            | ascii at: (asByteFor: 'successor'  ) successor).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'string' -> () From: ( | {
         'Category: padding\x7fModuleInfo: Module: string InitialContents: FollowSlot\x7fVisibility: private'
        
         trailingWhiteSpace = ( |
            | 
            size pred downTo: 0 Do: [ | :i |
                (whiteSpace includes: (at: i)) ifFalse: [ ^ size pred - i ] ].
            size).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'string' -> () From: ( | {
         'Category: casing\x7fModuleInfo: Module: string InitialContents: FollowSlot\x7fVisibility: public'
        
         uncapitalize = ( |
            | 
            isEmpty ifTrue: [ ^ self ].
            isCapitalized ifFalse: self True: [
                copyMutable firstByte: firstByte - capitalizationDifference]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'string' -> () From: ( | {
         'Category: casing\x7fModuleInfo: Module: string InitialContents: FollowSlot\x7fVisibility: public'
        
         uncapitalizeAll = ( |
            | 
            copyMutable mapBy: [|:c| c isCapitalized ifFalse: c True: [(c asByte - capitalizationDifference) asCharacter]]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'string' -> () From: ( | {
         'Category: padding\x7fModuleInfo: Module: string InitialContents: FollowSlot\x7fVisibility: private'
        
         whiteSpace = ' 	

'.
        } | ) 



 '-- Sub parts'

 bootstrap read: 'stringTests' From: 'core'



 '-- Side effects'

 globals modules string postFileIn
