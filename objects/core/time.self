 'Sun-$Revision: 30.10 $'
 '
Copyright 1992-2014 AUTHORS.
See the legal/LICENSE file for license information and legal/AUTHORS for authors.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: time InitialContents: FollowSlot'
        
         time = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'time' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'time' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules time.

CopyDowns:
globals modules init. copy 
SlotsToOmit: directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'time' -> () From: ( | {
         'ModuleInfo: Module: time InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'core'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'time' -> () From: ( | {
         'ModuleInfo: Module: time InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'time' -> () From: ( | {
         'ModuleInfo: Module: time InitialContents: FollowSlot'
        
         myComment <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'time' -> () From: ( | {
         'ModuleInfo: Module: time InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- 'Sun-$Revision: 30.10 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'time' -> () From: ( | {
         'ModuleInfo: Module: time InitialContents: FollowSlot\x7fVisibility: public'
        
         subpartNames <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: system\x7fCategory: time\x7fModuleInfo: Module: time InitialContents: FollowSlot\x7fVisibility: public'
        
         time = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'time' -> () From: ( |
             {} = 'Comment: days and msecs since 1/1/70 0:00:00 GMT\x7fModuleInfo: Creator: globals time.
\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'time' -> () From: ( | {
         'Comment: Non-nil when valid.\x7fModuleInfo: Module: time InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         dateTime0 <- bootstrap stub -> 'globals' -> 'nil' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'time' -> () From: ( | {
         'Comment: days since 1/1/70 0:00:00 GMT\x7fModuleInfo: Module: time InitialContents: InitializeToExpression: (8073)\x7fVisibility: private'
        
         day0 <- 8073.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'time' -> () From: ( | {
         'Comment: msecs since 0:00:00 GMT\x7fModuleInfo: Module: time InitialContents: InitializeToExpression: (28800000)\x7fVisibility: private'
        
         msec0 <- 28800000.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: system\x7fModuleInfo: Module: time InitialContents: FollowSlot\x7fVisibility: public'
        
         time = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'time' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits time.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'time' -> () From: ( | {
         'ModuleInfo: Module: time InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'time' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: system\x7fCategory: time\x7fModuleInfo: Module: time InitialContents: FollowSlot\x7fVisibility: public'
        
         times = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'times' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals times.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'times' -> () From: ( | {
         'Comment: cpu time (user + system) used by Self\x7fModuleInfo: Module: time InitialContents: FollowSlot\x7fVisibility: public'
        
         cpu = ( |
            | _TimeCPU).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'times' -> () From: ( | {
         'Comment: wait ms milliseconds\x7fModuleInfo: Module: time InitialContents: FollowSlot\x7fVisibility: public'
        
         delay: ms = ( |
            | process this sleep: ms max: 0).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'times' -> () From: ( | {
         'ModuleInfo: Module: time InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'oddball' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'times' -> () From: ( | {
         'ModuleInfo: Module: time InitialContents: FollowSlot\x7fVisibility: public'
        
         real = ( |
            | time current).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'times' -> () From: ( | {
         'Comment: system time in msec used by Self\x7fModuleInfo: Module: time InitialContents: FollowSlot\x7fVisibility: public'
        
         system = ( |
            | _TimeSystem).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'times' -> () From: ( | {
         'Comment: user time in msec used by Self\x7fModuleInfo: Module: time InitialContents: FollowSlot\x7fVisibility: public'
        
         user = ( |
            | _TimeUser).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'time' -> () From: ( | {
         'Category: arithmetic\x7fModuleInfo: Module: time InitialContents: FollowSlot\x7fVisibility: public'
        
         + x = ( |
            | x addTime: self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'time' -> () From: ( | {
         'Category: arithmetic\x7fModuleInfo: Module: time InitialContents: FollowSlot\x7fVisibility: public'
        
         - x = ( |
            | x subtractTime: self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'time' -> () From: ( | {
         'Category: comparing\x7fModuleInfo: Module: time InitialContents: FollowSlot\x7fVisibility: public'
        
         < t = ( |
            | 
            day compare: t day 
                IfLess: true 
                Equal: [msec < t msec] 
                Greater: false).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'time' -> () From: ( | {
         'Category: comparing\x7fModuleInfo: Module: time InitialContents: FollowSlot\x7fVisibility: public'
        
         = t = ( |
            | (day =  t day)  &&  [msec =  t msec]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'time' -> () From: ( | {
         'Category: arithmetic\x7fComment: returns a time\x7fModuleInfo: Module: time InitialContents: FollowSlot\x7fVisibility: private'
        
         addMsec: ms = ( |
            | copyDay: day Msec: msec + ms).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'time' -> () From: ( | {
         'Category: arithmetic\x7fComment: Error: can\'t add times\x7fModuleInfo: Module: time InitialContents: FollowSlot\x7fVisibility: private'
        
         addTime: t = ( |
            | error: 'adding two times is not defined').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'time' -> () From: ( | {
         'Category: printing\x7fCategory: local time\x7fModuleInfo: Module: time InitialContents: FollowSlot\x7fVisibility: public'
        
         compactPrintString = ( |
            | 
            (shortWeekdayNames at: weekday), ' ', 
            (shortMonthNames   at: month),  ' ',
            (date   printStringPadWith0ToSize: 2), ' ',
            (hour   printStringPadWith0ToSize: 2), ':',
            (minute printStringPadWith0ToSize: 2), ':',
            (second printStringPadWith0ToSize: 2), ' ',
            "This is not perfect. Here should go PDT/PST or similar string."
            year printString).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'time' -> () From: ( | {
         'Category: comparing\x7fModuleInfo: Module: time InitialContents: FollowSlot\x7fVisibility: public'
        
         compare: t IfLess: lb Equal: eb Greater: gb = ( |
            | 
            day compare: t day
                 IfLess: lb
                  Equal: [ msec compare: t msec
                                 IfLess: lb
                                  Equal: eb
                                Greater: gb ]
                Greater: gb).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'time' -> () From: ( | {
         'Category: creating\x7fModuleInfo: Module: time InitialContents: FollowSlot\x7fVisibility: private'
        
         convertToDayMs: v IfFail: errBlk = ( |
            | v _ConvertToDayMsIfFail: errBlk).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'time' -> () From: ( | {
         'Category: creating\x7fModuleInfo: Module: time InitialContents: FollowSlot\x7fVisibility: public'
        
         copyDay: d Msec: m = ( |
            | 
            resend.copy initDay: d Msec: m).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'time' -> () From: ( | {
         'Category: parsing\x7fComment: Parse the string according to the printString format\x7fModuleInfo: Module: time InitialContents: FollowSlot\x7fVisibility: public'
        
         copyFromString: s = ( |
            | copyFromString: s IfFail: raiseError).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'time' -> () From: ( | {
         'Category: parsing\x7fModuleInfo: Module: time InitialContents: FollowSlot\x7fVisibility: public'
        
         copyFromString: s IfFail: fb = ( |
            | 
            [|:eosBlk. :errBlk. str. t <- ''.  m. yr. mo. date. hr. min. sec. wd |
                str: (parsingStream copy init: s).
                t: (str getTokenIfEOS: eosBlk). "Get weekday"
                wd: weekdayNames findFirst: [|:e| t = e]
                                 IfPresent: [|:e. :i| i ]
                                  IfAbsent: [^ errBlk value: 'unknown weekday: ', t].
                t: (str getTokenIfEOS: eosBlk). "Get date"
                date: (t asIntegerIfFail: [^ errBlk value: 'could not convert date: ', t]).
                t: (str getTokenIfEOS: eosBlk). "Get month"
                mo: (monthNames findFirst: [|:e| t = e]
                                IfPresent: [|:e. :i| i ]
                                IfAbsent: [^ errBlk value: 'unknown month: ', t]).
                t: (str getTokenIfEOS: eosBlk). "Get year"
                yr: (t asIntegerIfFail: [^ errBlk value: 'could not convert yr: ', t]).
                t: (str getTokenIfEOS: eosBlk). "Get hour"
                hr: (t asIntegerIfFail: [^ errBlk value: 'could not convert hr: ', t]).
                t: (str getTokenIfEOS: eosBlk). "Get minutes"
                min: (t asIntegerIfFail: [^ errBlk value: 'could not convert min: ', t]).
                t: (str getTokenIfEOS: eosBlk). "Get seconds"
                sec: (t asIntegerIfFail: [^ errBlk value: 'could not convert sec: ', t]).
                str eos ifFalse: [^ errBlk value: 'unexpected stuff at end' ].
                copyYear: yr Month: mo Date: date Hours: hr Minutes: min Seconds: sec
                  IfFail: errBlk
            ] value: [|:e| ^ fb value: 'time parser: unexpected end of stream']
               With: [|:e| ^ fb value: e]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'time' -> () From: ( | {
         'Category: creating\x7fModuleInfo: Module: time InitialContents: FollowSlot\x7fVisibility: public'
        
         copyMsec: ms = ( |
            | copyDay: 0 Msec: ms).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'time' -> () From: ( | {
         'Category: creating\x7fModuleInfo: Module: time InitialContents: FollowSlot\x7fVisibility: public'
        
         copyYear: yr Month: mo Date: date Hours: hr Minutes: min Seconds: sec = ( |
            | 
            copyYear: yr Month: mo Date: date Hours: hr Minutes: min Seconds: sec IfFail: raiseError).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'time' -> () From: ( | {
         'Category: creating\x7fModuleInfo: Module: time InitialContents: FollowSlot\x7fVisibility: public'
        
         copyYear: yr Month: mo Date: date Hours: hr Minutes: min Seconds: sec IfFail: fb = ( |
             dayAndMs <- ((bootstrap stub -> 'globals') \/-> 'vector') -> ().
             t <- ''.
             v <- ((bootstrap stub -> 'globals') \/-> 'vector') -> ().
            | 

            v: (vector copySize: 8).

            v at: 0 Put: yr.
            v at: 1 Put: mo. "1-origin"
            v at: 2 Put: date.
            v at: 3 Put: 1. "weekday"
            v at: 4 Put: hr.
            v at: 5 Put: min.
            v at: 6 Put: sec.
            v at: 7 Put: -1.  "Daylight savings specification."

            dayAndMs: (convertToDayMs: v IfFail: [|:e|
                ^ fb value: 'failed to convert time: ', e.
            ]).
            copyDay: (dayAndMs at: 0) Msec: (dayAndMs at: 1)).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'time' -> () From: ( | {
         'Category: creating\x7fModuleInfo: Module: time InitialContents: FollowSlot\x7fVisibility: public'
        
         current = ( | {
                 'ModuleInfo: Module: time InitialContents: FollowSlot'
                
                 ct.
                } 
            | 
            ct: currentTime.
            copyDay: (ct at: 0) Msec: ct at: 1).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'time' -> () From: ( | {
         'Category: creating\x7fModuleInfo: Module: time InitialContents: FollowSlot\x7fVisibility: private'
        
         currentTime = ( |
            | _TimeReal).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'time' -> () From: ( | {
         'Category: components\x7fCategory: local time\x7fModuleInfo: Module: time InitialContents: FollowSlot\x7fVisibility: public'
        
         date = ( |
            | dateTime at: 2).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'time' -> () From: ( | {
         'Category: components\x7fCategory: GMT\x7fModuleInfo: Module: time InitialContents: FollowSlot\x7fVisibility: public'
        
         dateGMT = ( |
            | dateTime at: 11).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'time' -> () From: ( | {
         'Category: printing\x7fCategory: local time\x7fModuleInfo: Module: time InitialContents: FollowSlot\x7fVisibility: public'
        
         dateString = ( |
            | 
            weekdayName, ', ', date printString, ' ',
            monthName,   ' ',  year printString).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'time' -> () From: ( | {
         'Category: components\x7fCategory: GMT\x7fCategory: primary representation\x7fModuleInfo: Module: time InitialContents: FollowSlot\x7fVisibility: private'
        
         dateTime = ( |
            | 
            dateTime0 ifNil: [ 
                "Has been invalidated (or was never set), so set it now."
                dateTime0: (day _DateTime: msec).
            ].
            dateTime0).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'time' -> () From: ( | {
         'Category: components\x7fCategory: GMT\x7fCategory: primary representation\x7fModuleInfo: Module: time InitialContents: FollowSlot\x7fVisibility: public'
        
         day = ( |
            | day0).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'time' -> () From: ( | {
         'Category: components\x7fCategory: local time\x7fModuleInfo: Module: time InitialContents: FollowSlot\x7fVisibility: public'
        
         daylightSavingsTimeIfOn: onBlk IfOff: offBlk IfUnknown: unknownBlk = ( |
            | 
            0 compare: (dateTime at: 8) IfLess: onBlk
                                         Equal: offBlk
                                       Greater: unknownBlk).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'time' -> () From: ( | {
         'Category: comparing\x7fModuleInfo: Module: time InitialContents: FollowSlot\x7fVisibility: public'
        
         hash = ( |
            | msec hash).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'time' -> () From: ( | {
         'Category: components\x7fCategory: local time\x7fModuleInfo: Module: time InitialContents: FollowSlot\x7fVisibility: public'
        
         hour = ( |
            | dateTime at: 4).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'time' -> () From: ( | {
         'Category: components\x7fCategory: GMT\x7fModuleInfo: Module: time InitialContents: FollowSlot\x7fVisibility: public'
        
         hourGMT = ( |
            | dateTime at: 13).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'time' -> () From: ( | {
         'Category: creating\x7fModuleInfo: Module: time InitialContents: FollowSlot\x7fVisibility: private'
        
         initDay: d Msec: m = ( |
            | 
            dateTime0: nil.   "Invalidate."
            day0: d.
            msec0: m.
            msec0 >= msecPerDay ifTrue: [
                day0: (day0 + (msec0 / msecPerDay)).
                msec0: (msec0 % msecPerDay).
            ] False: [
                0 > msec0 ifTrue: [
                    day0: (day0 + ((msec0 / msecPerDay) - 1)).
                    msec0: (msec0 % msecPerDay).
                ].
            ].
            "Avoid bigInt's, else the '_DateTime:' primitive complains."
            msec0: msec0 asSmallInteger.
            day0:  day0  asSmallInteger.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'time' -> () From: ( | {
         'Category: printing\x7fCategory: local time\x7fModuleInfo: Module: time InitialContents: FollowSlot\x7fVisibility: public'
        
         meridianTimeString = ( |
             ampm <- 'am'.
             h.
            | 
            h: hour.
            case if: [h = 0] Then: [h: 12. ampm: 'am']
                 If: [h = 12] Then: [ampm: 'pm']
                 If: [h > 12] Then: [ampm: 'pm'.  h: h - 12].
            h printString, ':',
            (minute printStringBase: 10 PadWith: '0'  ToSize: 2 ), ':',
            (second printStringBase: 10 PadWith: '0'  ToSize: 2 ),
            ' ', ampm).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'time' -> () From: ( | {
         'Category: components\x7fCategory: local time\x7fModuleInfo: Module: time InitialContents: FollowSlot\x7fVisibility: public'
        
         minute = ( |
            | dateTime at: 5).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'time' -> () From: ( | {
         'Category: components\x7fCategory: GMT\x7fModuleInfo: Module: time InitialContents: FollowSlot\x7fVisibility: public'
        
         minuteGMT = ( |
            | dateTime at: 14).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'time' -> () From: ( | {
         'Category: printing\x7fCategory: local time\x7fModuleInfo: Module: time InitialContents: FollowSlot\x7fVisibility: public'
        
         mmddyyString = ( |
            | 
            month printString,
            '/',
            date printString,
            '/',
            (year printString copyFrom: 2)).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'time' -> () From: ( | {
         'Category: components\x7fCategory: local time\x7fModuleInfo: Module: time InitialContents: FollowSlot\x7fVisibility: public'
        
         month = ( |
            | dateTime at: 1).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'time' -> () From: ( | {
         'Category: components\x7fCategory: GMT\x7fModuleInfo: Module: time InitialContents: FollowSlot\x7fVisibility: public'
        
         monthGMT = ( |
            | dateTime at: 10).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'time' -> () From: ( | {
         'Category: components\x7fCategory: local time\x7fModuleInfo: Module: time InitialContents: FollowSlot\x7fVisibility: public'
        
         monthName = ( |
            | monthNames   at: month).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'time' -> () From: ( | {
         'Category: components\x7fCategory: day and month names\x7fModuleInfo: Module: time InitialContents: FollowSlot\x7fVisibility: public'
        
         monthNames = [ | x =  ( bootstrap setObjectAnnotationOf: vector _Clone From: ( |
                     {} = 'ModuleInfo: Creator: traits time monthNames.
'.
                    | ) ) _Clone: 13 Filler: 0| 
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
             x] value.
        } | ) 

 ((bootstrap stub -> 'traits' -> 'time') \/-> 'monthNames') -> () _At: 0 Put: (
     'not a month')

 ((bootstrap stub -> 'traits' -> 'time') \/-> 'monthNames') -> () _At: 1 Put: (
     'January')

 ((bootstrap stub -> 'traits' -> 'time') \/-> 'monthNames') -> () _At: 10 Put: (
     'October')

 ((bootstrap stub -> 'traits' -> 'time') \/-> 'monthNames') -> () _At: 11 Put: (
     'November')

 ((bootstrap stub -> 'traits' -> 'time') \/-> 'monthNames') -> () _At: 12 Put: (
     'December')

 ((bootstrap stub -> 'traits' -> 'time') \/-> 'monthNames') -> () _At: 2 Put: (
     'February')

 ((bootstrap stub -> 'traits' -> 'time') \/-> 'monthNames') -> () _At: 3 Put: (
     'March')

 ((bootstrap stub -> 'traits' -> 'time') \/-> 'monthNames') -> () _At: 4 Put: (
     'April')

 ((bootstrap stub -> 'traits' -> 'time') \/-> 'monthNames') -> () _At: 5 Put: (
     'May')

 ((bootstrap stub -> 'traits' -> 'time') \/-> 'monthNames') -> () _At: 6 Put: (
     'June')

 ((bootstrap stub -> 'traits' -> 'time') \/-> 'monthNames') -> () _At: 7 Put: (
     'July')

 ((bootstrap stub -> 'traits' -> 'time') \/-> 'monthNames') -> () _At: 8 Put: (
     'August')

 ((bootstrap stub -> 'traits' -> 'time') \/-> 'monthNames') -> () _At: 9 Put: (
     'September')

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'time' -> () From: ( | {
         'Category: components\x7fCategory: GMT\x7fCategory: primary representation\x7fModuleInfo: Module: time InitialContents: FollowSlot\x7fVisibility: public'
        
         msec = ( |
            | msec0).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'time' -> () From: ( | {
         'Category: arithmetic\x7fModuleInfo: Module: time InitialContents: InitializeToExpression: (24 * 60 * 60 * 1000)\x7fVisibility: public'
        
         msecPerDay = 24 * 60 * 60 * 1000.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'time' -> () From: ( | {
         'Category: creating\x7fModuleInfo: Module: time InitialContents: FollowSlot\x7fVisibility: public'
        
         origin = ( |
            | copyDay: 0 Msec: 0).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'time' -> () From: ( | {
         'ModuleInfo: Module: time InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'orderedClonable' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'time' -> () From: ( | {
         'Category: parsing\x7fModuleInfo: Module: time InitialContents: FollowSlot\x7fVisibility: private'
        
         parsingStream = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'time' -> 'parsingStream' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits time parsingStream.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'time' -> 'parsingStream' -> () From: ( | {
         'ModuleInfo: Module: time InitialContents: FollowSlot\x7fVisibility: private'
        
         bos = ( |
            | ', :' includes: str at: len).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'time' -> 'parsingStream' -> () From: ( | {
         'ModuleInfo: Module: time InitialContents: FollowSlot\x7fVisibility: public'
        
         eos = ( |
            | str size <= len).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'time' -> 'parsingStream' -> () From: ( | {
         'ModuleInfo: Module: time InitialContents: FollowSlot\x7fVisibility: private'
        
         get = ( |
            | len: len succ. str at: len pred).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'time' -> 'parsingStream' -> () From: ( | {
         'ModuleInfo: Module: time InitialContents: FollowSlot\x7fVisibility: public'
        
         getToken = ( |
             t <- ''.
            | 
            [eos || [bos]    ] whileFalse: [t: t, get]. "parse token"
            [eos || [bos not]] whileFalse: [get].       "remove separator"
            t).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'time' -> 'parsingStream' -> () From: ( | {
         'ModuleInfo: Module: time InitialContents: FollowSlot\x7fVisibility: public'
        
         getTokenIfEOS: eosBlk = ( |
            | 
            eos ifTrue: eosBlk
                 False: [getToken]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'time' -> 'parsingStream' -> () From: ( | {
         'ModuleInfo: Module: time InitialContents: FollowSlot\x7fVisibility: public'
        
         init: s = ( |
            | str: s. len: 0).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'time' -> 'parsingStream' -> () From: ( | {
         'ModuleInfo: Module: time InitialContents: FollowSlot\x7fVisibility: private'
        
         len <- 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'time' -> 'parsingStream' -> () From: ( | {
         'ModuleInfo: Module: time InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'clonable' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'time' -> 'parsingStream' -> () From: ( | {
         'ModuleInfo: Module: time InitialContents: FollowSlot\x7fVisibility: private'
        
         str <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'time' -> () From: ( | {
         'Category: printing\x7fCategory: local time\x7fModuleInfo: Module: time InitialContents: FollowSlot\x7fVisibility: public'
        
         printString = ( |
            | 
            dateString, ', ', timeString).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'time' -> () From: ( | {
         'Category: printing\x7fCategory: GMT\x7fComment: PrintString in internet GMT format.\x7fModuleInfo: Module: time InitialContents: FollowSlot\x7fVisibility: public'
        
         printStringGMT = ( |
            | 
            dateGMT printString, ' ', (shortMonthNames at: monthGMT), ' ', 
            yearGMT printString, ' ', timeStringGMT).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'time' -> () From: ( | {
         'Category: components\x7fCategory: local time\x7fModuleInfo: Module: time InitialContents: FollowSlot\x7fVisibility: public'
        
         second = ( |
            | dateTime at: 6).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'time' -> () From: ( | {
         'Category: components\x7fCategory: GMT\x7fModuleInfo: Module: time InitialContents: FollowSlot\x7fVisibility: public'
        
         secondGMT = ( |
            | dateTime at: 15).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'time' -> () From: ( | {
         'Category: components\x7fCategory: day and month names\x7fModuleInfo: Module: time InitialContents: FollowSlot\x7fVisibility: public'
        
         shortMonthNames = [ | x =  ( bootstrap setObjectAnnotationOf: vector _Clone From: ( |
                     {} = 'ModuleInfo: Creator: traits time shortMonthNames.
'.
                    | ) ) _Clone: 13 Filler: 0| 
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
             x] value.
        } | ) 

 ((bootstrap stub -> 'traits' -> 'time') \/-> 'shortMonthNames') -> () _At: 0 Put: (
     'not a month')

 ((bootstrap stub -> 'traits' -> 'time') \/-> 'shortMonthNames') -> () _At: 1 Put: (
     'Jan')

 ((bootstrap stub -> 'traits' -> 'time') \/-> 'shortMonthNames') -> () _At: 10 Put: (
     'Oct')

 ((bootstrap stub -> 'traits' -> 'time') \/-> 'shortMonthNames') -> () _At: 11 Put: (
     'Nov')

 ((bootstrap stub -> 'traits' -> 'time') \/-> 'shortMonthNames') -> () _At: 12 Put: (
     'Dec')

 ((bootstrap stub -> 'traits' -> 'time') \/-> 'shortMonthNames') -> () _At: 2 Put: (
     'Feb')

 ((bootstrap stub -> 'traits' -> 'time') \/-> 'shortMonthNames') -> () _At: 3 Put: (
     'Mar')

 ((bootstrap stub -> 'traits' -> 'time') \/-> 'shortMonthNames') -> () _At: 4 Put: (
     'Apr')

 ((bootstrap stub -> 'traits' -> 'time') \/-> 'shortMonthNames') -> () _At: 5 Put: (
     'May')

 ((bootstrap stub -> 'traits' -> 'time') \/-> 'shortMonthNames') -> () _At: 6 Put: (
     'Jun')

 ((bootstrap stub -> 'traits' -> 'time') \/-> 'shortMonthNames') -> () _At: 7 Put: (
     'Jul')

 ((bootstrap stub -> 'traits' -> 'time') \/-> 'shortMonthNames') -> () _At: 8 Put: (
     'Aug')

 ((bootstrap stub -> 'traits' -> 'time') \/-> 'shortMonthNames') -> () _At: 9 Put: (
     'Sep')

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'time' -> () From: ( | {
         'Category: components\x7fCategory: day and month names\x7fModuleInfo: Module: time InitialContents: FollowSlot\x7fVisibility: public'
        
         shortWeekdayNames = [ | x =  ( bootstrap setObjectAnnotationOf: vector _Clone From: ( |
                     {} = 'ModuleInfo: Creator: traits time shortWeekdayNames.
'.
                    | ) ) _Clone: 7 Filler: 0| 
             x _At: 0  Put: ().
             x _At: 1  Put: ().
             x _At: 2  Put: ().
             x _At: 3  Put: ().
             x _At: 4  Put: ().
             x _At: 5  Put: ().
             x _At: 6  Put: ().
             x] value.
        } | ) 

 ((bootstrap stub -> 'traits' -> 'time') \/-> 'shortWeekdayNames') -> () _At: 0 Put: (
     'Sun')

 ((bootstrap stub -> 'traits' -> 'time') \/-> 'shortWeekdayNames') -> () _At: 1 Put: (
     'Mon')

 ((bootstrap stub -> 'traits' -> 'time') \/-> 'shortWeekdayNames') -> () _At: 2 Put: (
     'Tue')

 ((bootstrap stub -> 'traits' -> 'time') \/-> 'shortWeekdayNames') -> () _At: 3 Put: (
     'Wen')

 ((bootstrap stub -> 'traits' -> 'time') \/-> 'shortWeekdayNames') -> () _At: 4 Put: (
     'Thu')

 ((bootstrap stub -> 'traits' -> 'time') \/-> 'shortWeekdayNames') -> () _At: 5 Put: (
     'Fri')

 ((bootstrap stub -> 'traits' -> 'time') \/-> 'shortWeekdayNames') -> () _At: 6 Put: (
     'Sat')

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'time' -> () From: ( | {
         'Category: fileout\x7fModuleInfo: Module: time InitialContents: FollowSlot\x7fVisibility: public'
        
         storeStringIfFail: fb = ( |
            | 
            'time copyFromString: ', printString canonicalize storeString).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'time' -> () From: ( | {
         'Category: fileout\x7fModuleInfo: Module: time InitialContents: FollowSlot\x7fVisibility: public'
        
         storeStringNeeds = ( |
            | time).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'time' -> () From: ( | {
         'Category: arithmetic\x7fComment: returns a time\x7fModuleInfo: Module: time InitialContents: FollowSlot\x7fVisibility: private'
        
         subtractMsec: ms = ( |
            | copyDay: day Msec: msec - ms).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'time' -> () From: ( | {
         'Category: arithmetic\x7fComment: subtractTime does (t - self); returns msec\x7fModuleInfo: Module: time InitialContents: FollowSlot\x7fVisibility: private'
        
         subtractTime: t = ( |
            | 
            ((t day - day) * msecPerDay) + (t msec - msec)).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'time' -> () From: ( | {
         'Category: printing\x7fCategory: local time\x7fModuleInfo: Module: time InitialContents: FollowSlot\x7fVisibility: public'
        
         timeString = ( |
            | 
            hour printString, ':',
            (minute printStringPadWith0ToSize: 2 ), ':',
            (second printStringPadWith0ToSize: 2 )).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'time' -> () From: ( | {
         'Category: printing\x7fCategory: GMT\x7fModuleInfo: Module: time InitialContents: FollowSlot\x7fVisibility: public'
        
         timeStringGMT = ( |
            | 
            (hourGMT   printStringPadWith0ToSize: 2), ':',
            (minuteGMT printStringPadWith0ToSize: 2 ), ':',
            (secondGMT printStringPadWith0ToSize: 2 ), ' GMT').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'time' -> () From: ( | {
         'Category: components\x7fCategory: local time\x7fModuleInfo: Module: time InitialContents: FollowSlot\x7fVisibility: public'
        
         weekday = ( |
            | dateTime at: 3).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'time' -> () From: ( | {
         'Category: components\x7fCategory: GMT\x7fModuleInfo: Module: time InitialContents: FollowSlot\x7fVisibility: public'
        
         weekdayGMT = ( |
            | dateTime at: 12).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'time' -> () From: ( | {
         'Category: components\x7fCategory: local time\x7fModuleInfo: Module: time InitialContents: FollowSlot\x7fVisibility: public'
        
         weekdayName = ( |
            | weekdayNames at: weekday).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'time' -> () From: ( | {
         'Category: components\x7fCategory: day and month names\x7fModuleInfo: Module: time InitialContents: FollowSlot\x7fVisibility: public'
        
         weekdayNames = [ | x =  ( bootstrap setObjectAnnotationOf: vector _Clone From: ( |
                     {} = 'ModuleInfo: Creator: traits time weekdayNames.
'.
                    | ) ) _Clone: 7 Filler: 0| 
             x _At: 0  Put: ().
             x _At: 1  Put: ().
             x _At: 2  Put: ().
             x _At: 3  Put: ().
             x _At: 4  Put: ().
             x _At: 5  Put: ().
             x _At: 6  Put: ().
             x] value.
        } | ) 

 ((bootstrap stub -> 'traits' -> 'time') \/-> 'weekdayNames') -> () _At: 0 Put: (
     'Sunday')

 ((bootstrap stub -> 'traits' -> 'time') \/-> 'weekdayNames') -> () _At: 1 Put: (
     'Monday')

 ((bootstrap stub -> 'traits' -> 'time') \/-> 'weekdayNames') -> () _At: 2 Put: (
     'Tuesday')

 ((bootstrap stub -> 'traits' -> 'time') \/-> 'weekdayNames') -> () _At: 3 Put: (
     'Wednesday')

 ((bootstrap stub -> 'traits' -> 'time') \/-> 'weekdayNames') -> () _At: 4 Put: (
     'Thursday')

 ((bootstrap stub -> 'traits' -> 'time') \/-> 'weekdayNames') -> () _At: 5 Put: (
     'Friday')

 ((bootstrap stub -> 'traits' -> 'time') \/-> 'weekdayNames') -> () _At: 6 Put: (
     'Saturday')

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'time' -> () From: ( | {
         'Category: components\x7fCategory: local time\x7fModuleInfo: Module: time InitialContents: FollowSlot\x7fVisibility: public'
        
         year = ( |
            | dateTime at: 0).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'time' -> () From: ( | {
         'Category: components\x7fCategory: GMT\x7fModuleInfo: Module: time InitialContents: FollowSlot\x7fVisibility: public'
        
         yearGMT = ( |
            | dateTime at: 9).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'time' -> () From: ( | {
         'Category: components\x7fCategory: local time\x7fComment: Number of days since beginning of year (January 1st = 0).\x7fModuleInfo: Module: time InitialContents: FollowSlot\x7fVisibility: public'
        
         yearday = ( |
            | dateTime at: 7).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'time' -> () From: ( | {
         'Category: components\x7fCategory: GMT\x7fComment: Number of days since beginning of year (January 1st = 0).\x7fModuleInfo: Module: time InitialContents: FollowSlot\x7fVisibility: public'
        
         yeardayGMT = ( |
            | dateTime at: 16).
        } | ) 



 '-- Side effects'

 globals modules time postFileIn
