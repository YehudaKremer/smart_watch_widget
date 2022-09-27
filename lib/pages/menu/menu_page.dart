import 'dart:io';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:provider/provider.dart';
import 'package:smart_watch_widget/pages/alarmClock/alarm_clock_page.dart';
import 'package:smart_watch_widget/pages/home/layout.dart';
import 'package:smart_watch_widget/pages/settings_page.dart';
import 'package:smart_watch_widget/pages/alarmClock/alarm_clock_state.dart';
import 'package:smart_watch_widget/app_state.dart';
import 'package:smart_watch_widget/utils/navigator.dart';
import 'package:window_manager/window_manager.dart';
import '../timer.dart';
import '../watchBackground/watch_background_menu.dart';
import 'wallpaper_menu.dart';
import 'watch_menu_item.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({Key? key}) : super(key: key);

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
        padding: EdgeInsets.all(context.read<AppState>().watchSize / 10),
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        crossAxisCount: 3,
        children: [
          WatchMenuItem(
            title: 'Go Back',
            icon: FluentIcons.back,
            onPressed: () => navigatorPop(context),
          ),
          GestureDetector(
            onPanDown: (_) => windowManager.startDragging(),
            child: const WatchMenuItem(
              title: 'Move Watch',
              icon: FluentIcons.move,
            ),
          ),
          WatchMenuItem(
            title: 'Close Watch',
            icon: FluentIcons.cancel,
            color: Colors.red,
            onPressed: () => exit(0),
          ),
          WatchMenuItem(
            title: 'Alarm Clock',
            icon: FluentIcons.alarm_clock,
            onPressed: () => Navigator.push(context,
                FluentPageRoute(builder: (_) => const AlarmClockPage())),
            infoBadgeSource: numberOfActiveAlarms > 0
                ? Text(numberOfActiveAlarms.toString())
                : null,
          ),
          WatchMenuItem(
            title: 'Timer',
            icon: FluentIcons.timer,
            onPressed: () => Navigator.push(
                context, FluentPageRoute(builder: (_) => const Timer())),
            infoBadgeSource: numberOfActiveAlarms > 0
                ? Text(numberOfActiveAlarms.toString())
                : null,
          ),
          WatchMenuItem(
            title: 'Wallpaper',
            icon: FluentIcons.picture_fill,
            onPressed: () => Navigator.push(context,
                FluentPageRoute(builder: (context) => const WallpaperMenu())),
          ),
          WatchMenuItem(
            title: 'Settings',
            icon: FluentIcons.settings,
            onPressed: () => Navigator.push(
                context, FluentPageRoute(builder: (_) => const SettingsPage())),
          ),
        ],
      ),
    );
  }
}
