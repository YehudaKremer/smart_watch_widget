import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:intl/intl.dart';
import 'package:libmpv/libmpv.dart';
import 'package:schedulers/schedulers.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:win_toast/win_toast.dart';
import 'package:window_manager/window_manager.dart';
import '../animations.dart';
import '../models/alarm.dart';
import '../widgets/alarmClock/alarmClockItem.dart';
import '../widgets/listItemPadding.dart';

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
    /// for perfect animation we set here the isActive property of the removed item
    if (itemIndex > 0 && alarms.length > 0) {
      removedItem.isActive = alarms[itemIndex - 1].isActive;
    }

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
    String today = DateFormat.E().format(DateTime.now());

    Iterable<Alarm> activeAlarmForToday = _alarms.where((alarm) =>
        alarm.isActive &&
        alarm.date.isAfter(DateTime.now()) &&
        (alarm.activeDays.length == 0 ||
            alarm.activeDays.length == 7 ||
            alarm.activeDays.contains(today)));

    if (activeAlarmForToday.length > 0) {
      int nextAlarmTimeStampForToday = activeAlarmForToday
          .map((alarm) => alarm.date.millisecondsSinceEpoch)
          .reduce(min);
      DateTime nextAlarmDateForToday =
          DateTime.fromMillisecondsSinceEpoch(nextAlarmTimeStampForToday);
      Alarm nextAlarmForToday = activeAlarmForToday
          .firstWhere((alarm) => alarm.date == nextAlarmDateForToday);
      scheduler!
          .run(() => startAlarm(nextAlarmForToday), nextAlarmForToday.date);
    }

    DateTime startOfTheNextDay = DateTime.parse(
        DateFormat('yyyy-MM-dd').format(DateTime.now().add(Duration(days: 1))));
    scheduler!.run(() => _scheduleAlarms(), startOfTheNextDay);
  }

  void startAlarm(Alarm alarm) {
    windowManager.focus().then((_) => windowManager.isFocused().then((focused) {
          if (!focused) windowManager.setSkipTaskbar(false);
        }));

    isPlayingAlarm = true;

    player.open([
      //Media('assets/audio/Twin-bell-alarm-clock.mp3');
      Media(
          '${File(Platform.resolvedExecutable).parent.path}\\data\\flutter_assets\\assets\\audio\\Twin-bell-alarm-clock.mp3')
    ]);

    scheduler!.run(() => stopAlarm(), alarm.date.add(Duration(minutes: 1)));
    _showWindowsToast(alarm);
    notifyListeners();
  }

  void _showWindowsToast(Alarm alarm) {
    WinToast.instance().showToast(
        type: ToastType.text02,
        title: DateFormat.yMMMMEEEEd().format(alarm.date),
        subtitle: alarm.message ?? '');
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
