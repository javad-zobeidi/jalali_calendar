# Persian_DateWith_Calendar_And_Date_Picker

مبدل تاریخ هجری شمسی همراه با تقویم شمسی و  Date Picker شمسی 
و همراه با تعطیلات رسمی برای شمسی برای فلاتر
## پیاده سازی

برای درک بهتر به نمونه کد مراجعه نمایید.

```dart

import 'package:jalali_calendar/persian_date.dart';

// جهت استفاده از تقویم از متد زیر استفاده نماید.
Future _selectDate() async {
    String picked =
        await jalaliCalendarPicker(context: context);
    if (picked != null) setState(() => _value =picked.toString());
  }
  
  

// نمایش و استفاده از Date Picker
DatePicker.showDatePicker();
// این دو مورد الزامی می باشند
// minYear: 1300 // تاریخ شروع
// maxYear: 1450 // تاریخ اتمام

/*
در صورتی که میخواهید تاریخ مورد نظر نمایش داده شود این سه مورد وارد شوند در غییر این صورت تاریخ فعلی انتخاب خواهد شد.
    int initialYear,
    int initialMonth,
    int initialDate,


دکمه های تایید و لغو
Widget cancel
Widget confirm
    ویجت Text باشند
    
   متد های باز گشتی   
   
   DateChangedCallback onChanged, زمانی که دیتا پیکر تغییر کند برگشت داده میشود
   DateChangedCallback onConfirm, زمانی که تایید میشود برگشت داده میشوند
       
     
     
        
 */

// استفاده از مبدل شمسی

PersianDate persianDate = PersianDate("yyyy/mm/dd  \n DD  , d  MM  ");
یا

PersianDate persianDate = PersianDate();

persianDate.getNow // تاریخ فعلی

PersianDate date = PersianDate.pDate(gregorian: "1989-08-18"); // برگشت تاریخ مشخص

date.getDate 

// برگرداندن یک تاریخ خاص از سال میلادی
    var Gdate = new DateTime(1989,08,21);
    print("${date.parse(Gdate.toString(),"/")}"); // اگر جدا کننده قرار داده نشود به صورت یک لیست بر میگرداند
    print("${date.parse(Gdate.toString())}"); // 
  
  // با فرمت دلخواه
  print("${date.parseToFormat(Gdate.toString())}");
  print("${date.parseToFormat(Gdate.toString(),"yyyy-m-dd h:n:ss")}");
  
     // تبدیل تاریخ شمسی به میلادی اگر جدا کننده نداشته باشه به صورت یک لیست بر میگرداند
print(date.jalaliToGregorian(1397, 09, 12));

  // مواردی که میتوانید با فراخوانی دریافت کنید.
  print(date.isHoliday); // روز تعطیل است یا خیر
  print(date.weekdayname); // نام روز
  print(date.monthname); // نام ماه
    print(date.year); // سال 
    print(date.month); // ماه
    print(date.day); // روز
    print(date.hour);// ساعت
    print(date.minute);// دقیقه
    print(date.second);// ثانیه
    print(date.millisecond); // میلی ثانیه
    print(date.microsecond);// میکرو ثانیه
```


کلید فرمت های که میتوانید استفاده کنید

yyyy // 4 عدد سال

yy // 2 عدد سال

mm // 2 عدد ماه اگر ماه تک رقمی باشد 0 در اول ان قرار میدهد

m // 1 عدد ماه اگر ماه تک رقمی باشد 0 قرار نمیدهد

MM // ماه به صورت حروفی کامل

M // ماه به صورت حروفی کوتاه

dd // روز به صورت 2 عددی

d // روز به صورت تک رقمی برای روز های زیر 10

w // عدد هفته از ماه را بر میگرداند

DD // نام روز

D // نام روز

hh // ساعت با دو رقم اگر ساعت تک رقمی باشد 0 ابتدای عدد قرار میدهد فرمت 12 ساعته

h // ساعت با تک رقم فرمت 12 ساعته 

HH // ساعت با 2 رقم فرمت 24 ساعته 

H // ساعت با تک رقم فرمت 24 ساعته

nn // نمایشه دقیقه به صورت دو رقمی

n // نمایشه دقیقه به صورت تک رقمی

ss // نمایش ثانیه دو رقمی

s  // نمایش ثانیه تک رقمی

SSS // نمایش میلی ثانیه

S // نمایش میلی ثانیه

uuu // نمایش میکرو ثانیه

u // نمایش میکرو ثانیه

am // نمایش وقت به صورت کوتاه 

AM // نمایش وقت به صورت کامل


## گزارش اشکال

در صورت وجود هر گونه مشکل از طریق ایمیل زیر با ما در میان بگذارید[j.zobeidi89@gmail.com][tracker].

[tracker]: mailto:j.zobeidi89@gmail.com
