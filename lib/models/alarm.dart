class Alarm {
  DateTime date;
  bool sun;
  bool mon;
  bool tue;
  bool wed;
  bool thu;
  bool fri;
  bool sat;
  bool isActive;
  String? message;

  Alarm({
    required this.date,
    this.sun = false,
    this.mon = false,
    this.tue = false,
    this.wed = false,
    this.thu = false,
    this.fri = false,
    this.sat = false,
    this.isActive = false,
    this.message,
  });

  Map<String, dynamic> toJson() => {
        'date': date.toIso8601String(),
        'sun': sun,
        'mon': mon,
        'tue': tue,
        'wed': wed,
        'thu': thu,
        'fri': fri,
        'sat': sat,
        'isActive': isActive,
        'message': message,
      };

  Alarm.fromJson(Map<String, dynamic> json)
      : date = DateTime.parse(json['date']),
        sun = json['sun'],
        mon = json['mon'],
        tue = json['tue'],
        wed = json['wed'],
        thu = json['thu'],
        fri = json['fri'],
        sat = json['sat'],
        isActive = json['isActive'],
        message = json['message'];

  List<String> get activeDays {
    List<String> activeDays = [];
    if (sun) activeDays.add('Sun');
    if (mon) activeDays.add('Mon');
    if (tue) activeDays.add('Tue');
    if (wed) activeDays.add('Wed');
    if (thu) activeDays.add('Thu');
    if (fri) activeDays.add('Fri');
    if (sat) activeDays.add('Sat');
    return activeDays;
  }
}
