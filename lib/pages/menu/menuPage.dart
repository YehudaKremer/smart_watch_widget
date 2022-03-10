import 'dart:io';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:provider/provider.dart';
import 'package:smart_watch_widget/pages/alarmClock/alarmClockPage.dart';
import 'package:smart_watch_widget/pages/home/layout.dart';
import 'package:smart_watch_widget/state/alarmClockState.dart';
import 'package:window_manager/window_manager.dart';
import 'menuItem.dart';

class Menu extends StatelessWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int numberOfActiveAlarms = context
        .watch<AlarmClockState>()
        .alarms
        .where((alarm) => alarm.isActive)
        .length;

    return Layout(
      child: GridView.count(
        primary: false,
        padding: const EdgeInsets.all(30),
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        crossAxisCount: 3,
        children: [
          MenuItem(
            title: 'Go Back',
            icon: FluentIcons.back,
            onPressed: () => Navigator.pop(context),
          ),
          GestureDetector(
            onPanDown: (_) => windowManager.startDragging(),
            child: MenuItem(
              title: 'Move Watch',
              icon: FluentIcons.move,
            ),
          ),
          MenuItem(
            title: 'Close Watch',
            icon: FluentIcons.cancel,
            color: Colors.red,
            onPressed: () => exit(0),
          ),
          //   const InfoBadge(
          //   source: Text('9'),
          // )
          MenuItem(
            title: 'Alarm Clock',
            icon: FluentIcons.alarm_clock,
            onPressed: () => Navigator.push(context,
                FluentPageRoute(builder: (context) => AlarmClockPage())),
            infoBadgeSource: numberOfActiveAlarms > 0
                ? Text(numberOfActiveAlarms.toString())
                : null,
          ),
          // MenuItem(
          //   title: 'Settings',
          //   icon: FluentIcons.settings,
          //   onPressed: () => Navigator.push(
          //       context, FluentPageRoute(builder: (context) => SettingsPage())),
          // ),
        ],
      ),
    );
  }
}
