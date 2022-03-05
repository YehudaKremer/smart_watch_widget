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
        numberColor: FluentTheme.of(context).accentColor.light,
        tickColor: FluentTheme.of(context).accentColor.dark,
        digitalClockColor: FluentTheme.of(context).accentColor,
        hourHandColor: FluentTheme.of(context).accentColor.light,
        minuteHandColor: FluentTheme.of(context).accentColor,
        textScaleFactor: 1.4,
        showAllNumbers: true,
      ),
    );
  }
}
