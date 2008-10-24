"Sun-$Revision: 1.1.1.1 $"
 
"Copyright 1992-9 Sun Microsystems, Inc. and Stanford University.
 See the LICENSE file for license information."

shell _AddSlots: ( |
  "^" parseAll: files = (
      | lines <- 0. startTime. fp. |
      fp: cParser firstParser.
      lines: 0.
      startTime: time current.
      files do: [|:file. n <- 0. t <- 0. | 
          t: time current.
          ppAndParse: file. 
          n: (fp lineAt: fp posOfOutput) - 1.
          printInfoLines: n StartTime: t.
          lines: lines + n.
      ].
      'Total: ' printLine.
      printInfoLines: lines StartTime: startTime.
    ).

  "^" printInfoLines: lines StartTime: startTime = (
      | secs <- 0. |
      secs: ((time current - startTime) + 500) / 1000.
      'Number of lines:  ' print. lines printLine.
      'Time:             ' print. (secs / 60) print. ' min' printLine.
      'Lines per second: ' print. (lines / secs) printLine.
      self.
    ).

  "^" preProcess: file = (
      | resultFile <- ''. |
      "resultFile: file, '.pp'."
      (os_file exists: file) ifFalse: [error: 'no such file: ', file].
      resultFile: '/tmp/ole.pp'.
      'Preprocessing file ' print. file print. '... ' print.
      os command: 'cc -E -I$OPENWINHOME/include ', file, 
                    ' | egrep -v "^#" > ', resultFile.
         "Have to use egrep since it handles longer lines than grep."
      'done. Result on: ' print. resultFile printLine.
      resultFile.
    ).

  "^" parse: file = (
      'Parsing ' print. file print. '... ' print.
      cParser parseFile: file.
      'done.' printLine.
      cParser hasMoreInput ifTrue: [
          'Warning: not all input consumed' printLine.
      ].
      self.
    ).

  "^" ppAndParse: file = (
      parse: (preProcess: file).
    ).

  "^" testCParser = (
      | n <- 0. testStr <- ''. |
      testStr: '   int main(int argc, char *argv[]) {    \n',
               '     printf(stderr, "Hello world!\\n");  \n',
               '   }                                     \n'.
      'Testing C parser on:' printLine.
      testStr print.
      cParser parseString: testStr.
      cParser output suffix_walk_do: [n: 1 + n].
      'Completed parsing. Found ' print. n print. ' parse tree nodes ' print.
      130 = n ifTrue: ['(as expected).'  printLine] 
               False: ['(expected 130).' printLine].
      self.
    ).

  "^" genCParser = (
      | gp <- mango parsers stGrammarParser. |
      gp: gp copy.
      gp parseFile: 'Ansi-C.grm'.
      cParser: gp output makeParser.
      testCParser.
      'Writing snapshot... ' print.
       ('./ansi.snaps' _WriteSnapshot) printLine. 
      self.
    ).
| )

shell _AddSlotsIfAbsent: ( |
  "^" cParser.
| )

shell genCParser
