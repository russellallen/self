 '$Revision: 30.10 $'
 '
Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: applications\x7fModuleInfo: Module: diff InitialContents: FollowSlot'
        
         comparator = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'comparator' -> () From: ( |
             {} = 'Comment: A comparator can compare two indexable collections to find
their longest common subsequence [LCS] (this is the same as what Unix \"diff\"
does).

To compare two arbitrary collections, use the following expression:
    comparator compare: firstCollection With: secondCollection
This will return a new comparator.  To find out which elements of
firstCollection are in the LCS, send the message matchVector to the
comparator.  This will return a vector the same size as firstCollection,
which will contain the indices of corresponding elements of secondCollection.
To get the inverse mapping (from secondColelction to firstCollection),
send the message inverseMatchVector.
To get a sequence of indices of non-matching elements of firstCollection
(secondCollection) send noMatches (inverseNoMatches).
  
The following expression performs the same function as Unix diff,
writing results to stdout:
    (comparator
      compareFileNamed: fileName1
         WithFileNamed: fileName2) printIt.
This is an extractable application: see the `diffApplication\' object
for details.
      
If you have UI1 loaded, the following expression will provide a visual
comparison of the contents of the named files (like diff):
    (comparator
      compareFileNamed: fileName1
         WithFileNamed: fileName2) openView
                 
See the comment in modules diff for bibliographic information.\x7fModuleInfo: Creator: globals comparator.
\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'comparator' -> () From: ( | {
         'Category: computing differences\x7fModuleInfo: Module: diff InitialContents: FollowSlot\x7fVisibility: private'
        
         buildEquivalenceClasses = ( | {
                 'ModuleInfo: Module: diff InitialContents: FollowSlot'
                
                 coll2map.
                } 
            | 

            "Map each element of coll2 to the sequence of indexes it occupies."
            coll2map:  dictionary copy desiredMinCapacity:  (end2 - start2 max: 1) min: 256.
            start2 to: end2 Do: [
                | :index. |
                coll2map
                           if:  (coll2 at: index)
                  IsPresentDo:  [| :seq |      seq add: index]
                  IfAbsentPut:  [ sequence copyAddLast: index]
                        AndDo:  []
            ].
            coll2map).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'comparator' -> () From: ( | {
         'Category: computing differences\x7fModuleInfo: Module: diff InitialContents: FollowSlot\x7fVisibility: private'
        
         buildLinks: links Seq: thresh Map: coll2map = ( |
            | 
            start1 to: end1 Do: [ | :i. |
                coll2map
                           if:  (coll1 at: i)
                  IsPresentDo:  [| :res |
                                 res reverseDo: [| :j. k. |
                                   k:  thresh replaceNextLargerWith: j.
                                   k ifNotNil: [
                                     | lnk.  |
                                     lnk:  prlink copy.
                                     lnk next:
                                       (k = 0
                                         ifTrue: [nil]
                                          False: [links at: k pred]).
                                     lnk first: i.
                                     lnk last: j.
                                     links at: k Put: lnk
                                   ]
                                 ]
                                ]
                   IfAbsentDo: []
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'comparator' -> () From: ( | {
         'Category: computing differences\x7fModuleInfo: Module: diff InitialContents: FollowSlot\x7fVisibility: private'
        
         coll1.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'comparator' -> () From: ( | {
         'Category: computing differences\x7fModuleInfo: Module: diff InitialContents: FollowSlot\x7fVisibility: private'
        
         coll2.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'comparator' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: diff InitialContents: FollowSlot\x7fVisibility: public'
        
         collection1 = ( |
            | coll1).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'comparator' -> () From: ( | {
         'Category: initialization\x7fModuleInfo: Module: diff InitialContents: FollowSlot\x7fVisibility: public'
        
         collection1: c = ( |
            | coll1: c.  matches: nil).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'comparator' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: diff InitialContents: FollowSlot\x7fVisibility: public'
        
         collection2 = ( |
            | coll2).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'comparator' -> () From: ( | {
         'Category: initialization\x7fModuleInfo: Module: diff InitialContents: FollowSlot\x7fVisibility: public'
        
         collection2: c = ( |
            | coll2: c.  matches: nil).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'comparator' -> () From: ( | {
         'Category: copying\x7fModuleInfo: Module: diff InitialContents: FollowSlot\x7fVisibility: public'
        
         compare: c1 With: c2 = ( | {
                 'ModuleInfo: Module: diff InitialContents: FollowSlot'
                
                 comp.
                } 
            | 
            comp: copy.
            comp collection1: c1.
            comp collection2: c2.
            comp).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'comparator' -> () From: ( | {
         'Category: copying\x7fComment: Create a comparator to compare the files named f1 and f2.\x7fModuleInfo: Module: diff InitialContents: FollowSlot\x7fVisibility: public'
        
         compareFileNamed: f1 WithFileNamed: f2 = ( |
            | 
            compareFileNamed: f1 WithFileNamed: f2 IfFail: raiseError).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'comparator' -> () From: ( | {
         'Category: copying\x7fComment: Create a comparator to compare the files named f1 and f2.
Evaluate failBlock if the files cannot be read (with the
offending filename and the error string).\x7fModuleInfo: Module: diff InitialContents: FollowSlot\x7fVisibility: public'
        
         compareFileNamed: f1 WithFileNamed: f2 IfFail: failBlock = ( |
             cmp.
             d1.
             d2.
            | 
            d1: os_file openForReading: f1 IfFail: [|:e| ^failBlock value: f1 With: e].
            d2: os_file openForReading: f2 IfFail: [|:e| ^failBlock value: f2 With: e].
            cmp:
             compare:  (linesFromTextLines: d1 contents asTextLines)
                With:  (linesFromTextLines: d2 contents asTextLines).
            d1 close.
            d2 close.
            cmp).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'comparator' -> () From: ( | {
         'Category: computing differences\x7fModuleInfo: Module: diff InitialContents: FollowSlot\x7fVisibility: private'
        
         computeMatchVector = ( |
             coll2map.
             links.
             thresh.
            | 
            "Here's the heart of the matter.  See the original paper for an
             explanation and proof (ref in module comment)."

            start1:   coll1 firstKey.
            end1:     coll1 lastKey.
            start2:   coll2 firstKey.
            end2:     coll2 lastKey.
            matches:  vector copySize: coll1 size.

            "first trim the ends of common elements"
            trimStart.
            trimEnd.

            "Now compute equivalence classes of positions of elements."
            coll2map: buildEquivalenceClasses.

            thresh:  sortedSequence copy.
            thresh desiredMinCapacity: end2 - start2.
            links:
                vector copySize:
                    (end1 - start1) succ  min:  (end2 - start2) succ.

            "Build the DAG of subsequences."
            buildLinks: links Seq: thresh Map: coll2map.

            "Scan the DAG for the longest common subsequence."
            scanLinks: links Seq: thresh).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'comparator' -> () From: ( | {
         'Category: accessing\x7fComment: I added this slot for browsing (implementors of diff). -- Ungar July 2002\x7fModuleInfo: Module: diff InitialContents: FollowSlot\x7fVisibility: private'
        
         diff = 'I implement diff'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'comparator' -> () From: ( | {
         'Category: diff application\x7fModuleInfo: Module: diff InitialContents: FollowSlot\x7fVisibility: private'
        
         diffApplication = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'comparator' -> 'diffApplication' -> () From: ( |
             {} = 'Comment: This object holds the code to make the comparator into
an extractable application, compatible with Unix `diff\'.\x7fModuleInfo: Creator: globals comparator diffApplication.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'comparator' -> 'diffApplication' -> () From: ( | {
         'ModuleInfo: Module: diff InitialContents: FollowSlot\x7fVisibility: private'
        
         argHandler = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'comparator' -> 'diffApplication' -> 'argHandler' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals comparator diffApplication argHandler.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'comparator' -> 'diffApplication' -> 'argHandler' -> () From: ( | {
         'ModuleInfo: Module: diff InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'lobby' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'comparator' -> 'diffApplication' -> 'argHandler' -> () From: ( | {
         'ModuleInfo: Module: diff InitialContents: FollowSlot\x7fVisibility: public'
        
         value: i With: arg = ( |
            | 
            comparator diffApplication args addLast: arg.
            i succ).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'comparator' -> 'diffApplication' -> () From: ( | {
         'ModuleInfo: Module: diff InitialContents: InitializeToExpression: (list copy)\x7fVisibility: private'
        
         args <- list copy.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'comparator' -> 'diffApplication' -> () From: ( | {
         'ModuleInfo: Module: diff InitialContents: FollowSlot\x7fVisibility: private'
        
         commandName = ( |
            | 
            memory snapshotOptions fileName).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'comparator' -> 'diffApplication' -> () From: ( | {
         'ModuleInfo: Module: diff InitialContents: FollowSlot\x7fVisibility: private'
        
         err: str = ( |
            | 
            commandName print. ':  ' print. str printLine).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'comparator' -> 'diffApplication' -> () From: ( | {
         'Comment: This is the entry point for the diff application code.
It deals with the command-line arguments, runs the
application, then exits Self.\x7fModuleInfo: Module: diff InitialContents: FollowSlot\x7fVisibility: public'
        
         main = ( |
            | 
            snapshotAction otherCommandLineArgAction: argHandler.
            snapshotAction processCommandLine.

            args size != 2 ifTrue: [
              usage.
            ] False: [| file1 <- ''. file2 <- ''. res |
              file2: args removeLast.
              file1: args removeLast.
              res: comparator
                 compareFileNamed: file1
                    WithFileNamed: file2
                           IfFail: [|:f| err: f, ': No such file'.
                                   nil].
              res ifNotNil: [res printIt].
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'comparator' -> 'diffApplication' -> () From: ( | {
         'ModuleInfo: Module: diff InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'lobby' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'comparator' -> 'diffApplication' -> () From: ( | {
         'ModuleInfo: Module: diff InitialContents: FollowSlot\x7fVisibility: private'
        
         usage = ( |
            | 
            commandName print.
            ': usage: ' print.
            commandName print.
            ' file1 file2' printLine).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'comparator' -> () From: ( | {
         'Category: computing differences\x7fModuleInfo: Module: diff InitialContents: FollowSlot\x7fVisibility: private'
        
         end1.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'comparator' -> () From: ( | {
         'Category: computing differences\x7fModuleInfo: Module: diff InitialContents: FollowSlot\x7fVisibility: private'
        
         end2.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'comparator' -> () From: ( | {
         'Category: computing differences\x7fModuleInfo: Module: diff InitialContents: FollowSlot\x7fVisibility: private'
        
         hashObj = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'comparator' -> 'hashObj' -> () From: ( |
             {} = 'Comment: A hash object serves as a proxy for a string, when comparing
chunks of text.  The hash object implements more appropriate
comparison (=) and hash operations.  Comparison uses identity
and hash equality in preference to string compare.
The hash function generates a wide distribution of
hash values without resorting to canonicalization.\x7fModuleInfo: Creator: globals comparator hashObj.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'comparator' -> 'hashObj' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: diff InitialContents: FollowSlot\x7fVisibility: private'
        
         nohash = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'comparator' -> 'hashObj' -> 'parent' -> 'nohash' -> () From: ( |
             {} = 'Comment: This is a sentinel used to mark the fact
that no hash has been computed yet.\x7fModuleInfo: Creator: globals comparator hashObj parent nohash.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'comparator' -> 'hashObj' -> () From: ( | {
         'ModuleInfo: Module: diff InitialContents: FollowSlot\x7fVisibility: private'
        
         hashValue <- bootstrap stub -> 'globals' -> 'comparator' -> 'hashObj' -> 'parent' -> 'nohash' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'comparator' -> 'hashObj' -> () From: ( | {
         'ModuleInfo: Module: diff InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'comparator' -> 'hashObj' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals comparator hashObj parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'comparator' -> 'hashObj' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: diff InitialContents: FollowSlot\x7fVisibility: public'
        
         = s = ( |
            | 
            (string == s string)
            || [(hash = s hash)
                &&  [| r |
                     r: string = s string.
                     r ifTrue: [string: s string].
                     r]]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'comparator' -> 'hashObj' -> 'parent' -> () From: ( | {
         'Comment: Compute a hash of the string.  Take various characters from the string
and scatter them around a 30-bit int.
\x7fModuleInfo: Module: diff InitialContents: FollowSlot\x7fVisibility: private'
        
         computeHash = ( |
             c2.
             firstc.
             h <- 0.
             lastc.
             midLeft <- 0.
             midRight <- 0.
             mlc.
             mrc.
             nextToLast <- 0.
             ntlc.
             second <- 0.
             sz.
            | 

            sz: string size.
            sz = 0 ifTrue: [^1777]. "a prime"
            sz > 1 ifTrue: [
                midRight:  sz >> 1.
                 midLeft:  midRight pred.
              nextToLast:  sz - 2.
                  second:  1.
            ].
            firstc:  string byteAt: 0.
                c2:  string byteAt: second.
               mlc:  string byteAt: midLeft.
               mrc:  string byteAt: midRight.
              ntlc:  string byteAt: nextToLast.
             lastc:  string byteAt: sz pred.
            c2
            + (mlc << 2)
            + (mrc << 4)
            + (ntlc << 6)
            + (firstc << 8)
            + (sz << 10)
            + (lastc << 12)
            + ((c2 + ntlc) << 16)
            + ((firstc + mlc) << 20)).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'comparator' -> 'hashObj' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: diff InitialContents: FollowSlot\x7fVisibility: public'
        
         copySet: p = ( |
            | copy string: p).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'comparator' -> 'hashObj' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: diff InitialContents: FollowSlot\x7fVisibility: public'
        
         hash = ( |
            | 
            (nohash == hashValue) ifTrue: [hashValue: computeHash].
            hashValue).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'comparator' -> 'hashObj' -> 'parent' -> 'nohash' -> () From: ( | {
         'ModuleInfo: Module: diff InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'defaultBehavior' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'comparator' -> 'hashObj' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: diff InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'clonable' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'comparator' -> 'hashObj' -> () From: ( | {
         'ModuleInfo: Module: diff InitialContents: FollowSlot\x7fVisibility: private'
        
         string <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'comparator' -> () From: ( | {
         'Category: computing differences\x7fModuleInfo: Module: diff InitialContents: FollowSlot\x7fVisibility: public'
        
         inverseMatchVector = ( |
            | 
            matches ifNil: [inverseMatches: nil].
            inverseMatches ifNil: [
                inverseMatches:  vector copySize: coll2 size.
                matchVector do: [| :el. :index |
                    el ifNotNil: [inverseMatches at: el Put: index]
                ].
            ].
            inverseMatches).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'comparator' -> () From: ( | {
         'Category: computing differences\x7fModuleInfo: Module: diff InitialContents: FollowSlot\x7fVisibility: private'
        
         inverseMatches.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'comparator' -> () From: ( | {
         'Category: computing differences\x7fModuleInfo: Module: diff InitialContents: FollowSlot\x7fVisibility: public'
        
         inverseNoMatches = ( |
            | nilIndexes: inverseMatchVector).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'comparator' -> () From: ( | {
         'Category: computing differences\x7fComment: Convert text lines to a vector of string-like objects (which do
not canonicalize when hashed).
\x7fModuleInfo: Module: diff InitialContents: FollowSlot\x7fVisibility: private'
        
         linesFromTextLines: t = ( |
            | 
            t lines asVector copyMappedBy:
              [| :l | "l canonicalize here to use canonical strings"
                 hashObj copySet: l]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'comparator' -> () From: ( | {
         'Category: computing differences\x7fModuleInfo: Module: diff InitialContents: FollowSlot\x7fVisibility: public'
        
         matchVector = ( |
            | 
            matches ifNil: [computeMatchVector].
            matches).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'comparator' -> () From: ( | {
         'Category: computing differences\x7fModuleInfo: Module: diff InitialContents: FollowSlot\x7fVisibility: private'
        
         matches.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'comparator' -> () From: ( | {
         'Category: computing differences\x7fComment: Answer a sequence of the indexes of nil elements in v.
\x7fModuleInfo: Module: diff InitialContents: FollowSlot\x7fVisibility: private'
        
         nilIndexes: v = ( |
             seq.
            | 
            seq: sequence copy.
            v do: [| :v. :k |
              v ifNil: [seq add: k]
            ].
            seq).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'comparator' -> () From: ( | {
         'Category: computing differences\x7fModuleInfo: Module: diff InitialContents: FollowSlot\x7fVisibility: public'
        
         noMatches = ( |
            | nilIndexes: matchVector).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'comparator' -> () From: ( | {
         'ModuleInfo: Module: diff InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'clonable' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'comparator' -> () From: ( | {
         'Category: diff application\x7fComment: Print the output in a manner compatible with Unix diff.\x7fModuleInfo: Module: diff InitialContents: FollowSlot\x7fVisibility: public'
        
         printIt = ( |
             i0.
             i1.
             j0.
             j1.
             m.
             mLast.
            | 
            m: matchVector copy. "will be modified"
            i0:  m firstKey.
            mLast: m lastKey.

            [i0 <= mLast] whileTrue: [

              [   (i0 <= mLast)
               && [(m at: i0) = (m at: i0 pred IfAbsent: [collection2 firstKey pred]) succ]
              ] whileTrue: [
                  i0: i0 succ.
              ].
              j0: (m at: i0 pred IfAbsent: [collection2 firstKey pred]) succ.
              i1: i0 pred.

              [   (i1 < mLast)
               && [(m at: i1 succ) isNil]
              ] whileTrue: [
                  i1: i1 succ.
              ].
              j1:  (m at: i1 succ IfAbsent: [collection2 lastKey succ]) pred.
              m at: i1 Put: j1.

              reportChangeFromA: i0 To: i1 FromB: j0 To: j1.

              i0: i1 succ.
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'comparator' -> () From: ( | {
         'Category: diff application\x7fModuleInfo: Module: diff InitialContents: FollowSlot\x7fVisibility: private'
        
         printRangeFrom: a To: b = ( |
            | 
            "+1 for compatibility with diff"
            (a min: b) succ print.
            a < b ifTrue: [',' print.  b succ print]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'comparator' -> () From: ( | {
         'Category: computing differences\x7fModuleInfo: Module: diff InitialContents: FollowSlot\x7fVisibility: private'
        
         prlink = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'comparator' -> 'prlink' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals comparator prlink.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'comparator' -> 'prlink' -> () From: ( | {
         'ModuleInfo: Module: diff InitialContents: FollowSlot'
        
         first <- 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'comparator' -> 'prlink' -> () From: ( | {
         'ModuleInfo: Module: diff InitialContents: FollowSlot'
        
         last <- 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'comparator' -> 'prlink' -> () From: ( | {
         'ModuleInfo: Module: diff InitialContents: FollowSlot'
        
         next.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'comparator' -> 'prlink' -> () From: ( | {
         'ModuleInfo: Module: diff InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'clonable' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'comparator' -> () From: ( | {
         'Category: diff application\x7fModuleInfo: Module: diff InitialContents: FollowSlot\x7fVisibility: private'
        
         reportChangeFromA: a To: b FromB: c To: d = ( |
            | 
            (a > b) && [c > d] ifTrue: [^self].

            printRangeFrom: a To: b.
            (a > b ifTrue: 'a' False: [c > d ifTrue: 'd' False: 'c']) print.
            printRangeFrom: c To: d.
            '\n' print.

            a to: b Do: [| :i |
              '< ' print.
              (collection1 at: i) string printLine.
            ].
            (a <= b) && [c <= d] ifTrue: ['---\n' print].
            c to: d Do: [| :i |
              '> ' print.
              (collection2 at: i) string printLine.
            ].

            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'comparator' -> () From: ( | {
         'Category: computing differences\x7fComment: Walk the longest chain reading out the longest subsequence.
\x7fModuleInfo: Module: diff InitialContents: FollowSlot\x7fVisibility: private'
        
         scanLinks: links Seq: thresh = ( |
            | 
            thresh isEmpty  ifFalse: [| lnk |
                lnk:   links at:  thresh size pred.
                [|:exit|
                    matches 
                         at:  lnk first
                        Put:  lnk last.
                    lnk next ifNil: exit.
                    lnk:  lnk next
                ] loopExit
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'comparator' -> () From: ( | {
         'Category: computing differences\x7fModuleInfo: Module: diff InitialContents: FollowSlot\x7fVisibility: private'
        
         start1.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'comparator' -> () From: ( | {
         'Category: computing differences\x7fModuleInfo: Module: diff InitialContents: FollowSlot\x7fVisibility: private'
        
         start2.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'comparator' -> () From: ( | {
         'Category: tests\x7fModuleInfo: Module: diff InitialContents: FollowSlot\x7fVisibility: public'
        
         tests = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'comparator' -> 'tests' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals comparator tests.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'comparator' -> 'tests' -> () From: ( | {
         'Category: tests\x7fModuleInfo: Module: diff InitialContents: FollowSlot\x7fVisibility: public'
        
         doTests = ( |
            | 
            testEmpty.
            testPrefixSuffix.
            testShortLines.
            testPermutation.
            testHashCollisions).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'comparator' -> 'tests' -> () From: ( | {
         'ModuleInfo: Module: diff InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'oddball' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'comparator' -> 'tests' -> () From: ( | {
         'Category: tests\x7fModuleInfo: Module: diff InitialContents: FollowSlot\x7fVisibility: public'
        
         testEmpty = ( | {
                 'ModuleInfo: Module: diff InitialContents: FollowSlot'
                
                 c.
                } 
            | 
            c:  comparator compare: '' With: ''.
            tests
              check: [c matchVector]
              Against: vector
              Named: 'diff: empty input').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'comparator' -> 'tests' -> () From: ( | {
         'Category: tests\x7fModuleInfo: Module: diff InitialContents: FollowSlot\x7fVisibility: public'
        
         testHashCollisions = ( | {
                 'ModuleInfo: Module: diff InitialContents: FollowSlot'
                
                 c.
                } 
            | 
            c:  comparator
                  compare: (comparator linesFromTextLines: 
                    '\nabcdefgh\n01234567\nfoo' asTextLines)
                     With: (comparator linesFromTextLines:
                    '\nabCdeFgh\n01.34.67\nfoo' asTextLines).
            tests
              check: [(0 & nil & nil & 3) asVector]
              Against: [c matchVector]
              Named: 'diff: hash collisions').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'comparator' -> 'tests' -> () From: ( | {
         'Category: tests\x7fModuleInfo: Module: diff InitialContents: FollowSlot\x7fVisibility: public'
        
         testPermutation = ( | {
                 'ModuleInfo: Module: diff InitialContents: FollowSlot'
                
                 c.
                } 
            | 
            c:  comparator compare: 'abcdef' With: 'dbefac'.
            tests
              check: [(3 & nil & 4 & 5 & nil & nil) asVector]
              Against: [c inverseMatchVector]
              Named: 'diff: permutation').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'comparator' -> 'tests' -> () From: ( | {
         'Category: tests\x7fModuleInfo: Module: diff InitialContents: FollowSlot\x7fVisibility: public'
        
         testPrefixSuffix = ( | {
                 'ModuleInfo: Module: diff InitialContents: FollowSlot'
                
                 c.
                } 
            | 
            c:  comparator compare: 'abcXdef' With: 'abcYdef'.
            tests
              check: [c matchVector]
              Against: [c inverseMatchVector]
              Named: 'diff: prefix suffix').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'comparator' -> 'tests' -> () From: ( | {
         'Category: tests\x7fModuleInfo: Module: diff InitialContents: FollowSlot\x7fVisibility: public'
        
         testShortLines = ( | {
                 'ModuleInfo: Module: diff InitialContents: FollowSlot'
                
                 c.
                } 
            | 
            c:  comparator
                  compare: (comparator linesFromTextLines: '\na\nab\nabc\nabcd' asTextLines)
                     With: (comparator linesFromTextLines: 'X\n\na\nab\nabc\nabcd\nX' asTextLines).
            tests
              check: [(1 & 2 & 3 & 4 & 5) asVector]
              Against: [c matchVector]
              Named: 'diff: short lines').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'comparator' -> () From: ( | {
         'Category: computing differences\x7fModuleInfo: Module: diff InitialContents: FollowSlot\x7fVisibility: private'
        
         trimEnd = ( |
            | 
            [|:exit|
                start1 <= end1  ifFalse: exit.
                start2 <= end2  ifFalse: exit.
                (coll1 at: end1) = (coll2 at: end2)  ifFalse: exit.
                matchVector at: end1 - coll1 firstKey  Put: end2.
                end1:  end1 pred.
                end2:  end2 pred
            ] loopExit).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'comparator' -> () From: ( | {
         'Category: computing differences\x7fModuleInfo: Module: diff InitialContents: FollowSlot\x7fVisibility: private'
        
         trimStart = ( |
            | 
            [|:exit|
                start1 <= end1  ifFalse: exit.
                start2 <= end2  ifFalse: exit.
                (coll1 at: start1) = (coll2 at: start2)  ifFalse: exit.
                matchVector at: start1 - coll1 firstKey  Put: start2.
                start1:  start1 succ.
                start2:  start2 succ
            ] loopExit).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: diff InitialContents: FollowSlot'
        
         diff = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'diff' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'comment' From:
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'diff' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules diff.

CopyDowns:
globals modules init. copy 
SlotsToOmit: comment directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'diff' -> () From: ( | {
         'ModuleInfo: Module: diff InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'core'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'diff' -> () From: ( | {
         'ModuleInfo: Module: diff InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'diff' -> () From: ( | {
         'ModuleInfo: Module: diff InitialContents: FollowSlot'
        
         myComment <- 'This is an implementation of the algorithm to compute the longest common
    subsequence of two indexable collections, commonly known as the \"diff\" algorithm.
    It is based on the algorithm described in \"A Fast Algorithm for Computing Longest
    Common Subsequences\", Hunt and Szymanski, CACM, 20:5, pp.350-3, May 1977.'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'diff' -> () From: ( | {
         'ModuleInfo: Module: diff InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- '$Revision: 30.10 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'diff' -> () From: ( | {
         'ModuleInfo: Module: diff InitialContents: FollowSlot\x7fVisibility: private'
        
         subpartNames <- ''.
        } | ) 



 '-- Side effects'

 globals modules diff postFileIn
