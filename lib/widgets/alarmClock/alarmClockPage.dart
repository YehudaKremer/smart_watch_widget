import 'package:fluent_ui/fluent_ui.dart';

import '../layout.dart';
import '../menu/menuItem.dart';
import 'alarmClockItem.dart';

class AlarmClockPage extends StatelessWidget {
  const AlarmClockPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Layout(
      child: ListView(
        padding: const EdgeInsets.all(30),
        children: [
          MenuItem(
            name: 'Back',
            icon: FluentIcons.back,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          Container(height: 10),
          AlarmClockItem(),
          Container(height: 10),
          AlarmClockItem(),
          Container(height: 10),
          AlarmClockItem(),
          Container(height: 10),
          AlarmClockItem(),
          Container(height: 10),
          AlarmClockItem(),
          Container(height: 10),
          AlarmClockItem(),
          Container(height: 10),
          AlarmClockItem(),
          Container(height: 10),
          AlarmClockItem(),
          Container(height: 10),
          AlarmClockItem(),
          Container(height: 10),
          AlarmClockItem(),
        ],
      ),
    );
  }
}
