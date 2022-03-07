import 'dart:convert';

import 'package:fluent_ui/fluent_ui.dart';
import 'package:intl/intl.dart';
import 'package:libmpv/libmpv.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:window_manager/window_manager.dart';

import '../models/alarm.dart';

const alarmsPrefsKey = 'alarms';

class AlarmClockState extends ChangeNotifier {
  final SharedPreferences prefs;
  List<Alarm> _alarms = [];
  List<Alarm> get alarms => _alarms;
  Alarm? playingAlarm;
  Player player = Player(video: false, osc: false, yt: false);

  AlarmClockState(this.prefs) {
    player.setPlaylistMode(PlaylistMode.loop);
    _getAlarms();
    _startAlarmService();
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

  Future<void> _startAlarmService() async {
    while (true) {
      var now = DateTime.now();

      if (playingAlarm == null) {
        var timeNow = DateFormat('kk:mm:ss a').format(now);
        var today = DateFormat.E().format(now);
        _alarms
            .where((alarm) =>
                alarm.isActive &&
                (alarm.activeDays.length == 0 ||
                    alarm.activeDays.length == 7 ||
                    alarm.activeDays.contains(today)))
            .forEach((alarm) {
          var alarmTime = DateFormat('kk:mm:00 a').format(alarm.date);
          if (alarmTime == timeNow) {
            startAlarm(alarm);
            return;
          }
        });
      } else {
        var timeNow = DateFormat('kk:mm').format(now);
        var alarmTime = DateFormat('kk:mm').format(playingAlarm!.date);
        if (timeNow != alarmTime) {
          stopAlarm();
        }
      }

      await Future.delayed(Duration(milliseconds: 750));
    }
  }

  void startAlarm(Alarm alarm) {
    windowManager.focus();
    playingAlarm = alarm;
    player.open([Media('assets/audio/Twin-bell-alarm-clock.mp3')]);
    notifyListeners();
  }

  void stopAlarm() {
    if (playingAlarm != null) {
      player.pause();
      playingAlarm = null;
      notifyListeners();
    }
  }

  void addAlarm(Alarm alarm) {
    alarm.isActive = true;
    _alarms.add(alarm);
    notifyListeners();
    _saveAlarms();
  }

  void updateAlarm(Alarm alarm) {
    notifyListeners();
    _saveAlarms();
  }

  void removeAlarm(Alarm alarm) {
    _alarms.remove(alarm);
    notifyListeners();
    _saveAlarms();
  }

  int get numberOfActiveAlarms =>
      _alarms.where((alarm) => alarm.isActive).length;
}
