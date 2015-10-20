 'Sun-$Revision: 30.7 $'
 '
Copyright 1992-2012 AUTHORS.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: termcap InitialContents: FollowSlot'
        
         termcap = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'termcap' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'comment' From:
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'termcap' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules termcap.

CopyDowns:
globals modules init. copy 
SlotsToOmit: comment directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'termcap' -> () From: ( | {
         'ModuleInfo: Module: termcap InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'core'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'termcap' -> () From: ( | {
         'ModuleInfo: Module: termcap InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'termcap' -> () From: ( | {
         'ModuleInfo: Module: termcap InitialContents: FollowSlot'
        
         myComment <- 'termcap.self provides a self interface to the unix termcap library.
             The interface uses foreign function to dynamic load the wrapper
             c functions described in termcap.c.
             For a description of unix termcap try: man 3 termcap and man 5 termcap. 
             Due to the lack of call back function the function tputs is not
             supported by this interface. (3/5/92) LB'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'termcap' -> () From: ( | {
         'ModuleInfo: Module: termcap InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- 'Sun-$Revision: 30.7 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'termcap' -> () From: ( | {
         'ModuleInfo: Module: termcap InitialContents: FollowSlot\x7fVisibility: public'
        
         subpartNames <- '
	 termcap_wrappers
	 '.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: platform\x7fCategory: host and filesystem\x7fModuleInfo: Module: termcap InitialContents: FollowSlot\x7fVisibility: public'
        
         termcap = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'termcap' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals termcap.
\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'termcap' -> () From: ( | {
         'Comment: globals for capabilities\x7fModuleInfo: Module: termcap InitialContents: FollowSlot\x7fVisibility: private'
        
         booleanCapability = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'termcap' -> 'booleanCapability' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals termcap booleanCapability.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'termcap' -> 'booleanCapability' -> () From: ( | {
         'ModuleInfo: Module: termcap InitialContents: FollowSlot\x7fVisibility: public'
        
         ident = ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'termcap' -> () From: ( | {
         'Comment: traits for capabilities\x7fModuleInfo: Module: termcap InitialContents: FollowSlot\x7fVisibility: public'
        
         booleanCapabilityTraits = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'termcap' -> 'booleanCapabilityTraits' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits termcap booleanCapabilityTraits.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'termcap' -> 'booleanCapability' -> () From: ( | {
         'ModuleInfo: Module: termcap InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'termcap' -> 'booleanCapabilityTraits' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'termcap' -> 'booleanCapability' -> () From: ( | {
         'ModuleInfo: Module: termcap InitialContents: FollowSlot\x7fVisibility: public'
        
         value <- bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'termcap' -> () From: ( | {
         'Comment: globals for capabilities\x7fModuleInfo: Module: termcap InitialContents: FollowSlot\x7fVisibility: public'
        
         stringCapability = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'termcap' -> 'stringCapability' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals termcap stringCapability.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'termcap' -> 'stringCapability' -> () From: ( | {
         'ModuleInfo: Module: termcap InitialContents: FollowSlot\x7fVisibility: public'
        
         delay <- 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'termcap' -> 'stringCapability' -> () From: ( | {
         'ModuleInfo: Module: termcap InitialContents: FollowSlot\x7fVisibility: public'
        
         ident = ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'termcap' -> 'stringCapability' -> () From: ( | {
         'ModuleInfo: Module: termcap InitialContents: FollowSlot\x7fVisibility: public'
        
         isPresent <- bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'termcap' -> () From: ( | {
         'ModuleInfo: Module: termcap InitialContents: FollowSlot\x7fVisibility: public'
        
         stringCapabilityTraits = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'termcap' -> 'stringCapabilityTraits' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits termcap stringCapabilityTraits.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'termcap' -> 'stringCapability' -> () From: ( | {
         'ModuleInfo: Module: termcap InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'termcap' -> 'stringCapabilityTraits' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'termcap' -> 'stringCapability' -> () From: ( | {
         'ModuleInfo: Module: termcap InitialContents: FollowSlot\x7fVisibility: public'
        
         value <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'termcap' -> 'numericCapabilityTraits' -> () From: ( | {
         'ModuleInfo: Module: termcap InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'termcap' -> 'numericCapabilityTraits' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits termcap numericCapabilityTraits parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'termcap' -> 'numericCapabilityTraits' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: termcap InitialContents: FollowSlot\x7fVisibility: public'
        
         init = ( |
            | error: 'A child should implement this message').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'termcap' -> 'numericCapabilityTraits' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: termcap InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'clonable' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'termcap' -> 'stringCapabilityTraits' -> () From: ( | {
         'ModuleInfo: Module: termcap InitialContents: FollowSlot\x7fVisibility: private'
        
         filterString: string Delay: blk = ( |
            | 
            string isEmpty ifTrue: [^string].
            string findFirst: [ | :v | v isDigit not ]
                   IfPresent: [ | :v. :i | 
                      i > 0 ifTrue: [ 
                           blk value: (string copySize: i) asInteger].
                      string copyFrom: i]
                    IfAbsent: [ blk value: string asInteger. '']).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'termcap' -> 'stringCapabilityTraits' -> () From: ( | {
         'ModuleInfo: Module: termcap InitialContents: FollowSlot\x7fVisibility: public'
        
         init = ( |
            | 
            value: filterString: (termcap getstr: ident
                                          IfFail: [^isPresent: false])
                          Delay: [|:f| delay: f ].
            isPresent: true).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'termcap' -> 'stringCapabilityTraits' -> () From: ( | {
         'ModuleInfo: Module: termcap InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'termcap' -> 'numericCapabilityTraits' -> 'parent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'termcap' -> 'stringCapabilityTraits' -> () From: ( | {
         'ModuleInfo: Module: termcap InitialContents: FollowSlot\x7fVisibility: public'
        
         print = ( |
            | 
            isPresent ifTrue: [
                value print.
                delay > 0 ifTrue: [ process this sleep: delay ] ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'termcap' -> () From: ( | {
         'ModuleInfo: Module: termcap InitialContents: FollowSlot\x7fVisibility: public'
        
         clearScreen = bootstrap define: bootstrap stub -> 'globals' -> 'termcap' -> 'clearScreen' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'ident' From:
             globals termcap stringCapability copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'termcap' -> 'clearScreen' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals termcap clearScreen.

CopyDowns:
globals termcap stringCapability. copy 
SlotsToOmit: ident.

'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'termcap' -> 'clearScreen' -> () From: ( | {
         'ModuleInfo: Module: termcap InitialContents: FollowSlot\x7fVisibility: public'
        
         ident = 'cl'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'termcap' -> () From: ( | {
         'ModuleInfo: Module: termcap InitialContents: FollowSlot\x7fVisibility: public'
        
         clearToEndOfLine = bootstrap define: bootstrap stub -> 'globals' -> 'termcap' -> 'clearToEndOfLine' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'ident' From:
             globals termcap stringCapability copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'termcap' -> 'clearToEndOfLine' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals termcap clearToEndOfLine.

CopyDowns:
globals termcap stringCapability. copy 
SlotsToOmit: ident.

'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'termcap' -> 'clearToEndOfLine' -> () From: ( | {
         'ModuleInfo: Module: termcap InitialContents: FollowSlot\x7fVisibility: public'
        
         ident = 'ce'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'termcap' -> () From: ( | {
         'ModuleInfo: Module: termcap InitialContents: FollowSlot\x7fVisibility: public'
        
         endStandout = bootstrap define: bootstrap stub -> 'globals' -> 'termcap' -> 'endStandout' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'ident' From:
             globals termcap stringCapability copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'termcap' -> 'endStandout' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals termcap endStandout.

CopyDowns:
globals termcap stringCapability. copy 
SlotsToOmit: ident.

'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'termcap' -> 'endStandout' -> () From: ( | {
         'ModuleInfo: Module: termcap InitialContents: FollowSlot\x7fVisibility: public'
        
         ident = 'se'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'termcap' -> () From: ( | {
         'ModuleInfo: Module: termcap InitialContents: FollowSlot\x7fVisibility: public'
        
         endTermcapMode = bootstrap define: bootstrap stub -> 'globals' -> 'termcap' -> 'endTermcapMode' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'ident' From:
             globals termcap stringCapability copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'termcap' -> 'endTermcapMode' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals termcap endTermcapMode.

CopyDowns:
globals termcap stringCapability. copy 
SlotsToOmit: ident.

'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'termcap' -> 'endTermcapMode' -> () From: ( | {
         'ModuleInfo: Module: termcap InitialContents: FollowSlot\x7fVisibility: public'
        
         ident = 'te'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'termcap' -> () From: ( | {
         'ModuleInfo: Module: termcap InitialContents: FollowSlot\x7fVisibility: public'
        
         endUnderscore = bootstrap define: bootstrap stub -> 'globals' -> 'termcap' -> 'endUnderscore' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'ident' From:
             globals termcap stringCapability copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'termcap' -> 'endUnderscore' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals termcap endUnderscore.

CopyDowns:
globals termcap stringCapability. copy 
SlotsToOmit: ident.

'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'termcap' -> 'endUnderscore' -> () From: ( | {
         'ModuleInfo: Module: termcap InitialContents: FollowSlot\x7fVisibility: public'
        
         ident = 'ue'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'termcap' -> () From: ( | {
         'ModuleInfo: Module: termcap InitialContents: FollowSlot\x7fVisibility: public'
        
         goto = bootstrap define: bootstrap stub -> 'globals' -> 'termcap' -> 'goto' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'ident' From:
             globals termcap stringCapability copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'termcap' -> 'goto' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals termcap goto.

CopyDowns:
globals termcap stringCapability. copy 
SlotsToOmit: ident.

'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'termcap' -> 'goto' -> () From: ( | {
         'ModuleInfo: Module: termcap InitialContents: FollowSlot\x7fVisibility: public'
        
         ident = 'cm'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'termcap' -> () From: ( | {
         'Comment: globals for capabilities\x7fModuleInfo: Module: termcap InitialContents: FollowSlot\x7fVisibility: public'
        
         numericCapability = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'termcap' -> 'numericCapability' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals termcap numericCapability.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'termcap' -> 'numericCapability' -> () From: ( | {
         'ModuleInfo: Module: termcap InitialContents: FollowSlot\x7fVisibility: public'
        
         ident = ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'termcap' -> 'numericCapability' -> () From: ( | {
         'ModuleInfo: Module: termcap InitialContents: FollowSlot\x7fVisibility: public'
        
         isPresent <- bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'termcap' -> () From: ( | {
         'ModuleInfo: Module: termcap InitialContents: FollowSlot\x7fVisibility: public'
        
         numericCapabilityTraits = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'termcap' -> 'numericCapabilityTraits' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits termcap numericCapabilityTraits.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'termcap' -> 'numericCapability' -> () From: ( | {
         'ModuleInfo: Module: termcap InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'termcap' -> 'numericCapabilityTraits' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'termcap' -> 'numericCapability' -> () From: ( | {
         'ModuleInfo: Module: termcap InitialContents: FollowSlot\x7fVisibility: public'
        
         value <- 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'termcap' -> 'numericCapabilityTraits' -> () From: ( | {
         'ModuleInfo: Module: termcap InitialContents: FollowSlot\x7fVisibility: public'
        
         init = ( |
            | 
            value: termcap getnum: ident IfFail: [^isPresent: false].
            isPresent: true).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'termcap' -> () From: ( | {
         'ModuleInfo: Module: termcap InitialContents: FollowSlot\x7fVisibility: public'
        
         height = bootstrap define: bootstrap stub -> 'globals' -> 'termcap' -> 'height' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'ident' From:
             globals termcap numericCapability copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'termcap' -> 'height' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals termcap height.

CopyDowns:
globals termcap numericCapability. copy 
SlotsToOmit: ident.

'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'termcap' -> 'height' -> () From: ( | {
         'ModuleInfo: Module: termcap InitialContents: FollowSlot\x7fVisibility: public'
        
         ident = 'li'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'termcap' -> () From: ( | {
         'ModuleInfo: Module: termcap InitialContents: InitializeToExpression: (\'unknown\')\x7fVisibility: public'
        
         name <- 'unknown'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: platform\x7fCategory: host and filesystem\x7fModuleInfo: Module: termcap InitialContents: FollowSlot\x7fVisibility: public'
        
         termcap = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'termcap' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits termcap.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'termcap' -> () From: ( | {
         'ModuleInfo: Module: termcap InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'termcap' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'termcap' -> () From: ( | {
         'ModuleInfo: Module: termcap InitialContents: FollowSlot\x7fVisibility: public'
        
         startStandout = bootstrap define: bootstrap stub -> 'globals' -> 'termcap' -> 'startStandout' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'ident' From:
             globals termcap stringCapability copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'termcap' -> 'startStandout' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals termcap startStandout.

CopyDowns:
globals termcap stringCapability. copy 
SlotsToOmit: ident.

'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'termcap' -> 'startStandout' -> () From: ( | {
         'ModuleInfo: Module: termcap InitialContents: FollowSlot\x7fVisibility: public'
        
         ident = 'so'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'termcap' -> () From: ( | {
         'ModuleInfo: Module: termcap InitialContents: FollowSlot\x7fVisibility: public'
        
         startTermcapMode = bootstrap define: bootstrap stub -> 'globals' -> 'termcap' -> 'startTermcapMode' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'ident' From:
             globals termcap stringCapability copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'termcap' -> 'startTermcapMode' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals termcap startTermcapMode.

CopyDowns:
globals termcap stringCapability. copy 
SlotsToOmit: ident.

'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'termcap' -> 'startTermcapMode' -> () From: ( | {
         'ModuleInfo: Module: termcap InitialContents: FollowSlot\x7fVisibility: public'
        
         ident = 'ti'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'termcap' -> () From: ( | {
         'ModuleInfo: Module: termcap InitialContents: FollowSlot\x7fVisibility: public'
        
         startUnderscore = bootstrap define: bootstrap stub -> 'globals' -> 'termcap' -> 'startUnderscore' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'ident' From:
             globals termcap stringCapability copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'termcap' -> 'startUnderscore' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals termcap startUnderscore.

CopyDowns:
globals termcap stringCapability. copy 
SlotsToOmit: ident.

'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'termcap' -> 'startUnderscore' -> () From: ( | {
         'ModuleInfo: Module: termcap InitialContents: FollowSlot\x7fVisibility: public'
        
         ident = 'us'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'termcap' -> 'booleanCapabilityTraits' -> () From: ( | {
         'ModuleInfo: Module: termcap InitialContents: FollowSlot\x7fVisibility: public'
        
         init = ( |
            | 
            value: termcap getflag: ident IfFail: value).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'termcap' -> 'booleanCapabilityTraits' -> () From: ( | {
         'ModuleInfo: Module: termcap InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'termcap' -> 'numericCapabilityTraits' -> 'parent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'termcap' -> () From: ( | {
         'ModuleInfo: Module: termcap InitialContents: FollowSlot\x7fVisibility: public'
        
         supportsBackspace = bootstrap define: bootstrap stub -> 'globals' -> 'termcap' -> 'supportsBackspace' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'ident' From:
             globals termcap booleanCapability copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'termcap' -> 'supportsBackspace' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals termcap supportsBackspace.

CopyDowns:
globals termcap booleanCapability. copy 
SlotsToOmit: ident.

'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'termcap' -> 'supportsBackspace' -> () From: ( | {
         'ModuleInfo: Module: termcap InitialContents: FollowSlot\x7fVisibility: public'
        
         ident = 'bs'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'termcap' -> () From: ( | {
         'ModuleInfo: Module: termcap InitialContents: FollowSlot\x7fVisibility: public'
        
         width = bootstrap define: bootstrap stub -> 'globals' -> 'termcap' -> 'width' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'ident' From:
             globals termcap numericCapability copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'termcap' -> 'width' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals termcap width.

CopyDowns:
globals termcap numericCapability. copy 
SlotsToOmit: ident.

'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'termcap' -> 'width' -> () From: ( | {
         'ModuleInfo: Module: termcap InitialContents: FollowSlot\x7fVisibility: public'
        
         ident = 'co'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'termcap' -> () From: ( | {
         'Comment: initializer for all specified capabilities\x7fModuleInfo: Module: termcap InitialContents: FollowSlot\x7fVisibility: private'
        
         capabilitiesDo: blk = ( |
            | 
            blk value: width.
            blk value: height.
            blk value: startUnderscore.
            blk value: endUnderscore.
            blk value: startStandout.
            blk value: endStandout.
            blk value: startTermcapMode.
            blk value: endTermcapMode.
            blk value: clearToEndOfLine.
            blk value: clearScreen.
            blk value: supportsBackspace.
            blk value: goto).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'termcap' -> () From: ( | {
         'Comment: traits for capabilities\x7fModuleInfo: Module: termcap InitialContents: FollowSlot\x7fVisibility: public'
        
         capabilityTraits = bootstrap stub -> 'traits' -> 'termcap' -> 'numericCapabilityTraits' -> 'parent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'termcap' -> () From: ( | {
         'ModuleInfo: Module: termcap InitialContents: FollowSlot\x7fVisibility: public'
        
         getenv: name = ( |
            | 
            name: name.
            primGetenv: name).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'termcap' -> () From: ( | {
         'Comment: Extracts the termcap entry for \'name\' and returns the termcap database
     entry. Please note the termcap library saves this result for
     subsequential termcap calls.\x7fModuleInfo: Module: termcap InitialContents: FollowSlot\x7fVisibility: public'
        
         getenv: name IfFail: errBlk = ( |
            | 
            name: name.
            primGetenv: name IfFail: errBlk).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'termcap' -> () From: ( | {
         'Comment: initializer for all specified capabilities\x7fModuleInfo: Module: termcap InitialContents: FollowSlot\x7fVisibility: public'
        
         initializeCapabilities = ( |
            | capabilitiesDo: [|:c| c init ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'termcap' -> () From: ( | {
         'ModuleInfo: Module: termcap InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'oddball' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'termcap' -> () From: ( | {
         'Category: printing\x7fModuleInfo: Module: termcap InitialContents: FollowSlot\x7fVisibility: public'
        
         statePrintString = ( |
            | name).
        } | ) 



 '-- Sub parts'

 bootstrap read: 'termcap_wrappers' From: 'glue'



 '-- Side effects'

 globals modules termcap postFileIn
