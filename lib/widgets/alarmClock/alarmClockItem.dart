import 'package:fluent_ui/fluent_ui.dart';

import 'alarmClockFrom.dart';

class AlarmClockItem extends StatelessWidget {
  const AlarmClockItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Button(
      style: ButtonStyle(
        textStyle:
            ButtonState.all(FluentTheme.of(context).typography.bodyLarge),
      ),
      child: Text('11.12.2022, 14:24:00'),
      onPressed: () => Navigator.push(
          context, FluentPageRoute(builder: (context) => AlarmClockFrom())),
    );
  }
}
