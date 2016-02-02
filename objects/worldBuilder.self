 '
SELF WORLD BUILDER
Copyright 1992-2016 AUTHORS.
See the LICENSE file for license information.

Version: 0.3.0

This is not a module and not managed by Transporter.
'
[| var = 'SELF_WORKING_DIR'. dir. initFile. i. graphicsLoadedFlag <- false |

  "
    Self working dir from command line.
    For some reason this must go first otherwise very strange errors ensue.
    These definitions will be overriden later.
  "
  true  _AddSlots: (| parent* = ()  |).
  true  parent _AddSlots: (| ifTrue: a  = ( a value ) |).
  false  _AddSlots: (| parent* = () |).
  false parent _AddSlots: (| ifTrue: a  = ( self    ) |).

  "
    Self Working Dir from Environment Variable.
    This is legacy, please use the -b flag instead.
    Note that the SELF_WORKING_DIR environment variable points to the 
    top of a tree with an objects subdirectory, while the -b flag
    points to the object subdirectory itself
  "
  dir:  var _getenvenvironmentAtIfFail: [|:e. :n| nil].
  dir:  dir _ByteVectorConcatenate: '/objects'        Prototype: byteVector IfFail: [|:e. :n| '.'].
  
  "
    -b must be within the first four flags, eg
    Self -f ../mydir/worldbuilder.self -b ../mydir
  "
  ((_CommandLine _At: 7 IfFail: [|:e. :m| '' ]) _Eq: '-b') ifTrue: [ dir: _CommandLine _At: 8 IfFail: [|:e. :m| dir ]].
  ((_CommandLine _At: 6 IfFail: [|:e. :m| '' ]) _Eq: '-b') ifTrue: [ dir: _CommandLine _At: 7 IfFail: [|:e. :m| dir ]].
  ((_CommandLine _At: 5 IfFail: [|:e. :m| '' ]) _Eq: '-b') ifTrue: [ dir: _CommandLine _At: 6 IfFail: [|:e. :m| dir ]].
  ((_CommandLine _At: 4 IfFail: [|:e. :m| '' ]) _Eq: '-b') ifTrue: [ dir: _CommandLine _At: 5 IfFail: [|:e. :m| dir ]].
  ((_CommandLine _At: 3 IfFail: [|:e. :m| '' ]) _Eq: '-b') ifTrue: [ dir: _CommandLine _At: 4 IfFail: [|:e. :m| dir ]].
  ((_CommandLine _At: 2 IfFail: [|:e. :m| '' ]) _Eq: '-b') ifTrue: [ dir: _CommandLine _At: 3 IfFail: [|:e. :m| dir ]].
  ((_CommandLine _At: 1 IfFail: [|:e. :m| '' ]) _Eq: '-b') ifTrue: [ dir: _CommandLine _At: 2 IfFail: [|:e. :m| dir ]].
  
  (('\nBuilding from base: ' _ByteVectorConcatenate: dir Prototype: byteVector) 
     _ByteVectorConcatenate: '\n' Prototype: byteVector) _StringPrint.

  initFile:  dir _ByteVectorConcatenate: '/core/init.self' Prototype: byteVector.  

  (('         init file: ' _ByteVectorConcatenate: initFile Prototype: byteVector) 
     _ByteVectorConcatenate: '\n' Prototype: byteVector) _StringPrint.

  initFile _RunScript.
  
  "
    Previously bootstrap ignored the values set before and just looked for itself
    in the SELF_WORKING_DIR environment value. However now we need to tell it
    where the base directory is.
  "
  bootstrap selfObjectsWorkingDir: dir.
  
  "
    Now start bootstrapping all proper like.
  "
  bootstrap read: 'allCore' From: 'core'.
  bootstrap read: 'primitiveMaker' From: 'glue'.
  bootstrap read: 'crypto' From: 'applications'.
  bootstrap read: 'allTests' From: 'tests'.
  bootstrap read: 'programmingExamples' From: 'misc'.

  "
    Load optional components after asking user.
    At this point we should have a core working system, 
    albeit without a GUI.
  " 

  'Load UI2 (Morphic)? (y/N)\n> ' print.
  i: stdin readLine.
  i = 'y' 
     ifTrue: [ bootstrap read: 'allGraphics' From: 'graphics'.
               graphicsLoadedFlag: true.
               bootstrap read: 'allUI2' From: 'ui2'.
               bootstrap read: 'allOutliner' From: 'ui2/outliner']
      False: [ ('You chose: ', i, '.') printLine ].

  'Load UI1 (X11 only)? (y/N)\n> ' print.
  i: stdin readLine.
  i = 'y' 
      ifTrue: [  graphicsLoadedFlag ifFalse: [
                     bootstrap read: 'allGraphics' From: 'graphics'.
                     graphicsLoadedFlag: true].
                 bootstrap read: 'allUI' From: 'ui1']
      False: [ ('You chose: ', i, '.') printLine ].

  _Verify.
  "throw away code strings for the little dinky doIts"
  memory quickCleanup.
  transporter moduleDictionary refill.
  "start the scheduler"
  scheduler start.
  _Verify

] value
