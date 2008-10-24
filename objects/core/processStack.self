 'Sun-$Revision: 30.12 $'
 '
Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: processStack InitialContents: FollowSlot'
        
         processStack = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'processStack' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'processStack' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules processStack.

CopyDowns:
globals modules init. copy 
SlotsToOmit: directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'processStack' -> () From: ( | {
         'ModuleInfo: Module: processStack InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'core'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'processStack' -> () From: ( | {
         'ModuleInfo: Module: processStack InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'processStack' -> () From: ( | {
         'ModuleInfo: Module: processStack InitialContents: FollowSlot'
        
         myComment <- 'A stack of activation records'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'processStack' -> () From: ( | {
         'ModuleInfo: Module: processStack InitialContents: FollowSlot'
        
         postFileIn = ( |
            | 
            processStack initializeFormat.
            resend.postFileIn).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'processStack' -> () From: ( | {
         'ModuleInfo: Module: processStack InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- 'Sun-$Revision: 30.12 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'processStack' -> () From: ( | {
         'ModuleInfo: Module: processStack InitialContents: FollowSlot\x7fVisibility: private'
        
         subpartNames <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: system\x7fCategory: concurrency\x7fModuleInfo: Module: processStack InitialContents: FollowSlot\x7fVisibility: public'
        
         processStack = bootstrap define: ((bootstrap stub -> 'globals') \/-> 'processStack') -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals vector copy ) From: bootstrap setObjectAnnotationOf: ((bootstrap stub -> 'globals') \/-> 'processStack') -> () From: ( |
             {} = 'ModuleInfo: Creator: globals processStack.

CopyDowns:
globals vector. copy 
SlotsToOmit: parent.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: ((bootstrap stub -> 'globals') \/-> 'processStack') -> () From: ( | {
         'Comment: cache for the results from activations\x7fModuleInfo: Module: processStack InitialContents: FollowSlot\x7fVisibility: private'
        
         cache <- ((bootstrap stub -> 'globals') \/-> 'vector') -> ().
        } | ) 

 bootstrap addSlotsTo: ((bootstrap stub -> 'globals') \/-> 'processStack') -> () From: ( | {
         'Comment: format describes the layout of the stack trace.\x7fModuleInfo: Module: processStack InitialContents: InitializeToExpression: (list copyRemoveAll)\x7fVisibility: public'
        
         format <- list copyRemoveAll.
        } | ) 

 bootstrap addSlotsTo: ((bootstrap stub -> 'globals') \/-> 'processStack') -> () From: ( | {
         'ModuleInfo: Module: processStack InitialContents: InitializeToExpression: (process)\x7fVisibility: private'
        
         myProcess <- bootstrap stub -> 'globals' -> 'process' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: system\x7fCategory: concurrency\x7fModuleInfo: Module: processStack InitialContents: FollowSlot\x7fVisibility: public'
        
         processStack = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'processStack' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits processStack.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: ((bootstrap stub -> 'globals') \/-> 'processStack') -> () From: ( | {
         'ModuleInfo: Module: processStack InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'processStack' -> ().
        } | ) 

 bootstrap addSlotsTo: ((bootstrap stub -> 'globals') \/-> 'processStack') -> () From: ( | {
         'ModuleInfo: Module: processStack InitialContents: FollowSlot\x7fVisibility: private'
        
         prototype = ( |
            | processStack).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'processStack' -> () From: ( | {
         'ModuleInfo: Module: processStack InitialContents: FollowSlot\x7fVisibility: public'
        
         abstractField = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'processStack' -> 'abstractField' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits processStack abstractField.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'processStack' -> 'abstractField' -> () From: ( | {
         'ModuleInfo: Module: processStack InitialContents: FollowSlot\x7fVisibility: private'
        
         adjust: str = ( |
            | 
            (width <= str size)
                ifTrue: [^(str copyAtMostWithEllipsis: width - 1), ' '] 
                False:  [^(str padOnRight:             width - 1), ' ']).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'processStack' -> 'abstractField' -> () From: ( | {
         'Comment: The following methods must be implemented by a descendant.\x7fModuleInfo: Module: processStack InitialContents: FollowSlot\x7fVisibility: private'
        
         descendantResponsibilities = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'processStack' -> 'abstractField' -> 'descendantResponsibilities' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits processStack abstractField descendantResponsibilities.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'processStack' -> 'abstractField' -> 'descendantResponsibilities' -> () From: ( | {
         'ModuleInfo: Module: processStack InitialContents: FollowSlot\x7fVisibility: private'
        
         printString: activation Indent: len = ( |
            | 
            'Print this field of the given activation indented by len.').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'processStack' -> 'abstractField' -> () From: ( | {
         'ModuleInfo: Module: processStack InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'clonable' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'processStack' -> 'abstractField' -> () From: ( | {
         'ModuleInfo: Module: processStack InitialContents: FollowSlot\x7fVisibility: public'
        
         printNarrowString: activation Indent: len = ( |
            | 
            adjust: printString: activation Indent: len).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'processStack' -> 'abstractField' -> () From: ( | {
         'ModuleInfo: Module: processStack InitialContents: FollowSlot\x7fVisibility: public'
        
         titleString = ( |
            | adjust: title).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'processStack' -> 'abstractField' -> () From: ( | {
         'Comment: must be >= 1\x7fModuleInfo: Module: processStack InitialContents: FollowSlot\x7fVisibility: public'
        
         width = 10.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'processStack' -> () From: ( | {
         'Comment: activationString returns one line according to the format.\x7fModuleInfo: Module: processStack InitialContents: FollowSlot\x7fVisibility: public'
        
         activationString: index = ( |
            | activationString: index Indent: 0).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'processStack' -> () From: ( | {
         'ModuleInfo: Module: processStack InitialContents: FollowSlot\x7fVisibility: private'
        
         activationString: index Indent: len = ( | {
                 'ModuleInfo: Module: processStack InitialContents: FollowSlot'
                
                 r <- ''.
                } 
            | 
            format do: [|:field| 
               r: r, (field printNarrowString: (at: index) Indent: len).
            ].
            r).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'processStack' -> () From: ( | {
         'Comment: Prints out either one activation or a folded interval of activations.
     Returns the next activation number to be printed\x7fModuleInfo: Module: processStack InitialContents: FollowSlot\x7fVisibility: private'
        
         activationStructureString: start End: end NextFrame: nfb = ( | {
                 'ModuleInfo: Module: processStack InitialContents: FollowSlot'
                
                 offs.
                }  {
                 'ModuleInfo: Module: processStack InitialContents: FollowSlot'
                
                 r <- ''.
                }  {
                 'ModuleInfo: Module: processStack InitialContents: FollowSlot'
                
                 times.
                } 
            | 
            1 to: ((end-start)/2 min: foldLimit) Do:[|:len|
                times: matchRepeatedInterval: start Length: len End: end.
                times > 0 ifTrue:[
                    offs: 0.
                    [isMatching: start+offs To: (start+(times*len))+offs]
                        whileTrue: [
                            r: r, (activationString: start+offs Indent: 0), '\n'. 
                            offs: offs succ].
                    r: r, '{\n'.
                    (start+offs) to:((start+len) - 1)+offs Do:
                        [|:i| r: r, (activationString: i Indent: 1), '\n'].
                    r: r, '}*', times printString, '\n'.
                    nfb value: start+(times*len)+offs.
                    ^r]].
            r: r, (activationString: start Indent: 0), '\n'.
            nfb value: start+1.
            r).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'processStack' -> () From: ( | {
         'ModuleInfo: Module: processStack InitialContents: FollowSlot\x7fVisibility: private'
        
         checkCache: i = ( |
            | 
             (cache at: i double) ifNil: [| frame |
                frame: at: i.
                cache at: i double       Put: frame codes.
                cache at: (i double + 1) Put: (
                    frame isReflecteeMethodActivation ifTrue: [ frame methodHolder ]
                                                       False: [ frame receiver     ])
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'processStack' -> () From: ( | {
         'ModuleInfo: Module: processStack InitialContents: FollowSlot\x7fVisibility: private'
        
         codes: i = ( |
            | cache at: i double).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'processStack' -> () From: ( | {
         'Category: printing\x7fModuleInfo: Module: processStack InitialContents: FollowSlot\x7fVisibility: public'
        
         collectionName = 'processStack'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'processStack' -> () From: ( | {
         'ModuleInfo: Module: processStack InitialContents: FollowSlot\x7fVisibility: public'
        
         copyForProcess: p = ( |
            | 
            copyForProcess: p Limit: maxSmallInt).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'processStack' -> () From: ( | {
         'ModuleInfo: Module: processStack InitialContents: FollowSlot\x7fVisibility: public'
        
         copyForProcess: p Limit: maxSize = ( |
             actStack.
             r.
            | 
            actStack: p activationStackLimit: maxSize IfFail: vector.
            r: (copySize: actStack size) myProcess: p.
            actStack size do: [|:i|
              r at: i Put:  (actStack at: i) initNumber: i Process: p
            ].
            r).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'processStack' -> () From: ( | {
         'ModuleInfo: Module: processStack InitialContents: FollowSlot\x7fVisibility: public'
        
         fileField = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'processStack' -> 'fileField' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits processStack fileField.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'processStack' -> 'fileField' -> () From: ( | {
         'ModuleInfo: Module: processStack InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'processStack' -> 'abstractField' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'processStack' -> 'fileField' -> () From: ( | {
         'ModuleInfo: Module: processStack InitialContents: FollowSlot\x7fVisibility: private'
        
         printString: activation Indent: len = ( |
             ext <- ''.
             selfRoot <- ''.
             str <- ''.
             suffix = '.self'.
            | 
            ext: activation file.
            ext = '' ifTrue: [^''].

            "Remove the self working dirctory prefix"
            selfRoot: bootstrap selfObjectsWorkingDir, '/'.
            ext: ext copyWithoutPrefix: selfRoot.

            "Remove the .self extension"
            ext: ext copyWithoutSuffix: suffix.

            str: activation line printString.
            ext: ext copyAtMostWithEllipsis: ((width - 2) - str size  max: 0).
            ext, ':', str).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'processStack' -> 'fileField' -> () From: ( | {
         'ModuleInfo: Module: processStack InitialContents: FollowSlot\x7fVisibility: public'
        
         title <- 'File:line'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'processStack' -> 'fileField' -> () From: ( | {
         'ModuleInfo: Module: processStack InitialContents: FollowSlot\x7fVisibility: public'
        
         width <- 19.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'processStack' -> () From: ( | {
         'ModuleInfo: Module: processStack InitialContents: FollowSlot\x7fVisibility: public'
        
         foldLimit <- 40.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'processStack' -> () From: ( | {
         'ModuleInfo: Module: processStack InitialContents: FollowSlot\x7fVisibility: private'
        
         initializeFormat = ( |
            | 
            format: (      numberField 
                    &     receiverField 
                    &     selectorField
                    &         fileField     
                    & methodHolderField 
            ) asList.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'processStack' -> () From: ( | {
         'ModuleInfo: Module: processStack InitialContents: FollowSlot\x7fVisibility: private'
        
         isMatching: i To: j = ( | {
                 'ModuleInfo: Module: processStack InitialContents: FollowSlot'
                
                 frameI.
                }  {
                 'ModuleInfo: Module: processStack InitialContents: FollowSlot'
                
                 frameJ.
                } 
            | 
            checkCache: i.           checkCache: j.
            (codes: i) = (codes: j) ifFalse: [^false].
            (at: i) isReflecteeMethodActivation ifTrue: [
                ^(methodHolder: i)  = (methodHolder: j)].
            (receiver: i) isReflecteeBlock ifTrue: [
                ^(receiver: j) isReflecteeBlock].
            (receiver: i) = (receiver: j)).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'processStack' -> () From: ( | {
         'ModuleInfo: Module: processStack InitialContents: FollowSlot\x7fVisibility: private'
        
         matchInterval: indexA Against: indexB Length: len = ( |
            | 
            len asVector allSatisfy: [|:i|  isMatching: indexA+i To: indexB+i]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'processStack' -> () From: ( | {
         'Comment: Returns the number of times a stack interval from start upTo start+len
     match the following stack activations.\x7fModuleInfo: Module: processStack InitialContents: FollowSlot\x7fVisibility: private'
        
         matchRepeatedInterval: start Length: len End: end = ( | {
                 'ModuleInfo: Module: processStack InitialContents: FollowSlot'
                
                 index.
                }  {
                 'ModuleInfo: Module: processStack InitialContents: FollowSlot'
                
                 times.
                } 
            | 
            (matchInterval: start Against: start+len Length: len) ifFalse: [^0].
            times: 2.
            index: start + len double.
            [  (index + len)  <= end                             ifFalse: [^times].
               (matchInterval: start Against: index Length: len) ifFalse: [^times].
               times: times succ. 
               index: index + len
            ] loop).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'processStack' -> () From: ( | {
         'ModuleInfo: Module: processStack InitialContents: FollowSlot\x7fVisibility: private'
        
         methodHolder: i = ( |
            | receiver: i).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'processStack' -> () From: ( | {
         'ModuleInfo: Module: processStack InitialContents: FollowSlot\x7fVisibility: public'
        
         methodHolderField = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'processStack' -> 'methodHolderField' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits processStack methodHolderField.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'processStack' -> 'methodHolderField' -> () From: ( | {
         'ModuleInfo: Module: processStack InitialContents: FollowSlot\x7fVisibility: private'
        
         lexicalOuterMethodName: activation = ( |
             x.
            | 
            x: activation outermostLexicalScope.
            x selectorIfFail: '').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'processStack' -> 'methodHolderField' -> () From: ( | {
         'ModuleInfo: Module: processStack InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'processStack' -> 'abstractField' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'processStack' -> 'methodHolderField' -> () From: ( | {
         'ModuleInfo: Module: processStack InitialContents: FollowSlot\x7fVisibility: private'
        
         printString: activation Indent: len = ( |
            | 
            activation isLive ifFalse: [^'<dead activation>' ].
            activation isReflecteeMethodActivation 
                ifTrue: [ activation methodHolder safeName ]
                False:  [
                    (activation receiver isReflecteeBlock
                        ifTrue: ['[]'] False: ['()']),
                    ' in ', lexicalOuterMethodName: activation ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'processStack' -> 'methodHolderField' -> () From: ( | {
         'ModuleInfo: Module: processStack InitialContents: FollowSlot\x7fVisibility: public'
        
         title <- 'Method-holder/location'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'processStack' -> 'methodHolderField' -> () From: ( | {
         'ModuleInfo: Module: processStack InitialContents: FollowSlot\x7fVisibility: public'
        
         width <- 23.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'processStack' -> () From: ( | {
         'ModuleInfo: Module: processStack InitialContents: FollowSlot\x7fVisibility: public'
        
         numberField = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'processStack' -> 'numberField' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits processStack numberField.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'processStack' -> 'numberField' -> () From: ( | {
         'ModuleInfo: Module: processStack InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'processStack' -> 'abstractField' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'processStack' -> 'numberField' -> () From: ( | {
         'ModuleInfo: Module: processStack InitialContents: FollowSlot\x7fVisibility: private'
        
         printString: activation Indent: len = ( |
            | 
            ('' padOnLeft: len), '#', activation number printString).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'processStack' -> 'numberField' -> () From: ( | {
         'ModuleInfo: Module: processStack InitialContents: FollowSlot\x7fVisibility: public'
        
         title <- '##'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'processStack' -> 'numberField' -> () From: ( | {
         'ModuleInfo: Module: processStack InitialContents: FollowSlot\x7fVisibility: public'
        
         width <- 6.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'processStack' -> () From: ( | {
         'ModuleInfo: Module: processStack InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'vector' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'processStack' -> () From: ( | {
         'Category: printing\x7fModuleInfo: Module: processStack InitialContents: FollowSlot\x7fVisibility: public'
        
         printString = ( |
            | collectionName, objectID).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'processStack' -> () From: ( | {
         'ModuleInfo: Module: processStack InitialContents: FollowSlot\x7fVisibility: public'
        
         printTrace = ( |
            | 
            traceStringsDo: [|:string| myProcess stderr write: string asString]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'processStack' -> () From: ( | {
         'ModuleInfo: Module: processStack InitialContents: FollowSlot\x7fVisibility: private'
        
         receiver: i = ( |
            | cache at: (i double + 1)).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'processStack' -> () From: ( | {
         'ModuleInfo: Module: processStack InitialContents: FollowSlot\x7fVisibility: public'
        
         receiverField = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'processStack' -> 'receiverField' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits processStack receiverField.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'processStack' -> 'receiverField' -> () From: ( | {
         'ModuleInfo: Module: processStack InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'processStack' -> 'abstractField' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'processStack' -> 'receiverField' -> () From: ( | {
         'ModuleInfo: Module: processStack InitialContents: FollowSlot\x7fVisibility: private'
        
         printString: activation Indent: len = ( |
            | 
            activation receiver isReflecteeMethod
                ifTrue: [ '<m>' ]
                 False: [ "use explicit _ObjectID for safety"
                    '<', activation receiver reflectee _ObjectID printString, '>' ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'processStack' -> 'receiverField' -> () From: ( | {
         'ModuleInfo: Module: processStack InitialContents: FollowSlot\x7fVisibility: public'
        
         title <- 'Rcvr'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'processStack' -> 'receiverField' -> () From: ( | {
         'ModuleInfo: Module: processStack InitialContents: FollowSlot\x7fVisibility: public'
        
         width <- 7.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'processStack' -> () From: ( | {
         'ModuleInfo: Module: processStack InitialContents: FollowSlot\x7fVisibility: public'
        
         selectorField = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'processStack' -> 'selectorField' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits processStack selectorField.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'processStack' -> 'selectorField' -> () From: ( | {
         'ModuleInfo: Module: processStack InitialContents: FollowSlot\x7fVisibility: public'
        
         intersperseArguments <- bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'processStack' -> 'selectorField' -> () From: ( | {
         'ModuleInfo: Module: processStack InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'processStack' -> 'abstractField' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'processStack' -> 'selectorField' -> () From: ( | {
         'ModuleInfo: Module: processStack InitialContents: FollowSlot\x7fVisibility: private'
        
         printString: activation Indent: len = ( |
            | 
            activation isReflecteeMethodActivation 
                ifTrue: [
                  intersperseArguments
                    ifFalse: [
                      (reflect: activation selector) isReflecteeString
                        ifTrue: [ activation selector ]
                         False: [ activation selector printString ]]
                       True: [| values <- list |
                              values: values copyRemoveAll.
                              activation do: [|:slot|
                                  slot isArgument ifTrue:
                                     [values add: slot name ]].
                              activation selector asSelector 
                              intersperse: values]]
                False: [
                  activation receiver isReflecteeBlock
                    ifTrue:[ '[', (truncate: activation receiver
                                     valueSlot contents source), ']']
                     False:[ '(', (truncate: activation source), ')']]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'processStack' -> 'selectorField' -> () From: ( | {
         'ModuleInfo: Module: processStack InitialContents: FollowSlot\x7fVisibility: public'
        
         title <- 'Selector/Block'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'processStack' -> 'selectorField' -> () From: ( | {
         'ModuleInfo: Module: processStack InitialContents: FollowSlot\x7fVisibility: private'
        
         truncate: str = ( | {
                 'ModuleInfo: Module: processStack InitialContents: FollowSlot'
                
                 field <- ''.
                } 
            | 
            field: str shrinkwrapped detabified: 1.
            field size do: [|:i| ('\n' = (field at: i)) ifTrue:
                                  [ field at: i Put: ' ' ] ].
            (width <= str size)
                ifTrue:[field: field copyAtMostWithEllipsis: width].
            field).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'processStack' -> 'selectorField' -> () From: ( | {
         'ModuleInfo: Module: processStack InitialContents: FollowSlot\x7fVisibility: public'
        
         width <- 24.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'processStack' -> () From: ( | {
         'ModuleInfo: Module: processStack InitialContents: FollowSlot\x7fVisibility: public'
        
         titleString = ( | {
                 'ModuleInfo: Module: processStack InitialContents: FollowSlot'
                
                 title <- ''.
                } 
            | 
            format do: [|:field|
                title: title, (underlineString: field titleString) ].
            title).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'processStack' -> () From: ( | {
         'ModuleInfo: Module: processStack InitialContents: FollowSlot\x7fVisibility: public'
        
         topmostInterestingActivation = ( |
             promptSelector = '<top level expr>'.
            | 
             "If the process originates from evaluating an expression
              via _MirrorEvaluate: some of the topmost activation are ignored as
              redundant information."

                  isEmpty not
             && [ last isReflecteeMethodActivation ] ifTrue: [
                "Since the topmost activation has its origin in the prompt
                 activations until the activation 'promptSelector' are
                 redundant to the user"
             size pred downTo: 0 Do: [|:i. activation|
                  activation: at: i.
                       activation isReflecteeMethodActivation 
                  && [ promptSelector = activation selector ]
                   ifTrue: [ ^ i ].
             ]
            ].
            size pred).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'processStack' -> () From: ( | {
         'ModuleInfo: Module: processStack InitialContents: FollowSlot\x7fVisibility: public'
        
         traceLinesDo: blk From: start To: end = ( |
            | 
            blk value: titleString.
            useCache: [
                start to: end Do: [|:index| blk value: activationString: index ]]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'processStack' -> () From: ( | {
         'Comment: traceString formats a process stack in a compressed and easy to
     read format. For each activation on the stack one line of output is 
     generated. In order to align the activations vertically each line is 
     divided into a number of fields with fixed width.\x7fModuleInfo: Module: processStack InitialContents: FollowSlot\x7fVisibility: public'
        
         traceString = ( | {
                 'ModuleInfo: Module: processStack InitialContents: FollowSlot'
                
                 r <- ''.
                } 
            | traceStringsDo: [|:string| r: r, string]. r).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'processStack' -> () From: ( | {
         'ModuleInfo: Module: processStack InitialContents: FollowSlot\x7fVisibility: public'
        
         traceStringsDo: blk = ( | {
                 'ModuleInfo: Module: processStack InitialContents: FollowSlot'
                
                 next <- 0.
                } 
            | 
            blk value: titleString.
            blk value: '\n'.
            useCache: [
                [ next <= size pred ] whileTrue: [ 
                    blk value: activationStructureString: next 
                                                     End: size pred 
                                               NextFrame: [|:i| next: i]]]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'processStack' -> () From: ( | {
         'ModuleInfo: Module: processStack InitialContents: FollowSlot\x7fVisibility: private'
        
         underlineString: field = ( |
            | 
            field copyMappedBy: [|:c| ' ' = c ifTrue: '_' False: c]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'processStack' -> () From: ( | {
         'Comment: wrapper method when using the cache\x7fModuleInfo: Module: processStack InitialContents: FollowSlot\x7fVisibility: private'
        
         useCache: blk = ( |
            | 
            cache: vector copySize: size double."Allocate cache"
            blk value.
            cache: vector.                      "Reset cache").
        } | ) 



 '-- Side effects'

 globals modules processStack postFileIn
