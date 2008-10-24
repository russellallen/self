"Sun-$Revision: 30.6 $"
 
"Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
 See the LICENSE file for license information."

"                                                Ole Agesen, September 1992."

traits mango parsers parserPipeline _Define: ( |
  "_" parent*                  = traits clonable.
  "^" output                   = ( lastParser  output. ).
  "^" skipOutput               = ( skipOutputIfFail: raiseError. ).
  "^" skipOutputIfFail: errBlk = ( lastParser skipOutput. errorCheck: errBlk. ).
  "^" parseString: s           = ( parseString: s  IfFail: raiseError. ).
  "^" parseFile: path          = ( parseFile: path IfFail: raiseError. ).

  "^" hasMoreInput = ( 
      firstParser = lastParser ifTrue: [
          firstParser hasMoreInput.
      ] False: [
          lastParser prevParser output isEndMarker not.
      ].
    ).

  "^" parseFile: path IfFail: errBlk = (
      | f <- os_file. s <- ''. |
      f: (f openForReading: path IfFail: [|:e| ^ errBlk value: e]).
      s: (f readCount: f size    IfFail: [|:e| ^ errBlk value: e]).
      f close.
      parseString: s IfFail: errBlk.
    ).

  "^" parseString: s IfFail: errBlk = ( 
      firstParser parseString: s. 
      errorCheck: errBlk.
    ).

  "^" size = (
      "Return how many parsers there are in this pipe."
      | n <- 0. |
      parsersDo: [n: 1 + n].
      n.
    ).

  "^" timeStagesOn: fileName = (
      "Testparse the given file, and measure how much time is spent in
       each stage."
      'Timing stages in ' print. printLine.
      copy parseFile: fileName.    "Make sure code is compiled before timing."
      size do: [|:i. start. part. |
          part: (copySize: 1 + i).
          start: time current.
          part parseFile: fileName.
          [part hasMoreInput] whileTrue: [part skipOutput].
          (1 + i) print. ' stages: ' print.
          (time current - start) print. 'ms' printLine.
      ].
      self.
    ).

  "_" errorCheck: errBlk = (
      "Inspect the output of the last parsing to see if it succeeded or not."
      output isErrorMarker ifTrue: [errBlk value: output errorMessage]
                            False: [self].
    ).

  "^" copyEmpty   = ( resend.copy init. ).      "Copy pipe with no parsers in."
  "^" copy        = ( copySize: maxSmallInt. ). "Copy pipe and all parsers."
  "^" copySize: n = ( copyEmpty copyParsers: self Limit: n. ).
      "'copySize:' copies the pipe, but truncates after the n'th parser.
       Mostly for debugging."

  "^" -> parser = (
      linkIn: parser.
      lastParser computeIOTypes.
      self.
    ).

  "_" linkIn: parser = (
      "Add 'parser' to end of pipe."
      parser setMyParserPipeline: self.
      nil = lastParser ifTrue: [firstParser: parser] 
                        False: [parser setPrev: lastParser].
      lastParser: parser. 
      self.
    ).

  "^" printString = (
      | res <- ''. arrow <- ' -> '. |
      parsersDo: [|:p| res: res, arrow, p printString].
      'parserPipeline(', 
      ('' != res ifTrue: [res copyFrom: arrow size] False: ''),
      ')'.
    ).

  "^" parsersDo: blk = (
      "Iterate blk over all parsers in the pipe, first to last."
      | p. |
      p: firstParser.
      [nil != p] whileTrue: [blk value: p. p: p nextParser.].
      self.
    ).

  "_" init = (
      lastParser:  nil.
      firstParser: nil.
    ).

  "_" copyParsers: pipe Limit: n = (
      | m <- 0. |
      pipe parsersDo: [|:p| 
          n = m ifTrue: [ ^ self].
          m: 1 + m.
          linkIn: p copy.
      ].
      self.
    ).
| )

mango parsers parserPipeline _Define: ( |
      {} = 'IsComplete: '.
  "_" parent*          = traits mango parsers parserPipeline.
 "^_" lastParser      <- nil.      "Nil here means empty pipe."
 "^_" firstParser     <- nil.      "Nil here means empty pipe."
| )


traits mango parsers parser _Define: ( |
    "Abstract supertype for parsers.
     How do parsers interact? 11/11/92.
     When the first parser is given some input, it calls 'takeNewInput'
     which sends a signal down the line of parsers. As the 
     signal travels down the line, each parser is sent
     'skipOutput' which makes it become active, computing its next
     result. The final result can be obtained by sending 'output' to the
     last parser. Further results can be obtained by alternatingly
     sending 'skipOutput' and 'output'.
     A parser must always have a token ready on its 'output'. The reason is 
     that the next parser in the pipe may be of a type that does lookahead.
     The token may be an 'endMarker' if the parser has run out of input.
     Or the token may be an 'errorMarker', to signal that an error occurred.
     It is desirable to let errorMarker's propagate down the pipe till they
     reach the last parser, at which point the pipe can signal the error
     to the client. This ensures that errors are synchronized with the
     externally observable parsing behavior.

     When sending 'skipOutput' to a parser, there are two general scenarios:

      Case A:
       Some parsers grab the current output from the predecessor, then compute 
       its own output, and then sends skipOutput to its predecessor. This kind 
       of parser needs to store position information for each step.
  
      Case B:
       Other parsers (filters, mostly) first sends 'skipOutput' to its
       predecessor, then computes its own output based on the new output from
       the predecessor. This kind of parser need not store position information
       since any requests can be forwarded (backwarded?) to its predecessor.

    This is a tradeof between generality and efficiency. Some parsers need
    the power of the first scenario, others dont'. 

    These two kinds of parsers also acts slightly differently upon receiving
    the 'takeNewInput' signal:

     Case A:
      This kind of parser sends 'skipOutput' to itself and then sends 
      'takeNewInput' to its successor.

     Case B:
      This kind of parser simply computes its new output, according to its
      current input. It does not skip anything. Then it sends 'takeNewInput'
      to its successor.
    "
  "_" parent*        = traits clonable.
  "_" illToken_id    = -2.     "Eff. flags illegal input tokens during parsing."
  "^" printString    = 'parser'.
  "^" copy           = ( resend.copy init. ).
  "^" isFirstParser  = ( nil = prevParser. ).
  "^" isLastParser   = ( nil = nextParser. ).
  "_" firstParser    = ( myParserPipeline firstParser. ).
  "_" cleanup        = ( "Called after parsing finishes." self. ).
  "^" currentInput   = ( prevParser output. ).
  "^" getSrc         = ( firstParser getSrcFrom: posOfOutput. ).
  "^" posOfInput     = ( posAsTextAt: prevParser posOfOutput. ).
  "^" posAsTextAt: m = ( firstParser posAsTextAt: m. ).
  "^" endMarker      = ( error: 'childShouldImplement'. "Output endMarker." ).
  "_" getMyState     = ( error: 'childShouldImplement'. ).
  "_" setMyState: s  = ( error: 'childShouldImplement'. ).
  "_" isCaseA        = true.   "See comment 11/11/92."
  "_" computeOutput  = ( error: 'caseB parser must impl. \'computeOutput\''. ).
  "^" computeIOTypes = ( computeToken_idMap. "Specialize in children." ).
  "_" traceLine: str = ( trace ifTrue: [str printLine]. self. ).

  "_" flagError: str = ( 
      cleanup. 
      output: mango tokens errorMarker copy. 
      output errorMessage: str.
      self.
    ).

  "_" markStartPos = ( 
      isCaseA ifTrue: [storedPosOfOutput: prevParser posOfOutput]. 
      self.
    ).

  "^" posOfOutput = (
      isCaseA ifTrue: [storedPosOfOutput]
               False: [prevParser posOfOutput].
    ).

  "_" statePair = (|
        "A chain of these are used to hold the state of an entire pipeline."
        "_" parent* = traits clonable.
        "^_" car. 
        "^_" cdr.
        "^" copyCar: a Cdr: d = ( (copy car: a) cdr: d. ).
      |).

  "^" getState = (
      statePair 
         copyCar: getMyState 
             Cdr: (isFirstParser ifTrue: nil False: [prevParser getState]).
    ).

  "^" setState: s = (
      setMyState: s car.
      isFirstParser ifFalse: [prevParser setState: s cdr].
      self.
    ).

  "^" currentInputToken_id = (
      "If there is no mapping for this token_id we have detected an error.
       Make sure that whoever requested the 'currentInputToken_id' is
       informed about the error by returning 'illToken_id'."
      (token_idMap at: currentInput token_id 
             IfAbsent: [^ illToken_id]). 
    ).

  "_" takeNewInput = ( 
      output: nil.     "Free up my old output. Necessary mostly for the
                        later stage parsers, since their output may be
                        something occupying *lots* of memory; e.g. before
                        you set out computing the next 20 Mbyte parse tree,
                        it is smart to at least allow the last 20Mbyte
                        parse tree to become garbage."
      isCaseA ifTrue: [skipOutput] False: [computeOutput].
      isLastParser ifFalse: [nextParser takeNewInput].
      self.
    ).

  "^" outputTypes = (
      "Return dictionary mapping all possible output kinds to corr. token_id's.
       'token_id' is a small integer and 'kind' is a string."
      error: 'childShouldImplement'.
    ).

  "^" inputTypes = (
      "Return dictionary mapping all possible input kinds to corr. token_id's.
       'token_id' is a small integer and 'kind' is a string."
      error: 'childShouldImplement'.
    ).

  "^" skipOutput = (
      markStartPos.
      basicSkipOutput.
      cleanup.
      self.
    ).

  "_" basicSkipOutput = (
      "Advance to next output symbol. 
       CaseA parsers extend this method in children.
       CaseB parsers implement 'computeOutput' instead."
      "trace && [nil != output] ifTrue: [traceLine: output source]. Too noisy."
      isCaseA ifFalse: [
          prevParser skipOutput.
          computeOutput.
      ].
      "Note: we don't factor out the caseA skipping code since these parsers
       need to do it as an integrated part of their parse action (need the
       lookahead)."
      self.
    ).

  "_" inputTokenTrap = (
      "Called when an illegal token has been detected on input.
       Sets up output to reflect the error, so after calling this
       method this parser should terminate parsing, since an output 
       has been produced.."
      currentInput isErrorMarker ifTrue: [
          flagError: currentInput errorMessage.
      ] False: [
          flagError: printString, ': illegal input token: ', 
                     currentInput kindPrintString, posOfInput.
      ].
    ).

  "^" setNext: next = ( nextParser: next. "May be overridden in children." ).

  "^" setPrev: prev = ( 
      "Should only be invoked from the '->' method. Connect this parser 
       onto the output of 'prev'."
      isFirstParser     ifFalse: [error: 'prevParser has already been set'].
      prev isLastParser ifFalse: [error: 'nextParser has already been set'].
      prevParser: prev. 
      prev setNext: self.
      output: endMarker copy. "Can't do before prevParser is set.
                               initialParsers do this as part of their own
                               initialization, cf. 070193."
      self.
    ).

  "_" computeToken_idMap = (
      "Compute the vector that maps token_id's. Most parsers need this,
       although some don't. Those that don't may compute it anyway, since the
       warnings that are printed can be useful."
      | extra <- set. missing <- set.  n <- 0. |
      extra:    extra    copy.
      missing:  missing  copy.
      prevParser outputTypes do: [|:token_id| n: (n max: token_id)].
      token_idMap: (vector copySize: 1 + n FillingWith: illToken_id).
      prevParser outputTypes do: [|:token_id. :kind. g <- 0. |
          g: (inputTypes at: kind IfAbsent: [extra add: kind. illToken_id]).
          mango assert: [illToken_id = (token_idMap at: token_id).
                           "Don't allow two kinds with same token_id."].
          token_idMap at: token_id Put: g.
      ].
      inputTypes do: [|:token_id. :kind|
          (prevParser outputTypes includesKey: kind) ifFalse: [
              missing add: kind.
          ].
      ].
      extra isEmpty not || [missing isEmpty not] ifTrue: [
          'Warning: mismatch detected when matching kinds of tokens.' printLine.
          'Producing parser is: ' print. prevParser print. '.' printLine.
          'Consuming parser is: ' print.            print. '.' printLine.
          extra isEmpty not ifTrue: [
              'Extra token kinds on producer\'s output: ' print. 
              extra do:   [|:kind| ' ' print. kind print].
              '' printLine.
          ].
          missing isEmpty not ifTrue: [
              'Extra token kinds on consumer\'s input:  ' print.
              missing do: [|:kind| ' ' print. kind print].
              '' printLine.
          ].
      ].
      self.
    ).

  "^" setMyParserPipeline: pp = (
      nil != myParserPipeline ifTrue: [
          error: 'parser is already part of another pipeline'.
      ].
      myParserPipeline: pp.
    ).

  "_" init = (
      nextParser: nil.
      prevParser: nil. 
      myParserPipeline: nil.
      self.
    ).

  "_" unusedToken_id: dict = (
      | ids <- set. free <- 0. |
      ids: ids copy.
      dict do: [|:token_id| ids add: token_id].
      [ids includes: free] whileTrue: [free: 1 + free].
      free.
    ).
| )

mango parsers parser _Define: ( |
      {} = 'IsComplete: '.
  "_" parent*     = traits mango parsers parser.
  "^" trace       = false.             "If true, print output as it is consumed."
 "^_" output     <- mango tokens token.   "Result obtained of last parse.     "
 "^_" nextParser <- mango parsers parser. "I eat his output. nil if I'm first."
 "^_" prevParser <- mango parsers parser. "He eats my output. nil if I'm last."
  "_" storedPosOfOutput <- 0.   "Marks src start pos. for 'output'. Case A only."
  "_" myParserPipeline.                     "Pipe that this parser is part of."
  "_" token_idMap <- vector.                "Maps prevParser's output token_id's 
                                           to my input token_id's."
| )


traits mango parsers initialParser _Define: ( |
    "Abstract supertype for all initial parsers, i.e. parsers that are
     first in the pipe."
  "_" parent*            = traits mango parsers parser.
  "^" hasMoreInput       = ( pos < str size. ).
  "^" getSrcFrom: m      = ( str copyFrom: m UpTo: pos. ).
  "^" inputTypes         = ( initialParserError. ).
  "^" setPrev: prev      = ( initialParserError. ).
  "_" initialParserError = ( error: 'initialParser: I\'m the first parser'. ).
  "^" posOfOutput        = ( pos. ).
  "_" computeToken_idMap = ( self. "Nothing to do for initial parsers." ).
  "_" markStartPos       = ( self. "No need to do this for initial parsers." ).

  "_" init = (
      output: endMarker copy.   "non-initialParsers do this after 'prevParser'
                                 has been set, cf. 'setPrev:'. 070193."
      resend.init.
    ).

  "^" parseString: s = (
      pos: -1.    "Need to send 'skipOutput' to get first new output."
      str: s.
      initPositionStuff.
      takeNewInput.
    ).

  { 'positionStuff'
       "This stuff needs to be reworked. Probably send line tokens down
        the pipe or something. If this is deleted, remember to delete
        some instance variables as well.
        One potential problem is that it is not general enough. It assumes 
        that 'self' has a slots named 'pos' and 'str' which happens to be true
        for todays initialParsers ('charStreamer' and 'grammarLexer') but
        which may not be true in the future."
      "^" lineAt: mark      = ( computePosOf: mark. lineAtFix.   ).
      "^" columnAt: mark    = ( computePosOf: mark. columnAtFix. ).

      "^" posAsTextAt: mark = ( 
          '(line ',    (lineAt:   mark) printString, 
          ', column ', (columnAt: mark) printString, 
          ', offset ', mark             printString, ')'.
        ).

      "_" columnAtFix = ( positionFix - lastNLPos).
    
      "_" computePosOf: fix = (
          fix < positionFix ifTrue: [error: 'should not happen'].
          [positionFix < fix] whileTrue: [
              '\n' = (str at: positionFix) ifTrue: [
                  lineAtFix: 1 + lineAtFix.
                  lastNLPos: positionFix.
              ].
              positionFix: 1 + positionFix.
          ].
          self.
        ).

      "_" initPositionStuff = (
          positionFix: 0.
          lastNLPos:  -1.
          lineAtFix:   1.
          self.
        ). 
  }
| )

(mango parsers initialParser _Define: 
 mango parsers parser clone _AddSlots: ( |
  "_" parent*      = traits mango parsers initialParser.

  "_" str         <- ''.     "An initial parser has a string and an index!"
  "_" pos         <-  0.

  "_" positionFix <-  0.     "These three slots are for the positionStuff."
  "_" lineAtFix   <-  0.
  "_" lastNLPos   <- -1.
| ))
mango parsers initialParser _RemoveSlot: 'token_idMap'
mango parsers initialParser _RemoveSlot: 'storedPosOfOutput'


traits mango parsers charStreamer _Define: ( |
  "A 'charStreamer' transforms a string of char's into a stream of 
   'charToken' objects. By default each kind of 'charToken' has its 
   own unique 'token_id' which corresponds to the ascii code for the
   char. However, a 'charStreamer' can be directed to classify its 
   output 'charToken' objects, see the method 'setUpCharClasses'."

  "_" parent*    = traits mango parsers initialParser.
  "^" endMarker  = ( tokens at: mango asciiSize. ).
  "_" getMyState = ( pos. ).

  "_" setMyState: s = ( 
      pos != s ifTrue: [  
          "Just an optimization to test this. Seems that the condition
           is hardly ever true, but still: is it worthwhile?"
          pos: s. 
          setOutput. 
      ].
      self.
    ).

  "_" tokenFor: ch = ( tokens at: ch asByte. ).

  "_" setOutput = (
      output: (tokenFor: (str at: pos IfAbsent: [^ output: endMarker])).
    ).

  "^" printString = ( 
      'charStreamer(', ((str copyFrom: pos) printStringSize: 20), ')'.
    ).

  "_" basicSkipOutput = ( 
      resend.basicSkipOutput.
      trace && [-1 != pos] ifTrue: [(str at: pos) print].
      pos: 1 + pos. 
      setOutput.
    ).

  "^" setNext: next = (
      "This is where we discover that the next guy is expecting use of
       char classes."
      resend.setNext: next.
      setUpCharClasses.
      self.
    ).

  "_" setUpCharClasses = (
      "This message is called while the 'charStreamer' is inserted 
       into a parser pipeline. The message first checks to see if the
       following parser expects use of char classes. It it does, 
       this 'charStreamer' will minimize the 'outputTypes' by replacing 
       class members by their class representative."
      "This test is rather ugly. It assumes that the next parser is of a
       certain kind (an lr parser). This may not remain true. Ole 4/2/93."
      nextParser grammar terminalClasses isEmpty ifFalse: [
          allocateTokens.                 "Need to allocate tokens now."
          nextParser grammar terminalClasses do: [|:class. classRep|
              classRep: class first.
              class do: [|:classMember. t. |
                  t: (tokenFor: classMember kind). 
                  t token_kind: classRep kind.
                  t token_id: (tokenFor: classRep kind) token_id.
              ].
          ].
      ].
      computeIOTypes.   "Need to recompute 'outputTypes'."
      self.
    ).

  "_" allocateTokens = (
      tokens: (tokens copySize: 1 + mango asciiSize).
      tokens mapBy: [|:val. :idx|
          idx < mango asciiSize ifTrue: [
              mango tokens charToken copy set_token_id: idx.
          ] False: [
              mango tokens endMarker copy     token_id: idx.
          ].
      ].
      self.
    ).

  "^" computeIOTypes = (
      tokens isEmpty ifTrue: [allocateTokens].  "Not needed if using classes."
      outputTypes: outputTypes copyRemoveAll.
      tokens do: [|:s| outputTypes at: s token_kind Put: s token_id].
      resend.computeIOTypes.
    ).

  "^" initPrototype = ( "Should only be called on prototype." allocateTokens. ).
| )

(mango parsers charStreamer _Define: 
 mango parsers initialParser clone _AddSlots: ( |
  "_" parent* = traits mango parsers charStreamer.
 "^_" outputTypes <- dictionary.   "Initialized in 'computeIOTypes'."
  "_" tokens      <- vector.       "Initialized in 'allocateTokens'."
| ))

mango parsers charStreamer initPrototype


traits mango parsers filter _Define: ( |
    "A filter is a parser that maps its input more or less directly to 
     its output, except that it may elimate a few kinds of tokens or add some.
     By and large, one token on input results in one on output."
  "_" parent*              = traits mango parsers parser.
  "^" printString          = 'filter'.
  "^" endMarker            = ( prevParser endMarker. ).
  "_" computeToken_idMap   = ( self. "Filters in general don't need this." ).
  "^" currentInputToken_id = ( currentInput token_id. ).   "Identity mapping!"
  "^" inputTypes           = ( prevParser outputTypes. ).  "I'm not picky."
  "_" getMyState           = ( output. ).      "Some children override these."
  "_" setMyState: s        = ( output: s. ).
| )

mango parsers filter _Define: mango parsers parser clone _AddSlots: ( |
  "_" parent*      = traits mango parsers filter.
 "^_" outputTypes <- dictionary.
| )
mango parsers filter _RemoveSlot: 'token_idMap'


traits mango parsers singleKindEater _Define: ( |
    "This filter eliminates tokens of a single kind."
  "_" parent*           = traits mango parsers filter.
  "^" copyEatingKind: k = ( resend.copy initEatingKind: k. ).
  "^" printString       = ( 'filter(', eatingKind, ')'. ).
  "_" eatIt             = ( prevParser skipOutput. ).   "Extend in children"
  "_" getMyState        = ( output @ storedPosOfOutput. ).
  "_" setMyState: s     = ( output: s x. storedPosOfOutput: s y. ).
  "^" initEatingKind: k = ( eatingKind: k. ).   "Public for whitespaceFilter."

  "_" basicSkipOutput = ( 
      resend.basicSkipOutput.
      [currentInputToken_id = eatingToken_id] whileTrue: [eatIt].
      output: currentInput.
      markStartPos. "Do again; else we get pos of the filtered out stuff."
      prevParser skipOutput.
      self.
    ).

  "^" computeIOTypes = (
      eatingToken_id: illToken_id.   "Doesn't eat anything yet."
      outputTypes: outputTypes copy.
      inputTypes do: [|:token_id. :kind|
          kind = eatingKind ifTrue: [eatingToken_id: token_id]
                             False: [outputTypes at: kind Put: token_id].
      ].
      eatingToken_id = illToken_id ifTrue: [
          'Warning: ' print. print. 
          ' did not find kind \'' print. eatingKind print.
          '\' on its input.' printLine.
      ].
      resend.computeIOTypes.
    ).
| )

(mango parsers singleKindEater _Define: 
 mango parsers filter clone _AddSlots: ( |
  "_" parent*         = traits mango parsers singleKindEater.
  "_" eatingKind     <- ''.    "The kind of tokens I'm eating."
  "_" eatingToken_id <- -1.    "Corr. token_id."
| ))


traits mango parsers whitespaceFilter _Define: ( |
    "This filter eliminates whitespace. When it encounters a whitespace
     on its input, it stuffs it into the following input. The final 
     whitespace, if any, is stored in the endMarker."
  "_" parent* = traits mango parsers singleKindEater.

  "_" eatIt = ( 
      | ws. |
      ws: currentInput.
      prevParser skipOutput.
      currentInput whitespace: ws.
      self.
    ).
| )

(mango parsers whitespaceFilter _Define: 
 mango parsers singleKindEater clone _AddSlots: ( |
  "_" parent* = traits mango parsers whitespaceFilter.
| ))


traits mango parsers keywordRecognizer _Define: ( |
    "Use: e.g. to transform {identifier} tokens into more specific
     tokens such as {void}, {static} etc. Automatically inserted
     between lexer and parser when generating a pipeline from a
     structured grammar."
  "_" parent*       = traits mango parsers filter.
  "_" isCaseA       = false.   "See comment 11/11/92."
  "^" copyMap: m    = ( resend.copy initMap: m. ).
  "^" printString   = ( 'keywordRecognizer'. ).

  "_" computeOutput = (
      (mapped at: currentInputToken_id IfAbsent: false) ifTrue: [
          | id <- 8. |
          id: (mapping at: currentInput source IfAbsent: nil).
          nil = id ifTrue: [
              output: currentInput.
          ] False: [
              output: currentInput copy.
              output token_id: id.
              output token_kind: output source.
          ].
      ] False: [
          output: currentInput.
      ].  
      self.
    ).

  "^" computeIOTypes = (
      | maxId <- 0. usedIds <- set. freeId <- 0. |
      usedIds: usedIds copy.
      mapping: mapping copy.   "This one is need because if we just use 
                                'outputTypes' to do the lookup in, we may
                                end up unintentionally mapping certain
                                things whose source matches some 'token_kind'.
                                In general we could speed up the processing
                                of tokens by having a separate mapping for
                                each input 'token_id' that is being mapped.
                                In practice, however, this does not make a
                                difference since it tends to be the case that
                                only one or two kinds such as 'identifier' 
                                has mappings."
      outputTypes: inputTypes copy.
      inputTypes do: [|:token_id| 
          usedIds add: token_id. 
          maxId: (maxId max: token_id).
      ].
      mapped: (vector copySize: 1 + maxId FillingWith: false).
      map do: [|:pair. token_kind. source. |
          token_kind: pair x.
          source:     pair y.
          mapped at: (inputTypes at: token_kind) Put: true.
          (outputTypes includesKey: source) ifTrue: [
              error: 'keywordRecognizer: kind \'', source, '\' already exists'.
          ].
          [usedIds includes: freeId] whileTrue: [freeId: 1 + freeId].
          usedIds add: freeId.
          outputTypes at: source Put: freeId.
          mapping     at: source Put: freeId.
      ].
      map: set.    "We will never need it again, so free up the memory."
      resend.computeIOTypes.
    ).
      
  "_" initMap: m = (
      "The map is just a list of pairs whose first component is a token_kind
       and whose second component is a source. The resulting parser will
       look for tokens of the given kinds with an exactly matching source.
       Such tokens will have their token_kind and token_id fields changed 
       before being passed on."
      map: m.
      self.
    ).
| )

(mango parsers keywordRecognizer _Define: 
 mango parsers filter clone _AddSlots: ( |
  "_" parent* = traits mango parsers keywordRecognizer.
  "_" map     <- set.          "Set of pairs: kind@source."
  "_" mapping <- dictionary.   "Dictionary: maps source to new kind."
  "_" mapped  <- vector.       "A vector of booleans. For fast identification
                              of token kinds that have a mapping associated.
                              The actual mapping info is in 'outputTypes'."
| ))
"This is a case B parser so 'posOfOutput = posOfInput', always."
mango parsers keywordRecognizer _RemoveSlot: 'storedPosOfOutput'


traits mango parsers stack _Define: ( |
  "_" parent* = traits clonable.
  "^" copy    = ( resend.copy init.            ).
  "_" init    = ( v: (v copySize: size). self. ).
  "^" reset   = ( pop: size.                   ).
  "^" size    = ( 1 + sp                       ).
  "^" pop     = ( pop: 1.                      ).
  "^" pop: n  = ( sp: sp - n. self.            ).
  "^" topPop  = ( | r | r: top. pop. r.        ).

  "^" top = ( 
      v at: sp IfAbsent: [0 > sp ifTrue: [error: 'empty stack: top failed']
                                  False: [error: 'stack: top failed']].
    ).

  "^" push: x = ( 
      sp: 1 + sp. 
      v at: sp Put: x 
          IfAbsent: [v: (v copySize: 100 + (2 * v size)). v at: sp Put: x].
      self.
    ).

  "^" printString = ( 
      'stack', ((v copySize: size) printString 
                copyFrom: (vector printString size - 2)).
    ).
| )

mango parsers stack _Define: ( |
      {} = 'IsComplete: '.
  "_" parent* = traits mango parsers stack.
  "_" v      <- vector.
  "_" sp     <- -1.   "Empty!"
  "^" parser <- mango parsers lrParser.     "The parser that this stack 
                                           is used by. Needed to generate
                                           output from simple reduceActions."
| )


"The actions determine a large part of the behavior of an lrParser.
 There are four different kinds of actions:  shift, reduce, accept and error.
 Shift, reduce and accept here come in two variants: simple and nonsimple.
 The simple actions are fast, but can not produce any output. They are mainly
 intended to be used for lexing. They keep only the parser states on the
 stack (i.e. no symbols or tree nodes).
 The nonsimple actions produce output and they require twice as big a stack,
 since the stack contents is an alternating sequence of states and symbols/
 tree nodes. The output is obtained indirectly: the shift action sends 
 messages to the input symbols to construct the output; the reduce action 
 sends messsages to the productions to construct the output.  By 
 installing different objects in the 'shifting' field of terminals and
 the 'reduceAction' field of productions, different kinds of output can be
 obtained. For example, 'grammar' objects have actions that produce a list 
 of productions as output. 'stGrammar' objects, on the other hand, set up 
 the actions to build a parse tree."

traits mango parsers action _Define: ( |
  "_" parent*      = traits clonable.
  "^" isAction     = true.
  "^"   isShift    = false.
  "^"   isReduce   = false.
  "^"     isAccept = false.
  "^"   isError    = false.
  "^" printString  = 'action'.
  "^" copy         = ( error: 'use copyAction'. ).
  "^" copyAction   = ( resend.copy. ).
  "^" doParser: p Stack: stack = ( error: 'childShouldImplement'. ).
| )

mango parsers action _Define: ( |
      {} = 'IsComplete: '.
  "_" parent* = traits mango parsers action.
| )


traits mango parsers simpleShift _Define: ( |
    "This shift action is maximally fast. It can not be used to build trees, 
     however, since it does not invoke the 'shifting pushToken:OnStack:' 
     method in the input symbol and it does not shift the symbols onto 
     the stack (only the state is kept on the stack)."
  "_" parent*                  = traits mango parsers action.
  "^" isShift                  = true.
  "^" printString              = ( 'simpleShift(', state printString, ')'. ).
  "^" copyState: s             = ( copyAction initState: s. ).
  "_" initState: s             = ( state: s. self. ).
  "^" doParser: p Stack: stack = ( p skipInput. stack push: state. self. ).
| )

(mango parsers simpleShift _Define: 
  mango parsers action copyAction _AddSlots: ( |
  "_" parent* = traits mango parsers simpleShift.
 "^_" state  <- -1.
| ))


traits mango parsers shift _Define: ( |
  "_" parent*     = traits mango parsers simpleShift.
  "^" printString = ( 'shift(', state printString, ')'. ).

  "^" doParser: p Stack: stack = (
      | inToken <- mango tokens token. inToken_id <- 0. |
      "Can't use 'inToken token_id' -- need mapping done in lrParser."
      inToken_id: p currentInputToken_id.
      inToken:    p currentInput.
      (p grammar symbolId2symbol: inToken_id) shifting pushToken: inToken 
                                                         OnStack: stack.
      stack push: state.
      p skipInput.  "NB: It is extremely important that this message send
		     follows the 'shifting pushToken:OnStack:' send. The 
                     reason only applies to C/C++ parsers which need fine 
                     control over the timing when symbols are actually shifted, 
                     so that side-effects on the previous parser 
                     (typedefFilter) will have enough time to take effect. 
                     typedef kludge!"
      self.
    ).
| )

(mango parsers shift _Define: 
 mango parsers simpleShift copyAction _AddSlots: ( |
  "_" parent* = traits mango parsers shift.
| ))


traits mango parsers simpleReduce _Define: ( |
    "This reduce action is maximally fast. It produces no output, however,
     and it does not invoke the 'reduceAction doStack:' 
     of the reducing production."
  "_" parent*           = traits mango parsers action.
  "^" isReduce          = true.
  "^" printString       = ( 'simpleReduce(', production printString, ')'. ).
  "^" copyProduction: p = ( copyAction initProduction: p. ).
  "^" noOfPops          = ( rhsSize. ).

  "^" doParser: p Stack: stack = (
      stack pop: noOfPops.
      stack push: ((p parseTable at: stack top) at: lhsSymbolId).
      self.
    ).

  "_" initProduction: prod = (
      production:  prod.
      rhsSize:     production rhs size.
      lhsSymbolId: production lhs symbolId.
      self.
    ).
| )
 
(mango parsers simpleReduce _Define: 
 mango parsers action copyAction _AddSlots: ( |
  "_" parent*      = traits mango parsers simpleReduce.
 "^_" production  <- mango productions production.
  "_" rhsSize     <- 0.
  "_" lhsSymbolId <- 0.
| ))


traits mango parsers reduce _Define: ( |
  "_" parent*     = traits mango parsers simpleReduce.
  "^" printString = ( 'reduce(', production printString, ')'. ).
  "^" noOfPops    = ( 2 * rhsSize. ).

  "^" doParser: p Stack: stack = (
      | newState <- -1. newSym. stacksize. | 
      mango assertSwitch ifTrue: [stacksize: stack size].
      newSym:   (reduceAction doStack: stack).
      newState: ((p parseTable at: stack top) at: lhsSymbolId).
      mango assertSwitch && [(stacksize - stack size) != noOfPops] ifTrue: [
          error: 'reduceAction popped ', (stacksize - stack size) printString,
                 ' should have popped ', noOfPops printString, ' elements'.
      ].
      stack push: newSym.
      stack push: newState.
      self.
    ).

  "_" initProduction: prod = (
      reduceAction: prod reduceAction.
      resend.initProduction: prod.
    ).
| )
 
(mango parsers reduce _Define: 
 mango parsers simpleReduce copyAction _AddSlots: ( |
  "_" parent* = traits mango parsers reduce.
  "_" reduceAction.
| ))
 

traits mango parsers simpleAccept _Define: ( |
  "_" parent*         = traits mango parsers simpleReduce.
  "^" isAccept        = true.
  "^" printString     = ( 'simpleAccept(', production printString, ')'. ).
  "^" returnToken_id  = ( resultProto token_id. ).
  "^" returnKind      = ( resultProto token_kind. ).
  "^" initParsing: p  = ( p stack push: p grammar initialState. self. ).

  "^" setWhitespaceToken_id: id Token_kind: kind = (
      "This method is no longer used. It used to be that tokens without a
       preceeding whitespace had a default whitespace token (with the empty
       string as source). This is no longer the case. Tokens without a 
       preceeding whitespace now has 'nil' in the 'whitespace' slot. 4/4/93."

      "Set the 'token_id' of whitespace to be 'id'. Note: this is normally
       only called on the per-grammar prototype accept action, 'acceptA'.
       Copies of 'acceptA' will share the same whitespace token, hence will
       have the right 'token_id' for whitespace. Of course, this only applies
       to tokens that do not have their whitespace explicitly set by the
       'whitespaceFilter' (if any)."
     "resultProto whitespace: resultProto whitespace copy.
      resultProto whitespace token_id:   id.
      resultProto whitespace token_kind: kind.
      mango assert: ['' = resultProto whitespace source]."
      self.
    ).

  "^" doParser: p Stack: stack = ( 
      resend.doParser: p Stack: stack.
      p setParseResult: (resultProto copy set_source: p getSrc)
           FinalAction: self.
      self. 
    ).

  "_" initProduction: prod = (
      resend.initProduction: prod.
      resultProto: resultProto copy.
      mango assert: [1 = production rhs size.
                       "rhs of accepting production must have size 1"].
      resultProto token_id: production rhs first symbolId.
      resultProto token_kind: production rhs first kind.
      self.
    ).
| )
 
(mango parsers simpleAccept _Define: 
 mango parsers simpleReduce copyAction _AddSlots: ( |
  "_" parent*      = traits mango parsers simpleAccept.
  "_" resultProto <- mango tokens token.
| ) )


traits mango parsers accept _Define: ( |
  "_" parent*         = traits mango parsers reduce.
  "^" isAccept        = true.
  "^" printString     = ( 'accept(', production printString, ')'. ).
  "^" returnToken_id  = ( production lhs protoSkeleton token_id. ).
  "^" returnKind      = ( production lhs protoSkeleton token_kind. ). 

  "^" initParsing: p  = ( 
      p stack push: p grammar endMarker.
      p stack push: p grammar initialState.
      self.
    ).

  "^" doParser: p Stack: stack = ( 
      resend.doParser: p Stack: stack. 
      mango assert: [4 = stack size.  "Check stack after finishing parsing"].
      stack pop.
      p setParseResult: stack top     "Parse tree or whatever."
           FinalAction: self.
      self. 
    ).
| )
 
(mango parsers accept _Define: 
mango parsers reduce copyAction _AddSlots: ( |
  "_" parent* = traits mango parsers accept.
| ))


traits mango parsers error _Define: ( |
  "_" parent*     = traits mango parsers action.
  "^" isError     = true.
  "^" printString = 'error'.
  "^" copy        = ( self ).
  "^" copyAction  = ( self ).     "No need to copy this kind of action."

  "^" doParser: p Stack: stack = ( 
      "Maybe set parse result to special errorToken???%%%"
      p setParseResult: p endMarker FinalAction: self. 
      self. 
   ).
| )
 
mango parsers error _Define: mango parsers action copyAction _AddSlots: ( |
  "_" parent* = traits mango parsers error.
| )


traits mango parsers lrParser _Define: ( |
  "_" parent*        = traits mango parsers parser.
  "^" printString    = ( 'lrParser(', grammar name, ')'. ).
  "^" copyGrammar: g = ( resend.copy initGrammar: g. ).

    "The following two methods should only be called by the parse actions."
  "^" setParseResult: r FinalAction: a = ( output: r. finalAction: a. self. ).

  "^" skipInput = ( 
      statistics ifTrue: [length: 1 + length]. 
      prevParser skipOutput.
      self.
    ).

  "_" stateRecord = ( |
      "_" parent* = traits clonable.
      "^" output.
      "^" stack.
      "^" emState.
      "^" emMatch.
    | ).

  "_" getMyState = ( 
      "May not work properly if there are trees on the stack that get 
       side-effected."
      | v. |
      v: stateRecord copy.
      v output:  output.
      v stack:   stack copy.
      v emState: emState.
      v emMatch: emMatch.
      v.
    ).

  "_" setMyState: s = ( 
      output:  v output.
      stack:   v stack.
      emState: v emState.
      emMatch: v emMatch.
    ).

  "_" basicSkipOutput = (
      "Skip current output. Parse the output of 'prevParser' to obtain
       next output which is put in the 'output' slot.
       Flag error if input not valid."
      | row. action. emAction. input_id <- 77. |
      resend.basicSkipOutput.
      currentInputToken_id = inputEndMarkerToken_id ifTrue: [
          ^ output: endMarker copy.
      ].
      initParsing.
      "The main loop!"
      [ | input_id <- 77. |
        gatherStatistics.
        input_id: currentInputToken_id.
        row:      (parseTable at: stack top).
        action:   (row at: input_id IfAbsent: [^ inputTokenTrap]).
        acceptOnNonEndMarker ifTrue: [
            emAction: (row at: inputEndMarkerToken_id).
            emAction isError not && [emAction != action] ifTrue: [
                "See the comment in 'checkAcceptOnEndMarker'."
                checkAcceptOnEndMarker.
            ].
        ].
        action doParser: self Stack: stack.
      ] untilTrue: [nil != finalAction].
      finishParsing.
    ).

  "_" initParsing = (
      stack reset.        "Empty stack."
      emMatch:     nil.   "No alternate match thus far."
      finalAction: nil.
      someAccept initParsing: self.
      statistics ifTrue: [
          maxStack: 0.
          length:   0.
          steps:    0.
          emSteps:  0.
          emChecks: 0.
      ].
      self.
    ).

  "_" finishParsing = (
      printStatistics.
      finalAction isError ifTrue: [ "OK, so we failed along the main track."
          nil = emMatch ifTrue: [   "Was there an earlier alternate accept?"
              ^ errorReturn.
          ] False: [
              prevParser setState: emState.
              output: emMatch.
          ].
      ].
      self.
    ).

  "_" checkAcceptOnEndMarker = (
      "Pretend that the current input is an endMarker and see if we can 
       get to an accept from the current state. 
       Why is this useful?

       The standard behavior for LR parsers is to only accept, if the 
       endMarker is detected on input. This is normally just fine, 
       but not always.

       Think of a lexer. It does not receive an endMarker on its
       input when it is time for it to accept. When should it accept? 
       We want the longest possible match.

       Assume that 

              a0 = action[S,endMarker]
              a  = action[S,currentInput] 

       We can be sure to find the longest possible match if

       Whenever we are in a state S for which
            a0 != error
       we check if the parser 'would accept, had currentInput been
       endMarker'.

       How can this be checked efficiently?

         * It is only necessary to do an explicit check if a0 != a.
           (Since the regular parsing action a would anyway be the first 
           on the way to acceptance on the endMarker).

       In principle there are two ways to do this test:
          1. Do it eagerly, i.e. before doing the regular action a.
          2. Capture enough state and do it later, but only if necessary
             (i.e. if the normal sequence of parsing actions ultimately
             leads to an error).

       Discussion of 1:
           - need to keep only one 'so far longest match'.
           - no need to capture complete state of previous parsers since the 
             eager test can be done without side-effecting them.
           - the eager test can be done quite efficiently when there are no
             epsilon productions (but if there are, it may be necessary to
             copy the current parsers stack before doing the test; the stack
             should be small anyway).

       Discussion of 2:
           - only done if necessary.
           - have to keep stack of 'deferred tests for match', not just one.
             Several ways to represent a 'deferred test':
               - Complete state of all previous parsers; allows direct 
                 restore of state in pipe line of parsers to the time 
                 the deferred test was captured.
               - The briefest possible: just the current input pos; will 
                 then be necessary to reparse from scratch up to the point 
                 where the deferred test was captured in order to restore 
                 that state.
      
       1 seems like the best choice. 
       How often will the eager test be performed? Whenever the current 
       symbol on input 'may or may not be part of the current structure 
       being parsed'.

       An unecessary case:
       Suppose we have a lexer that is currently recognizing an integer. 
       If the lexer's currentInput is '0', then the test will be performed 
       even though it is completely unnecessary, since '0' is guaranteed 
       to be part of the integer currently being recognized.
       Maybe try to optimize away some of these unecessary cases. %%%
       For example all shift actions that do not change the state of the 
       parser can safely be done without checking for accept on endMarker,
       since after shifting we have a longer string recognized and the 
       chance of accepting is unchanged (e.g. when in the middle of 
       recognizing an integer, we should always just shift additional
       digits that we find on input without worrying about accept on 
       endMarker). The situation is acutally not that simple: often a
       shift must be followed by a number of reductions before we end
       up in the same state again. This could perhaps be used to simplify
       the check rather than eliminating it (this leans more towards the 
       'deferred test' case).
       
       A necessary case:
       Suppose the lexer is recognizing a whitespace. If it sees a '(', 
       this '(' may or may not be part of the whitespace (e.g. it may be 
       the start of a comment or a self object).

       Measurements:
       It is easy to measure the cost of the eager test. Just run it twice
       as often and measure the difference, since it carries no additional 
       overhead. This is in contrast to the deferred tests.
       If cost seems high, we can try to eliminate unnecessary tests.
       Preliminary measurement: lexing and parsing 'stGrammar.grm'. 
       Overhead seems to be around 30%."
      | stack2 <- mango parsers stack. fa. |
      statistics ifTrue: [emChecks: 1 + emChecks].
      mango assert: [
          inputEndMarkerToken_id = grammar endMarker symbolId.
          "Verify that inputEndMarkerToken_id is valid."
      ].
      stack2: stack copy.
      [ | action. |
        statistics ifTrue: [emSteps: 1 + emSteps].
        action: (endMarkerActions at: stack2 top).
        mango assert: [
            ((parseTable at: stack2 top) at: inputEndMarkerToken_id) == action. 
            "if not ==, we have a bad endMarkerActions vector."
        ].
        action doParser: self Stack: stack2.
      ] untilTrue: [nil != finalAction].
      fa: finalAction.
      finalAction: nil.       "So that the main loop will run again."
      fa isError ifTrue: [^ self].
      mango assert: [fa isAccept. "Final action should be accept or error."].
      emMatch: output.
      emState: prevParser getState.
      self.
    ). 

  "^" setAcceptOnNonEndMarker = (
      acceptOnNonEndMarker: true.
      endMarkerActions:   "Extract vertical slice of parse table."
        (parseTable copy mapBy: [|:row| row at: inputEndMarkerToken_id]).
      self.
    ).

  "_" errorReturn = (
      "Called upon detection of an error termination: analyzes the state 
       of the parser to determine an error message. The error message is
       of the form:   'found <symbol> expecting one of: <symbol1> <symbol2>...
       Warning; SLR(1) parsers may perform reductions after the 'erroneous' 
       symbol appears on input (no shifts, though). Therefore the set of
       expected symbols may be misleading (too small). This is not the case 
       for LR(1) parsers, however. A better error message could be given for
       SLR(1) parsers by taking the union of lookaheads for the states the 
       parser has been in since the last shift, but this may slow down 
       parsing."
      | msg <- ''. |
      msg: printString, ' unexpected symbol on input;',
                        '\n  kind:     ', currentInput kindPrintString,
                        '\n  source:   ', currentInput source printString,
                        '\n  position: ', posOfInput,
                        '\nExpected kind(s): '.
      grammar em_terminalsDo: [|:s|
          ((parseTable at: stack top) at: s symbolId) isError ifFalse: [
              ' ' != msg last ifTrue: [msg: msg, ', '].
              msg: msg, s kindPrintString.
          ].
      ].
      'LR(1)' != grammar parseTableKind ifTrue: [
          msg: msg, '\n(', grammar parseTableKind, 
                    ' parse table used; list of expected',
                    ' kinds may be inaccurate)'.
      ].
      flagError: msg.
    ).

  "_" gatherStatistics = (
      statistics ifTrue: [
          maxStack: (maxStack max: stack size). 
          steps: 1 + steps.
      ].
      printConfig ifTrue: [
          (stack printStringSize: 40)  print. '\t' print. 
          currentInput kindPrintString print. '\t' print.
          ((parseTable at: stack top) at: currentInputToken_id
                                IfAbsent: 'illInput'
          ) printLine.
      ].
      self.
    ).

  "_" out: n And: nA = (
      n print. 
      ' (' print. 
      nA print.
      ')' printLine.
      self.
    ).

  "_" printStatistics = (
      lengthA:   lengthA + length.
      stepsA:    stepsA  + steps.
      maxStackA: (maxStackA max: maxStack).
      emChecksA: emChecksA + emChecks.
      emStepsA:  emStepsA  + emSteps.
      statistics ifTrue: [
          print. ' finished parsing:' printLine.
          '  Length of input:            ' print. out: length   And: lengthA.
          '  # parse steps:              ' print. out: steps    And: stepsA.
          '  Max stack size:             ' print. out: maxStack And: maxStackA.
          '  # checkAcceptOnEndMarker:   ' print. out: emChecks And: emChecksA.
          '  # parse steps in checkA...: ' print. out: emSteps  And: emStepsA.
      ].
      self.
    ).

  "^" computeIOTypes = (
      "Compute the 'inputTypes' and 'outputTypes' dictionaries.
       Also construct an (output) 'endMarker'. 
       Computing the 'outputTypes' is rather expensive. 
       Could perhaps be done smarter."
      inputTypes: inputTypes copy.
      grammar em_terminalsDo: [|:s| inputTypes at: s kind Put: s symbolId].

      outputTypes: outputTypes copyRemoveAll.
      grammar actionsDo: [|:action|
          action isAccept ifTrue: [
              outputTypes at: action returnKind Put: action returnToken_id.
          ].
      ].
      "Now construct the endMarker."
      endMarker: endMarker copy.
      endMarker token_id: (unusedToken_id: outputTypes).
      outputTypes at: endMarker token_kind Put: endMarker token_id.
      resend.computeIOTypes.
    ).

  "_" init = (
      stack: stack copy.
      stack parser: self.
      resend.init.
    ).

  "_" initGrammar: g = (
      grammar: g.

      "For faster access in 'checkAcceptOnEndMarker'."
      inputEndMarkerToken_id: grammar endMarker symbolId. 

      outputTypes: outputTypes copyRemoveAll.
      parseTable: g parseTable.
      'none' = grammar parseTableKind ifTrue: [
          ^ error: 'parse table not computed for ', grammar printString. 
      ].
      grammar actionsDo: [|:a| a isAccept ifTrue: [^ someAccept: a]].
      error: 'no accept actions in parse table'
    ).
| )

mango parsers lrParser _Define: mango parsers parser clone _AddSlots: ( |
  "_" parent*      = traits mango parsers lrParser.
  "^" printConfig  = false.      "If true, print configuration after each step."
  "^" statistics   = false.      "If true, gather statistics during parsing."
 "^_" inputTypes  <- dictionary.
 "^_" outputTypes <- dictionary.
 "^_" endMarker   <- mango tokens endMarker.
 "^_" inputEndMarkerToken_id.    "= grammar endMarker symbolId. For fast access."

 "^_" maxStack    <- 0.          "Set if 'statistics = true'."
 "^_" length      <- 0.          
 "^_" steps       <- 0.          
 "^_" emSteps     <- 0.
 "^_" emChecks    <- 0.
 "^_" maxStackA   <- 0.
 "^_" lengthA     <- 0.          
 "^_" stepsA      <- 0.          
 "^_" emStepsA    <- 0.
 "^_" emChecksA   <- 0.

 "^_" stack       <- mango parsers stack.

 "^_" grammar     <- mango grammars grammar.
 "^_" parseTable  <- vector.     "== grammar parseTable.  For fast access."

  "_" someAccept  <- mango parsers accept. "An accept action from parse table."
  "_" finalAction <- nil.        "The action terminating parsing is stored here."
  "_" emMatch     <- nil.        "When finding an accept on 'endMarker' the
                                parse result is stored here."
  "_" emState.                   "This is the state of all the previous parsers
                                corr. to the accept stored in 'emMatch'."

  "_" acceptOnNonEndMarker <- false.  "Set true if legal input is not guaranteed
                                     to terminate with endMarker. 
                                     cf. 'checkAcceptOnNonEndMarker'."
  "_" endMarkerActions <- vector. "Only used if 'acceptOnNonEndMarker' is true.
                                 Holds one column of the parse table. Just an
                                 optimization to avoid having to do double-
				 indexing in the performance critical inner
				 loop of 'checkAcceptOnNonEndMarker'."
| )
