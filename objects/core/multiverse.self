 ''
 '
Copyright 1992-2016 AUTHORS.
See the legal/LICENSE file for license information and legal/AUTHORS for authors.
'
[ 
"prefileIn" self] value


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'init' -> 'parent' -> () From: ( | {
         'Category: packages\x7fModuleInfo: Module: multiverse InitialContents: FollowSlot'
        
         package = ( |
            | 
            packageIfAbsent: [ error: 'Package "', tree, '" not found']).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'init' -> 'parent' -> () From: ( | {
         'Category: packages\x7fModuleInfo: Module: multiverse InitialContents: FollowSlot'
        
         packageIfAbsent: blk = ( |
            | multiverse thisUniverse packageNamed: tree IfAbsent: blk).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: multiverse InitialContents: FollowSlot'
        
         multiverse = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'multiverse' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'multiverse' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules multiverse.

CopyDowns:
globals modules init. copy 
SlotsToOmit: directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'multiverse' -> () From: ( | {
         'ModuleInfo: Module: multiverse InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'core'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'multiverse' -> () From: ( | {
         'ModuleInfo: Module: multiverse InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'multiverse' -> () From: ( | {
         'ModuleInfo: Module: multiverse InitialContents: FollowSlot'
        
         myComment <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'multiverse' -> () From: ( | {
         'ModuleInfo: Module: multiverse InitialContents: FollowSlot'
        
         postFileIn = ( |
            | resend.postFileIn).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'multiverse' -> () From: ( | {
         'ModuleInfo: Module: multiverse InitialContents: InitializeToExpression: (\'30.21.0\')\x7fVisibility: public'
        
         revision <- '30.21.0'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'multiverse' -> () From: ( | {
         'ModuleInfo: Module: multiverse InitialContents: FollowSlot\x7fVisibility: private'
        
         subpartNames <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: system\x7fCategory: modules\x7fModuleInfo: Module: multiverse InitialContents: FollowSlot'
        
         multiverse = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'multiverse' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals multiverse.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'multiverse' -> () From: ( | {
         'Category: prototypes\x7fModuleInfo: Module: multiverse InitialContents: FollowSlot'
        
         localUniverse = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'multiverse' -> 'localUniverse' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals multiverse localUniverse.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'multiverse' -> () From: ( | {
         'Category: prototypes\x7fModuleInfo: Module: multiverse InitialContents: FollowSlot'
        
         overlayUniverse = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'multiverse' -> 'overlayUniverse' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals multiverse overlayUniverse.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'multiverse' -> () From: ( | {
         'Category: prototypes\x7fModuleInfo: Module: multiverse InitialContents: FollowSlot'
        
         package = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'multiverse' -> 'package' -> () From: ( |
             {} = 'Comment: This is a managed object - 
please access only through a universe.\x7fModuleInfo: Creator: globals multiverse package.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'multiverse' -> 'package' -> () From: ( | {
         'Category: details\x7fModuleInfo: Module: multiverse InitialContents: InitializeToExpression: (0)'
        
         availableVersion <- 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'multiverse' -> 'package' -> () From: ( | {
         'Category: details\x7fModuleInfo: Module: multiverse InitialContents: InitializeToExpression: (set copyRemoveAll)'
        
         categories <- set copyRemoveAll.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'multiverse' -> 'package' -> () From: ( | {
         'Category: details\x7fModuleInfo: Module: multiverse InitialContents: InitializeToExpression: (\'\')'
        
         description <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'multiverse' -> 'package' -> () From: ( | {
         'Category: details\x7fModuleInfo: Module: multiverse InitialContents: InitializeToExpression: (\'\')'
        
         gitCommit <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'multiverse' -> 'package' -> () From: ( | {
         'Category: details\x7fModuleInfo: Module: multiverse InitialContents: InitializeToExpression: (\'\')'
        
         gitObjects <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'multiverse' -> 'package' -> () From: ( | {
         'Category: details\x7fModuleInfo: Module: multiverse InitialContents: InitializeToExpression: (\'\')'
        
         gitRootModule <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'multiverse' -> 'package' -> () From: ( | {
         'Category: details\x7fModuleInfo: Module: multiverse InitialContents: InitializeToExpression: (\'\')'
        
         gitURL <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'multiverse' -> 'package' -> () From: ( | {
         'Category: state\x7fModuleInfo: Module: multiverse InitialContents: InitializeToExpression: (time origin)'
        
         installedOn <- time origin.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'multiverse' -> 'package' -> () From: ( | {
         'Category: state\x7fModuleInfo: Module: multiverse InitialContents: InitializeToExpression: (0)'
        
         installedVersion <- 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'multiverse' -> 'package' -> () From: ( | {
         'Category: state\x7fModuleInfo: Module: multiverse InitialContents: InitializeToExpression: (false)'
        
         isInstalled <- bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'multiverse' -> 'package' -> () From: ( | {
         'Category: details\x7fModuleInfo: Module: multiverse InitialContents: InitializeToExpression: (set copyRemoveAll)'
        
         licences <- set copyRemoveAll.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'multiverse' -> 'package' -> () From: ( | {
         'Category: details\x7fModuleInfo: Module: multiverse InitialContents: InitializeToExpression: (\'Name <name@example.com>\')'
        
         maintainer <- 'Name <name@example.com>'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'multiverse' -> () From: ( | {
         'Category: prototypes\x7fModuleInfo: Module: multiverse InitialContents: FollowSlot'
        
         universe = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'multiverse' -> 'universe' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals multiverse universe.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'multiverse' -> 'package' -> () From: ( | {
         'Category: state\x7fModuleInfo: Module: multiverse InitialContents: InitializeToExpression: (multiverse universe)'
        
         myUniverse <- bootstrap stub -> 'globals' -> 'multiverse' -> 'universe' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'multiverse' -> 'package' -> () From: ( | {
         'Category: details\x7fModuleInfo: Module: multiverse InitialContents: InitializeToExpression: (\'\')'
        
         name <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'multiverse' -> 'package' -> () From: ( | {
         'ModuleInfo: Module: multiverse InitialContents: FollowSlot'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'multiverse' -> 'package' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals multiverse package parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'multiverse' -> 'package' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: multiverse InitialContents: FollowSlot'
        
         copyForUniverse: u = ( |
            | copy myUniverse: u).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'multiverse' -> 'package' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: multiverse InitialContents: FollowSlot'
        
         gitClone = ( |
            | 
            os command: 'mkdir -p ', gitDirectory.
            os command: 'cd ', gitDirectory, ' && git clone ', gitURL, ' . && git checkout ', gitCommit.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'multiverse' -> 'package' -> 'parent' -> () From: ( | {
         'Category: file descriptors\x7fModuleInfo: Module: multiverse InitialContents: FollowSlot'
        
         gitDirectory = ( |
            | multiverse root, '/', myUniverse root, '/', name).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'multiverse' -> 'package' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: multiverse InitialContents: FollowSlot'
        
         gitPull = ( |
            | 
            os command: 'cd ', gitDirectory, ' && git pull && git checkout ', gitCommit.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'multiverse' -> 'package' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: multiverse InitialContents: FollowSlot'
        
         isUpToDate = ( |
            | 
            isInstalled && (installedVersion = availableVersion)).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'multiverse' -> 'package' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: multiverse InitialContents: FollowSlot'
        
         localCacheExists = ( |
            | 
            '' = (os access: objectsDirectory Mode: os accessModes f_ok)).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'multiverse' -> 'package' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: multiverse InitialContents: FollowSlot'
        
         markModulesWithPackage = ( |
            | 
            (gitRootModule sendTo: modules) postorderDo: [|:m| m tree: name]. self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'multiverse' -> 'package' -> 'parent' -> () From: ( | {
         'Category: file descriptors\x7fModuleInfo: Module: multiverse InitialContents: FollowSlot'
        
         objectsDirectory = ( |
            | multiverse root, '/', myUniverse root, '/', name, '/', gitObjects).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'multiverse' -> 'package' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: multiverse InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'clonable' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'multiverse' -> 'package' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: multiverse InitialContents: FollowSlot'
        
         readModules = ( |
            | 
            modules init registerTree: name At: objectsDirectory. 
            bootstrap read: gitRootModule InTree: name. 
            markModulesWithPackage.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'multiverse' -> 'package' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: multiverse InitialContents: FollowSlot'
        
         updateDetailsFromConfDict: d = ( |
            | 
            name: d at: 'name'.
            shortDescription: d at: 'shortDescription'.
            description: d at: 'description'.

            availableVersion: (d at: 'version') asInteger.
            versionDescription: d at: 'versionDescription'.

            categories: (d at: 'categories') asWords.

            requires: (d at: 'requires' IfAbsent: '') asWords.
            provides: (d at: 'provides' IfAbsent: '') asWords.

            gitURL: d at: 'gitURL'.
            gitCommit: d at: 'gitCommit'.
            gitObjects: d at: 'gitObjects'.
            gitRootModule: d at: 'gitRootModule'.

            licences: (d at: 'licences') asWords.
            maintainer: d at: 'maintainer'.
            www: d at: 'www'.

            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'multiverse' -> 'package' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: multiverse InitialContents: FollowSlot'
        
         updateLocalCache = ( |
            | localCacheExists ifTrue: [gitPull] False: [gitClone]. self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'multiverse' -> 'package' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: multiverse InitialContents: FollowSlot'
        
         upgrade = ( |
            | 
            isUpToDate ifFalse: [
              updateLocalCache. 
              readModules. 
              installedVersion: availableVersion.
              isInstalled: true].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'multiverse' -> 'package' -> () From: ( | {
         'Category: details\x7fModuleInfo: Module: multiverse InitialContents: InitializeToExpression: (set copyRemoveAll)'
        
         provides <- set copyRemoveAll.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'multiverse' -> 'package' -> () From: ( | {
         'Category: details\x7fModuleInfo: Module: multiverse InitialContents: InitializeToExpression: (set copyRemoveAll)'
        
         requires <- set copyRemoveAll.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'multiverse' -> 'package' -> () From: ( | {
         'Category: details\x7fModuleInfo: Module: multiverse InitialContents: InitializeToExpression: (\'\')'
        
         shortDescription <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'multiverse' -> 'package' -> () From: ( | {
         'Category: state\x7fModuleInfo: Module: multiverse InitialContents: InitializeToExpression: (nil)'
        
         tree.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'multiverse' -> 'package' -> () From: ( | {
         'Category: details\x7fModuleInfo: Module: multiverse InitialContents: InitializeToExpression: (\'\')'
        
         versionDescription <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'multiverse' -> 'package' -> () From: ( | {
         'Category: details\x7fModuleInfo: Module: multiverse InitialContents: InitializeToExpression: (\'https://example.com\')'
        
         www <- 'https://example.com'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'multiverse' -> () From: ( | {
         'ModuleInfo: Module: multiverse InitialContents: InitializeToExpression: (\'/self/multiverse\')'
        
         root <- '/self/multiverse'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'multiverse' -> () From: ( | {
         'ModuleInfo: Module: multiverse InitialContents: FollowSlot'
        
         tests = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'multiverse' -> 'tests' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals multiverse tests.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'multiverse' -> () From: ( | {
         'ModuleInfo: Module: multiverse InitialContents: InitializeToExpression: (multiverse universe)'
        
         thisUniverse <- bootstrap stub -> 'globals' -> 'multiverse' -> 'universe' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'multiverse' -> 'universe' -> () From: ( | {
         'Category: loaded settings\x7fModuleInfo: Module: multiverse InitialContents: InitializeToExpression: (\'\')'
        
         description <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'multiverse' -> 'universe' -> () From: ( | {
         'ModuleInfo: Module: multiverse InitialContents: InitializeToExpression: (\'\')'
        
         gitURL <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'multiverse' -> 'universe' -> () From: ( | {
         'Category: state\x7fModuleInfo: Module: multiverse InitialContents: InitializeToExpression: (\'\')'
        
         installedVersion <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'multiverse' -> 'universe' -> () From: ( | {
         'Category: loaded settings\x7fModuleInfo: Module: multiverse InitialContents: InitializeToExpression: (\'\')'
        
         name <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'multiverse' -> 'universe' -> () From: ( | {
         'Category: state\x7fModuleInfo: Module: multiverse InitialContents: InitializeToExpression: (set copyRemoveAll)'
        
         packages <- set copyRemoveAll.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'multiverse' -> 'universe' -> () From: ( | {
         'ModuleInfo: Module: multiverse InitialContents: FollowSlot'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'multiverse' -> 'universe' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals multiverse universe parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'multiverse' -> 'universe' -> 'parent' -> () From: ( | {
         'Category: support\x7fModuleInfo: Module: multiverse InitialContents: FollowSlot'
        
         gitClone = ( |
            | 
            os command: 'mkdir -p ', multiverse root.
            os command: 'cd ', multiverse root, ' && git clone ', gitURL.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'multiverse' -> 'universe' -> 'parent' -> () From: ( | {
         'Category: support\x7fModuleInfo: Module: multiverse InitialContents: FollowSlot'
        
         gitCommit = ( |
            | 
            (os outputOfCommand: 'cd ', multiverse root, '/', root, ' && git rev-parse HEAD' Delay: 100 IfFail: raiseError) shrinkwrapped).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'multiverse' -> 'universe' -> 'parent' -> () From: ( | {
         'Category: support\x7fModuleInfo: Module: multiverse InitialContents: FollowSlot'
        
         gitPull = ( |
            | 
            os command: 'cd ', multiverse root, '/', root, ' && git pull'.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'multiverse' -> 'universe' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: multiverse InitialContents: FollowSlot'
        
         install: p = ( |
            | notYetImplemented).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'multiverse' -> 'universe' -> 'parent' -> () From: ( | {
         'Category: support\x7fModuleInfo: Module: multiverse InitialContents: FollowSlot'
        
         localCacheExists = ( |
            | 
            '' = (os access: multiverse root, '/', root Mode: os accessModes f_ok)).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'multiverse' -> 'universe' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: multiverse InitialContents: FollowSlot'
        
         packageNamed: n IfAbsent: blk = ( |
            | 
            packages findFirst: [|:p| p name = n] IfPresent: [|:p| p] IfAbsent: blk value).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'multiverse' -> 'universe' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: multiverse InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'clonable' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'multiverse' -> 'universe' -> 'parent' -> () From: ( | {
         'Category: support\x7fModuleInfo: Module: multiverse InitialContents: FollowSlot'
        
         readCacheIndex = ( |
            | 
            (multiverse root, '/', root, '/index.conf') asFileContents).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'multiverse' -> 'universe' -> 'parent' -> () From: ( | {
         'Category: support\x7fModuleInfo: Module: multiverse InitialContents: FollowSlot'
        
         readCachePackageNames = ( |
             x.
            | 
            x: os outputOfCommand: 'ls ', multiverse root, '/', root Delay: 100 IfFail: raiseError.
            x: x splitOn: '\n'.
            x: x filterBy: [|:e| (e size > 5) && ('index.conf' != e) ].
            x: x filterBy: [|:e| (e slice: -5 @ infinity) = '.conf'].
            x: x mapBy: [|:e| e slice: 0 @ -5 ].
            x asSet).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'multiverse' -> 'universe' -> 'parent' -> () From: ( | {
         'Category: support\x7fModuleInfo: Module: multiverse InitialContents: FollowSlot'
        
         readConf: s = ( |
             d.
            | 
            d: dictionary copyRemoveAll.
            (s splitOn: '\n') do: [|:l| readConfLine: l Into: d].
            d).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'multiverse' -> 'universe' -> 'parent' -> () From: ( | {
         'Category: support\x7fModuleInfo: Module: multiverse InitialContents: FollowSlot'
        
         readConfLine: l Into: d = ( |
             p.
             sl.
            | 
            sl: l shrinkwrapped.
            sl = '' ifTrue: [^ self].
            sl first = '#' ifTrue: [^ self].
            p: sl breakOnFirstSubstring: ' '.
            d at: (p at: 0) shrinkwrapped Put: (p at: 1) shrinkwrapped.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'multiverse' -> 'universe' -> 'parent' -> () From: ( | {
         'Category: support\x7fModuleInfo: Module: multiverse InitialContents: FollowSlot'
        
         updateDescription = ( |
            | updateLocalCache. updateUniverseDescription. updatePackageDescriptions. self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'multiverse' -> 'universe' -> 'parent' -> () From: ( | {
         'Category: support\x7fModuleInfo: Module: multiverse InitialContents: FollowSlot'
        
         updateInstalledVersion = ( |
            | installedVersion: gitCommit. self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'multiverse' -> 'universe' -> 'parent' -> () From: ( | {
         'Category: support\x7fModuleInfo: Module: multiverse InitialContents: FollowSlot'
        
         updateLocalCache = ( |
            | localCacheExists ifTrue: [gitPull] False: [gitClone]. self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'multiverse' -> 'universe' -> 'parent' -> () From: ( | {
         'Category: support\x7fModuleInfo: Module: multiverse InitialContents: FollowSlot'
        
         updatePackageDescriptions = ( |
            | 
            readCachePackageNames do: [|:pn. pd|
               pd: readConf: (multiverse root, '/', root, '/', pn, '.conf') asFileContents.
               packages findFirst: [|:e| e name = pn]
                        IfPresent: [|:e| e updateDetailsFromConfDict: pd]
                         IfAbsent: [|p | p: multiverse package copyForUniverse: self. 
                                         p updateDetailsFromConfDict: pd.
                                         packages add: p]].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'multiverse' -> 'universe' -> 'parent' -> () From: ( | {
         'Category: support\x7fModuleInfo: Module: multiverse InitialContents: FollowSlot'
        
         updateUniverseDescription = ( |
             d.
            | 
            d: readConf: readCacheIndex.
            name: d at: 'name'.
            description: d at: 'description'.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'multiverse' -> 'universe' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: multiverse InitialContents: FollowSlot'
        
         upgrade = ( |
            | 
            upgradeIsAvailable ifTrue: [
              updateDescription. 
              packages do: [|:p| p upgrade]. 
              updateInstalledVersion].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'multiverse' -> 'universe' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: multiverse InitialContents: FollowSlot'
        
         upgradeIsAvailable = ( |
            | updateDescription. installedVersion != gitCommit).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'multiverse' -> 'universe' -> () From: ( | {
         'Category: loaded settings\x7fModuleInfo: Module: multiverse InitialContents: InitializeToExpression: (\'\')'
        
         root <- ''.
        } | ) 



 '-- Side effects'

 globals modules multiverse postFileIn
