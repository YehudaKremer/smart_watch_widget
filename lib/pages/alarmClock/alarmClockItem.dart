import 'package:fluent_ui/fluent_ui.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:smart_watch_widget/pages/alarmClock/alarm.dart';
import 'package:smart_watch_widget/pages/alarmClock/alarmClockState.dart';
import 'package:smart_watch_widget/pages/clockSettings/clockSettingsState.dart';
import 'alarmClockFrom.dart';

class AlarmClockItem extends StatelessWidget {
  final Alarm alarm;

  const AlarmClockItem(this.alarm, {Key? key}) : super(key: key);

  Color subTitleColor(BuildContext context) => alarm.isActive
      ? FluentTheme.of(context).typography.caption!.color!.withOpacity(0.5)
      : FluentTheme.of(context).disabledColor.withOpacity(0.5);

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
                Row(
                  children: [
                    Text(
                      context
                              .read<ClockSettingsState>()
                              .clockSettings
                              .useMilitaryTime
                          ? DateFormat.Hms().format(alarm.date)
                          : DateFormat.jm().format(alarm.date),
                      style: TextStyle(
                        color: alarm.isActive
                            ? FluentTheme.of(context).typography.body!.color
                            : FluentTheme.of(context).disabledColor,
                      ),
                    ),
                    alarm.haveMessage
                        ? Container(
                            margin: EdgeInsets.only(left: 10),
                            child: Tooltip(
                              message: alarm.message,
                              child: Icon(FluentIcons.message_fill,
                                  size: FluentTheme.of(context)
                                      .typography
                                      .caption!
                                      .fontSize,
                                  color: subTitleColor(context)),
                            ),
                          )
                        : Container()
                  ],
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
                            .copyWith(color: subTitleColor(context)),
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
