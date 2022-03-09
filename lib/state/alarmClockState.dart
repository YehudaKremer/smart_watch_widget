import 'dart:convert';
import 'dart:math';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:intl/intl.dart';
import 'package:libmpv/libmpv.dart';
import 'package:provider/provider.dart';
import 'package:schedulers/schedulers.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:window_manager/window_manager.dart';

import '../animations.dart';
import '../models/alarm.dart';
import '../widgets/alarmClock/alarmClockItem.dart';
import '../widgets/listItemPadding.dart';
import 'appState.dart';

const alarmsPrefsKey = 'alarms';

class AlarmClockState extends ChangeNotifier {
  final SharedPreferences _prefs;
  final alarmsAnimatedListKey = GlobalKey<AnimatedListState>();

  List<Alarm> _alarms = [];
  List<Alarm> get alarms => _alarms;
  bool isPlayingAlarm = false;
  Player player = Player(video: false, osc: false, yt: false);
  TimeScheduler? scheduler;

  AlarmClockState(this._prefs) {
    //temp, we should dispose player
    player.setPlaylistMode(PlaylistMode.loop);

    _getAlarms();
    _scheduleAlarms();
  }

  void _getAlarms() {
    final alarmString = _prefs.getString(alarmsPrefsKey);
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
    alarmsAnimatedListKey.currentState!.insertItem(alarms.length);
    _scheduleAlarms();
    _saveAlarms();
    notifyListeners();
  }

  void removeAlarm(Alarm alarm) {
    var itemIndex = _alarms.indexOf(alarm);
    var removedItem = _alarms.removeAt(itemIndex);
    _removeAlarmAnimatedListItem(itemIndex, removedItem);
    _scheduleAlarms();
    _saveAlarms();
    notifyListeners();
  }

  _removeAlarmAnimatedListItem(int itemIndex, Alarm removedItem) {
    alarmsAnimatedListKey.currentState!.removeItem(
      itemIndex + 1,
      (context, animation) => SizeFadeTransition(
        animation: animation,
        child: ListItemPadding(
          child: AlarmClockItem(removedItem),
        ),
      ),
    );
  }

  void updateAlarm(Alarm alarm) {
    _scheduleAlarms();
    _saveAlarms();
    notifyListeners();
  }

  int get numberOfActiveAlarms =>
      _alarms.where((alarm) => alarm.isActive).length;

  void _saveAlarms() {
    _prefs.setString(alarmsPrefsKey, jsonEncode(_alarms));
  }

  void _scheduleAlarms() {
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
      var nextAlarmDateForToday =
          DateTime.fromMillisecondsSinceEpoch(nextAlarmTimeStampForToday);
      scheduler!
          .run(() => startAlarm(nextAlarmDateForToday), nextAlarmDateForToday);
    }

    var startOfTheNextDay = DateTime.parse(
        DateFormat('yyyy-MM-dd').format(DateTime.now().add(Duration(days: 1))));
    scheduler!.run(() => _scheduleAlarms(), startOfTheNextDay);
  }

  void startAlarm(DateTime alarmDate) {
    windowManager.focus().then((_) => windowManager.isFocused().then((focused) {
          if (!focused) {
            windowManager.setSkipTaskbar(false);
          }
        }));

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
