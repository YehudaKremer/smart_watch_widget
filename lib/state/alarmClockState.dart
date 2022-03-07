import 'dart:convert';
import 'dart:math';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:intl/intl.dart';
import 'package:libmpv/libmpv.dart';
import 'package:schedulers/schedulers.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:window_manager/window_manager.dart';

import '../models/alarm.dart';

const alarmsPrefsKey = 'alarms';

class AlarmClockState extends ChangeNotifier {
  final SharedPreferences prefs;
  List<Alarm> _alarms = [];
  List<Alarm> get alarms => _alarms;
  bool isPlayingAlarm = false;
  Player player = Player(video: false, osc: false, yt: false);
  TimeScheduler? scheduler;

  AlarmClockState(this.prefs) {
    player.setPlaylistMode(PlaylistMode.loop);
    _getAlarms();
    _scheduleAlarms();
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

  void addAlarm(Alarm alarm) {
    alarm.isActive = true;
    _alarms.add(alarm);
    _scheduleAlarms();
    _saveAlarms();
    notifyListeners();
  }

  void updateAlarm(Alarm alarm) {
    _scheduleAlarms();
    _saveAlarms();
    notifyListeners();
  }

  void removeAlarm(Alarm alarm) {
    _alarms.remove(alarm);
    _scheduleAlarms();
    _saveAlarms();
    notifyListeners();
  }

  int get numberOfActiveAlarms =>
      _alarms.where((alarm) => alarm.isActive).length;

  void _saveAlarms() {
    prefs.setString(alarmsPrefsKey, jsonEncode(_alarms));
  }

  void _scheduleAlarms() {
    print('_scheduleAlarms');
    scheduler?.dispose();
    scheduler = TimeScheduler();
    var today = DateFormat.E().format(DateTime.now());

    var activeAlarmTimeStampsForToday = _alarms
        .where((alarm) =>
            alarm.isActive &&
            alarm.date.isAfter(DateTime.now()) &&
            (alarm.activeDays.length == 0 ||
                alarm.activeDays.length == 7 ||
                alarm.activeDays.contains(today)))
        .map((alarm) => alarm.date.millisecondsSinceEpoch);

    if (activeAlarmTimeStampsForToday.length > 0) {
      var nextAlarmTimeStampForToday =
          activeAlarmTimeStampsForToday.reduce(min);

      print('nextAlarmTimeStampForToday: $nextAlarmTimeStampForToday');
      var nextAlarmDateForToday =
          DateTime.fromMillisecondsSinceEpoch(nextAlarmTimeStampForToday);
      print('nextAlarmDateForToday: $nextAlarmDateForToday');
      scheduler!
          .run(() => startAlarm(nextAlarmDateForToday), nextAlarmDateForToday);
    }

    var startOfTheNextDay = DateTime.parse(
        DateFormat('yyyy-MM-dd').format(DateTime.now().add(Duration(days: 1))));
    scheduler!.run(() => _scheduleAlarms(), startOfTheNextDay);
  }

  void startAlarm(DateTime alarmDate) {
    windowManager.focus();
    windowManager.setSkipTaskbar(false);
    isPlayingAlarm = true;
    player.open([Media('assets/audio/Twin-bell-alarm-clock.mp3')]);
    scheduler!.run(() => stopAlarm(), alarmDate.add(Duration(minutes: 1)));
    notifyListeners();
  }

  void stopAlarm() {
    if (isPlayingAlarm) {
      player.pause();
      isPlayingAlarm = false;
      windowManager.setSkipTaskbar(true);
      _scheduleAlarms();
      notifyListeners();
    }
  }
}
