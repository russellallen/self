 'Sun-$Revision: 30.10 $'
 '
Copyright 1992-2012 AUTHORS.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: core\x7fCategory: numbers\x7fComment: e -- natural logarithm base\x7fModuleInfo: Module: float InitialContents: FollowSlot\x7fVisibility: public'
        
         e = 2.71828175.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: core\x7fCategory: numbers\x7fComment: IEEE infinity--larger than any other float\x7fModuleInfo: Module: float InitialContents: FollowSlot\x7fVisibility: public'
        
         infinity =  1e100 "infinity".
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: float InitialContents: FollowSlot'
        
         float = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'float' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'float' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules float.

CopyDowns:
globals modules init. copy 
SlotsToOmit: directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'float' -> () From: ( | {
         'ModuleInfo: Module: float InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'core'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'float' -> () From: ( | {
         'ModuleInfo: Module: float InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'float' -> () From: ( | {
         'ModuleInfo: Module: float InitialContents: FollowSlot'
        
         myComment <- 'Behavior for floating point numbers.'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'float' -> () From: ( | {
         'ModuleInfo: Module: float InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- 'Sun-$Revision: 30.10 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'float' -> () From: ( | {
         'ModuleInfo: Module: float InitialContents: FollowSlot\x7fVisibility: private'
        
         subpartNames <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: core\x7fCategory: numbers\x7fComment: pi -- a nice mnuemonic to have\x7fModuleInfo: Module: float InitialContents: FollowSlot\x7fVisibility: public'
        
         pi = 3.14159.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: core\x7fCategory: numbers\x7fModuleInfo: Module: float InitialContents: FollowSlot\x7fVisibility: public'
        
         float = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'float' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits float.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'float' -> () From: ( | {
         'Category: comparing\x7fComment: Normally would not implement these, but floats are 
                  special--dmu
                  By implementing them, we get a good speedup (Hack!)
                  I do not understand why these are double-dispatched, though\x7fModuleInfo: Module: float InitialContents: FollowSlot\x7fVisibility: public'
        
         != a = ( |
            | asFloat _FloatNE: a IfFail: [(= a) not]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'float' -> () From: ( | {
         'Category: arithmetic\x7fModuleInfo: Module: float InitialContents: FollowSlot\x7fVisibility: public'
        
         % a = ( |
            | 
             asFloat _FloatMod: a IfFail: [| :error. :name. |
            "Return receiver a receiver. Obeys identity: a%b = a - (b * a/b)."
                ('badTypeError' == error) ifTrue: [
                    " use double dispatching "
                    a moduloFloat: asFloat ] False: [
                primitiveFailedError: error Name: name ]]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'float' -> () From: ( | {
         'Category: arithmetic\x7fModuleInfo: Module: float InitialContents: FollowSlot\x7fVisibility: public'
        
         * a = ( |
            | asFloat _FloatMul: a IfFail: [| :error. :name. |
            ('badTypeError' == error) ifTrue: [
                " use double dispatching "
                a multiplyFloat: asFloat ] False: [
            primitiveFailedError: error Name: name ]]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'float' -> () From: ( | {
         'Category: arithmetic\x7fModuleInfo: Module: float InitialContents: FollowSlot\x7fVisibility: public'
        
         + a = ( |
            | asFloat _FloatAdd: a IfFail: [| :error. :name. |
            ('badTypeError' == error) ifTrue: [
                " use double dispatching "
                a addFloat: asFloat ] False: [
            primitiveFailedError: error Name: name ]]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'float' -> () From: ( | {
         'Category: arithmetic\x7fModuleInfo: Module: float InitialContents: FollowSlot\x7fVisibility: public'
        
         - a = ( |
            | asFloat _FloatSub: a IfFail: [| :error. :name. |
            ('badTypeError' == error) ifTrue: [
                " use double dispatching "
                a subtractFloat: asFloat ] False: [
            primitiveFailedError: error Name: name ]]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'float' -> () From: ( | {
         'Category: arithmetic\x7fModuleInfo: Module: float InitialContents: FollowSlot\x7fVisibility: public'
        
         / a = ( |
            | asFloat _FloatDiv: a IfFail: [| :error. :name. |
            ('badTypeError' == error) ifTrue: [
                " use double dispatching "
                a divideFloat: asFloat ] False: [
            primitiveFailedError: error Name: name ]]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'float' -> () From: ( | {
         'Category: arithmetic\x7fModuleInfo: Module: float InitialContents: FollowSlot\x7fVisibility: public'
        
         /+ a = ( |
            | (/ a) ceil  asInteger).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'float' -> () From: ( | {
         'Category: arithmetic\x7fModuleInfo: Module: float InitialContents: FollowSlot\x7fVisibility: public'
        
         /- a = ( |
            | (/ a) floor asInteger).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'float' -> () From: ( | {
         'Category: arithmetic\x7fModuleInfo: Module: float InitialContents: FollowSlot\x7fVisibility: public'
        
         /= a = ( |
            | / a).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'float' -> () From: ( | {
         'Category: arithmetic\x7fModuleInfo: Module: float InitialContents: FollowSlot\x7fVisibility: public'
        
         /~ a = ( |
            | / a).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'float' -> () From: ( | {
         'Category: comparing\x7fComment: Normally would not implement these, but floats are 
                  special--dmu
                  By implementing them, we get a good speedup (Hack!)
                  I do not understand why these are double-dispatched, though\x7fModuleInfo: Module: float InitialContents: FollowSlot\x7fVisibility: public'
        
         < a = ( |
            | asFloat _FloatLT: a IfFail: [
            a reverseLessThanFloat: asFloat]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'float' -> () From: ( | {
         'Category: comparing\x7fComment: Normally would not implement these, but floats are 
                  special--dmu
                  By implementing them, we get a good speedup (Hack!)
                  I do not understand why these are double-dispatched, though\x7fModuleInfo: Module: float InitialContents: FollowSlot\x7fVisibility: public'
        
         <= a = ( |
            | asFloat _FloatLE: a IfFail: [
            a reverseLessThanOrEqualFloat: asFloat]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'float' -> () From: ( | {
         'Category: comparing\x7fComment: Normally would not implement these, but floats are 
                  special--dmu
                  By implementing them, we get a good speedup (Hack!)
                  I do not understand why these are double-dispatched, though\x7fModuleInfo: Module: float InitialContents: FollowSlot\x7fVisibility: public'
        
         = a = ( |
            | asFloat _FloatEQ: a IfFail: [
            a equalsFloat: asFloat]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'float' -> () From: ( | {
         'Category: comparing\x7fComment: Normally would not implement these, but floats are 
                  special--dmu
                  By implementing them, we get a good speedup (Hack!)
                  I do not understand why these are double-dispatched, though\x7fModuleInfo: Module: float InitialContents: FollowSlot\x7fVisibility: public'
        
         > a = ( |
            | asFloat _FloatGT: a IfFail: [
            a reverseGreaterThanFloat: asFloat]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'float' -> () From: ( | {
         'Category: comparing\x7fComment: Normally would not implement these, but floats are 
                  special--dmu
                  By implementing them, we get a good speedup (Hack!)
                  I do not understand why these are double-dispatched, though\x7fModuleInfo: Module: float InitialContents: FollowSlot\x7fVisibility: public'
        
         >= a = ( |
            | asFloat _FloatGE: a IfFail: [
            a reverseGreaterThanOrEqualFloat: asFloat]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'float' -> () From: ( | {
         'Category: arithmetic\x7fComment: _\x7fModuleInfo: Module: float InitialContents: FollowSlot'
        
         addBigInteger: a = ( |
            | a asFloat + asFloat).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'float' -> () From: ( | {
         'Category: arithmetic\x7fModuleInfo: Module: float InitialContents: FollowSlot\x7fVisibility: private'
        
         addFloat: a = ( |
            | a + asFloat).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'float' -> () From: ( | {
         'Category: arithmetic\x7fComment: _\x7fModuleInfo: Module: float InitialContents: FollowSlot'
        
         addSmallInteger: a = ( |
            | a asFloat + asFloat).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'float' -> () From: ( | {
         'Category: coercions\x7fModuleInfo: Module: float InitialContents: FollowSlot\x7fVisibility: public'
        
         asBigInteger = ( |
            | asInteger asBigInteger).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'float' -> () From: ( | {
         'Category: coercions\x7fModuleInfo: Module: float InitialContents: FollowSlot\x7fVisibility: public'
        
         asFloat = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'float' -> () From: ( | {
         'Category: coercions\x7fComment: fix this to handle big floats, too\x7fModuleInfo: Module: float InitialContents: FollowSlot\x7fVisibility: public'
        
         asInteger = ( |
            | asSmallInteger).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'float' -> () From: ( | {
         'Category: coercions\x7fModuleInfo: Module: float InitialContents: FollowSlot\x7fVisibility: public'
        
         asSmallIntegerIfFail: fb = ( |
            | 
            asFloat _FloatAsIntIfFail: fb).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'float' -> () From: ( | {
         'Category: miscellaneous\x7fModuleInfo: Module: float InitialContents: FollowSlot\x7fVisibility: public'
        
         bitSize = ( |
            | typeSizes bitSize:  'self_float').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'float' -> () From: ( | {
         'Category: miscellaneous\x7fModuleInfo: Module: float InitialContents: FollowSlot\x7fVisibility: public'
        
         byteSize = ( |
            | typeSizes byteSize: 'self_float').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'float' -> () From: ( | {
         'Category: coercions\x7fModuleInfo: Module: float InitialContents: FollowSlot\x7fVisibility: public'
        
         ceil = ( |
            | asFloat _FloatCeil).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'float' -> () From: ( | {
         'Category: comparing\x7fComment: Normally would not implement these, but floats are 
                  special--dmu
                  By implementing them, we get a good speedup (Hack!)
                  I do not understand why these are double-dispatched, though\x7fModuleInfo: Module: float InitialContents: FollowSlot\x7fVisibility: public'
        
         compare: x IfLess: lb Equal: eb Greater: gb = ( |
            | 
            ( 
               _FloatLT: x "Hack! This method is an optimization--dmu"
                 IfFail: [^resend.compare: x IfLess: lb Equal: eb Greater: gb]
            ) ifTrue: lb False: [ = x ifTrue: eb False: gb ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'float' -> () From: ( | {
         'Category: comparing\x7fComment: Normally would not implement these, but floats are 
                  special--dmu
                  By implementing them, we get a good speedup (Hack!)
                  I do not understand why these are double-dispatched, though _\x7fModuleInfo: Module: float InitialContents: FollowSlot'
        
         compareBigInteger: a IfLess: lb Equal: eb Greater: gb = ( |
            | 
            asFloat compare: a asFloat IfLess: lb Equal: eb Greater: gb).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'float' -> () From: ( | {
         'Category: arithmetic\x7fComment: _\x7fModuleInfo: Module: float InitialContents: FollowSlot'
        
         divideBigInteger: a = ( |
            | a asFloat / asFloat).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'float' -> () From: ( | {
         'Category: arithmetic\x7fModuleInfo: Module: float InitialContents: FollowSlot\x7fVisibility: private'
        
         divideFloat: a = ( |
            | a / asFloat).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'float' -> () From: ( | {
         'Category: arithmetic\x7fComment: _\x7fModuleInfo: Module: float InitialContents: FollowSlot'
        
         divideSmallInteger: a = ( |
            | a asFloat / asFloat).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'float' -> () From: ( | {
         'Category: comparing\x7fComment: Normally would not implement these, but floats are 
                  special--dmu
                  By implementing them, we get a good speedup (Hack!)
                  I do not understand why these are double-dispatched, though _\x7fModuleInfo: Module: float InitialContents: FollowSlot'
        
         equalsBigInteger: a = ( |
            | asFloat = a asFloat).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'float' -> () From: ( | {
         'Category: comparing\x7fComment: Normally would not implement these, but floats are 
                  special--dmu
                  By implementing them, we get a good speedup (Hack!)
                  I do not understand why these are double-dispatched, though\x7fModuleInfo: Module: float InitialContents: FollowSlot\x7fVisibility: private'
        
         equalsFloat: a = ( |
            | a = asFloat).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'float' -> () From: ( | {
         'Category: comparing\x7fComment: Normally would not implement these, but floats are 
                  special--dmu
                  By implementing them, we get a good speedup (Hack!)
                  I do not understand why these are double-dispatched, though _\x7fModuleInfo: Module: float InitialContents: FollowSlot'
        
         equalsSmallInteger: a = ( |
            | a asFloat = asFloat).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'float' -> () From: ( | {
         'Category: coercions\x7fModuleInfo: Module: float InitialContents: FollowSlot\x7fVisibility: public'
        
         floor = ( |
            | asFloat _FloatFloor).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'float' -> () From: ( | {
         'Category: comparing\x7fModuleInfo: Module: float InitialContents: FollowSlot\x7fVisibility: public'
        
         hash = ( |
            | identityHash).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'float' -> () From: ( | {
         'Category: arithmetic\x7fComment: _\x7fModuleInfo: Module: float InitialContents: FollowSlot'
        
         moduloBigInteger: a = ( |
            | a asFloat % asFloat).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'float' -> () From: ( | {
         'Category: arithmetic\x7fModuleInfo: Module: float InitialContents: FollowSlot\x7fVisibility: private'
        
         moduloFloat: a = ( |
            | a % asFloat).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'float' -> () From: ( | {
         'Category: arithmetic\x7fComment: _\x7fModuleInfo: Module: float InitialContents: FollowSlot'
        
         moduloSmallInteger: a = ( |
            | a asFloat % asFloat).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'float' -> () From: ( | {
         'Category: arithmetic\x7fComment: _\x7fModuleInfo: Module: float InitialContents: FollowSlot'
        
         multiplyBigInteger: a = ( |
            | a asFloat * asFloat).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'float' -> () From: ( | {
         'Category: arithmetic\x7fModuleInfo: Module: float InitialContents: FollowSlot\x7fVisibility: private'
        
         multiplyFloat: a = ( |
            | a * asFloat).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'float' -> () From: ( | {
         'Category: arithmetic\x7fComment: _\x7fModuleInfo: Module: float InitialContents: FollowSlot'
        
         multiplySmallInteger: a = ( |
            | a asFloat * asFloat).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'float' -> () From: ( | {
         'Category: children\x7fComment: for efficiency (avoid conversions)\x7fModuleInfo: Module: float InitialContents: FollowSlot\x7fVisibility: public'
        
         one = 1.0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'float' -> () From: ( | {
         'ModuleInfo: Module: float InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'number' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'float' -> () From: ( | {
         'Category: printing\x7fModuleInfo: Module: float InitialContents: FollowSlot\x7fVisibility: public'
        
         printString = ( |
            | 
            asFloat _FloatPrintString).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'float' -> () From: ( | {
         'Category: printing\x7fModuleInfo: Module: float InitialContents: FollowSlot\x7fVisibility: public'
        
         printStringPrecision: p = ( |
            | 
            asFloat _FloatPrintStringPrecision: p asSmallInteger).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'float' -> () From: ( | {
         'Category: comparing\x7fComment: Normally would not implement these, but floats are 
                  special--dmu
                  By implementing them, we get a good speedup (Hack!)
                  I do not understand why these are double-dispatched, though\x7fModuleInfo: Module: float InitialContents: FollowSlot\x7fVisibility: private'
        
         reverseGreaterThanFloat: a = ( |
            | a > asFloat).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'float' -> () From: ( | {
         'Category: comparing\x7fComment: Normally would not implement these, but floats are 
                  special--dmu
                  By implementing them, we get a good speedup (Hack!)
                  I do not understand why these are double-dispatched, though\x7fModuleInfo: Module: float InitialContents: FollowSlot\x7fVisibility: private'
        
         reverseGreaterThanOrEqualFloat: a = ( |
            | a >= asFloat).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'float' -> () From: ( | {
         'Category: comparing\x7fComment: Normally would not implement these, but floats are 
                  special--dmu
                  By implementing them, we get a good speedup (Hack!)
                  I do not understand why these are double-dispatched, though _\x7fModuleInfo: Module: float InitialContents: FollowSlot'
        
         reverseGreaterThanOrEqualSmallInteger: a = ( |
            | a asFloat >= asFloat).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'float' -> () From: ( | {
         'Category: comparing\x7fComment: Normally would not implement these, but floats are 
                  special--dmu
                  By implementing them, we get a good speedup (Hack!)
                  I do not understand why these are double-dispatched, though _\x7fModuleInfo: Module: float InitialContents: FollowSlot'
        
         reverseGreaterThanSmallInteger: a = ( |
            | a asFloat > asFloat).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'float' -> () From: ( | {
         'Category: comparing\x7fComment: Normally would not implement these, but floats are 
                  special--dmu
                  By implementing them, we get a good speedup (Hack!)
                  I do not understand why these are double-dispatched, though\x7fModuleInfo: Module: float InitialContents: FollowSlot\x7fVisibility: private'
        
         reverseLessThanFloat: a = ( |
            | a < asFloat).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'float' -> () From: ( | {
         'Category: comparing\x7fComment: Normally would not implement these, but floats are 
                  special--dmu
                  By implementing them, we get a good speedup (Hack!)
                  I do not understand why these are double-dispatched, though\x7fModuleInfo: Module: float InitialContents: FollowSlot\x7fVisibility: private'
        
         reverseLessThanOrEqualFloat: a = ( |
            | a <= asFloat).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'float' -> () From: ( | {
         'Category: comparing\x7fComment: Normally would not implement these, but floats are 
                  special--dmu
                  By implementing them, we get a good speedup (Hack!)
                  I do not understand why these are double-dispatched, though _\x7fModuleInfo: Module: float InitialContents: FollowSlot'
        
         reverseLessThanOrEqualSmallInteger: a = ( |
            | a asFloat <= asFloat).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'float' -> () From: ( | {
         'Category: comparing\x7fComment: Normally would not implement these, but floats are 
                  special--dmu
                  By implementing them, we get a good speedup (Hack!)
                  I do not understand why these are double-dispatched, though _\x7fModuleInfo: Module: float InitialContents: FollowSlot'
        
         reverseLessThanSmallInteger: a = ( |
            | a asFloat < asFloat).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'float' -> () From: ( | {
         'Category: functions\x7fComment: raise to a power; receiver is exponent, argument is base\x7fModuleInfo: Module: float InitialContents: FollowSlot\x7fVisibility: private'
        
         reversePower: base = ( |
            | error: 'fractional exponent').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'float' -> () From: ( | {
         'Category: coercions\x7fModuleInfo: Module: float InitialContents: FollowSlot\x7fVisibility: public'
        
         round = ( |
            | asFloat _FloatRound).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'float' -> () From: ( | {
         'Category: functions\x7fModuleInfo: Module: float InitialContents: FollowSlot\x7fVisibility: private'
        
         squareRootPrecision = ( |
            | / 10000).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'float' -> () From: ( | {
         'Category: printing\x7fModuleInfo: Module: float InitialContents: FollowSlot\x7fVisibility: public'
        
         storeStringIfFail: fb = ( |
             s1 <- ''.
             s2 <- ''.
            | 
            = infinity         ifTrue: [^ ' 1e100 "infinity"'].
            = infinity negate  ifTrue: [^ '-1e100 "negative infinity"'].
            "We have two forms of printStrings for floats. Pick whichever
             causes the least precision loss in this particular case.
             Format 1, obtained by 'printString' may use scientific notation
             like 1e-9, but never (seems to) have more than 6 digits of
             precision. 
             Format 2, obtained by 'printStringPrecision:' may have more digits
             of precision, but seems to never use scientific notation."
            s1: printString.
            absoluteValue >= maxSmallInt ifTrue: [
                "The Self parser is broken! It can't parse a float constant of
                 the form 1000000000.345 when the integer part (as in this 
                 example) is greater than maxSmallInt. So in this case we 
                 should not even consider using this format for storeStrings."
                ^ s1.
            ].
            s2: (printStringPrecision: 8). "8 digits of precision, but
                                             no exponential notation."
            (- s1 eval) absoluteValue compare: (- s2 eval) absoluteValue
                        IfLess: s1
                         Equal: [s1 size <= s2 size ifTrue: s1 False: s2]
                       Greater: s2).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'float' -> () From: ( | {
         'Category: arithmetic\x7fComment: _\x7fModuleInfo: Module: float InitialContents: FollowSlot'
        
         subtractBigInteger: a = ( |
            | a asFloat - asFloat).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'float' -> () From: ( | {
         'Category: arithmetic\x7fModuleInfo: Module: float InitialContents: FollowSlot\x7fVisibility: private'
        
         subtractFloat: a = ( |
            | a - asFloat).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'float' -> () From: ( | {
         'Category: arithmetic\x7fComment: _\x7fModuleInfo: Module: float InitialContents: FollowSlot'
        
         subtractSmallInteger: a = ( |
            | a asFloat - asFloat).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'float' -> () From: ( | {
         'Category: coercions\x7fComment: these return floats\x7fModuleInfo: Module: float InitialContents: FollowSlot\x7fVisibility: public'
        
         truncate = ( |
            | asFloat _FloatTruncate).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'float' -> () From: ( | {
         'Category: children\x7fComment: for efficiency (avoid conversions)\x7fModuleInfo: Module: float InitialContents: FollowSlot\x7fVisibility: public'
        
         two = 2.0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'float' -> () From: ( | {
         'Category: children\x7fComment: for efficiency (avoid conversions)\x7fModuleInfo: Module: float InitialContents: FollowSlot\x7fVisibility: public'
        
         zero = 0.0.
        } | ) 



 '-- Side effects'

 globals modules float postFileIn
