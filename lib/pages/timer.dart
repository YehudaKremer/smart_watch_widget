import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:system_theme/system_theme.dart';

import '../app_state.dart';
import 'home/layout.dart';

class Timer extends StatefulWidget {
  const Timer({super.key});

  @override
  State<Timer> createState() => _TimerState();
}

class _TimerState extends State<Timer> {
  final int _duration = 60 * 61;
  final CountDownController _controller = CountDownController();

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 1), () {
      //   _controller.start();
    });
  }

  @override
  Widget build(BuildContext context) {
    var watchSize = context.read<AppState>().watchSize;

    return Stack(
      alignment: Alignment.center,
      children: [
        // CircularCountDownTimer(
        //   duration: _duration,
        //   controller: _controller,
        //   width: MediaQuery.of(context).size.width - 1.5,
        //   height: MediaQuery.of(context).size.height - 1.5,
        //   ringColor:
        //       SystemTheme.accentColor.accent.toAccentColor().withOpacity(0.0),
        //   fillColor: SystemTheme.accentColor.accent.toAccentColor().lightest,
        //   strokeWidth: 3.0,
        //   strokeCap: StrokeCap.round,
        //   textStyle: TextStyle(
        //     fontSize: FluentTheme.of(context).typography.title!.fontSize,
        //   ),
        //   textFormat: _duration <= 60
        //       ? CountdownTextFormat.SS
        //       : _duration <= 60 * 60
        //           ? CountdownTextFormat.MM_SS
        //           : CountdownTextFormat.HH_MM_SS,
        //   isReverse: true,
        //   isReverseAnimation: true,
        //   isTimerTextShown: false,
        //   autoStart: false,
        //   onStart: () {
        //     // Here, do whatever you want
        //     debugPrint('Countdown Started');
        //   },
        //   onComplete: () {
        //     // Here, do whatever you want
        //     debugPrint('Countdown Ended');
        //   },
        //   onChange: (String timeStamp) {
        //     // Here, do whatever you want
        //     debugPrint('Countdown Changed $timeStamp');
        //   },
        // ),
        SizedBox(
          width: 200,
          child: TimePicker(
            popupHeight: watchSize <= 400 ? watchSize - 10 : 390,
            selected: null,
            hourFormat: HourFormat.HH,
            onChanged: (date) => print(DateTime.parse(
                DateFormat('yyyy-MM-dd HH:mm:00.000').format(date))),
          ),
        ),
      ],
    );
  }
}
