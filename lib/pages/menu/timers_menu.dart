import 'package:dio/dio.dart';
import 'dart:ui' as ui;
import 'package:fluent_ui/fluent_ui.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:smart_watch_widget/pages/home/layout.dart';
import 'package:smart_watch_widget/pages/menu/watch_menu_item.dart';
import 'package:smart_watch_widget/app_state.dart';
import 'package:smart_watch_widget/utils/navigator.dart';
import 'package:win32/win32.dart';
import 'package:window_manager/window_manager.dart';

import '../alarmClock/alarm_clock_page.dart';
import '../alarmClock/alarm_clock_state.dart';
import '../watchBackground/background_image_item.dart';

class TimersMenu extends StatelessWidget {
  const TimersMenu({super.key});

  @override
  Widget build(BuildContext context) {
    int numberOfActiveAlarms = context
        .watch<AlarmClockState>()
        .alarms
        .where((alarm) => alarm.isActive)
        .length;

    return Layout(
      child: GridView.count(
        padding: EdgeInsets.all(context.read<AppState>().watchSize / 8),
        primary: false,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
        crossAxisCount: 2,
        children: [
          WatchMenuItem(
            title: 'Go Back',
            icon: FluentIcons.back,
            onPressed: () => navigatorPop(context),
          ),
          BackgroundImageItem(
            name: 'Alarm Clock',
            backgroundType: Background.localImage,
            backgroundImagePath:
                context.watch<AppState>().brightness == Brightness.dark
                    ? 'assets/images/watch_dark.png'
                    : 'assets/images/watch_light.png',
            nameTextStyle: FluentTheme.of(context).typography.caption,
            infoBadgeSource: numberOfActiveAlarms > 0
                ? Text(numberOfActiveAlarms.toString())
                : null,
            onPressed: () => Navigator.push(context,
                FluentPageRoute(builder: (context) => const AlarmClockPage())),
          ),
        ],
      ),
    );
  }
}
