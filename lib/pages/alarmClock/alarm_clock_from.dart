import 'package:fluent_ui/fluent_ui.dart';
import 'package:hotkey_manager/hotkey_manager.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:smart_watch_widget/pages/alarmClock/alarm.dart';
import 'package:smart_watch_widget/pages/alarmClock/alarm_clock_state.dart';
import 'package:smart_watch_widget/app_state.dart';
import 'package:smart_watch_widget/pages/clockSettings/clock_settings_state.dart';
import 'package:smart_watch_widget/utils/navigator.dart';
import 'package:smart_watch_widget/widgets/basic_button.dart';
import 'package:smart_watch_widget/pages/home/layout.dart';
import 'package:smart_watch_widget/pages/menu/watch_menu_item.dart';
import 'alarm_message_dialog.dart';
import 'day_toggle_button.dart';

class AlarmClockFrom extends StatefulWidget {
  final Alarm alarm;

  const AlarmClockFrom(
    this.alarm, {
    Key? key,
  }) : super(key: key);

  @override
  State<AlarmClockFrom> createState() => _AlarmClockFromState();
}

class _AlarmClockFromState extends State<AlarmClockFrom> {
  late Alarm alarm = widget.alarm;
  bool isMessageDialogOpen = false;

  @override
  void initState() {
    super.initState();
    registerGeneralHotKeys();

    /// reset the seconds and milliseconds in the DateTime
    alarm.date =
        DateTime.parse(DateFormat('yyyy-MM-dd HH:mm').format(alarm.date));
  }

  @override
  void dispose() {
    hotKeyManager.unregister(_alarmClockFromConfirmHotKey);
    super.dispose();
  }

  Future<void> registerGeneralHotKeys() async {
    await hotKeyManager.register(
      _alarmClockFromConfirmHotKey,
      keyDownHandler: (_) => submitAlarmClockFrom(),
    );
  }

  bool get isExistedAlarm =>
      context.read<AlarmClockState>().alarms.contains(alarm);

  void submitAlarmClockFrom() {
    if (isMessageDialogOpen) {
      return;
    }

    if (!isExistedAlarm) {
      context.read<AlarmClockState>().addAlarm(alarm);
    }
    navigatorPop(context);
  }

  void setAlarmState(Function cb) {
    setState(() => cb());

    if (isExistedAlarm) {
      context.read<AlarmClockState>().updateAlarm(alarm);
    }
  }

  @override
  Widget build(BuildContext context) {
    var watchSize = context.read<AppState>().watchSize;
    return Layout(
      child: ListView(
        padding: EdgeInsets.all(context.read<AppState>().watchSize / 10),
        children: [
          WatchMenuItem(
            title: 'Go Back',
            icon: FluentIcons.back,
            onPressed: () => navigatorPop(context),
          ),
          Container(height: 10),
          Button(
            style: ButtonStyle(
              padding: ButtonState.all(const EdgeInsets.all(0)),
            ),
            child: TimePicker(
              popupHeight: watchSize <= 400 ? watchSize - 1 : 390,
              selected: alarm.date,
              hourFormat: context
                      .read<ClockSettingsState>()
                      .clockSettings
                      .useMilitaryTime
                  ? HourFormat.HH
                  : HourFormat.h,
              onChanged: (date) => setAlarmState(() => alarm.date =
                  DateTime.parse(
                      DateFormat('yyyy-MM-dd HH:mm:00.000').format(date))),
            ),
            onPressed: () {},
          ),
          Container(height: 10),
          Wrap(
            spacing: 10,
            runSpacing: 4,
            alignment: WrapAlignment.center,
            children: [
              DayToggleButton(
                day: 'Sun',
                selected: alarm.sun,
                onToggle: (v) => setAlarmState(() => alarm.sun = v),
              ),
              DayToggleButton(
                day: 'Mon',
                selected: alarm.mon,
                onToggle: (v) => setAlarmState(() => alarm.mon = v),
              ),
              DayToggleButton(
                day: 'Tue',
                selected: alarm.tue,
                onToggle: (v) => setAlarmState(() => alarm.tue = v),
              ),
              DayToggleButton(
                day: 'Wed',
                selected: alarm.wed,
                onToggle: (v) => setAlarmState(() => alarm.wed = v),
              ),
              DayToggleButton(
                day: 'Thu',
                selected: alarm.thu,
                onToggle: (v) => setAlarmState(() => alarm.thu = v),
              ),
              DayToggleButton(
                day: 'Fri',
                selected: alarm.fri,
                onToggle: (v) => setAlarmState(() => alarm.fri = v),
              ),
              DayToggleButton(
                day: 'Sat',
                selected: alarm.sat,
                onToggle: (v) => setAlarmState(() => alarm.sat = v),
              ),
            ],
          ),
          Container(height: 10),
          Row(
            children: [
              Container(width: 20),
              isExistedAlarm
                  ? BasicButton(
                      title: 'Delete',
                      icon: FluentIcons.delete,
                      color: Colors.red,
                      onPressed: () {
                        context.read<AlarmClockState>().removeAlarm(alarm);
                        navigatorPop(context);
                      },
                    )
                  : BasicButton(
                      color: Colors.green,
                      title: 'Save',
                      icon: FluentIcons.save,
                      onPressed: submitAlarmClockFrom,
                    ),
              Container(width: 10),
              Expanded(
                child: Tooltip(
                  message: 'Alarm Message',
                  child: Button(
                    child: Center(
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Icon(
                            alarm.haveMessage
                                ? FluentIcons.message_fill
                                : FluentIcons.message,
                            color: alarm.haveMessage
                                ? FluentTheme.of(context).accentColor
                                : FluentTheme.of(context)
                                    .typography
                                    .body!
                                    .color,
                            size: FluentTheme.of(context)
                                .typography
                                .subtitle!
                                .fontSize,
                          ),
                          alarm.readMessage
                              ? Positioned(
                                  top: 2.5,
                                  child: Icon(
                                    FluentIcons.speech,
                                    color: FluentTheme.of(context)
                                        .scaffoldBackgroundColor,
                                    size: FluentTheme.of(context)
                                            .typography
                                            .subtitle!
                                            .fontSize! /
                                        2,
                                  ),
                                )
                              : Container(),
                        ],
                      ),
                    ),
                    onPressed: () async {
                      isMessageDialogOpen = true;
                      await showDialog<String>(
                        context: context,
                        barrierColor: Colors.transparent,
                        builder: (BuildContext context) => AlarmMessageDialog(
                            alarm: alarm, isExistedAlarm: isExistedAlarm),
                      );
                      isMessageDialogOpen = false;
                      setAlarmState(() {});
                    },
                  ),
                ),
              ),
              Container(width: 20),
            ],
          ),
        ],
      ),
    );
  }
}

HotKey _alarmClockFromConfirmHotKey = HotKey(
  KeyCode.enter,
  scope: HotKeyScope.inapp,
);
