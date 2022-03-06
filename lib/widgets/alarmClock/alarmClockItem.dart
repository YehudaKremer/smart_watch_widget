import 'package:fluent_ui/fluent_ui.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:smart_watch_widget/widgets/alarmClock/alarmClockState.dart';

import 'alarmClockFrom.dart';

class AlarmClockItem extends StatelessWidget {
  final Alarm alarm;

  const AlarmClockItem({Key? key, required this.alarm}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var activeDays = alarm.getActiveDays();

    return Button(
      style: ButtonStyle(
        textStyle:
            ButtonState.all(FluentTheme.of(context).typography.bodyLarge),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(DateFormat.jm().format(alarm.date!)),
              activeDays.isNotEmpty
                  ? Text(
                      activeDays
                          .map((day) =>
                              activeDays.length > 4 ? day.substring(0, 1) : day)
                          .join(', '),
                      style:
                          FluentTheme.of(context).typography.caption!.copyWith(
                                color: FluentTheme.of(context)
                                    .typography
                                    .caption!
                                    .color!
                                    .withOpacity(0.5),
                              ),
                    )
                  : Container(),
            ],
          ),
          ToggleSwitch(
            checked: alarm.isActive,
            onChanged: (v) {
              alarm.isActive = v;
              context.read<AlarmClockState>().saveAlarm(alarm);
            },
          ),
        ],
      ),
      onPressed: () => Navigator.push(context,
          FluentPageRoute(builder: (context) => AlarmClockFrom(alarm: alarm))),
    );
  }
}
