import 'package:fluent_ui/fluent_ui.dart';
import 'package:provider/provider.dart';
import 'package:smart_watch_widget/app_state.dart';
import 'package:smart_watch_widget/utils/animations.dart';
import 'package:smart_watch_widget/pages/alarmClock/alarm.dart';
import 'package:smart_watch_widget/pages/alarmClock/alarm_clock_from.dart';
import 'package:smart_watch_widget/pages/alarmClock/alarm_clock_item.dart';
import 'package:smart_watch_widget/pages/alarmClock/alarm_clock_state.dart';
import 'package:smart_watch_widget/pages/home/layout.dart';
import 'package:smart_watch_widget/utils/navigator.dart';
import 'package:smart_watch_widget/widgets/list_item_padding.dart';
import 'package:smart_watch_widget/pages/menu/watch_menu_item.dart';

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
                    child: WatchMenuItem(
                  title: 'Back',
                  icon: FluentIcons.back,
                  onPressed: () {
                    navigatorPop(context);
                  },
                ));
              } else if (index == itemCountWithBackAndAddButtons - 1) {
                return ListItemPadding(
                    child: WatchMenuItem(
                  title: 'New Alarm',
                  icon: FluentIcons.add,
                  onPressed: () => Navigator.push(
                    context,
                    FluentPageRoute(
                      builder: (context) {
                        var alarm = Alarm(
                            date:
                                DateTime.now().add(const Duration(minutes: 1)));
                        return AlarmClockFrom(alarm);
                      },
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
  begin: const Offset(0, 10),
  end: const Offset(0, 0),
);
