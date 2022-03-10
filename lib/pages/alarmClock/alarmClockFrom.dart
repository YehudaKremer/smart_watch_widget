import 'package:fluent_ui/fluent_ui.dart';
import 'package:hotkey_manager/hotkey_manager.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:smart_watch_widget/utils/animations.dart';
import 'package:smart_watch_widget/models/alarm.dart';
import 'package:smart_watch_widget/state/alarmClockState.dart';
import 'package:smart_watch_widget/widgets/basicButton.dart';
import 'package:smart_watch_widget/pages/home/layout.dart';
import 'package:smart_watch_widget/pages/menu/menuItem.dart';
import 'alarmMessage.dart';
import 'dayToggleButton.dart';

class AlarmClockFrom extends StatefulWidget {
  final Alarm alarm;

  AlarmClockFrom(
    this.alarm, {
    Key? key,
  }) : super(key: key);

  @override
  State<AlarmClockFrom> createState() => _AlarmClockFromState();
}

class _AlarmClockFromState extends State<AlarmClockFrom> {
  var isAlarmMessageDialogOpen = false;
  late Alarm alarm = widget.alarm;

  @override
  void initState() {
    super.initState();
    registerGeneralHotKeys();
  }

  @override
  void dispose() {
    hotKeyManager.unregister(_alarmClockFromConfirmHotKey);
    super.dispose();
  }

  Future<void> registerGeneralHotKeys() async {
    await hotKeyManager.register(
      _alarmClockFromConfirmHotKey,
      keyDownHandler: (_) {
        print('submitAlarmClockFrom');
        if (!isAlarmMessageDialogOpen) {
          submitAlarmClockFrom();
        }
      },
    );
  }

  bool get isExistedAlarm =>
      context.read<AlarmClockState>().alarms.contains(alarm);

  void submitAlarmClockFrom() {
    if (!isExistedAlarm) {
      context.read<AlarmClockState>().addAlarm(alarm);
    }
    Navigator.pop(context);
  }

  void setAlarmState(Function cb) {
    setState(() => cb());

    if (isExistedAlarm) {
      context.read<AlarmClockState>().updateAlarm(alarm);
    }
  }

  void toggleAlarmMessageDialogOpen() =>
      setAlarmState(() => isAlarmMessageDialogOpen = !isAlarmMessageDialogOpen);

  @override
  Widget build(BuildContext context) {
    return Layout(
      child: Stack(
        children: [
          ListView(
            padding: const EdgeInsets.all(30),
            children: [
              MenuItem(
                title: 'Go Back',
                icon: FluentIcons.back,
                onPressed: () => Navigator.pop(context),
              ),
              Container(height: 10),
              TimePicker(
                popupHeight: 240,
                selected: alarm.date,
                onChanged: (date) => setAlarmState(() => alarm.date =
                    DateTime.parse(
                        DateFormat('yyyy-MM-dd HH:mm:00.000').format(date))),
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
                            Navigator.pop(context);
                          },
                        )
                      : BasicButton(
                          title: 'Save',
                          icon: FluentIcons.accept,
                          onPressed: submitAlarmClockFrom,
                        ),
                  Container(width: 10),
                  BasicButton(
                    title: 'Message',
                    icon: alarm.message == null || alarm.message!.isEmpty
                        ? FluentIcons.message
                        : FluentIcons.message_fill,
                    onPressed: toggleAlarmMessageDialogOpen,
                  ),
                  Container(width: 20),
                ],
              ),
            ],
          ),
          AnimatedSwitcher(
            duration: FluentTheme.of(context).fastAnimationDuration,
            transitionBuilder: (child, animation) => SlideFadeTransition(
              animation: animation,
              child: child,
            ),
            child: isAlarmMessageDialogOpen
                ? AlarmMessage(
                    alarm: alarm, onDismiss: toggleAlarmMessageDialogOpen)
                : Container(),
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
