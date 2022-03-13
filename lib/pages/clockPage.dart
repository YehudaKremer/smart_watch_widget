import 'package:analog_clock/analog_clock.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:provider/provider.dart';
import 'package:smart_watch_widget/state/clockSettingsState.dart';

class ClockPage extends StatelessWidget {
  final Widget? navigateOnTap;
  const ClockPage({Key? key, this.navigateOnTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (navigateOnTap != null) {
          Navigator.push(
              context, FluentPageRoute(builder: (context) => navigateOnTap!));
        }
      },
      child: Consumer<ClockSettingsState>(
        builder: (context, clockSettingsState, child) {
          final state = clockSettingsState.clockSettings;
          return AnalogClock(
            key: Key(state.lastModified.toString()),
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
            showAllNumbers: state.showAllNumbers,
            useMilitaryTime: state.useMilitaryTime,
            showDigitalClock: state.showDigitalClock,
            showNumbers: state.showNumbers,
            showSecondHand: state.showSecondHand,
            showTicks: state.showTicks,
          );
        },
      ),
    );
  }
}
