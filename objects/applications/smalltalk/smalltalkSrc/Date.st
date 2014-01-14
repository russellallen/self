"======================================================================
|
|   Date Method Definitions
|
 ======================================================================"


"======================================================================
|
| Copyright (C) 1990, 1991 Free Software Foundation, Inc.
| Written by Steve Byrne.
|
| This file is part of GNU Smalltalk.
|
| GNU Smalltalk is free software; you can redistribute it and/or modify it
| under the terms of the GNU General Public License as published by the Free
| Software Foundation; either version 1, or (at your option) any later version.
| 
| GNU Smalltalk is distributed in the hope that it will be useful, but WITHOUT
| ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
| FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more
| details.
| 
| You should have received a copy of the GNU General Public License along with
| GNU Smalltalk; see the file COPYING.  If not, write to the Free Software
| Foundation, 675 Mass Ave, Cambridge, MA 02139, USA.  
|
 ======================================================================"


"
Modified by Mario Wolczko, July 1995

$Revision: 30.1 $
"

Magnitude subclass: #Date
	  instanceVariableNames: 'days'
	  classVariableNames: 'DayNameDict MonthNameDict'
	  poolDictionaries: ''
	  category: 'Magnitudes'!

Date comment: 
'My instances represent dates.  My base date is defined to be Jan 1, 1901.
I provide methods for instance creation (including via "symbolic" dates, 
such as "Date newDay: 14 month: #Feb year: 1990"' !

!Date class methodsFor: 'instance creation'!

initialize
    self initDayNameDict.
    self initMonthNameDict
!

initDayNameDict
    | dayNames |
    dayNames := #(
    	    	 (monday mon)	"1"
    	    	 (tuesday tue)	"2"
    	    	 (wednesday wed) "3"
    	    	 (thursday thu) "4"
    	    	 (friday fri)	"5"
    	    	 (saturday sat) "6"
    	    	 (sunday sun)	"7"
    	    	).
    DayNameDict := Dictionary new.
    1 to: dayNames size do:
    	[ :dayIndex | (dayNames at: dayIndex) do:
	    [ :name | DayNameDict at: name put: dayIndex ] ].
!

initMonthNameDict
    | monthNames |
    monthNames := #(
    	    	 (january   jan)	"1"
    	    	 (february  feb)	"2"
    	    	 (march	    mar)    	"3"
    	    	 (april	    apr)    	"4"
    	    	 (may)	    	    	"5"
    	    	 (june	    jun)    	"6"
    	    	 (july	    jul)	"7"
    	    	 (august    aug)	"8"
    	    	 (september sep)	"9"
    	    	 (october   oct)	"10"
    	    	 (november  nov)	"11"
    	    	 (december  dec)	"12"
    	    	).
    MonthNameDict := Dictionary new.
    1 to: monthNames size do:
    	[ :monthIndex | (monthNames at: monthIndex) do:
	    [ :name | MonthNameDict at: name put: monthIndex ] ].
!


dayOfWeek: dayName
    ^DayNameDict at: dayName asLowercase asSymbol
!

nameOfDay: dayIndex
    ^#(Monday Tuesday Wednesday Thursday Friday Saturday Sunday) at: dayIndex
!

indexOfMonth: monthName
    ^MonthNameDict at: monthName asLowercase asSymbol
!

nameOfMonth: monthIndex
    ^#(January February  March
       April   May       June
       July    August    September
       October November  December) at: monthIndex
!

daysInMonth: monthName forYear: yearInteger
    | monthIndex |
    monthIndex := self indexOfMonth: monthName.
    ^self daysInMonthIndex: monthIndex forYear: yearInteger
!

daysInYear: yearInteger
    ^365 + (self leapYear: yearInteger)
!

leapYear: yearInteger
    (yearInteger \\ 4 = 0
    	and: [ yearInteger \\ 100 ~= 0
	    or: [ yearInteger \\ 400 = 0 ] ]) 
    	ifTrue: [ ^1 ]
	ifFalse: [ ^0 ]
!

dateAndTimeNow
    ^Array with: (Date today) with: (Time now)
! !



!Date class methodsFor: 'instance creation'!

today
    | now date |
    now := Time secondClock.
    date := now // (24 * 60 * 60).
    ^self new setDays: date  + 25202 "(69 * 365 + 17)"
!

fromDays: dayCount
    ^self new setDays: dayCount
!

newDay: dayCount year: yearInteger
    ^self new setDays: (dayCount + self yearAsDays: yearInteger)
!

newDay: day month: monthName year: yearInteger
    ^self new setDays:
    	(day + (self daysUntilMonth: monthName year: yearInteger)
    	     + (self yearAsDays: yearInteger))
! !



!Date class methodsFor: 'private'!

yearAsDays: yearInteger
    "Returns the number of days since Jan 1, 1901."
    yearInteger := yearInteger - 1900.
    ^(yearInteger - 1) * 365
    	+ (yearInteger // 4)
	- (yearInteger // 100)
	+ (yearInteger // 400)
!

daysUntilMonth: monthName year: yearInteger
    | monthIndex totalDays |
    totalDays := 0.
    monthIndex := self indexOfMonth: monthName.
    1 to: monthIndex - 1 do:
    	[ :index | totalDays := totalDays + (self daysInMonthIndex: index
	    	    	    	    	         forYear: yearInteger) ].
    ^totalDays
!


daysInMonthIndex: monthIndex forYear: yearInteger
    | days |
    days := #(31 28 31		"Jan Feb Mar"
    	    30 31 30		"Apr May Jun"
	    31 31 30		"Jul Aug Sep"
	    31 30 31		"Oct Nov Dec"
	    ) at: monthIndex.
    monthIndex = 2
    	ifTrue: [ ^days + (self leapYear: yearInteger) ]
	ifFalse: [ ^days ]

! !


!Date methodsFor: 'arithmetic'!

addDays: dayCount
    days := days + dayCount
!

subtractDays: dayCount
    days := days - dayCount
!

subtractDate: aDate
    ^days - aDate days
! !



!Date methodsFor: 'printing'!

printOn: aStream
    self computeDateParts:
        [ :year :month :day |
	    day printOn: aStream.
   	    aStream nextPut: $-.
	    ((Date nameOfMonth: month) copyFrom: 1 to: 3) printOn: aStream.
   	    aStream nextPut: $-.
	    year \\ 100 printOn: aStream ]
! !



!Date methodsFor: 'storing'!

storeOn: aStream
    "Won't work past around 1200 years in the future"
    aStream nextPut: $(.
    aStream nextPutAll: self classNameString.
    self computeDateParts:
    	[ :year :month :day |
	    aStream nextPutAll: ' newDay: '.
	    day storeOn: aStream.
	    aStream nextPutAll: ' month: '.
    	    (Date nameOfMonth: month) storeOn: aStream.
	    aStream nextPutAll: ' year: '.
	    year storeOn: aStream ].
    aStream nextPut: $)
! !



!Date methodsFor: 'private'!

days
    ^days
!

setDays: dayCount
    days := dayCount
!

computeDateParts: aBlock
    | yearInteger tempDays monthIndex daysInMonth |
    tempDays := days - (days // 1460) "4*365"
    	    	    + (days // 36500) "100*365"
		    - (days // 146000). "400*365"
    yearInteger := tempDays // 365.
    "The +1 below makes tempDays be 1 based, instead of 0 based, so that the
     first day is 1 Jan 1901 instead of 0 jan 1901"
    tempDays := days - (yearInteger * 365)
		    - (yearInteger // 4)
		    + (yearInteger // 100)
		    - (yearInteger // 400)
		    + 1.
    yearInteger := yearInteger + 1901.
    monthIndex := 1.
    [ monthIndex < 12
    	and: [ daysInMonth := Date daysInMonthIndex: monthIndex
	    	    	    	  forYear: yearInteger.
    	       tempDays > daysInMonth ] ] whileTrue:
    	[ monthIndex := monthIndex + 1.
	  tempDays := tempDays - daysInMonth ].
    ^aBlock value: yearInteger value: monthIndex value: tempDays
! !

