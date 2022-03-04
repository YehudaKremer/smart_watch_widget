import 'dart:ui';

import 'package:analog_clock/analog_clock.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:provider/provider.dart';
import 'package:system_theme/system_theme.dart';
import '../appState.dart';
import 'menu/menuPage.dart';

class Clock extends StatelessWidget {
  const Clock({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Provider.of<AppState>(context, listen: false).setMenuOpen(true);
        Navigator.push(context, FluentPageRoute(builder: (context) => Menu()));
      },
      child: AnalogClock(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: FluentTheme.of(context).scaffoldBackgroundColor,
        ),
        numberColor: SystemTheme.accentInstance.light,
        tickColor: SystemTheme.accentInstance.dark,
        digitalClockColor: SystemTheme.accentInstance.accent,
        hourHandColor: SystemTheme.accentInstance.light,
        minuteHandColor: SystemTheme.accentInstance.accent,
        textScaleFactor: 1.4,
        showAllNumbers: true,
      ),
    );
  }
}
