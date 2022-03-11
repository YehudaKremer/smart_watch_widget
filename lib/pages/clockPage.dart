import 'package:analog_clock/analog_clock.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:smart_watch_widget/pages/home/layout.dart';
import 'menu/menuPage.dart';

class Clock extends StatelessWidget {
  const Clock({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Layout(
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context, FluentPageRoute(builder: (context) => MenuPage()));
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
      ),
    );
  }
}
