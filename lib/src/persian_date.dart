const String yyyy = 'yyyy'; // 4 عدد سال

const String yy = 'yy'; // 2 عدد سال

const String mm = 'mm'; // 2 عدد ماه اگر ماه تک رقمی باشد 0 در اول ان قرار میدهد

const String m = 'm'; // 1 عدد ماه اگر ماه تک رقمی باشد 0 قرار نمیدهد

const String MM = 'MM'; // ماه به صورت حروفی کامل

const String M = 'M'; // ماه به صورت حروفی کوتاه

const String dd = 'dd'; // روز به صورت 2 عددی

const String d = 'd'; // روز به صورت تک رقمی برای روز های زیر 10

const String w = 'w'; // عدد هفته از ماه را بر میگرداند

const String DD = 'DD'; // نام روز

const String D = 'D'; // نام روز

const String hh =
    'hh'; // ساعت با دو رقم اگر ساعت تک رقمی باشد 0 ابتدای عدد قرار میدهد فرمت 12 ساعته

const String h = 'h'; // ساعت با تک رقم فرمت 12 ساعته

const String HH = 'HH'; // ساعت با 2 رقم فرمت 24 ساعته

const String H = 'H'; // ساعت با تک رقم فرمت 24 ساعته

const String nn = 'nn'; // نمایشه دقیقه به صورت دو رقمی

const String n = 'n'; // نمایشه دقیقه به صورت تک رقمی

const String ss = 'ss'; // نمایش ثانیه دو رقمی

const String s = 's'; // نمایش ثانیه تک رقمی

const String SSS = 'SSS'; // نمایش میلی ثانیه

const String S = 'S'; // نمایش میلی ثانیه

const String uuu = 'uuu'; // نمایش میکرو ثانیه

const String u = 'u'; // نمایش میکرو ثانیه

const String am = 'am'; // نمایش وقت به صورت کوتاه
const String AM = 'AM'; // نمایش وقت به صورت کامل

class PersianDate {
  int _year;
  int _month;
  int _day;
  int _weekday;
  int _hour;
  int _minute;
  int _second;
  int _millisecond;
  int _microsecond;
  String _getDate = '';
  String _getNow = '';

  String _defualtVal = "yyyy-mm-dd hh:nn:ss SSS";

  PersianDate.pDate({String defualtFormat, String gregorian}) {
    var now;

    if (defualtFormat != null) this._defualtVal = defualtFormat;

    if (gregorian != null) {
      now = DateTime.parse(gregorian);
      List list = gregorianToJalali(now.year, now.month, now.day);
      setWeekday = now.weekday;
      this.setYear = list[0];
      this.setMonth = list[1];
      this.setDay = list[2];
      this.setHour = now.hour;
      this.setMinute = now.minute;
      this.setSecond = now.second;
      this.setMicrosecond = now.microsecond;
      this.setMillisecond = now.millisecond;
      _getDate = _toFormat(_defualtVal);
    } else {
      _getDate = _now();
    }
  }

  PersianDate([String format]) {
    if (format != null) _defualtVal = format;

    _getNow = _now();
    _getDate = _now();
  }

  String get getDate => _getDate;

  String get getNow => _getNow;

  String _now() {
    var now = new DateTime.now();
    List list = gregorianToJalali(now.year, now.month, now.day);
    setWeekday = now.weekday;
    this.setYear = list[0];
    this.setMonth = list[1];
    this.setDay = list[2];
    this.setHour = now.hour;
    this.setMinute = now.minute;
    this.setSecond = now.second;
    this.setMicrosecond = now.microsecond;
    this.setMillisecond = now.millisecond;

    return _toFormat(_defualtVal);
  }

  List<String> monthShort = const <String>[
    'فرو',
    'ارد',
    'خرد',
    'تیر',
    'مرد',
    'شهر',
    'مهر',
    'آبا',
    'آذر',
    'دی',
    'بهم',
    'اسفن'
  ];

  List<String> monthLong = const <String>[
    'فروردین',
    'اردیبهشت',
    'خرداد',
    'تیر',
    'مرداد',
    'شهریور',
    'مهر',
    'آبان',
    'آذر',
    'دی',
    'بهمن',
    'اسفند'
  ];

  List<String> dayShort = const [
    'د',
    'س',
    'چ',
    'پ',
    'ج',
    'ش',
    'ی',
  ];

  List<String> dayLong = const [
    'دوشنبه',
    'سه شنبه',
    'چهارشنبه',
    'پنج شنبه',
    'جمعه',
    'شنبه',
    'یکشنبه',
  ];

  var shamsiHoliday = [
    "0101",
    "0102",
    "0103",
    "0104",
    "0112",
    "0113",
    "0314",
    "0315",
    "1122",
    "1229",
  ];

  gregorianToJalali(int y, int m, int d, [String separator]) {
    var sumMonthDay = [0, 31, 59, 90, 120, 151, 181, 212, 243, 273, 304, 334];
    var jY = 0;
    if (y > 1600) {
      jY = 979;
      y -= 1600;
    } else {
      jY = 0;
      y -= 621;
    }
    var gy = (m > 2) ? y + 1 : y;
    var day = (365 * y) +
        ((gy + 3) ~/ 4) -
        ((gy + 99) ~/ 100) +
        ((gy + 399) ~/ 400) -
        80 +
        d +
        sumMonthDay[m - 1];
    jY += 33 * (day.round() / 12053).floor();
    day %= 12053;
    jY += 4 * (day.round() / 1461).floor();
    day %= 1461;
    jY += ((day.round() - 1) / 365).floor();
    if (day > 365) day = ((day - 1).round() % 365);
    int jm;
    var jd;
    int days = day.toInt();
    if (days < 186) {
      jm = 1 + (days ~/ 31);
      jd = 1 + (days % 31);
    } else {
      jm = 7 + ((days - 186) ~/ 30);
      jd = 1 + (days - 186) % 30;
    }
    var persionDate;
    if (separator == null)
      persionDate = [jY, jm, jd];
    else
      persionDate = "$jY$separator$jm$separator$jd";
    return persionDate;
  }

  jalaliToGregorian(int y, int m, int d, [String separator]) {
    int gY;
    if (y > 979) {
      gY = 1600;
      y -= 979;
    } else {
      gY = 621;
    }

    var days = (365 * y) +
        ((y / 33).floor() * 8) +
        (((y % 33) + 3) / 4) +
        78 +
        d +
        (((m < 7) ? (m - 1) * 31 : (((m - 7) * 30) + 186)));
    gY += 400 * (days ~/ 146097);
    days %= 146097;
    if (days.floor() > 36524) {
      gY += 100 * (--days ~/ 36524);
      days %= 36524;
      if (days >= 365) days++;
    }
    gY += 4 * (days ~/ 1461);
    days %= 1461;
    gY += (days - 1) ~/ 365;

    if (days > 365) days = (days - 1) % 365;
    var gD = (days + 1).floor();
    var montDays = [
      0,
      31,
      (((gY % 4 == 0) && (gY % 100 != 0)) || (gY % 400 == 0)) ? 29 : 28,
      31,
      30,
      31,
      30,
      31,
      31,
      30,
      31,
      30,
      31
    ];
    int i = 0;
    for (; i <= 12; i++) {
      if (gD <= montDays[i]) break;
      gD -= montDays[i];
    }
    var gregorianDate;
    if (separator == null)
      gregorianDate = [gY, i, gD];
    else
      gregorianDate = "$gY$separator$i$separator$gD";
    return gregorianDate;
  }

  parse(String formattedString, [String separator]) {
    var parse = DateTime.parse(formattedString);
    if (separator == null) {
      List parseList = gregorianToJalali(parse.year, parse.month, parse.day);
      parseList.add(parse.hour);
      parseList.add(parse.minute);
      parseList.add(parse.second);
      return parseList;
    } else {
      return "${gregorianToJalali(parse.year, parse.month, parse.day, separator)} ${parse.hour}:${parse.minute}:${parse.second}";
    }
  }

  String get weekdayname => dayLong[weekday - 1];

  String get monthname => monthLong[this.month - 1];

  int get year => _year;

  set setYear(int value) {
    _year = value;
  }

  int get month => _month;

  set setMonth(int value) {
    _month = value;
  }

  int get day => _day;

  set setDay(int value) {
    _day = value;
  }

  int get weekday => _weekday;

  set setWeekday(int value) {
    _weekday = value;
  }

  int get hour => _hour;

  set setHour(int value) {
    _hour = value;
  }

  int get minute => _minute;

  bool get isHoliday {
    if (weekday == 5)
      return true;
    else if (shamsiHoliday
            .indexOf("${_digits(this.month, 2)}${_digits(this.day, 2)}") !=
        -1)
      return true;
    else
      return false;
  }

  set setMinute(int value) {
    _minute = value;
  }

  int get second => _second;

  set setSecond(int value) {
    _second = value;
  }

  int get microsecond => _microsecond;

  set setMicrosecond(int value) {
    _microsecond = value;
  }

  int get millisecond => _millisecond;

  set setMillisecond(int value) {
    _millisecond = value;
  }

  _toFormat(String format) {
    String newFormat = format;
    if (newFormat.indexOf(yyyy) != -1)
      newFormat = newFormat.replaceFirst(yyyy, _digits(this.year, 4));
    if (newFormat.indexOf(yy) != -1)
      newFormat = newFormat.replaceFirst(yy, _digits(this.year % 100, 2));
    if (newFormat.indexOf(mm) != -1)
      newFormat = newFormat.replaceFirst(mm, _digits(this.month, 2));
    if (newFormat.indexOf(m) != -1)
      newFormat = newFormat.replaceFirst(m, this.month.toString());
    if (newFormat.indexOf(MM) != -1)
      newFormat = newFormat.replaceFirst(MM, monthLong[this.month - 1]);
    if (newFormat.indexOf(M) != -1)
      newFormat = newFormat.replaceFirst(M, monthShort[this.month - 1]);
    if (newFormat.indexOf(dd) != -1)
      newFormat = newFormat.replaceFirst(dd, _digits(this.day, 2));
    if (newFormat.indexOf(d) != -1)
      newFormat = newFormat.replaceFirst(d, this.day.toString());
    if (newFormat.indexOf(w) != -1)
      newFormat = newFormat.replaceFirst(w, ((this.day + 7) ~/ 7).toString());
    if (newFormat.indexOf(DD) != -1)
      newFormat = newFormat.replaceFirst(DD, dayLong[this.weekday - 1]);
    if (newFormat.indexOf(D) != -1)
      newFormat = newFormat.replaceFirst(D, dayShort[this.weekday - 1]);
    if (newFormat.indexOf(HH) != -1)
      newFormat = newFormat.replaceFirst(HH, _digits(this.hour, 2));
    if (newFormat.indexOf(H) != -1)
      newFormat = newFormat.replaceFirst(H, this.hour.toString());
    if (newFormat.indexOf(hh) != -1)
      newFormat = newFormat.replaceFirst(hh, _digits(this.hour % 12, 2));
    if (newFormat.indexOf(h) != -1)
      newFormat = newFormat.replaceFirst(h, (this.hour % 12).toString());
    if (newFormat.indexOf(AM) != -1)
      newFormat = newFormat.replaceFirst(
          AM, this.hour < 12 ? 'قبل از ظهر' : 'بعد از ظهر');
    if (newFormat.indexOf(am) != -1)
      newFormat = newFormat.replaceFirst(am, this.hour < 12 ? 'ق.ظ' : 'ب.ظ');
    if (newFormat.indexOf(nn) != -1)
      newFormat = newFormat.replaceFirst(nn, _digits(this.minute, 2));
    if (newFormat.indexOf(n) != -1)
      newFormat = newFormat.replaceFirst(n, this.minute.toString());
    if (newFormat.indexOf(ss) != -1)
      newFormat = newFormat.replaceFirst(ss, _digits(this.second, 2));
    if (newFormat.indexOf(s) != -1)
      newFormat = newFormat.replaceFirst(s, this.second.toString());
    if (newFormat.indexOf(SSS) != -1)
      newFormat = newFormat.replaceFirst(SSS, _digits(this.millisecond, 3));
    if (newFormat.indexOf(S) != -1)
      newFormat = newFormat.replaceFirst(S, this.millisecond.toString());
    if (newFormat.indexOf(uuu) != -1)
      newFormat = newFormat.replaceFirst(uuu, _digits(this.microsecond, 2));
    if (newFormat.indexOf(u) != -1)
      newFormat = newFormat.replaceFirst(u, this.microsecond.toString());
    return newFormat;
  }

  parseToFormat(String parseDate, [String format]) {
    var parse = DateTime.parse(parseDate);
    var jParse = gregorianToJalali(parse.year, parse.month, parse.day);
    if (format == null) format = _defualtVal;

    String newFormat = format;

    print(parse.weekday);

    if (newFormat.indexOf(yyyy) != -1)
      newFormat = newFormat.replaceFirst(yyyy, _digits(jParse[0], 4));
    if (newFormat.indexOf(yy) != -1)
      newFormat = newFormat.replaceFirst(yy, _digits(jParse[0] % 100, 2));
    if (newFormat.indexOf(mm) != -1)
      newFormat = newFormat.replaceFirst(mm, _digits(jParse[1], 2));
    if (newFormat.indexOf(m) != -1)
      newFormat = newFormat.replaceFirst(m, jParse[1].toString());
    if (newFormat.indexOf(MM) != -1)
      newFormat = newFormat.replaceFirst(MM, monthLong[jParse[1] - 1]);
    if (newFormat.indexOf(M) != -1)
      newFormat = newFormat.replaceFirst(M, monthShort[jParse[1] - 1]);
    if (newFormat.indexOf(dd) != -1)
      newFormat = newFormat.replaceFirst(dd, jParse[2].toString());
    if (newFormat.indexOf(d) != -1)
      newFormat = newFormat.replaceFirst(d, _digits(jParse[2], 2));
    if (newFormat.indexOf(w) != -1)
      newFormat = newFormat.replaceFirst(w, ((jParse[2] + 7) ~/ 7).toString());
    if (newFormat.indexOf(DD) != -1)
      newFormat = newFormat.replaceFirst(DD, dayLong[parse.weekday - 1]);
    if (newFormat.indexOf(D) != -1)
      newFormat = newFormat.replaceFirst(D, dayShort[parse.weekday - 1]);
    if (newFormat.indexOf(HH) != -1)
      newFormat = newFormat.replaceFirst(HH, _digits(parse.hour, 2));
    if (newFormat.indexOf(H) != -1)
      newFormat = newFormat.replaceFirst(H, parse.hour.toString());
    if (newFormat.indexOf(hh) != -1)
      newFormat = newFormat.replaceFirst(hh, _digits(parse.hour % 12, 2));
    if (newFormat.indexOf(h) != -1)
      newFormat = newFormat.replaceFirst(h, (parse.hour % 12).toString());
    if (newFormat.indexOf(AM) != -1)
      newFormat = newFormat.replaceFirst(
          AM, parse.hour < 12 ? 'قبل از ظهر' : 'بعد از ظهر');
    if (newFormat.indexOf(am) != -1)
      newFormat = newFormat.replaceFirst(am, parse.hour < 12 ? 'ق.ظ' : 'ب.ظ');
    if (newFormat.indexOf(nn) != -1)
      newFormat = newFormat.replaceFirst(nn, _digits(parse.minute, 2));
    if (newFormat.indexOf(n) != -1)
      newFormat = newFormat.replaceFirst(n, parse.minute.toString());
    if (newFormat.indexOf(ss) != -1)
      newFormat = newFormat.replaceFirst(ss, _digits(parse.second, 2));
    if (newFormat.indexOf(s) != -1)
      newFormat = newFormat.replaceFirst(s, parse.second.toString());
    if (newFormat.indexOf(SSS) != -1)
      newFormat = newFormat.replaceFirst(SSS, _digits(parse.millisecond, 3));
    if (newFormat.indexOf(S) != -1)
      newFormat = newFormat.replaceFirst(S, parse.millisecond.toString());
    if (newFormat.indexOf(uuu) != -1)
      newFormat = newFormat.replaceFirst(uuu, _digits(parse.microsecond, 2));
    if (newFormat.indexOf(u) != -1)
      newFormat = newFormat.replaceFirst(u, parse.microsecond.toString());
    return newFormat;
  }

  String _digits(int value, int length) {
    String ret = '$value';
    if (ret.length < length) {
      ret = '0' * (length - ret.length) + ret;
    }
    return ret;
  }
}
