import 'package:fluent_ui/fluent_ui.dart';
import 'package:provider/provider.dart';
import 'package:smart_watch_widget/state/alarmClockState.dart';
import '../animations.dart';
import '../models/alarm.dart';
import '../widgets/layout.dart';
import '../widgets/listItemPadding.dart';
import '../widgets/menuItem.dart';
import '../widgets/alarmClock/alarmClockFrom.dart';
import '../widgets/alarmClock/alarmClockItem.dart';

class AlarmClockPage extends StatelessWidget {
  const AlarmClockPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // List<Widget> children = [
    //   MenuItem(
    //     title: 'Back',
    //     icon: FluentIcons.back,
    //     onPressed: () {
    //       Navigator.pop(context);
    //     },
    //   ),
    //   Container(height: 10),
    // ];

    // context.watch<AlarmClockState>().alarms.forEach((alarm) {
    //   children.addAll([AlarmClockItem(alarm), Container(height: 10)]);
    // });

    // children.add(
    //   MenuItem(
    //     title: 'New Alarm',
    //     icon: FluentIcons.add,
    //     onPressed: () => Navigator.push(
    //       context,
    //       FluentPageRoute(
    //         builder: (context) => AlarmClockFrom(Alarm(date: DateTime.now())),
    //       ),
    //     ),
    //   ),
    // );

    return Layout(
      child: Consumer<AlarmClockState>(
        builder: (context, state, child) {
          final itemCountWithBackAndAddButtons = state.alarms.length + 2;
          return AnimatedList(
            key: state.alarmsAnimatedListKey,
            padding: const EdgeInsets.all(30),
            itemBuilder: (context, index, animation) {
              if (index == 0) {
                return ListItemPadding(
                    child: MenuItem(
                  title: 'Back',
                  icon: FluentIcons.back,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ));
              } else if (index == itemCountWithBackAndAddButtons - 1) {
                return ListItemPadding(
                    child: MenuItem(
                  title: 'New Alarm',
                  icon: FluentIcons.add,
                  onPressed: () => Navigator.push(
                    context,
                    FluentPageRoute(
                      builder: (context) =>
                          AlarmClockFrom(Alarm(date: DateTime.now())),
                    ),
                  ),
                ));
              } else {
                return SizeFadeTransition(
                    animation: animation,
                    child: ListItemPadding(
                      child: AlarmClockItem(state.alarms[index - 1]),
                    ));
              }
            },
            initialItemCount: itemCountWithBackAndAddButtons,
          );
        },
      ),
    );
  }
}

final slideItemTween = Tween<Offset>(
  begin: Offset(0, 10),
  end: Offset(0, 0),
);
