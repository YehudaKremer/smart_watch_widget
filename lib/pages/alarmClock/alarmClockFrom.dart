import 'package:fluent_ui/fluent_ui.dart';
import 'package:hotkey_manager/hotkey_manager.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:smart_watch_widget/models/alarm.dart';
import 'package:smart_watch_widget/state/alarmClockState.dart';
import 'package:smart_watch_widget/widgets/basicButton.dart';
import 'package:smart_watch_widget/pages/home/layout.dart';
import 'package:smart_watch_widget/pages/menu/menuItem.dart';
import 'alarmMessageDialog.dart';
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
  late Alarm alarm = widget.alarm;
  bool isMessageDialogOpen = false;

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
    Navigator.pop(context);
  }

  void setAlarmState(Function cb) {
    setState(() => cb());

    if (isExistedAlarm) {
      context.read<AlarmClockState>().updateAlarm(alarm);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Layout(
      child: ListView(
        padding: const EdgeInsets.all(30),
        children: [
          MenuItem(
            title: 'Go Back',
            icon: FluentIcons.back,
            onPressed: () => Navigator.pop(context),
          ),
          Container(height: 10),
          Button(
            style: ButtonStyle(
              padding: ButtonState.all(EdgeInsets.all(0)),
            ),
            child: TimePicker(
              popupHeight: 240,
              selected: alarm.date,
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
                icon: alarm.haveMessage
                    ? FluentIcons.message_fill
                    : FluentIcons.message,
                color: alarm.haveMessage
                    ? FluentTheme.of(context).accentColor
                    : FluentTheme.of(context).typography.body!.color,
                onPressed: () async {
                  isMessageDialogOpen = true;
                  final message = await showDialog<String>(
                    context: context,
                    barrierColor: Colors.transparent,
                    builder: (BuildContext context) =>
                        AlarmMessageDialog(message: alarm.message ?? ''),
                  );
                  isMessageDialogOpen = false;
                  if (message != null) {
                    setAlarmState(() => alarm.message = message);
                  }
                },
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
