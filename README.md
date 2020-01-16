
## Jalali/Shamsi Calendar  Datepicker and TimePicker
Calendar , Datepicker and Date Convertor For Persian Date(Jalali/Shamsi date) with holiday for Android and Ios

Based on Material  Flutter DatePicker And TimePicker


![](https://github.com/irdeveloper89/jalali_calendar/blob/master/screenshots/screenshots.gif)

## Usage 

## Import this line in Flutter pubspec
```dart
jalali_calendar: <Last Version>
```
## To  Use Calendar Or DatePicker  , Import this line to your dart file 
```dart
import 'package:jalali_calendar/jalali_calendar.dart';
```
## To  Use date Convertor , Import this line to your dart file 
```dart
import 'package:persian_date/persian_date.dart';
```

After import library,  to show the calendar you can use jalaliCalendarPicker() constructor method , on the constructor `context` is important
if you want to return the selected date to Gregorian, on the constructor set the convertToGregorian to true 

## This sample return the selected date as Jalali(شمسی) 
```dart
Future _selectDate() async {
    String picked = await jalaliCalendarPicker(context: context); // نمایش خروجی به صورت شمسی
   //  await jalaliCalendarPicker(context: context,convertToGregorian: true); // نمایش خروجی به صورت میلادی
    if (picked != null) setState(() => _value =picked.toString());
    print(_value);
  }
```

## This sample return the selected date as Gregorian(میلادی) 
```dart
Future _selectDate() async {
    String picked = await jalaliCalendarPicker(context: context,convertToGregorian: true); // نمایش خروجی به صورت میلادی
    if (picked != null) setState(() => _value =picked.toString());
    print(_value);
  }
```

## Those parameters using  To Show the TimePicker

|   Parameter    |            operation                           |
|:--------------:|:----------------------------------------------:|
| showTimePicker | To show TimePicker set it true                 |
| hore24Format   | To return time in 24 hours format set it true  |
| initialTime    | To set initial time use it with TimeOfDay      |



## To use datePicker you can follow this sample


To show DatePicker those parameters is required
```dart
minYear // min date this required  for the start year in Jalali
maxYear // max  date this required  for the last year in jalali
confirm and cancel // widget for show text
_format // for returning date like String _format = 'yyyy-mm-dd';
onChanged // return date when the user changes the date
onConfirm //  return date when the user click confirm
```

For set, default date use those parameters
```dart
initialYear => for year
initialMonth => for month
initialDay => for day
```
## Full datePicker Sample
```dart
    DatePicker.showDatePicker(
      context,
      minYear: 1300,
      maxYear: 1450,
      confirm: Text(
        'Confirm',
        style: TextStyle(color: Colors.red),
      ),
      cancel: Text(
        'Cancel',
        style: TextStyle(color: Colors.cyan),
      ),
      dateFormat: _format,
      onChanged: (year, month, day) {
        if (!showTitleActions) {
          _changeDatetime(year, month, day);
        }
      },
      onConfirm: (year, month, day) {
        _changeDatetime(year, month, day);
        _valuePiker = " Full date : $_datetime  \n year : $year \n  Month  :   $month \n  day :  $day";
      }
    )

 void _changeDatetime(int year, int month, int day) {
    setState(() {
      _datetime = '$year-$month-$day';
    });
  }

```


## To use date Convertor you can follow this sample

first import this library to your code
```dart
import 'package:persian_date/persian_date.dart';
```

## Full Date Convertor Sample
```dart
PersianDate pDate = PersianDate(gregorian: "1989-01-29");
    print("Now ${pDate.getDate}");
    
    PersianDate persianDate = PersianDate();
    print("Now ${persianDate.now}");
    print(persianDate.hour);
    print("year ${persianDate.year}");
    print("isHoliday ${persianDate.isHoliday}");
    print("isHoliday ${persianDate.weekdayname}");
    print(persianDate.monthname); // نام ماه
      print(persianDate.month); // ماه
      print(persianDate.day); // روز
      print(persianDate.hour);// ساعت
      print(persianDate.minute);// دقیقه
      print(persianDate.second);// ثانیه
      print(persianDate.millisecond); // میلی ثانیه
      print(persianDate.microsecond);//


print("Parse Gregorian To Jalali ${persianDate.gregorianToJalali("2019-02-20T00:19:54.000Z","yyyy-m-d hh:nn")}"); 
print("Parse Jalali To Gregorian ${persianDate.jalaliToGregorian("1368-05-30 19:54", "yyyy-m-d hh:nn")}"); 
```

## those formats are supported in date converter
```dart
   `"2012-02-27 13:27:00"`
    `"2012-02-27 13:27:00.123456z"`
    `"2012-02-27 13:27:00,123456z"`
    `"20120227 13:27:00"`
    `"20120227T132700"`
    `"20120227"`
    `"+20120227"`
    `"2012-02-27T14Z"`
    `"2012-02-27T14+00:00"`
    `"-123450101 00:00:00 Z"`: in the year -12345.
    `"2002-02-27T14:00:00-0500"`: Same as `"2002-02-27T19:00:00Z"`
```


| Format |            operation            | Format |            operation            |
|:------:|:-------------------------------:|:------:|:-------------------------------:|
| yyyy   | return year with Four number    | hh     | hours with  two number          |
| yy     | return year with two number     | h      | hours with one number           |
| mm     | return month with two number    | HH     | hours with  two number in 24    |
| m      | return month with one number    | H      | hours with one number in 24     |
| MM     | the month name with full letter | nn     | minut with two number           |
| M      | the month name with short form  | n      | minut with one number           |
| dd     | the day with two number         | ss     | Second with two number          |
| d      | the day with one number         | s      | Second with one number          |
| w      | week number                     | SS     | show milliSecond                |
| DD     | the day name with full letter   | S      | show milliSecond                |
| D      | the day name with  short form   | uuu    | show microsecond                |
| am     | Show time in short              | u      | show microsecond                |
| AM     | Show full time                  |   .    |          .                      |


## bug report
Contact me if you have any problems with this library or have any suggestion [tracker]:j.zobeidi89@gmail.com

