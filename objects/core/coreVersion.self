 '0.0.1'
 '
Copyright 2016 AUTHORS.
See the legal/LICENSE file for license information and legal/AUTHORS for authors.
'
["preFileIn" self] value


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'about' -> () From: ( | {
         'Category: versions\x7fModuleInfo: Module: coreVersion InitialContents: InitializeToExpression: (about systemVersion copyOn: \'2023.1/3\')'
        
         core <- about systemVersion copyOn: '2023.1/3'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'about' -> () From: ( | {
         'Category: versions\x7fComment: Asks git for the revision of the objects directory as
it is now: the nearest tag and commit, with -dirty added
if tracked files under the objects directory have
uncommitted changes. Answers \'unknown\' when git is
missing or the objects are not in a git checkout.\x7fModuleInfo: Module: coreVersion InitialContents: FollowSlot'
        
         currentObjectsRevision = ( |
             cmd.
             r.
            | 
            cmd: '( cd "', bootstrap selfObjectsWorkingDir, '" 2>/dev/null && ',
                 'r=$(git describe --always --tags 2>/dev/null) && ',
                 '{ git diff --quiet HEAD -- . 2>/dev/null || r="$r-dirty"; ',
                 'echo "$r"; } || echo unknown )'.
            r: os withTempFileDo: [|:tmpName|
              os command: cmd, ' > ', tmpName IfFail: [^ 'unknown'].
              tmpName asFileContents].
            r isEmpty ifTrue: 'unknown' False: [r shrinkwrapped]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'about' -> () From: ( | {
         'Category: versions\x7fComment: The git revision of the objects directory when the core
was filed in, as answered by currentObjectsRevision.
The objects\' counterpart to vmBuildID.\x7fModuleInfo: Module: coreVersion InitialContents: InitializeToExpression: (\'unknown\')'
        
         objectsRevision <- 'unknown'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: coreVersion InitialContents: FollowSlot'
        
         coreVersion = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'coreVersion' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'copyright' From:
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'coreVersion' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules coreVersion.

CopyDowns:
globals modules init. copy 
SlotsToOmit: copyright directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'coreVersion' -> () From: ( | {
         'Category: state\x7fModuleInfo: Module: coreVersion InitialContents: InitializeToExpression: (\'
Copyright 2016 AUTHORS.
See the legal/LICENSE file for license information and legal/AUTHORS for authors.
\')\x7fVisibility: public'
        
         copyright <- '
Copyright 2016 AUTHORS.
See the legal/LICENSE file for license information and legal/AUTHORS for authors.
'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'coreVersion' -> () From: ( | {
         'ModuleInfo: Module: coreVersion InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'core'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'coreVersion' -> () From: ( | {
         'ModuleInfo: Module: coreVersion InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'coreVersion' -> () From: ( | {
         'ModuleInfo: Module: coreVersion InitialContents: FollowSlot'
        
         myComment <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'coreVersion' -> () From: ( | {
         'ModuleInfo: Module: coreVersion InitialContents: FollowSlot'
        
         postFileIn = ( |
            | 
            resend.postFileIn.
            about core: about systemVersion readFrom: 'core.version'.
            about objectsRevision: about currentObjectsRevision.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'coreVersion' -> () From: ( | {
         'ModuleInfo: Module: coreVersion InitialContents: InitializeToExpression: (\'0.0.1\')\x7fVisibility: public'
        
         revision <- '0.0.1'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'coreVersion' -> () From: ( | {
         'ModuleInfo: Module: coreVersion InitialContents: FollowSlot\x7fVisibility: private'
        
         subpartNames <- ''.
        } | ) 



 '-- Side effects'

 globals modules coreVersion postFileIn
