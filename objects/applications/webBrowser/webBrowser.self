 '$Revision: 30.8 $'
 '
Copyright 1992-2012 AUTHORS.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         webBrowser = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'webBrowser' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'comment' From:
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'webBrowser' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules webBrowser.

CopyDowns:
globals modules init. copy 
SlotsToOmit: comment directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'webBrowser' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'applications/webBrowser'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'webBrowser' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'webBrowser' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot\x7fVisibility: private'
        
         myComment <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'webBrowser' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         postFileIn = ( |
            | 
            webBrowser cachedWebImageMorph resetCacheSemaphore.
            snapshotAction addSchedulerInitialMessage:  
              message copy receiver: webBrowser cachedWebImageMorph
                           Selector: 'resetCacheSemaphore'.
            worldMorph addBackgroundMenuContributor: webBrowser hotlistMorph.
            resend.postFileIn).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'webBrowser' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- '$Revision: 30.8 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'webBrowser' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: InitializeToExpression: (\'
xBitmapMaker
xPixmapMaker
\')\x7fVisibility: public'
        
         subpartNames <- '
xBitmapMaker
xPixmapMaker
'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: applications\x7fModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         webBrowser = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'webBrowser' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals webBrowser.
\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> () From: ( | {
         'Category: prototypes\x7fCategory: morphs\x7fModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         anchorMorph = bootstrap define: bootstrap stub -> 'globals' -> 'webBrowser' -> 'anchorMorph' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             bootstrap remove: 'prototype' From:
             globals morph copyRemoveAllMorphs ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'webBrowser' -> 'anchorMorph' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals webBrowser anchorMorph.

CopyDowns:
globals morph. copyRemoveAllMorphs 
SlotsToOmit: parent prototype.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'anchorMorph' -> () From: ( | {
         'Category: anchor state\x7fModuleInfo: Module: webBrowser InitialContents: InitializeToExpression: (\'\')'
        
         name <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'anchorMorph' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'webBrowser' -> 'anchorMorph' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals webBrowser anchorMorph parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'anchorMorph' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         button = ( |
            | firstMorph).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'anchorMorph' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot\x7fVisibility: public'
        
         copyName: n Section: s URL: u = ( |
            | 
            (((copy name: n) section: s) url: u) initialize).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'anchorMorph' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         editor: e = ( |
            | 
            button color: e color.
            color: e color.
            button addMorph: e).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'anchorMorph' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         followHyperlink = ( |
             offset <- (0)@(0).
             p.
             u.
            | 
            u: (
                mapImageMorphIfPresent: [|:im|
                   url withPositionSuffixFor: 
                        process this birthEvent cursorPoint - im globalPosition
               ] IfAbsent: url
            ) asURL.
            p: u getPageIfUserMovedIt: [|:p| p]  Else: [|:p|
                   isInWorld ifTrue: [
                     world safelyDo: [world addMorph: p.  world moveToFront: p].
                   ].
                   p moveToPosition: process this hand globalPosition.
                   p
            ].
            section isEmpty ifFalse: [
              p allMorphsDo: [|:a|
                (a morphTypeName = morphTypeName)  &&  [a name = section]
                 ifTrue: [
                  offset: a globalPosition - globalPosition.
                ].
              ].
            ].

            p moveToPosition: p globalPosition - offset.

            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'anchorMorph' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         initialize = ( |
             b.
             e.
             fmt.
            | 
            b: ui2Button copy target: self.
            b script: 'target followHyperlink'.
            b isAsynchronous: true.
            addMorph: b.
            beShrinkWrap.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'anchorMorph' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         mapImageMorphIfPresent: pb IfAbsent: ab = ( |
            | 
            allMorphsDo: [|:m|
              (m morphTypeName = 'webImageMorph') || [m morphTypeName = 'cachedWebImageMorph']
                ifTrue: [ m isMap  ifTrue: [^ pb value: m]].
            ].
            ab value).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'anchorMorph' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         morphTypeName = 'anchorMorph'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'anchorMorph' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'morph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'anchorMorph' -> () From: ( | {
         'Category: filing out\x7fModuleInfo: Module: webBrowser InitialContents: FollowSlot\x7fVisibility: public'
        
         prototype = ( |
            | 
            webBrowser anchorMorph).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'anchorMorph' -> () From: ( | {
         'Category: anchor state\x7fModuleInfo: Module: webBrowser InitialContents: InitializeToExpression: (\'\')'
        
         section <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> () From: ( | {
         'Category: prototypes\x7fModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         url = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'webBrowser' -> 'url' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals webBrowser url.
\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'anchorMorph' -> () From: ( | {
         'Category: anchor state\x7fModuleInfo: Module: webBrowser InitialContents: InitializeToExpression: (webBrowser url)'
        
         url <- bootstrap stub -> 'globals' -> 'webBrowser' -> 'url' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> () From: ( | {
         'Category: prototypes\x7fCategory: morphs\x7fModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         appletMorph = bootstrap define: bootstrap stub -> 'globals' -> 'webBrowser' -> 'appletMorph' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals frameMorph copyRemoveAllMorphs ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'webBrowser' -> 'appletMorph' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals webBrowser appletMorph.

CopyDowns:
globals frameMorph. copyRemoveAllMorphs 
SlotsToOmit: parent.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'appletMorph' -> () From: ( | {
         'Category: applet\x7fModuleInfo: Module: webBrowser InitialContents: InitializeToExpression: (byteVector copySize: 0)'
        
         codeBytes <- byteVector copySize: 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'appletMorph' -> () From: ( | {
         'Category: applet\x7fModuleInfo: Module: webBrowser InitialContents: InitializeToExpression: (nil \"webBrowser url copy\")'
        
         codeURL.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'appletMorph' -> () From: ( | {
         'Category: applet\x7fModuleInfo: Module: webBrowser InitialContents: InitializeToExpression: (dictionary copyRemoveAll)'
        
         params <- dictionary copyRemoveAll.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'appletMorph' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'webBrowser' -> 'appletMorph' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals webBrowser appletMorph parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'appletMorph' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot\x7fVisibility: public'
        
         copy = ( |
            | resend.copy params: params copy).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'appletMorph' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot\x7fVisibility: public'
        
         finishApplet = ( |
            | 
            codeBytes: codeURL getContentsString.
            addMorph:
             (( ui2Button copy
                label: 'Sorry, applets do not work yet.' )
                colorAll: owner color )
                script: 'event sourceHand attach: implementorsMorph copySelector: \'finishApplet\''.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'appletMorph' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot\x7fVisibility: public'
        
         morphTypeName = 'appletMorph'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'appletMorph' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'frameMorph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'url' -> () From: ( | {
         'Category: state\x7fModuleInfo: Module: webBrowser InitialContents: InitializeToExpression: (\'\')'
        
         dir <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'url' -> () From: ( | {
         'Category: state\x7fModuleInfo: Module: webBrowser InitialContents: InitializeToExpression: (\'\')'
        
         file <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'url' -> () From: ( | {
         'Category: state\x7fModuleInfo: Module: webBrowser InitialContents: InitializeToExpression: (\'\')'
        
         host <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'url' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'webBrowser' -> 'url' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals webBrowser url parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'url' -> 'parent' -> () From: ( | {
         'Category: comparing\x7fModuleInfo: Module: webBrowser InitialContents: FollowSlot\x7fVisibility: public'
        
         = x = ( |
            | asURL unparse = x asURL unparse).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'url' -> 'parent' -> () From: ( | {
         'Category: parsing\x7fModuleInfo: Module: webBrowser InitialContents: FollowSlot\x7fVisibility: public'
        
         asURL = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'url' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot\x7fVisibility: public'
        
         copyParsing: s = ( |
            | 
            (copy rawString: s) parse).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'url' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         defaultPort = 80.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'url' -> 'parent' -> () From: ( | {
         'Category: unparsing\x7fModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         dirWithPunct = ( |
             ds.
            | 
            ds: case
             if: [ dir isEmpty ] Then: '/'
             If: [ dir = '/'   ] Then: '/'
             If: [ dir last = '/' ] Then: dir
             Else: [dir, '/'].

            ds first = '/'  ifTrue: ds False: ['/', ds]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'url' -> 'parent' -> () From: ( | {
         'Category: unparsing\x7fModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         fileWithPunct = ( |
            | 
            file).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'url' -> 'parent' -> () From: ( | {
         'Category: getting Web pages\x7fModuleInfo: Module: webBrowser InitialContents: FollowSlot\x7fVisibility: public'
        
         getContentsString = ( |
            | 
            "ask the server for my string"
            webBrowser localRequester copy getURL: self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'url' -> 'parent' -> () From: ( | {
         'Category: getting Web pages\x7fModuleInfo: Module: webBrowser InitialContents: FollowSlot\x7fVisibility: public'
        
         getPage = ( |
            | 
            getPageIfUserMovedIt: [|:p| p] Else: [|:p| p]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'url' -> 'parent' -> () From: ( | {
         'Category: getting Web pages\x7fModuleInfo: Module: webBrowser InitialContents: FollowSlot\x7fVisibility: public'
        
         getPageForUser = ( |
            | 
            getPageIfUserMovedIt: [|:p|                                               p ]
                            Else: [|:p| p safelyDo: [ process this hand attach: p ].  p ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'url' -> 'parent' -> () From: ( | {
         'Category: getting Web pages\x7fModuleInfo: Module: webBrowser InitialContents: FollowSlot\x7fVisibility: public'
        
         getPageIfUserMovedIt: movedBlock Else: unmovedBlock = ( |
            | 
            "get page, and if user moved it during construction, run movedBlock
             else run unmovedBlock"
            webBrowser webPage 
              findPageForURL:  self
                     InWorld:  process this hand world
                   IfPresent:  [|:p|  unmovedBlock value: p ]
                    IfAbsent:  [ makePageIfMoved: movedBlock Else: unmovedBlock ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'url' -> 'parent' -> () From: ( | {
         'Category: comparing\x7fModuleInfo: Module: webBrowser InitialContents: FollowSlot\x7fVisibility: public'
        
         hash = ( |
            | unparse hash).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'url' -> 'parent' -> () From: ( | {
         'Category: unparsing\x7fModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         hostWithPunct = ( |
            | 
            host isEmpty
              ifTrue: ''
               False: [ '//', host ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'url' -> 'parent' -> () From: ( | {
         'Category: getting Web pages\x7fModuleInfo: Module: webBrowser InitialContents: FollowSlot\x7fVisibility: public'
        
         makePageIfMoved: movedBlock Else: unmovedBlock = ( |
             p.
            | 
            "get page, and if user moved it during construction, run movedBlock
             else run unmovedBlock"

            p: webBrowser webPage makePageForURL: self.
            (
              ( p initialPosition = p position ) && [ p topmostOwner = process this hand world ]
                 ifTrue: [ unmovedBlock ]
                  False: [   movedBlock ]
            ) value: p).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'url' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'clonable' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'url' -> 'parent' -> () From: ( | {
         'Category: parsing\x7fModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         parse = ( |
            | 
            parseService.
            parseHost.
            parsePort.
            parseDir.
            parseFile.
            parseSuffix).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'url' -> 'parent' -> () From: ( | {
         'Category: parsing\x7fModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         parseDir = ( |
             lastSlash.
            | 
            lastSlash: [|:exit|
              rawString reverseDo: [|:c. :i | c = '/'  ifTrue: [exit value: i]].
              -1
            ] exitValue.
            dir: rawString copySize: lastSlash succ max: 0.

            rawString: rawString copyFrom: lastSlash succ).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'url' -> 'parent' -> () From: ( | {
         'Category: parsing\x7fModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         parseFile = ( |
            | 
            file: rawString).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'url' -> 'parent' -> () From: ( | {
         'Category: parsing\x7fModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         parseHost = ( |
             pastHost.
            | 
            ('//' isPrefixOf: rawString) ifFalse: [^ self].
            rawString: rawString copyFrom: '//' size.
            pastHost: rawString
              findFirst: [|:c| ( c = '/' )  ||  [c = ':']]
              IfPresent: [|:c. :i| i]
               IfAbsent: rawString size.
            host: rawString copySize: pastHost.
            rawString: rawString copyFrom: pastHost).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'url' -> 'parent' -> () From: ( | {
         'Category: parsing\x7fModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         parsePort = ( |
             p.
             pastPort.
            | 
            rawString isEmpty || [ rawString first != ':' ]  ifTrue: [ port: defaultPort. ^ self].
            rawString: rawString copyFrom: ':' size.
            pastPort: 
              rawString 
               findFirst: [|:c| c isDigit not]
               IfPresent: [|:c. :i| i]
                IfAbsent:  rawString size.
            p: rawString copySize: pastPort.
            port: p isEmpty ifTrue: defaultPort False: [p asInteger].
            rawString: rawString copyFrom: pastPort).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'url' -> 'parent' -> () From: ( | {
         'Category: parsing\x7fModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         parseService = ( |
            | 
            (
              rawString 
                findFirst: [|:c| c = '/']
                IfPresent: [|:c. :i|
                  (rawString copySize: i)
              ] IfAbsent: rawString
            ) findFirst: [|:c| c = ':']
               IfPresent: [|:c. :i|
                    service: rawString copySize: i.
                    rawString: rawString copyFrom: i succ.
            ]   IfAbsent: []).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'url' -> 'parent' -> () From: ( | {
         'Category: parsing\x7fModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         parseSuffix = ( |
            | 
            suffix:  [|:exit|
              file reverseDo: [|:c. :i|
                c = '.'  ifTrue: [ exit value: file copyFrom: i succ].
              ].
              ''
            ] exitValue).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'url' -> 'parent' -> () From: ( | {
         'Category: unparsing\x7fModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         portWithPunct = ( |
            | 
            port = defaultPort  
              ifTrue: ''
               False: [':', port printString]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'url' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot\x7fVisibility: public'
        
         relativeTo: originalURL = ( |
             defaultedHost <- bootstrap stub -> 'globals' -> 'false' -> ().
             defaultedService <- bootstrap stub -> 'globals' -> 'false' -> ().
             r.
            | 

            r: copy.
            case if: [ service isEmpty ] Then: [r service: originalURL service.  defaultedService: true]
                 If: [ service != originalURL service ] Then: [ ^ r ].

            case if: [ host isEmpty ] Then: [r host: originalURL host.  defaultedHost: true]
                 If: [ host != originalURL host ] Then: [ ^ r ].

            case if: [ ( port = defaultPort ) && defaultedService && defaultedHost] Then: [r port: originalURL port]
                 If: [ port != originalURL port ] Then: [ ^ r ].

            case if: [ dir isEmpty      ] Then: [r dir: originalURL dir]
                 If: [ dir first != '/' ] Then: [ r dir: originalURL dirWithPunct, dir ]
                 If: [ service != originalURL service ] Then: [ ^ r ].

            case if: [ file isEmpty && [ dir isEmpty ]] Then: [r file: originalURL file. r parseSuffix. ].

            r).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'url' -> 'parent' -> () From: ( | {
         'Category: unparsing\x7fModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         serviceWithPunct = ( |
            | 
            service isEmpty
              ifTrue: ''
               False: [ service, ':' ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'url' -> 'parent' -> () From: ( | {
         'Category: printing\x7fModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         statePrintString = ( |
            | unparse).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'url' -> 'parent' -> () From: ( | {
         'Category: printing\x7fModuleInfo: Module: webBrowser InitialContents: FollowSlot\x7fVisibility: public'
        
         storeStringIfFail: fb = ( |
            | 
            'webBrowser url copyParsing: ', unparse canonicalize storeString).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'url' -> 'parent' -> () From: ( | {
         'Category: printing\x7fModuleInfo: Module: webBrowser InitialContents: FollowSlot\x7fVisibility: public'
        
         storeStringNeeds = ( |
            | webBrowser url).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'url' -> 'parent' -> () From: ( | {
         'Category: unparsing\x7fModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         unparse = ( |
            | 
            serviceWithPunct,
            hostWithPunct,
            portWithPunct,
            dirWithPunct,
            fileWithPunct).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'url' -> 'parent' -> () From: ( | {
         'Category: unparsing\x7fModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         uri = ( |
            | 
            dirWithPunct, fileWithPunct).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'url' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot\x7fVisibility: public'
        
         withPositionSuffixFor: pt = ( |
            | 
            copyParsing: unparse, 
                         '?', pt x printString, 
                         ',', pt y printString).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'url' -> () From: ( | {
         'Category: state\x7fModuleInfo: Module: webBrowser InitialContents: InitializeToExpression: (80)'
        
         port <- 80.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'url' -> () From: ( | {
         'Category: state\x7fModuleInfo: Module: webBrowser InitialContents: InitializeToExpression: (\'\')'
        
         rawString <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'url' -> () From: ( | {
         'Category: state\x7fModuleInfo: Module: webBrowser InitialContents: InitializeToExpression: (\'\')'
        
         service <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'url' -> () From: ( | {
         'Category: state\x7fModuleInfo: Module: webBrowser InitialContents: InitializeToExpression: (\'\')'
        
         suffix <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> () From: ( | {
         'Category: prototypes\x7fCategory: morphs\x7fModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         webImageMorph = bootstrap define: bootstrap stub -> 'globals' -> 'webBrowser' -> 'webImageMorph' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             bootstrap remove: 'prototype' From:
             globals imageMorph copyRemoveAllMorphs ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'webBrowser' -> 'webImageMorph' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals webBrowser webImageMorph.

CopyDowns:
globals imageMorph. copyRemoveAllMorphs 
SlotsToOmit: parent prototype.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'webImageMorph' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: InitializeToExpression: (\'\')'
        
         alternateText <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'webImageMorph' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: InitializeToExpression: (false)'
        
         isMap <- bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'webImageMorph' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'webBrowser' -> 'webImageMorph' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals webBrowser webImageMorph parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'webImageMorph' -> 'parent' -> () From: ( | {
         'Category: construction\x7fModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         addAlternateText = ( |
            | 
            alternateText isEmpty ifFalse: [
              addMorph: (
                 labelMorph copy label: alternateText )
                                 color: paint named: 'royal'
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'webImageMorph' -> 'parent' -> () From: ( | {
         'Category: construction\x7fCategory: GIF\x7fModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         asyncGIFStart: str Requester: req = ( |
             fn.
             i.
            | 
            fn: writeToTempFile: str, req getRest.
            i: ui2Image copyFromGIFFile: fn.
            safelyDo: [ setImage: i ].
            os unlink: fn IfFail: [].
            cacheMe.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'webImageMorph' -> 'parent' -> () From: ( | {
         'Category: construction\x7fCategory: GIF\x7fModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         buildGIFImage = ( |
             req.
             str.
             sz.
            | 
            req: webBrowser localRequester copy.
            req getURL: sourceURL Limit: 0.
            str: stripMimeHeaderWhileReadingFrom: req socket.
            str: str, (req getRestLimit: 0 max: 10 - str size).
            ('gif' isPrefixOf: str uncapitalizeAll) ifFalse: [
              ^ cannotParseSource: str, req getRest.
            ].
            sz: ((str at: 6) asByte + ((str at: 7) asByte * 256))
            @   ((str at: 8) asByte + ((str at: 9) asByte * 256)).
            (sz x > 2000) || [sz y > 2000]  ifTrue: [error: 'too big...something is wrong'].
            setImage: ui2Image copyWidth: sz x Height: sz y 
                                                Color: paint named: 'gray'.
            (message copy receiver: self 
                          Selector: 'asyncGIFStart:Requester:'   
                              With: str With: req) fork.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'webImageMorph' -> 'parent' -> () From: ( | {
         'Category: construction\x7fModuleInfo: Module: webBrowser InitialContents: FollowSlot\x7fVisibility: private'
        
         buildImage = ( |
            | 
            case
              if:   [ sourceURL suffix uncapitalizeAll = 'gif' ]
              Then: [ buildGIFImage ]
              If:   [ sourceURL suffix uncapitalizeAll = 'jpg' ]
              Then: [ buildJPGImageSource: (stripMimeHeader: sourceURL getContentsString) ]
              If:   [ sourceURL suffix uncapitalizeAll = 'png' ]
              Then: [ buildPNGImageSource: (stripMimeHeader: sourceURL getContentsString) ]
              If:   [ sourceURL suffix = 'xbm' ]
              Then: [ buildXBitmapImage ]
              Else: [ cannotBuildImage  ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'webImageMorph' -> 'parent' -> () From: ( | {
         'Category: construction\x7fModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         buildImageSource: s = ( |
            | 
            case
              if:  [ sourceURL suffix uncapitalizeAll = 'gif' ]
              Then: [ | tfn |
                    ( 'gif' isPrefixOf: (s copySize: 3) uncapitalizeAll ) ifFalse: [
                             ^ cannotParseSource: s
                     ] True: [  | tfn.   | 
                             tfn: writeToTempFile: s. 
                             setImage:  ui2Image copyFromGIFFile: tfn. 
                             os unlink: tfn IfFail: []. 
                     ]
              ]
              If:   [ sourceURL suffix uncapitalizeAll = 'xbm' ]
              Then: [ | tfn.  | 
                             tfn: writeToTempFile: s. 
                             setImage:  ui2Image copyFromBitmapFile: tfn. 
                             os unlink: tfn IfFail: []. ]
              If:   [ sourceURL suffix uncapitalizeAll = 'jpg' ]
              Then: [ buildJPEGImageSource: s ]
              If:   [ sourceURL suffix uncapitalizeAll = 'png' ]
              Then: [ buildPNGImageSource: s ]
              Else: [ cannotBuildImage ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'webImageMorph' -> 'parent' -> () From: ( | {
         'Category: construction\x7fCategory: JPEG\x7fModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         buildJPEGImageSource: s = ( |
             tfn.
            | 
            tfn: writeToTempFile: s. 
            setImage:  ui2Image copyFromJPEGFile: tfn. 
            os unlink: tfn IfFail: [].
            cacheMe.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'webImageMorph' -> 'parent' -> () From: ( | {
         'Category: construction\x7fCategory: PNG\x7fModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         buildPNGImageSource: s = ( |
             tfn.
            | 
            tfn: writeToTempFile: s. 
            setImage:  ui2Image copyFromPNGFile: tfn. 
            os unlink: tfn IfFail: [].
            cacheMe.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'webImageMorph' -> 'parent' -> () From: ( | {
         'Category: construction\x7fCategory: XBM (X bitmap)\x7fModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         buildXBitmapImage = ( |
             a.
             sz.
             tfn.
            | 
            a: webBrowser localRequester copy getURL: sourceURL.
            a: stripMimeHeader: a.
            tfn: writeToTempFile: a. 
            setImage:  ui2Image copyFromBitmapFile: tfn. 
            os unlink: tfn IfFail: [].
            cacheMe.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'webImageMorph' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         cacheMe = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'webImageMorph' -> 'parent' -> () From: ( | {
         'Category: construction\x7fModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         cannotBuildImage = ( |
            | 
            (
              userQuery askYesNo: 'Cannot show: ', sourceURL unparse, 
                                  ' only .gif and .xbm implemented so far, sorry.\n',
                                  ' Do you want to open a debugger?'
            ) ifTrue: [halt: 'debugger opened at your request'].

            addAlternateText.
            setDummyImage).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'webImageMorph' -> 'parent' -> () From: ( | {
         'Category: construction\x7fModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         cannotParseSource: s = ( |
            | 
            addAlternateText.
            setDummyImage.
            insertWebPageForSource: s.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'webImageMorph' -> 'parent' -> () From: ( | {
         'Category: copying\x7fModuleInfo: Module: webBrowser InitialContents: FollowSlot\x7fVisibility: public'
        
         copyURL: u AlternateText: alt IsMap: mapBool = ( |
            | 
            (((copy sourceURL: u asURL) alternateText: alt) isMap: mapBool) buildImage).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'webImageMorph' -> 'parent' -> () From: ( | {
         'Category: copying\x7fModuleInfo: Module: webBrowser InitialContents: FollowSlot\x7fVisibility: public'
        
         copyURL: u ImageSource: s = ( |
            | 
            (copy sourceURL: u asURL) buildImageSource: s).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'webImageMorph' -> 'parent' -> () From: ( | {
         'Category: construction\x7fModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         insertWebPageForSource: s = ( |
             p.
            | 
            "useful for debugging, turn off for now"
            true ifTrue: [^ self].
            p: webBrowser htmlParser copy parseHTMLNoMatterWhatInputString: s SourceURL: sourceURL.
            safelyDo: [ | f. m | 
              m: p rootMorph.
              m delete. 
              m position: 0@0. 
              f: frameMorph copy.
              f frameStyle: f insetBezelStyle.
              f beShrinkWrap.
              f color: m color.
              f addMorph: m.
              addMorph: f.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'webImageMorph' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         morphTypeName = 'webImageMorph'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'webImageMorph' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'imageMorph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'webImageMorph' -> 'parent' -> () From: ( | {
         'Category: construction\x7fModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         quantizeImageColorsIfDesired: image = ( |
            | 
            "central point for quantization of images"
            image quantizeColors).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'webImageMorph' -> 'parent' -> () From: ( | {
         'Category: construction\x7fModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         setDummyImage = ( |
             s.
            | 
            s: 10@10.
            morphCount = 0 ifFalse: [  s: s min: firstMorph baseBounds size ].
            setImage: ui2Image copyWidth: s x Height: s y Color: paint named: 'red').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'webImageMorph' -> 'parent' -> () From: ( | {
         'Category: construction\x7fModuleInfo: Module: webBrowser InitialContents: FollowSlot\x7fVisibility: public'
        
         setImage: image = ( |
            | 
            resend.setImage: quantizeImageColorsIfDesired: image).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'webImageMorph' -> 'parent' -> () From: ( | {
         'Category: construction\x7fModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         stripMimeHeader: s = ( |
             i <- 0.
            | 
            "quick hack!"
            ('HTTP' isPrefixOf: s) ifFalse: [^ s].
            [

              (s at: i) = '\r' ifTrue: [i: i succ].
              [(s at: i) = '\n'] whileFalse: [i: i succ].
              i: i succ.
              (s at: i) = '\r' ifTrue: [i: i succ].
              (s at: i) = '\n' ifTrue: [^ s copyFrom: i succ].
            ] loop).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'webImageMorph' -> 'parent' -> () From: ( | {
         'Category: construction\x7fModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         stripMimeHeaderWhileReadingFrom: skt = ( |
             pre = 'HTTP'.
             s.
            | 
            s: skt readCount: pre size.
            s = pre ifFalse: [^ s].
            [
              skt atEOF ifTrue: [^ ''].
              s: skt readLine.
              s isEmpty || [ s = '\r' ] ifTrue: [^ ''].
            ] loop).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'webImageMorph' -> 'parent' -> () From: ( | {
         'Category: construction\x7fModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         writeToTempFile: s = ( |
             tf.
             tfn.
            | 
            tfn: os_file temporaryFileName.
            tf: os_file openForWriting: tfn.
            tf write: s.
            tf close.
            tfn).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'webImageMorph' -> () From: ( | {
         'Category: filing out\x7fModuleInfo: Module: webBrowser InitialContents: FollowSlot\x7fVisibility: public'
        
         prototype = ( |
            | 
            webBrowser webImageMorph).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'webImageMorph' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: InitializeToExpression: (webBrowser url)'
        
         sourceURL <- bootstrap stub -> 'globals' -> 'webBrowser' -> 'url' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> () From: ( | {
         'Category: prototypes\x7fCategory: morphs\x7fModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         cachedWebImageMorph = bootstrap define: bootstrap stub -> 'globals' -> 'webBrowser' -> 'cachedWebImageMorph' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             bootstrap remove: 'prototype' From:
             globals webBrowser webImageMorph copyRemoveAllMorphs ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'webBrowser' -> 'cachedWebImageMorph' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals webBrowser cachedWebImageMorph.

CopyDowns:
globals webBrowser webImageMorph. copyRemoveAllMorphs 
SlotsToOmit: parent prototype.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'cachedWebImageMorph' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'webBrowser' -> 'cachedWebImageMorph' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals webBrowser cachedWebImageMorph parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'cachedWebImageMorph' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         buildImage = ( |
            | 
            tryCacheThen: [ resend.buildImage ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'cachedWebImageMorph' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         buildImageSource: s = ( |
            | 
            tryCacheThen: [ resend.buildImageSource: s ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'cachedWebImageMorph' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: InitializeToExpression: (sharedQueue copy removeAll)'
        
         cache <- sharedQueue copy removeAll.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'cachedWebImageMorph' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: InitializeToExpression: (15)'
        
         cacheLimit <- 15.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'cachedWebImageMorph' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         cacheMe = ( |
            | 
            cache addFirst: self.
            cache size > cacheLimit  ifTrue: [cache removeLast].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'cachedWebImageMorph' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         color = ( |
            | image colors first).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'cachedWebImageMorph' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         isCachedIfPresent: pb IfAbsent: ab = ( |
            | 
            cache findFirst: [|:m| m sourceURL = sourceURL]
                  IfPresent: [|:m| pb value: m]
                   IfAbsent: ab).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'cachedWebImageMorph' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         morphTypeName = 'cachedWebImageMorph'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'cachedWebImageMorph' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         moveToFrontOfCache: m = ( |
            | 
            cache remove: m.
            cache addFirst: m.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'cachedWebImageMorph' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'globals' -> 'webBrowser' -> 'webImageMorph' -> 'parent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'cachedWebImageMorph' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot\x7fVisibility: public'
        
         resetCacheSemaphore = ( |
            | cache resetLock. self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'cachedWebImageMorph' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         tryCacheThen: missingBlock = ( |
            | 
            isCachedIfPresent: [|:m| moveToFrontOfCache: m.  setImage: m image ]
                    IfAbsent:   missingBlock).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'cachedWebImageMorph' -> () From: ( | {
         'Category: filing out\x7fModuleInfo: Module: webBrowser InitialContents: FollowSlot\x7fVisibility: public'
        
         prototype = ( |
            | 
            webBrowser cachedWebImageMorph).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> () From: ( | {
         'Category: prototypes\x7fCategory: requesters\x7fModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         configurationRequester = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'webBrowser' -> 'configurationRequester' -> () From: ( |
             {} = 'Comment: I am a fake requester that
gets the user to set the configuration
on the first use.\x7fModuleInfo: Creator: globals webBrowser configurationRequester.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'configurationRequester' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot\x7fVisibility: public'
        
         getURL: url = ( |
            | 
            webBrowser setProxy.
            webBrowser localRequester getURL: url).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'configurationRequester' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot\x7fVisibility: public'
        
         getURL: url Limit: lim = ( |
            | 
            webBrowser setProxy.
            webBrowser localRequester getURL: url Limit: lim).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'configurationRequester' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'oddball' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> () From: ( | {
         'Comment: -- Ungar, 5/30/95\x7fModuleInfo: Module: webBrowser InitialContents: FollowSlot\x7fVisibility: public'
        
         escapeHTTPString: str = ( |
             r.
            | 
            str isEmpty ifTrue: [^ ''].
            r: ''.
            str do: [|:s|
              r: r & (
                case if: [ s isDigit || [ s isLetter ] ]  Then: s
                     If: [ s = ' ' ] Then: '+'
                     Else: [ '%', (s asByte printStringBase: 16 PadWith: '0' ToSize: 2) capitalizeAll ] )
            ].
            r flatString).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> () From: ( | {
         'Category: prototypes\x7fCategory: morphs\x7fCategory: forms\x7fModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         formFieldMorph = bootstrap define: bootstrap stub -> 'globals' -> 'webBrowser' -> 'formFieldMorph' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             bootstrap remove: 'prototype' From:
             globals morph copyRemoveAllMorphs ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'webBrowser' -> 'formFieldMorph' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals webBrowser formFieldMorph.

CopyDowns:
globals morph. copyRemoveAllMorphs 
SlotsToOmit: parent prototype.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'formFieldMorph' -> () From: ( | {
         'Category: Form Field State\x7fModuleInfo: Module: webBrowser InitialContents: InitializeToExpression: (\'\')'
        
         name <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'formFieldMorph' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'webBrowser' -> 'formFieldMorph' -> 'parent' -> () From: ( |
             {} = 'Comment: I hold shared behavior for form fields\x7fModuleInfo: Creator: globals webBrowser formFieldMorph parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'formFieldMorph' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         canSubmitForm = bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'formFieldMorph' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         enclosingForm = ( |
             o.
            | 
            o: self.
            [
              o: o owner.
              case if: [ nil = o ]  Then: [ error: 'this form input tag is not in a form' ]
                   If: [ o morphTypeName = 'formMorph' ] Then: [ ^ o ].
            ] loop).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'formFieldMorph' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot\x7fVisibility: public'
        
         isFormFieldMorph = bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'formFieldMorph' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         morphTypeName = 'formFieldMorph'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'formFieldMorph' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot\x7fVisibility: public'
        
         nameValueString = ( |
            | 
            (webBrowser escapeHTTPString: name), 
            '=', 
            (webBrowser escapeHTTPString: resultValue)).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'formFieldMorph' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'morph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'formFieldMorph' -> 'parent' -> () From: ( | {
         'Comment: Reset to orig. value
-- Ungar, 5/31/95\x7fModuleInfo: Module: webBrowser InitialContents: FollowSlot\x7fVisibility: public'
        
         reset = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'formFieldMorph' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         prototype = ( |
            | webBrowser formFieldMorph).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> () From: ( | {
         'Category: prototypes\x7fCategory: morphs\x7fCategory: forms\x7fModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         formInputMorph = bootstrap define: bootstrap stub -> 'globals' -> 'webBrowser' -> 'formInputMorph' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             bootstrap remove: 'prototype' From:
             globals webBrowser formFieldMorph copyRemoveAllMorphs ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'webBrowser' -> 'formInputMorph' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals webBrowser formInputMorph.

CopyDowns:
globals webBrowser formFieldMorph. copyRemoveAllMorphs 
SlotsToOmit: parent prototype.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'formInputMorph' -> () From: ( | {
         'Category: input state\x7fModuleInfo: Module: webBrowser InitialContents: InitializeToExpression: (false)'
        
         checked <- bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'formInputMorph' -> () From: ( | {
         'Category: input state\x7fModuleInfo: Module: webBrowser InitialContents: InitializeToExpression: (infinity)'
        
         maxLength <- infinity.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'formInputMorph' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'webBrowser' -> 'formInputMorph' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals webBrowser formInputMorph parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'formInputMorph' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         initialize = ( |
            | 
            "child's job"
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'formInputMorph' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         morphTypeName = 'formInputMorph'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'formInputMorph' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'globals' -> 'webBrowser' -> 'formFieldMorph' -> 'parent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'formInputMorph' -> () From: ( | {
         'Category: filing out\x7fModuleInfo: Module: webBrowser InitialContents: FollowSlot\x7fVisibility: public'
        
         prototype = ( |
            | 
            webBrowser formInputMorph).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'formInputMorph' -> () From: ( | {
         'Category: input state\x7fModuleInfo: Module: webBrowser InitialContents: InitializeToExpression: (20@1)'
        
         size <- 20@1.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'formInputMorph' -> () From: ( | {
         'Category: input state\x7fModuleInfo: Module: webBrowser InitialContents: InitializeToExpression: (\'\')'
        
         value <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> () From: ( | {
         'Category: prototypes\x7fCategory: morphs\x7fCategory: forms\x7fCategory: varieties of formInputMorph\x7fModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         formInputCheckBoxMorph = bootstrap define: bootstrap stub -> 'globals' -> 'webBrowser' -> 'formInputCheckBoxMorph' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             bootstrap remove: 'prototype' From:
             globals webBrowser formInputMorph copyRemoveAllMorphs ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'webBrowser' -> 'formInputCheckBoxMorph' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals webBrowser formInputCheckBoxMorph.

CopyDowns:
globals webBrowser formInputMorph. copyRemoveAllMorphs 
SlotsToOmit: parent prototype.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'formInputCheckBoxMorph' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'webBrowser' -> 'formInputCheckBoxMorph' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals webBrowser formInputCheckBoxMorph parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'formInputCheckBoxMorph' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         buttonProto = bootstrap stub -> 'globals' -> 'checkBoxMorph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'formInputCheckBoxMorph' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         morphTypeName = 'formInputCheckBoxMorph'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'formInputRadioMorph' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         radioOrCheckBoxParent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'webBrowser' -> 'formInputRadioMorph' -> 'parent' -> 'radioOrCheckBoxParent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals webBrowser formInputRadioMorph parent radioOrCheckBoxParent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'formInputCheckBoxMorph' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         radioOrCheckBoxParent* = bootstrap stub -> 'globals' -> 'webBrowser' -> 'formInputRadioMorph' -> 'parent' -> 'radioOrCheckBoxParent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'formInputCheckBoxMorph' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         prototype = ( |
            | 
            webBrowser formInputCheckBoxMorph).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> () From: ( | {
         'Category: prototypes\x7fCategory: morphs\x7fCategory: forms\x7fCategory: varieties of formInputMorph\x7fModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         formInputHiddenMorph = bootstrap define: bootstrap stub -> 'globals' -> 'webBrowser' -> 'formInputHiddenMorph' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             bootstrap remove: 'prototype' From:
             globals webBrowser formInputMorph copyRemoveAllMorphs ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'webBrowser' -> 'formInputHiddenMorph' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals webBrowser formInputHiddenMorph.

CopyDowns:
globals webBrowser formInputMorph. copyRemoveAllMorphs 
SlotsToOmit: parent prototype.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'formInputHiddenMorph' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'webBrowser' -> 'formInputHiddenMorph' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals webBrowser formInputHiddenMorph parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'formInputHiddenMorph' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         initialize = ( |
            | 
            color: paint named: 'lightGray'.
            setWidth: 0 Height: 0.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'formInputHiddenMorph' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         morphTypeName = 'formInputHiddenMorph'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'formInputHiddenMorph' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'globals' -> 'webBrowser' -> 'formInputMorph' -> 'parent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'formInputHiddenMorph' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         resultValue = ( |
            | value).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'formInputHiddenMorph' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         prototype = ( |
            | 
            webBrowser formInputHiddenMorph).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> () From: ( | {
         'Category: prototypes\x7fCategory: morphs\x7fCategory: forms\x7fCategory: varieties of formInputMorph\x7fModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         formInputImageMorph = bootstrap define: bootstrap stub -> 'globals' -> 'webBrowser' -> 'formInputImageMorph' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             bootstrap remove: 'prototype' From:
             globals webBrowser formInputMorph copyRemoveAllMorphs ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'webBrowser' -> 'formInputImageMorph' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals webBrowser formInputImageMorph.

CopyDowns:
globals webBrowser formInputMorph. copyRemoveAllMorphs 
SlotsToOmit: parent prototype.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'formInputImageMorph' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'webBrowser' -> 'formInputImageMorph' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals webBrowser formInputImageMorph parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'formInputImageMorph' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot\x7fVisibility: private'
        
         canSubmitForm = bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'formInputImageMorph' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         initializeImage: anImageMorph = ( |
            | 
            addMorph: ( ( ui2Button copyColor: color Target: self Inner: anImageMorph) 
                       isAsynchronous: true) 
                       script: 'target pressedAt: event cursorPoint - button firstMorph globalPosition'.
            beShrinkWrap.
            reset).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'formInputImageMorph' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         morphTypeName = 'formInputImageMorph'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'formInputImageMorph' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         nameValueString = ( |
            | 
            value = resultValue ifTrue: '' False: [resend.nameValueString]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'formInputImageMorph' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'globals' -> 'webBrowser' -> 'formInputMorph' -> 'parent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'formInputImageMorph' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         pressedAt: p = ( |
            | 
            " send from button script, see initializeImage:"
            resultValue: p x printString, ',', p y printString.
            enclosingForm submit.
            reset.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'formInputImageMorph' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         reset = ( |
            | resultValue: value).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'formInputImageMorph' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         prototype = ( |
            | webBrowser formInputImageMorph).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'formInputImageMorph' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: InitializeToExpression: (\'\')'
        
         resultValue <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> () From: ( | {
         'Category: prototypes\x7fCategory: morphs\x7fCategory: forms\x7fCategory: varieties of formInputMorph\x7fModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         formInputTextMorph = bootstrap define: bootstrap stub -> 'globals' -> 'webBrowser' -> 'formInputTextMorph' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             bootstrap remove: 'prototype' From:
             globals webBrowser formInputMorph copyRemoveAllMorphs ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'webBrowser' -> 'formInputTextMorph' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals webBrowser formInputTextMorph.

CopyDowns:
globals webBrowser formInputMorph. copyRemoveAllMorphs 
SlotsToOmit: parent prototype.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'formInputTextMorph' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: InitializeToExpression: (nil)'
        
         myEditor.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'formInputTextMorph' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'webBrowser' -> 'formInputTextMorph' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals webBrowser formInputTextMorph parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'formInputTextMorph' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         initialize = ( |
             f.
             lbl.
             r.
            | 
            myEditor: editorMorph copy.
            myEditor position: 0@0.
            reset.
            myEditor beFlexible.
            f: frameMorph copy frameStyle: frameMorph insetBezelStyle.
            f beShrinkWrap.
            f color: paint named: 'lightGray'.
            f addMorph: myEditor.
            lbl: labelMorph copy label: '' copySize: size x FillingWith: ' '.
            lbl position: -20000 @ -20000.
            process this hand safelyDo: [process this hand world addMorph: lbl].
            f beRigid.
            f setWidth: lbl baseBounds width Height: lbl baseBounds height * size y.
            lbl safelyDo: [ lbl delete ].
            beShrinkWrap.
            addMorph: f).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'formInputTextMorph' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         morphTypeName = 'formInputTextMorph'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'formInputTextMorph' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'globals' -> 'webBrowser' -> 'formInputMorph' -> 'parent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'formInputTextMorph' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         reset = ( |
            | 
            "cannot use setString directly because it
             loses the font information"
            myEditor setString: ''.
            setFont.
            myEditor appendString: value.
            value isEmpty ifFalse: [ myEditor selectAll ].
            layoutChanged.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'formInputTextMorph' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         resultValue = ( |
             s.
            | 
            s: myEditor firstMorph contentsString.
            s size > maxLength ifTrue: [
              userQuery report: 'The ', name, ' field is limited to ', 
                                maxLength printString, ' characters.\n',
                                'I will truncate it.'.
              s: s copySize: maxLength.
              myEditor setString: s.
            ].
            s).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'formInputTextMorph' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         setFont = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'formInputTextMorph' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         prototype = ( |
            | webBrowser formInputTextMorph).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> () From: ( | {
         'Category: prototypes\x7fCategory: morphs\x7fCategory: forms\x7fCategory: varieties of formInputMorph\x7fModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         formInputPasswordMorph = bootstrap define: bootstrap stub -> 'globals' -> 'webBrowser' -> 'formInputPasswordMorph' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             bootstrap remove: 'prototype' From:
             globals webBrowser formInputTextMorph copyRemoveAllMorphs ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'webBrowser' -> 'formInputPasswordMorph' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals webBrowser formInputPasswordMorph.

CopyDowns:
globals webBrowser formInputTextMorph. copyRemoveAllMorphs 
SlotsToOmit: parent prototype.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'formInputPasswordMorph' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'webBrowser' -> 'formInputPasswordMorph' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals webBrowser formInputPasswordMorph parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'formInputPasswordMorph' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         morphTypeName = 'formInputPasswordMorph'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'formInputPasswordMorph' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'globals' -> 'webBrowser' -> 'formInputTextMorph' -> 'parent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'formInputPasswordMorph' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot\x7fVisibility: private'
        
         setFont = ( |
            | 
            myEditor typer fontName: scalableFont password.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'formInputPasswordMorph' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         prototype = ( |
            | 
            webBrowser formInputPasswordMorph).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> () From: ( | {
         'Category: prototypes\x7fCategory: morphs\x7fCategory: forms\x7fCategory: varieties of formInputMorph\x7fModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         formInputRadioMorph = bootstrap define: bootstrap stub -> 'globals' -> 'webBrowser' -> 'formInputRadioMorph' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             bootstrap remove: 'prototype' From:
             globals webBrowser formInputMorph copyRemoveAllMorphs ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'webBrowser' -> 'formInputRadioMorph' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals webBrowser formInputRadioMorph.

CopyDowns:
globals webBrowser formInputMorph. copyRemoveAllMorphs 
SlotsToOmit: parent prototype.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'formInputRadioMorph' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'webBrowser' -> 'formInputRadioMorph' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals webBrowser formInputRadioMorph parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'formInputRadioMorph' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         buttonProto = bootstrap stub -> 'globals' -> 'checkCircleMorph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'formInputRadioMorph' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         morphTypeName = 'formInputRadioMorph'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'formInputRadioMorph' -> 'parent' -> 'radioOrCheckBoxParent' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         initialize = ( |
            | 
            addMorph: buttonProto copy.
            reset.
            beShrinkWrap.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'formInputRadioMorph' -> 'parent' -> 'radioOrCheckBoxParent' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         isDown = ( |
            | 
            myButtonMorph isDown).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'formInputRadioMorph' -> 'parent' -> 'radioOrCheckBoxParent' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         myButtonMorph = ( |
            | firstMorph).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'formInputRadioMorph' -> 'parent' -> 'radioOrCheckBoxParent' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         nameValueString = ( |
            | 
            isDown ifFalse: '' True: [resend.nameValueString]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'formInputRadioMorph' -> 'parent' -> 'radioOrCheckBoxParent' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'globals' -> 'webBrowser' -> 'formInputMorph' -> 'parent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'formInputRadioMorph' -> 'parent' -> 'radioOrCheckBoxParent' -> () From: ( | {
         'Comment: Reset to orig. value
-- Ungar, 5/31/95\x7fModuleInfo: Module: webBrowser InitialContents: FollowSlot\x7fVisibility: public'
        
         reset = ( |
            | 
            checked ifTrue: [  myButtonMorph   press ]
                     False: [  myButtonMorph unpress ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'formInputRadioMorph' -> 'parent' -> 'radioOrCheckBoxParent' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         resultValue = ( |
            | value).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'formInputRadioMorph' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         prototype = ( |
            | 
            webBrowser formInputRadioMorph).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> () From: ( | {
         'Category: prototypes\x7fCategory: morphs\x7fCategory: forms\x7fCategory: varieties of formInputMorph\x7fModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         formInputResetMorph = bootstrap define: bootstrap stub -> 'globals' -> 'webBrowser' -> 'formInputResetMorph' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             bootstrap remove: 'prototype' From:
             globals webBrowser formInputMorph copyRemoveAllMorphs ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'webBrowser' -> 'formInputResetMorph' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals webBrowser formInputResetMorph.

CopyDowns:
globals webBrowser formInputMorph. copyRemoveAllMorphs 
SlotsToOmit: parent prototype.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'formInputResetMorph' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'webBrowser' -> 'formInputResetMorph' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals webBrowser formInputResetMorph parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'formInputResetMorph' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         initialize = ( |
            | 
            addMorph: ((((
             ui2Button copy
              color: paint named: 'lightGray')
              label: value isEmpty ifTrue: 'Reset' False: value )
              target: self)
              script: 'target enclosingForm reset')
              isAsynchronous: true.
            beShrinkWrap.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'formInputResetMorph' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         morphTypeName = 'formInputResetMorph'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'formInputResetMorph' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         nameValueString = ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'formInputResetMorph' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'globals' -> 'webBrowser' -> 'formInputMorph' -> 'parent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'formInputResetMorph' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         prototype = ( |
            | 
            webBrowser formInputResetMorph).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> () From: ( | {
         'Category: prototypes\x7fCategory: morphs\x7fCategory: forms\x7fCategory: varieties of formInputMorph\x7fModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         formInputSubmitMorph = bootstrap define: bootstrap stub -> 'globals' -> 'webBrowser' -> 'formInputSubmitMorph' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             bootstrap remove: 'prototype' From:
             globals webBrowser formInputMorph copyRemoveAllMorphs ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'webBrowser' -> 'formInputSubmitMorph' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals webBrowser formInputSubmitMorph.

CopyDowns:
globals webBrowser formInputMorph. copyRemoveAllMorphs 
SlotsToOmit: parent prototype.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'formInputSubmitMorph' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'webBrowser' -> 'formInputSubmitMorph' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals webBrowser formInputSubmitMorph parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'formInputSubmitMorph' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         canSubmitForm = bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'formInputSubmitMorph' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         initialize = ( |
            | 
            color: paint named: 'lightGray'.
            addMorph: ((((
             ui2Button copy
              color: paint named: 'lightGray')
              label: value isEmpty ifTrue: 'Submit' False: value  )
              target: self)
              script: 'target submitForm')
              isAsynchronous: true.
            beShrinkWrap.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'formInputSubmitMorph' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         morphTypeName = 'formInputSubmitMorph'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'formInputSubmitMorph' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         nameValueString = ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'formInputSubmitMorph' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'globals' -> 'webBrowser' -> 'formInputMorph' -> 'parent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'formInputSubmitMorph' -> 'parent' -> () From: ( | {
         'Comment: sent from button script, find my form and submit it--dmu\x7fModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         submitForm = ( |
            | 
            enclosingForm submit).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'formInputSubmitMorph' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         prototype = ( |
            | 
            webBrowser formInputSubmitMorph).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> () From: ( | {
         'Category: prototypes\x7fCategory: morphs\x7fCategory: forms\x7fModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         formMorph = bootstrap define: bootstrap stub -> 'globals' -> 'webBrowser' -> 'formMorph' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             bootstrap remove: 'prototype' From:
             globals frameMorph copyRemoveAllMorphs ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'webBrowser' -> 'formMorph' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals webBrowser formMorph.

CopyDowns:
globals frameMorph. copyRemoveAllMorphs 
SlotsToOmit: parent prototype.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'formMorph' -> () From: ( | {
         'Category: Form State\x7fModuleInfo: Module: webBrowser InitialContents: InitializeToExpression: (webBrowser url)'
        
         actionURL <- bootstrap stub -> 'globals' -> 'webBrowser' -> 'url' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'formMorph' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         defaultParent = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'webBrowser' -> 'formMorph' -> 'defaultParent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals webBrowser formMorph defaultParent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'formMorph' -> 'defaultParent' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         addSubmitIfNeeded = ( |
            | 
            " Mosaic allows forms with no submit buttons,
              submit with return in lone text field.
              We just add a submit button if none."
            formFields 
              findFirst: [|:ff| ff canSubmitForm ]
              IfPresent: []
              IfAbsent:  [ 
                 | s |
                 s: webBrowser formInputSubmitMorph copy initialize.
                 safelyDo: [ addMorph: s.  moveToBack: s. ].
              ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'formMorph' -> 'defaultParent' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         copy = ( |
            | resend.copy borderWidth: 0).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'formMorph' -> 'defaultParent' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         finishForm = ( |
            | 
            makeButtonGroups.
            addSubmitIfNeeded).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'formMorph' -> 'defaultParent' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         formFields = ( |
            | 
            allMorphs copyFilteredBy: [|:m| m isFormFieldMorph]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'formMorph' -> 'defaultParent' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         getParent = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'webBrowser' -> 'formMorph' -> 'defaultParent' -> 'getParent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals webBrowser formMorph defaultParent getParent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'formMorph' -> 'defaultParent' -> 'getParent' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'globals' -> 'webBrowser' -> 'formMorph' -> 'defaultParent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'formMorph' -> 'defaultParent' -> 'getParent' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         requestData = ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'formMorph' -> 'defaultParent' -> 'getParent' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         requestName = 'GET'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'formMorph' -> 'defaultParent' -> 'getParent' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         submissionURL = ( |
            | 
            (actionURL unparse, '?', nameValuePairsString) asURL).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'formMorph' -> 'defaultParent' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         isindexParent = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'webBrowser' -> 'formMorph' -> 'defaultParent' -> 'isindexParent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals webBrowser formMorph defaultParent isindexParent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'formMorph' -> 'defaultParent' -> 'isindexParent' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         nameValuePairsString = ( |
            | 
            "trim = for isindex"
            resend.nameValuePairsString copyWithoutFirst).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'formMorph' -> 'defaultParent' -> 'isindexParent' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'globals' -> 'webBrowser' -> 'formMorph' -> 'defaultParent' -> 'getParent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'formMorph' -> 'defaultParent' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         makeButtonGroups = ( |
             grps.
            | 
            "group buttons with matching names"
            grps: dictionary copyRemoveAll.
            allMorphsDo: [|:rbo|
              (rbo morphTypeName = 'formInputRadioMorph') ifTrue: [
               | aFormInputMorph. bg. rb |
                rb: rbo firstMorph.
                aFormInputMorph: rb owner.
                bg: (grps if: aFormInputMorph name
                     IsPresentDo: [|:bg| bg]
                     IfAbsentPut: [radioButtonGroup copy]
                     AndDo: [|:bg| bg]).
                rb buttonGroup: bg.
                bg addButton: rb.
              ].
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'formMorph' -> 'defaultParent' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         morphTypeName = 'formMorph'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'formMorph' -> 'defaultParent' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         nameValuePairsString = ( |
             r <- ''.
            | 
            r: collector copyFirst: ''.
            ( (  formFields copyMappedBy: [|:fp| fp nameValueString] )
             copyFilteredBy: [|:s| s isEmpty not]
            )    doFirst:  [ |:s| r: r & s ]
              MiddleLast:  [ |:s|  r: r & '&' & s ]
                 IfEmpty: [ ^ '' ].
            r flatString).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'formMorph' -> 'defaultParent' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'frameMorph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'formMorph' -> 'defaultParent' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         postParent = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'webBrowser' -> 'formMorph' -> 'defaultParent' -> 'postParent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals webBrowser formMorph defaultParent postParent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'formMorph' -> 'defaultParent' -> 'postParent' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'globals' -> 'webBrowser' -> 'formMorph' -> 'defaultParent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'formMorph' -> 'defaultParent' -> 'postParent' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         requestData = ( |
             s.
            | 
            s: nameValuePairsString.
            'Content-type: application/x-www-form-urlencoded\r\n',
            'Content-length: ', ( s size )  printString, '\r\n\r\n',
            s, '\r\n').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'formMorph' -> 'defaultParent' -> 'postParent' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         requestName = 'POST'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'formMorph' -> 'defaultParent' -> 'postParent' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         submissionURL = ( |
            | 
            ['http://self.eng' asURL].
            actionURL).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'formMorph' -> 'defaultParent' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         reset = ( |
            | 
            "reset all to initial values"
            formFields do: [|:ff| ff reset].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'formMorph' -> 'defaultParent' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot\x7fVisibility: public'
        
         submit = ( |
             r.
             su.
            | 
            parent:
              case if: [ method uncapitalizeAll = 'get'     ] Then: [     getParent ]
                   If: [ method uncapitalizeAll = 'isindex' ] Then: [ isindexParent ]
                   If: [ method uncapitalizeAll = 'post'    ] Then: [    postParent ]
                   Else: [ getParent ] "get is default ".

            r: webBrowser localRequester copy.
            r requestName: requestName.
            r requestData: requestData.
            su: submissionURL.
            webBrowser htmlParser parseAndShow: ( r getURL: su ) From: su.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'formMorph' -> () From: ( | {
         'Category: Form State\x7fModuleInfo: Module: webBrowser InitialContents: InitializeToExpression: (\'x-www-form-urlencoded\')'
        
         encoding <- 'x-www-form-urlencoded'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'formMorph' -> () From: ( | {
         'Category: Form State\x7fModuleInfo: Module: webBrowser InitialContents: InitializeToExpression: (\'get\')'
        
         method <- 'get'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'formMorph' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: InitializeToExpression: (webBrowser formMorph defaultParent)'
        
         parent* <- bootstrap stub -> 'globals' -> 'webBrowser' -> 'formMorph' -> 'defaultParent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'formMorph' -> () From: ( | {
         'Category: filing out\x7fModuleInfo: Module: webBrowser InitialContents: FollowSlot\x7fVisibility: public'
        
         prototype = ( |
            | 
            webBrowser formMorph).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> () From: ( | {
         'Category: prototypes\x7fCategory: morphs\x7fCategory: forms\x7fModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         formSelectListMorph = bootstrap define: bootstrap stub -> 'globals' -> 'webBrowser' -> 'formSelectListMorph' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             bootstrap remove: 'prototype' From:
             globals webBrowser formFieldMorph copyRemoveAllMorphs ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'webBrowser' -> 'formSelectListMorph' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals webBrowser formSelectListMorph.

CopyDowns:
globals webBrowser formFieldMorph. copyRemoveAllMorphs 
SlotsToOmit: parent prototype.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'formSelectListMorph' -> () From: ( | {
         'Category: list building state\x7fModuleInfo: Module: webBrowser InitialContents: InitializeToExpression: (false)'
        
         allowMultipleSelections <- bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'formSelectListMorph' -> () From: ( | {
         'Category: list building state\x7fModuleInfo: Module: webBrowser InitialContents: InitializeToExpression: (false)'
        
         currentOptionIsSelected <- bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'formSelectListMorph' -> () From: ( | {
         'Category: list building state\x7fModuleInfo: Module: webBrowser InitialContents: InitializeToExpression: (1)'
        
         numberOfShownChoices <- 1.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'formSelectListMorph' -> () From: ( | {
         'Category: list building state\x7fModuleInfo: Module: webBrowser InitialContents: InitializeToExpression: (nil)'
        
         options.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'formSelectListMorph' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'webBrowser' -> 'formSelectListMorph' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals webBrowser formSelectListMorph parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'formSelectListMorph' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot\x7fVisibility: public'
        
         addSelectOptionToForm: optionTag = ( |
            | 
            nil = options  ifTrue: [ "first option tag"
              options: list copyRemoveAll.
            ] False: [
              options addLast:  
                optionTag myParser stringInEditor shrinkwrapped @ currentOptionIsSelected.  
              optionTag myParser clearLastRow.
            ].
            currentOptionIsSelected: optionTag selected.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'formSelectListMorph' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         buildTheList = ( |
             c.
             f.
            | 
            c: firstMorph color.
            safelyDo: [ removeAllMorphs ].
            beShrinkWrap.
            f: frameMorph copy.
            f beShrinkWrap.
            f frameStyle: f bezelStyle.
            options do: [|:o. r. isS. ostr. b|
              ostr: o x.
              isS:  o y.
              r: rowMorph copy.
              r beShrinkWrapVertically.
              r beFlexibleHorizontally.
              r safelyDo: [ r addMorphFirst: labelMorph copy label: ostr ].
              r safelyDo: [ r addMorphLast: spacerMorph copy beFlexible ].
              b: ( 
                 allowMultipleSelections 
                   ifTrue: checkBoxMorph
                    False: checkCircleMorph
              ) copy.
              r safelyDo: [ r addMorphLast: b ].
              f safelyDo: [ f addMorphLast: r ].
            ].
            safelyDo: [ addMorph: f. colorAll: c. ].
            reset.
            allowMultipleSelections ifFalse: [groupButtons].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'formSelectListMorph' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         groupButtons = ( |
             g.
            | 
            g: radioButtonGroup copy.
            withButtonsAndOptionPairsDo: [|:b|
              b buttonGroup: g.
              g addButton: b.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'formSelectListMorph' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         morphTypeName = 'formSelectListMorph'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'formSelectListMorph' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         nameValueString = ( |
             en.
             r.
            | 
            r: ''.
            en: webBrowser escapeHTTPString: name.
            selectedOptions do: [ |:op|
              r isEmpty ifFalse: [ r: r, '&' ].
              r: r, en, '=', (webBrowser escapeHTTPString: op).
            ].
            r).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'formSelectListMorph' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'globals' -> 'webBrowser' -> 'formFieldMorph' -> 'parent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'formSelectListMorph' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         reset = ( |
            | 
            withButtonsAndOptionPairsDo: [|:b. :opt.  |
              opt y ifTrue: [ b press ] False: [ b unpress ].
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'formSelectListMorph' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         selectedOptions = ( |
             r.
            | 
            r: list copyRemoveAll.
            withButtonsAndOptionPairsDo: [|:b. :opt. |
              b isDown ifTrue: [ r addLast: opt x ].
            ].
            r).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'formSelectListMorph' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         withButtonsAndOptionPairsDo: blk = ( |
            | 
            firstMorph morphs with: options Do: [|:row. :opt. button |
              button: row lastMorph.
              blk value: button With: opt
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'formSelectListMorph' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         prototype = ( |
            | webBrowser formSelectListMorph).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> () From: ( | {
         'Category: prototypes\x7fCategory: morphs\x7fCategory: forms\x7fModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         formSelectMenuMorph = bootstrap define: bootstrap stub -> 'globals' -> 'webBrowser' -> 'formSelectMenuMorph' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             bootstrap remove: 'prototype' From:
             globals webBrowser formSelectListMorph copyRemoveAllMorphs ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'webBrowser' -> 'formSelectMenuMorph' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals webBrowser formSelectMenuMorph.

CopyDowns:
globals webBrowser formSelectListMorph. copyRemoveAllMorphs 
SlotsToOmit: parent prototype.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'formSelectMenuMorph' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: InitializeToExpression: (nil)'
        
         myMenu.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'formSelectMenuMorph' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'webBrowser' -> 'formSelectMenuMorph' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals webBrowser formSelectMenuMorph parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'formSelectMenuMorph' -> 'parent' -> () From: ( | {
         'Category: events\x7fModuleInfo: Module: webBrowser InitialContents: FollowSlot\x7fVisibility: private'
        
         allowSubmorphsToGetEvent: evt = ( |
            | 
            "Keep submorphs from seeing leftMouseDown."
            evt leftMouseDown not).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'formSelectMenuMorph' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         buildTheList = ( |
            | 
            reset.
            myMenu: ui2Menu copy.

            options do: [|:o.  isS. ostr. b|
              ostr: o x.
              isS:  o y.
              myMenu addButtonTarget: self Script: 'target changeSelectionTo: ', ostr storeString Label: ostr.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'formSelectMenuMorph' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         changeSelectionTo: str = ( |
             c.
             f.
            | 
            c: firstMorph color.
            removeAllMorphs.
            beShrinkWrap.
            f: frameMorph copy.
            f beShrinkWrap.
            f frameStyle: f bezelStyle.
            resultValue: str.
            f addMorph: labelMorph copy label: resultValue.
            addMorph: f.
            colorAll: c).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'formSelectMenuMorph' -> 'parent' -> () From: ( | {
         'Category: events\x7fModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         leftMouseDown: evt = ( |
            | 
            myMenu copy popUp: evt.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'formSelectMenuMorph' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         morphTypeName = 'formSelectMenuMorph'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'formSelectMenuMorph' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'globals' -> 'webBrowser' -> 'formSelectListMorph' -> 'parent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'formSelectMenuMorph' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         reset = ( |
            | 
            changeSelectionTo: 
              ( options findFirst: [|:o| o y ] IfPresent: [|:o| o ] IfAbsent: [ options first ]) x.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'formSelectMenuMorph' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         selectedOptions = ( |
            | vector copyAddFirst: resultValue).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'formSelectMenuMorph' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         prototype = ( |
            | webBrowser formSelectMenuMorph).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'formSelectMenuMorph' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: InitializeToExpression: (\'\')'
        
         resultValue <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> () From: ( | {
         'Category: prototypes\x7fCategory: morphs\x7fCategory: forms\x7fModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         formTextAreaMorph = bootstrap define: bootstrap stub -> 'globals' -> 'webBrowser' -> 'formTextAreaMorph' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             bootstrap remove: 'prototype' From:
             globals webBrowser formFieldMorph copyRemoveAllMorphs ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'webBrowser' -> 'formTextAreaMorph' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals webBrowser formTextAreaMorph.

CopyDowns:
globals webBrowser formFieldMorph. copyRemoveAllMorphs 
SlotsToOmit: parent prototype.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'formTextAreaMorph' -> () From: ( | {
         'Category: text area state\x7fModuleInfo: Module: webBrowser InitialContents: InitializeToExpression: (20@1)'
        
         initialSize <- 20@1.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'formTextAreaMorph' -> () From: ( | {
         'Category: text area state\x7fModuleInfo: Module: webBrowser InitialContents: InitializeToExpression: (\'\')'
        
         initialString <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'formTextAreaMorph' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'webBrowser' -> 'formTextAreaMorph' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals webBrowser formTextAreaMorph parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'formTextAreaMorph' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         contentsString: s = ( |
            | 
            firstMorph setText: s).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'formTextAreaMorph' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         copyName: n TextSize: pt String: s Color: c = ( |
             desiredSize.
             ed.
             lbl.
             minSize.
             r.
            | 
            name: n.
            initialString: s.
            initialSize: pt.

            ed: uglyTextEditorMorph copyString: s Style: ( | color = paint named: 'lightGray' | ).
            ed resizeToText.
            minSize: ed baseBounds size.
            lbl: labelMorph copy label: ' '.
            lbl computeWidthInWorld: process this hand world.
            desiredSize: (lbl baseBounds width * pt x) @ (lbl baseBounds height * pt y).
            ed setWidth: ( desiredSize x max: minSize x ) 
                 Height:   desiredSize y max: minSize y .

            r: copy.
            r addMorph: ed.
            r beShrinkWrap.
            r colorAll: c.

            r).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'formTextAreaMorph' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         morphTypeName = 'formTextAreaMorph'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'formTextAreaMorph' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'globals' -> 'webBrowser' -> 'formFieldMorph' -> 'parent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'formTextAreaMorph' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         reset = ( |
            | 
            contentsString: initialString).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'formTextAreaMorph' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         resultValue = ( |
            | firstMorph contentsString).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'formTextAreaMorph' -> () From: ( | {
         'Category: filing out\x7fModuleInfo: Module: webBrowser InitialContents: FollowSlot\x7fVisibility: public'
        
         prototype = ( |
            | 
            webBrowser formTextAreaMorph).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot\x7fVisibility: public'
        
         getHotlist = ( |
            | 
            case 
              if:   [ nil != process this hand ]
              Then: [ process this hand safelyDo: [process this hand attach: hotlistMorph copy ]].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> () From: ( | {
         'Category: prototypes\x7fModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         hotlist = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'webBrowser' -> 'hotlist' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals webBrowser hotlist.
\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'hotlist' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: InitializeToExpression: (\'~/.mosaic-hotlist-default\')'
        
         fileName <- '~/.mosaic-hotlist-default'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'hotlist' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         getLines = ( |
             c.
             e <- 0.
             r.
             s <- 0.
            | 
            c: readFile.
            r: list copyRemoveAll.
            [| :exit |
              s >= c size  ifTrue: exit.
              e: s succ.
              [|:exit|
                e >= c size       ifTrue: exit.
                (c at: e) = '\n'  ifTrue: exit.
                e: e succ.
              ] loopExit.
              r addLast: c copyFrom: s UpTo: e.
              s: e succ.
            ] loopExit.
            r).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'hotlist' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         getTitleURLPairs = ( |
             last.
             r.
             rr.
            | 
            r: getLines.
            r size < 2 ifTrue: [^ vector].
            r removeFirst.
            r removeFirst.
            rr: list copyRemoveAll.
            [|:exit. h. t. |
              r isEmpty ifTrue: exit.
              h: r removeFirst.
              t: r isEmpty ifTrue: '' False: [ r removeFirst ].
              h: h findFirst: [|:c| c = ' '] IfPresent: [|:c. :i| h copySize: i] IfAbsent: [h].
              rr addLast: t @ h.
            ] loopExit.
            rr: rr copySortBy: ( | element: x Precedes: y = (x x < y x) | ).
            rr copy do: [|:e|
              last = e y ifTrue: [rr remove: e].
              last: e y.
            ].
            rr).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'hotlist' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'clonable' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'hotlist' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         readFile = ( |
             f.
             r.
            | 
            f: os_file openForReading: fileName.
            r: f contents.
            f close.
            r).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'hotlist' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         removeNewLines: str = ( |
            | 
            (str filterBy: [|:c| c != '\n'] Into: list copyRemoveAll ) asString).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'hotlist' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         setTitleURLPairs: pairs = ( |
             absbkfn.
             absfn.
             abstfn.
             f.
             tfn.
             tim.
            | 
            tfn: fileName, '.', time current msec printString.
            f: os_file openForWriting: tfn.
            f write: 'ncsa-xmosaic-hotlist-format-1\n'.
            f write: 'Default\n'.
            tim: time current printString. "?"
            pairs do: [|:p|  f write: ( removeNewLines: p y ), ' ', tim, '\n', p x, '\n' ].
            f close.

            abstfn: os_file locate: tfn.
            absfn:  os_file locate: fileName.
            absbkfn: absfn, '.backup'.

            os rename: absfn  To:  absbkfn.
            os rename: abstfn To:  absfn.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> () From: ( | {
         'Category: prototypes\x7fCategory: morphs\x7fModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         hotlistMorph = bootstrap define: bootstrap stub -> 'globals' -> 'webBrowser' -> 'hotlistMorph' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             bootstrap remove: 'prototype' From:
             globals frameMorph copyRemoveAllMorphs ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'webBrowser' -> 'hotlistMorph' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals webBrowser hotlistMorph.

CopyDowns:
globals frameMorph. copyRemoveAllMorphs 
SlotsToOmit: parent prototype.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'hotlistMorph' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: InitializeToExpression: (\'\')'
        
         fileName <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'hotlistMorph' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'webBrowser' -> 'hotlistMorph' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals webBrowser hotlistMorph parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'hotlistMorph' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         addContents = ( |
            | 
            addMorph: 
              ( (frameMorph copy frameStyle: frameMorph flatStyle) "borderWidth: 6 ")
               addMorph:  frameMorph copy frameStyle: frameMorph insetBezelStyle.
            firstMorph firstMorph addAllMorphs: getButtons.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'hotlistMorph' -> 'parent' -> () From: ( | {
         'Category: dropping\x7fModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         addWebPage: m Event: evt = ( |
             b.
            | 
            b: buttonForTitle: m titleString URL: m sourceURL unparse.
            b globalPosition: evt cursorPoint.
            addMorph: b).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'hotlistMorph' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         allowSubmorphsToGetEvent: evt = ( |
            | 
            evt middleMouseDown ifTrue: [^ false].
            resend.allowSubmorphsToGetEvent: evt).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'hotlistMorph' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         buttonForTitle: title URL: url = ( |
            | 
            (((ui2Button copy beFlexible leftJustify
                label: title FontName: scalableFont helvetica FontSize: 10 FontColor: paint named: 'black')
                script: 'buttonArgs first asURL getPageForUser')
                buttonArgs: vector copyAddFirst: url)
                isAsynchronous: true).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'hotlistMorph' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         collapse = ( |
            | 
            rebuild: false).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'hotlistMorph' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         collapse: evt = ( |
            | evt sourceHand attach: collapse).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'hotlistMorph' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot\x7fVisibility: public'
        
         contributeToBackgroundMenu: m = ( |
            | 
            m addButton:
              ( ( ( ui2Button copy script: 'webBrowser getHotlist' )
                isAsynchronous: true )
                label: 'Web hotlist')
            ToGroup: 'applications'.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'hotlistMorph' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot\x7fVisibility: public'
        
         copy = ( |
            | resend.copy collapse).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'hotlistMorph' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         defaultButtonHolder.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'hotlistMorph' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         editFileName = ( |
            | 
            fileName: userQuery askString: 'Enter hot list file name:\n(empty for default)' DefaultAnswer: fileName).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'hotlistMorph' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         extractTitleURLPairs = ( |
            | 
            (
              allMorphs asList copyFilteredBy: [|:m| m isButton ]
            ) copyMappedBy: [|:b| b label @ b buttonArgs first]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'hotlistMorph' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         getButtons = ( |
             tp.
            | 
            tp: theHotList getTitleURLPairs.
            tp copyMappedBy: [|:tu. |
              buttonForTitle: tu x URL: tu y.
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'hotlistMorph' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot\x7fVisibility: public'
        
         middleMouseDown: evt = ( |
            | 
            allMorphs findFirst: [|:m|
              m isButton  &&  [m globalBaseBounds includes: evt cursorPoint]]
             IfPresent: [|:b| popUpButtonMenu: evt Button: b ]
             IfAbsent:  [ popUpTitleMenu: evt ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'hotlistMorph' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot\x7fVisibility: public'
        
         morphTypeName = 'hotlistMorph'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'hotlistMorph' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'frameMorph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'hotlistMorph' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         popUpButtonMenu: evt Button: b = ( |
             m.
            | 
            m: ui2Menu copy.
            m addButtonTarget: b Script: 'target delete' Label: 'Delete'.
            defaultButtonHolder: m initializeDefaultButtonHolder: defaultButtonHolder.
            m popUp: evt).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'hotlistMorph' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         popUpTitleMenu: evt = ( |
             m.
            | 
            m: ui2Menu copy.
            m addButtonTarget: self Script: 'target collapse: event' Label: 'Collapse'.
            m addDivider.
            m addButtonTarget: self Script: 'target rebuildFromFile' Label: 'Load from File' .
            m addButtonTarget: self Script: 'target saveToFile: event' Label: 'Save to File' .
            m addDivider.
            m addButtonTarget: self AsynchronousScript: 'target editFileName' Label: 'Set name of hotlist file'.
            m addButtonTarget: webBrowser webPage AsynchronousScript: 'target askForURL: event' Label: 'Open new URL...'.
            m addButtonTarget: webBrowser AsynchronousScript: 'target setProxy' Label: 'Set Internet Proxy'.

            morphCount <= 1 ifTrue: [
              m grayOut: true ButtonLabeled: 'Collapse'.
              m grayOut: true ButtonLabeled: 'Save to File'.
            ]. 
            m popUp: evt).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'hotlistMorph' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         rebuild: withContents = ( |
             b.
             lbl.
            | 
            removeAllMorphs.
            withContents ifTrue: [ addContents ].
            lbl: labelMorph copy label: 'Hotlist file'.
            lbl fontSpec: fontSpec copyName: 'helvetica' Style: 'bold' Size: 12.
            addMorphFirst: lbl.
            colorAll: paint named: 'lightGray'.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'hotlistMorph' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         rebuildFromFile = ( |
            | 
            rebuild: true).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'hotlistMorph' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         saveToFile: event = ( |
            | 
            theHotList setTitleURLPairs: extractTitleURLPairs).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'hotlistMorph' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         theHotList = ( |
             hl.
            | 
            hl: webBrowser hotlist copy.
            fileName isEmpty ifTrue: [fileName: hl fileName] False: [hl fileName: fileName].
            hl).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'hotlistMorph' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot\x7fVisibility: public'
        
         prototype = ( |
            | webBrowser hotlistMorph).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> () From: ( | {
         'Category: prototypes\x7fModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         htmlParser = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals webBrowser htmlParser.
\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> () From: ( | {
         'Category: parsing\x7fCategory: utilities\x7fModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         advance = ( |
            | rsi: rsi succ).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> () From: ( | {
         'Category: parsing\x7fCategory: utilities\x7fModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         advance: n = ( |
            | rsi: rsi + n).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> () From: ( | {
         'Category: formatting\x7fModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         appendMorph: m = ( |
             t.
            | 
            wrapIfNeededForWidth: m baseBounds width.
            editor safelyDo: [
              lastRow addMorphLast: m.
            ].
            format isAtStartOfLine: false.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> () From: ( | {
         'Category: formatting\x7fModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         appendNonTextMorph: m = ( |
             r.
            | 
            appendMorph: m.
            r: m baseBounds right.
            "let page expand for wide pictures"
            widthLimit: r max: widthLimit.
            format emptyLinesSinceText: infinity.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> () From: ( | {
         'Category: formatting\x7fModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         appendTextMorph: m = ( |
            | 
            appendMorph: m.
            format emptyLinesSinceText: 0.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> () From: ( | {
         'Category: formatting state\x7fModuleInfo: Module: webBrowser InitialContents: InitializeToExpression: (true)'
        
         areImagesShown <- bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> () From: ( | {
         'Category: parsing\x7fCategory: utilities\x7fModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         atEnd = ( |
            | rsi >= rawString size).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot\x7fVisibility: private'
        
         backgroundColor <- paint copyRed: 0.791789 Green: 0.791789  Blue: 0.791789.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         clearLastRow = ( |
            | 
            lastRow safelyDo: [lastRow removeAllMorphs].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> () From: ( | {
         'Category: parsing\x7fCategory: utilities\x7fModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         consumeChar = ( |
             r.
            | 
            r: thisChar.
            advance.
            r).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> () From: ( | {
         'Category: parsed state\x7fModuleInfo: Module: webBrowser InitialContents: InitializeToExpression: (\'\')\x7fVisibility: public'
        
         contentType <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> () From: ( | {
         'Category: public entry points\x7fModuleInfo: Module: webBrowser InitialContents: FollowSlot\x7fVisibility: public'
        
         copy = ( |
            | 
            resend.copy formatStack: formatStack copy).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> () From: ( | {
         'Category: parsing tags\x7fModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         copyTag: tagProto = ( |
            | tagProto copy myParser: self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> () From: ( | {
         'Category: parsing\x7fModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         copyTillTag = ( |
             ath.
             buf.
             isPre.
            | 
            buf: list copyRemoveAll.
            ath: format areTagsHonored.
            isPre: format isPreformatted.

            [ atEnd || [ ath && [ thisChar = '<' ] ] ] whileFalse: [
              buf addLast: consumeChar.
            ].
            insertNonTagString: buf.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> () From: ( | {
         'Category: parsing\x7fModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         decodeHTTPStatusLine = ( |
             i.
             j.
             r.
            | 
            "remove HTTP version"
            rsi: rsi + 'HTTP/1.0' size.
            removeWhite.
            statusCode: threeDigitNumber.
            removeWhite.
            reason: toEndOfLine.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> () From: ( | {
         'Category: parsing\x7fModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         eatMimeHeader = ( |
            | 
            [ |:exit. ct = 'Content-type:'. |
              atEnd ifTrue: [^ self].
              ( prefixIs: '\r' ) ifTrue: [advance].
              atEnd ifTrue: [^ self].
              ( prefixIs: '\n' ) ifTrue: exit.
              ( prefixIs: ct ) ifTrue: [ 
                advance: ct size.
                removeWhite.
                contentType: toEndOfLine.
              ] False: [
                toEndOfLine.
              ].
            ] loopExit.
            toEndOfLine.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         editor = ( |
            | format editor).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> () From: ( | {
         'Category: formatting\x7fModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         ensureEmptyLines: n = ( |
             m.
            | 
            n = 0 ifTrue: [^ self].
            format emptyLinesSinceText >= n  ifTrue: [ 
              format isAtStartOfLine  ifTrue: [^ self].
              insertRawNewline.
            ] False: [
              m: n - format emptyLinesSinceText.
              m do: [insertRawNewline].
              format emptyLinesSinceText: m + format emptyLinesSinceText.
            ].
            indentTo: format firstIndent.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         entities = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'entities' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals webBrowser htmlParser entities.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'entities' -> () From: ( | {
         'Category: cached state\x7fModuleInfo: Module: webBrowser InitialContents: InitializeToExpression: (nil)'
        
         cachedCodes <- bootstrap stub -> 'globals' -> 'nil' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'entities' -> () From: ( | {
         'Category: cached state\x7fModuleInfo: Module: webBrowser InitialContents: InitializeToExpression: (\'\')'
        
         cachedLongestCode <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'entities' -> () From: ( | {
         'Category: cached state\x7fModuleInfo: Module: webBrowser InitialContents: InitializeToExpression: (nil)'
        
         cachedRawCodes <- bootstrap stub -> 'globals' -> 'nil' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'entities' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot\x7fVisibility: public'
        
         codes = ( |
            | 
            fillCacheIfNeeded.
            cachedCodes).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'entities' -> () From: ( | {
         'Category: cache filling\x7fModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         fillCache = ( |
             cc.
            | 
            cc: dictionary copyRemoveAll.
            cachedLongestCode: 0.
            rawCodes do: [|:s. i|
              i: s findFirst: [|:c| c = '='] IfPresent: [|:c. :i.| i] IfAbsent: [error].
              cc at: (s copySize: i) Put: s copyFrom: i succ.
              cachedLongestCode: cachedLongestCode max: i.
            ].
            cachedRawCodes: rawCodes.
            cachedCodes: cc.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'entities' -> () From: ( | {
         'Category: cache filling\x7fModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         fillCacheIfNeeded = ( |
            | 
            cachedRawCodes == rawCodes ifFalse: [fillCache].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'entities' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot\x7fVisibility: public'
        
         longestCode = ( |
            | 
            fillCacheIfNeeded.
            cachedLongestCode).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'entities' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'oddball' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'entities' -> () From: ( | {
         'Category: insert HTML and font info here\x7fModuleInfo: Module: webBrowser InitialContents: FollowSlot\x7fVisibility: public'
        
         rawCodes = [ | x =  ( bootstrap setObjectAnnotationOf: vector _Clone From: ( |
                     {} = 'ModuleInfo: Creator: globals webBrowser htmlParser entities rawCodes.
'.
                    | ) ) _Clone: 65 Filler: 0| 
             x _At: 0  Put: ().
             x _At: 1  Put: ().
             x _At: 2  Put: ().
             x _At: 3  Put: ().
             x _At: 4  Put: ().
             x _At: 5  Put: ().
             x _At: 6  Put: ().
             x _At: 7  Put: ().
             x _At: 8  Put: ().
             x _At: 9  Put: ().
             x _At: 10  Put: ().
             x _At: 11  Put: ().
             x _At: 12  Put: ().
             x _At: 13  Put: ().
             x _At: 14  Put: ().
             x _At: 15  Put: ().
             x _At: 16  Put: ().
             x _At: 17  Put: ().
             x _At: 18  Put: ().
             x _At: 19  Put: ().
             x _At: 20  Put: ().
             x _At: 21  Put: ().
             x _At: 22  Put: ().
             x _At: 23  Put: ().
             x _At: 24  Put: ().
             x _At: 25  Put: ().
             x _At: 26  Put: ().
             x _At: 27  Put: ().
             x _At: 28  Put: ().
             x _At: 29  Put: ().
             x _At: 30  Put: ().
             x _At: 31  Put: ().
             x _At: 32  Put: ().
             x _At: 33  Put: ().
             x _At: 34  Put: ().
             x _At: 35  Put: ().
             x _At: 36  Put: ().
             x _At: 37  Put: ().
             x _At: 38  Put: ().
             x _At: 39  Put: ().
             x _At: 40  Put: ().
             x _At: 41  Put: ().
             x _At: 42  Put: ().
             x _At: 43  Put: ().
             x _At: 44  Put: ().
             x _At: 45  Put: ().
             x _At: 46  Put: ().
             x _At: 47  Put: ().
             x _At: 48  Put: ().
             x _At: 49  Put: ().
             x _At: 50  Put: ().
             x _At: 51  Put: ().
             x _At: 52  Put: ().
             x _At: 53  Put: ().
             x _At: 54  Put: ().
             x _At: 55  Put: ().
             x _At: 56  Put: ().
             x _At: 57  Put: ().
             x _At: 58  Put: ().
             x _At: 59  Put: ().
             x _At: 60  Put: ().
             x _At: 61  Put: ().
             x _At: 62  Put: ().
             x _At: 63  Put: ().
             x _At: 64  Put: ().
             x] value.
        } | ) 

 ((bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'entities') \/-> 'rawCodes') -> () _At: 0 Put: (
     'lt=<')

 ((bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'entities') \/-> 'rawCodes') -> () _At: 1 Put: (
     'gt=>')

 ((bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'entities') \/-> 'rawCodes') -> () _At: 10 Put: (
     'Auml=\xc4')

 ((bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'entities') \/-> 'rawCodes') -> () _At: 11 Put: (
     'Ccedil=\xc7')

 ((bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'entities') \/-> 'rawCodes') -> () _At: 12 Put: (
     'ETH=\xd7')

 ((bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'entities') \/-> 'rawCodes') -> () _At: 13 Put: (
     'Eacute=\xc9')

 ((bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'entities') \/-> 'rawCodes') -> () _At: 14 Put: (
     'Ecirc=\xca')

 ((bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'entities') \/-> 'rawCodes') -> () _At: 15 Put: (
     'Egrave=\xc8')

 ((bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'entities') \/-> 'rawCodes') -> () _At: 16 Put: (
     'Euml=\xcb')

 ((bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'entities') \/-> 'rawCodes') -> () _At: 17 Put: (
     'Iacute=\xcd')

 ((bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'entities') \/-> 'rawCodes') -> () _At: 18 Put: (
     'Icirc=\xce')

 ((bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'entities') \/-> 'rawCodes') -> () _At: 19 Put: (
     'Igrave=\xcc')

 ((bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'entities') \/-> 'rawCodes') -> () _At: 2 Put: (
     'amp=&')

 ((bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'entities') \/-> 'rawCodes') -> () _At: 20 Put: (
     'Iuml=\xcf')

 ((bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'entities') \/-> 'rawCodes') -> () _At: 21 Put: (
     'Ntilde=\xd1')

 ((bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'entities') \/-> 'rawCodes') -> () _At: 22 Put: (
     'Oacute=\xd3')

 ((bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'entities') \/-> 'rawCodes') -> () _At: 23 Put: (
     'Ocirc=\xd4')

 ((bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'entities') \/-> 'rawCodes') -> () _At: 24 Put: (
     'Ograve=\xd2')

 ((bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'entities') \/-> 'rawCodes') -> () _At: 25 Put: (
     'Oslash=\xd8')

 ((bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'entities') \/-> 'rawCodes') -> () _At: 26 Put: (
     'Otilde=\xd5')

 ((bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'entities') \/-> 'rawCodes') -> () _At: 27 Put: (
     'Ouml=\xd6')

 ((bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'entities') \/-> 'rawCodes') -> () _At: 28 Put: (
     'THORN=\xde')

 ((bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'entities') \/-> 'rawCodes') -> () _At: 29 Put: (
     'Uacute=\xda')

 ((bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'entities') \/-> 'rawCodes') -> () _At: 3 Put: (
     'quot=\"')

 ((bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'entities') \/-> 'rawCodes') -> () _At: 30 Put: (
     'Ucirc=\xdb')

 ((bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'entities') \/-> 'rawCodes') -> () _At: 31 Put: (
     'Ugrave=\xd9')

 ((bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'entities') \/-> 'rawCodes') -> () _At: 32 Put: (
     'Uuml=\xdc')

 ((bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'entities') \/-> 'rawCodes') -> () _At: 33 Put: (
     'Yacute=\xdd')

 ((bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'entities') \/-> 'rawCodes') -> () _At: 34 Put: (
     'aacute=\xe1')

 ((bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'entities') \/-> 'rawCodes') -> () _At: 35 Put: (
     'acirc=\xe2')

 ((bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'entities') \/-> 'rawCodes') -> () _At: 36 Put: (
     'aelig=\xe6')

 ((bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'entities') \/-> 'rawCodes') -> () _At: 37 Put: (
     'agrave=\xe0')

 ((bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'entities') \/-> 'rawCodes') -> () _At: 38 Put: (
     'aring=\xe5')

 ((bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'entities') \/-> 'rawCodes') -> () _At: 39 Put: (
     'atilde=\xe3')

 ((bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'entities') \/-> 'rawCodes') -> () _At: 4 Put: (
     'nbsp= ')

 ((bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'entities') \/-> 'rawCodes') -> () _At: 40 Put: (
     'auml=\xe4')

 ((bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'entities') \/-> 'rawCodes') -> () _At: 41 Put: (
     'ccedil=\xe7')

 ((bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'entities') \/-> 'rawCodes') -> () _At: 42 Put: (
     'eacute=\xe9')

 ((bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'entities') \/-> 'rawCodes') -> () _At: 43 Put: (
     'egrave=\xe8')

 ((bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'entities') \/-> 'rawCodes') -> () _At: 44 Put: (
     'eth=\xf0')

 ((bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'entities') \/-> 'rawCodes') -> () _At: 45 Put: (
     'euml=\xeb')

 ((bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'entities') \/-> 'rawCodes') -> () _At: 46 Put: (
     'iacute=\xed')

 ((bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'entities') \/-> 'rawCodes') -> () _At: 47 Put: (
     'icirc=\xee')

 ((bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'entities') \/-> 'rawCodes') -> () _At: 48 Put: (
     'igrave=\xec')

 ((bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'entities') \/-> 'rawCodes') -> () _At: 49 Put: (
     'iuml=\xef')

 ((bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'entities') \/-> 'rawCodes') -> () _At: 5 Put: (
     'AElig=\xc6')

 ((bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'entities') \/-> 'rawCodes') -> () _At: 50 Put: (
     'ntilde=\xf1')

 ((bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'entities') \/-> 'rawCodes') -> () _At: 51 Put: (
     'oacute=\xf3')

 ((bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'entities') \/-> 'rawCodes') -> () _At: 52 Put: (
     'ocirc=\xf4')

 ((bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'entities') \/-> 'rawCodes') -> () _At: 53 Put: (
     'ograve=\xf2')

 ((bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'entities') \/-> 'rawCodes') -> () _At: 54 Put: (
     'oslash=\xf8')

 ((bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'entities') \/-> 'rawCodes') -> () _At: 55 Put: (
     'otilde=\xf5')

 ((bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'entities') \/-> 'rawCodes') -> () _At: 56 Put: (
     'ouml=\xf6')

 ((bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'entities') \/-> 'rawCodes') -> () _At: 57 Put: (
     'szlig=s')

 ((bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'entities') \/-> 'rawCodes') -> () _At: 58 Put: (
     'thorn=\xfe')

 ((bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'entities') \/-> 'rawCodes') -> () _At: 59 Put: (
     'uacute=\xfa')

 ((bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'entities') \/-> 'rawCodes') -> () _At: 6 Put: (
     'Aacute=\xc1')

 ((bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'entities') \/-> 'rawCodes') -> () _At: 60 Put: (
     'ucirc=\xfb')

 ((bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'entities') \/-> 'rawCodes') -> () _At: 61 Put: (
     'ugrave=\xf9')

 ((bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'entities') \/-> 'rawCodes') -> () _At: 62 Put: (
     'uuml=\xfc')

 ((bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'entities') \/-> 'rawCodes') -> () _At: 63 Put: (
     'yacute=\xfd')

 ((bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'entities') \/-> 'rawCodes') -> () _At: 64 Put: (
     'yuml=\xff')

 ((bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'entities') \/-> 'rawCodes') -> () _At: 7 Put: (
     'Agrave=\xc0')

 ((bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'entities') \/-> 'rawCodes') -> () _At: 8 Put: (
     'Aring=\xc5')

 ((bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'entities') \/-> 'rawCodes') -> () _At: 9 Put: (
     'Atilde=\xc3')

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'entities' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot\x7fVisibility: public'
        
         translate: s = ( |
            | 
            s findFirst: [|:c| c = '&']
              IfPresent: [|:c. :ampPos. lastPossibleSemi. afterAmp. result. lengthConsumedAfterAmp. |
                lastPossibleSemi: ampPos succ + longestCode.
                afterAmp: s copyFrom: ampPos succ UpTo: s size min: lastPossibleSemi succ.
                afterAmp findFirst: [|:c| c = ';']
                  IfPresent: [|:c. :semiPosAfterAmp. code  | 
                    code:  afterAmp copySize: semiPosAfterAmp.
                    translateCode: code
                          IfFound:   [|:val| result: val.  lengthConsumedAfterAmp: semiPosAfterAmp succ. "succ for semicolon" ]
                          IfAbsent:  [ result: '&'.  lengthConsumedAfterAmp: 0 ].
                ] IfAbsent: [          result: '&'.  lengthConsumedAfterAmp: 0 ].
                ( s copySize: ampPos ), result,  translate: ( s copyFrom: ampPos + 1 "for &" + lengthConsumedAfterAmp )
            ] IfAbsent: s).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'entities' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot\x7fVisibility: private'
        
         translateCode: code IfFound: foundBlock IfAbsent: absentBlock = ( |
            | 
            code first  =  '#'
              ifTrue: [ foundBlock value: code copyWithoutFirst asInteger asCharacter ]
               False: [
                   codes if: code
                         IsPresentDo: foundBlock
                         IfAbsentDo: absentBlock
              ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'entities' -> () From: ( | {
         'Category: use these to edit rawCodes\x7fModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         viewerForRawCodes = ( |
             r <- ''.
            | 
            r: '('.
            rawCodes do: [|:e|
              r: r, '\n', e storeString, ' &'.
            ].
            r: r copyWithoutLast, ' ) asVector'.
            textViewerMorph copyTitle: 'rawCodes' Text: r).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'entities' -> () From: ( | {
         'Category: use these to edit rawCodes\x7fModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         viewerForSpecials = ( |
             r <- ''.
            | 
            128 to: 255 Do: [|:i|
            r: r, i printString, ' ', i asCharacter, '\n'].
            textViewerMorph copyTitle: 'specials' Text: r).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> () From: ( | {
         'Category: formatting\x7fCategory: format stack\x7fModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         firstFormat = ( |
            | formatStack last).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         format = ( |
            | formatStack first).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> () From: ( | {
         'Category: formatting state\x7fModuleInfo: Module: webBrowser InitialContents: InitializeToExpression: (list copyRemoveAll)'
        
         formatStack <- list copyRemoveAll.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         formatState = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'formatState' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals webBrowser htmlParser formatState.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'formatState' -> () From: ( | {
         'Category: state\x7fModuleInfo: Module: webBrowser InitialContents: InitializeToExpression: (true)'
        
         areTagsHonored <- bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'formatState' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot\x7fVisibility: public'
        
         copy = ( |
            | 
            resend.copy fullFontNameCache: '').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'formatState' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         copyEditorStateFrom: fmt = ( |
            | 
            editor = fmt editor ifFalse: [^ self].
            emptyLinesSinceText: fmt emptyLinesSinceText.
            isAtStartOfLine: fmt isAtStartOfLine.
            widthLimit: fmt widthLimit).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'formatState' -> () From: ( | {
         'Category: state\x7fModuleInfo: Module: webBrowser InitialContents: InitializeToExpression: (nil)'
        
         editor.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'formatState' -> () From: ( | {
         'Category: state\x7fComment: infinity: start of editor, do not add any vertical space (really infinite?)
0: text is on this line, start new line for new line of text.
1: no text (or morphs) on this line\x7fModuleInfo: Module: webBrowser InitialContents: InitializeToExpression: (infinity)'
        
         emptyLinesSinceText <- infinity.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'formatState' -> () From: ( | {
         'Category: state\x7fModuleInfo: Module: webBrowser InitialContents: InitializeToExpression: (0)'
        
         firstIndent <- 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'formatState' -> () From: ( | {
         'Category: state\x7fModuleInfo: Module: webBrowser InitialContents: InitializeToExpression: (paint named: \'black\')'
        
         fontColor <- paint named: 'black'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'formatState' -> () From: ( | {
         'Category: state\x7fModuleInfo: Module: webBrowser InitialContents: InitializeToExpression: (\'courier\')'
        
         fontName <- 'courier'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'formatState' -> () From: ( | {
         'Category: state\x7fModuleInfo: Module: webBrowser InitialContents: InitializeToExpression: (12)'
        
         fontSize <- 12.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'formatState' -> () From: ( | {
         'Category: state\x7fModuleInfo: Module: webBrowser InitialContents: InitializeToExpression: (\'\')'
        
         fontVariation <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'formatState' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot\x7fVisibility: public'
        
         fullFontName = ( |
            | 
            fullFontNameCache isEmpty
              ifTrue: [fullFontNameCache: fontName, fontVariation sendTo: scalableFont].
            fullFontNameCache).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'formatState' -> () From: ( | {
         'Category: state\x7fModuleInfo: Module: webBrowser InitialContents: InitializeToExpression: (\'\')'
        
         fullFontNameCache <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'formatState' -> () From: ( | {
         'Category: state\x7fModuleInfo: Module: webBrowser InitialContents: InitializeToExpression: (true)'
        
         isAtStartOfLine <- bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'formatState' -> () From: ( | {
         'Category: state\x7fModuleInfo: Module: webBrowser InitialContents: InitializeToExpression: (true)'
        
         isPreformatted <- bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'formatState' -> () From: ( | {
         'Category: state\x7fModuleInfo: Module: webBrowser InitialContents: InitializeToExpression: (0)'
        
         leftIndent <- 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'formatState' -> () From: ( | {
         'Category: state\x7fModuleInfo: Module: webBrowser InitialContents: InitializeToExpression: (\'\')'
        
         nextListItemTag <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'formatState' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'clonable' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         noop = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> 'noop' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals webBrowser htmlParser tags noop.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'formatState' -> () From: ( | {
         'Category: state\x7fModuleInfo: Module: webBrowser InitialContents: InitializeToExpression: (webBrowser htmlParser tags noop)'
        
         tag <- bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> 'noop' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'formatState' -> () From: ( | {
         'Category: state\x7fModuleInfo: Module: webBrowser InitialContents: InitializeToExpression: (500)'
        
         widthLimit <- 500.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> () From: ( | {
         'Category: parsing tags\x7fModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         getEndTag = ( |
            | 
            consumeChar. "/"
            removeWhite.
            makeTag isStart: false).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> () From: ( | {
         'Category: parsing tags\x7fModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         getIdentifier = ( |
             r.
            | 
            r: consumeChar.
            [ r isLetter ] assert.
            r: collector copyFirst: r uncapitalize.
            [ atEnd not  &&  [ thisChar isLetter || [ thisChar isDigit ]]]
              whileTrue: [ r: r & consumeChar uncapitalize ].
            r flatString).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> () From: ( | {
         'Category: parsing\x7fCategory: utilities\x7fModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         getQuotedString = ( |
             r.
            | 
            consumeChar. "quote"
            r: collector copyFirst: ''.
            [atEnd || [thisChar = '"']] whileFalse: [r: r & consumeChar].
            atEnd ifFalse: [consumeChar].
            r flatString).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> () From: ( | {
         'Category: parsing tags\x7fModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         getStartTag = ( |
             r.
            | 
            r: makeTag.
            [| :exit. field. contents |
              removeWhite.
              atEnd ifTrue: exit.
              thisChar isLetter ifFalse: exit.
              field: getIdentifier.
              removeWhite.
              thisChar = '='  ifTrue: [ | c |
                consumeChar.
                removeWhite.
                c: thisChar.
                case if: [c = '"'] Then: [  contents: getQuotedString. ]
                                   Else: [  contents: getTillWhiteOrEndTag ].
              ] False: [contents: true].
              (r asMirror lookupKey: field, ':') isEmpty ifFalse: [
                  (field, ':') sendTo: r With: contents.
              ].
            ] loopExit.
            r).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> () From: ( | {
         'Category: parsing tags\x7fModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         getTag = ( |
             c.
             r.
            | 
            consumeChar. "<"
            removeWhite.
            c: thisChar.
            r: case
             if: [ c = '/' ]  Then: [ getEndTag ]
             If: [ c isLetter ] Then: [ getStartTag ]
             Else: [ skipTag ].
            "skip parts of unknown tags"
            r tagName = 'noop'  ifTrue: [ skipTag ].
            removeWhite.
            atEnd || [ thisChar != '>' ] ifFalse: [advance].
            r).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> () From: ( | {
         'Category: parsing tags\x7fModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         getTillWhiteOrEndTag = ( |
             r.
            | 
            r: collector copyFirst: ''.
            [ atEnd || [ ( thisChar = '>' ) || [ thisChar isAllWhiteSpace ]]] whileFalse: [r: r & consumeChar].
            r flatString).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> () From: ( | {
         'Category: parsing\x7fModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         handleDocumentMoved = ( |
            | 
            statusCode = 302 ifFalse: [^ self].
            rootMorph allMorphs 
             findFirst: [|:m| m morphTypeName = 'anchorMorph']
             IfPresent: [|:anch. u |
               u: anch url asURL.
               setInputString: u getContentsString SourceURL: u.
               rootMorph removeContents.
               rootMorph sourceURL: u.
               rootMorph htmlSource: rawString.
               parse.
             ]
             IfAbsent: [].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> () From: ( | {
         'Category: formatting\x7fModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         indentTo: w = ( |
             lr.
             x.
            | 
            "assumes at start of row, except for spacer"
            lr: lastRow.
            [ |:exit. s |
              x:  lr morphCount = 0  ifTrue: 0  False: [lr lastMorph baseBounds right].
              w >= x  ifTrue: exit.
              [ lr morphCount != 0  ] assert.
              s: lr lastMorph.
              s morphTypeName = 'spacerMorph'  ifFalse: exit.
              s safelyDo: [s delete].
            ] loopExit.
            w <= x  ifTrue: [ ^ self ].
            lr safelyDo: [ lr addMorphLast:   spacerMorph copyH:  w - x   Color: editor color ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> () From: ( | {
         'Category: formatting\x7fModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         initialRootPosition = ( |
            | process this birthEvent cursorPoint).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> () From: ( | {
         'Category: formatting\x7fModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         insertNonSpaces: str = ( |
             lbl.
            | 
            "str has no spaces"
            str isEmpty ifTrue: [^ self]. "ed cannot handle mt labels"
            lbl: labelMorphFor: str.
            wrapIfNeededForWidth: lbl width.
            appendTextMorph: lbl).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> () From: ( | {
         'Category: formatting\x7fModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         insertNonTagString: chars = ( |
            | 
            format isPreformatted ifTrue: [ insertNonTagStringWithoutFormatting: chars ]
                                  False: [ insertNonTagStringWithFormatting: chars    ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> () From: ( | {
         'Category: formatting\x7fModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         insertNonTagStringWithFormatting: chars = ( |
             buf.
             cl.
             lastIsChar.
             okString <- ''.
             okWidth <- 0.
             spacer.
             spacerWidth.
            | 

            "chars may contain blanks or whatever, just not tag"
            "optimizes insertChar:"
            "convoluted for optimization!"

            lastIsChar: (lastRow morphCount != 0) 
             && [ (lastRow lastMorph morphTypeName = 'labelMorph' )
             && [ lastRow lastMorph label last != ' ' ] ].

            cl: chars asList copy.
            buf: collector copyFirst: ''.
            spacer: labelMorphFor: ' '.
            spacerWidth: spacer width.
            spacer safelyDo: [spacer delete].
            [ cl isEmpty ] whileFalse: [
              | c |
              c: cl removeFirst.
              (c = ' ') || [ ( c = '\n' ) || [ c = '\t' ]]  ifFalse: [ buf: buf & c ] 
              True: [  | s |
                s: buf flatString.
                buf: collector copyFirst: ''.
                s: entities translate: s.
                "cover case where have text in row, do format change, add more text starting with space"
                " must put in the space, so test lastIsChar"
                s isEmpty not ||  [lastIsChar] ifTrue: [| lbl | "ignore white space if no non-white before it"
                  lbl:  s isEmpty ifFalse: [ labelMorphFor: s ]
                                     True: [ spacerMorph copyH: 0 Color: paint copy ].
                  "check if wrap would be needed"
                  okWidth:  ( okWidth = 0  ifTrue: 0  False: [ okWidth + spacerWidth ] )
                            + lbl baseBounds width. 
                  "cannot use isWrapNeededForWidth because it checks morphCount to avoid
                   extra wraps for indivisibles"
                   " (isWrapNeededForWidth: okWidth)  ifFalse: [ "
                  (wouldOverflowLastRow: okWidth) ifFalse: [
                     "no wrap would be needed, just cache the string so far"
                     okString:  
                       (lastIsChar ifTrue: ' ' False: ''),
                       okString,
                       (okString isEmpty || [okString last = ' '] ifTrue: '' False: ' '),
                       s.
                  ] True:  [ 
                     "wrap will be needed, so write out okString"
                     insertNonSpaces: okString.
                     "could just insertSpacerChar, but we know to wrap so just do it"
                     wrap. "just to be sure"
                     okString: s.
                     okWidth: lbl width.
                  ].
                  lbl safelyDo: [lbl delete]. "delete from world"
                  lastIsChar: false.
                ].
             ].
            ].
            okString isEmpty ifFalse: [
              insertNonSpaces: okString.
              insertSpacerChar.
            ].
            insertNonSpaces: entities translate: buf flatString.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> () From: ( | {
         'Category: formatting\x7fModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         insertNonTagStringWithoutFormatting: chars = ( |
             buf.
             cl.
             formatSpaces.
            | 
            "chars may contain blanks or whatever, just not tag"
            "optimizes insertChar:"
            cl: chars asList copy.
            buf: collector copyFirst: ''.

            [ cl isEmpty ] whileFalse: [
              | c |
              c: cl removeFirst.
              c = '\n' ifFalse: [ buf: buf & c ]  True: [
                insertNonSpaces: entities translate: buf flatString.
                buf: collector copyFirst: ''.
                insertRawNewline.
              ].
            ].
            insertNonSpaces: entities translate: buf flatString).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> () From: ( | {
         'Category: formatting\x7fModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         insertRawNewline = ( |
             r.
            | 
            editor safelyDo: [
              lastRow baseBounds height  =  lastRow minHeight  ifTrue: [
                lastRow addMorph: makeSpacer.
              ].
              r: (rowMorph copy borderWidth: 0)
                                      color: editor color.
              editor addMorphLast: r.
              format leftIndent = 0 ifFalse: [
                indentTo: format leftIndent.
              ].
            ].
            format isAtStartOfLine: true.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> () From: ( | {
         'Category: formatting\x7fModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         insertRawSpace = ( |
            | 
            appendTextMorph: labelMorphFor: ' '.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> () From: ( | {
         'Category: formatting\x7fModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         insertSpacerChar = ( |
            | 
            format isAtStartOfLine || [ wrapIfNeeded ]
              ifFalse: [ insertRawSpace ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> () From: ( | {
         'Category: formatting state\x7fModuleInfo: Module: webBrowser InitialContents: InitializeToExpression: (true)'
        
         isConstructionShown <- bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> () From: ( | {
         'Category: formatting\x7fModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         isWrapNeededForWidth: w = ( |
             m.
             r.
            | 
            format isPreformatted ifTrue: [^ false].
            r: lastRow.
            (r morphCount != 0)  &&  [wouldOverflowLastRow: w]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> () From: ( | {
         'Category: formatting\x7fModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         labelMorphFor: str = ( |
             r.
            | 
            r: 
              ((labelMorph copyLabel: str)
                fontSpec: globals fontSpec 
                  copyName: format fontName
                     Style: format fontVariation
                      Size: format fontSize)
                color: format fontColor.
            "set cached width, etc"
            r computeWidthInWorld: process this hand world.
            r).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> () From: ( | {
         'Category: formatting\x7fModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         lastAnchorMorph = ( |
             r.
            | 
            r: myLastAnchorMorph.
            myLastAnchorMorph: nil.
            r).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> () From: ( | {
         'Category: formatting\x7fModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         lastAnchorMorph: am = ( |
            | 
            [myLastAnchorMorph = nil] assert.
            myLastAnchorMorph: am).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> () From: ( | {
         'Category: formatting\x7fModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         lastRow = ( |
            | editor lastMorph).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> () From: ( | {
         'Category: formatting\x7fModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         makeRoot = ( |
            | 
            rootMorph: webBrowser webPage copy.
            rootMorph beShrinkWrap.
            rootMorph htmlSource: rawString.
            rootMorph sourceURL: sourceURL. 
            "rootMorph must be in world so we can use its world for layout"
            rootMorph position:
              isConstructionShown  
                 ifTrue: [ initialRootPosition ]
                  False: [ maxSmallInt half @ 0 ].
            process this hand safelyDo: [
              (process this hand world addMorph:    rootMorph)
                                       moveToFront: rootMorph.
            ].
            rootMorph initialPosition: rootMorph position.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> () From: ( | {
         'Category: formatting\x7fModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         makeRootIfNone = ( |
            | 
            "can set rootMorph in htmlParser object
             to rebuild a web page"
            nil = rootMorph ifTrue: [makeRoot].
            rootMorph creatorProcess: process this.
            rootMorph safelyDo: [rootMorph addMorph: editor].
            rootMorph color: editor color.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> () From: ( | {
         'Category: formatting\x7fModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         makeSpacer = ( |
             s.
             sp.
            | 
            s: labelMorphFor: ' '.
            sp: spacerMorph copyV: s ascent "baseBounds height" Color: editor color.
            s delete.
            sp beShrinkWrapHorizontally.
            sp).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> () From: ( | {
         'Category: parsing tags\x7fModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         makeTag = ( |
            | 
            copyTag: tagProto).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> () From: ( | {
         'Category: formatting state\x7fModuleInfo: Module: webBrowser InitialContents: InitializeToExpression: (nil)'
        
         myLastAnchorMorph.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> () From: ( | {
         'Category: formatting\x7fModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         newEditor = ( |
             ed.
            | 
            ed: columnMorph copy borderWidth: 0.
            ed color: backgroundColor.
            ed beShrinkWrap.
            ed addMorph: (rowMorph copy borderWidth: 0) color: ed color.
            "
            ed: editorMorph copy.
            ed editMode: false.
            "
            ed).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'clonable' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> () From: ( | {
         'Category: parsing\x7fModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         parse = ( |
            | 
            userQuery show: 'Building page for ', sourceURL unparse
              While: [

             makeRootIfNone.

             (prefixIs: 'HTTP' ) ifTrue: [
                decodeHTTPStatusLine.
                eatMimeHeader.
              ].
              parseByFileExtension.
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> () From: ( | {
         'Category: public entry points\x7fModuleInfo: Module: webBrowser InitialContents: FollowSlot\x7fVisibility: public'
        
         parse: str From: url = ( |
            | 
            (copy setInputString: str SourceURL: url asURL) parse).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> () From: ( | {
         'Category: public entry points\x7fModuleInfo: Module: webBrowser InitialContents: FollowSlot\x7fVisibility: public'
        
         parseAndShow: str From: url = ( |
             rm.
             w.
            | 
            rm: (parse: str From: url) rootMorph.
            isConstructionShown && [rm topmostOwner = process this hand world]  ifFalse: [
              rm safelyDo: [ rm position: process this birthEvent cursorPoint ].
            ].
            rm).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> () From: ( | {
         'Category: public entry points\x7fModuleInfo: Module: webBrowser InitialContents: FollowSlot\x7fVisibility: public'
        
         parseAndShowFrom: url = ( |
            | 
            parseAndShow: url getContentsString From: url).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> () From: ( | {
         'Category: parsing\x7fModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         parseAudio = ( |
            | 
            halt).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> () From: ( | {
         'Category: parsing\x7fModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         parseByFileExtension = ( |
             s.
            | 
            s: sourceURL suffix uncapitalizeAll.
            case if: [ s = ''     ] Then: [ parseHTML ]
                 If: [ 'html' isPrefixOf: s  ] Then: [ parseHTML ]
                 If: [ 'gif'  isPrefixOf: s  ] Then: [ parseGIF  ]
                 If: [ 'txt'  isPrefixOf: s  ] Then: [ parseHTML ]
                 If: [ 'jpg'  isPrefixOf: s  ] Then: [ parseJPEG ]
                 If: [ 'au'   isPrefixOf: s  ] Then: [ parseAudio ]
                 If: [ 'java' isPrefixOf: s  ] Then: [ parseHTML ]
                 If: [ 'class' isPrefixOf: s ] Then: [ parseJavaClass ]
                 Else: [ userQuery show: 'Do not know how to parse URL (', sourceURL unparse, ') with suffix: ', s ForSecs: 5.
                         parseHTML ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> () From: ( | {
         'Category: parsing\x7fModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         parseGIF = ( |
             im.
            | 
            im: webBrowser cachedWebImageMorph copyURL: sourceURL ImageSource: rawString copyFrom: rsi.
            rootMorph safelyDo: [ rootMorph addMorph: im ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> () From: ( | {
         'Category: parsing\x7fModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         parseHTML = ( |
            | 
            ( 'html' isPrefixOf: sourceURL suffix uncapitalizeAll )
            || [ sourceURL file isEmpty
            || ['text/html' isPrefixOf: contentType ] ]
              ifTrue: [ (copyTag: tags html) doStart ].

            format isPreformatted ifFalse: [
              removeWhite.
            ].
            [
              | :exit. tag |
              copyTillTag.
              atEnd ifTrue: exit.
              tag: getTag.
              tag doTag.

              "stop if root morph is taken out of world"
              rootMorph isInWorld ifFalse: exit.

            ] loopExit.
            handleDocumentMoved.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> () From: ( | {
         'Category: parsing\x7fModuleInfo: Module: webBrowser InitialContents: FollowSlot\x7fVisibility: public'
        
         parseHTMLNoMatterWhatInputString: s SourceURL: u = ( |
            | 
            setInputString: s SourceURL: sourceURL.
            makeRootIfNone.
            parseHTML.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> () From: ( | {
         'Category: parsing\x7fModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         parseJPEG = ( |
             im.
            | 
            im: webBrowser cachedWebImageMorph copyURL: sourceURL ImageSource: rawString copyFrom: rsi.
            rootMorph safelyDo: [ rootMorph addMorph: im ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> () From: ( | {
         'Category: parsing\x7fModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         parseJavaClass = ( |
            | 
            halt: 'Not done yet, sorry!').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> () From: ( | {
         'Category: formatting\x7fCategory: format stack\x7fModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         popFormat = ( |
            | 
            formatStack size <= 1 ifFalse: [ 
              | f |
              f: formatStack removeFirst.
              format copyEditorStateFrom: f.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> () From: ( | {
         'Category: formatting\x7fCategory: format stack\x7fModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         popFormatTag: tag = ( |
             tn.
            | 
            " pop matching names"
            tn: tag tagName.
            format tag tagName = tn  ifTrue: [^ popFormat].
            'tag mismatch' printLine.

            " do not go past editor changes to preserve <a> <\a> paring"

            formatStack findFirst: [|:f| ( f tag tagName = tn ) || [ f editor != editor ]]
              IfPresent: [|:f|
                f editor = editor  ifTrue: [
                  [popFormat] untilTrue: [format tag tagName = tn].
                  popFormat.
                ].
            ] IfAbsent: [].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> () From: ( | {
         'Category: parsing\x7fCategory: utilities\x7fModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         prefixIs: str = ( |
            | 
            str = ( rawString copyFrom: rsi UpTo: rsi + str size )).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> () From: ( | {
         'Category: formatting\x7fCategory: format stack\x7fModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         pushFormat: fmt = ( |
            | 
            fmt copyEditorStateFrom: format.
            formatStack addFirst: fmt.
            setTyperFromFormat.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> () From: ( | {
         'Category: formatting\x7fCategory: format stack\x7fModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         pushFormat: fmt Tag: tag = ( |
            | 
            pushFormat: fmt tag: tag).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> () From: ( | {
         'Category: formatting\x7fModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         putInWorldForLayout: m = ( |
            | 
            m position: minSmallInt half @ 0.
            process this hand world safelyDo: [ process this hand world addMorph: m ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> () From: ( | {
         'Category: raw input state\x7fModuleInfo: Module: webBrowser InitialContents: InitializeToExpression: (\'\')'
        
         rawString <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> () From: ( | {
         'Category: parsed state\x7fModuleInfo: Module: webBrowser InitialContents: InitializeToExpression: (\'\')\x7fVisibility: public'
        
         reason <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> () From: ( | {
         'Category: parsing\x7fCategory: utilities\x7fModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         removeWhite = ( |
            | 
            [  atEnd not && [ thisChar isAllWhiteSpace ] ]
              whileTrue: [advance].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> () From: ( | {
         'Category: parsed state\x7fModuleInfo: Module: webBrowser InitialContents: InitializeToExpression: (nil)\x7fVisibility: public'
        
         rootMorph.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> () From: ( | {
         'Category: raw input state\x7fModuleInfo: Module: webBrowser InitialContents: InitializeToExpression: (0)'
        
         rsi <- 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> () From: ( | {
         'Category: public entry points\x7fModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         setInputString: s SourceURL: u = ( |
            | 
            rawString: s.
            sourceURL: u.
            rsi: 0.
            statusCode: 0.
            reason: ''.
            contentType: ''.
            formatStack addFirst: formatState copy editor: newEditor.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> () From: ( | {
         'Category: formatting\x7fModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         setTyper = ( |
            | 
            editor safelyDo: [
              editor firstRow lastRow insertAtEnd: editor typer
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> () From: ( | {
         'Category: formatting\x7fModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         setTyperFromFormat = ( |
            | 
            true ifTrue: [^ true].

            typer fontName: format fullFontName.
            typer fontSize: format fontSize.
            typer fontColor: format fontColor.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> () From: ( | {
         'Category: parsing tags\x7fModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         skipTag = ( |
            | 
            [ atEnd || [thisChar = '>']] whileFalse: [advance].
            tags noop).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> () From: ( | {
         'Category: raw input state\x7fModuleInfo: Module: webBrowser InitialContents: InitializeToExpression: (webBrowser url)'
        
         sourceURL <- bootstrap stub -> 'globals' -> 'webBrowser' -> 'url' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> () From: ( | {
         'Category: misc\x7fModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         statePrintString = ( |
            | reason).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> () From: ( | {
         'Category: parsed state\x7fModuleInfo: Module: webBrowser InitialContents: InitializeToExpression: (0)\x7fVisibility: public'
        
         statusCode <- 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         stringInEditor = ( |
             r <- ''.
            | 
            "should be in edMOrph"
            editor morphsDo: [|:rm|
              rm morphsDo: [|:m|
                case if: [m morphTypeName = 'labelMorph']
                     Then: [r: r, m label]
                     If: [m morphTypeName = 'spacerMorph']
                     Then: [r: r, ' ']
                     Else: [].
              ].
              r: r, '\n'.
            ].
            r copyWithoutLast).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> () From: ( | {
         'Category: parsing tags\x7fModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         tagProto = ( |
            | 
            tagProtoNamed: getIdentifier).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> () From: ( | {
         'Category: parsing tags\x7fModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         tagProtoNamed: n = ( |
            | 
            n sendTo: tags).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot\x7fVisibility: public'
        
         tags = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals webBrowser htmlParser tags.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> 'noop' -> () From: ( | {
         'Category: tag state\x7fModuleInfo: Module: webBrowser InitialContents: InitializeToExpression: (true)'
        
         isStart <- bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> 'noop' -> () From: ( | {
         'Category: tag state\x7fModuleInfo: Module: webBrowser InitialContents: InitializeToExpression: (nil)'
        
         myParser.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> 'noop' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> 'noop' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals webBrowser htmlParser tags noop parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> 'noop' -> 'parent' -> () From: ( | {
         'Category: public entry points\x7fModuleInfo: Module: webBrowser InitialContents: FollowSlot\x7fVisibility: public'
        
         copyIsStart: is Parser: p = ( |
            | 
            (copy isStart: is) myParser: p).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> 'noop' -> 'parent' -> () From: ( | {
         'Category: to be overriden\x7fModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         doEnd = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> 'noop' -> 'parent' -> () From: ( | {
         'Category: to be overriden\x7fModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         doStart = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> 'noop' -> 'parent' -> () From: ( | {
         'Category: public entry points\x7fModuleInfo: Module: webBrowser InitialContents: FollowSlot\x7fVisibility: public'
        
         doTag = ( |
            | 
            isStart ifTrue: [doStart] False: [doEnd]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> 'noop' -> 'parent' -> () From: ( | {
         'Category: utilities\x7fModuleInfo: Module: webBrowser InitialContents: FollowSlot\x7fVisibility: private'
        
         editor = ( |
            | 
            myParser editor).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> 'noop' -> 'parent' -> () From: ( | {
         'Category: utilities\x7fModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         format = ( |
            | myParser format).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> 'noop' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'clonable' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> 'noop' -> 'parent' -> () From: ( | {
         'Category: utilities\x7fModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         sourceURL = ( |
            | myParser sourceURL).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> 'noop' -> 'parent' -> () From: ( | {
         'Category: utilities\x7fModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         tagName = ( |
            | 
            asMirror creatorSlotHint name).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> 'noop' -> 'parent' -> () From: ( | {
         'Category: utilities\x7fModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         typer = ( |
            | 
            editor typer).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> () From: ( | {
         'Category: morphs\x7fModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         a = bootstrap define: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> 'a' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals webBrowser htmlParser tags noop copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> 'a' -> () From: ( |
             {} = 'Comment: anchor\x7fModuleInfo: Creator: globals webBrowser htmlParser tags a.

CopyDowns:
globals webBrowser htmlParser tags noop. copy 
SlotsToOmit: parent.

'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> 'a' -> () From: ( | {
         'Category: anchor state\x7fModuleInfo: Module: webBrowser InitialContents: InitializeToExpression: (\'\')'
        
         name <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> 'a' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> 'a' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals webBrowser htmlParser tags a parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> 'a' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         copeWithMissingEndOfPreviousAnchor = ( |
             m.
            | 
            m: myParser lastAnchorMorph.
            m = nil  ifFalse: [
              "must have missed end of previous anchor"
              doEnd. "end the last anchor"
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> 'a' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         doEnd = ( |
             anch.
            | 
            anch: myParser lastAnchorMorph.
            myParser popFormatTag: self.
            nil = anch ifTrue: [ ^ self ].
            myParser putInWorldForLayout: anch.
            myParser appendTextMorph: anch.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> 'a' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         doStart = ( |
             a.
             e.
             fmt.
            | 
            copeWithMissingEndOfPreviousAnchor.
            a: webBrowser 
               anchorMorph copyName: name 
                            Section: section 
                                URL:  urlString asURL relativeTo: sourceURL.
            e: myParser newEditor.
            a editor: e.
            myParser lastAnchorMorph: a.
            fmt: myParser format copy.
            "fmt fontColor: paint named: 'royal'."
            fmt editor: e.
            myParser pushFormat: fmt Tag: self.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> 'a' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         href: hrString = ( |
            | 
            hrString findFirst: [|:c| c = '#' ]
               IfPresent: [|:c. :i|
                urlString: hrString copySize: i.
                section: hrString copyFrom: i succ.
            ] IfAbsent: [urlString: hrString]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> 'a' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> 'noop' -> 'parent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> 'a' -> () From: ( | {
         'Category: anchor state\x7fModuleInfo: Module: webBrowser InitialContents: InitializeToExpression: (\'\')'
        
         section <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> 'a' -> () From: ( | {
         'Category: anchor state\x7fModuleInfo: Module: webBrowser InitialContents: InitializeToExpression: (\'\')'
        
         urlString <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         abstractFormatChanger = bootstrap define: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> 'abstractFormatChanger' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals webBrowser htmlParser tags noop copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> 'abstractFormatChanger' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals webBrowser htmlParser tags abstractFormatChanger.

CopyDowns:
globals webBrowser htmlParser tags noop. copy 
SlotsToOmit: parent.

'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> 'abstractFormatChanger' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> 'abstractFormatChanger' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals webBrowser htmlParser tags abstractFormatChanger parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> 'abstractFormatChanger' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         doEnd = ( |
            | 
            myParser popFormatTag: self.
            myParser ensureEmptyLines: endVSpace.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> 'abstractFormatChanger' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         doStart = ( |
            | 
            myParser pushFormat:  ((((
              format copy fontName: startFontName)
                          fontVariation: startFontVariation)
                          fontSize: startFontSize)
                          fontColor: startFontColor
            ) Tag: self.
            myParser ensureEmptyLines: startVSpace.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> 'abstractFormatChanger' -> 'parent' -> () From: ( | {
         'Category: absolutes\x7fModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         endVSpace = 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> 'abstractFormatChanger' -> 'parent' -> () From: ( | {
         'Category: deltas\x7fModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         fontSizeDelta = 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> 'abstractFormatChanger' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> 'noop' -> 'parent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> 'abstractFormatChanger' -> 'parent' -> () From: ( | {
         'Category: absolutes\x7fModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         startFontColor = ( |
            | 
            format fontColor).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> 'abstractFormatChanger' -> 'parent' -> () From: ( | {
         'Category: absolutes\x7fModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         startFontName = ( |
            | 
            format fontName).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> 'abstractFormatChanger' -> 'parent' -> () From: ( | {
         'Category: absolutes\x7fModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         startFontSize = ( |
            | 
            myParser firstFormat fontSize + fontSizeDelta).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> 'abstractFormatChanger' -> 'parent' -> () From: ( | {
         'Category: absolutes\x7fModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         startFontVariation = ( |
            | 
            format fontVariation).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> 'abstractFormatChanger' -> 'parent' -> () From: ( | {
         'Category: absolutes\x7fModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         startVSpace = 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> () From: ( | {
         'Category: logical styles\x7fModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         address = bootstrap define: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> 'address' -> () ToBe: bootstrap addSlotsTo: (
             globals webBrowser htmlParser tags abstractFormatChanger copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> 'address' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals webBrowser htmlParser tags address.

CopyDowns:
globals webBrowser htmlParser tags abstractFormatChanger. copy

'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> 'address' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         startFontVariation = 'Italic'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> () From: ( | {
         'Category: java\x7fModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         applet = bootstrap define: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> 'applet' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals webBrowser htmlParser tags noop copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> 'applet' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals webBrowser htmlParser tags applet.

CopyDowns:
globals webBrowser htmlParser tags noop. copy 
SlotsToOmit: parent.

'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> 'applet' -> () From: ( | {
         'Category: applet state\x7fModuleInfo: Module: webBrowser InitialContents: InitializeToExpression: (\'\')'
        
         code <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> 'applet' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot\x7fVisibility: public'
        
         doEnd = ( |
            | 
            myParser editor owner finishApplet.
            myParser popFormatTag: self.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> 'applet' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot\x7fVisibility: public'
        
         doStart = ( |
             a.
             e.
            | 
            e: myParser newEditor.
            a: webBrowser appletMorph copy.
            a addMorph: e.
            a frameStyle: a flatStyle.
            a color: paint named: 'blue'.
            a borderWidth: 1.
            a filled: false.
            height isEmpty ifTrue: [
              a beShrinkWrap.
            ] False: [
              a beRigid.
              a setWidth: width asInteger Height: height asInteger.
            ].
            a codeURL: code asURL relativeTo: sourceURL.
            myParser ensureEmptyLines: 1.
            myParser appendNonTextMorph: a.
            myParser pushFormat: (myParser format copy editor: e) Tag: self.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> 'applet' -> () From: ( | {
         'Category: applet state\x7fModuleInfo: Module: webBrowser InitialContents: InitializeToExpression: (\'\')'
        
         height <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> 'applet' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> 'noop' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> 'applet' -> () From: ( | {
         'Category: applet state\x7fModuleInfo: Module: webBrowser InitialContents: InitializeToExpression: (\'\')'
        
         width <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> () From: ( | {
         'Category: physical styles\x7fModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         b = bootstrap define: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> 'b' -> () ToBe: bootstrap addSlotsTo: (
             globals webBrowser htmlParser tags abstractFormatChanger copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> 'b' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals webBrowser htmlParser tags b.

CopyDowns:
globals webBrowser htmlParser tags abstractFormatChanger. copy

'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> 'b' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         startFontVariation = 'Bold'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> () From: ( | {
         'Category: misc formats\x7fModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         blockquote = bootstrap define: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> 'blockquote' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals webBrowser htmlParser tags noop copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> 'blockquote' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals webBrowser htmlParser tags blockquote.

CopyDowns:
globals webBrowser htmlParser tags noop. copy 
SlotsToOmit: parent.

'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> 'blockquote' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         doEnd = ( |
            | 
            myParser popFormatTag: self.
            myParser ensureEmptyLines: 1.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> 'blockquote' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         doStart = ( |
            | 
            myParser pushFormat: ( format copy leftIndent: 50) Tag: self.
            myParser ensureEmptyLines: 1.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> 'blockquote' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> 'noop' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> () From: ( | {
         'Category: misc\x7fModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         br = bootstrap define: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> 'br' -> () ToBe: bootstrap addSlotsTo: (
             globals webBrowser htmlParser tags noop copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> 'br' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals webBrowser htmlParser tags br.

CopyDowns:
globals webBrowser htmlParser tags noop. copy

'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> 'br' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         doTag = ( |
            | 
            myParser ensureEmptyLines: 1.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> () From: ( | {
         'Category: logical styles\x7fModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         cite = bootstrap define: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> 'cite' -> () ToBe: bootstrap addSlotsTo: (
             globals webBrowser htmlParser tags abstractFormatChanger copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> 'cite' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals webBrowser htmlParser tags cite.

CopyDowns:
globals webBrowser htmlParser tags abstractFormatChanger. copy

'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> 'cite' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         startFontVariation = 'Italic'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> () From: ( | {
         'Category: logical styles\x7fModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         code = bootstrap define: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> 'code' -> () ToBe: bootstrap addSlotsTo: (
             globals webBrowser htmlParser tags abstractFormatChanger copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> 'code' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals webBrowser htmlParser tags code.

CopyDowns:
globals webBrowser htmlParser tags abstractFormatChanger. copy

'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> 'code' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         startFontName = 'courier'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> () From: ( | {
         'Category: misc formats\x7fModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         p = bootstrap define: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> 'p' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals webBrowser htmlParser tags noop copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> 'p' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals webBrowser htmlParser tags p.

CopyDowns:
globals webBrowser htmlParser tags noop. copy 
SlotsToOmit: parent.

'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> 'p' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> 'p' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals webBrowser htmlParser tags p parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> 'p' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         doStart = ( |
            | 
            myParser ensureEmptyLines: 2).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> 'p' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> 'noop' -> 'parent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> () From: ( | {
         'Category: list items\x7fModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         li = bootstrap define: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> 'li' -> () ToBe: bootstrap addSlotsTo: (
             globals webBrowser htmlParser tags p copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> 'li' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals webBrowser htmlParser tags li.

CopyDowns:
globals webBrowser htmlParser tags p. copy

'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> 'li' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         doStart = ( |
            | 
            myParser ensureEmptyLines: 1.
            myParser indentTo: format firstIndent.
            insertTag).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> 'li' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         insertTag = ( |
            | 
            myParser insertNonSpaces: myParser format nextListItemTag.
            myParser format isAtStartOfLine: true.
            myParser indentTo: myParser format leftIndent.
            updateItemTag).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> 'li' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         updateItemTag = ( |
             n.
             t.
            | 
            t: myParser format nextListItemTag.
            t isEmpty not  &&  [t first isDigit] ifFalse: [^ self].
            n: t findFirst: [|:c| c isDigit not] IfPresent: [|:c. :i| i] IfAbsent: [t size].
            myParser format nextListItemTag: (t copySize: n) asInteger succ printString, (t copyFrom: n).
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> () From: ( | {
         'Category: list items\x7fModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         dd = bootstrap define: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> 'dd' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'doStart' From:
             bootstrap remove: 'insertTag' From:
             bootstrap remove: 'parent' From:
             bootstrap remove: 'updateItemTag' From:
             globals webBrowser htmlParser tags li copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> 'dd' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals webBrowser htmlParser tags dd.

CopyDowns:
globals webBrowser htmlParser tags li. copy 
SlotsToOmit: doStart insertTag parent updateItemTag.

'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> 'dd' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> 'li' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> () From: ( | {
         'Category: logical styles\x7fModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         dfn = bootstrap define: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> 'dfn' -> () ToBe: bootstrap addSlotsTo: (
             globals webBrowser htmlParser tags abstractFormatChanger copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> 'dfn' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals webBrowser htmlParser tags dfn.

CopyDowns:
globals webBrowser htmlParser tags abstractFormatChanger. copy

'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> 'dfn' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         startFontVaration = 'Italic'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> () From: ( | {
         'Category: lists\x7fModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         ul = bootstrap define: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> 'ul' -> () ToBe: bootstrap addSlotsTo: (
             globals webBrowser htmlParser tags noop copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> 'ul' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals webBrowser htmlParser tags ul.

CopyDowns:
globals webBrowser htmlParser tags noop. copy

'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> 'ul' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         biggestListTag = ( |
            | firstListTag).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> 'ul' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         doEnd = ( |
            | 
            myParser popFormatTag: self.
            myParser ensureEmptyLines: 1.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> 'ul' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         doStart = ( |
             fi.
            | 
            fi: myParser format leftIndent + firstIndentDelta.
            myParser pushFormat: (
            ( ( format copy leftIndent:      fi + leftIndentDelta )
                           firstIndent:      fi )
                      nextListItemTag: firstListTag
            ) Tag: self.
            myParser ensureEmptyLines: 1.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> 'ul' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         firstIndentDelta = 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> 'ul' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         firstListTag = 'o'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> 'ul' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         leftIndentDelta = ( |
             lbl.
             w.
            | 
            lbl: myParser labelMorphFor: biggestListTag, '  '.
            w: lbl width.
            lbl safelyDo: [ lbl delete].
            w).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> () From: ( | {
         'Category: lists\x7fModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         dl = bootstrap define: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> 'dl' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'biggestListTag' From:
             bootstrap remove: 'doEnd' From:
             bootstrap remove: 'doStart' From:
             bootstrap remove: 'firstIndentDelta' From:
             bootstrap remove: 'firstListTag' From:
             bootstrap remove: 'leftIndentDelta' From:
             bootstrap remove: 'parent' From:
             globals webBrowser htmlParser tags ul copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> 'dl' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals webBrowser htmlParser tags dl.

CopyDowns:
globals webBrowser htmlParser tags ul. copy 
SlotsToOmit: biggestListTag doEnd doStart firstIndentDelta firstListTag leftIndentDelta parent.

'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> 'dl' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         biggestListTag = '                 '.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> 'dl' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         firstListTag = ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> 'dl' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> 'ul' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> () From: ( | {
         'Category: list items\x7fModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         dt = bootstrap define: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> 'dt' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'doTag' From:
             bootstrap remove: 'parent' From:
             globals webBrowser htmlParser tags br copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> 'dt' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals webBrowser htmlParser tags dt.

CopyDowns:
globals webBrowser htmlParser tags br. copy 
SlotsToOmit: doTag parent.

'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> 'dt' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> 'br' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> () From: ( | {
         'Category: logical styles\x7fModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         em = bootstrap define: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> 'em' -> () ToBe: bootstrap addSlotsTo: (
             globals webBrowser htmlParser tags abstractFormatChanger copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> 'em' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals webBrowser htmlParser tags em.

CopyDowns:
globals webBrowser htmlParser tags abstractFormatChanger. copy

'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> 'em' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         startFontVaration = 'Italic'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> () From: ( | {
         'Category: forms\x7fModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         form = bootstrap define: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> 'form' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals webBrowser htmlParser tags noop copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> 'form' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals webBrowser htmlParser tags form.

CopyDowns:
globals webBrowser htmlParser tags noop. copy 
SlotsToOmit: parent.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> 'form' -> () From: ( | {
         'Category: form state\x7fModuleInfo: Module: webBrowser InitialContents: InitializeToExpression: (\'\')'
        
         action <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> 'form' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot\x7fVisibility: public'
        
         doEnd = ( |
            | 
            myParser editor owner finishForm.
            myParser popFormatTag: self.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> 'form' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot\x7fVisibility: public'
        
         doStart = ( |
             e.
             f.
            | 
            e: myParser newEditor.
            f: webBrowser formMorph copy.
            f addMorph: e.
            f frameStyle: f insetBezelStyle.
            f color: paint named: 'gray'.
            f borderWidth: 2.
            f filled: false.
            f actionURL: action asURL relativeTo: sourceURL.
            f method:  method isEmpty ifTrue: 'GET' False: method.
            f beShrinkWrap.
            method = 'POST'  ifTrue: [f encoding: enctype].
            myParser ensureEmptyLines: 1.
            myParser appendNonTextMorph: f.
            myParser pushFormat: (myParser format copy editor: e) Tag: self.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> 'form' -> () From: ( | {
         'Category: form state\x7fModuleInfo: Module: webBrowser InitialContents: InitializeToExpression: (\'\')'
        
         enctype <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> 'form' -> () From: ( | {
         'Category: form state\x7fModuleInfo: Module: webBrowser InitialContents: InitializeToExpression: (\'\')'
        
         method <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> 'form' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> 'noop' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> () From: ( | {
         'Category: headings\x7fModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         h1 = bootstrap define: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> 'h1' -> () ToBe: bootstrap addSlotsTo: (
             globals webBrowser htmlParser tags abstractFormatChanger copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> 'h1' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals webBrowser htmlParser tags h1.

CopyDowns:
globals webBrowser htmlParser tags abstractFormatChanger. copy

'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> 'h1' -> () From: ( | {
         'Category: format\x7fModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         endVSpace = 3.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> 'h1' -> () From: ( | {
         'Category: format\x7fModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         fontSizeDelta = 6.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> 'h1' -> () From: ( | {
         'Category: format\x7fModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         fontVaration = 'Bold'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> 'h1' -> () From: ( | {
         'Category: format\x7fModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         startVSpace = 4.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> () From: ( | {
         'Category: headings\x7fModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         h2 = bootstrap define: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> 'h2' -> () ToBe: bootstrap addSlotsTo: (
             globals webBrowser htmlParser tags abstractFormatChanger copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> 'h2' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals webBrowser htmlParser tags h2.

CopyDowns:
globals webBrowser htmlParser tags abstractFormatChanger. copy

'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> 'h2' -> () From: ( | {
         'Category: format\x7fModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         endVSpace = 3.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> 'h2' -> () From: ( | {
         'Category: format\x7fModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         fontSizeDelta = 4.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> 'h2' -> () From: ( | {
         'Category: format\x7fModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         startFontVaration = 'Bold'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> 'h2' -> () From: ( | {
         'Category: format\x7fModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         startVSpace = 3.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> () From: ( | {
         'Category: headings\x7fModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         h3 = bootstrap define: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> 'h3' -> () ToBe: bootstrap addSlotsTo: (
             globals webBrowser htmlParser tags abstractFormatChanger copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> 'h3' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals webBrowser htmlParser tags h3.

CopyDowns:
globals webBrowser htmlParser tags abstractFormatChanger. copy

'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> 'h3' -> () From: ( | {
         'Category: format\x7fModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         endVSpace = 1.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> 'h3' -> () From: ( | {
         'Category: format\x7fModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         fontSizeDelta = 3.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> 'h3' -> () From: ( | {
         'Category: format\x7fModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         startFontVaration = 'Bold'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> 'h3' -> () From: ( | {
         'Category: format\x7fModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         startVSpace = 2.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> () From: ( | {
         'Category: headings\x7fModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         h4 = bootstrap define: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> 'h4' -> () ToBe: bootstrap addSlotsTo: (
             globals webBrowser htmlParser tags abstractFormatChanger copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> 'h4' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals webBrowser htmlParser tags h4.

CopyDowns:
globals webBrowser htmlParser tags abstractFormatChanger. copy

'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> 'h4' -> () From: ( | {
         'Category: format\x7fModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         endVSpace = 1.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> 'h4' -> () From: ( | {
         'Category: format\x7fModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         fontSizeDelta = 2.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> 'h4' -> () From: ( | {
         'Category: format\x7fModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         startFontVariation = 'Bold'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> 'h4' -> () From: ( | {
         'Category: format\x7fModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         startVSpace = 2.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> () From: ( | {
         'Category: headings\x7fModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         h5 = bootstrap define: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> 'h5' -> () ToBe: bootstrap addSlotsTo: (
             globals webBrowser htmlParser tags abstractFormatChanger copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> 'h5' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals webBrowser htmlParser tags h5.

CopyDowns:
globals webBrowser htmlParser tags abstractFormatChanger. copy

'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> 'h5' -> () From: ( | {
         'Category: format\x7fModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         endVSpace = 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> 'h5' -> () From: ( | {
         'Category: format\x7fModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         fontSizeDelta = 1.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> 'h5' -> () From: ( | {
         'Category: format\x7fModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         startFontVariation = 'Bold'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> 'h5' -> () From: ( | {
         'Category: format\x7fModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         startVSpace = 1.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> () From: ( | {
         'Category: headings\x7fModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         h6 = bootstrap define: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> 'h6' -> () ToBe: bootstrap addSlotsTo: (
             globals webBrowser htmlParser tags abstractFormatChanger copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> 'h6' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals webBrowser htmlParser tags h6.

CopyDowns:
globals webBrowser htmlParser tags abstractFormatChanger. copy

'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> 'h6' -> () From: ( | {
         'Category: format\x7fModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         endVSpace = 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> 'h6' -> () From: ( | {
         'Category: format\x7fModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         fontSizeDelta = 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> 'h6' -> () From: ( | {
         'Category: format\x7fModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         startFontVariation = 'Bold'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> 'h6' -> () From: ( | {
         'Category: format\x7fModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         startVSpace = 1.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> () From: ( | {
         'Category: misc\x7fModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         head = bootstrap define: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> 'head' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals webBrowser htmlParser tags noop copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> 'head' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals webBrowser htmlParser tags head.

CopyDowns:
globals webBrowser htmlParser tags noop. copy 
SlotsToOmit: parent.

'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> 'head' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         doStart = ( |
            | 
            "in case no <html>"
            (myParser copyTag: myParser tags html) doStart.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> 'head' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> 'noop' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> () From: ( | {
         'Category: morphs\x7fModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         hr = bootstrap define: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> 'hr' -> () ToBe: bootstrap addSlotsTo: (
             globals webBrowser htmlParser tags noop copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> 'hr' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals webBrowser htmlParser tags hr.

CopyDowns:
globals webBrowser htmlParser tags noop. copy

'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> 'hr' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         doStart = ( |
             f.
            | 
            f: frameMorph copy.
            f frameStyle: f insetBezelStyle.
            f borderWidth: 1.
            f color: editor color.
            f beRigidVertically.
            f setHeight: 3.

            myParser ensureEmptyLines: 1.
            myParser indentTo: 0.
            myParser appendNonTextMorph: f.
            myParser ensureEmptyLines: 1.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> () From: ( | {
         'Category: misc\x7fModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         html = bootstrap define: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> 'html' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals webBrowser htmlParser tags noop copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> 'html' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals webBrowser htmlParser tags html.

CopyDowns:
globals webBrowser htmlParser tags noop. copy 
SlotsToOmit: parent.

'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> 'html' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         doEnd = ( |
            | 
            myParser popFormatTag: self.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> 'html' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         doStart = ( |
            | 
            myParser pushFormat: (
              ((( format copy
                     areTagsHonored: true)
                           fontName: 'times')
                           fontVariation: '')
                     isPreformatted: false
            ) Tag: self.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> 'html' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> 'noop' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> () From: ( | {
         'Category: physical styles\x7fModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         i = bootstrap define: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> 'i' -> () ToBe: bootstrap addSlotsTo: (
             globals webBrowser htmlParser tags abstractFormatChanger copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> 'i' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals webBrowser htmlParser tags i.

CopyDowns:
globals webBrowser htmlParser tags abstractFormatChanger. copy

'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> 'i' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         startFontVariation = 'Italic'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> () From: ( | {
         'Category: morphs\x7fModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         img = bootstrap define: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> 'img' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals webBrowser htmlParser tags noop copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> 'img' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals webBrowser htmlParser tags img.

CopyDowns:
globals webBrowser htmlParser tags noop. copy 
SlotsToOmit: parent.

'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> 'img' -> () From: ( | {
         'Category: image state\x7fModuleInfo: Module: webBrowser InitialContents: InitializeToExpression: (\'\')'
        
         alt <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> 'img' -> () From: ( | {
         'Category: image state\x7fModuleInfo: Module: webBrowser InitialContents: InitializeToExpression: (false)'
        
         ismap <- bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> 'img' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> 'img' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals webBrowser htmlParser tags img parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> 'img' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         doStart = ( |
             c.
             im.
             lbl.
            | 
            im: makeImageMorph.
            myParser appendNonTextMorph: im.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> 'img' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         makeImageMorph = ( |
             a.
             im.
             u.
            | 
            myParser areImagesShown ifFalse: [
              ^ (labelMorph copy label: alt isEmpty ifTrue: 'Images turned off' False: alt)
                   color: paint named: 'royal'.
            ].

            webBrowser cachedWebImageMorph copyURL: ( src asURL relativeTo: sourceURL ) AlternateText: alt IsMap: ismap != false).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> 'img' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> 'noop' -> 'parent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> 'img' -> () From: ( | {
         'Category: image state\x7fModuleInfo: Module: webBrowser InitialContents: InitializeToExpression: (\'\')'
        
         src <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> () From: ( | {
         'Category: forms\x7fModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         input = bootstrap define: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> 'input' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals webBrowser htmlParser tags noop copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> 'input' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals webBrowser htmlParser tags input.

CopyDowns:
globals webBrowser htmlParser tags noop. copy 
SlotsToOmit: parent.

'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> 'input' -> () From: ( | {
         'Category: input state\x7fModuleInfo: Module: webBrowser InitialContents: InitializeToExpression: (nil)'
        
         checked.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> 'input' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot\x7fVisibility: public'
        
         doStart = ( |
             i.
            | 

            i: (
             case
             if: [ type = 'text'     ] Then: [ webBrowser formInputTextMorph     ]
             If: [ type = 'password' ] Then: [ webBrowser formInputPasswordMorph ]
             If: [ type = 'radio'    ] Then: [ webBrowser formInputRadioMorph    ]
             If: [ type = 'submit'   ] Then: [ webBrowser formInputSubmitMorph   ]
             If: [ type = 'reset'    ] Then: [ webBrowser formInputResetMorph    ]
             If: [ type = 'checkbox' ] Then: [ webBrowser formInputCheckBoxMorph ]
             If: [ type = 'hidden'   ] Then: [ webBrowser formInputHiddenMorph   ]
             If: [ type = 'image'    ] Then: [ webBrowser formInputImageMorph    ]
             Else: [ userQuery report: 'unknown input type: ', type. ^ self]
            ) copy.

            i name: name.
            i value: value.
            i checked: nil != checked.

            size isEmpty ifFalse: [
              size findFirst: [|:c| c = ',']
                   IfPresent: [|:c. :i. xs. ys |
                     xs: size copySize: i.
                     ys: size copyFrom: i succ min: size size.
                     i size: (xs isEmpty ifTrue: 0 False: [xs asInteger])
                           @ (ys isEmpty ifTrue: 0 False: [ys asInteger])
              ]    IfAbsent: [i size: size asInteger @ 1].
            ].
            maxlength isEmpty ifFalse: [ i maxLength: maxlength asInteger].
            case if: [ type = 'image'  ] 
               Then: [ i initializeImage: ( ( ( myParser copyTag: myParser tags img )
                                                             src:      src ) 
                                                            ismap:    true )
                                               makeImageMorph
            ]  Else: [ i initialize ].

            i colorAll: editor color.
            myParser appendTextMorph: i.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> 'input' -> () From: ( | {
         'Category: input state\x7fModuleInfo: Module: webBrowser InitialContents: InitializeToExpression: (\'\')'
        
         maxlength <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> 'input' -> () From: ( | {
         'Category: input state\x7fModuleInfo: Module: webBrowser InitialContents: InitializeToExpression: (\'\')'
        
         name <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> 'input' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> 'noop' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> 'input' -> () From: ( | {
         'Category: input state\x7fModuleInfo: Module: webBrowser InitialContents: InitializeToExpression: (\'\')'
        
         size <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> 'input' -> () From: ( | {
         'Category: input state\x7fModuleInfo: Module: webBrowser InitialContents: InitializeToExpression: (\'\')'
        
         src <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> 'input' -> () From: ( | {
         'Category: input state\x7fModuleInfo: Module: webBrowser InitialContents: InitializeToExpression: (\'text\')'
        
         type <- 'text'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> 'input' -> () From: ( | {
         'Category: input state\x7fModuleInfo: Module: webBrowser InitialContents: InitializeToExpression: (\'\')'
        
         value <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> () From: ( | {
         'Category: misc\x7fModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         isindex = bootstrap define: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> 'isindex' -> () ToBe: bootstrap addSlotsTo: (
             globals webBrowser htmlParser tags noop copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> 'isindex' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals webBrowser htmlParser tags isindex.

CopyDowns:
globals webBrowser htmlParser tags noop. copy

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> 'isindex' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         doStart = ( |
             f.
             t.
            | 
            " isIndex just makes a form with one text field"
            f: myParser copyTag: myParser tags form.
            f method: 'isindex'.
            t: myParser copyTag: myParser tags input.
            f doStart.
            myParser insertNonTagString: prompt.
            t doStart.
            f doEnd.

            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> 'isindex' -> () From: ( | {
         'Category: isindex state\x7fModuleInfo: Module: webBrowser InitialContents: InitializeToExpression: (\'\')'
        
         prompt <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> () From: ( | {
         'Category: logical styles\x7fModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         kbd = bootstrap define: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> 'kbd' -> () ToBe: bootstrap addSlotsTo: (
             globals webBrowser htmlParser tags abstractFormatChanger copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> 'kbd' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals webBrowser htmlParser tags kbd.

CopyDowns:
globals webBrowser htmlParser tags abstractFormatChanger. copy

'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> 'kbd' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         startFontName = 'courier'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> 'kbd' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         startFontVariation = 'Bold'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> () From: ( | {
         'Category: lists\x7fModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         ol = bootstrap define: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> 'ol' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'biggestListTag' From:
             bootstrap remove: 'doEnd' From:
             bootstrap remove: 'doStart' From:
             bootstrap remove: 'firstIndentDelta' From:
             bootstrap remove: 'firstListTag' From:
             bootstrap remove: 'leftIndentDelta' From:
             bootstrap remove: 'parent' From:
             globals webBrowser htmlParser tags ul copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> 'ol' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals webBrowser htmlParser tags ol.

CopyDowns:
globals webBrowser htmlParser tags ul. copy 
SlotsToOmit: biggestListTag doEnd doStart firstIndentDelta firstListTag leftIndentDelta parent.

'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> 'ol' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         biggestListTag = '999.'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> 'ol' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         firstListTag = '1.'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> 'ol' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> 'ul' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> () From: ( | {
         'Category: forms\x7fModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         option = bootstrap define: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> 'option' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals webBrowser htmlParser tags noop copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> 'option' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals webBrowser htmlParser tags option.

CopyDowns:
globals webBrowser htmlParser tags noop. copy 
SlotsToOmit: parent.

'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> 'option' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         doStart = ( |
            | 
            selected: nil != selected.
            myParser editor addSelectOptionToForm: self.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> 'option' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> 'noop' -> 'parent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> 'option' -> () From: ( | {
         'Category: option state\x7fModuleInfo: Module: webBrowser InitialContents: InitializeToExpression: (nil)'
        
         selected.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> () From: ( | {
         'Category: java\x7fModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         param = bootstrap define: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> 'param' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals webBrowser htmlParser tags noop copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> 'param' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals webBrowser htmlParser tags param.

CopyDowns:
globals webBrowser htmlParser tags noop. copy 
SlotsToOmit: parent.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> 'param' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot\x7fVisibility: public'
        
         doStart = ( |
             a.
            | 
            a: myParser editor owner.
            a params at: name Put: value.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> 'param' -> () From: ( | {
         'Category: param state\x7fModuleInfo: Module: webBrowser InitialContents: InitializeToExpression: (\'\')'
        
         name <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> 'param' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> 'noop' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> 'param' -> () From: ( | {
         'Category: param state\x7fModuleInfo: Module: webBrowser InitialContents: InitializeToExpression: (\'\')'
        
         value <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> () From: ( | {
         'Category: preformatted\x7fModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         pre = bootstrap define: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> 'pre' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals webBrowser htmlParser tags noop copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> 'pre' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals webBrowser htmlParser tags pre.

CopyDowns:
globals webBrowser htmlParser tags noop. copy 
SlotsToOmit: parent.

'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> 'pre' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         doEnd = ( |
            | 
            myParser popFormatTag: self.
            myParser ensureEmptyLines: 1.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> 'pre' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         doStart = ( |
            | 
            myParser pushFormat: (
             (((format copy fontName: 'courier') 
                      fontVariation: '')
                      isPreformatted: true)
                          leftIndent: 0)
            Tag: self.
            myParser ensureEmptyLines: 1.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> 'pre' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> 'noop' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> () From: ( | {
         'Category: preformatted\x7fModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         xmp = bootstrap define: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> 'xmp' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'doEnd' From:
             bootstrap remove: 'doStart' From:
             bootstrap remove: 'parent' From:
             globals webBrowser htmlParser tags pre copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> 'xmp' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals webBrowser htmlParser tags xmp.

CopyDowns:
globals webBrowser htmlParser tags pre. copy 
SlotsToOmit: doEnd doStart parent.

'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> 'xmp' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         doStart = ( |
            | 
            resend.doStart.
            format areTagsHonored: false.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> 'xmp' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> 'pre' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> () From: ( | {
         'Category: preformatted\x7fModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         plaintext = bootstrap define: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> 'plaintext' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'doStart' From:
             bootstrap remove: 'parent' From:
             globals webBrowser htmlParser tags xmp copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> 'plaintext' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals webBrowser htmlParser tags plaintext.

CopyDowns:
globals webBrowser htmlParser tags xmp. copy 
SlotsToOmit: doStart parent.

'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> 'plaintext' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> 'xmp' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> () From: ( | {
         'Category: logical styles\x7fModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         samp = bootstrap define: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> 'samp' -> () ToBe: bootstrap addSlotsTo: (
             globals webBrowser htmlParser tags abstractFormatChanger copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> 'samp' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals webBrowser htmlParser tags samp.

CopyDowns:
globals webBrowser htmlParser tags abstractFormatChanger. copy

'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> 'samp' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         startFontName = 'courier'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> () From: ( | {
         'Category: forms\x7fModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         select = bootstrap define: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> 'select' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals webBrowser htmlParser tags noop copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> 'select' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals webBrowser htmlParser tags select.

CopyDowns:
globals webBrowser htmlParser tags noop. copy 
SlotsToOmit: parent.

'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> 'select' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         buildMorph = ( |
            | 
            size: size asNumber.
            multiple: nil != multiple.
            appendTextMorph: (
               (size != '1') || multiple
                 ifTrue: [ webBrowser formSelectMenuMorph ]
                  False: [ webBrowser formSelectListMorph ]
            ) copy buildOptions: optionTags.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> 'select' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         doEnd = ( |
            | 
            " collect last option"
            ( myParser editor addSelectOptionToForm: myParser tags option copy myParser: myParser ) buildTheList.
            myParser popFormatTag: self.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> 'select' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         doStart = ( |
             e.
             f.
             m.
             mo.
             s.
            | 
            resend.doStart.

            s: size asInteger.
            m: '' != multiple.
            mo:  (s != 1) || m
                 ifTrue: [ ( ( webBrowser formSelectListMorph copy )
                                numberOfShownChoices: s )
                                allowMultipleSelections: m ]
                  False: [ webBrowser formSelectMenuMorph copy ].
            mo name: name.
            mo beShrinkWrap.
            myParser putInWorldForLayout: mo.
            myParser appendTextMorph: mo.

            e: myParser newEditor.
            f: myParser format copy.
            f editor: e.
            myParser pushFormat: f Tag: self.
            mo safelyDo: [ mo addMorph: e. e position: 0@0. ].

            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> 'select' -> () From: ( | {
         'Category: select state\x7fModuleInfo: Module: webBrowser InitialContents: InitializeToExpression: (\'\')'
        
         multiple <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> 'select' -> () From: ( | {
         'Category: select state\x7fModuleInfo: Module: webBrowser InitialContents: InitializeToExpression: (\'\')'
        
         name <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> 'select' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> 'noop' -> 'parent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> 'select' -> () From: ( | {
         'Category: select state\x7fModuleInfo: Module: webBrowser InitialContents: InitializeToExpression: (\'1\')'
        
         size <- '1'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> () From: ( | {
         'Category: misc\x7fModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         selfcode = bootstrap define: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> 'selfcode' -> () ToBe: bootstrap addSlotsTo: (
             globals webBrowser htmlParser tags noop copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> 'selfcode' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals webBrowser htmlParser tags selfcode.

CopyDowns:
globals webBrowser htmlParser tags noop. copy

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> 'selfcode' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         doEnd = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> 'selfcode' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         doStart = ( |
             b.
            | 
            b: ui2Button copy.
            b target: editor root.
            b buttonArgs: vector copyAddFirst: src. 
            b script: 'event sourceHand attach: buttonArgs first eval'.
            b label: lbl.
            b colorAll: editor color.
            myParser appendNonTextMorph: b.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> 'selfcode' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: InitializeToExpression: (\'get Self object\')'
        
         lbl <- 'get Self object'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> 'selfcode' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: InitializeToExpression: (\'target\')'
        
         src <- 'target'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> () From: ( | {
         'Category: logical styles\x7fModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         strong = bootstrap define: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> 'strong' -> () ToBe: bootstrap addSlotsTo: (
             globals webBrowser htmlParser tags abstractFormatChanger copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> 'strong' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals webBrowser htmlParser tags strong.

CopyDowns:
globals webBrowser htmlParser tags abstractFormatChanger. copy

'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> 'strong' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         startFontVariation = 'Bold'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> () From: ( | {
         'Category: forms\x7fModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         textarea = bootstrap define: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> 'textarea' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals webBrowser htmlParser tags noop copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> 'textarea' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals webBrowser htmlParser tags textarea.

CopyDowns:
globals webBrowser htmlParser tags noop. copy 
SlotsToOmit: parent.

'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> 'textarea' -> () From: ( | {
         'Category: textarea state\x7fModuleInfo: Module: webBrowser InitialContents: InitializeToExpression: (\'\')'
        
         cols <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> 'textarea' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         doEnd = ( |
             inits.
             t.
            | 
            t: myParser format tag.
            inits: myParser stringInEditor.
            myParser popFormatTag: self.
            myParser appendNonTextMorph: 
              webBrowser formTextAreaMorph
                copyName: t name
                TextSize: t cols asInteger @ t rows asInteger
                  String: inits
                   Color: myParser editor color.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> 'textarea' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         doStart = ( |
             e.
             fmt.
            | 
            e: myParser newEditor.
            fmt: myParser format copy.
            fmt editor: e.
            myParser pushFormat: fmt Tag: self.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> 'textarea' -> () From: ( | {
         'Category: textarea state\x7fModuleInfo: Module: webBrowser InitialContents: InitializeToExpression: (\'\')'
        
         name <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> 'textarea' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> 'noop' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> 'textarea' -> () From: ( | {
         'Category: textarea state\x7fModuleInfo: Module: webBrowser InitialContents: InitializeToExpression: (\'\')'
        
         rows <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> () From: ( | {
         'Category: morphs\x7fModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         title = bootstrap define: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> 'title' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals webBrowser htmlParser tags noop copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> 'title' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals webBrowser htmlParser tags title.

CopyDowns:
globals webBrowser htmlParser tags noop. copy 
SlotsToOmit: parent.

'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> 'title' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> 'title' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals webBrowser htmlParser tags title parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> 'title' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         doEnd = ( |
             ts.
            | 
            ts: ''.
            myParser lastRow morphsDo: [|:m| 
              m morphTypeName = 'labelMorph' ifTrue: [ ts: ts, m label ]].
            myParser rootMorph titleString: ts.
            myParser popFormatTag: self.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> 'title' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         doStart = ( |
             e.
             f.
             fmt.
             r.
            | 
            f: frameMorph copy.
            f frameStyle: f insetBezelStyle.
            f color: editor color.
            f beShrinkWrapHorizontally.

            e: myParser newEditor.
            f addMorph: e.

            "put frame at top of column"
            r: myParser rootMorph.
            r safelyDo: [r addMorph: f.  r moveToFront: f. ].
            fmt: myParser format copy.
            fmt fontSize: format fontSize - 2.
            fmt fontVariation: 'Italic'.
            fmt editor: e.
            myParser pushFormat: fmt Tag: self.

            myParser ensureEmptyLines: 0.

            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> 'title' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> 'noop' -> 'parent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> () From: ( | {
         'Category: physical styles\x7fModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         tt = bootstrap define: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> 'tt' -> () ToBe: bootstrap addSlotsTo: (
             globals webBrowser htmlParser tags abstractFormatChanger copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> 'tt' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals webBrowser htmlParser tags tt.

CopyDowns:
globals webBrowser htmlParser tags abstractFormatChanger. copy

'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> 'tt' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         startFontName = 'courier'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> () From: ( | {
         'Category: unknown tags\x7fModuleInfo: Module: webBrowser InitialContents: FollowSlot\x7fVisibility: public'
        
         undefinedSelector: sel Type: msgType Delegatee: del MethodHolder: mh Arguments: args = ( |
            | 
            ('Ignoring unknown tag: ', sel) printLine.
            noop).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> () From: ( | {
         'Category: logical styles\x7fModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         var = bootstrap define: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> 'var' -> () ToBe: bootstrap addSlotsTo: (
             globals webBrowser htmlParser tags abstractFormatChanger copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> 'var' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals webBrowser htmlParser tags var.

CopyDowns:
globals webBrowser htmlParser tags abstractFormatChanger. copy

'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> 'tags' -> 'var' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         startFontVariation = 'Italic'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> () From: ( | {
         'Category: parsing\x7fCategory: utilities\x7fModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         thisChar = ( |
            | rawString at: rsi).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> () From: ( | {
         'Category: parsing\x7fCategory: utilities\x7fModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         threeDigitNumber = ( |
            | 
            ( consumeChar, consumeChar, consumeChar ) asInteger).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> () From: ( | {
         'Category: parsing\x7fCategory: utilities\x7fModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         toEndOfLine = ( |
             r.
            | 
            r: collector copyFirst: ''.
            [ | :exit. c |
              atEnd ifTrue: exit.
              c: consumeChar.
              c = '\n' ifTrue: exit.
              r: r & c.
            ] loopExit.
            r flatString).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         typer = ( |
            | editor typer).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         widthLimit = ( |
            | format widthLimit).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         widthLimit: x = ( |
            | format widthLimit: x. self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> () From: ( | {
         'Category: formatting\x7fModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         wouldOverflowLastRow: w = ( |
             r.
            | 
            r: lastRow.
            ((r morphCount = 0  ifTrue: 0 False: [ r lastMorph baseBounds right ]) + w) > widthLimit).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> () From: ( | {
         'Category: formatting\x7fModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         wrap = ( |
            | format emptyLinesSinceText: 1. insertRawNewline).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> () From: ( | {
         'Category: formatting\x7fModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         wrapIfNeeded = ( |
            | 
            wrapIfNeededForWidth: 0).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'htmlParser' -> () From: ( | {
         'Category: formatting\x7fModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         wrapIfNeededForWidth: w = ( |
            | 
            ( isWrapNeededForWidth: w)
              ifTrue: [ wrap. true ]
               False: false).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> () From: ( | {
         'Category: prototypes\x7fCategory: requesters\x7fModuleInfo: Module: webBrowser InitialContents: InitializeToExpression: (webBrowser configurationRequester)'
        
         localRequester <- bootstrap stub -> 'globals' -> 'webBrowser' -> 'configurationRequester' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'oddball' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> () From: ( | {
         'Category: prototypes\x7fCategory: requesters\x7fModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         requester = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'webBrowser' -> 'requester' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals webBrowser requester.
\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'requester' -> () From: ( | {
         'Category: working I/O\x7fModuleInfo: Module: webBrowser InitialContents: InitializeToExpression: (false)\x7fVisibility: private'
        
         debug <- bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'requester' -> () From: ( | {
         'Category: experimental\x7fModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         forkReader = ( |
            | 
            ( message copy receiver: self Selector: 'reader') fork).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'requester' -> () From: ( | {
         'Category: working I/O\x7fModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         getContentsOf: url Limit: lim = ( |
            | 
            request:

              requestName, 
              ' ', 
              ( urlContentsForRequest: url ), 
              ( "requestName uncapitalizeAll = 'get' ifTrue: '' False:" ' HTTP/1.0' ), 
              '\r\n',
              'Host: ', (url host), '\r\n',
              ( isCachingOK ifTrue: '' False: 'Pragma: no-cache\r\n' ),
              '\r\n'
             Limit: lim).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'requester' -> () From: ( | {
         'Category: working I/O\x7fModuleInfo: Module: webBrowser InitialContents: FollowSlot\x7fVisibility: private'
        
         getHost: host URL: url Limit: lim = ( |
             r.
            | 
            openHost: host.
            r: getContentsOf: url Limit: lim.
            r).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'requester' -> () From: ( | {
         'Category: working I/O\x7fModuleInfo: Module: webBrowser InitialContents: FollowSlot\x7fVisibility: public'
        
         getRest = ( |
            | 
            getRestLimit: maxSmallInt).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'requester' -> () From: ( | {
         'Category: working I/O\x7fModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         getRestLimit: lim = ( |
             n.
             res.
            | 
            res: collector copyFirst: ''.
            n: lim.
            [ socket atEOF || [n <= 0] ] whileFalse: [
              | s |
              s: socket readMin: 0 Max: n min: 4096. 
              res: res & s.
              n: n - s size.
            ].
            socket atEOF ifTrue: [ 
               socket closeIfFail: []. 
               debug ifTrue: [ os_file debugFd: -1. ].
            ].
            res flatString).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'requester' -> () From: ( | {
         'Category: working I/O\x7fModuleInfo: Module: webBrowser InitialContents: FollowSlot\x7fVisibility: public'
        
         getURL: url = ( |
            | getURL: url Limit: maxSmallInt).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'requester' -> () From: ( | {
         'Category: working I/O\x7fModuleInfo: Module: webBrowser InitialContents: FollowSlot\x7fVisibility: public'
        
         getURL: url Limit: lim = ( |
             u.
            | 
            u: url asURL.
            userQuery show: 'Getting ', u unparse
                      While: [ getHost: u host URL: u Limit: lim ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'requester' -> () From: ( | {
         'Category: working I/O\x7fModuleInfo: Module: webBrowser InitialContents: FollowSlot\x7fVisibility: private'
        
         hostToOpen: host = ( |
            | host).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'requester' -> () From: ( | {
         'Category: working I/O\x7fModuleInfo: Module: webBrowser InitialContents: InitializeToExpression: (true)'
        
         isCachingOK <- bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'requester' -> () From: ( | {
         'Category: experimental\x7fModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         open = ( |
            | 
            socket: os_file openTCPHost: 'sunweb.ebay.sun.com' asByteVector Port: 80).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'requester' -> () From: ( | {
         'Category: working I/O\x7fModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         openHost: host = ( |
            | 
            socket: os_file openTCPHost: ( hostToOpen: host)  Port: portToOpen.
            debug  ifTrue: [ os_file debugFd: socket fileDescriptor ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'requester' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'clonable' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'requester' -> () From: ( | {
         'Category: working I/O\x7fModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         portToOpen = 80.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'requester' -> () From: ( | {
         'Category: experimental\x7fModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         reader = ( |
            | 
            [socket atEOF] whileFalse: [socket read print].
            'EOF on socket' printLine.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'requester' -> () From: ( | {
         'Category: working I/O\x7fModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         request: r Limit: lim = ( |
            | 
            showRequests ifTrue: [(r, requestData) printLine].
            socket write: r, requestData.
            getRestLimit: lim).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'requester' -> () From: ( | {
         'Category: working I/O\x7fModuleInfo: Module: webBrowser InitialContents: InitializeToExpression: (\'\')'
        
         requestData <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'requester' -> () From: ( | {
         'Category: working I/O\x7fModuleInfo: Module: webBrowser InitialContents: InitializeToExpression: (\'GET\')'
        
         requestName <- 'GET'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'requester' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: InitializeToExpression: (false)'
        
         showRequests <- bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'requester' -> () From: ( | {
         'Category: working I/O\x7fModuleInfo: Module: webBrowser InitialContents: InitializeToExpression: (nil)'
        
         socket <- bootstrap stub -> 'globals' -> 'nil' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'requester' -> () From: ( | {
         'Category: working I/O\x7fModuleInfo: Module: webBrowser InitialContents: FollowSlot\x7fVisibility: private'
        
         urlContentsForRequest: url = ( |
            | url uri).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'requester' -> () From: ( | {
         'Category: experimental\x7fModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         write: s = ( |
            | 
            socket write: s, '\n').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'requester' -> () From: ( | {
         'Category: experimental\x7fModuleInfo: Module: webBrowser InitialContents: InitializeToExpression: (nil)'
        
         xsocket.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> () From: ( | {
         'Category: prototypes\x7fCategory: requesters\x7fModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         proxyRequester = bootstrap define: bootstrap stub -> 'globals' -> 'webBrowser' -> 'proxyRequester' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'forkReader' From:
             bootstrap remove: 'getContentsOf:Limit:' From:
             bootstrap remove: 'getHost:URL:Limit:' From:
             bootstrap remove: 'getRest' From:
             bootstrap remove: 'getRestLimit:' From:
             bootstrap remove: 'getURL:' From:
             bootstrap remove: 'getURL:Limit:' From:
             bootstrap remove: 'hostToOpen:' From:
             bootstrap remove: 'open' From:
             bootstrap remove: 'openHost:' From:
             bootstrap remove: 'parent' From:
             bootstrap remove: 'portToOpen' From:
             bootstrap remove: 'reader' From:
             bootstrap remove: 'request:Limit:' From:
             bootstrap remove: 'urlContentsForRequest:' From:
             bootstrap remove: 'write:' From:
             globals webBrowser requester copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'webBrowser' -> 'proxyRequester' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals webBrowser proxyRequester.

CopyDowns:
globals webBrowser requester. copy 
SlotsToOmit: forkReader getContentsOf:Limit: getHost:URL:Limit: getRest getRestLimit: getURL: getURL:Limit: hostToOpen: open openHost: parent portToOpen reader request:Limit: urlContentsForRequest: write:.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'proxyRequester' -> () From: ( | {
         'Category: working I/O\x7fModuleInfo: Module: webBrowser InitialContents: FollowSlot\x7fVisibility: private'
        
         hostToOpen: host = ( |
            | 
            proxy host).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'proxyRequester' -> () From: ( | {
         'Category: working I/O\x7fModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         openHost: host = ( |
            | 
            socket: os_file openTCPHost: proxy host Port: proxy port.
            debug  ifTrue: [ os_file debugFd: socket fileDescriptor ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'proxyRequester' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'globals' -> 'webBrowser' -> 'requester' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'proxyRequester' -> () From: ( | {
         'Category: working I/O\x7fModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         portToOpen = ( |
            | proxy port).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'proxyRequester' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: InitializeToExpression: (nil \"webBrowser url copy\")'
        
         proxy.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'proxyRequester' -> () From: ( | {
         'Category: working I/O\x7fModuleInfo: Module: webBrowser InitialContents: FollowSlot\x7fVisibility: private'
        
         urlContentsForRequest: url = ( |
            | 
            url unparse).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> () From: ( | {
         'Category: results\x7fModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         results = [ | x =  ( bootstrap setObjectAnnotationOf: vector _Clone From: ( |
                     {} = 'ModuleInfo: Creator: globals webBrowser results.
'.
                    | ) ) _Clone: 6 Filler: 0| 
             x _At: 0  Put: ().
             x _At: 1  Put: ().
             x _At: 2  Put: ().
             x _At: 3  Put: ().
             x _At: 4  Put: ().
             x _At: 5  Put: ().
             x] value.
        } | ) 

 ((bootstrap stub -> 'globals' -> 'webBrowser') \/-> 'results') -> () _At: 0 Put: (
     'HTTP/1.0 400 Bad Request
Date: Monday, 20-Feb-95 00:32:02 GMT
Server: NCSA/1.3.A+
MIME-version: 1.0
Content-type: text/html

<HEAD><TITLE>400 Bad Request</TITLE></HEAD>
<BODY><H1>400 Bad Request</H1>
Your client sent a query that this server could not
understand.<P>
Reason: Server is only a proxy for http requests<P>
</BODY>
')

 ((bootstrap stub -> 'globals' -> 'webBrowser') \/-> 'results') -> () _At: 1 Put: (
     '
<! Alternative SML Home Page
Created by Amy Tashbook 9/09/94 !>


<title>Sun Microsystems Laboratories</title>

<a href=\"http://sunlabs.eng/local-cgi-bin/imagemap/title\">
<img src=\"/images/titlebar.gif\" ismap></a>

<img src=\"/images/grey-rule.gif\">
<p>

<img src=\"/images/lake.gif\">

<p>\"Vision is the art of seeing things invisible.\"
<br><i>Jonathan Swift</i> (1667-1745)
<br>
<img src=\"/images/grey-rule.gif\">

<h3><a href=\"/welcome.html\">
<img align=middle src=\"/images/gray_dot.gif\"> Welcome to SML\'s New Pages!</a></h3>

<h3><a href=\"/features/\">
<img align=middle src=\"/images/gray_dot.gif\"> Features & Future Events</a></h3>

<h3><a href=\"/general-info/\">
<img align=middle src=\"/images/gray_dot.gif\"> SML Information Bank</a></h3>

<h3><a href=\"/projects/\">
<img align=middle src=\"/images/gray_dot.gif\"> Projects</a></h3>

<h3><a href=\"/people/\">
<img align=middle src=\"/images/gray_dot.gif\"> People</a></h3>

<h3><a href=\"/navigation/\">
<img align=middle src=\"/images/gray_dot.gif\"> Sailing the Information Seas</a></h3>

<img src=\"/images/grey-rule.gif\">

<br><address>webmaster@sunlabs.eng.sun.com</address>
')

 ((bootstrap stub -> 'globals' -> 'webBrowser') \/-> 'results') -> () _At: 2 Put: (
     '<HEAD><TITLE>404 Not Found</TITLE></HEAD>
<H1>404 Not Found</H1><BODY>
The requested URL http://tachyon/ was not found on this server.<P>
</BODY>
')

 ((bootstrap stub -> 'globals' -> 'webBrowser') \/-> 'results') -> () _At: 3 Put: (
     '<HEAD><TITLE>Document moved</TITLE></HEAD>
<BODY><H1>Document moved</H1>
This document has moved <A HREF=\"http://sunweb.EBay.Sun.COM:80/sunweb/\">here</A>.<P>
</BODY>
')

 ((bootstrap stub -> 'globals' -> 'webBrowser') \/-> 'results') -> () _At: 4 Put: (
     '<!-- sccsid: %W% %E% --->
<html>
<head>
<title>WebRunner  Home Page</title>
</head>
<body>

<h1>
<img src=\"graphics/FP-JugglerC.gif\" align=middle width=62 height=76>
Welcome to the WebRunner Home Page
<img src=\"graphics/sun.gif\" align=middle width=64 height=64>


</h1>

<dl>
<dd>
<app class=\"AudioItem\" snd=\"http://tachyon.eng.sun.com/audio/harp.au\" src=\"file://~webrunner/demo/\">
</dl>

We are a small software group in SMCC developing a
very cool software environment for the Internet,
based on a new programming language called O.A.K.

<hr>

<h2>
<img src=\"graphics/Duke.gif\" alt=\"\" align=middle width=46 height=68>
Meet the People
</h2>

<dl>
<dd><img src=\"graphics/red-ball.gif\" alt=\"o\" width=12 height=12>
See the on-line text <a href=\"People/namelist\">phone list</a>
for quick details about the gang.
<dd><img src=\"graphics/green-ball.gif\" alt=\"o\" width=12 height=12>
Or check out <a href=\"People/namelist.html\">a prettier one</a> with faces.
<dd><img src=\"graphics/blue-ball.gif\" alt=\"o\" width=12 height=12>
This <a href=\"People/tile.html\">face index</a> will take you to
personal homepages.
</dl>

<h2>
<img src=\"folio/graphics/liveoak.gif\" alt=\"\" align=middle width=64 height=63>
What ARE we doing?
</h2>

<dl>
<dd><img src=\"graphics/text.gif\" alt=\"o\" align=middle width=32 height=32>
The <em>NEW</em> <a href=\"folio/\">WebRunner Page</a>
<dd><img src=\"graphics/text.gif\" alt=\"o\" align=middle width=32 height=32>
<a href=\"doc/index.html\">
The O.A.K. Documentation Home Page</a> for the 1.0 Alpha release.
<br>
<dd><img src=\"graphics/text.gif\" alt=\"o\" align=middle width=32 height=32>
A draft of a paper on the 
<a href=\"OakIntermediateRepPaper.ps\">philosophy
behind the 
O.A.K. bytecodes</a>.
<br>
<br>
<dd><img src=\"graphics/Duke.gif\" alt=\"\" align=middle width=46 height=68>
Check out our <a href=\"http://webrunner.neato.org/openings.html\">
job openings</a>. Join the team that\'s changing the WWW!

<br><br>
</dl>
<hr>
<h2>
Internal Documentation
</h2>
We also use this page to document our internal progress.
These links are mostly for the consumption of WebRunner team members, but you are
free to browse them if you like.
<dl>
<dd><img src=\"/graphics/text.gif\" alt=\"o\" align=middle width=32 height=32>
<a href=\"oakissues/underconstruction.html\">Next Release\'s Schedule.</a>
<dd><img src=\"graphics/text.gif\" alt=\"o\" align=middle width=32 height=32>
O.A.K. Language <a href=\"oakissues/\">Issues</a>
<dd><img src=\"graphics/text.gif\" alt=\"o\" align=middle width=32 height=32>
<a href=\"docissues/\">WebRunner project\'s Documentation Structure Planning</a>
<dd><img src=\"graphics/text.gif\" alt=\"o\" align=middle width=32 height=32>
O.A.K. and C <a href=\"codeconventions/codeconv_1.html\">Code Conventions</a>
<dd><img src=\"graphics/text.gif\" alt=\"o\" align=middle width=32 height=32>
Architecture Team <a href=\"ateam/\">meeting minutes</a>
<dd><img src=\"graphics/text.gif\" alt=\"o\" align=middle width=32 height=32>
WebRunner <a href=\"http://tachyon.eng/~msj/lo-schedule.html\">Schedule</a>
<dd><img src=\"graphics/text.gif\" alt=\"o\" align=middle width=32 height=32>
<a href=\"miscdoc/\">Assorted other Documents</a>

</dl>
<hr>
<h2>
WebRunner\'s External Home Page on Infosphere
</h2>
Visit the <a href=\"http://infosphere.com/webrunner/\"> WebRunner external home
page</a> and see the \"face\" we present to the outside world.
<hr>

<img src=\"graphics/sun.gif\" align=middle width=64 height=64>
<a href=\"http://dudette.eng/\">Sun\'s Internal Home Page</a>

<h6>Sun Proprietary/Confidential: Internal Use Only</h6>

<hr>
<a href=\"Admin/wwwstats.html\"> Latest Usage Statistics</a><p>
<address>
This document is maintained by
<a href=\"/~weisblat/\">Bob Weisblatt</a>, (weisblatt@eng.sun.com)
</address>
</body>
</html>
')

 ((bootstrap stub -> 'globals' -> 'webBrowser') \/-> 'results') -> () _At: 5 Put: (
     '<HTML>
<Head>
<Title>SunWeb - The Internal Home Page for Sun</Title>
<Meta name=keywords value=\"SunWeb, home page,SWAN internal root\">
<Meta name=description value=\"SunWeb is the term used to refer to all of the interconnected
		HTML pages around Sun\'s internal wide are network(SWAN). This page can be thought
		of as a root page for the top level of links to various Sun organizations.\">
</Head>
<Body>

<a href=/cgi-bin/imagemap/head.sunweb>
<img alt=\"[Sunweb Home Page]\" Src=\"/sunweb/images/head.homepage.gif\" ISMAP></a>
<p>
<a href=/cgi-bin/imagemap/head.ismap>
<img src=/sunweb/images/icons.bigIzmap.gif ISMAP> </a>
<pre><b><a href=/sunweb/TOC.html>Table of Contents</a> | <A HREF=\"/dropsite/DropSite.html\">Server Drop Site</A> | <a href=/sunweb-comment-form.html>Comments</a> | <a href=/sunweb-question-form.html>Questions/Concerns</a>
</b></pre>

</Body>
</HTML>
')

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> () From: ( | {
         'Category: prototypes\x7fCategory: requesters\x7fModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         setProxy = ( |
             p.
             s.
            | 
            ( userQuery askYesNo: 'Is your machine directly connected to the Internet?' )
              ifTrue: [ ^ localRequester: requester ].
            s:  userQuery askString: 'Enter the host name of your proxy server:'.
            p:  userQuery askString: 'Enter the port number of your proxy server:' 
                      DefaultAnswer: 80 printString.
            p: p asInteger.
            localRequester: proxyRequester copy proxy: ( url copy host: s)  port: p).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> () From: ( | {
         'Category: prototypes\x7fCategory: requesters\x7fModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         swanRequester = bootstrap define: bootstrap stub -> 'globals' -> 'webBrowser' -> 'swanRequester' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'hostToOpen:' From:
             bootstrap remove: 'openHost:' From:
             bootstrap remove: 'parent' From:
             bootstrap remove: 'portToOpen' From:
             bootstrap remove: 'proxy' From:
             bootstrap remove: 'urlContentsForRequest:' From:
             globals webBrowser proxyRequester copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'webBrowser' -> 'swanRequester' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals webBrowser swanRequester.

CopyDowns:
globals webBrowser proxyRequester. copy 
SlotsToOmit: hostToOpen: openHost: parent portToOpen proxy urlContentsForRequest:.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'swanRequester' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'globals' -> 'webBrowser' -> 'proxyRequester' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'swanRequester' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         proxy = ( |
            | 
            (webBrowser url copy host: 'self.Eng') port: 80).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> () From: ( | {
         'Category: tests\x7fModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         test1 = ( |
            | 
            "test1"
            'http://sunweb.ebay.sun.com/' asURL getPageForUser).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> () From: ( | {
         'Category: tests\x7fModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         test2 = ( |
            | 
            "test2"
            'http://sunlabs/' asURL getPageForUser).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> () From: ( | {
         'Category: tests\x7fModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         test3 = ( |
            | 
            "test3"
            'http://tachyon/' asURL getPageForUser).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> () From: ( | {
         'Category: tests\x7fModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         test4 = ( |
            | 
             "test4"
            'http://tachyon/People/namelist' asURL getPageForUser).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> () From: ( | {
         'Category: tests\x7fModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         test5 = ( |
            | 
             "test5" 
            'http://www.cbs.com/' asURL getPageForUser).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot\x7fVisibility: public'
        
         unescapeHTTPString: str = ( |
             r <- ''.
             sl.
            | 
            str isEmpty ifTrue: [ ^ '' ].
            sl: str asList.
            [ sl isEmpty ] whileFalse: [
              r: r & (
                case if: [ sl first = '+' ]  Then: [ sl removeFirst.  ' ' ]
                     If: [ sl first != '%' ] Then: [ sl removeFirst ]
                     Else: [
                             sl removeFirst.
                             sl isEmpty ifTrue: '%' False: [
                               '0123456789abcdef'
                                 findFirst: [|:c| c = sl first uncapitalize ]
                                 IfPresent: [|:c. :i1|
                                   sl removeFirst.
                                   sl isEmpty ifTrue: [ i1 asCharacter ] False: [
                                     '0123456789abcdef'
                                       findFirst: [|:c| c = sl first uncapitalize ]
                                       IfPresent: [|:c. :i2| 
                                         sl removeFirst.
                                         ( ( i1 * 16 ) + i2 ) asCharacter
                                     ] IfAbsent: [ i1 asCharacter ].
                                   ].
                                 ] IfAbsent: '%'.
                               ].
                 ] ).
            ].
            r flatString).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> () From: ( | {
         'Category: prototypes\x7fCategory: morphs\x7fModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         webPage = bootstrap define: bootstrap stub -> 'globals' -> 'webBrowser' -> 'webPage' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             bootstrap remove: 'prototype' From:
             globals frameMorph copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'webBrowser' -> 'webPage' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals webBrowser webPage.

CopyDowns:
globals frameMorph. copy 
SlotsToOmit: parent prototype.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'webPage' -> () From: ( | {
         'Category: web page state\x7fModuleInfo: Module: webBrowser InitialContents: InitializeToExpression: (nil)'
        
         creatorProcess.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'webPage' -> () From: ( | {
         'Category: web page state\x7fModuleInfo: Module: webBrowser InitialContents: InitializeToExpression: (\'\')'
        
         htmlSource <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'webPage' -> () From: ( | {
         'Category: web page state\x7fModuleInfo: Module: webBrowser InitialContents: InitializeToExpression: (0@0)\x7fVisibility: public'
        
         initialPosition <- 0@0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'webPage' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'webBrowser' -> 'webPage' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals webBrowser webPage parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'webPage' -> 'parent' -> () From: ( | {
         'Category: web page behavior\x7fModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         addToHotList: evt At: pt = ( |
             hotLists.
             morphs.
            | 
            morphs: world morphsAt: pt.
            hotLists: morphs asList copyFilteredBy: [|:m| m morphTypeName = 'hotlistMorph'].
            case if:   [ hotLists isEmpty] 
                 Then: [ userQuery report: 'No hot list under the cursor\n',
                                           'Please put the cursor over a hot list and try again']
                 If:   [ hotLists size > 1 ] 
                 Then: [ userQuery report: 'More than one hot list under the cursor\n',
                                           'Please put the cursor over just one hot list and try again']
                 Else: [ hotLists first addWebPage: self Event: evt ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'webPage' -> 'parent' -> () From: ( | {
         'Category: web page behavior\x7fModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         askForURL: event = ( |
             u.
            | 
            "ask for a URL and open it"
            u: userQuery askString: 'Please enter the URL you wish to open' DefaultAnswer: 
              '' = sourceURL ifTrue: 'http://self.sunlabs.com' False: [sourceURL asURL unparse].
            u asURL getPageForUser).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'webPage' -> 'parent' -> () From: ( | {
         'Category: web page behavior\x7fModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         collapse: event = ( |
             t.
            | 
            stop: event.
            removeContents.
            safelyDo: [
              addMorph: labelMorph copy label: titleString.
              event sourceHand attach: self.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'webPage' -> 'parent' -> () From: ( | {
         'Category: web page behavior\x7fModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         collapseAllAndStack: event = ( |
             cm.
             pages.
             pt.
             w.
            | 
            w: world.
            pt: position.
            pages: w morphs asList copyFilteredBy: [|:m| m morphTypeName =  morphTypeName].
            pages do: [|:p| p collapse: event ].
            pages: pages asVector sortBy: ( |
              element: e1 Precedes: e2 = ( e1 titleString < e2 titleString) | ).
            pages do: [|:p|
              w safelyDo: [ w addMorph: p. p position: pt.  w moveToFront: p ].
              pt: p baseBounds bottomLeft.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'webPage' -> 'parent' -> () From: ( | {
         'Category: web page behavior\x7fModuleInfo: Module: webBrowser InitialContents: InitializeToExpression: (nil)'
        
         defaultButtonHolder <- bootstrap stub -> 'globals' -> 'nil' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'webPage' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot\x7fVisibility: public'
        
         drawAbstractedOn: c Scale: s OffsetBy: pt Clip: r = ( |
             org.
             rect.
            | 
            org: (pt + ((globalBaseBounds origin x * s) asInteger @ (globalBaseBounds origin y * s) asInteger )) .
            rect: r intersect: 
              (((rectangle copy)
                        origin: org )
                        corner: ( org + (1@1) max: (pt + ((globalBaseBounds corner x * s) asInteger @ (globalBaseBounds corner y * s) asInteger )))).
            c fillRectangle: rect Color: color.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'webPage' -> 'parent' -> () From: ( | {
         'Category: creation\x7fComment: Search world w for a webPage for URL (or string) u.
If there, evaluate pb with that page as argument,
else evaluate ab.
Return result of whichever block.
-- Ungar, 3/16/95\x7fModuleInfo: Module: webBrowser InitialContents: FollowSlot\x7fVisibility: public'
        
         findPageForURL: u InWorld: w IfPresent: pb IfAbsent: ab = ( |
             uu.
            | 
            uu: u asURL.
            w morphsDo: [|:m| 
              (m morphTypeName = morphTypeName) && [m sourceURL = uu]
                ifTrue: [^ pb value: m].
            ].
            ab value).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'webPage' -> 'parent' -> () From: ( | {
         'Category: web page behavior\x7fModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         flushImageCache = ( |
            | webBrowser cachedWebImageMorph cache removeAll).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'webPage' -> 'parent' -> () From: ( | {
         'Category: creation\x7fComment: return a new web page for URL or string u
-- Ungar, 3/16/95\x7fModuleInfo: Module: webBrowser InitialContents: FollowSlot\x7fVisibility: public'
        
         makePageForURL: u = ( |
            | 
            webBrowser htmlParser parseAndShowFrom: u).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'webPage' -> 'parent' -> () From: ( | {
         'Category: web page behavior\x7fModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         menu = ( |
             m.
            | 
            m: ui2Menu copy.

            m addButtonTarget: nil 
              Script: 'target stop: event' Label: 'Stop'.

            m addButtonTarget: nil 
              AsynchronousScript: 'target rebuild: event'
              Label: 'Rebuild'.

            m addButtonTarget: nil 
              Script: 'target collapse: event'
              Label: 'Collapse'.

            m addButtonTarget: self
              AsynchronousScript: 'target collapseAllAndStack: event'
              Label: 'Collapse All and Stack'.

            m addDivider.

            m addButtonTarget: self
              Script: 'target flushImageCache'
              Label: 'Flush Image Cache'.

            m addButtonTarget: webBrowser
            AsynchronousScript: 'webBrowser setProxy' 
                         Label: 'Set Internet Proxy'.

            m addDivider.

            m addButtonTarget: nil 
              AsynchronousScript: 'target addToHotList: event At: button owner invocationPoint'
              Label: 'Add to Hot List'.

            m addButtonTarget: self
              Script: 'target viewSource: event'
              Label: 'View Source'.

            m addButtonTarget: self
              AsynchronousScript: 'target askForURL: event'
              Label: 'Open URL...'.

            m colorAll: m color.
            defaultButtonHolder: m initializeDefaultButtonHolder: defaultButtonHolder.
            m).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'webPage' -> 'parent' -> () From: ( | {
         'Category: web page behavior\x7fModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         middleMouseDown: evt = ( |
            | 
            (menu copy retargetButtonsTo: self) popUp: evt.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'webPage' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         morphTypeName = 'webPage'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'webPage' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'globals' -> 'frameMorph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'webPage' -> 'parent' -> () From: ( | {
         'Category: web page behavior\x7fModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         rebuild: event = ( |
            | 
            collapse: event.
            removeAllMorphs.
            (webBrowser htmlParser copy rootMorph: self) parse: htmlSource From: sourceURL).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'webPage' -> 'parent' -> () From: ( | {
         'Category: web page behavior\x7fModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         removeContents = ( |
            | safelyDo: [removeAllMorphs]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'webPage' -> 'parent' -> () From: ( | {
         'Category: web page behavior\x7fModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         stop: event = ( |
            | creatorProcess abort).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'webPage' -> 'parent' -> () From: ( | {
         'Category: web page behavior\x7fModuleInfo: Module: webBrowser InitialContents: FollowSlot'
        
         viewSource: event = ( |
            | 
            event sourceHand attach: textViewerMorph copyTitle: 'Source for ',  sourceURL unparse 
                                                          Text:  htmlSource.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'webPage' -> () From: ( | {
         'Category: filing out\x7fModuleInfo: Module: webBrowser InitialContents: FollowSlot\x7fVisibility: public'
        
         prototype = ( |
            | 
            webBrowser webPage).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'webPage' -> () From: ( | {
         'Category: web page state\x7fModuleInfo: Module: webBrowser InitialContents: InitializeToExpression: (\'\')'
        
         sourceURL <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webBrowser' -> 'webPage' -> () From: ( | {
         'Category: web page state\x7fModuleInfo: Module: webBrowser InitialContents: InitializeToExpression: (\'\')'
        
         titleString <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'morph' -> () From: ( | {
         'Category: web browsing\x7fModuleInfo: Module: webBrowser InitialContents: FollowSlot\x7fVisibility: public'
        
         addSelectOptionToForm: optionTag = ( |
            | 
            nil = owner  ifTrue: [ error: 'cannot find formSelect*Morph' ]
                          False: [ owner addSelectOptionToForm: optionTag ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'morph' -> () From: ( | {
         'Category: classification\x7fModuleInfo: Module: webBrowser InitialContents: FollowSlot\x7fVisibility: public'
        
         isFormFieldMorph = bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'string' -> () From: ( | {
         'Category: www\x7fModuleInfo: Module: webBrowser InitialContents: FollowSlot\x7fVisibility: public'
        
         asURL = ( |
            | webBrowser url copyParsing: self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2Image' -> () From: ( | {
         'Category: creation\x7fModuleInfo: Module: webBrowser InitialContents: FollowSlot\x7fVisibility: public'
        
         copyFromGIFFile: fileName = ( |
            | 
            copy readUsingImageMagick: fileName Type: 'gif').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2Image' -> () From: ( | {
         'Category: creation\x7fModuleInfo: Module: webBrowser InitialContents: FollowSlot\x7fVisibility: public'
        
         copyFromJPEGFile: fileName = ( |
            | 
            copy readUsingImageMagick: fileName Type: 'jpg').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2Image' -> () From: ( | {
         'Category: creation\x7fModuleInfo: Module: webBrowser InitialContents: FollowSlot\x7fVisibility: public'
        
         copyFromPNGFile: fileName = ( |
            | 
            copy readUsingImageMagick: fileName Type: 'png').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2Image' -> () From: ( | {
         'Category: creationSupport\x7fModuleInfo: Module: webBrowser InitialContents: FollowSlot\x7fVisibility: private'
        
         readUsingImageMagick: fileName Type: type = ( |
             cmd.
             r.
             tmpfn.
            | 
            tmpfn: (os_file temporaryFileName),'.ras'.
            cmd: 'convert ', type, ':', fileName, ' ', tmpfn.
            r: os command: cmd
                  Executing: 'convert'
                     IfFail: [|:err| error: 'Command "', cmd, '" failed: ', err].
            r = 0 ifFalse: [
              error: 'Command "', cmd, '" returned ', r printString.
            ].
            readFromSunRasterFile: tmpfn.
            os unlink: tmpfn IfFail: [].
            self).
        } | ) 



 '-- Sub parts'

 bootstrap read: 'xBitmapMaker' From: 'graphics'
 bootstrap read: 'xPixmapMaker' From: 'graphics'



 '-- Side effects'

 globals modules webBrowser postFileIn
