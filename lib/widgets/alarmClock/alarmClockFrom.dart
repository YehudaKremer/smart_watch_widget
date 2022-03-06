import 'package:fluent_ui/fluent_ui.dart';
import 'package:provider/provider.dart';
import 'package:smart_watch_widget/widgets/alarmClock/alarmClockState.dart';
import '../basicButton.dart';
import '../layout.dart';
import '../menu/menuItem.dart';
import 'dayToggleButton.dart';

class AlarmClockFrom extends StatefulWidget {
  final Alarm alarm;

  AlarmClockFrom({Key? key, required this.alarm}) : super(key: key);

  @override
  State<AlarmClockFrom> createState() => _AlarmClockFromState();
}

class _AlarmClockFromState extends State<AlarmClockFrom> {
  late Alarm alarm = widget.alarm;

  @override
  Widget build(BuildContext context) {
    bool isNewAlarm = !context.read<AlarmClockState>().alarms.contains(alarm);

    void setAlarmState(Function cb) {
      setState(() {
        cb();
      });
      if (!isNewAlarm) {
        context.read<AlarmClockState>().saveAlarm(alarm);
      }
    }

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
          TimePicker(
            popupHeight: 220,
            selected: alarm.date,
            onChanged: (date) => setAlarmState(() => alarm.date = date),
          ),
          Container(height: 10),
          Row(
            children: [
              isNewAlarm
                  ? BasicButton(
                      title: 'Save',
                      icon: FluentIcons.accept,
                      onPressed: () {
                        context.read<AlarmClockState>().saveAlarm(alarm);
                        Navigator.pop(context);
                      },
                    )
                  : BasicButton(
                      title: 'Delete',
                      icon: FluentIcons.delete,
                      color: Colors.red,
                      onPressed: () {
                        context.read<AlarmClockState>().removeAlarm(alarm);
                        Navigator.pop(context);
                      },
                    ),
            ],
          ),
        ],
      ),
    );
  }
}

class DayToggleButtonState {}
