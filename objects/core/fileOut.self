 '30.12.0-prerelease1'
 '
Copyright 1992-2014 AUTHORS.
See the legal/LICENSE file for license information and legal/AUTHORS for authors.
'
"preFileIn" self


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'defaultBehavior' -> () From: ( | {
         'Category: filing out\x7fModuleInfo: Module: fileOut InitialContents: FollowSlot\x7fVisibility: public'
        
         isImmutableForFilingOut = bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'defaultBehavior' -> () From: ( | {
         'Category: filing out\x7fModuleInfo: Module: fileOut InitialContents: FollowSlot\x7fVisibility: public'
        
         storeString = ( |
            | 
            storeStringIfFail: [ | :e |
                error: 'Cannot find a storeString for this object: ', e]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'defaultBehavior' -> () From: ( | {
         'Category: filing out\x7fModuleInfo: Module: fileOut InitialContents: FollowSlot\x7fVisibility: public'
        
         storeStringIfFail: fb = ( |
            | 
            "Return a string, which when evaluated, will return
             an object with the same value (contents) as the receiver.
             This method is NOT guaranteed to return identity.
             In particular, <<dictionary storeString>> is allowed to return
             'dictionary copyRemoveAll' -- dmu 9/17/93
            "
            fb value: 'unimplemented').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'defaultBehavior' -> () From: ( | {
         'Category: filing out\x7fModuleInfo: Module: fileOut InitialContents: FollowSlot\x7fVisibility: public'
        
         storeStringNeeds = ( |
            | 
            "used by transporter to avoid writing out the store string
             for the prototype instead of the object itself"
             "return an empty object to allow storeStrings by default"
             "works for numbers, strings, etc"
             ()).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: fileOut InitialContents: FollowSlot'
        
         fileOut = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'fileOut' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'fileOut' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules fileOut.

CopyDowns:
globals modules init. copy 
SlotsToOmit: directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'fileOut' -> () From: ( | {
         'ModuleInfo: Module: fileOut InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'core'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'fileOut' -> () From: ( | {
         'ModuleInfo: Module: fileOut InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'fileOut' -> () From: ( | {
         'ModuleInfo: Module: fileOut InitialContents: FollowSlot'
        
         myComment <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'fileOut' -> () From: ( | {
         'ModuleInfo: Module: fileOut InitialContents: InitializeToExpression: (\'30.12.0-prerelease1\')\x7fVisibility: public'
        
         revision <- '30.12.0-prerelease1'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'fileOut' -> () From: ( | {
         'ModuleInfo: Module: fileOut InitialContents: FollowSlot\x7fVisibility: private'
        
         subpartNames <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> () From: ( | {
         'ModuleInfo: Module: fileOut InitialContents: FollowSlot'
        
         fileOut = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'transporter' -> 'fileOut' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals transporter fileOut.
\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'fileOut' -> () From: ( | {
         'Category: visiting a whole module\x7fModuleInfo: Module: fileOut InitialContents: FollowSlot\x7fVisibility: private'
        
         annotateModule = ( |
            | 
            "  | t |
               userQuery show: 'annotating'
                 While: [ t: [module annotate] time ].
               userQuery show: (t /~ 1000) printString, ' secs'
                         While: [times delay: 500]."
            module annotate.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'fileOut' -> () From: ( | {
         'Category: utilities\x7fModuleInfo: Module: fileOut InitialContents: FollowSlot\x7fVisibility: private'
        
         annotationFor: hostChain = ( |
             anno.
             cds.
             lpa.
             tm.
            | 
            tm: hostChain targetMirror.
            anno: tm annotationIfFail: [^ objectAnnotation].
            anno: anno filterForFilingOut.
            anno = objectAnnotation ifTrue: [^ objectAnnotation].

            anno).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'fileOut' -> () From: ( | {
         'Category: creating objects\x7fModuleInfo: Module: fileOut InitialContents: FollowSlot\x7fVisibility: private'
        
         createCopiedDownObject: c = ( |
             cds.
             first <- bootstrap stub -> 'globals' -> 'true' -> ().
             sends.
            | 

            sends: list copyRemoveAll.
            cds: c targetMirror copyDowns.

            outFile token: 'bootstrap'.
            outFile token: 'define:'. "preserve ident w/ define"
            fileOutReferenceToDummy: c.
            outFile token: 'ToBe:'.

            cds size do: [
              outFile token: 'bootstrap'.
              outFile token: 'addSlotsTo:'.
              outFile token: '('. ") for emacs"
            ].

            c targetMirror copyDowns do: [|:cd. s <- '' |
              outFile indent.
              outFile cr.

                   c targetMirror isReflecteeVector
              && [cd parentMirror isReflecteeVector not] ifTrue: [
                  userQuery report: 'Warning: ', c printString,
                          '\nis a vector copied down from a non-vector.\n',
                          'It\'s vector-ness will be lost.'.
              ].
              first ifFalse: [   
                outFile token: 'From:'.  
                outFile cr. 
              ].
              first: false.

              cd slotsToOmit do: [|:os|
                outFile token: 'bootstrap'.
                outFile token: 'remove:'.
                outFile writeString: os.
                outFile token: 'From:'. "no arg, it is right-associative!"
                outFile cr.
              ].
              outFile token: 
                (transporter chains lobbyLink forPath: cd parentMirror creatorPath) unaryExpression.
              outFile token: cd selector.
              outFile token: ')'.
              outFile outdent.
            ].
            outFile token: 'From:'.
            createSlotsObject: c.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'fileOut' -> () From: ( | {
         'Category: creating objects\x7fCategory: object vectors\x7fModuleInfo: Module: fileOut InitialContents: FollowSlot\x7fVisibility: private'
        
         createEmptyObjectVector: c = ( |
            | 
            c targetMirror = vector asMirror  ifTrue: [
              outFile token: 'vector'.
            ^ self.
            ].
            setObjectAnnotationOf: c
              CreatedBy: [
                if: c
                HasSameSlotsAsVectorThen: [outFile token: 'vector _Clone'] 
                Else:                     [fileOutReferenceToDummy: c    ]
             ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'fileOut' -> () From: ( | {
         'Category: creating objects\x7fCategory: object vectors\x7fModuleInfo: Module: fileOut InitialContents: FollowSlot\x7fVisibility: private'
        
         createObjectVectorObject: c = ( |
             n.
            | 
            n: c targetMirror reflecteeSize.
            n = 0  ifTrue: [
              createEmptyObjectVector: c.
            ^ self.
            ].
            outFile block: [
              outFile inBars: [ 
                outFile token: 'x = '.
                outFile parenthesize: [
                  createEmptyObjectVector: c.
                ].
                outFile token: '_Clone:'.
                outFile writeInteger: n.
                outFile token: 'Filler: 0'.

              ].
              n do: [ | :i |
                outFile cr. 
                outFile token: 'x _At:'.
                outFile writeInteger: i.
                outFile token: ' Put: ().'.
              ].
              outFile cr.
              outFile token: 'x'.
            ].
            outFile token: 'value'.  
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'fileOut' -> () From: ( | {
         'Category: creating objects\x7fModuleInfo: Module: fileOut InitialContents: FollowSlot\x7fVisibility: private'
        
         createOuterMethodObject: c = ( |
            | 
            outFile parenthesize: [
              outFile inBars: [
            "
              methods no longer have creators, since we do not respect
              their identities, so skip this part:
                fileOutObjectAnnotationPseudoSlotOf: c.
            "
                c targetMirror do: [|:s|
                  s isArgument  ||  [s isAssignment]
                    ifFalse: [ fileOutAnnoAndSlot: c extendForSlot: s. ].
                ].
                outFile cr.
              ].
              outFile writeSource: c targetMirror source.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'fileOut' -> () From: ( | {
         'Category: creating objects\x7fModuleInfo: Module: fileOut InitialContents: FollowSlot\x7fVisibility: private'
        
         createSlotsObject: c = ( |
            | 
            c targetMirror do: [|:s|
              s isFiledOut &&  [ s module isEmpty ]  ifTrue: [
                userQuery report: 'Warning: ', (c extendForSlot: s) printString,
                          '\nhas no module and will not be filed out'.
              ].
            ].
            setObjectAnnotationOf: c
              CreatedBy: [
                fileOutReferenceToDummy: c. "bring in slots defined elsewhere"
              ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'fileOut' -> () From: ( | {
         'Category: contents of a slot\x7fModuleInfo: Module: fileOut InitialContents: FollowSlot\x7fVisibility: private'
        
         creatorChainOf: c Contents: m IfFail: fb = ( |
             creatorSlot.
            | 
            "return chain for creator of object at end
             of chain c. if none, return c.
             Explicitly pass in contents (m) to be able to lie."

            m isReflecteeMethod ifTrue: [^ c]. "never refer to methods"

            m filedOutCreatorSlotIfPresent: [|:s| 
              ^ transporter chains lobbyLink forPath: s contents creatorPath
            ] IfAbsent: [].

            m isReflecteeImmutable ifTrue: [^ c].

            "Since slots in methods are not currently cached in moduleDict,
             the do not get creators set"
            c prevLink targetMirror isReflecteeMethod ifTrue: [^ c].

            transporter annotator ensureCreatorOfContents: c targetSlot.

            m filedOutCreatorSlotIfPresent: [|:s| 
                transporter chains lobbyLink forPath: s contents creatorPath
            ] IfAbsent: [|:e|
                fb value: 'Could not find filed-out creator of: ', c printString,
                          '\n\tbecause: ', e.
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'fileOut' -> () From: ( | {
         'Category: creating objects\x7fCategory: object vectors\x7fModuleInfo: Module: fileOut InitialContents: FollowSlot\x7fVisibility: private'
        
         ensureObjectIsCloneOfVector: c = ( |
            | 
            if: c
            HasSameSlotsAsVectorThen: [self]
            Else: [|:why|
              error:
                'Cannot transport this object because: ',
                why
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'fileOut' -> () From: ( | {
         'Category: top-level slots\x7fModuleInfo: Module: fileOut InitialContents: FollowSlot\x7fVisibility: private'
        
         fileOutATopLevelIndexableSlot: c = ( |
            | 
            "the only fake slots handled so far are
             vector elements"
            [c targetSlot isVectorElement] assert.
            fileOutReferenceToDummy: c prevLink.
            outFile token: 
                c prevLink targetMirror isReflecteeByteVector
                    ifTrue: '_ByteAt:' False: '_At:'.
            outFile writeInteger: c targetSlot elementIndex.
            outFile token: 'Put:'.
            outFile parenthesize: [
              outFile cr.
              fileOutContentsOfSlot: c.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'fileOut' -> () From: ( | {
         'Category: top-level slots\x7fModuleInfo: Module: fileOut InitialContents: FollowSlot\x7fVisibility: private'
        
         fileOutATopLevelRealSlot: c = ( |
            | 
            outFile token: 'bootstrap'.
            outFile token: 'addSlotsTo:'.
            fileOutReferenceToDummy: c prevLink.
            outFile token: 'From:'.
            outFile inParenthesesAndBars: [
              fileOutAnnoAndSlot: c.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'fileOut' -> () From: ( | {
         'Category: top-level slots\x7fModuleInfo: Module: fileOut InitialContents: FollowSlot\x7fVisibility: private'
        
         fileOutATopLevelSlot: c = ( |
             m.
            | 

            " ensure that we can add a slot to holder"
            m: c prevLink targetMirror.

            [m isReflecteeMethod not    ] assert.
            [m areReflecteesSlotsMutable] assert.

            c targetSlot isVectorElement 
              ifTrue: [ fileOutATopLevelIndexableSlot: c ] 
               False: [ fileOutATopLevelRealSlot:      c ].
            outFile cr cr.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'fileOut' -> () From: ( | {
         'Category: public entry points\x7fModuleInfo: Module: fileOut InitialContents: FollowSlot\x7fVisibility: public'
        
         fileOutAll = ( |
             mods.
            | 
            mods: transporter moduleDictionary keys copySort.
            mods do: [|:mod|
              (copy module: mod asModule) fileOutModuleOrSkip.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'fileOut' -> () From: ( | {
         'Category: public entry points\x7fModuleInfo: Module: fileOut InitialContents: FollowSlot\x7fVisibility: public'
        
         fileOutAllInLoadOrder = ( |
            | 
            (
              transporter moduleDictionary theMainModule
            ) preorderDo: [|:m| 
              (copy module: m) fileOutModuleOrSkip.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'fileOut' -> () From: ( | {
         'Category: visiting a whole module\x7fModuleInfo: Module: fileOut InitialContents: FollowSlot\x7fVisibility: private'
        
         fileOutAllParts = ( |
            | 
            "go through the parts of the file out one by one"
            fileOutHeader.
            fileOutRunInit.
            fileOutTopLevelSlots.
            fileOutSubparts.
            fileOutSideEffects).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'fileOut' -> () From: ( | {
         'Category: slots\x7fModuleInfo: Module: fileOut InitialContents: FollowSlot\x7fVisibility: private'
        
         fileOutAnnoAndSlot: aChain = ( |
             a.
            | 
            a: aChain targetSlot annotation filterForFilingOut.
            a = slotAnnotation ifTrue: [
              outFile cr.
              fileOutSlot: aChain.
            ] False: [
              outFile inCurlies: [
                outFile cr.
                outFile writeString: a asString.
                outFile cr cr.
                fileOutSlot: aChain.
                outFile cr.
              ].
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'fileOut' -> () From: ( | {
         'Category: contents of a slot\x7fComment: a slot refers to some object, need to file out the reference\x7fModuleInfo: Module: fileOut InitialContents: FollowSlot\x7fVisibility: private'
        
         fileOutContentsOfSlot: aChain = ( |
            | 
            "follow a pointer to an object and do the right thing"

            follow: aChain
              IfExpand:     [                fileOutCreationOfObject: aChain     ]
              IfRefer:      [| :toChain    | fileOutReferenceToDummy: toChain    ]
              IfExpression: [| :expression | fileOutExpression:       expression ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'fileOut' -> () From: ( | {
         'Category: creating objects\x7fModuleInfo: Module: fileOut InitialContents: FollowSlot\x7fVisibility: private'
        
         fileOutCreationOfObject: c = ( |
             tm.
             type.
            | 
            "have determined that I really need to file out this object,
                 cannot just file out a reference to it"

            tm:  c targetMirror.

            tm storeStringOfReflecteeIfPresent: [|:s|
             (tm creatorSlotIfPresent: [|:s| s = c targetSlot] IfAbsent: false)  
               ifFalse: [ outFile token: s. ]
                  True: [
                    outFile token: 'bootstrap'.
                    outFile token: 'setObjectAnnotationOf:'.
                    outFile parenthesize: [
                      outFile token: s.
                    ].
                    outFile token: 'From:'.
                    fileOutObjectAnnotationObjectOf: c.
              ].
              ^ self.
            ] IfAbsent: [].

            c prevLink targetMirror isReflecteeMethod   ifTrue: [
              error: 'The transporter cannot file out: ',
                     c printString,
                     '.\nbecause it cannot create objects in slots',
                     ' in methods.\nPlease move this object elsewhere'.
            ].
            tm copyDowns isEmpty ifFalse: [
              ^ createCopiedDownObject: c.
            ].

            "dispatch by type:"

            type: tm type.

            case
              if: [ type = 'slots'  ]  Then: [ ^ createSlotsObject:        c ]
              If: [ type = 'method' ]  Then: [ ^ createOuterMethodObject:  c ]
              If: [ type = 'vector' ]  Then: [ ^ createObjectVectorObject: c ].

            error: 'Object at end of path: ', c printString,
                   ' has no storeString but is neither a slots object nor an outer method. ',
                   'Perhaps it needs a copyDown annotation?').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'fileOut' -> () From: ( | {
         'Category: contents of a slot\x7fModuleInfo: Module: fileOut InitialContents: FollowSlot\x7fVisibility: private'
        
         fileOutExpression: expr = ( |
            | 
            "remove trailing periods"
            expr reverseDo: [ | :c. :i |
              c = '.'  ifFalse: [
                outFile token: expr copySize: i succ.
              ^ self.
              ].
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'fileOut' -> () From: ( | {
         'Category: parts of a module\x7fModuleInfo: Module: fileOut InitialContents: FollowSlot\x7fVisibility: private'
        
         fileOutHeader = ( |
            | 
            "write out the header lines"
            outFile writeString: module revision.
            outFile cr.
            outFile writeString: module copyright.
            outFile cr.
            outFile writeSource: preFileInSource.
            outFile cr.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'fileOut' -> () From: ( | {
         'Category: slots\x7fModuleInfo: Module: fileOut InitialContents: FollowSlot\x7fVisibility: private'
        
         fileOutInitializerOf: c = ( |
            | 
                  c targetSlot isAssignable  
            &&  [ c targetMirror = mirrorOnNil ]   
                    ifTrue: [ ^ self].
            outFile token: c initializationToken.
            fileOutContentsOfSlot: c).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'fileOut' -> () From: ( | {
         'Category: visiting a whole module\x7fModuleInfo: Module: fileOut InitialContents: FollowSlot\x7fVisibility: private'
        
         fileOutModule = ( |
            | 
            fileOutModuleIfTimeStampError: [|:err|
              (userQuery askYesNo: err, '\nContinue?') ifFalse: [
                halt: 'Halting fileOut. Type "',
                      process this objectIDNumber printString, 
                      ' _AsObject continue" to bypass the warning(s)'.
              ].
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'fileOut' -> () From: ( | {
         'Category: public entry points\x7fModuleInfo: Module: fileOut InitialContents: FollowSlot\x7fVisibility: public'
        
         fileOutModule: m = ( |
            | 
            (
              copy 
              module: m asModule)
              fileOutModule).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'fileOut' -> () From: ( | {
         'Category: public entry points\x7fModuleInfo: Module: fileOut InitialContents: FollowSlot\x7fVisibility: public'
        
         fileOutModuleAndSubparts: mod = ( |
            | 
            mod asModule preorderDo: [|:m| fileOutModule: m. ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'fileOut' -> () From: ( | {
         'Category: visiting a whole module\x7fModuleInfo: Module: fileOut InitialContents: FollowSlot'
        
         fileOutModuleIfTimeStampError: timeStampBlock = ( |
             doAnyway <- bootstrap stub -> 'globals' -> 'false' -> ().
            | 
            "file out module contained in my module slot"

            userQuery show: 'Filing out module: ', module name
             While: [

              module canBeFiledOut ifTrue: [
                module checkTimeStampsIfFail: [|:e| 
                  timeStampBlock value: e. 
                  doAnyway: true.
                ].
              ].

              annotateModule.

              module canBeFiledOut ifFalse: [
                userQuery report: 'Module: ', module name, ' cannot be filed out.\n',
                                  'To change it, you will have to edit it by hand.'.
              ] True: [
                doAnyway ifFalse: [
                  module checkTimeStampsIfFail: [|:e|   timeStampBlock value: e. ].
                ].
                outFile: openOutFile.
                fileOutAllParts.
                outFile close.
                module beAsNewAsFile.
              ].
              module beClean.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'fileOut' -> () From: ( | {
         'Category: visiting a whole module\x7fModuleInfo: Module: fileOut InitialContents: FollowSlot'
        
         fileOutModuleOrSkip = ( |
            | 
            fileOutModuleIfTimeStampError: [|:e|
              ('skipping: ', module name, ': ', e) printLine.
              ^ self.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'fileOut' -> () From: ( | {
         'Category: creating objects\x7fModuleInfo: Module: fileOut InitialContents: FollowSlot\x7fVisibility: private'
        
         fileOutObjectAnnotationObjectOf: c = ( |
            | 
            outFile inParenthesesAndBars: [
              fileOutObjectAnnotationPseudoSlotOf: c.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'fileOut' -> () From: ( | {
         'Category: slots\x7fModuleInfo: Module: fileOut InitialContents: FollowSlot\x7fVisibility: private'
        
         fileOutObjectAnnotationPseudoSlotOf: hostChain = ( |
             anno.
            | 
            anno: annotationFor: hostChain.
            objectAnnotation = anno ifTrue: [
              outFile token: ''. "keep bars apart"
            ^ self
            ].
            outFile cr.
            outFile token: '{}'.
            outFile token: '='.
            outFile writeString: anno asString.
            outFile write: '.'.
            outFile cr.

            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'fileOut' -> () From: ( | {
         'Category: creating objects\x7fModuleInfo: Module: fileOut InitialContents: FollowSlot\x7fVisibility: private'
        
         fileOutReferenceToDummy: c = ( |
            | 
            "using bootstrap method, create and refer to dummy object"
            outFile token: c referenceToDummy.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'fileOut' -> () From: ( | {
         'Category: parts of a module\x7fModuleInfo: Module: fileOut InitialContents: FollowSlot\x7fVisibility: private'
        
         fileOutRunInit = ( |
            | 
            "This is a kludge, but we must have init first!"
            ( ( module subparts copyMappedBy: [|:m| m asModule])
              includes: 'init' asModule) ifTrue: [
                outFile writeMethodsToRunInit
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'fileOut' -> () From: ( | {
         'Category: parts of a module\x7fModuleInfo: Module: fileOut InitialContents: FollowSlot\x7fVisibility: private'
        
         fileOutSideEffects = ( |
            | 
                "file out an invocation of the module's side effects method
                 to perform any installation tasks"
            outFile writeTitle: 'Side effects'.
            outFile token: (reflect: module ) creatorPath fullName.
            outFile token: 'postFileIn'.
            outFile cr.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'fileOut' -> () From: ( | {
         'Category: slots\x7fModuleInfo: Module: fileOut InitialContents: FollowSlot\x7fVisibility: private'
        
         fileOutSlot: c = ( |
            | 
            "file out a single slot"
            outFile token: c targetSlot longerKey.
            fileOutInitializerOf: c.
            outFile write: '.'.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'fileOut' -> () From: ( | {
         'Category: parts of a module\x7fModuleInfo: Module: fileOut InitialContents: FollowSlot\x7fVisibility: private'
        
         fileOutSubparts = ( |
            | 
            "write out any runScripts for any submodules"
            module subparts isEmpty ifTrue: [^self].

            outFile writeTitle: 'Sub parts'.
            module subparts do: [|:s. sm|
                sm: s asModule.
                sm = 'init' asModule ifFalse: [
                    outFile token: 'bootstrap'.
                    outFile token: 'read:'.
                    outFile writeString: sm name.
                    sm directory isEmpty ifFalse: [
                      outFile token: 'From:'.
                      outFile writeString: sm directory.
                    ].
                    module tree = '' ifFalse: [
                      outFile token: 'InTree: globals modules ', module name, ' tree'].
                    outFile cr.
                ].
            ].
            outFile cr.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'fileOut' -> () From: ( | {
         'Category: parts of a module\x7fModuleInfo: Module: fileOut InitialContents: FollowSlot\x7fVisibility: private'
        
         fileOutTopLevelSlots = ( |
            | 
            outFile writeTitle: 'Module body'.
            topLevelSlotsDo: [|:c|  fileOutATopLevelSlot: c. ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'fileOut' -> () From: ( | {
         'Category: contents of a slot\x7fModuleInfo: Module: fileOut InitialContents: FollowSlot'
        
         follow: aChain IfExpand: expandBlk IfRefer: refBlk IfExpression: exprBlk = ( |
            | 
                  follow: aChain
                IfExpand: expandBlk
                 IfRefer: refBlk
            IfExpression: exprBlk
                  IfFail: [|:e| error: e]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'fileOut' -> () From: ( | {
         'Category: contents of a slot\x7fModuleInfo: Module: fileOut InitialContents: FollowSlot'
        
         follow: aChain IfExpand: expandBlk IfRefer: refBlk IfExpression: exprBlk IfFail: fb = ( |
             cm.
             creatorChain.
            | 
            "needs to follow a reference (aChain), this method decides
                 among three choices:
                    1. expand the object (it is defined here!)
                    2. refer to the contents of another slot (either in this module
                          or in another)
                    3. just write out an expression (string)

             For each case the corresponding block is evaluated with:

                 1. nothing,
                 2. the target chain that will hold the desired value
                 3. and the expression string
             "

            cm: aChain targetMirror.

            "treat init exprs to objects I file out like references to them"

            aChain hasTargetSlot ifTrue: [ | ic |
              ic: aChain targetSlot initialContents.
              ic isInitializeToExpression  ifTrue: [
                cm: ic expressionValueMirror.
                " if no creator, must mean to create a new one"
                " fix with ASTs??? want to support ref to data object in a future module
                   (one that has not been filed in yet when this one is filed in)
                   and want to support methods that could yield true or false depending on time of day"
                cm hasCreator ifFalse: [ ^ exprBlk value: ic expressionSource ].
              ].
            ].

            creatorChain: creatorChainOf: aChain Contents: cm IfFail: [|:e| ^ fb value: e].
            creatorChain = aChain
              ifTrue: [ expandBlk value ]
               False: [    refBlk value: creatorChain ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'fileOut' -> () From: ( | {
         'Category: contents of a slot\x7fModuleInfo: Module: fileOut InitialContents: FollowSlot\x7fVisibility: private'
        
         getFiledOutCreatorSlotOf: m ForChain: c = ( |
            | 
             m filedOutCreatorSlotIfPresent: [|:s| s] IfAbsent: [
              m isReflecteeImmutable ifTrue: [^ c].
              transporter annotator ensureCreatorOfContents: c targetSlot.
              m filedOutCreatorSlotIfPresent: [|:s| s] IfAbsent: [|:e|
                error: 'Could not find filed-out creator of: ', c printString,
                        '\n\tbecause: ', e.
              ].               
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'fileOut' -> () From: ( | {
         'Category: top-level slots\x7fCategory: sorting & iterating\x7fModuleInfo: Module: fileOut InitialContents: FollowSlot\x7fVisibility: private'
        
         getSlotChainsInModule = ( |
             paths.
             slots.
             slotsInModule.
            | 
             "return chains of slots in my module"
            paths: module annotatedPaths.
            (paths copyMappedBy: [|:p| transporter chains lobbyLink forPath: p]) asVector copySort).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'fileOut' -> () From: ( | {
         'Category: creating objects\x7fCategory: object vectors\x7fComment: When transporting vectors, need to know if
target mirror of chain c is a copy of vector or not.
thenBlk invoked with c,
elseBlk invoked with a reason, and also c.
 -- dmu 3/02\x7fModuleInfo: Module: fileOut InitialContents: FollowSlot\x7fVisibility: private'
        
         if: c HasSameSlotsAsVectorThen: thenBlk Else: elseBlk = ( |
             m.
            | 
            m: c targetMirror.
            m names asSet = vector asMirror names asSet  
              ifFalse: [^ elseBlk value: '<<', c printString, '>>',
                                         ' does not have same slots as vector'
                                   With: c].
            m findFirst: [|:s| (s couldBeACopyOf: vector asMirror at: s name) not]
              IfPresent: [|:s| 
                ^ elseBlk value:
                             'slot <<', s name, '>>',
                             ' in <<', c printString, '>>',
                             ' does not look like a copy of vector\'s'
                           With: c.
            ].
            thenBlk value: c).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'fileOut' -> () From: ( | {
         'Category: slots\x7fModuleInfo: Module: fileOut InitialContents: InitializeToExpression: (nil _Mirror)\x7fVisibility: private'
        
         mirrorOnNil = nil _Mirror.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'fileOut' -> () From: ( | {
         'Category: state & copying\x7fModuleInfo: Module: fileOut InitialContents: FollowSlot\x7fVisibility: private'
        
         module <- bootstrap stub -> 'globals' -> 'modules' -> 'init' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'fileOut' -> () From: ( | {
         'Category: utilities\x7fModuleInfo: Module: fileOut InitialContents: FollowSlot\x7fVisibility: private'
        
         openOutFile = ( |
            | 
            transporter bufferedBootstrapFile openForWritingModule: module).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'fileOut' -> () From: ( | {
         'Category: state & copying\x7fModuleInfo: Module: fileOut InitialContents: FollowSlot\x7fVisibility: private'
        
         outFile.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'fileOut' -> () From: ( | {
         'ModuleInfo: Module: fileOut InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'clonable' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'fileOut' -> () From: ( | {
         'Category: parts of a module\x7fModuleInfo: Module: fileOut InitialContents: FollowSlot'
        
         preFileInSource = ( |
            | 
            ((reflect: module) at: 'preFileIn' IfAbsent: [^ '']) value source).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'fileOut' -> () From: ( | {
         'Category: creating objects\x7fModuleInfo: Module: fileOut InitialContents: FollowSlot\x7fVisibility: private'
        
         setObjectAnnotationOf: c CreatedBy: blk = ( |
            | 
            outFile token: 'bootstrap'.
            outFile token: 'setObjectAnnotationOf:'.
            blk value.
            outFile token: 'From:'.
            fileOutObjectAnnotationObjectOf: c).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'fileOut' -> () From: ( | {
         'Category: top-level slots\x7fCategory: sorting & iterating\x7fModuleInfo: Module: fileOut InitialContents: FollowSlot\x7fVisibility: private'
        
         slotSorter = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'transporter' -> 'fileOut' -> 'slotSorter' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals transporter fileOut slotSorter.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'fileOut' -> 'slotSorter' -> () From: ( | {
         'ModuleInfo: Module: fileOut InitialContents: FollowSlot\x7fVisibility: private'
        
         checkSortedSlotsSize = ( |
            | 
            sortedSlots size = slotsInModule size
             ifTrue: [^ self].

            sortedSlots size < slotsInModule size
             ifTrue: [error: 'sorting lost some slots'].

            sortedSlots size > slotsInModule size
             ifTrue: [
              error: 'extra sorted slots: there may be a storeString',
                     ' problem (such as a missing "storeStringNeeds" slot)',
                     ' in: ',
                     (sortedSlots asSet removeAll: slotsInModule)
                      first targetSlot holder name
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'fileOut' -> 'slotSorter' -> () From: ( | {
         'Category: topological constraints\x7fCategory: copy downs\x7fModuleInfo: Module: fileOut InitialContents: FollowSlot\x7fVisibility: private'
        
         closeCopyDownParentConstraints: cdps For: chainOfCopiedDownObject = ( |
             originalMirror.
            | 

            "now, it is not enough to ensure that the copyDownParent
             is before the copyDownChild.
             All slots in the copyDownParent & and all parents of the copyDownParent
             must precede it, so close!
            "
            " allow a copied-down object to indirectly refer to itself, in order
              to allow a copied-down object to inherit from traits that
              simulates lexical scoping by inheriting from a name space.
              Example: transporter chains reflectee copied down from transporter
               chains slot, which inherits from transporter chains so the methods
               can just say reflectee. 
              But it does not work because the copied-down object finds the parent via
              predecessorsDo:, which then finds the original and you still get a cycle.
            -- dmu
            "

            originalMirror: chainOfCopiedDownObject targetMirror.

            [ |:exit. sz <- 0. |
              sz: cdps size.
              cdps copy do: [| :parentChain. |
                parentChain targetMirror do: [|:s. c. |

                  c: parentChain extendForSlot: s.
                  ( setOfSlotsInModule includes: c )  " &&  [ s contents != originalMirror ] "
                   ifTrue: [
                    " every slot in my copy-down parent must be created before me"
                    cdps add: c.

                    " every slot that creates an object that is referenced by
                      a slot in my copy-down parent must be created before me"

                    c targetMirror creatorPathIfPresent: [| :cp. cpChain |
                      cpChain: transporter chains lobbyLink forPath: cp.
                      " is my copy-down parent created in this module? "
                      ( setOfSlotsInModule includes: cpChain )
                        ifTrue: [ cdps add: cpChain ]

                    ] IfAbsent: [].
                  ].
                ].
              ].
              sz = cdps size  ifTrue: exit.
            ] loopExit.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'fileOut' -> 'slotSorter' -> () From: ( | {
         'ModuleInfo: Module: fileOut InitialContents: FollowSlot\x7fVisibility: public'
        
         copyAndSortSlotsFor: aFileOut = ( |
            | 
            copy sortSlotsFor: aFileOut).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'fileOut' -> 'slotSorter' -> () From: ( | {
         'Category: topological constraints\x7fCategory: copy downs\x7fModuleInfo: Module: fileOut InitialContents: FollowSlot\x7fVisibility: private'
        
         forEachCopyDownConstraintIn: cdps Of: aChain Do: blk = ( |
            | 
            cdps asVector sortedDo: [
              |:parentChain. |

              "invoke blk to express the copy-down constraint
               that the parent chunk must be filed out before
               this, the child chunk"

              blk value: parentChain 
                  With: 'which is copied down and therefore needs'.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'fileOut' -> 'slotSorter' -> () From: ( | {
         'Category: topological constraints\x7fCategory: copy downs\x7fModuleInfo: Module: fileOut InitialContents: FollowSlot\x7fVisibility: private'
        
         immediateCopyDownParentsOf: aChain = ( |
             cdps.
            | 
            "for contents of this slot
             collect copy-down parents, returning
             set of parentChains
            "
            cdps: set copyRemoveAll.

            aChain targetSlot isContentsFiledOut ifTrue: [
              aChain targetMirror copyDowns do: [|:cd. parentChain |
                parentChain: transporter chains lobbyLink forPath: cd parentMirror creatorPath.
                parentChain targetSlot module = myFileOut module name  ifTrue: [
                  cdps add: parentChain.
                ].
              ].
            ].
            cdps).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'fileOut' -> 'slotSorter' -> () From: ( | {
         'Category: state\x7fModuleInfo: Module: fileOut InitialContents: FollowSlot\x7fVisibility: private'
        
         myFileOut.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'fileOut' -> 'slotSorter' -> () From: ( | {
         'ModuleInfo: Module: fileOut InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'clonable' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'fileOut' -> 'slotSorter' -> () From: ( | {
         'Category: topological constraints\x7fCategory: copy downs\x7fModuleInfo: Module: fileOut InitialContents: FollowSlot\x7fVisibility: private'
        
         parentsOfCopiedDownChildrenIn: aChain Do: blk = ( |
             cdps.
            | 
            "get set of all copy-down-parents of all
             slots in this top-level chunk"

            cdps: immediateCopyDownParentsOf: aChain.
            closeCopyDownParentConstraints: cdps For: aChain.
            forEachCopyDownConstraintIn: cdps Of: aChain Do: blk.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'fileOut' -> 'slotSorter' -> () From: ( | {
         'Category: topological constraints\x7fModuleInfo: Module: fileOut InitialContents: FollowSlot\x7fVisibility: private'
        
         predecessorsOf: aChain Do: blk = ( |
            | 
            "topo conditions:

                all slots in copy-down parents of object in this slot
                and all slots (in this module) of any object referenced
                by copy-down parents, transitively.

                slots that create contents that is referred to by this slot
            "
            parentsOfCopiedDownChildrenIn: aChain Do: blk.
                              referentsIn: aChain Do: blk.

            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'fileOut' -> 'slotSorter' -> () From: ( | {
         'Category: topological constraints\x7fComment: if contents of slot at end of aChain will be initialized to some other object, invoke
presentBlock with creator chain of that object, else invoke absentBlock\x7fModuleInfo: Module: fileOut InitialContents: FollowSlot'
        
         referentOfSlot: aChain IfPresent: presentBlock IfAbsent: absentBlock = ( |
            | 
            myFileOut 
              follow: aChain  
              IfExpand: absentBlock
              IfRefer:   [|:toChain. | 
                presentBlock value: toChain
            ] IfExpression: absentBlock).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'fileOut' -> 'slotSorter' -> () From: ( | {
         'Category: topological constraints\x7fModuleInfo: Module: fileOut InitialContents: FollowSlot\x7fVisibility: private'
        
         referentsIn: aChain Do: blk = ( |
            | 
            referentOfSlot: aChain 
             IfPresent: [|:referentChain. referentSlot. referringSlot. |
              referringSlot: aChain        targetSlot.
              referentSlot:  referentChain targetSlot.

              myFileOut module name  =  referentSlot module   ifTrue: [ | why |
                why: '\n\twhich '.
                referringSlot initialContents isInitializeToExpression  ifFalse: [
                  why: why, 'refers to contents of'.
                ] True: [
                  why: 'is initialized to\n\t',
                       referringSlot initialContents expressionSource,
                         '\n\twhich evaluates to'.
                ].
                blk value: referentChain With: why.
              ].
            ] IfAbsent: [].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'fileOut' -> 'slotSorter' -> () From: ( | {
         'Category: state\x7fModuleInfo: Module: fileOut InitialContents: InitializeToExpression: (set copyRemoveAll)\x7fVisibility: private'
        
         setOfSlotsInModule <- set copyRemoveAll.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'fileOut' -> 'slotSorter' -> () From: ( | {
         'Category: state\x7fComment: all slot (chains) in module\x7fModuleInfo: Module: fileOut InitialContents: FollowSlot\x7fVisibility: private'
        
         slotsInModule.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'fileOut' -> 'slotSorter' -> () From: ( | {
         'Comment: topo sort slots, setting sortedSlots and sortedSlotSet\x7fModuleInfo: Module: fileOut InitialContents: FollowSlot\x7fVisibility: private'
        
         sort = ( |
            | 
            sortedSlots:      list copyRemoveAll.
            sortedSlotSet:     set copyRemoveAll.
            slotsInModule sortedDo: [|:aChain|
              (sortedSlotSet includes: aChain )  ifFalse: [
                topoSortFrom: aChain
                        Path: set copyRemoveAll
                        IfCycle: [|:e| error: 'Cannot topologically sort for filing out because of:\n',
                                               e].
              ].
            ].
            checkSortedSlotsSize.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'fileOut' -> 'slotSorter' -> () From: ( | {
         'ModuleInfo: Module: fileOut InitialContents: FollowSlot'
        
         sortSlotsFor: aFileOut = ( |
            | 
            myFileOut: aFileOut.
            slotsInModule: aFileOut getSlotChainsInModule.
            setOfSlotsInModule: slotsInModule asSet.
            sort.
            sortedSlots).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'fileOut' -> 'slotSorter' -> () From: ( | {
         'Category: state\x7fModuleInfo: Module: fileOut InitialContents: FollowSlot\x7fVisibility: private'
        
         sortedSlotSet.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'fileOut' -> 'slotSorter' -> () From: ( | {
         'Category: state\x7fModuleInfo: Module: fileOut InitialContents: FollowSlot\x7fVisibility: private'
        
         sortedSlots.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'fileOut' -> 'slotSorter' -> () From: ( | {
         'Category: topological constraints\x7fModuleInfo: Module: fileOut InitialContents: FollowSlot\x7fVisibility: private'
        
         topoSortFrom: aChain Path: pth IfCycle: cycleBlock = ( |
            | 
             "recursive, Lisp-style topo sorter.
               pth: a path through graph, from successor, to predecessor,
                    implemented by a set.
               "
             pth add: aChain.
             predecessorsOf: aChain Do: [|:pred. :reason. |
               case
                 if:    [ sortedSlotSet includes: pred] 
                 Then: ["already got here"]

                 If:   [ pth includes: pred] 
                 Then: [
                        ^ cycleBlock value: aChain printString,
                                            ',\n ',
                                            reason, '\n',
                                            pred printString.
              ]  Else: [
                        topoSortFrom: pred 
                                Path: pth
                             IfCycle: [|:e| 
                                       ^ cycleBlock value: aChain printString,
                                                           ',\nh ',
                                                           reason, '\n',
                                                           e. ].
              ].
            ].
            sortedSlotSet add: aChain.
            sortedSlots addLast: aChain.
            pth remove: aChain.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'fileOut' -> () From: ( | {
         'Category: utilities\x7fModuleInfo: Module: fileOut InitialContents: FollowSlot\x7fVisibility: private'
        
         time: b = ( | {
                 'ModuleInfo: Module: fileOut InitialContents: FollowSlot'
                
                 r.
                } 
            | 
            (' in ', ( [r: b value] time / 1000) printString, ' secs.') printLine.
            r).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'fileOut' -> () From: ( | {
         'Category: top-level slots\x7fCategory: sorting & iterating\x7fModuleInfo: Module: fileOut InitialContents: FollowSlot\x7fVisibility: private'
        
         topLevelSlotsDo: slotBlock = ( |
             sortedSlots.
            | 

            "  userQuery show: 'topologically sorting'
               While: [ sortedSlots: slotSorter copyAndSortSlotsFor: self ]."

            sortedSlots: slotSorter copyAndSortSlotsFor: self.
            sortedSlots do: [|:c|  slotBlock value: c. ].

            self).
        } | ) 



 '-- Side effects'

 globals modules fileOut postFileIn
