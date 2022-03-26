import 'package:fluent_ui/fluent_ui.dart';
import 'package:new_im_animations/im_animations.dart';
import 'package:provider/provider.dart';
import 'package:smart_watch_widget/pages/home/layout.dart';
import 'package:smart_watch_widget/state/alarmClockState.dart';
import 'package:smart_watch_widget/utils/navigator.dart';

class AlarmScreenPage extends StatelessWidget {
  const AlarmScreenPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Layout(
      child: GestureDetector(
        onTap: () {
          navigatorPop(context);
          context.read<AlarmClockState>().stopAlarm();
        },
        child: Tooltip(
          message: 'Stop Alarm',
          child: ColorSonar(
            contentAreaColor: Colors.transparent,
            contentAreaRadius: 50,
            innerWaveColor:
                FluentTheme.of(context).accentColor.withOpacity(0.3),
            middleWaveColor:
                FluentTheme.of(context).accentColor.withOpacity(0.2),
            outerWaveColor:
                FluentTheme.of(context).accentColor.withOpacity(0.1),
            waveFall: 38,
            duration: Duration(milliseconds: 1200),
            waveMotionEffect: Curves.easeOut,
            child: Container(
              decoration: BoxDecoration(
                color: FluentTheme.of(context).accentColor.darkest,
                borderRadius: BorderRadius.all(Radius.circular(65)),
              ),
              height: 130,
              width: 130,
              child: Icon(
                FluentIcons.alarm_clock,
                size: 70,
                color: FluentTheme.of(context).accentColor.lightest,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
