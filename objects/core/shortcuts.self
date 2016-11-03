 '30.9.1'
 '
Copyright 1992-2016 AUTHORS.
See the legal/LICENSE file for license information and legal/AUTHORS for authors.
'
["preFileIn" self] value


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: shortcuts InitialContents: FollowSlot'
        
         shortcuts = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'shortcuts' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'comment' From:
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'shortcuts' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules shortcuts.

CopyDowns:
globals modules init. copy 
SlotsToOmit: comment directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'shortcuts' -> () From: ( | {
         'ModuleInfo: Module: shortcuts InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'core'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'shortcuts' -> () From: ( | {
         'ModuleInfo: Module: shortcuts InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'shortcuts' -> () From: ( | {
         'ModuleInfo: Module: shortcuts InitialContents: FollowSlot'
        
         myComment <- '\'Assorted convenience methods\''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'shortcuts' -> () From: ( | {
         'ModuleInfo: Module: shortcuts InitialContents: InitializeToExpression: (\'30.9.1\')\x7fVisibility: public'
        
         revision <- '30.9.1'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'shortcuts' -> () From: ( | {
         'ModuleInfo: Module: shortcuts InitialContents: FollowSlot\x7fVisibility: private'
        
         subpartNames <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'shell' -> () From: ( | {
         'ModuleInfo: Module: shortcuts InitialContents: FollowSlot'
        
         shortcuts* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'shell' -> 'shortcuts' -> () From: ( |
             {} = 'Comment: This object (which is inherited by the shell) contains
various methods which are useful shorthands.  If you
want to add your own shorthands to the shell, put them
here.\x7fModuleInfo: Creator: shell shortcuts.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'shell' -> 'shortcuts' -> () From: ( | {
         'Category: compiling\x7fComment: A shortcut to bypass typing single quotes when reading
in files: instead of typing
    \'myStuff\' _RunScript
you can just type
    cc myStuff
Since the cc object does not understand `myStuff\', it invokes
the undefinedSelector method, which takes the selector (`myStuff\')
and sends _RunScript to it (concatenated with .self)!
  Since the return value is self (cc),
you can read in several files by cascading their names:
    cc myStuff moreStuff otherStuff
This works because each successive send is being sent to cc.
Typing
     cc rc
reads in ~/.selfrc.  (The above technique doesn\'t work for .selfrc,
because \'cc .selfrc\' does not parse as a Self expression.)\x7fModuleInfo: Module: shortcuts InitialContents: FollowSlot\x7fVisibility: public'
        
         cc = bootstrap setObjectAnnotationOf: bootstrap stub -> 'shell' -> 'shortcuts' -> 'cc' -> () From: ( |
             {} = 'ModuleInfo: Creator: shell shortcuts cc.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'shell' -> 'shortcuts' -> 'cc' -> () From: ( | {
         'ModuleInfo: Module: shortcuts InitialContents: FollowSlot'
        
         rc = ( |
            | '~/.selfrc'  _RunScript. self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'shell' -> 'shortcuts' -> 'cc' -> () From: ( | {
         'ModuleInfo: Module: shortcuts InitialContents: FollowSlot'
        
         undefinedSelector: s Type: t Delegatee: d MethodHolder: m Arguments: a = ( |
             p* = bootstrap stub -> 'lobby' -> ().
            | 
            ((reflect: modules) names includes: s)
              ifTrue: [^(s sendTo: modules) fileIn].
            (s, '.self') _RunScriptIfFail: [^'Couldn\'t read ', s, '.'].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'shell' -> 'shortcuts' -> () From: ( | {
         'Category: editing\x7fComment: Open a file editor on the file named by the string argument.
Doesn\'t work in the 4.0 user interface yet.\x7fModuleInfo: Module: shortcuts InitialContents: FollowSlot\x7fVisibility: public'
        
         editFile: name = ( |
            | fileEditor openOnFile: name).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'shell' -> 'shortcuts' -> () From: ( | {
         'Category: debugging\x7fComment: A technique similar to `cc\' (q.v.).  To lookup a slot named `foo\'
in the current activation of a process being debugged (attached
to the debugger using `attach:\'), type
     lookup foo
Again, this simply allows you to avoid typing the single quotes
around foo.
This shortcut is only meaningful when there is a process attached
to the debugger.\x7fModuleInfo: Module: shortcuts InitialContents: FollowSlot\x7fVisibility: public'
        
         lookup = bootstrap setObjectAnnotationOf: bootstrap stub -> 'shell' -> 'shortcuts' -> 'lookup' -> () From: ( |
             {} = 'ModuleInfo: Creator: shell shortcuts lookup.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'shell' -> 'shortcuts' -> 'lookup' -> () From: ( | {
         'ModuleInfo: Module: shortcuts InitialContents: FollowSlot'
        
         undefinedSelector: sel Type: t Delegatee: d MethodHolder: m Arguments: a = ( | {
                 'ModuleInfo: Module: shortcuts InitialContents: FollowSlot'
                
                 rec = bootstrap stub -> 'shell' -> ().
                } 
            | rec lookup: sel).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'shell' -> 'shortcuts' -> () From: ( | {
         'Category: shutdown\x7fComment: Quit the system.  Asks (via a shell-level prompt) whether the user
wants to write a snapshot first.  Valid responses:
  y or Y  - writes snapshot, quits
  n or N  - quits immediately
  return  - quit is cancelled, system continues to run.\x7fModuleInfo: Module: shortcuts InitialContents: FollowSlot\x7fVisibility: public'
        
         quit = ( |
             line.
            | 
            ('Save to ', memory snapshotOptions fileName, ' before quitting? ') printLine.
             '  y => save, then quit' printLine.
             '  n => quit without saving' printLine.
             '  RET => cancel' printLine.
             'Response: ' print.
            line:  stdin readLine uncapitalize.
            line = '' ifTrue: [ 'quit cancelled' printLine.  ^ self ].
            line = 'y' ifTrue: [^saveThenQuit].
            line = 'n' ifTrue: [^quitNoSave].
            'Invalid input -- quit cancelled' printLine).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'shell' -> 'shortcuts' -> () From: ( | {
         'Category: shutdown\x7fComment: Exit the system.  Nothing is saved.\x7fModuleInfo: Module: shortcuts InitialContents: FollowSlot\x7fVisibility: public'
        
         quitNoSave = ( |
            | programmingLog close. _Quit).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'shell' -> 'shortcuts' -> () From: ( | {
         'Category: snapshots\x7fComment: Write a snapshot to the default name.\x7fModuleInfo: Module: shortcuts InitialContents: FollowSlot\x7fVisibility: public'
        
         save = ( |
            | 
            "memory quickCleanup." "OS X is so fast..."
            userQuery showEverybody: 'Writing snapshot to ', memory snapshotOptions fileName
                              While: [ times delay: 500. "graphics update time"
                                       memory writeSnapshot  ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'shell' -> 'shortcuts' -> () From: ( | {
         'Category: snapshots\x7fModuleInfo: Module: shortcuts InitialContents: FollowSlot\x7fVisibility: public'
        
         saveAs = ( |
            | 
            memory snapshotOptions:
              memory snapshotOptions copy askUser.
            save).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'shell' -> 'shortcuts' -> () From: ( | {
         'Category: snapshots\x7fModuleInfo: Module: shortcuts InitialContents: FollowSlot\x7fVisibility: public'
        
         saveAs: fileName = ( |
            | 
            memory snapshotOptions:  memory snapshotOptions copy.
            memory snapshotOptions fileName: fileName.
            save).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'shell' -> 'shortcuts' -> () From: ( | {
         'Category: shutdown\x7fComment: Save the world in the default snapshot file, then quit the system.\x7fModuleInfo: Module: shortcuts InitialContents: FollowSlot\x7fVisibility: public'
        
         saveThenQuit = ( |
            | 
            memory snapshotOptions:
              memory snapshotOptions copy askUser.
            memory thoroughCleanup: false.
            userQuery showEverybody: 'Writing snapshot to ', memory snapshotOptions fileName
            While: [
             memory
              writeSnapshotIfBackupFails: [|:e| 
                userQuery report: 
                  'Could not backup old snapshot: "', e, '".\n',
                  'Quit cancelled.'.
                ^self]
              IfSnapshotFails: [|:e|
                userQuery report: 
                  'Could not save snapshot: "', e, '".\n',
                  'Quit cancelled.'.
                ^self].
            ].
            ^quitNoSave).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'shell' -> 'shortcuts' -> () From: ( | {
         'Category: spying\x7fModuleInfo: Module: shortcuts InitialContents: FollowSlot\x7fVisibility: public'
        
         spyOff = ( |
            | _Spy: false).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'shell' -> 'shortcuts' -> () From: ( | {
         'Category: spying\x7fComment: Turn on the spy (system monitor).
The spy shows information about the internals of the system.
The return value is the previous value of _Spy.\x7fModuleInfo: Module: shortcuts InitialContents: FollowSlot\x7fVisibility: public'
        
         spyOn = ( |
            | 
            _Spy: false. "this to work around a suspected VM bug"
            _Spy: true).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'shell' -> 'shortcuts' -> () From: ( | {
         'Category: VM debugging\x7fModuleInfo: Module: shortcuts InitialContents: FollowSlot\x7fVisibility: public'
        
         useNIC = ( |
            | 
            _Compilers: (vector copyAddFirst: 'nic') Limits: vector.
            _Flush).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'shell' -> 'shortcuts' -> () From: ( | {
         'Category: VM debugging\x7fModuleInfo: Module: shortcuts InitialContents: FollowSlot\x7fVisibility: public'
        
         useNICSIC = ( |
            | 
            _Compilers: ('nic' & 'sic') asVector Limits: vector copyAddFirst: 10000.
            _Flush).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'shell' -> 'shortcuts' -> () From: ( | {
         'Category: VM debugging\x7fModuleInfo: Module: shortcuts InitialContents: FollowSlot\x7fVisibility: public'
        
         useSIC = ( |
            | 
            _Compilers: (vector copyAddFirst: 'sic') Limits: vector.
            _Flush).
        } | ) 



 '-- Side effects'

 globals modules shortcuts postFileIn
