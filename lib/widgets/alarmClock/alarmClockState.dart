import 'dart:convert';

import 'package:fluent_ui/fluent_ui.dart';
import 'package:shared_preferences/shared_preferences.dart';

const alarmsPrefsKey = 'alarms';

class AlarmClockState extends ChangeNotifier {
  final SharedPreferences prefs;
  List<Alarm> _alarms = [];
  List<Alarm> get alarms => _alarms;

  AlarmClockState(this.prefs) {
    _getAlarms();
  }

  void _getAlarms() {
    final alarmString = prefs.getString(alarmsPrefsKey);
    if (alarmString != null) {
      _alarms = (jsonDecode(alarmString) as List)
          .map((e) => Alarm.fromJson(e))
          .toList()
          .cast<Alarm>();

      notifyListeners();
    }
  }

  void _saveAlarms() {
    prefs.setString(alarmsPrefsKey, jsonEncode(_alarms));
  }

  void saveAlarm(Alarm alarm) {
    if (!_alarms.contains(alarm)) {
      _alarms.add(alarm);
    }
    notifyListeners();
    _saveAlarms();
  }

  void removeAlarm(Alarm alarm) {
    _alarms.remove(alarm);
    notifyListeners();
    _saveAlarms();
  }
}

class Alarm {
  DateTime? date;
  bool sun;
  bool mon;
  bool tue;
  bool wed;
  bool thu;
  bool fri;
  bool sat;
  bool isActive;

  Alarm({
    this.date,
    this.sun = false,
    this.mon = false,
    this.tue = false,
    this.wed = false,
    this.thu = false,
    this.fri = false,
    this.sat = false,
    this.isActive = false,
  }) {
    date = DateTime.now();
  }

  Map<String, dynamic> toJson() => {
        'date': date?.toIso8601String(),
        'sun': sun,
        'mon': mon,
        'tue': tue,
        'wed': wed,
        'thu': thu,
        'fri': fri,
        'sat': sat,
        'isActive': isActive,
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
        isActive = json['isActive'];

  List<String> getActiveDays() {
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
