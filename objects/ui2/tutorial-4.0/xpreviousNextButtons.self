(| 
a = ( | dir. prev. next.  args. fileCount. startPt. showPt. stageRightPt. whiteSheet. spewer. banner |

 startPt: '(2304 @ (-707 - 600))'.  
 showPt:  '(2304 @ -707)'.
 stageRightPt:  '((2304 + 800) @ -707)'.

"banner: morph copy.
banner color: (paint copyRed: 0.688172 Green: 0.841642  Blue: 0.942326).
banner setWidth: 1004.
 banner setHeight: 25.
banner globalPosition: (1783 @ -733).
banner addMorph: (labelMorph copyLabel: 'Self objects, messages, and modules') 
                  globalPosition: banner globalPosition + (10@17)."

dir: './ui2/tutorial-4.0/textStrings/'.

whiteSheet: (((( (morph copy) setWidth: 482) 
                                   setHeight: 702) 
                                   globalPosition: (2289 @ -729)) 
                                   color: (paint named: 'white')).

args: sequence copyRemoveAll.

fileCount: 1.
[os_file exists: dir, fileCount printString, '.self'] whileTrue: [
  | f |
  f: (os_file openForReading: dir, fileCount printString, '.self').
  args add: f contents.
  f close.
  fileCount: fileCount + 1.
].

args addFirst: nil. 	      "Indicates that there is as of yet no text in the world."
args addFirst: fileCount.     "Seeds the intial index into the collection of strings"

next: ui2Button copy.
next label: 'Next step'.
next target: whiteSheet.
next buttonArgs: args.
next script: ' | current. otherButton. str. lines. currentMph. pos | 
 currentMph: (buttonArgs at: 1).
 currentMph = nil ifFalse: [ | a | 
   \"Slide off currentMph, if it exists.\"
   a: positionAnimator copyTarget: currentMph Seconds: 2.0.
   a from: currentMph globalPosition.
   a to: ', stageRightPt , '.
   a: (a andThenSend: \'delete\' To: currentMph).
   currentMph world addActivity: a.
 ].

 current: (buttonArgs at: 0). \"Index of morph being built as next text\"
 current: current + 1.
 current >= buttonArgs size ifTrue: [
     current: 2. buttonArgs at: 0 Put: 2.
].

\"Make new currentMph and pull it on screen...\"
 lines: ((buttonArgs at: current) asTokensSeparatedByCharactersIn: \'\\n\').
 lines doFirst: [ | :line.  |
    currentMph: (labelMorph copyLabel: line Font: scalableFont times FontSize: 14 Color: (paint named: \'black\')).
    buttonArgs at: 1 Put: currentMph.
    pos: ', startPt, '.
    currentMph globalPosition: pos.
    button world addMorph: currentMph.
    button world moveToFront: currentMph.
 ] MiddleLast: [| :line. mph. |
   pos: pos + (0 @ 18).
   (line size = 1) && [line first = \'.\'] ifTrue: [
     pos:pos - (0 @ 8).
   ] False: [
     mph: (labelMorph copyLabel: line Font: scalableFont times FontSize: 14 Color: (paint named: \'black\')).
     mph globalPosition: pos.
     currentMph addMorph: mph.
   ].
 ].
 target addMorph: currentMph.
 currentMph moveToPosition: ', showPt ,'. 
 buttonArgs removeFirst. 
 buttonArgs removeFirst.
 buttonArgs addFirst: currentMph.
 buttonArgs addFirst: current.
'.

prev: ui2Button copy.
prev label: 'Previous step'.
prev target: whiteSheet.
prev buttonArgs: args.
prev script: ' | current. otherButton. str. lines. currentMph. pos | 
 currentMph: (buttonArgs at: 1).
 currentMph = nil ifFalse: [ | a | 
   a: positionAnimator copyTarget: currentMph Seconds: 2.0.
   a from: currentMph globalPosition.
   a to: ', startPt , '.
   a: (a andThenSend: \'delete\' To: currentMph).
   currentMph world addActivity: a.
 ].
  
 current:    (buttonArgs at: 0).
 current: current - 1. \"Index of text being built as previous text.\"
 current <= 1 ifTrue: [
    current: buttonArgs size - 1. buttonArgs at: 0 Put: current.
    currentMph: nil. buttonArgs at: 1 Put: nil.
].
 lines: ((buttonArgs at: current) asTokensSeparatedByCharactersIn: \'\\n\').
 lines doFirst: [ | :line.  |
    currentMph: (labelMorph copyLabel: line Font: scalableFont times FontSize: 14 Color: (paint named: \'black\')).
    buttonArgs at: 1 Put: currentMph.
    pos: ', stageRightPt , '.
    currentMph globalPosition: pos.
    button world addMorph: currentMph.
    button world moveToFront: currentMph.
 ] MiddleLast: [| :line. mph. |
   pos: pos + (0 @ 18).
   (line size = 1) && [line first = \'.\'] ifTrue: [
     pos:pos - (0 @ 8).
   ] False: [
     mph:  (labelMorph copyLabel: line Font: scalableFont times FontSize: 14 Color: (paint named: \'black\')).
     mph globalPosition: pos.
     currentMph addMorph: mph.
   ].
 ].
 target addMorph: currentMph.
 currentMph moveToPosition: ', showPt ,'.
 buttonArgs removeFirst. 
 buttonArgs removeFirst.
 buttonArgs addFirst: currentMph.
 buttonArgs addFirst: current.
'.

spewer: carpetMorph copy.
spewer globalPosition: 2288 @ -27.
next globalPosition: spewer globalPosition.
prev globalPosition: next globalPosition + (60@0).
"spewer addMorph: banner."
spewer addMorph: whiteSheet.
spewer addMorph: next.
spewer addMorph: prev.
spewer ) | )
