import 'package:fluent_ui/fluent_ui.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:smart_watch_widget/state/alarmClockState.dart';

import '../../animations.dart';
import '../../models/alarm.dart';
import 'alarmClockFrom.dart';

class AlarmClockItem extends StatelessWidget {
  final Alarm alarm;

  const AlarmClockItem(this.alarm, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Button(
      style: ButtonStyle(
        textStyle:
            ButtonState.all(FluentTheme.of(context).typography.bodyLarge),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AnimatedSwitcher(
            duration: FluentTheme.of(context).fasterAnimationDuration,
            transitionBuilder: (child, animation) => FadeTransition(
              opacity: animation,
              child: child,
            ),
            child: Column(
              key: Key('column-alarm-is-active-${alarm.isActive}'),
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  DateFormat.jm().format(alarm.date),
                  style: TextStyle(
                    color: alarm.isActive
                        ? FluentTheme.of(context).activeColor
                        : FluentTheme.of(context).disabledColor,
                  ),
                ),
                alarm.activeDays.isNotEmpty
                    ? Text(
                        alarm.activeDays
                            .map((day) => alarm.activeDays.length > 4
                                ? day.substring(0, 1)
                                : day)
                            .join(', '),
                        style: FluentTheme.of(context)
                            .typography
                            .caption!
                            .copyWith(
                              color: alarm.isActive
                                  ? FluentTheme.of(context)
                                      .typography
                                      .caption!
                                      .color!
                                      .withOpacity(0.5)
                                  : FluentTheme.of(context)
                                      .disabledColor
                                      .withOpacity(0.5),
                            ),
                      )
                    : Container(),
              ],
            ),
          ),
          ToggleSwitch(
            checked: alarm.isActive,
            onChanged: (v) {
              alarm.isActive = v;
              context.read<AlarmClockState>().updateAlarm(alarm);
            },
          ),
        ],
      ),
      onPressed: () => Navigator.push(context,
          FluentPageRoute(builder: (context) => AlarmClockFrom(alarm))),
    );
  }
}
