import 'package:fluent_ui/fluent_ui.dart';
import 'package:provider/provider.dart';
import 'package:smart_watch_widget/appState.dart';
import 'package:smart_watch_widget/utils/animations.dart';
import 'package:smart_watch_widget/models/alarm.dart';
import 'package:smart_watch_widget/pages/alarmClock/alarmClockFrom.dart';
import 'package:smart_watch_widget/pages/alarmClock/alarmClockItem.dart';
import 'package:smart_watch_widget/pages/alarmClock/alarmClockState.dart';
import 'package:smart_watch_widget/pages/home/layout.dart';
import 'package:smart_watch_widget/utils/navigator.dart';
import 'package:smart_watch_widget/widgets/listItemPadding.dart';
import 'package:smart_watch_widget/pages/menu/menuItem.dart';

class AlarmClockPage extends StatelessWidget {
  const AlarmClockPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Layout(
      child: Consumer<AlarmClockState>(
        builder: (context, state, child) {
          final itemCountWithBackAndAddButtons = state.alarms.length + 2;
          return AnimatedList(
            key: state.alarmsAnimatedListKey,
            padding: EdgeInsets.all(context.read<AppState>().watchSize / 10),
            itemBuilder: (context, index, animation) {
              if (index == 0) {
                return ListItemPadding(
                    child: MenuItem(
                  title: 'Back',
                  icon: FluentIcons.back,
                  onPressed: () {
                    navigatorPop(context);
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
